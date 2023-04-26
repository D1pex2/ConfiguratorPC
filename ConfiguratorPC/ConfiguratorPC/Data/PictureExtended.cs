using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConfiguratorPC.Data
{
    public partial class Picture
    {
        public Uri ImageUri
        {
            get
            {
                return new Uri($@"{Environment.CurrentDirectory}\\Resources\\Pictures\\{Path}");
            }
        }
    }
}
