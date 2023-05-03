using ConfiguratorPC.Controls;
using ConfiguratorPC.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Forms;
using Word = Microsoft.Office.Interop.Word;
using Excel = Microsoft.Office.Interop.Excel;
using Newtonsoft.Json;
using System.IO;
using System.Data.Entity.Core;

namespace ConfiguratorPC.Pages
{
    /// <summary>
    /// Логика взаимодействия для ConfiguratorPage.xaml
    /// </summary>
    public partial class ConfiguratorPage : Page
    {
        private List<Configurator> configurators = new List<Configurator>();

        private Configurator currentConfigurator;

        private readonly string path = $@"{Environment.CurrentDirectory}\\Configurators";

        public ConfiguratorPage()
        {
            InitializeComponent();
            DeserializeConfigurators();
            Init();
        }

        private void Init()
        {
            try
            {
                ProcessorConfigurator.Init(currentConfigurator, ComponentType.Processor);
                if (currentConfigurator.Processor != null)
                {
                    ProcessorConfigurator.Component = currentConfigurator.Processor.Component;
                }

                MotherBoardConfigurator.Init(currentConfigurator, ComponentType.MotherBoard);
                if (currentConfigurator.MotherBoard != null)
                {
                    MotherBoardConfigurator.Component = currentConfigurator.MotherBoard.Component;
                }

                CaseConfigurator.Init(currentConfigurator, ComponentType.Case);
                if (currentConfigurator.Case != null)
                {
                    CaseConfigurator.Component = currentConfigurator.Case.Component;
                }

                VideoCardConfigurator.Init(currentConfigurator, ComponentType.Videocard);
                if (currentConfigurator.VideoCard != null)
                {
                    VideoCardConfigurator.Component = currentConfigurator.VideoCard.Component;
                }

                CoolerConfigurator.Init(currentConfigurator, ComponentType.Cooler);
                if (currentConfigurator.ProcessorCooler != null)
                {
                    CoolerConfigurator.Component = currentConfigurator.ProcessorCooler.Component;
                }

                RAMConfigurator.Init(currentConfigurator, ComponentType.RAM);
                if (currentConfigurator.RAM != null)
                {
                    RAMConfigurator.Component = currentConfigurator.RAM.Component;
                    RAMConfigurator.NumericRam.MaxValue = currentConfigurator.MaxRAMQuantity;
                    RAMConfigurator.NumericRam.Value = currentConfigurator.RAMQuantity;
                    RAMConfigurator.NumericRam.Visibility = Visibility.Visible;
                }

                PowerSupplyConfigurator.Init(currentConfigurator, ComponentType.PowerSupply);
                if (currentConfigurator.PowerSupply != null)
                {
                    PowerSupplyConfigurator.Component = currentConfigurator.PowerSupply.Component;
                }

                MemoryConfigurator.Init(currentConfigurator, ComponentType.DataStorage);
                if (currentConfigurator.DataStorages != null && currentConfigurator.DataStorages.Count > 0)
                {
                    MemoryConfigurator.Component = currentConfigurator.DataStorages.First().Component;
                    for (int i = 1; i < currentConfigurator.DataStorages.Count; i++)
                    {
                        var conf = AddDataStorageConfigurator();
                        conf.ComponentChanged -= Configurator_ComponentChanged;
                        conf.Component = currentConfigurator.DataStorages[i].Component;
                    }
                }

                List<ComponentConfigurator> configurators = ConfigStackPanel.Children.OfType<ComponentConfigurator>().ToList();
                configurators.AddRange(DataStorageStackPanel.Children.OfType<ComponentConfigurator>().ToList());
                foreach (var config in configurators)
                {
                    config.ComponentChanged += Configurator_ComponentChanged;
                }
                if (currentConfigurator.CompatibleDataStorage.Count > 0)
                {
                    AddDataStorageConfigurator();
                }
            }
            catch (Exception ex) when (ex is EntityException)
            {
                FeedBack.ShowError("Ошибка подключение к базе данных. Обратитесь к системному администратору.");
                System.Windows.Application.Current.Shutdown();
            }
            catch (Exception ex)
            {
                FeedBack.ShowError(ex);
            }
        }

        private void SerializeConfigurator()
        {
            try
            {
                if (configurators.Count > 0)
                {
                    currentConfigurator.SetDataStoragesId();

                    Directory.CreateDirectory(path);
                    var settings = new JsonSerializerSettings { ReferenceLoopHandling = ReferenceLoopHandling.Ignore, NullValueHandling = NullValueHandling.Ignore };
                    string json = JsonConvert.SerializeObject(currentConfigurator, Formatting.Indented, settings);
                    File.WriteAllText($"{path}/{currentConfigurator.Name}.json", json);
                }
            }
            catch (Exception ex)
            {
                FeedBack.ShowError(ex);
            }
        }

        private void DeserializeConfigurators()
        {
            try
            {
                if (Directory.Exists(path) && Directory.GetFiles(path).Length > 0)
                {
                    foreach (var item in Directory.GetFiles(path))
                    {
                        configurators.Add(JsonConvert.DeserializeObject<Configurator>(File.ReadAllText(item)));
                    }
                    
                    if (configurators.Where(c => c.IsSelected).Count() > 0)
                    {
                        currentConfigurator = configurators.First(c => c.IsSelected);
                    }
                    else
                    {
                        currentConfigurator = configurators.First();
                    }
                }
                else
                {
                    configurators.Add(new Configurator());
                    currentConfigurator = configurators.First();
                }
                ConfiguratorsComboBox.ItemsSource = configurators;
                ConfiguratorsComboBox.SelectedItem = currentConfigurator;
            }
            catch (Exception ex)
            {
                configurators.Add(new Configurator());
                currentConfigurator = configurators.First();
                FeedBack.ShowError(ex);
            }
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
            if (currentConfigurator.CompatibleDataStorage.Count > 0 || DataStorageStackPanel.Children.Count < 2)
            {
                AddDataStorageConfigurator();
            }
        }

        private ComponentConfigurator AddDataStorageConfigurator()
        {
            var dataStorageConfigurator = new ComponentConfigurator();
            dataStorageConfigurator.ListOpened += ComponentConfigurator_ListOpened;
            dataStorageConfigurator.AddDataStorageConfigurator += MemoryConfigurator_AddDataStorageConfigurator;
            dataStorageConfigurator.RemoveDataStorageConfigurator += MemoryConfigurator_RemoveDataStorageConfigurator;
            dataStorageConfigurator.ComponentChanged += Configurator_ComponentChanged;
            dataStorageConfigurator.Init(currentConfigurator, ComponentType.DataStorage);
            DataStorageStackPanel.Children.Add(dataStorageConfigurator);
            return dataStorageConfigurator;
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
                            var doc = wordApp.Documents.Add($@"{Environment.CurrentDirectory}\\Resources\\template.docx");
                            doc.Content.Find.Execute(FindText: "%commonPrice%", ReplaceWith: $"{currentConfigurator.CommonPrice} руб.", Replace: Word.WdReplace.wdReplaceAll);

                            List<Component> skipList = new List<Component>();
                            foreach (var component in currentConfigurator.Components)
                            {
                                if (skipList.Any(c => c.Id == component.Id))
                                {
                                    continue;
                                }

                                var row = doc.Tables[1].Rows.Add();
                                row.Cells[1].Range.ParagraphFormat.Alignment = Word.WdParagraphAlignment.wdAlignParagraphLeft;

                                var sameComponents = currentConfigurator.Components.Where(c => c.Id == component.Id).ToList();

                                if(sameComponents.Count > 1)
                                {
                                    row.Cells[1].Range.Text = $"{component.Name} {sameComponents.Count} шт.";
                                    row.Cells[2].Range.Text = (component.Price * sameComponents.Count).ToString();
                                    skipList.Add(component);
                                }
                                else if (component.RAM != null)
                                {
                                    row.Cells[1].Range.Text = $"{component.Name} {currentConfigurator.RAMQuantity} шт.";
                                    row.Cells[2].Range.Text = (component.Price * currentConfigurator.RAMQuantity).ToString();
                                }
                                else
                                {
                                    row.Cells[1].Range.Text = component.Name;
                                    row.Cells[2].Range.Text = component.Price.ToString();
                                }
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

                            sheet.Cells[2][1] = "Конфигурация сборки ПК";
                            sheet.Cells[2][1].Font.Bold = 1;

                            sheet.Cells[1][3] = "№";
                            sheet.Cells[2][3] = "Наименование";
                            sheet.Cells[3][3] = "Стоимость руб.";
                            var titleColumnsRange = sheet.range[sheet.Cells[1][3], sheet.Cells[3][3]];
                            titleColumnsRange.Font.Bold = 1;
                            titleColumnsRange.Borders.LineStyle = Excel.XlLineStyle.xlContinuous;

                            skipList = new List<Component>();
                            int i = 0;
                            int num = 0;
                            for (i = 0; i < currentConfigurator.Components.Count; i++)
                            {
                                var component = currentConfigurator.Components[i];

                                if (skipList.Any(c => c.Id == component.Id))
                                {
                                    continue;
                                }

                                sheet.Cells[1][num + 4] = num + 1;

                                var sameComponents = currentConfigurator.Components.Where(c => c.Id == component.Id).ToList();

                                if (sameComponents.Count > 1)
                                {
                                    sheet.Cells[2][num + 4] = $"{component.Name} {sameComponents.Count} шт.";
                                    sheet.Cells[3][num + 4] = (component.Price * sameComponents.Count).ToString();
                                    skipList.Add(component);
                                }
                                else if (component.RAM != null)
                                {
                                    sheet.Cells[2][num + 4] = $"{component.Name} {currentConfigurator.RAMQuantity} шт.";
                                    sheet.Cells[3][num + 4] = (component.Price * currentConfigurator.RAMQuantity).ToString();
                                }
                                else
                                {
                                    sheet.Cells[2][num + 4] = component.Name;
                                    sheet.Cells[3][num + 4] = component.Price.ToString();
                                }

                                var row = sheet.range[sheet.Cells[1][num + 5], sheet.Cells[3][num + 4]];
                                row.Borders.LineStyle = Excel.XlLineStyle.xlContinuous;

                                num++;
                            }

                            sheet.Cells[2][num + 4] = "Общая стоимость:";
                            sheet.Cells[3][num + 4] = currentConfigurator.CommonPrice.ToString();

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

        private void AddConfiguratorButton_Click(object sender, RoutedEventArgs e)
        {

        }

        private void EditConfiguratorButton_Click(object sender, RoutedEventArgs e)
        {

        }

        private void DeleteConfiguratorButton_Click(object sender, RoutedEventArgs e)
        {

        }

        private void ConfiguratorsComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }

        private void Configurator_ComponentChanged(object sender, EventArgs e)
        {
            SerializeConfigurator();
        }
    }
}
