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

namespace ConfiguratorPC.Pages
{
    /// <summary>
    /// Логика взаимодействия для ComponentPage.xaml
    /// </summary>
    public partial class ComponentPage : Page
    {
        private readonly Component component;

        private readonly ComponentType componentType;

        public event Action<Component> AddComponent;

        public bool EnableAddComponent
        {
            set
            {
                if (value)
                {
                    AddButton.Visibility = Visibility.Visible;
                }
                else
                {
                    AddButton.Visibility = Visibility.Collapsed;
                }
            }
        }

        public ComponentPage(Component component, ComponentType componentType)
        {
            InitializeComponent();
            this.component = component;
            this.componentType = componentType;
            Init();
        }

        private void Init()
        {
            PictureList.ItemsSource = component.Pictures;
            SelectedImage.Source = component.FirstImage;
            NameTextBlock.Text = $"Характеристики {component.Name}";
            ManufacturerTextBlock.Text = component.Manufacturer.Name;
            PriceTextBlock.Text = $"{component.Price} руб.";
            switch (componentType)
            {
                case ComponentType.Processor:
                    break;
                case ComponentType.MotherBoard:
                    InitMotherBoard();
                    break;
                case ComponentType.Case:
                    break;
                case ComponentType.Videocard:
                    break;
                case ComponentType.Cooler:
                    break;
                case ComponentType.RAM:
                    break;
                case ComponentType.DataStorage:
                    break;
                case ComponentType.PowerSupply:
                    break;
                default:
                    break;
            }
        }

        private void InitMotherBoard()
        {
            CommonInfoTextBlock.Text = $"{component.MotherBoard.Socket.Name}, {component.MotherBoard.Chipset.Name}, " +
                $"{component.MotherBoard.RAMQuantity}x{component.MotherBoard.RAMType.Name}-{component.MotherBoard.MaxRAMFrequency} МГц, {component.MotherBoard.MotherBoardFormFactor.Name}";
            ComponentTypeTextBlock.Text = "Материнская плата";
        }

        private void CloseButton_Click(object sender, RoutedEventArgs e)
        {
            Navigator.Frame.GoBack();
        }

        private void Image_PreviewMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            var pic = (sender as Image).Source;
            if (pic != null)
            {
                SelectedImage.Source = pic;
            }
        }

        private void AddButton_Click(object sender, RoutedEventArgs e)
        {
            AddComponent?.Invoke(component);
            Navigator.Frame.GoBack();
        }
    }
}
