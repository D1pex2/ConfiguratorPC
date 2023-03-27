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

        private void ComponentButton_ListOpened(object sender, EventArgs e)
        {
            List<Controls.ComponentButton> componentButtons = new List<Controls.ComponentButton>();
            foreach (ListViewItem item in ConfigListView.Items)
            {
                componentButtons.Add(item.Content as Controls.ComponentButton);
            }
            var componentButton = sender as Controls.ComponentButton;
            componentButtons.Remove(componentButton);
            foreach (var item in componentButtons)
            {
                item.CollapseList();
            }
        }

        private void ProcessorButton_ComponentAdded(object sender, EventArgs e)
        {
            Configurator.Processor = ProcessorButton.Component.Processor;
        }

        private void ProcessorButton_ComponentDeleted(object sender, EventArgs e)
        {
            Configurator.Processor = null;
        }

        private void MotherBoardButton_ComponentAdded(object sender, EventArgs e)
        {
            Configurator.MotherBoard = MotherBoardButton.Component.MotherBoard;
        }

        private void MotherBoardButton_ComponentDeleted(object sender, EventArgs e)
        {
            Configurator.MotherBoard = null;
        }

        private void CaseButton_ComponentAdded(object sender, EventArgs e)
        {
            Configurator.Case = CaseButton.Component.Case;
        }

        private void CaseButton_ComponentDeleted(object sender, EventArgs e)
        {
            Configurator.Case = null;
        }

        private void VideoCardButton_ComponentAdded(object sender, EventArgs e)
        {
            Configurator.VideoCard = VideoCardButton.Component.VideoCard;
        }

        private void VideoCardButton_ComponentDeleted(object sender, EventArgs e)
        {
            Configurator.VideoCard = null;
        }

        private void CoolerButton_ComponentAdded(object sender, EventArgs e)
        {
            Configurator.ProcessorCooler = CoolerButton.Component.ProcessorCooler;
        }

        private void CoolerButton_ComponentDeleted(object sender, EventArgs e)
        {
            Configurator.ProcessorCooler = null;
        }

        private void RAMButton_ComponentAdded(object sender, EventArgs e)
        {
            Configurator.RAM = RAMButton.Component.RAM;
        }

        private void RAMButton_ComponentDeleted(object sender, EventArgs e)
        {
            Configurator.RAM = null;
        }

        private void MemoryButton_ComponentAdded(object sender, EventArgs e)
        {
            Configurator.DataStorage = MemoryButton.Component.DataStorage;
        }

        private void MemoryButton_ComponentDeleted(object sender, EventArgs e)
        {
            Configurator.DataStorage = null;
        }

        private void PowerSupplyButton_ComponentAdded(object sender, EventArgs e)
        {
            Configurator.PowerSupply = PowerSupplyButton.Component.PowerSupply;
        }

        private void PowerSupplyButton_ComponentDeleted(object sender, EventArgs e)
        {
            Configurator.PowerSupply = null;
        }

        private void ProcessorButton_UpdateCompatibleComponents(object sender, EventArgs e)
        {
            ProcessorButton.CompatibleComponents = Configurator.CompatibleProcessors.Select(p => p.Component).ToList();
        }

        private void MotherBoardButton_UpdateCompatibleComponents(object sender, EventArgs e)
        {
            MotherBoardButton.CompatibleComponents = Configurator.CompatibleMotherBoards.Select(m => m.Component).ToList();
        }

        private void CaseButton_UpdateCompatibleComponents(object sender, EventArgs e)
        {
            CaseButton.CompatibleComponents = Configurator.CompatibleCases.Select(c => c.Component).ToList();
        }

        private void VideoCardButton_UpdateCompatibleComponents(object sender, EventArgs e)
        {
            VideoCardButton.CompatibleComponents = Configurator.CompatibleVideoCards.Select(v => v.Component).ToList();
        }

        private void CoolerButton_UpdateCompatibleComponents(object sender, EventArgs e)
        {
            CoolerButton.CompatibleComponents = Configurator.CompatibleProcessorCooler.Select(pc => pc.Component).ToList();
        }

        private void RAMButton_UpdateCompatibleComponents(object sender, EventArgs e)
        {
            RAMButton.CompatibleComponents = Configurator.CompatibleRAMs.Select(r => r.Component).ToList();
        }

        private void MemoryButton_UpdateCompatibleComponents(object sender, EventArgs e)
        {
            MemoryButton.CompatibleComponents = Configurator.CompatibleDataStorage.Select(ds => ds.Component).ToList();
        }

        private void PowerSupplyButton_UpdateCompatibleComponents(object sender, EventArgs e)
        {
            PowerSupplyButton.CompatibleComponents = Configurator.CompatiblePowerSupply.Select(p => p.Component).ToList();
        }
    }
}