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
        //Событие изменения свойства материнской платы
        public event EventHandler MotherBoardChanged;

        //Событие изменения свойства процессора
        public event EventHandler ProcessorChanged;

        //Событие изменения свойства оперативной памяти
        public event EventHandler RAMChanged;

        public decimal CommonPrice
        {
            get
            {
                decimal commonPrice = 0;
                if (Processor != null)
                    commonPrice += Processor.Component.Price;
                if (MotherBoard != null)
                    commonPrice += MotherBoard.Component.Price;
                if (Case != null)
                    commonPrice += Case.Component.Price;
                if (VideoCard != null)
                    commonPrice += VideoCard.Component.Price;
                if (RAM != null)
                    commonPrice += RAM.Component.Price * RAMQuantity;
                if (ProcessorCooler != null)
                    commonPrice += ProcessorCooler.Component.Price;
                if (PowerSupply != null)
                    commonPrice += PowerSupply.Component.Price;
                foreach (var dataStorage in DataStorages)
                {
                    commonPrice += dataStorage.Component.Price;
                }
                return commonPrice;
            }
        }

        public List<Component> Components
        {
            get
            {
                List<Component> components = new List<Component>();
                if (Processor != null)
                    components.Add(Processor.Component);
                if (MotherBoard != null)
                    components.Add(MotherBoard.Component);
                if (Case != null)
                    components.Add(Case.Component);
                if (VideoCard != null)
                    components.Add(VideoCard.Component);
                if (RAM != null)
                    components.Add(RAM.Component);
                if (ProcessorCooler != null)
                    components.Add(ProcessorCooler.Component);
                if (PowerSupply != null)
                    components.Add(PowerSupply.Component);
                foreach (var dataStorage in DataStorages)
                {
                    components.Add(dataStorage.Component);
                }
                return components;
            }
        }

        private Processor processor;

        //Свойство для доступа к полю процессора
        public Processor Processor 
        { 
            get => processor;
            set
            {
                processor = value;
                ProcessorChanged?.Invoke(this, EventArgs.Empty);
            }
        }

        private MotherBoard motherBoard;

        //Свойство для доступа к полю материнской платы
        public MotherBoard MotherBoard 
        { 
            get => motherBoard;
            set
            {
                motherBoard = value;
                MotherBoardChanged?.Invoke(this, EventArgs.Empty);
            }
        }

        private Case pcCase;

        public Case Case { get => pcCase; set => pcCase = value; }

        private VideoCard videoCard;

        public VideoCard VideoCard { get => videoCard; set => videoCard = value; }

        private ProcessorCooler processorCooler;

        public ProcessorCooler ProcessorCooler { get => processorCooler; set => processorCooler = value; }

        private RAM ram;

        public RAM RAM 
        { 
            get => ram;
            set
            {
                ram = value;
                RAMChanged?.Invoke(this, EventArgs.Empty);
            }
        }

        public int MaxRAMQuantity
        {
            get
            {
                if (Processor != null && MotherBoard != null && RAM != null)
                {
                    var processorRAMQuantity = Processor.MaxMemorySize / RAM.MemorySize;
                    var motherBoardRAMQuantity = MotherBoard.MaxRAMSize / RAM.MemorySize;
                    var lessQuantity = processorRAMQuantity < motherBoardRAMQuantity ? processorRAMQuantity : motherBoardRAMQuantity;
                    if (lessQuantity < MotherBoard.RAMQuantity)
                    {
                        return lessQuantity;
                    }
                        return MotherBoard.RAMQuantity;
                }
                return 1;
            }
        }

        public int RAMQuantity { get; set; } = 1;

        public int CommonRAMSize
        {
            get
            {
                if (RAM != null)
                {
                    return RAM.MemorySize * RAMQuantity;
                }
                return 0;
            }
        }
        private PowerSupply powerSupply;

        public PowerSupply PowerSupply { get => powerSupply; set => powerSupply = value; }

        private List<DataStorage> dataStorages = new List<DataStorage>();

        public List<DataStorage> DataStorages { get => dataStorages; set => dataStorages = value; }

        public int DataStorageM2Quantity { get => DataStorages.Where(d => d.SSD != null && d.SSD.M2SSD != null).Count(); }

        public int DataStorage25Quantity { get => DataStorages.Where(d => (d.SSD != null && d.SSD.M2SSD == null) || (d.HDD != null && d.HDD.FormFactor == "2.5\"")).Count(); }

        public int DataStorage35Quantity { get => DataStorages.Where(d => d.HDD != null && d.HDD.FormFactor == "3.5\"").Count(); }

        public List<Processor> CompatibleProcessors
        {
            get
            {
                List<Processor> processors = DAL.Context.Processors.AsNoTracking().ToList();
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
                List<MotherBoard> motherBoards = DAL.Context.MotherBoards.AsNoTracking().ToList();
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
                    motherBoards = motherBoards.Where(m => m.MotherBoardPowerPlug.MotherBoardPowerConnectors.Any(c => PowerSupply.PowerSupplyMotherBoardConnectors.Any(mc => mc.IdMotherBoardPowerConnector == c.Id)))
                        .Where(m => m.ProcessorPowerPlug.ProcessorPowerConnectors.Any(c => PowerSupply.PowerSupplyProcessorPowerConnectors.Any(pc => pc.IdProcessorPowerConnector == c.Id))).ToList();
                }
                foreach (var dataStorage in DataStorages)
                {
                    if (dataStorage.SSD != null && dataStorage.SSD.M2SSD != null)
                    {
                        motherBoards = motherBoards.Where(m => m.M2Quantity > 0 && m.MotherBoardM2Key.Any(k => k.IdFormFactor == dataStorage.SSD.M2SSD.IdFormFactor && dataStorage.SSD.M2SSD.M2Key.Any(mk => mk.Id == k.IdKey))).ToList();
                    }
                }
                motherBoards = motherBoards.Where(m => m.M2Quantity >= DataStorageM2Quantity && m.SATAQuantity >= DataStorage25Quantity + DataStorage35Quantity).ToList();
                return motherBoards;
            }
        }

        public List<Case> CompatibleCases
        {
            get
            {
                List<Case> cases = DAL.Context.Cases.AsNoTracking().ToList();
                if (MotherBoard != null)
                {
                    cases = cases.Where(c => c.MotherBoardFormFactors.Any(f => f.Id == MotherBoard.IdMotherBoardFormFactor)).ToList();
                }
                if (VideoCard != null)
                {
                    cases = cases.Where(c => c.ExpansionSlotsQuantity >= VideoCard.ExpansionSlotSize && c.MaxVideoCardLength >= VideoCard.Length).ToList();
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
                cases = cases.Where(c => c.Storage25Quantity >= DataStorage25Quantity && c.Storage35Quantity >= DataStorage35Quantity).ToList();
                return cases;
            }
        }

        public List<VideoCard> CompatibleVideoCards
        {
            get
            {
                List<VideoCard> videoCards = DAL.Context.VideoCards.AsNoTracking().ToList();
                if (MotherBoard != null)
                {
                    videoCards = MotherBoard.PCIEx16Quantity >= 1 ? videoCards : new List<VideoCard>();
                }
                if (Case != null)
                {
                    videoCards = videoCards.Where(v => v.Length <= Case.MaxVideoCardLength && v.ExpansionSlotSize <= Case.ExpansionSlotsQuantity).ToList();
                }
                if (PowerSupply != null)
                {
                    videoCards = videoCards.Where(v => v.VideoCardPowerPlug == null || v.VideoCardPowerPlug.VideoPowerConnectors.Any(c => PowerSupply.PowerSupplyVideoPowerConnectors.Any(vc => vc.IdVideoPowerConnector == c.Id))).ToList();
                }
                return videoCards;
            }
        }

        public List<ProcessorCooler> CompatibleProcessorCooler
        {
            get
            {
                List<ProcessorCooler> processorCoolers = DAL.Context.ProcessorCoolers.AsNoTracking().ToList();
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

        //Список соответствующей оперативной памяти
        public List<RAM> CompatibleRAMs
        {
            get
            {
                List<RAM> rams = DAL.Context.RAMs.AsNoTracking().ToList();
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
                List<PowerSupply> powerSupplies = DAL.Context.PowerSupplies.AsNoTracking().ToList();
                if (MotherBoard != null)
                {
                    powerSupplies = powerSupplies.Where(ps => ps.PowerSupplyProcessorPowerConnectors.Any(c => MotherBoard.ProcessorPowerPlug.ProcessorPowerConnectors.Any(pc => pc.Id == c.IdProcessorPowerConnector)))
                        .Where(ps => ps.PowerSupplyMotherBoardConnectors.Any(c => MotherBoard.MotherBoardPowerPlug.MotherBoardPowerConnectors.Any(mc => mc.Id == c.IdMotherBoardPowerConnector))).ToList();
                }
                if (Case != null)
                {
                    powerSupplies = powerSupplies.Where(ps => ps.IdPowerSupplyFormFactor == Case.IdPowerSupplyFormFactor).ToList();
                }
                if (VideoCard != null)
                {
                    if (VideoCard.VideoCardPowerPlug != null)
                    {
                        powerSupplies = powerSupplies.Where(ps => ps.PowerSupplyVideoPowerConnectors.Any(c => VideoCard.VideoCardPowerPlug.VideoPowerConnectors.Any(vc => vc.Id == c.IdVideoPowerConnector))).ToList();
                    }
                }
                powerSupplies = powerSupplies.Where(ps => ps.SATAConnectorQuantity >= DataStorage25Quantity + DataStorage35Quantity).ToList();
                return powerSupplies;
            }
        }

        public List<DataStorage> CompatibleDataStorage
        {
            get
            {
                List<DataStorage> dataStorages = DAL.Context.DataStorages.AsNoTracking().ToList();
                if (MotherBoard != null)
                {
                    if (MotherBoard.SATAQuantity <= DataStorage25Quantity + DataStorage35Quantity)
                    {
                        dataStorages = dataStorages.Where(d => d.SSD != null && d.SSD.M2SSD != null).ToList();
                    }
                    if (MotherBoard.M2Quantity <= DataStorageM2Quantity)
                    {
                        dataStorages = dataStorages.Where(d => d.HDD != null || (d.SSD != null && d.SSD.M2SSD == null)).ToList();
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
                if (PowerSupply != null && PowerSupply.SATAConnectorQuantity <= DataStorage25Quantity + DataStorage35Quantity)
                {
                    dataStorages = dataStorages.Where(d => d.SSD != null && d.SSD.M2SSD != null).ToList();
                }
                if (Case != null)
                {
                    if (Case.Storage25Quantity <= DataStorage25Quantity)
                    {
                        dataStorages = dataStorages.Where(d => (d.SSD != null && d.SSD.M2SSD != null) || (d.HDD != null && d.HDD.FormFactor == "3.5\"")).ToList();
                    }
                    if (Case.Storage35Quantity <= DataStorage35Quantity)
                    {
                        dataStorages = dataStorages.Where(d => d.SSD != null || (d.HDD != null && d.HDD.FormFactor == "2.5\"")).ToList();
                    }
                }
                return dataStorages;
            }
        }
    }
}