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

        public ComponentButton()
        {
            InitializeComponent();
            SearchTextBox.Text = searchTextBoxPlaceholder;
            SearchTextBox.TextChanged += SearchTextBox_TextChanged;
            SortComboBox.SelectionChanged += SortComboBox_SelectionChanged;
        }

        public void Init(Configurator configurator, ComponentType type)
        {
            this.configurator = configurator;
            this.type = type;
            switch (type)
            {
                case ComponentType.Processor:
                    TypeTextBlock.Text = "Процессор";
                    break;
                case ComponentType.MotherBoard:
                    TypeTextBlock.Text = "Материнская плата";
                    break;
                case ComponentType.Case:
                    TypeTextBlock.Text = "Корпус";
                    break;
                case ComponentType.Videocard:
                    TypeTextBlock.Text = "Видеокарта";
                    break;
                case ComponentType.Cooler:
                    TypeTextBlock.Text = "Охлаждение процессора";
                    break;
                case ComponentType.RAM:
                    TypeTextBlock.Text = "Оперативная память";
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
        }

        private void SetPriceLimits()
        {
            if (CompatibleComponents != null && CompatibleComponents.Count > 0)
            {
                MinPriceNumeric.MinValue = MaxPriceNumeric.MinValue = MinPriceNumeric.Value = Convert.ToDouble(CompatibleComponents.Min(c => c.Price));
                MinPriceNumeric.MaxValue = MaxPriceNumeric.MaxValue = MaxPriceNumeric.Value = Convert.ToDouble(CompatibleComponents.Max(c => c.Price));
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
                SetPriceLimits();
                SearchTextBox.Text = searchTextBoxPlaceholder;
                SortComboBox.SelectedIndex = 0;
                FillList();
                ComponentsBorder.Visibility = Visibility.Visible;
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

        private void SortComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            FillList();
        }

        private void PriceNumeric_ValueChanged(object sender, EventArgs e)
        {
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
    }
}
