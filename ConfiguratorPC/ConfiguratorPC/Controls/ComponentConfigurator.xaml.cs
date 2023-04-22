using ConfiguratorPC.Data;
using ConfiguratorPC.Pages;
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
    /// Логика взаимодействия для ComponentConfigurator.xaml
    /// </summary>
    public partial class ComponentConfigurator : UserControl
    {
        public event EventHandler ListOpened;

        public event EventHandler AddDataStorageConfigurator;

        public event EventHandler RemoveDataStorageConfigurator;

        private ComponentType type;

        private Configurator configurator;

        private readonly string searchTextBoxPlaceholder = "Поиск по наименованию...";

        private Component component;

        public Component Component
        {
            get => component;
            set
            {
                component = value;
                if (component == null)
                {
                    InteractionButton.Content = "+ Добавить";
                    ComponentImage.Source = null;
                    NameTextBlock.Text = "";
                    PriceTextBlock.Text = "";
                }
                else
                {
                    InteractionButton.Content = "- Убрать";
                    var img = component.FirstImage;
                    img.CacheOption = BitmapCacheOption.OnLoad;
                    img.DecodePixelHeight = 80;
                    ComponentImage.Source = img;
                    NameTextBlock.Text = component.Name;
                    PriceTextBlock.Text = $"{component.Price} руб.";
                }
            }
        }

        public ComponentConfigurator()
        {
            InitializeComponent();
        }

        #region Lists of data

        private List<Component> CompatibleComponents
        {
            get
            {
                switch (type)
                {
                    case ComponentType.Processor:
                        return configurator.CompatibleProcessors.Select(c => c.Component).ToList();
                    case ComponentType.MotherBoard:
                        return configurator.CompatibleMotherBoards.Select(c => c.Component).ToList();
                    case ComponentType.Case:
                        return configurator.CompatibleCases.Select(c => c.Component).ToList();
                    case ComponentType.Videocard:
                        return configurator.CompatibleVideoCards.Select(c => c.Component).ToList();
                    case ComponentType.Cooler:
                        return configurator.CompatibleProcessorCooler.Select(c => c.Component).ToList();
                    case ComponentType.RAM:
                        return configurator.CompatibleRAMs.Select(c => c.Component).ToList();
                    case ComponentType.DataStorage:
                        return configurator.CompatibleDataStorage.Select(c => c.Component).ToList();
                    case ComponentType.PowerSupply:
                        return configurator.CompatiblePowerSupply.Select(c => c.Component).ToList();
                    default:
                        return null;
                }
            }
        }

        private List<Socket> Sockets
        {
            get
            {
                var sockets = new List<Socket>();
                sockets.Add(new Socket { Id = -1, Name = "Выбрать все" });
                sockets.AddRange(DAL.Context.Sockets.AsNoTracking());
                return sockets;
            }
        }

        private List<byte> VideoMemorySizes
        {
            get
            {
                return DAL.Context.VideoCards.AsNoTracking().Select(v => v.VideoMemorySize).Distinct().ToList();
            }
        }

        private List<byte> RAMSizes
        {
            get
            {
                return DAL.Context.RAMs.AsNoTracking().Select(r => r.MemorySize).Distinct().ToList();
            }
        }

        private List<PowerSupplyFormFactor> PowerSupplyFormFactors
        {
            get
            {
                var formFactors = new List<PowerSupplyFormFactor>();
                formFactors.Add(new PowerSupplyFormFactor { Id = -1, Name = "Выбрать все" });
                formFactors.AddRange(DAL.Context.PowerSupplyFormFactors.AsNoTracking());
                return formFactors;
            }
        }

        private List<VideoMemoryType> VideoMemoryTypes
        {
            get
            {
                var videoMemoryTypes = new List<VideoMemoryType>();
                videoMemoryTypes.Add(new VideoMemoryType { Id = -1, Name = "Выбрать все" });
                videoMemoryTypes.AddRange(DAL.Context.VideoMemoryTypes.AsNoTracking());
                return videoMemoryTypes;
            }
        }

        private List<GraphicProcessor> GraphicProcessors
        {
            get
            {
                var graphicProcessors = new List<GraphicProcessor>();
                graphicProcessors.Add(new GraphicProcessor { Id = -1, Name = "Выбрать все" });
                graphicProcessors.AddRange(DAL.Context.GraphicProcessors.AsNoTracking());
                return graphicProcessors;
            }
        }

        private List<CaseSize> CaseSizes
        {
            get
            {
                var caseSizes = new List<CaseSize>();
                caseSizes.Add(new CaseSize { Id = -1, Name = "Выбрать все" });
                caseSizes.AddRange(DAL.Context.CaseSizes.AsNoTracking());
                return caseSizes;
            }
        }

        private List<Data.Color> Colors
        {
            get
            {
                var colors = new List<Data.Color>();
                colors.Add(new Data.Color { Id = -1, Name = "Выбрать все" });
                colors.AddRange(DAL.Context.Colors.AsNoTracking());
                return colors;
            }
        }

        private List<MotherBoardFormFactor> MotherBoardFormFactors
        {
            get
            {
                var motherBoardFormFactors = new List<MotherBoardFormFactor>();
                motherBoardFormFactors.Add(new MotherBoardFormFactor { Id = -1, Name = "Выбрать все" });
                motherBoardFormFactors.AddRange(DAL.Context.MotherBoardFormFactors.AsNoTracking());
                return motherBoardFormFactors;
            }
        }

        private List<Chipset> Chipsets
        {
            get
            {
                var chipsets = new List<Chipset>();
                chipsets.Add(new Chipset { Id = -1, Name = "Выбрать все" });
                chipsets.AddRange(DAL.Context.Chipsets.AsNoTracking());
                return chipsets;
            }
        }

        private List<byte> RAMQuantity
        {
            get
            {
                return DAL.Context.MotherBoards.AsNoTracking().Select(m => m.RAMQuantity).Distinct().ToList();
            }
        }

        private List<RAMType> RAMTypes
        {
            get
            {
                var ramTypes = new List<RAMType>();
                ramTypes.Add(new RAMType { Id = -1, Name = "Выбрать все" });
                ramTypes.AddRange(DAL.Context.RAMTypes.AsNoTracking());
                return ramTypes;
            }
        }


        private List<RAMFormFactor> RAMFormFactors
        {
            get
            {
                var ramFormFactors = new List<RAMFormFactor>();
                ramFormFactors.Add(new RAMFormFactor { Id = -1, Name = "Выбрать все" });
                ramFormFactors.AddRange(DAL.Context.RAMFormFactors.AsNoTracking());
                return ramFormFactors;
            }
        }

        private List<Manufacturer> Manufacturers
        {
            get
            {
                List<Manufacturer> manufacturers = new List<Manufacturer>();
                manufacturers.Add(new Manufacturer { Id = -1, Name = "Выбрать все" });
                switch (type)
                {
                    case ComponentType.Processor:
                        manufacturers.AddRange(DAL.Context.Processors.AsNoTracking().Select(p => p.Component.Manufacturer).Distinct().ToList());
                        break;
                    case ComponentType.MotherBoard:
                        manufacturers.AddRange(DAL.Context.MotherBoards.AsNoTracking().Select(p => p.Component.Manufacturer).Distinct().ToList());
                        break;
                    case ComponentType.Case:
                        manufacturers.AddRange(DAL.Context.Cases.AsNoTracking().Select(p => p.Component.Manufacturer).Distinct().ToList());
                        break;
                    case ComponentType.Videocard:
                        manufacturers.AddRange(DAL.Context.VideoCards.AsNoTracking().Select(p => p.Component.Manufacturer).Distinct().ToList());
                        break;
                    case ComponentType.Cooler:
                        manufacturers.AddRange(DAL.Context.ProcessorCoolers.AsNoTracking().Select(p => p.Component.Manufacturer).Distinct().ToList());
                        break;
                    case ComponentType.RAM:
                        manufacturers.AddRange(DAL.Context.RAMs.AsNoTracking().Select(p => p.Component.Manufacturer).Distinct().ToList());
                        break;
                    case ComponentType.DataStorage:
                        manufacturers.AddRange(DAL.Context.DataStorages.AsNoTracking().Select(p => p.Component.Manufacturer).Distinct().ToList());
                        break;
                    case ComponentType.PowerSupply:
                        manufacturers.AddRange(DAL.Context.PowerSupplies.AsNoTracking().Select(p => p.Component.Manufacturer).Distinct().ToList());
                        break;
                    default:
                        break;
                }
                return manufacturers;
            }
        }

        #endregion

        #region Filters

        private void ProcessorFilter(ref List<Component> processors)
        {
            var socket = ProcSocketComboBox.SelectedItem as Socket;
            if (socket.Id != -1)
            {
                processors = processors.Where(f => f.Processor.Socket.Id == socket.Id).ToList();
            }
            var procRAMTypes = ProcRAMTypesComboBox.SelectedItem as RAMType;
            if (procRAMTypes.Id != -1)
            {
                processors = processors.Where(f => f.Processor.RAMTypes.Any(rt => rt.Id == procRAMTypes.Id)).ToList();
            }
            switch (GraphicsComboBox.SelectedIndex)
            {
                case 1:
                    processors = processors.Where(f => f.Processor.IdGraphicsProcessingUnit != null).ToList();
                    break;
                case 2:
                    processors = processors.Where(f => f.Processor.IdGraphicsProcessingUnit == null).ToList();
                    break;
                default:
                    break;
            }
            processors = processors.Where(f => f.Processor.BaseFrequency >= (decimal)MinProcFrequencyNumeric.Value && f.Processor.BaseFrequency <= (decimal)MaxProcFrequencyNumeric.Value).ToList();
        }

        private void ComponentFilter(ref List<Component> components)
        {
            components = components.OrderBy(f => f.Name).ToList();
            if (SearchTextBox.Text != searchTextBoxPlaceholder)
            {
                components = components.Where(f => f.Name.ToLower().Contains(SearchTextBox.Text.ToLower())).ToList();
            }
            switch (SortComboBox.SelectedIndex)
            {
                case 1:
                    components = components.OrderByDescending(f => f.Price).ToList();
                    break;
                default:
                    components = components.OrderBy(f => f.Price).ToList();
                    break;
            }
            components = components.Where(f => f.Price >= (decimal)MinPriceNumeric.Value && f.Price <= (decimal)MaxPriceNumeric.Value).ToList();
            var manufacturer = ManufacturerComboBox.SelectedItem as Manufacturer;
            if (manufacturer.Id != -1)
            {
                components = components.Where(f => f.IdManufacturer == manufacturer.Id).ToList();
            }
        }

        private void MotherboardFilter(ref List<Component> motherboards)
        {
            var socket = MotherBoardSocketComboBox.SelectedItem as Socket;
            if (socket.Id != -1)
            {
                motherboards = motherboards.Where(f => f.MotherBoard.IdSocket == socket.Id).ToList();
            }
            var chipset = ChipsetComboBox.SelectedItem as Chipset;
            if (chipset.Id != -1)
            {
                motherboards = motherboards.Where(f => f.MotherBoard.IdChipset == chipset.Id).ToList();
            }
            if (MotherBoardRAMQuantityComboBox.SelectedIndex != 0)
            {
                motherboards = motherboards.Where(f => f.MotherBoard.RAMQuantity == Convert.ToByte(MotherBoardRAMQuantityComboBox.SelectedItem.ToString())).ToList();
            }
            var ramType = MotherBoardRAMTypeComboBox.SelectedItem as RAMType;
            if (ramType.Id != -1)
            {
                motherboards = motherboards.Where(f => f.MotherBoard.RAMType.Id == ramType.Id).ToList();
            }
            var ramFormFactor = MotherBoardRAMFormFactorComboBox.SelectedItem as RAMFormFactor;
            if (ramFormFactor.Id != -1)
            {
                motherboards = motherboards.Where(f => f.MotherBoard.IdRAMFormFactor == ramFormFactor.Id).ToList();
            }
            var motherBoardFormFactor = MotherBoardFormFactorComboBox.SelectedItem as MotherBoardFormFactor;
            if (motherBoardFormFactor.Id != -1)
            {
                motherboards = motherboards.Where(f => f.MotherBoard.IdMotherBoardFormFactor == motherBoardFormFactor.Id).ToList();
            }
        }

        private void CaseFilter(ref List<Component> cases)
        {
            var motherBoardFormFactor = CaseSupportedMotherBoardFormFactorComboBox.SelectedItem as MotherBoardFormFactor;
            if (motherBoardFormFactor.Id != -1)
            {
                cases = cases.Where(f => f.Case.MotherBoardFormFactors.Any(mf => mf.Id == motherBoardFormFactor.Id)).ToList();
            }
            var caseSize = CaseSizeComboBox.SelectedItem as CaseSize;
            if (caseSize.Id != -1)
            {
                cases = cases.Where(f => f.Case.IdCaseSize == caseSize.Id).ToList();
            }
            var color = CaseColorComboBox.SelectedItem as Data.Color;
            if (color.Id != -1)
            {
                cases = cases.Where(f => f.Case.IdMainColor == color.Id).ToList();
            }
        }

        private void VideocardFilter(ref List<Component> videocards)
        {
            var graphicProcessor = GraphicProcessorComboBox.SelectedItem as GraphicProcessor;
            if (graphicProcessor.Id != -1)
            {
                videocards = videocards.Where(f => f.VideoCard.IdGraphicProcessor == graphicProcessor.Id).ToList();
            }
            if (VideoMemorySizeComboBox.SelectedIndex != 0)
            {
                videocards = videocards.Where(f => f.VideoCard.VideoMemorySize == Convert.ToByte(VideoMemorySizeComboBox.SelectedItem.ToString())).ToList();
            }
            var videoMemoryType = VideoMemoryTypeComboBox.SelectedItem as VideoMemoryType;
            if (videoMemoryType.Id != -1)
            {
                videocards = videocards.Where(f => f.VideoCard.IdVideoMemoryType == videoMemoryType.Id).ToList();
            }
        }

        private void CoolerFilter(ref List<Component> coolers)
        {
            var socket = CoolerSocketComboBox.SelectedItem as Socket;
            if (socket.Id != -1)
            {
                coolers = coolers.Where(f => f.ProcessorCooler.Sockets.Any(s => s.Id == socket.Id)).ToList();
            }
            switch (CoolerTypeComboBox.SelectedIndex)
            {
                case 1:
                    coolers = coolers.Where(f => f.ProcessorCooler.Cooler != null).ToList();
                    break;
                case 2:
                    coolers = coolers.Where(f => f.ProcessorCooler.LiquidCooler != null).ToList();
                    break;
                default:
                    break;
            }
        }

        private void RAMFilter(ref List<Component> rams)
        {
            var ramType = RAMTypeComboBox.SelectedItem as RAMType;
            if (ramType.Id != -1)
            {
                rams = rams.Where(f => f.RAM.IdRAMType == ramType.Id).ToList();
            }
            var ramFormFactor = RAMFormFactorComboBox.SelectedItem as RAMFormFactor;
            if (ramFormFactor.Id != -1)
            {
                rams = rams.Where(f => f.RAM.IdRAMFormFactor == ramFormFactor.Id).ToList();
            }
            if (RAMSizeComboBox.SelectedIndex != 0)
            {
                rams = rams.Where(f => f.RAM.MemorySize == Convert.ToByte(RAMSizeComboBox.SelectedItem.ToString())).ToList();
            }
            rams = rams.Where(f => f.RAM.Frequency >= MinRAMFrequencyNumeric.Value && f.RAM.Frequency <= MaxRAMFrequencyNumeric.Value).ToList();
        }

        private void DataStorageFilter(ref List<Component> dataStorages)
        {
            switch (DataStorageTypeComboBox.SelectedIndex)
            {
                case 1:
                    dataStorages = dataStorages.Where(f => f.DataStorage.HDD != null && f.DataStorage.HDD.FormFactor == "3.5\"").ToList();
                    break;
                case 2:
                    dataStorages = dataStorages.Where(f => f.DataStorage.HDD != null && f.DataStorage.HDD.FormFactor == "2.5\"").ToList();
                    break;
                case 3:
                    dataStorages = dataStorages.Where(f => f.DataStorage.SSD != null && f.DataStorage.SSD.M2SSD == null).ToList();
                    break;
                case 4:
                    dataStorages = dataStorages.Where(f => f.DataStorage.SSD != null && f.DataStorage.SSD.M2SSD != null).ToList();
                    break;
                default:
                    break;
            }
            dataStorages = dataStorages.Where(f => f.DataStorage.MemorySize >= MinDataSizeNumeric.Value && f.DataStorage.MemorySize <= MaxDataSizeNumeric.Value).ToList();
        }

        private void PowerSupplyFilter(ref List<Component> powerSupplies)
        {
            var powerSupplyFormFactor = PowerSupplyFormFactorComboBox.SelectedItem as PowerSupplyFormFactor;
            if (powerSupplyFormFactor.Id != -1)
            {
                powerSupplies = powerSupplies.Where(f => f.PowerSupply.IdPowerSupplyFormFactor == powerSupplyFormFactor.Id).ToList();
            }
            powerSupplies = powerSupplies.Where(f => f.PowerSupply.Power >= MinPowerNumeric.Value && f.PowerSupply.Power <= MaxPowerNumeric.Value).ToList();
        }

        public List<Component> FilteredComponents
        {
            get
            {
                var filtered = CompatibleComponents;
                ComponentFilter(ref filtered);
                switch (type)
                {
                    case ComponentType.Processor:
                        ProcessorFilter(ref filtered);
                        break;
                    case ComponentType.MotherBoard:
                        MotherboardFilter(ref filtered);
                        break;
                    case ComponentType.Case:
                        CaseFilter(ref filtered);
                        break;
                    case ComponentType.Videocard:
                        VideocardFilter(ref filtered);
                        break;
                    case ComponentType.Cooler:
                        CoolerFilter(ref filtered);
                        break;
                    case ComponentType.RAM:
                        RAMFilter(ref filtered);
                        break;
                    case ComponentType.DataStorage:
                        DataStorageFilter(ref filtered);
                        break;
                    case ComponentType.PowerSupply:
                        PowerSupplyFilter(ref filtered);
                        break;
                    default:
                        break;
                }
                return filtered;
            }
        }

        #endregion

        #region Initialization

        public void Init(Configurator configurator, ComponentType type)
        {
            this.configurator = configurator;
            this.type = type;
            try
            {
                switch (type)
                {
                    case ComponentType.Processor:
                        ProcessorInit();
                        break;
                    case ComponentType.MotherBoard:
                        MotherboardInit();
                        break;
                    case ComponentType.Case:
                        CaseInit();
                        break;
                    case ComponentType.Videocard:
                        VideocardInit();
                        break;
                    case ComponentType.Cooler:
                        CoolerInit();
                        break;
                    case ComponentType.RAM:
                        RAMInit();
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
                SetPriceLimits();
                MinPriceNumeric.MaxCoupleNumericTextBox = MaxPriceNumeric;
                MinPriceNumeric.ValueChanged += NumericTextBox_ValueChanged;
                MaxPriceNumeric.ValueChanged += NumericTextBox_ValueChanged;

                SetComboBox(ManufacturerComboBox, Manufacturers);

                SearchTextBox.Text = searchTextBoxPlaceholder;
                SearchTextBox.TextChanged += SearchTextBox_TextChanged;

                SortComboBox.SelectionChanged += ComboBox_SelectionChanged;
            }
            catch (Exception ex)
            {
                FeedBack.ShowError(ex);
            }
        }

        private void PowerSupplyInit()
        {
            TypeTextBlock.Text = "Блок питания";

            SetPowerLimits();
            MinPowerNumeric.MaxCoupleNumericTextBox = MaxPowerNumeric;
            MinPowerNumeric.ValueChanged += NumericTextBox_ValueChanged;
            MaxPowerNumeric.ValueChanged += NumericTextBox_ValueChanged;

            SetComboBox(PowerSupplyFormFactorComboBox, PowerSupplyFormFactors);

            PowerSupplyFiltersStackPanel.Visibility = Visibility.Visible;
        }

        private void DataStorageInit()
        {
            TypeTextBlock.Text = "Хранилище данных";

            DataStorageTypeComboBox.SelectionChanged += ComboBox_SelectionChanged;

            SetDataSizeLimits();
            MinDataSizeNumeric.MaxCoupleNumericTextBox = MaxDataSizeNumeric;
            MinDataSizeNumeric.ValueChanged += NumericTextBox_ValueChanged;
            MaxDataSizeNumeric.ValueChanged += NumericTextBox_ValueChanged;

            DataStorageFiltersStackPanel.Visibility = Visibility.Visible;
        }

        private void RAMInit()
        {
            TypeTextBlock.Text = "Оперативная память";

            NumericRam.ValueChanged += NumericRam_ValueChanged;
            configurator.MotherBoardChanged += Configurator_RAMChanged;
            configurator.ProcessorChanged += Configurator_RAMChanged;
            configurator.RAMChanged += Configurator_RAMChanged;

            SetComboBox(RAMFormFactorComboBox, RAMFormFactors);
            SetComboBox(RAMTypeComboBox, RAMTypes);

            foreach (var item in RAMSizes)
            {
                RAMSizeComboBox.Items.Add(new ComboBoxItem().Content = item.ToString());
            }
            RAMSizeComboBox.SelectionChanged += ComboBox_SelectionChanged;

            SetRAMFrequencyLimits();
            MinRAMFrequencyNumeric.MaxCoupleNumericTextBox = MaxRAMFrequencyNumeric;
            MinRAMFrequencyNumeric.ValueChanged += NumericTextBox_ValueChanged;
            MaxRAMFrequencyNumeric.ValueChanged += NumericTextBox_ValueChanged;

            RAMFiltersStackPanel.Visibility = Visibility.Visible;
        }

        private void CoolerInit()
        {
            TypeTextBlock.Text = "Охлаждение процессора";

            SetComboBox(CoolerSocketComboBox, Sockets);

            CoolerTypeComboBox.SelectionChanged += ComboBox_SelectionChanged;

            CoolerFiltersStackPanel.Visibility = Visibility.Visible;
        }

        private void ProcessorInit()
        {
            TypeTextBlock.Text = "Процессор";

            SetComboBox(ProcSocketComboBox, Sockets);
            SetComboBox(ProcRAMTypesComboBox, RAMTypes);

            GraphicsComboBox.SelectionChanged += ComboBox_SelectionChanged;

            SetProcFrequencyLimits();
            MinProcFrequencyNumeric.MaxCoupleNumericTextBox = MaxProcFrequencyNumeric;
            MinProcFrequencyNumeric.ValueChanged += NumericTextBox_ValueChanged;
            MaxProcFrequencyNumeric.ValueChanged += NumericTextBox_ValueChanged;

            ProcessorFiltersStackPanel.Visibility = Visibility.Visible;
        }

        private void MotherboardInit()
        {
            TypeTextBlock.Text = "Материнская плата";

            SetComboBox(MotherBoardSocketComboBox, Sockets);
            SetComboBox(ChipsetComboBox, Chipsets);

            foreach (var item in RAMQuantity)
            {
                MotherBoardRAMQuantityComboBox.Items.Add(new ComboBoxItem().Content = item.ToString());
            }
            MotherBoardRAMQuantityComboBox.SelectionChanged += ComboBox_SelectionChanged;

            SetComboBox(MotherBoardRAMTypeComboBox, RAMTypes);
            SetComboBox(MotherBoardRAMFormFactorComboBox, RAMFormFactors);
            SetComboBox(MotherBoardFormFactorComboBox, MotherBoardFormFactors);

            MotherBoardFiltersStackPanel.Visibility = Visibility.Visible;
        }

        private void CaseInit()
        {
            TypeTextBlock.Text = "Корпус";

            SetComboBox(CaseSizeComboBox, CaseSizes);
            SetComboBox(CaseSupportedMotherBoardFormFactorComboBox, MotherBoardFormFactors);
            SetComboBox(CaseColorComboBox, Colors);

            CaseFiltersStackPanel.Visibility = Visibility.Visible;
        }

        private void VideocardInit()
        {
            TypeTextBlock.Text = "Видеокарта";

            SetComboBox(GraphicProcessorComboBox, GraphicProcessors);
            SetComboBox(VideoMemoryTypeComboBox, VideoMemoryTypes);

            foreach (var item in VideoMemorySizes)
            {
                VideoMemorySizeComboBox.Items.Add(new ComboBoxItem().Content = item.ToString());
            }
            VideoMemorySizeComboBox.SelectionChanged += ComboBox_SelectionChanged;

            VideoCardFiltersStackPanel.Visibility = Visibility.Visible;
        }

        #endregion

        #region Set controls settings

        private void SetComboBox<T>(ComboBox comboBox, List<T> itemsSource)
        {
            comboBox.ItemsSource = itemsSource;
            comboBox.SelectedIndex = 0;
            comboBox.SelectionChanged += ComboBox_SelectionChanged;
        }

        private void SetPriceLimits()
        {
            var components = new List<Component>();
            switch (type)
            {
                case ComponentType.Processor:
                    components.AddRange(DAL.Context.Processors.AsNoTracking().Select(p => p.Component));
                    break;
                case ComponentType.MotherBoard:
                    components.AddRange(DAL.Context.MotherBoards.AsNoTracking().Select(p => p.Component));
                    break;
                case ComponentType.Case:
                    components.AddRange(DAL.Context.Cases.AsNoTracking().Select(p => p.Component));
                    break;
                case ComponentType.Videocard:
                    components.AddRange(DAL.Context.VideoCards.AsNoTracking().Select(p => p.Component));
                    break;
                case ComponentType.Cooler:
                    components.AddRange(DAL.Context.ProcessorCoolers.AsNoTracking().Select(p => p.Component));
                    break;
                case ComponentType.RAM:
                    components.AddRange(DAL.Context.RAMs.AsNoTracking().Select(p => p.Component));
                    break;
                case ComponentType.DataStorage:
                    components.AddRange(DAL.Context.DataStorages.AsNoTracking().Select(p => p.Component));
                    break;
                case ComponentType.PowerSupply:
                    components.AddRange(DAL.Context.PowerSupplies.AsNoTracking().Select(p => p.Component));
                    break;
                default:
                    break;
            }
            if (components.Count > 0)
            {
                SetNumericLimits(MinPriceNumeric, MaxPriceNumeric, Convert.ToDouble(components.Min(c => c.Price)), Convert.ToDouble(components.Max(c => c.Price)));
            }
        }

        private void SetNumericLimits(NumericTextBox minNumericTextBox, NumericTextBox maxNumericTextBox, double minValue, double maxValue)
        {
            minNumericTextBox.MinValue = maxNumericTextBox.MinValue = minNumericTextBox.Value = minNumericTextBox.DefaultValue = minValue;
            minNumericTextBox.MaxValue = maxNumericTextBox.MaxValue = maxNumericTextBox.Value = maxNumericTextBox.DefaultValue =maxValue;
        }

        private void SetDataSizeLimits()
        {
            var dataStorages = DAL.Context.DataStorages.AsNoTracking().ToList();
            if (dataStorages.Count > 0)
            {
                SetNumericLimits(MinDataSizeNumeric, MaxDataSizeNumeric, Convert.ToDouble(dataStorages.Min(c => c.MemorySize)), Convert.ToDouble(dataStorages.Max(c => c.MemorySize)));
            }
        }

        private void SetPowerLimits()
        {
            var powerSupplies = DAL.Context.PowerSupplies.AsNoTracking().ToList();
            if (powerSupplies.Count > 0)
            {
                SetNumericLimits(MinPowerNumeric, MaxPowerNumeric, Convert.ToDouble(powerSupplies.Min(p => p.Power)), Convert.ToDouble(powerSupplies.Max(p => p.Power)));
            }
        }

        private void SetProcFrequencyLimits()
        {
            var processors = DAL.Context.Processors.AsNoTracking().ToList();
            if (processors.Count > 0)
            {
                SetNumericLimits(MinProcFrequencyNumeric, MaxProcFrequencyNumeric, Convert.ToDouble(processors.Min(p => p.BaseFrequency)), Convert.ToDouble(processors.Max(p => p.BaseFrequency)));
            }
        }

        private void SetRAMFrequencyLimits()
        {
            var rams = DAL.Context.RAMs.AsNoTracking().ToList();
            if (rams.Count > 0)
            {
                SetNumericLimits(MinRAMFrequencyNumeric, MaxRAMFrequencyNumeric, Convert.ToDouble(rams.Min(p => p.Frequency)), Convert.ToDouble(rams.Max(p => p.Frequency)));
            }
        }

        public void CollapseList()
        {
            ComponentsBorder.Visibility = Visibility.Collapsed;
        }

        private void FillList()
        {
            ComponentsList.Items.Clear();
            if (FilteredComponents.Count > 0)
            {
                foreach (var item in FilteredComponents)
                {
                    ComponentsList.Items.Add(item);
                }
                ComponentsList.Visibility = Visibility.Visible;
                EmptyTextBlock.Visibility = Visibility.Collapsed;
            }
            else
            {
                ComponentsList.Visibility = Visibility.Collapsed;
                EmptyTextBlock.Visibility = Visibility.Visible;
            }
        }

        #endregion

        #region Events

        private void InteractionButton_Click(object sender, RoutedEventArgs e)
        {
            if (ComponentsBorder.Visibility != Visibility.Collapsed)
            {
                ComponentsBorder.Visibility = Visibility.Collapsed;
            }
            else if (Component == null)
            {
                ComponentsBorder.Visibility = Visibility.Visible;
                FillList();
            }
            else
            {
                switch (type)
                {
                    case ComponentType.Processor:
                        configurator.Processor = null;
                        break;
                    case ComponentType.MotherBoard:
                        configurator.MotherBoard = null;
                        break;
                    case ComponentType.Case:
                        configurator.Case = null;
                        break;
                    case ComponentType.Videocard:
                        configurator.VideoCard = null;
                        break;
                    case ComponentType.Cooler:
                        configurator.ProcessorCooler = null;
                        break;
                    case ComponentType.RAM:
                        configurator.RAM = null;
                        break;
                    case ComponentType.DataStorage:
                        configurator.DataStorages.Remove(component.DataStorage);
                        RemoveDataStorageConfigurator?.Invoke(this, EventArgs.Empty);
                        break;
                    case ComponentType.PowerSupply:
                        configurator.PowerSupply = null;
                        break;
                    default:
                        break;
                }
                Component = null;
                ListOpened?.Invoke(this, EventArgs.Empty);
            }
        }

        private void AddComponentButton_Click(object sender, RoutedEventArgs e)
        {
            var item = (sender as Button).DataContext;
            if (item != null)
            {
                SelectComponent(item as Component);
            }
        }

        private void SelectComponent(Component component)
        {
            Component = component;
            switch (type)
            {
                case ComponentType.Processor:
                    configurator.Processor = component.Processor;
                    break;
                case ComponentType.MotherBoard:
                    configurator.MotherBoard = component.MotherBoard;
                    break;
                case ComponentType.Case:
                    configurator.Case = component.Case;
                    break;
                case ComponentType.Videocard:
                    configurator.VideoCard = component.VideoCard;
                    break;
                case ComponentType.Cooler:
                    configurator.ProcessorCooler = component.ProcessorCooler;
                    break;
                case ComponentType.RAM:
                    configurator.RAM = component.RAM;
                    break;
                case ComponentType.DataStorage:
                    configurator.DataStorages.Add(component.DataStorage);
                    AddDataStorageConfigurator?.Invoke(this, EventArgs.Empty);
                    break;
                case ComponentType.PowerSupply:
                    configurator.PowerSupply = component.PowerSupply;
                    break;
                default:
                    break;
            }
            ComponentsBorder.Visibility = Visibility.Collapsed;
            SetComponentsBorder();
        }

        private void ComponentsList_PreviewMouseWheel(object sender, MouseWheelEventArgs e)
        {
            if (e.Delta < 0)
            {
                ComponentsScrollViewer.LineDown();
                ComponentsScrollViewer.LineDown();
                ComponentsScrollViewer.LineDown();
            }
            else
            {
                ComponentsScrollViewer.LineUp();
                ComponentsScrollViewer.LineUp();
                ComponentsScrollViewer.LineUp();
            }
        }

        private void SearchTextBox_GotFocus(object sender, RoutedEventArgs e)
        {
            if (SearchTextBox.Text == searchTextBoxPlaceholder)
            {
                SearchTextBox.Text = "";
            }
        }

        private void SearchTextBox_LostFocus(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(SearchTextBox.Text))
            {
                SearchTextBox.Text = searchTextBoxPlaceholder;
            }
        }

        private void SearchTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            FillList();
        }

        private void ComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            FillList();
        }

        private void NumericTextBox_ValueChanged(object sender, EventArgs e)
        {
            FillList();
        }

        private void SetComponentsBorder()
        {
            if (ComponentsBorder.Visibility == Visibility.Visible)
            {
                InteractionButton.Content = "- Свернуть";
                ButtonBorder.CornerRadius = new CornerRadius(10, 10, 0, 0);
                ListOpened?.Invoke(this, EventArgs.Empty);
            }
            else
            {
                ButtonBorder.CornerRadius = new CornerRadius(10, 10, 10, 10);
                if (Component == null)
                {
                    InteractionButton.Content = "+ Добавить";
                }
            }
        }

        private void ComponentsBorder_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            SetComponentsBorder();
        }

        private void NumericRam_ValueChanged(object sender, EventArgs e)
        {
            configurator.RAMQuantity = NumericRam.Value;
        }

        private void Configurator_RAMChanged(object sender, EventArgs e)
        {
            if (configurator.RAM != null && configurator.MotherBoard != null && configurator.Processor != null)
            {
                NumericRam.Visibility = Visibility.Visible;
            }
            else
            {
                NumericRam.Visibility = Visibility.Collapsed;
            }
            NumericRam.MaxValue = configurator.MaxRAMQuantity;
            NumericRam.Value = 1;
        }

        private void ComponentTitle_PreviewMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            var component = (sender as TextBlock).DataContext as Component;
            if (component != null)
            {
                var page = new ComponentPage(component, type);
                page.AddComponent += SelectComponent;
                page.EnableAddComponent = true;
                Navigator.Frame.Navigate(page);
            }
        }

        private void CurrentComponentTitle_PreviewMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            if (component != null)
            {
                Navigator.Frame.Navigate(new ComponentPage(component, type));
            }
        }

        #endregion
    }
}
