using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConfiguratorPC.Data
{
    sealed class DAL
    {
        /// <summary>
        /// Поле контекста данных
        /// </summary>
        private static ConfiguratorPCEntities context;

        /// <summary>
        /// Свойство контекста данных
        /// </summary>
        public static ConfiguratorPCEntities Context
        {
            get
            {
                if (context == null)
                {
                    context = new ConfiguratorPCEntities();
                }
                return context;
            }
        }

        private DAL() { }
    }
}