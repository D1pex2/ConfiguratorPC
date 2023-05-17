using ConfiguratorPC.Data;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core;
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
            try
            {
                if (component.ExistsPicture.Count <= 1)
                {
                    ImageListBorder.Visibility = Visibility.Hidden;
                    ImageBorder.CornerRadius = new CornerRadius(10, 10, 10, 10);
                }
                else
                {
                    PictureList.ItemsSource = component.ExistsPicture;
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
                        ProcessorCoolerInit();
                        break;
                    case ComponentType.RAM:
                        InitRAM();
                        break;
                    case ComponentType.DataStorage:
                        DataStorageInit();
                        break;
                    case ComponentType.PowerSupply:
                        PowerSupplyInit();
                        break;
                    default:
                        break;
                }
            }
            catch (Exception ex)
            {
                FeedBack.ShowError(ex);
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
            ProcessorGraphicsFrequencyTextBlock.Text = component.Processor.GraphicsProcessingUnit == null ? "нет" : $"{component.Processor.GraphicsProcessingUnit.MaxFrequency} Мгц";
            ExecutiveBlocksTextBlock.Text = component.Processor.GraphicsProcessingUnit == null ? "нет" : component.Processor.GraphicsProcessingUnit.ExecutiveUnitQuantity.ToString();
            ShadingUnitsTextBlock.Text = component.Processor.GraphicsProcessingUnit == null ? "нет" : component.Processor.GraphicsProcessingUnit.ShadingUnitsQuantity.ToString();

            ProcessorPCIControllerTextBlock.Text = component.Processor.PCIEController == null ? "нет" : component.Processor.PCIEController.Name;
            ProcessorPCIQuantityTextBlock.Text = component.Processor.PCIEQuantity == null ? "нет" : component.Processor.PCIEQuantity.ToString();

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
            PowerSupplySATAQuantityTextBlock.Text = component.PowerSupply.SATAConnectorQuantity == 0 ? "нет" : component.PowerSupply.SATAConnectorQuantity.ToString();

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

        private void ProcessorCoolerInit()
        {
            var radiatorMaterial = component.ProcessorCooler.Material.Name;
            var fanPin = component.ProcessorCooler.FanConnector;
            var sokets = component.ProcessorCooler.Sockets.Select(s => s.Name).Aggregate((first, second) => $"{first}, {second}");

            if (component.ProcessorCooler.Cooler != null)
            {
                ComponentTypeTextBlock.Text = "Кулер для процессора";
                CommonInfoTextBlock.Text = $"Основание - {component.ProcessorCooler.Cooler.Material.Name}, радиатор - {radiatorMaterial}, {fanPin}, {component.ProcessorCooler.Cooler.DissipationPower} Вт";

                CoolerSocketTextBlock.Text = sokets;
                CoolerPowerTextBlock.Text = $"{component.ProcessorCooler.Cooler.DissipationPower} Вт";
                CoolerConstructionTypeTextBlock.Text = component.ProcessorCooler.Cooler.ConstructionType;

                CoolerBaseMaterialTextBlock.Text = component.ProcessorCooler.Cooler.Material.Name;
                CoolerRadiatorMaterialTextBlock.Text = radiatorMaterial;
                CoolerPipeQuantityTextBlock.Text = component.ProcessorCooler.Cooler.TermPipeQuantity == null ? "нет" : component.ProcessorCooler.Cooler.TermPipeQuantity.ToString();
                CoolerPipeDiameterTextBlock.Text = component.ProcessorCooler.Cooler.TermPipeDiameter == null ? "нет" : $"{component.ProcessorCooler.Cooler.TermPipeDiameter} мм";
                CoolerNickelTextBlock.Text = component.ProcessorCooler.Cooler.NickelCoating == null ? "нет" : component.ProcessorCooler.Cooler.NickelCoating;

                CoolerGrid.Visibility = Visibility.Visible;

                CoolerHeigthTextBlock.Text = $"{component.ProcessorCooler.Cooler.Heigth} мм";
                CoolerWidthTextBlock.Text = $"{component.ProcessorCooler.Cooler.Width} мм";
                CoolerLengthTextBlock.Text = $"{component.ProcessorCooler.Cooler.Length} мм";

                CoolerSizeGrid.Visibility = Visibility.Visible;
            }
            if (component.ProcessorCooler.LiquidCooler != null)
            {
                ComponentTypeTextBlock.Text = "Система жидкостного охлаждения";
                CommonInfoTextBlock.Text = $"Водоблок - {component.ProcessorCooler.LiquidCooler.Material.Name}, радиатор - {radiatorMaterial}, {fanPin}, {component.ProcessorCooler.LiquidCooler.RadiatorMountingSize}";

                LiquidServicedTextBlock.Text = component.ProcessorCooler.LiquidCooler.Serviced ? "да" : "нет";
                LiquidCoolerSocketTextBlock.Text = sokets;
                LiquidBlockMaterialTextBlock.Text = component.ProcessorCooler.LiquidCooler.Material.Name;
                LiquidBlockSizeTextBlock.Text = component.ProcessorCooler.LiquidCooler.WaterblockSize;

                LiquidRadiatorMaterialTextBlock.Text = radiatorMaterial;
                LiquidRadiatorLengthTextBlock.Text = $"{component.ProcessorCooler.LiquidCooler.RadiatorLength} мм";
                LiquidRadiatorWidthTextBlock.Text = $"{component.ProcessorCooler.LiquidCooler.RadiatorWidth} мм";
                LiquidRadiatorThicknessTextBlock.Text = $"{component.ProcessorCooler.LiquidCooler.RadiatorThickness} мм";
                LiquidRadiatorSizeTextBlock.Text = component.ProcessorCooler.LiquidCooler.RadiatorMountingSize;

                LiquidPumpRotationSpeedTextBlock.Text = $"{component.ProcessorCooler.LiquidCooler.PumpRotationSpeed} об/мин";
                LiquidPumpConnectorTextBlock.Text = component.ProcessorCooler.LiquidCooler.PumpConnector;

                LiquidPipeLengthTextBlock.Text = $"{component.ProcessorCooler.LiquidCooler.PipeLength} мм";
                LiquidTransparentLengthTextBlock.Text = component.ProcessorCooler.LiquidCooler.TransparentPipe ? "да" : "нет";

                LiquidCoolerGrid.Visibility = Visibility.Visible;
            }

            CoolerFanQuantityTextBlock.Text = component.ProcessorCooler.FanQuantity.ToString();
            CoolerFanSizeTextBlock.Text = $"{component.ProcessorCooler.FanSize} мм";
            CoolerBearingTypeTextBlock.Text = component.ProcessorCooler.BearingType;
            CoolerFanMinSpeedTextBlock.Text = $"{component.ProcessorCooler.MinRotationSpeed} об/мин";
            CoolerFanMaxSpeedTextBlock.Text = $"{component.ProcessorCooler.MaxRotationSpeed} об/мин";
            CoolerAdjustmentRotationSpeedTextBlock.Text = component.ProcessorCooler.AdjustmentRotationSpeed == null ? "нет" : component.ProcessorCooler.AdjustmentRotationSpeed;
            CoolerMaxNoiseLevelTextBlock.Text = component.ProcessorCooler.MaxNoiseLevel == null ? "нет" : $"{component.ProcessorCooler.MaxNoiseLevel} дБ";
            CoolerAirFlowTextBlock.Text = component.ProcessorCooler.MaxAirflow == null ? "нет" : $"{component.ProcessorCooler.MaxAirflow} CFM";
            CoolerMaxStaticPressureTextBlock.Text = component.ProcessorCooler.MaxStaticPressure == null ? "нет" : $"{component.ProcessorCooler.MaxStaticPressure} Па";
            CoolerFanConnectorTextBlock.Text = component.ProcessorCooler.FanConnector;

            CoolerFanGrid.Visibility = Visibility.Visible;
        }

        private void DataStorageInit()
        {
            if (component.DataStorage.HDD != null)
            {
                ComponentTypeTextBlock.Text = "Жесткий диск";
                CommonInfoTextBlock.Text = $"{component.DataStorage.HDD.FormFactor}, {component.DataStorage.HDD.RotationSpeed} rpm, кэш память - {component.DataStorage.HDD.CacheSize} МБ";

                HDDFormFactorTextBlock.Text = component.DataStorage.HDD.FormFactor;
                HDDSizeTextBlock.Text = $"{component.DataStorage.MemorySize} ГБ";
                HDDBufferSizeTextBlock.Text = $"{component.DataStorage.HDD.CacheSize} МБ";
                HDDRotationSpeedTextBlock.Text = $"{component.DataStorage.HDD.RotationSpeed} rpm";

                HDDWriteTechTextBlock.Text = component.DataStorage.HDD.WriteTech;
                HDDActiveNoiseTextBlock.Text = $"{component.DataStorage.HDD.ActiveNoiseLevel} дБ";
                HDDPassiveNoiseTextBlock.Text = $"{component.DataStorage.HDD.PassiveNoiseLevel} дБ";

                HDDActiveEnergyUseTextBlock.Text = $"{component.DataStorage.HDD.MaxEnergyUse} Вт";
                HDDPassiveEnergyUseTextBlock.Text = $"{component.DataStorage.HDD.PassiveEnergyUse} Вт";
                HDDMaxTempTextBlock.Text = $"{component.DataStorage.HDD.MaxTemp} °C";

                HDDGrid.Visibility = Visibility.Visible;
            }
            if (component.DataStorage.SSD != null)
            {
                ComponentTypeTextBlock.Text = "Твердотельный накопитель";
                CommonInfoTextBlock.Text = $"Чтение - {component.DataStorage.SSD.ReadSpeed} Мбайт/c, запись - {component.DataStorage.SSD.WriteSpeed} Мбайт/c, {component.DataStorage.SSD.BitQuantityOnCell}, {component.DataStorage.SSD.MemoryStructure}";

                if (component.DataStorage.SSD.M2SSD != null)
                {
                    M2FormFactorTextBlock.Text = component.DataStorage.SSD.M2SSD.M2FormFactor.Name;
                    M2KeyTextBlock.Text = component.DataStorage.SSD.M2SSD.M2Key.Select(k => k.Name).Aggregate((first, second) => $"{first}&{second}");

                    M2Grid.Visibility = Visibility.Visible;
                }

                SSDSizeTextBlock.Text = $"{component.DataStorage.MemorySize} ГБ";
                SSDBitOnCellTextBlock.Text = component.DataStorage.SSD.BitQuantityOnCell;
                SSDMemoryStructureTextBlock.Text = component.DataStorage.SSD.MemoryStructure;

                SSDReadSpeedTextBlock.Text = $"{component.DataStorage.SSD.ReadSpeed} Мбит/с";
                SSDWriteSpeedTextBlock.Text = $"{component.DataStorage.SSD.WriteSpeed} Мбит/с";

                SSDWriteResourceTextBlock.Text = $"{component.DataStorage.SSD.TotalBytesWritten} ТБ";
                SSDDWPDTextBlock.Text = component.DataStorage.SSD.DWPD.ToString();

                SSDGrid.Visibility = Visibility.Visible;
            }

            DataStorageLengthTextBlock.Text = $"{component.DataStorage.Length} мм";
            DataStorageWidthTextBlock.Text = $"{component.DataStorage.Width} мм";
            DataStorageThicknessTextBlock.Text = $"{component.DataStorage.Thickness} мм";

            DataStorageSizeGrid.Visibility = Visibility.Visible;
        }

        private void CloseButton_Click(object sender, RoutedEventArgs e)
        {
            Navigator.Frame.GoBack();
        }

        private void AddButton_Click(object sender, RoutedEventArgs e)
        {
            AddComponent?.Invoke(component);
            Navigator.Frame.GoBack();
        }

        private void PictureList_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var item = PictureList.SelectedItem;
            if (item != null)
            {
                SelectedImage.Source = new BitmapImage((item as Picture).ImageUri);
            }
        }
    }
}
