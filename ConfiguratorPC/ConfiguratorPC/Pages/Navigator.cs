using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;

namespace ConfiguratorPC.Pages
{
    public static class Navigator
    {
        //Свойство ссылки на Frame
        public static Frame Frame { get; set; }

        //Метод возвращения на предыдующую страницу
        public static void GoBack()
        {
            if (Frame != null && Frame.CanGoBack)
            {
                Frame.GoBack();
            }
        }
    }
}