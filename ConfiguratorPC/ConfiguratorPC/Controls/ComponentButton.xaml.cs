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

        public event EventHandler UpdateCompatibleComponents;

        public event EventHandler ChangeComponent;

        public event EventHandler DeleteComponent;

        public event EventHandler ListOpened;

        public List<Component> CompatibleComponents { get; set; }

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

        public void CollapseList()
        {
            ComponentsList.Visibility = Visibility.Collapsed;
        }

        private void InteractionButton_Click(object sender, RoutedEventArgs e)
        {
            if (ComponentsList.Visibility != Visibility.Collapsed)
            {
                ComponentsList.Visibility = Visibility.Collapsed;
            }
            else if (Component == null)
            {
                ComponentsList.Items.Clear();
                UpdateCompatibleComponents?.Invoke(this, EventArgs.Empty);
                if (CompatibleComponents == null)
                {
                    throw new ArgumentNullException("Подпишитесь на событие UpdateCompatibleComponents и присвойте значение к переменной CompatibleComponents");
                }
                foreach (var item in CompatibleComponents)
                {
                    ComponentsList.Items.Add(item);
                }
                ComponentsList.Visibility = Visibility.Visible;
            }
            else
            {
                DeleteComponent?.Invoke(this, EventArgs.Empty);
                Component = null;
            }
        }

        private void ComponentsList_PreviewMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            var item = ComponentsList.SelectedItem;
            if (item != null)
            {
                Component component = item as Component;
                Component = component;
                ChangeComponent?.Invoke(this, EventArgs.Empty);
                ComponentsList.Visibility = Visibility.Collapsed;
            }
        }

        private void ComponentsList_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            if (ComponentsList.Visibility == Visibility.Visible)
            {
                ListOpened?.Invoke(this, EventArgs.Empty);
            }
        }
    }
}
