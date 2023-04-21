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
using System.Windows.Forms;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using Word = Microsoft.Office.Interop.Word;
using Excel = Microsoft.Office.Interop.Excel;
using System.IO;

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

        private void ExportButton_Click(object sender, RoutedEventArgs e)
        {
            SaveFileDialog saveFileDialog = new SaveFileDialog();
            saveFileDialog.Filter = "Документ Word (docx)|*.docx|Документ PDF (pdf)|*.pdf|Таблица Excel (xlsx)|*.xlsx";
            if (saveFileDialog.ShowDialog() == DialogResult.OK)
            {
                try
                {
                    var extension = System.IO.Path.GetExtension(saveFileDialog.FileName);
                    switch (extension)
                    {
                        case ".docx":
                        case ".pdf":
                            var wordApp = new Word.Application();
                            var doc = wordApp.Documents.Add($@"{Environment.CurrentDirectory}\template.docx");
                            doc.Content.Find.Execute(FindText: "%commonPrice%", ReplaceWith: $"{configurator.CommonPrice} руб.", Replace: Word.WdReplace.wdReplaceAll);
                            foreach (var component in configurator.Components)
                            {
                                var row = doc.Tables[1].Rows.Add();
                                row.Cells[1].Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphLeft;
                                if (component.RAM != null)
                                {
                                    row.Cells[1].Range.Text = $"{component.Name} {configurator.RAMQuantity} шт.";
                                }
                                else
                                {
                                    row.Cells[1].Range.Text = component.Name;
                                }
                                row.Cells[2].Range.Text = component.Price.ToString();
                            }
                            doc.Tables[1].Rows[1].Borders[Word.WdBorderType.wdBorderBottom].LineStyle = Word.WdLineStyle.wdLineStyleDouble;
                            var wordExtension = Word.WdSaveFormat.wdFormatDocumentDefault;
                            if (extension == ".pdf")
                                wordExtension = Word.WdSaveFormat.wdFormatPDF;
                            doc.SaveAs(saveFileDialog.FileName, wordExtension);
                            wordApp.Quit();
                            break;
                        case ".xlsx":
                            var excelApp = new Excel.Application();
                            var workbook = excelApp.Workbooks.Add();
                            var sheet = workbook.Worksheets[1];

                            sheet.Cells[1][1] = "Cборка ПК";

                            sheet.Cells[1][3] = "Наименование";
                            sheet.Cells[2][3] = "Стоимость руб.";
                            var titleColumnsRange = sheet.range[sheet.Cells[1][3], sheet.Cells[2][3]];
                            titleColumnsRange.Font.Bold = 1;
                            titleColumnsRange.Borders.LineStyle = Excel.XlLineStyle.xlContinuous;

                            int i = 0;
                            for (i = 0; i < configurator.Components.Count; i++)
                            {
                                var component = configurator.Components[i];
                                if (component.RAM != null)
                                {
                                    sheet.Cells[1][i + 4] = $"{component.Name} {configurator.RAMQuantity} шт.";
                                }
                                else
                                {
                                    sheet.Cells[1][i + 4] = component.Name;
                                }
                                sheet.Cells[2][i + 4] = component.Price.ToString();

                                var row = sheet.range[sheet.Cells[1][i + 4], sheet.Cells[2][i + 4]];
                                row.Borders.LineStyle = Excel.XlLineStyle.xlContinuous;
                            }

                            sheet.Cells[1][i + 5] = "Общая стоимость:";
                            sheet.Cells[2][i + 5] = $"{configurator.CommonPrice} руб.";

                            sheet.Columns.Autofit();

                            workbook.SaveAs(saveFileDialog.FileName);
                            excelApp.Quit();
                            break;
                        default:
                            FeedBack.ShowMessage("Не удалось сохранить сборку ПК");
                            return;
                    }
                    FeedBack.ShowMessage($"Сборка ПК сохранена по пути: {saveFileDialog.FileName}");
                }
                catch (Exception ex)
                {
                    FeedBack.ShowError(ex);
                }
            }
        }
    }
}
