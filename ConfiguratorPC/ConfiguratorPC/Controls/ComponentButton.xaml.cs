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

        public event EventHandler ComponentAdded;

        public event EventHandler ComponentDeleted;

        public event EventHandler UpdateCompatibleComponents;

        private string searchTextBoxPlaceholder = "Поиск по наименованию...";

        public List<Component> CompatibleComponents { get; set; }

        public List<Component> FilteredComponents
        {
            get
            {
                var filtered = new List<Component>();
                filtered.AddRange(CompatibleComponents);
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

        public string ComponentTypeLabel { get => TypeTextBlock.Text; set => TypeTextBlock.Text = value; }

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
                UpdateCompatibleComponents?.Invoke(this, EventArgs.Empty);
                SetPriceLimits();
                FillList();
                ComponentsBorder.Visibility = Visibility.Visible;
            }
            else
            {
                ComponentDeleted?.Invoke(this, EventArgs.Empty);
                Component = null;
                ListOpened?.Invoke(this, EventArgs.Empty);
            }
        }

        private void ComponentsList_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
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

        private void AddComponentButton_Click(object sender, RoutedEventArgs e)
        {
            var item = (sender as Button).DataContext;
            if (item != null)
            {
                Component = item as Component;
                ComponentAdded?.Invoke(this, EventArgs.Empty);
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
    }
}
