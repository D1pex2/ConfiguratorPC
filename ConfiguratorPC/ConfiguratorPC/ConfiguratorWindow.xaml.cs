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

namespace ConfiguratorPC
{
    /// <summary>
    /// Логика взаимодействия для ConfiguratorWindow.xaml
    /// </summary>
    public partial class ConfiguratorWindow : Window
    {
        private Configurator configurator = new Configurator();

        public Configurator Configurator { get => configurator; set => configurator = value; }

        public ConfiguratorWindow()
        {
            InitializeComponent();
        }

        private void ProcessorButton_DeleteComponent(object sender, EventArgs e)
        {
            Configurator.Processor = null;
        }

        private void MotherBoardButton_DeleteComponent(object sender, EventArgs e)
        {
            Configurator.MotherBoard = null;
        }

        private void ProcessorButton_ChangeComponent(object sender, EventArgs e)
        {
            if (ProcessorsList.Visibility == Visibility.Collapsed)
            {
                ProcessorsList.Items.Clear();
                foreach (var item in Configurator.CompatibleProcessors)
                {
                    ProcessorsList.Items.Add(item);
                }
                ProcessorsList.Visibility = Visibility.Visible;
            }
            else
            {
                ProcessorsList.Visibility = Visibility.Collapsed;
            }
        }

        private void MotherBoardButton_ChangeComponent(object sender, EventArgs e)
        {
            if (MotherBoardsList.Visibility == Visibility.Collapsed)
            {
                MotherBoardsList.Items.Clear();
                foreach (var item in Configurator.CompatibleMotherBoards)
                {
                    MotherBoardsList.Items.Add(item);
                }
                MotherBoardsList.Visibility = Visibility.Visible;
            }
            else
            {
                MotherBoardsList.Visibility = Visibility.Collapsed;
            }
        }

        private void ProcessorsList_PreviewMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            var item = ProcessorsList.SelectedItem;
            if (item != null)
            {
                Processor processor = item as Processor;
                Configurator.Processor = processor;
                ProcessorButton.Component = processor.Component;
                ProcessorsList.Visibility = Visibility.Collapsed;
            }
        }

        private void MotherBoardsList_PreviewMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            var item = MotherBoardsList.SelectedItem;
            if (item != null)
            {
                MotherBoard motherBoard = item as MotherBoard;
                Configurator.MotherBoard = motherBoard;
                MotherBoardButton.Component = motherBoard.Component;
                MotherBoardsList.Visibility = Visibility.Collapsed;
            }
        }

        private void List_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            List<ListView> listViews = ConfigStackPanel.Children.OfType<ListView>().ToList();
            var senderListView = sender as ListView;
            listViews.Remove(senderListView);
            foreach (var item in listViews)
            {
                item.IsVisibleChanged -= List_IsVisibleChanged;
                item.Visibility = Visibility.Collapsed;
                item.IsVisibleChanged += List_IsVisibleChanged;
            }
        }
    }
}
