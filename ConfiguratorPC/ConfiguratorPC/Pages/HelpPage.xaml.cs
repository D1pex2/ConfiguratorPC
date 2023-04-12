using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace ConfiguratorPC.Pages
{
    /// <summary>
    /// Логика взаимодействия для HelpPage.xaml
    /// </summary>
    public partial class HelpPage : Page
    {
        public HelpPage()
        {
            InitializeComponent();
        }

        private void CloseButton_Click(object sender, RoutedEventArgs e)
        {
            Navigator.GoBack();
        }

        private void FlowDocumentScrollViewer_PreviewMouseWheel(object sender, MouseWheelEventArgs e)
        {
            if (e.Delta < 0)
            {
                PageScrollViewer.LineDown();
                PageScrollViewer.LineDown();
                PageScrollViewer.LineDown();
            }
            else
            {
                PageScrollViewer.LineUp();
                PageScrollViewer.LineUp();
                PageScrollViewer.LineUp();
            }
        }
    }
}
