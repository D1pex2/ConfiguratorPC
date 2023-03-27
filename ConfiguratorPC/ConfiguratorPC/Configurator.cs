﻿using ConfiguratorPC.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConfiguratorPC
{
    public class Configurator
    {
        private Processor processor;

        public Processor Processor { get => processor; set => processor = value; }

        private MotherBoard motherBoard;

        public MotherBoard MotherBoard { get => motherBoard; set => motherBoard = value; }

        private Case pcCase;

        public Case Case { get => pcCase; set => pcCase = value; }

        private VideoCard videoCard;

        public VideoCard VideoCard { get => videoCard; set => videoCard = value; }

        private ProcessorCooler processorCooler;

        public ProcessorCooler ProcessorCooler { get => processorCooler; set => processorCooler = value; }

        private RAM ram;

        public RAM RAM { get => ram; set => ram = value; }

        private PowerSupply powerSupply;

        public PowerSupply PowerSupply { get => powerSupply; set => powerSupply = value; }

        private DataStorage dataStorage;

        public DataStorage DataStorage { get => dataStorage; set => dataStorage = value; }

        public List<Processor> CompatibleProcessors
        {
            get
            {
                List<Processor> processors = DAL.Context.Processors.ToList();
                if (MotherBoard != null)
                {
                    processors = processors.Where(p => p.RAMTypes.Any(rt => rt.Id == MotherBoard.IdRAMType) && p.IdSocket == MotherBoard.IdSocket && MotherBoard.Cores.Any(c => c.Id == p.IdCore)).ToList();
                }
                if (ProcessorCooler != null)
                {
                    processors = processors.Where(p => ProcessorCooler.Sockets.Any(s => s.Id == p.IdSocket)).ToList();
                }
                if (RAM != null)
                {
                    processors = processors.Where(p => p.RAMTypes.Any(rt => rt.Id == RAM.IdRAMType) && p.MaxMemorySize >= RAM.MemorySize).ToList();
                }
                return processors;
            }
        }

        public List<MotherBoard> CompatibleMotherBoards
        {
            get
            {
                List<MotherBoard> motherBoards = DAL.Context.MotherBoards.ToList();
                if (Processor != null)
                {
                    motherBoards = motherBoards.Where(m => m.IdSocket == Processor.IdSocket && Processor.RAMTypes.Any(rt => rt.Id == m.IdRAMType) && m.Cores.Any(c => c.Id == Processor.IdCore)).ToList();
                }
                if (Case != null)
                {
                    motherBoards = motherBoards.Where(m => Case.MotherBoardFormFactors.Any(f => f.Id == m.IdMotherBoardFormFactor)).ToList();
                }
                if (VideoCard != null)
                {
                    motherBoards = motherBoards.Where(m => m.PCIEx16Quantity >= 1).ToList();
                }
                if (ProcessorCooler != null)
                {
                    motherBoards = motherBoards.Where(m => ProcessorCooler.Sockets.Any(s => s.Id == m.IdSocket)).ToList();
                }
                if (RAM != null)
                {
                    motherBoards = motherBoards.Where(m => m.IdRAMType == RAM.IdRAMType && m.IdRAMFormFactor == RAM.IdRAMFormFactor && m.MaxRAMSize >= RAM.MemorySize).ToList();
                }
                if (PowerSupply != null)
                {
                    motherBoards = motherBoards.Where(m => m.ProcessorSupplyQuantity <= PowerSupply.ProcessorSupplyQuantity).ToList();
                }
                if (DataStorage != null && DataStorage.SSD != null && DataStorage.SSD.M2SSD != null)
                {
                    motherBoards = motherBoards.Where(m => m.M2Quantity > 0 && m.MotherBoardM2Key.Any(k => k.IdFormFactor == DataStorage.SSD.M2SSD.IdFormFactor && DataStorage.SSD.M2SSD.M2Key.Any(mk => mk.Id == k.IdKey))).ToList();
                }
                return motherBoards;
            }
        }

        public List<Case> CompatibleCases
        {
            get
            {
                List<Case> cases = DAL.Context.Cases.ToList();
                if (MotherBoard != null)
                {
                    cases = cases.Where(c => c.MotherBoardFormFactors.Any(f => f.Id == MotherBoard.IdMotherBoardFormFactor)).ToList();
                }
                if (VideoCard != null)
                {
                    cases = cases.Where(c => c.ExpansionSlotsQuantity >= 1 && c.MaxVideoCardLength >= VideoCard.Length).ToList();
                }
                if (ProcessorCooler != null)
                {
                    if (ProcessorCooler.Cooler != null)
                    {
                        cases = cases.Where(c => c.MaxCoolerHeigth >= ProcessorCooler.Cooler.Heigth).ToList();
                    }
                    if (ProcessorCooler.LiquidCooler != null)
                    {
                        cases = cases.Where(c => c.LiquidCoolerCompatible).ToList();
                    }
                }
                if (PowerSupply != null)
                {
                    cases = cases.Where(c => c.IdPowerSupplyFormFactor == PowerSupply.IdPowerSupplyFormFactor).ToList();
                }
                return cases;
            }
        }

        public List<VideoCard> CompatibleVideoCards
        {
            get
            {
                List<VideoCard> videoCards = DAL.Context.VideoCards.ToList();
                if (MotherBoard != null)
                {
                    videoCards = MotherBoard.PCIEx16Quantity >= 1 ? videoCards : new List<VideoCard>();
                }
                if (Case != null)
                {
                    videoCards = Case.ExpansionSlotsQuantity >= 1 ? videoCards.Where(v => v.Length <= Case.MaxVideoCardLength).ToList() : new List<VideoCard>();
                }
                if (PowerSupply != null)
                {
                    if (PowerSupply.VideoCardSupplyQuantity == 0)
                    {
                        videoCards = videoCards.Where(v => !v.ExtraPowerSupply).ToList();
                    }
                }
                return videoCards;
            }
        }

        public List<ProcessorCooler> CompatibleProcessorCooler
        {
            get
            {
                List<ProcessorCooler> processorCoolers = DAL.Context.ProcessorCoolers.ToList();
                if (Processor != null)
                {
                    processorCoolers = processorCoolers.Where(pc => pc.Sockets.Any(s => s.Id == Processor.IdSocket)).ToList();
                }
                if (MotherBoard != null)
                {
                    processorCoolers = processorCoolers.Where(pc => pc.Sockets.Any(s => s.Id == MotherBoard.IdSocket)).ToList();
                }
                if (Case != null)
                {
                    var temp = processorCoolers.ToList();
                    foreach (var procCooler in temp)
                    {
                        if (procCooler.Cooler != null && procCooler.Cooler.Heigth > Case.MaxCoolerHeigth)
                        {
                            processorCoolers.Remove(procCooler);
                        }
                    }
                    if (!Case.LiquidCoolerCompatible)
                    {
                        temp = processorCoolers.ToList();
                        foreach (var procCooler in temp)
                        {
                            if (procCooler.LiquidCooler != null)
                            {
                                processorCoolers.Remove(procCooler);
                            }
                        }
                    }
                }
                return processorCoolers;
            }
        }

        public List<RAM> CompatibleRAMs
        {
            get
            {
                List<RAM> rams = DAL.Context.RAMs.ToList();
                if (Processor != null)
                {
                    rams = rams.Where(r => Processor.RAMTypes.Any(rt => rt.Id == r.IdRAMType) && r.MemorySize <= Processor.MaxMemorySize).ToList();
                }
                if (MotherBoard != null)
                {
                    rams = rams.Where(r => MotherBoard.IdRAMType == r.IdRAMType && MotherBoard.IdRAMFormFactor == r.IdRAMFormFactor && MotherBoard.MaxRAMSize >= r.MemorySize).ToList();
                }
                return rams;
            }
        }

        public List<PowerSupply> CompatiblePowerSupply
        {
            get
            {
                List<PowerSupply> powerSupplies = DAL.Context.PowerSupplies.ToList();
                if (MotherBoard != null)
                {
                    powerSupplies = powerSupplies.Where(ps => ps.ProcessorSupplyQuantity >= MotherBoard.ProcessorSupplyQuantity).ToList();
                }
                if (Case != null)
                {
                    powerSupplies = powerSupplies.Where(ps => ps.IdPowerSupplyFormFactor == Case.IdPowerSupplyFormFactor).ToList();
                }
                if (VideoCard != null)
                {
                    if (VideoCard.ExtraPowerSupply)
                    {
                        powerSupplies = powerSupplies.Where(ps => ps.VideoCardSupplyQuantity >= 1).ToList();
                    }
                }
                return powerSupplies;
            }
        }

        public List<DataStorage> CompatibleDataStorage
        {
            get
            {
                List<DataStorage> dataStorages = DAL.Context.DataStorages.ToList();
                if (MotherBoard != null)
                {
                    if (MotherBoard.M2Quantity == 0)
                    {
                        var temp = dataStorages.ToList();
                        foreach (var item in temp)
                        {
                            if (item.SSD != null && item.SSD.M2SSD != null)
                            {
                                dataStorages.Remove(item);
                            }
                        }
                    }
                    else
                    {
                        var temp = dataStorages.ToList();
                        foreach (var item in temp)
                        {
                            if (item.SSD != null && item.SSD.M2SSD != null)
                            {
                                if (!MotherBoard.MotherBoardM2Key.Any(k => k.IdFormFactor == item.SSD.M2SSD.IdFormFactor && item.SSD.M2SSD.M2Key.Any(ik => ik.Id == k.IdKey)))
                                {
                                    dataStorages.Remove(item);
                                }
                            }
                        }
                    }
                }
                return dataStorages;
            }
        }
     }
}