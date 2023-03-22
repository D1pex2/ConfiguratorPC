using ConfiguratorPC.Data;
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

namespace ConfiguratorPC.Controls
{
    /// <summary>
    /// Логика взаимодействия для ComponentButton.xaml
    /// </summary>
    public partial class ComponentButton : UserControl
    {
        public string ComponentType { get => TypeTextBlock.Text; set => TypeTextBlock.Text = value; }

        public event EventHandler ChangeComponent;

        public event EventHandler DeleteComponent;

        private Component component;

        public Component Component
        {
            get => component;
            set
            {
                component = value;
                if (component == null)
                {
                    InteractionButton.Content = "Добавить";
                    NameTextBlock.Text = "";
                    PriceTextBlock.Text = "";
                }
                else
                {
                    InteractionButton.Content = "Убрать";
                    NameTextBlock.Text = component.Name;
                    PriceTextBlock.Text = $"{component.Price} руб.";
                }
            }
        }

        public ComponentButton()
        {
            InitializeComponent();
        }

        private void InteractionButton_Click(object sender, RoutedEventArgs e)
        {
            if (Component == null)
            {
                ChangeComponent?.Invoke(this, EventArgs.Empty);
            }
            else
            {
                DeleteComponent?.Invoke(this, EventArgs.Empty);
                Component = null;
            }
        }
    }
}
