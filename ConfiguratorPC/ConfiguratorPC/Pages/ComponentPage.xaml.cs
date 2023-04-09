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

            MotherboardFormFactorTextBlock.Text = component.MotherBoard.MotherBoardFormFactor.Name;
            MotherboardHeigthTextBlock.Text = $"{component.MotherBoard.Height} мм";
            MotherboardWidthTextBlock.Text = $"{component.MotherBoard.Width} мм";

            MotherboardSocketTextBlock.Text = component.MotherBoard.Socket.Name;
            MotherboardChipsetTextBlock.Text = component.MotherBoard.Chipset.Name;
            MotherboardCoresTextBlock.Text = component.MotherBoard.Cores.Select(c => c.Name).Aggregate((first, second) => $"{first}, {second}");

            MotherboardRAMQuantityTextBlock.Text = component.MotherBoard.RAMQuantity.ToString();
            MotherboardRAMFormFactorTextBlock.Text = component.MotherBoard.RAMFormFactor.Name;
            MotherboardRAMTypeTextBlock.Text = component.MotherBoard.RAMType.Name;
            MotherboardMaxRAMFrequencyTextBlock.Text = $"{component.MotherBoard.MaxRAMFrequency} МГц";
            MotherboardMaxRAMSizeTextBlock.Text = $"{component.MotherBoard.MaxRAMSize} Гб";

            MotherboardM2QuantityTextBlock.Text = component.MotherBoard.M2Quantity == 0 ? "нет" : component.MotherBoard.M2Quantity.ToString();
            MotherboardM2SlotsTextBlock.Text = component.MotherBoard.MotherBoardM2Key.Count == 0 ? "нет" : component.MotherBoard.MotherBoardM2Key.Select(k => $"({k.M2Key.Name}) {k.M2FormFactor.Name}").Aggregate((first, second) => $"{first}, {second}");
            MotherboardSATAQuantityTextBlock.Text = component.MotherBoard.SATAQuantity.ToString();

            MotherboardPCIEVersionTextBlock.Text = component.MotherBoard.PCIEController.Name;
            MotherboardPCIEx16QuantityTextBlock.Text = component.MotherBoard.PCIEx16Quantity.ToString();

            MotherboardUsbTextBlock.Text = component.MotherBoard.MotherBoardConnectors.Count == 0 ? "нет" : component.MotherBoard.MotherBoardConnectors.Select(c => $"{c.Connector.Name} x{c.Quantity}").Aggregate((first, second) => $"{first}, {second}");
            MotherboardNetworkSlotsQuantityTextBlock.Text = component.MotherBoard.RJ45Quantity == 0 ? "нет" : component.MotherBoard.RJ45Quantity.ToString();
            MotherboardVideoOutputTextBlock.Text = component.MotherBoard.VideoOutputs.Count == 0 ? "нет" : component.MotherBoard.VideoOutputs.Select(v => v.Name).Aggregate((first, second) => $"{first}, {second}");
            MotherboardAudioSlotsQuantityTextBlock.Text = component.MotherBoard.AnalogAudioOutputQuantity.ToString();

            MotherboardCoolerPowerPlugTextBlock.Text = component.MotherBoard.CoolerPowerSupply;
            MotherboardM2KeyETextBlock.Text = component.MotherBoard.M2KeyE ? "есть" : "нет";
            MotherboardLPTTextBlock.Text = component.MotherBoard.InterfaceLPT ? "есть" : "нет";

            MotherboardAudioSchemeTextBlock.Text = component.MotherBoard.SoundSchema == null ? "нет" : component.MotherBoard.SoundSchema;
            MotherboardAudioChipsetTextBlock.Text = component.MotherBoard.SoundAdapterChipset == null ? "нет" : component.MotherBoard.SoundAdapterChipset.Name;

            MotherboardNetworkSpeedTextBlock.Text = component.MotherBoard.NetworkAdapterSpeed == null ? "нет" : $"{component.MotherBoard.NetworkAdapterSpeed} Гбит/с";
            MotherboardNetworkChipsetTextBlock.Text = component.MotherBoard.NetworkAdapterChipset == null ? "нет" : component.MotherBoard.NetworkAdapterChipset.Name;
            MotherboardWifiAdapterTextBlock.Text = component.MotherBoard.HasWiFi ? "есть" : "нет";
            MotherboardBluetoothTextBlock.Text = component.MotherBoard.HasBluetooth ? "есть" : "нет";

            MotherboardPowerPlugTextBlock.Text = component.MotherBoard.MotherBoardPowerPlug.Name;
            ProcessorPowerPlugTextBlock.Text = component.MotherBoard.ProcessorPowerPlug.Name;
            MotherboardPowerPhaseTextBlock.Text = component.MotherBoard.PowerPhaseQuantity.ToString();

            MotherboardGrid.Visibility = Visibility.Visible;
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
