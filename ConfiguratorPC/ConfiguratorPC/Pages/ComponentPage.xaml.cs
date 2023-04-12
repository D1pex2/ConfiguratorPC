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
            if (component.Pictures.Count <= 1)
            {
                ImageListBorder.Visibility = Visibility.Hidden;
                ImageBorder.CornerRadius = new CornerRadius(10, 10, 10, 10);
            }
            else
            {
                PictureList.ItemsSource = component.Pictures;
            }
            SelectedImage.Source = component.FirstImage;
            NameTextBlock.Text = $"Характеристики {component.Name}";
            ManufacturerTextBlock.Text = component.Manufacturer.Name;
            PriceTextBlock.Text = $"{component.Price} руб.";
            switch (componentType)
            {
                case ComponentType.Processor:
                    InitProcessor();
                    break;
                case ComponentType.MotherBoard:
                    InitMotherBoard();
                    break;
                case ComponentType.Case:
                    CaseInit();
                    break;
                case ComponentType.Videocard:
                    VideocardInit();
                    break;
                case ComponentType.Cooler:
                    break;
                case ComponentType.RAM:
                    InitRAM();
                    break;
                case ComponentType.DataStorage:
                    break;
                case ComponentType.PowerSupply:
                    PowerSupplyInit();
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
            MotherboardStreamRAMQuantityTextBlock.Text = component.MotherBoard.StreamRAMQuantity.ToString();
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

        private void InitProcessor()
        {
            var cacheL3 = component.Processor.CacheL3Size == null ? "" : $"L3 - {component.Processor.CacheL3Size} МБ, ";
            var ramTypes = component.Processor.RAMTypes.Select(r => r.Name).Aggregate((first, second) => $"{first}, {second}");
            var graphics = component.Processor.GraphicsProcessingUnit == null ? "" : $"{component.Processor.GraphicsProcessingUnit.Name}, ";
            CommonInfoTextBlock.Text = $"{component.Processor.Socket.Name}, {component.Processor.CoreQuantity}x{component.Processor.BaseFrequency} Ггц, L2 - {component.Processor.CacheL2Size} МБ, " +
                cacheL3 + $"{component.Processor.StreamRAMQuantity}x{ramTypes} - {component.Processor.MaxRAMFrequency} МГц, " +
                graphics + $"TDP {component.Processor.TDP} Вт";
            ComponentTypeTextBlock.Text = "Процессор";

            ProcessorSocketTextBlock.Text = component.Processor.Socket.Name;
            ProcessorHasCoolerTextBlock.Text = component.Processor.HasCooler ? "есть" : "нет";

            ProcessorCoreQuantityTextBlock.Text = component.Processor.CoreQuantity.ToString();
            ProcessorMaxThreadTextBlock.Text = component.Processor.MaxThreadQuantity.ToString();
            ProcessorProductiveCoreQuantityTextBlock.Text = component.Processor.ProductiveCoreQuantity.ToString();
            ProcessorEnergyCoreQuantityTextBlock.Text = component.Processor.EnergyEfficientCoreQuantity == null ? "нет" : component.Processor.EnergyEfficientCoreQuantity.ToString();
            ProcessorCacheL2TextBlock.Text = $"{component.Processor.CacheL2Size} МБ";
            ProcessorCacheL3TextBlock.Text = component.Processor.CacheL3Size == null ? "нет" : $"{component.Processor.CacheL3Size} МБ";
            ProcessorTechProcessTextBlock.Text = $"{component.Processor.TechProcess} нм";
            ProcessorCoreTextBlock.Text = component.Processor.Core.Name;

            ProcessorBaseFrequencyTextBlock.Text = $"{component.Processor.BaseFrequency} Ггц";
            ProcessorMaxFrequencyTextBlock.Text = component.Processor.MaxFrequency == null ? "нет" : $"{component.Processor.MaxFrequency} Ггц";
            ProcessorBaseEnergyFrequencyTextBlock.Text = component.Processor.BaseFrequencyEnergyEfficientCore == null ? "нет" : $"{component.Processor.BaseFrequencyEnergyEfficientCore} Ггц";
            ProcessorMaxEnergyFrequencyTextBlock.Text = component.Processor.MaxFrequencyEnergyEfficientCore == null ? "нет" : $"{component.Processor.MaxFrequencyEnergyEfficientCore} Ггц";
            ProcessorFreeMultiplierTextBlock.Text = component.Processor.FreeMultiplier ? "есть" : "нет";

            ProcessorRAMTypeTextBlock.Text = ramTypes;
            ProcessorMaxRAMSizeTextBlock.Text = $"{component.Processor.MaxMemorySize} ГБ";
            ProcessorRAMStreamQuantityTextBlock.Text = component.Processor.StreamRAMQuantity.ToString();
            ProcessorMaxRAMFrequencyTextBlock.Text = $"{component.Processor.MaxRAMFrequency} МГц";
            ProcessorHasECCTextBlock.Text = component.Processor.HasECC ? "есть" : "нет";

            ProcessorTDPTextBlock.Text = $"{component.Processor.TDP} Вт";
            ProcessorMaxTempTextBlock.Text = $"{component.Processor.MaxTemperature} °C";

            ProcessorGraphicsTextBlock.Text = component.Processor.GraphicsProcessingUnit == null ? "нет" : component.Processor.GraphicsProcessingUnit.Name;

            ProcessorPCIControllerTextBlock.Text = component.Processor.PCIEController.Name;
            ProcessorPCIQuantityTextBlock.Text = component.Processor.PCIEQuantity.ToString();

            ProcessorGrid.Visibility = Visibility.Visible;
        }

        private void InitRAM()
        {
            CommonInfoTextBlock.Text = $"{component.RAM.RAMType.Name}, {component.RAM.MemorySize} ГБ, {component.RAM.Frequency} МГц," +
                $" {component.RAM.CASLatency}-{component.RAM.RAStoCAASDelay}-{component.RAM.RowPrechargeDelay}-{component.RAM.ActivateToPreChargeDelay}";
            ComponentTypeTextBlock.Text = "Оперативная память";

            RAMTypeTextBlock.Text = component.RAM.RAMType.Name;
            RAMFormFactorTextBlock.Text = component.RAM.RAMFormFactor.Name;
            RAMSizeTextBlock.Text = $"{component.RAM.MemorySize} ГБ";
            RAMFrequencyTextBlock.Text = $"{component.RAM.Frequency} МГц";
            RAMECCTextBlock.Text = component.RAM.HasECC ? "есть" : "нет";
            RAMREGTextBlock.Text = component.RAM.HasRegistr ? "есть" : "нет";

            RAMCLTextBlock.Text = component.RAM.CASLatency.ToString();
            RAMtRCDTextBlock.Text = component.RAM.RAStoCAASDelay.ToString();
            RAMtRPTextBlock.Text = component.RAM.RowPrechargeDelay.ToString();
            RAMtRASTextBlock.Text = component.RAM.ActivateToPreChargeDelay.ToString();

            RAMRadiatorTextBlock.Text = component.RAM.HasRadiator ? "есть" : "нет";
            RAMVoltageTextBlock.Text = $"{component.RAM.Voltage} В";

            RAMGrid.Visibility = Visibility.Visible;
        }

        private void PowerSupplyInit()
        {
            var motherBoardConnectors = component.PowerSupply.PowerSupplyMotherBoardConnectors.Count == 0 ? "" : $"{component.PowerSupply.PowerSupplyMotherBoardConnectors.Select(c => c.MotherBoardPowerConnector.Name).Aggregate((first, second) => $"{first}, {second}")}, ";
            var procConnectors = component.PowerSupply.PowerSupplyProcessorPowerConnectors.Count == 0 ? "" : $"{component.PowerSupply.PowerSupplyProcessorPowerConnectors.Select(c => c.ProcessorPowerConnector.Name).Aggregate((first, second) => $"{first}, {second}")} CPU, ";
            var sataQuantity = component.PowerSupply.SATAConnectorQuantity == 0 ? "" : $"{component.PowerSupply.SATAConnectorQuantity} SATA, ";
            var videoConnectors = component.PowerSupply.PowerSupplyVideoPowerConnectors.Count == 0 ? "" : $"{component.PowerSupply.PowerSupplyVideoPowerConnectors.Select(c => c.VideoPowerConnector.Name).Aggregate((first, second) => $"{first}, {second}")} PCI-E, ";
            CommonInfoTextBlock.Text = motherBoardConnectors + procConnectors + sataQuantity + videoConnectors + $"{component.PowerSupply.Power} Вт";
            ComponentTypeTextBlock.Text = "Блок питания";

            PowerSupplyPowerTextBlock.Text = $"{component.PowerSupply.Power} Вт";
            PowerSupplyFormFactorTextBlock.Text = component.PowerSupply.PowerSupplyFormFactor.Name;
            PowerSupplyColorTextBlock.Text = component.PowerSupply.Color.Name;
            PowerSupplyCoolerSystemTextBlock.Text = component.PowerSupply.CoolerSystem;

            PowerSupplyMainConnectorTextBlock.Text = component.PowerSupply.PowerSupplyMotherBoardConnectors.Count == 0 ? "нет" : component.PowerSupply.PowerSupplyMotherBoardConnectors.Select(c => $"{c.MotherBoardPowerConnector.Name} x{c.Quantity}").Aggregate((first, second) => $"{first}, {second}");
            PowerSupplyProcConnectorTextBlock.Text = component.PowerSupply.PowerSupplyProcessorPowerConnectors.Count == 0 ? "нет" : component.PowerSupply.PowerSupplyProcessorPowerConnectors.Select(c => $"{c.ProcessorPowerConnector.Name} x{c.Quantity}").Aggregate((first, second) => $"{first}, {second}");
            PowerSupplyVideoConnectorTextBlock.Text = component.PowerSupply.PowerSupplyVideoPowerConnectors.Count == 0 ? "нет" : component.PowerSupply.PowerSupplyVideoPowerConnectors.Select(c => $"{c.VideoPowerConnector.Name} x{c.Quantity}").Aggregate((first, second) => $"{first}, {second}");

            PowerSupplyLengthTextBlock.Text = $"{component.PowerSupply.Length} мм";
            PowerSupplyWidthTextBlock.Text = $"{component.PowerSupply.Width} мм";
            PowerSupplyHeigthTextBlock.Text = $"{component.PowerSupply.Heigth} мм";

            PowerSupplyGrid.Visibility = Visibility.Visible;
        }

        private void CaseInit()
        {
            CommonInfoTextBlock.Text = component.Case.MotherBoardFormFactors.Select(m => m.Name).Aggregate((first, second) => $"{first}, {second}");
            ComponentTypeTextBlock.Text = "Корпус";

            CaseTypeTextBlock.Text = component.Case.CaseSize.Name;
            CaseMotherboardOrientationTextBlock.Text = component.Case.MotherBoardOrientation;
            CaseLengthTextBlock.Text = $"{component.Case.Length} мм";
            CaseWidthTextBlock.Text = $"{component.Case.Width} мм";
            CaseHeigthTextBlock.Text = $"{component.Case.Height} мм";

            CaseColorTextBlock.Text = component.Case.Color.Name;
            CaseMaterialTextBlock.Text = component.Case.Materials.Count == 0 ? "нет" : component.Case.Materials.Select(m => m.Name).Aggregate((first, second) => $"{first}, {second}");
            CaseWindowTextBlock.Text = component.Case.HasWindow ? "есть" : "нет";
            CaseFrontPanelMaterialTextBlock.Text = component.Case.FrontPanelMaterials.Count == 0 ? "нет" : component.Case.FrontPanelMaterials.Select(m => m.Name).Aggregate((first, second) => $"{first}, {second}");
            CaseLigthingTextBlock.Text = component.Case.LightingType == null ? "нет" : component.Case.LightingType.Name;

            CaseMotherboardFormFactorTextBlock.Text = component.Case.MotherBoardFormFactors.Count == 0 ? "нет" : component.Case.MotherBoardFormFactors.Select(m => m.Name).Aggregate((first, second) => $"{first}, {second}"); ;
            CasePowerSupplyFormFactorTextBlock.Text = component.Case.PowerSupplyFormFactor.Name;
            CasePowerSupplyOrientationTextBlock.Text = component.Case.PowerSupplyOrientation;

            CaseExpansionSlotsTextBlock.Text = component.Case.ExpansionSlotsQuantity.ToString();
            CaseMaxCoolerHeigthTextBlock.Text = $"{component.Case.MaxCoolerHeigth} мм";
            CaseMaxVideocardLengthTextBlock.Text = $"{component.Case.MaxVideoCardLength} мм";
            CaseLiquidCoolerComptibleTextBlock.Text = component.Case.LiquidCoolerCompatible ? "есть" : "нет";
            Case25QuantityTextBlock.Text = component.Case.Storage25Quantity == 0 ? "нет" : component.Case.Storage25Quantity.ToString();
            Case35QuantityTextBlock.Text = component.Case.Storage35Quantity == 0 ? "нет" : component.Case.Storage35Quantity.ToString();

            CaseConnectorsTextBlock.Text = component.Case.CaseConnectors.Count == 0 ? "нет" : component.Case.CaseConnectors.Select(c => $"{c.Connector.Name} x{c.Quantity}").Aggregate((first, second) => $"{first}, {second}");
            CaseCardReaderTextBlock.Text = component.Case.HasCardReader ? "есть" : "нет";

            CaseGrid.Visibility = Visibility.Visible;
        }

        private void VideocardInit()
        {
            var videoOutputs = component.VideoCard.VideoOutputs.Count == 0 ? "" : $"{component.VideoCard.VideoOutputs.Select(v => v.Name).Aggregate((first, second) => $"{first}, {second}")}, ";
            CommonInfoTextBlock.Text = $"{component.VideoCard.PCIEController.Name}, {component.VideoCard.VideoMemorySize} ГБ {component.VideoCard.VideoMemoryType.Name}, {component.VideoCard.MemoryBusBitRate} бит, " +
                videoOutputs + $"{component.VideoCard.VideoChipFrequency} МГц";
            ComponentTypeTextBlock.Text = "Видеокарта";

            VideocardGraphicProcessorTextBlock.Text = component.VideoCard.GraphicProcessor.Name;
            VideocardMicroarchitectureTextBlock.Text = component.VideoCard.Microarchitecture.Name;
            VideocardTechProcessTextBlock.Text = $"{component.VideoCard.TechProcess} нм";

            VideocardMemorySizeTextBlock.Text = $"{component.VideoCard.VideoMemorySize} ГБ";
            VideocardMemoryTypeTextBlock.Text = component.VideoCard.VideoMemoryType.Name;
            VideocardMemoryFrequencyTextBlock.Text = $"{component.VideoCard.EffectiveMemoryFrequency} МГц";
            VideocardBitRateTextBlock.Text = $"{component.VideoCard.MemoryBusBitRate} бит";
            VideocardBandwidthTextBlock.Text = $"{component.VideoCard.MaxMemoryBandwidth} Гбайт/с";

            VideocardFrequencyTextBlock.Text = $"{component.VideoCard.VideoChipFrequency} МГц";
            VideocardALUTextBlock.Text = component.VideoCard.ALUQuantity.ToString();
            VideocardTextureBlocksTextBlock.Text = component.VideoCard.TextureBlockQuantity.ToString();
            VideocardRasterizationBlocksTextBlock.Text = component.VideoCard.RasterizationBlockQuantity.ToString();
            VideocardRayTracingTextBlock.Text = component.VideoCard.RayTracingSupport ? "есть" : "нет";

            VideocardOutputsTextBlock.Text = component.VideoCard.VideoOutputs.Count == 0 ? "нет" : component.VideoCard.VideoOutputs.Select(o => o.Name).Aggregate((first, second) => $"{first}, {second}");
            VideocardMaxMonitorsTextBlock.Text = component.VideoCard.MaxMonitorQuantity.ToString();

            VideocardPCIVersionTextBlock.Text = component.VideoCard.PCIEController.Name;
            VideocardPowerPlugsTextBlock.Text = component.VideoCard.VideoCardPowerPlug == null ? "нет" : component.VideoCard.VideoCardPowerPlug.Name;
            VideocardPowerTextBlock.Text = $"{component.VideoCard.PowerSupply} Вт";

            VideocardColerTypeTextBlock.Text = component.VideoCard.CoolerType;
            VideocardFansTextBlock.Text = component.VideoCard.FanQuantity != null && component.VideoCard.FanType != null ? $"{component.VideoCard.FanQuantity} {component.VideoCard.FanType}" : "нет";

            VideocardExpansionSlotsTextBlock.Text = component.VideoCard.ExpansionSlotSize.ToString();
            VideocardLengthTextBlock.Text = $"{component.VideoCard.Length} мм";
            VideocardThicknessTextBlock.Text = $"{component.VideoCard.Thickness} мм";
            VideocardMassTextBlock.Text = $"{component.VideoCard.Mass} г";

            VideocardGrid.Visibility = Visibility.Visible;
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
