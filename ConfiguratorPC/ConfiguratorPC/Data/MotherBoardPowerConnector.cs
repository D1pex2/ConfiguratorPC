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
    
    public partial class MotherBoardPowerConnector
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public MotherBoardPowerConnector()
        {
            this.PowerSupplyMotherBoardConnectors = new HashSet<PowerSupplyMotherBoardConnector>();
            this.MotherBoardPowerPlugs = new HashSet<MotherBoardPowerPlug>();
        }
    
        public int Id { get; set; }
        public string Name { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PowerSupplyMotherBoardConnector> PowerSupplyMotherBoardConnectors { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<MotherBoardPowerPlug> MotherBoardPowerPlugs { get; set; }
    }
}
