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
    
    public partial class MotherBoardConnector
    {
        public int IdMotherBoard { get; set; }
        public int IdConnector { get; set; }
        public byte Quantity { get; set; }
    
        public virtual Connector Connector { get; set; }
        public virtual MotherBoard MotherBoard { get; set; }
    }
}
