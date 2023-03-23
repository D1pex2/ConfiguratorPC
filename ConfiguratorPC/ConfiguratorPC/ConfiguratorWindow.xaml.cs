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

        private void ProcessorButton_ChangeComponent(object sender, EventArgs e)
        {
            Configurator.Processor = ProcessorButton.Component.Processor;
        }

        private void ProcessorButton_UpdateCompatibleComponents(object sender, EventArgs e)
        {
            try
            {
                ProcessorButton.CompatibleComponents = Configurator.CompatibleProcessors.Select(p => p.Component).ToList();
            }
            catch (Exception ex)
            {
                FeedBack.ShowError(ex);
            }
        }

        private void MotherBoardButton_DeleteComponent(object sender, EventArgs e)
        {
            Configurator.MotherBoard = null;
        }

        private void MotherBoardButton_ChangeComponent(object sender, EventArgs e)
        {
            Configurator.MotherBoard = MotherBoardButton.Component.MotherBoard;
        }

        private void MotherBoardButton_UpdateCompatibleComponents(object sender, EventArgs e)
        {
            try
            {
                MotherBoardButton.CompatibleComponents = Configurator.CompatibleMotherBoards.Select(m => m.Component).ToList();
            }
            catch (Exception ex)
            {
                FeedBack.ShowError(ex);
            }
        }

        private void ComponentButton_ListOpened(object sender, EventArgs e)
        {
            List<Controls.ComponentButton> componentButtons = ConfigStackPanel.Children.OfType<Controls.ComponentButton>().ToList();
            var componentButton = sender as Controls.ComponentButton;
            componentButtons.Remove(componentButton);
            foreach (var item in componentButtons)
            {
                item.CollapseList();
            }
        }
    }
}