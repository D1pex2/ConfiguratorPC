using ConfiguratorPC.Controls;
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
            ProcessorButton.Init(configurator, ComponentType.Processor);
            MotherBoardButton.Init(configurator, ComponentType.MotherBoard);
            CaseButton.Init(configurator, ComponentType.Case);
            VideoCardButton.Init(configurator, ComponentType.Videocard);
            CoolerButton.Init(configurator, ComponentType.Cooler);
            RAMButton.Init(configurator, ComponentType.RAM);
            MemoryButton.Init(configurator, ComponentType.DataStorage);
            PowerSupplyButton.Init(configurator, ComponentType.PowerSupply);
        }

        private void ComponentButton_ListOpened(object sender, EventArgs e)
        {
            List<ComponentButton> componentButtons = ConfigStackPanel.Children.OfType<ComponentButton>().ToList();
            var componentButton = sender as Controls.ComponentButton;
            componentButtons.Remove(componentButton);
            foreach (var item in componentButtons)
            {
                item.CollapseList();
            }
        }

        private void TitleBorder_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            DragMove();
        }

        private void CloseButton_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void MaxMinButton_Click(object sender, RoutedEventArgs e)
        {
            if (WindowState == WindowState.Normal)
            {
                WindowState = WindowState.Maximized;
            }
            else
            {
                WindowState = WindowState.Normal;
            }
        }

        private void HideButton_Click(object sender, RoutedEventArgs e)
        {
            WindowState = WindowState.Minimized;
        }

        private void ConfigWindow_StateChanged(object sender, EventArgs e)
        {
            if (WindowState == WindowState.Maximized)
            {
                MaxMinButtonImage.Source = new BitmapImage(new Uri("Resources/minimize.png", UriKind.Relative));
                TitleBorder.Height = 35;
                TitleDockPanel.Margin = new Thickness(5, 5, 5, 0);
                WindowScrollViewer.Margin = new Thickness(0, 0, 4, 0);
            }
            else if(WindowState == WindowState.Normal)
            {
                MaxMinButtonImage.Source = new BitmapImage(new Uri("Resources/maximize.png", UriKind.Relative));
                TitleBorder.Height =30;
                TitleDockPanel.Margin = WindowScrollViewer.Margin = new Thickness(0, 0, 0, 0);
            }
        }
    }
}