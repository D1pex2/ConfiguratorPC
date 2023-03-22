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
    
    public partial class MotherBoard
    {
        public int IdComponent { get; set; }
        public int IdFormFactor { get; set; }
        public int IdSocket { get; set; }
        public int IdMemoryType { get; set; }
        public Nullable<int> IdMemoryFormFactor { get; set; }
        public byte MemoryQuantity { get; set; }
        public byte PCIEx16Quantity { get; set; }
    
        public virtual Component Component { get; set; }
        public virtual FormFactor FormFactor { get; set; }
        public virtual MemoryFormFactor MemoryFormFactor { get; set; }
        public virtual MemoryType MemoryType { get; set; }
        public virtual Socket Socket { get; set; }
    }
}
