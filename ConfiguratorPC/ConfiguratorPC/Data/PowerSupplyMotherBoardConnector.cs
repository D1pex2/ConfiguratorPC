//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class PowerSupplyMotherBoardConnector
    {
        public int IdPowerSupply { get; set; }
        public int IdMotherBoardPowerConnector { get; set; }
        public byte Quantity { get; set; }
    
        public virtual MotherBoardPowerConnector MotherBoardPowerConnector { get; set; }
        public virtual PowerSupply PowerSupply { get; set; }
    }
}
