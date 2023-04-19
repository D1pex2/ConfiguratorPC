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

namespace ConfiguratorPC.Pages
{
    /// <summary>
    /// Логика взаимодействия для ConfiguratorPage.xaml
    /// </summary>
    public partial class ConfiguratorPage : Page
    {
        private Configurator configurator = new Configurator();

        public Configurator Configurator { get => configurator; set => configurator = value; }

        public ConfiguratorPage()
        {
            InitializeComponent();
            ProcessorConfigurator.Init(configurator, ComponentType.Processor);
            MotherBoardConfigurator.Init(configurator, ComponentType.MotherBoard);
            CaseConfigurator.Init(configurator, ComponentType.Case);
            VideoCardConfigurator.Init(configurator, ComponentType.Videocard);
            CoolerConfigurator.Init(configurator, ComponentType.Cooler);
            RAMConfigurator.Init(configurator, ComponentType.RAM);
            MemoryConfigurator.Init(configurator, ComponentType.DataStorage);
            PowerSupplyConfigurator.Init(configurator, ComponentType.PowerSupply);
        }

        private void ComponentConfigurator_ListOpened(object sender, EventArgs e)
        {
            List<ComponentConfigurator> componentButtons = ConfigStackPanel.Children.OfType<ComponentConfigurator>().ToList();
            componentButtons.AddRange(DataStorageStackPanel.Children.OfType<ComponentConfigurator>());
            var componentButton = sender as ComponentConfigurator;
            componentButtons.Remove(componentButton);
            foreach (var item in componentButtons)
            {
                item.CollapseList();
            }
        }

        private void HelpButton_Click(object sender, RoutedEventArgs e)
        {
            Navigator.Frame.Navigate(new HelpPage());
        }

        private void MemoryConfigurator_AddDataStorageConfigurator(object sender, EventArgs e)
        {
            if (configurator.CompatibleDataStorage.Count > 0 || DataStorageStackPanel.Children.Count < 2)
            {
                var dataStorageConfigurator = new ComponentConfigurator();
                dataStorageConfigurator.ListOpened += ComponentConfigurator_ListOpened;
                dataStorageConfigurator.AddDataStorageConfigurator += MemoryConfigurator_AddDataStorageConfigurator;
                dataStorageConfigurator.RemoveDataStorageConfigurator += MemoryConfigurator_RemoveDataStorageConfigurator;
                dataStorageConfigurator.Init(configurator, ComponentType.DataStorage);
                DataStorageStackPanel.Children.Add(dataStorageConfigurator);
            }
        }

        private void MemoryConfigurator_RemoveDataStorageConfigurator(object sender, EventArgs e)
        {
            List<ComponentConfigurator> dataStorageConfigurators = DataStorageStackPanel.Children.OfType<ComponentConfigurator>().ToList();
            if (dataStorageConfigurators.Where(c => c.Component == null).Count() > 0)
            {
                DataStorageStackPanel.Children.Remove(sender as ComponentConfigurator);
            }
        }
    }
}
