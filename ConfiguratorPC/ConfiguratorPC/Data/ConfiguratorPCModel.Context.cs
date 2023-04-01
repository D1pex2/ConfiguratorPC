﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ConfiguratorPC.Data
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class ConfiguratorPCEntities : DbContext
    {
        public ConfiguratorPCEntities()
            : base("name=ConfiguratorPCEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Case> Cases { get; set; }
        public virtual DbSet<CaseConnector> CaseConnectors { get; set; }
        public virtual DbSet<CaseSize> CaseSizes { get; set; }
        public virtual DbSet<Color> Colors { get; set; }
        public virtual DbSet<Component> Components { get; set; }
        public virtual DbSet<Connector> Connectors { get; set; }
        public virtual DbSet<Cooler> Coolers { get; set; }
        public virtual DbSet<Core> Cores { get; set; }
        public virtual DbSet<DataStorage> DataStorages { get; set; }
        public virtual DbSet<GraphicsProcessingUnit> GraphicsProcessingUnits { get; set; }
        public virtual DbSet<HDD> HDDs { get; set; }
        public virtual DbSet<LightingType> LightingTypes { get; set; }
        public virtual DbSet<LiquidCooler> LiquidCoolers { get; set; }
        public virtual DbSet<M2FormFactor> M2FormFactor { get; set; }
        public virtual DbSet<M2Key> M2Key { get; set; }
        public virtual DbSet<M2SSD> M2SSD { get; set; }
        public virtual DbSet<Manufacturer> Manufacturers { get; set; }
        public virtual DbSet<Material> Materials { get; set; }
        public virtual DbSet<MotherBoard> MotherBoards { get; set; }
        public virtual DbSet<MotherBoardFormFactor> MotherBoardFormFactors { get; set; }
        public virtual DbSet<MotherBoardM2Key> MotherBoardM2Key { get; set; }
        public virtual DbSet<PCIEController> PCIEControllers { get; set; }
        public virtual DbSet<PowerSupply> PowerSupplies { get; set; }
        public virtual DbSet<PowerSupplyFormFactor> PowerSupplyFormFactors { get; set; }
        public virtual DbSet<Processor> Processors { get; set; }
        public virtual DbSet<ProcessorCooler> ProcessorCoolers { get; set; }
        public virtual DbSet<RAM> RAMs { get; set; }
        public virtual DbSet<RAMFormFactor> RAMFormFactors { get; set; }
        public virtual DbSet<RAMType> RAMTypes { get; set; }
        public virtual DbSet<Socket> Sockets { get; set; }
        public virtual DbSet<SSD> SSDs { get; set; }
        public virtual DbSet<VideoCard> VideoCards { get; set; }
    }
}
