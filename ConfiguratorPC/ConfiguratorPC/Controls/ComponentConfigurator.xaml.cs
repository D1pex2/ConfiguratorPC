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
    /// Логика взаимодействия для ComponentConfigurator.xaml
    /// </summary>
    public partial class ComponentConfigurator : UserControl
    {
        public event EventHandler ListOpened;

        private ComponentType type;

        private Configurator configurator;

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
                sockets.AddRange(DAL.Context.Sockets);
                return sockets;
            }
        }

        private List<byte> VideoMemorySizes
        {
            get
            {
                return DAL.Context.VideoCards.Select(v => v.VideoMemorySize).Distinct().ToList();
            }
        }

        private List<byte> RAMSizes
        {
            get
            {
                return DAL.Context.RAMs.Select(r => r.MemorySize).Distinct().ToList();
            }
        }

        private List<VideoMemoryType> VideoMemoryTypes
        {
            get
            {
                var videoMemoryTypes = new List<VideoMemoryType>();
                videoMemoryTypes.Add(new VideoMemoryType { Id = -1, Name = "Выбрать все" });
                videoMemoryTypes.AddRange(DAL.Context.VideoMemoryTypes);
                return videoMemoryTypes;
            }
        }

        private List<GraphicProcessor> GraphicProcessors
        {
            get
            {
                var graphicProcessors = new List<GraphicProcessor>();
                graphicProcessors.Add(new GraphicProcessor { Id = -1, Name = "Выбрать все" });
                graphicProcessors.AddRange(DAL.Context.GraphicProcessors);
                return graphicProcessors;
            }
        }

        private List<CaseSize> CaseSizes
        {
            get
            {
                var caseSizes = new List<CaseSize>();
                caseSizes.Add(new CaseSize { Id = -1, Name = "Выбрать все" });
                caseSizes.AddRange(DAL.Context.CaseSizes);
                return caseSizes;
            }
        }

        private List<Data.Color> Colors
        {
            get
            {
                var colors = new List<Data.Color>();
                colors.Add(new Data.Color { Id = -1, Name = "Выбрать все" });
                colors.AddRange(DAL.Context.Colors);
                return colors;
            }
        }

        private List<MotherBoardFormFactor> MotherBoardFormFactors
        {
            get
            {
                var motherBoardFormFactors = new List<MotherBoardFormFactor>();
                motherBoardFormFactors.Add(new MotherBoardFormFactor { Id = -1, Name = "Выбрать все" });
                motherBoardFormFactors.AddRange(DAL.Context.MotherBoardFormFactors);
                return motherBoardFormFactors;
            }
        }

        private List<Chipset> Chipsets
        {
            get
            {
                var chipsets = new List<Chipset>();
                chipsets.Add(new Chipset { Id = -1, Name = "Выбрать все" });
                chipsets.AddRange(DAL.Context.Chipsets);
                return chipsets;
            }
        }

        private List<byte> RAMQuantity
        {
            get
            {
                return DAL.Context.MotherBoards.Select(m => m.RAMQuantity).Distinct().ToList();
            }
        }

        private List<RAMType> RAMTypes
        {
            get
            {
                var ramTypes = new List<RAMType>();
                ramTypes.Add(new RAMType { Id = -1, Name = "Выбрать все" });
                ramTypes.AddRange(DAL.Context.RAMTypes);
                return ramTypes;
            }
        }


        private List<RAMFormFactor> RAMFormFactors
        {
            get
            {
                var ramFormFactors = new List<RAMFormFactor>();
                ramFormFactors.Add(new RAMFormFactor { Id = -1, Name = "Выбрать все" });
                ramFormFactors.AddRange(DAL.Context.RAMFormFactors);
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
                        manufacturers.AddRange(DAL.Context.Processors.Select(p => p.Component.Manufacturer).Distinct().ToList());
                        break;
                    case ComponentType.MotherBoard:
                        manufacturers.AddRange(DAL.Context.MotherBoards.Select(p => p.Component.Manufacturer).Distinct().ToList());
                        break;
                    case ComponentType.Case:
                        manufacturers.AddRange(DAL.Context.Cases.Select(p => p.Component.Manufacturer).Distinct().ToList());
                        break;
                    case ComponentType.Videocard:
                        manufacturers.AddRange(DAL.Context.VideoCards.Select(p => p.Component.Manufacturer).Distinct().ToList());
                        break;
                    case ComponentType.Cooler:
                        manufacturers.AddRange(DAL.Context.ProcessorCoolers.Select(p => p.Component.Manufacturer).Distinct().ToList());
                        break;
                    case ComponentType.RAM:
                        manufacturers.AddRange(DAL.Context.RAMs.Select(p => p.Component.Manufacturer).Distinct().ToList());
                        break;
                    case ComponentType.DataStorage:
                        manufacturers.AddRange(DAL.Context.DataStorages.Select(p => p.Component.Manufacturer).Distinct().ToList());
                        break;
                    case ComponentType.PowerSupply:
                        manufacturers.AddRange(DAL.Context.PowerSupplies.Select(p => p.Component.Manufacturer).Distinct().ToList());
                        break;
                    default:
                        break;
                }
                return manufacturers;
            }
        }

        private string searchTextBoxPlaceholder = "Поиск по наименованию...";

        public List<Component> FilteredComponents
        {
            get
            {
                var filtered = CompatibleComponents;
                filtered = filtered.OrderBy(f => f.Name).ToList();
                if (SearchTextBox.Text != searchTextBoxPlaceholder)
                {
                    filtered = filtered.Where(f => f.Name.ToLower().Contains(SearchTextBox.Text.ToLower())).ToList();
                }
                switch (SortComboBox.SelectedIndex)
                {
                    case 1:
                        filtered = filtered.OrderByDescending(f => f.Price).ToList();
                        break;
                    default:
                        filtered = filtered.OrderBy(f => f.Price).ToList();
                        break;
                }
                filtered = filtered.Where(f => f.Price >= (decimal)MinPriceNumeric.Value && f.Price <= (decimal)MaxPriceNumeric.Value).ToList();
                var manufacturer = ManufacturerComboBox.SelectedItem as Manufacturer;
                if (manufacturer.Id != -1)
                {
                    filtered = filtered.Where(f => f.IdManufacturer == manufacturer.Id).ToList();
                }
                switch (type)
                {
                    case ComponentType.Processor:
                        var socket = ProcSocketComboBox.SelectedItem as Socket;
                        if (socket.Id != -1)
                        {
                            filtered = filtered.Where(f => f.Processor.Socket.Id == socket.Id).ToList();
                        }
                        var procRAMTypes = ProcRAMTypesComboBox.SelectedItem as RAMType;
                        if (procRAMTypes.Id != -1)
                        {
                            filtered = filtered.Where(f => f.Processor.RAMTypes.Any(rt => rt.Id == procRAMTypes.Id)).ToList();
                        }
                        switch (GraphicsComboBox.SelectedIndex)
                        {
                            case 1:
                                filtered = filtered.Where(f => f.Processor.IdGraphicsProcessingUnit != null).ToList();
                                break;
                            case 2:
                                filtered = filtered.Where(f => f.Processor.IdGraphicsProcessingUnit == null).ToList();
                                break;
                            default:
                                break;
                        }
                        filtered = filtered.Where(f => f.Processor.BaseFrequency >= (decimal)MinProcFrequencyNumeric.Value && f.Processor.BaseFrequency <= (decimal)MaxProcFrequencyNumeric.Value).ToList();
                        break;
                    case ComponentType.MotherBoard:
                        socket = MotherBoardSocketComboBox.SelectedItem as Socket;
                        if (socket.Id != -1)
                        {
                            filtered = filtered.Where(f => f.MotherBoard.IdSocket == socket.Id).ToList();
                        }
                        var chipset = ChipsetComboBox.SelectedItem as Chipset;
                        if (chipset.Id != -1)
                        {
                            filtered = filtered.Where(f => f.MotherBoard.IdChipset == chipset.Id).ToList();
                        }
                        if (MotherBoardRAMQuantityComboBox.SelectedIndex != 0)
                        {
                            filtered = filtered.Where(f => f.MotherBoard.RAMQuantity == Convert.ToByte(MotherBoardRAMQuantityComboBox.SelectedItem.ToString())).ToList();
                        }
                        var ramType = MotherBoardRAMTypeComboBox.SelectedItem as RAMType;
                        if (ramType.Id != -1)
                        {
                            filtered = filtered.Where(f => f.MotherBoard.RAMType.Id == ramType.Id).ToList();
                        }
                        var ramFormFactor = MotherBoardRAMFormFactorComboBox.SelectedItem as RAMFormFactor;
                        if (ramFormFactor.Id != -1)
                        {
                            filtered = filtered.Where(f => f.MotherBoard.IdRAMFormFactor == ramFormFactor.Id).ToList();
                        }
                        var motherBoardFormFactor = MotherBoardFormFactorComboBox.SelectedItem as MotherBoardFormFactor;
                        if (motherBoardFormFactor.Id != -1)
                        {
                            filtered = filtered.Where(f => f.MotherBoard.IdMotherBoardFormFactor == motherBoardFormFactor.Id).ToList();
                        }
                        break;
                    case ComponentType.Case:
                        motherBoardFormFactor = CaseSupportedMotherBoardFormFactorComboBox.SelectedItem as MotherBoardFormFactor;
                        if (motherBoardFormFactor.Id != -1)
                        {
                            filtered = filtered.Where(f => f.Case.MotherBoardFormFactors.Any(mf => mf.Id == motherBoardFormFactor.Id)).ToList();
                        }
                        var caseSize = CaseSizeComboBox.SelectedItem as CaseSize;
                        if (caseSize.Id != -1)
                        {
                            filtered = filtered.Where(f => f.Case.IdCaseSize == caseSize.Id).ToList();
                        }
                        var color = CaseColorComboBox.SelectedItem as Data.Color;
                        if (color.Id != -1)
                        {
                            filtered = filtered.Where(f => f.Case.IdMainColor == color.Id).ToList();
                        }
                        break;
                    case ComponentType.Videocard:
                        var graphicProcessor = GraphicProcessorComboBox.SelectedItem as GraphicProcessor;
                        if (graphicProcessor.Id != -1)
                        {
                            filtered = filtered.Where(f => f.VideoCard.IdGraphicProcessor == graphicProcessor.Id).ToList();
                        }
                        if (VideoMemorySizeComboBox.SelectedIndex != 0)
                        {
                            filtered = filtered.Where(f => f.VideoCard.VideoMemorySize == Convert.ToByte(VideoMemorySizeComboBox.SelectedItem.ToString())).ToList();
                        }
                        var videoMemoryType = VideoMemoryTypeComboBox.SelectedItem as VideoMemoryType;
                        if (videoMemoryType.Id != -1)
                        {
                            filtered = filtered.Where(f => f.VideoCard.IdVideoMemoryType == videoMemoryType.Id).ToList();
                        }
                        break;
                    case ComponentType.Cooler:
                        socket = CoolerSocketComboBox.SelectedItem as Socket;
                        if (socket.Id != -1)
                        {
                            filtered = filtered.Where(f => f.ProcessorCooler.Sockets.Any(s => s.Id == socket.Id)).ToList();
                        }
                        switch (CoolerTypeComboBox.SelectedIndex)
                        {
                            case 1:
                                filtered = filtered.Where(f => f.ProcessorCooler.Cooler != null).ToList();
                                break;
                            case 2:
                                filtered = filtered.Where(f => f.ProcessorCooler.LiquidCooler != null).ToList();
                                break;
                            default:
                                break;
                        }
                        break;
                    case ComponentType.RAM:
                        ramType = RAMTypeComboBox.SelectedItem as RAMType;
                        if (ramType.Id != -1)
                        {
                            filtered = filtered.Where(f => f.RAM.IdRAMType == ramType.Id).ToList();
                        }
                        ramFormFactor = RAMFormFactorComboBox.SelectedItem as RAMFormFactor;
                        if (ramFormFactor.Id != -1)
                        {
                            filtered = filtered.Where(f => f.RAM.IdRAMFormFactor == ramFormFactor.Id).ToList();
                        }
                        if (RAMSizeComboBox.SelectedIndex != 0)
                        {
                            filtered = filtered.Where(f => f.RAM.MemorySize == Convert.ToByte(RAMSizeComboBox.SelectedItem.ToString())).ToList();
                        }
                        filtered = filtered.Where(f => f.RAM.Frequency >= MinRAMFrequencyNumeric.Value && f.RAM.Frequency <= MaxRAMFrequencyNumeric.Value).ToList();
                        break;
                    case ComponentType.DataStorage:
                        break;
                    case ComponentType.PowerSupply:
                        break;
                    default:
                        break;
                }
                return filtered;
            }
        }

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
                    ComponentImage.Source = component.Image;
                    NameTextBlock.Text = component.Name;
                    PriceTextBlock.Text = $"{component.Price} руб.";
                }
            }
        }

        public ComponentConfigurator()
        {
            InitializeComponent();
        }

        public void Init(Configurator configurator, ComponentType type)
        {
            this.configurator = configurator;
            this.type = type;
            try
            {
                switch (type)
                {
                    case ComponentType.Processor:
                        TypeTextBlock.Text = "Процессор";

                        ProcSocketComboBox.ItemsSource = Sockets;
                        ProcSocketComboBox.SelectedIndex = 0;
                        ProcSocketComboBox.SelectionChanged += ComboBox_SelectionChanged;

                        GraphicsComboBox.SelectionChanged += ComboBox_SelectionChanged;

                        ProcRAMTypesComboBox.ItemsSource = RAMTypes;
                        ProcRAMTypesComboBox.SelectedIndex = 0;
                        ProcRAMTypesComboBox.SelectionChanged += ComboBox_SelectionChanged;

                        SetProcFrequencyLimits();
                        MinProcFrequencyNumeric.ValueChanged += NumericTextBox_ValueChanged;
                        MaxProcFrequencyNumeric.ValueChanged += NumericTextBox_ValueChanged;

                        ProcessorFiltersStackPanel.Visibility = Visibility.Visible;
                        break;
                    case ComponentType.MotherBoard:
                        TypeTextBlock.Text = "Материнская плата";

                        MotherBoardSocketComboBox.ItemsSource = Sockets;
                        MotherBoardSocketComboBox.SelectedIndex = 0;
                        MotherBoardSocketComboBox.SelectionChanged += ComboBox_SelectionChanged;

                        ChipsetComboBox.ItemsSource = Chipsets;
                        ChipsetComboBox.SelectedIndex = 0;
                        ChipsetComboBox.SelectionChanged += ComboBox_SelectionChanged;

                        foreach (var item in RAMQuantity)
                        {
                            MotherBoardRAMQuantityComboBox.Items.Add(new ComboBoxItem().Content = item.ToString());
                        }
                        MotherBoardRAMQuantityComboBox.SelectionChanged += ComboBox_SelectionChanged;

                        MotherBoardRAMTypeComboBox.ItemsSource = RAMTypes;
                        MotherBoardRAMTypeComboBox.SelectedIndex = 0;
                        MotherBoardRAMTypeComboBox.SelectionChanged += ComboBox_SelectionChanged;

                        MotherBoardRAMFormFactorComboBox.ItemsSource = RAMFormFactors;
                        MotherBoardRAMFormFactorComboBox.SelectedIndex = 0;
                        MotherBoardRAMFormFactorComboBox.SelectionChanged += ComboBox_SelectionChanged;

                        MotherBoardFormFactorComboBox.ItemsSource = MotherBoardFormFactors;
                        MotherBoardFormFactorComboBox.SelectedIndex = 0;
                        MotherBoardFormFactorComboBox.SelectionChanged += ComboBox_SelectionChanged;

                        MotherBoardFiltersStackPanel.Visibility = Visibility.Visible;
                        break;
                    case ComponentType.Case:
                        TypeTextBlock.Text = "Корпус";

                        CaseSizeComboBox.ItemsSource = CaseSizes;
                        CaseSizeComboBox.SelectedIndex = 0;
                        CaseSizeComboBox.SelectionChanged += ComboBox_SelectionChanged;

                        CaseSupportedMotherBoardFormFactorComboBox.ItemsSource = MotherBoardFormFactors;
                        CaseSupportedMotherBoardFormFactorComboBox.SelectedIndex = 0;
                        CaseSupportedMotherBoardFormFactorComboBox.SelectionChanged += ComboBox_SelectionChanged;

                        CaseColorComboBox.ItemsSource = Colors;
                        CaseColorComboBox.SelectedIndex = 0;
                        CaseColorComboBox.SelectionChanged += ComboBox_SelectionChanged;

                        CaseFiltersStackPanel.Visibility = Visibility.Visible;
                        break;
                    case ComponentType.Videocard:
                        TypeTextBlock.Text = "Видеокарта";

                        GraphicProcessorComboBox.ItemsSource = GraphicProcessors;
                        GraphicProcessorComboBox.SelectedIndex = 0;
                        GraphicProcessorComboBox.SelectionChanged += ComboBox_SelectionChanged;

                        VideoMemoryTypeComboBox.ItemsSource = VideoMemoryTypes;
                        VideoMemoryTypeComboBox.SelectedIndex = 0;
                        VideoMemoryTypeComboBox.SelectionChanged += ComboBox_SelectionChanged;

                        foreach (var item in VideoMemorySizes)
                        {
                            VideoMemorySizeComboBox.Items.Add(new ComboBoxItem().Content = item.ToString());
                        }
                        VideoMemorySizeComboBox.SelectionChanged += ComboBox_SelectionChanged;

                        VideoCardFiltersStackPanel.Visibility = Visibility.Visible;
                        break;
                    case ComponentType.Cooler:
                        TypeTextBlock.Text = "Охлаждение процессора";

                        CoolerSocketComboBox.ItemsSource = Sockets;
                        CoolerSocketComboBox.SelectedIndex = 0;
                        CoolerSocketComboBox.SelectionChanged += ComboBox_SelectionChanged;

                        CoolerTypeComboBox.SelectionChanged += ComboBox_SelectionChanged;

                        CoolerFiltersStackPanel.Visibility = Visibility.Visible;
                        break;
                    case ComponentType.RAM:
                        TypeTextBlock.Text = "Оперативная память";

                        NumericRam.ValueChanged += NumericRam_ValueChanged;
                        configurator.MotherBoardChanged += Configurator_RAMChanged;
                        configurator.ProcessorChanged += Configurator_RAMChanged;
                        configurator.RAMChanged += Configurator_RAMChanged;

                        RAMFormFactorComboBox.ItemsSource = RAMFormFactors;
                        RAMFormFactorComboBox.SelectedIndex = 0;
                        RAMFormFactorComboBox.SelectionChanged += ComboBox_SelectionChanged;

                        RAMTypeComboBox.ItemsSource = RAMTypes;
                        RAMTypeComboBox.SelectedIndex = 0;
                        RAMTypeComboBox.SelectionChanged += ComboBox_SelectionChanged;

                        foreach (var item in RAMSizes)
                        {
                            RAMSizeComboBox.Items.Add(new ComboBoxItem().Content = item.ToString());
                        }
                        RAMSizeComboBox.SelectionChanged += ComboBox_SelectionChanged;

                        SetRAMFrequencyLimits();
                        MinRAMFrequencyNumeric.ValueChanged += NumericTextBox_ValueChanged;
                        MaxRAMFrequencyNumeric.ValueChanged += NumericTextBox_ValueChanged;

                        RAMFiltersStackPanel.Visibility = Visibility.Visible;
                        break;
                    case ComponentType.DataStorage:
                        TypeTextBlock.Text = "Хранение данных";
                        break;
                    case ComponentType.PowerSupply:
                        TypeTextBlock.Text = "Блок питания";
                        break;
                    default:
                        break;
                }
                SetPriceLimits();
                ManufacturerComboBox.ItemsSource = Manufacturers;
                ManufacturerComboBox.SelectedIndex = 0;
                ManufacturerComboBox.SelectionChanged += ComboBox_SelectionChanged;

                SearchTextBox.Text = searchTextBoxPlaceholder;
                SearchTextBox.TextChanged += SearchTextBox_TextChanged;

                SortComboBox.SelectionChanged += ComboBox_SelectionChanged;

                FillList();
            }
            catch (Exception ex)
            {
                FeedBack.ShowError(ex);
            }
        }

        private void SetPriceLimits()
        {
            var components = new List<Component>();
            switch (type)
            {
                case ComponentType.Processor:
                    components.AddRange(DAL.Context.Processors.Select(p => p.Component));
                    break;
                case ComponentType.MotherBoard:
                    components.AddRange(DAL.Context.MotherBoards.Select(p => p.Component));
                    break;
                case ComponentType.Case:
                    components.AddRange(DAL.Context.Cases.Select(p => p.Component));
                    break;
                case ComponentType.Videocard:
                    components.AddRange(DAL.Context.VideoCards.Select(p => p.Component));
                    break;
                case ComponentType.Cooler:
                    components.AddRange(DAL.Context.ProcessorCoolers.Select(p => p.Component));
                    break;
                case ComponentType.RAM:
                    components.AddRange(DAL.Context.RAMs.Select(p => p.Component));
                    break;
                case ComponentType.DataStorage:
                    components.AddRange(DAL.Context.DataStorages.Select(p => p.Component));
                    break;
                case ComponentType.PowerSupply:
                    components.AddRange(DAL.Context.PowerSupplies.Select(p => p.Component));
                    break;
                default:
                    break;
            }
            if (components.Count > 0)
            {
                MinPriceNumeric.MinValue = MaxPriceNumeric.MinValue = MinPriceNumeric.Value = MinPriceNumeric.DefaultValue = Convert.ToDouble(components.Min(c => c.Price));
                MinPriceNumeric.MaxValue = MaxPriceNumeric.MaxValue = MaxPriceNumeric.Value = MaxPriceNumeric.DefaultValue = Convert.ToDouble(components.Max(c => c.Price));
            }
        }

        private void SetProcFrequencyLimits()
        {
            var processors = DAL.Context.Processors.ToList();
            if (processors.Count > 0)
            {
                MinProcFrequencyNumeric.MinValue = MaxProcFrequencyNumeric.MinValue = MinProcFrequencyNumeric.Value = MinProcFrequencyNumeric.DefaultValue = Convert.ToDouble(processors.Min(c => c.BaseFrequency));
                MinProcFrequencyNumeric.MaxValue = MaxProcFrequencyNumeric.MaxValue = MaxProcFrequencyNumeric.Value = MaxProcFrequencyNumeric.DefaultValue = Convert.ToDouble(processors.Max(c => c.BaseFrequency));
            }
        }

        private void SetRAMFrequencyLimits()
        {
            var rams = DAL.Context.RAMs.ToList();
            if (rams.Count > 0)
            {
                MinRAMFrequencyNumeric.MinValue = MaxRAMFrequencyNumeric.MinValue = MinRAMFrequencyNumeric.Value = MinRAMFrequencyNumeric.DefaultValue = Convert.ToDouble(rams.Min(r => r.Frequency));
                MinRAMFrequencyNumeric.MaxValue = MaxRAMFrequencyNumeric.MaxValue = MaxRAMFrequencyNumeric.Value = MaxRAMFrequencyNumeric.DefaultValue = Convert.ToDouble(rams.Max(r => r.Frequency));
            }
        }

        public void CollapseList()
        {
            ComponentsBorder.Visibility = Visibility.Collapsed;
        }

        private void FillList()
        {
            if (FilteredComponents.Count > 0)
            {
                ComponentsList.Items.Clear();
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
                        configurator.DataStorage = null;
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
                Component = item as Component;
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
                        configurator.DataStorage = component.DataStorage;
                        break;
                    case ComponentType.PowerSupply:
                        configurator.PowerSupply = component.PowerSupply;
                        break;
                    default:
                        break;
                }
                ComponentsBorder.Visibility = Visibility.Collapsed;
            }
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
            if (MinPriceNumeric.Value > MaxPriceNumeric.Value)
            {
                var temp = MinPriceNumeric.Value;
                MinPriceNumeric.Value = MaxPriceNumeric.Value;
                MaxPriceNumeric.Value = temp;
            }
            else if (MinProcFrequencyNumeric.Value > MaxProcFrequencyNumeric.Value)
            {
                var temp = MinProcFrequencyNumeric.Value;
                MinProcFrequencyNumeric.Value = MaxProcFrequencyNumeric.Value;
                MaxProcFrequencyNumeric.Value = temp;
            }
            else if (MinRAMFrequencyNumeric.Value > MaxRAMFrequencyNumeric.Value)
            {
                var temp = MinRAMFrequencyNumeric.Value;
                MinRAMFrequencyNumeric.Value = MaxRAMFrequencyNumeric.Value;
                MaxRAMFrequencyNumeric.Value = temp;
            }
            FillList();
        }

        private void ComponentsBorder_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
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
    }
}
