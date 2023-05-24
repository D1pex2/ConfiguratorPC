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
            ConfiguratorsComboBox.SelectedItem = currentConfigurator;
            UpdateConfiguratorsList();
        }

        private void Init()
        {
            try
            {
                currentConfigurator.ConfiguratorPropertyChanged -= CurrentConfigurator_ConfiguratorPropertyChanged;
                currentConfigurator.ProcessorChanged -= CurrentConfigurator_ProcessorChanged;
                currentConfigurator.MotherBoardChanged -= CurrentConfigurator_MotherBoardChanged;
                currentConfigurator.RAMChanged -= CurrentConfigurator_RAMChanged;

                ProcessorConfigurator.Init(currentConfigurator, ComponentType.Processor);
                ProcessorConfigurator.Component = currentConfigurator.Processor == null ? null : currentConfigurator.Processor.Component;

                MotherBoardConfigurator.Init(currentConfigurator, ComponentType.MotherBoard);
                MotherBoardConfigurator.Component = currentConfigurator.MotherBoard == null ? null : currentConfigurator.MotherBoard.Component;

                CaseConfigurator.Init(currentConfigurator, ComponentType.Case);
                CaseConfigurator.Component = currentConfigurator.Case == null ? null : currentConfigurator.Case.Component;

                VideoCardConfigurator.Init(currentConfigurator, ComponentType.Videocard);
                VideoCardConfigurator.Component = currentConfigurator.VideoCard == null ? null : currentConfigurator.VideoCard.Component;

                CoolerConfigurator.Init(currentConfigurator, ComponentType.Cooler);
                CoolerConfigurator.Component = currentConfigurator.ProcessorCooler == null ? null : currentConfigurator.ProcessorCooler.Component;

                RAMConfigurator.Init(currentConfigurator, ComponentType.RAM);
                if (currentConfigurator.RAM != null)
                {
                    RAMConfigurator.Component = currentConfigurator.RAM.Component;
                    RAMConfigurator.NumericRam.MaxValue = currentConfigurator.MaxRAMQuantity;
                    RAMConfigurator.NumericRam.Value = currentConfigurator.RAMQuantity;
                    RAMConfigurator.NumericRam.Visibility = Visibility.Visible;
                }
                else
                {
                    RAMConfigurator.Component = null;
                    RAMConfigurator.NumericRam.Visibility = Visibility.Collapsed;
                }

                PowerSupplyConfigurator.Init(currentConfigurator, ComponentType.PowerSupply);
                PowerSupplyConfigurator.Component = currentConfigurator.PowerSupply == null ? null : currentConfigurator.PowerSupply.Component;

                if (DataStorageStackPanel.Children.Count > 1)
                {
                    List<ComponentConfigurator> componentConfigurators = DataStorageStackPanel.Children.OfType<ComponentConfigurator>().ToList();
                    componentConfigurators.Remove(MemoryConfigurator);
                    foreach (var item in componentConfigurators)
                    {
                        DataStorageStackPanel.Children.Remove(item);
                    }
                }

                MemoryConfigurator.Init(currentConfigurator, ComponentType.DataStorage);
                if (currentConfigurator.DataStorages != null && currentConfigurator.DataStorages.Count > 0)
                {
                    MemoryConfigurator.Component = currentConfigurator.DataStorages.First().Component;
                    for (int i = 1; i < currentConfigurator.DataStorages.Count; i++)
                    {
                        var conf = AddDataStorageConfigurator();
                        conf.Component = currentConfigurator.DataStorages[i].Component;
                    }
                }
                else
                {
                    MemoryConfigurator.Component = null;
                }

                if (currentConfigurator.CompatibleDataStorage.Count > 0 && currentConfigurator.DataStorages.Count > 0)
                {
                    AddDataStorageConfigurator();
                }
                SetCommonPrice();
                currentConfigurator.ConfiguratorPropertyChanged += CurrentConfigurator_ConfiguratorPropertyChanged;
                currentConfigurator.ProcessorChanged += CurrentConfigurator_ProcessorChanged;
                currentConfigurator.MotherBoardChanged += CurrentConfigurator_MotherBoardChanged;
                currentConfigurator.RAMChanged += CurrentConfigurator_RAMChanged;
            }
            catch (Exception ex)
            {
                FeedBack.ShowError(ex);
            }
        }

        private void CurrentConfigurator_RAMChanged(object sender, EventArgs e)
        {
            if (currentConfigurator.RAM != null)
            {
                ShowNotify("Несмотря на электрическую, логическую и физическую совместимость по разъему, рекомендовано дополнительно перепроверить совместимость конкретной оперативной памяти с выбранной вами материнской платой.");
            }
        }

        private void CurrentConfigurator_MotherBoardChanged(object sender, EventArgs e)
        {
            if (currentConfigurator.MotherBoard != null && currentConfigurator.MotherBoard.EmbeddedProcessor != null)
            {
                ShowNotify("Выбранная материнская плата имеет встроенный процессор с системой пассивного охлаждения на основе радиатора.");
            }
        }

        private void CurrentConfigurator_ProcessorChanged(object sender, EventArgs e)
        {
            if (currentConfigurator.Processor != null && currentConfigurator.Processor.HasCooler)
            {
                ShowNotify("В комплекте к процессору идёт штатный кулер, и система охлаждения теперь не обязательна для завершения сборки. Однако помните, что штатные системы охлаждения обладают ограниченными возможностями и могут не справиться с длительной нагрузкой в ресурсоёмких приложениях и играх.");
            }
        }

        private void SerializeConfigurator()
        {
            try
            {
                if (configurators.Count > 0)
                {
                    Directory.CreateDirectory(this.path);
                    var settings = new JsonSerializerSettings { ReferenceLoopHandling = ReferenceLoopHandling.Ignore, NullValueHandling = NullValueHandling.Ignore };
                    string json = JsonConvert.SerializeObject(currentConfigurator, Formatting.Indented, settings);
                    File.WriteAllText($@"{path}\\{currentConfigurator.Name}.json", json);
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
                    
                }
                else
                {
                    configurators.Add(new Configurator());
                }
                currentConfigurator = configurators.FirstOrDefault();
            }
            catch (Exception ex)
            {
                configurators.Add(new Configurator());
                currentConfigurator = configurators.First();
                FeedBack.ShowError(ex);
            }
        }

        private void CurrentConfigurator_ConfiguratorPropertyChanged(object sender, EventArgs e)
        {
            SetCommonPrice();
            SerializeConfigurator();
        }

        private void SetCommonPrice()
        {
            if (currentConfigurator.CommonPrice == 0)
            {
                CommonPriceTextBlock.Text = "";
            }
            else
            {
                CommonPriceTextBlock.Text = $"Общая стоимость: {currentConfigurator.CommonPrice} руб.";
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

        private void CreateNewConfigurator(string name = null)
        {
            Configurator configurator = name == null ? new Configurator() : new Configurator(name);
            configurators.Add(configurator);
            UpdateConfiguratorsList();
            ConfiguratorsComboBox.SelectedItem = configurator;
            SerializeConfigurator();
        }

        private void UpdateConfiguratorsList()
        {
            ConfiguratorsComboBox.SelectionChanged -= ConfiguratorsComboBox_SelectionChanged;
            ConfiguratorsComboBox.Items.Clear();
            foreach (var configurator in configurators)
            {
                ConfiguratorsComboBox.Items.Add(configurator);
            }
            ConfiguratorsComboBox.SelectionChanged += ConfiguratorsComboBox_SelectionChanged;
        }

        private void AddConfiguratorButton_Click(object sender, RoutedEventArgs e)
        {
            var textDialog = new TextDialogWindow("Введите наименование новой конфигурации:");
            textDialog.ShowDialog();
            var name = textDialog.Message;
            if (textDialog.DialogResult != true)
                return;
            if (String.IsNullOrWhiteSpace(name))
            {
                FeedBack.ShowMessage($"Наименование конфигурации не должно быть пустым");
                return;
            }
            if (configurators.Any(c => c.Name == name))
            {
                FeedBack.ShowMessage($"Наименование \"{name}\" занято другой конфигурацией");
                return;
            }
            CreateNewConfigurator(name);
        }

        private void EditConfiguratorButton_Click(object sender, RoutedEventArgs e)
        {
            var textDialog = new TextDialogWindow($"Переименуйте конфигурацию \"{currentConfigurator.Name}\":");
            textDialog.ShowDialog();
            var name = textDialog.Message;
            if (textDialog.DialogResult != true)
                return;
            if (configurators.Any(c => c.Name == name))
            {
                FeedBack.ShowMessage("Имя занято");
                return;
            }
            File.Delete($@"{path}\\{currentConfigurator.Name}.json");
            currentConfigurator.Name = name;
            UpdateConfiguratorsList();
            ConfiguratorsComboBox.SelectedItem = currentConfigurator;
        }

        private void DeleteConfiguratorButton_Click(object sender, RoutedEventArgs e)
        {
            var message = new MessageWindow("Сообщение", $"Вы уверены что хотите удалить сборку \"{currentConfigurator.Name}\"?");
            message.ShowDialog();
            if (message.DialogResult != true)
            {
                return;
            }
            configurators.Remove(currentConfigurator);
            File.Delete($@"{path}\\{currentConfigurator.Name}.json");
            if (configurators.Count == 0)
            {
                CreateNewConfigurator();
            }
            else
            {
                UpdateConfiguratorsList();
                ConfiguratorsComboBox.SelectedIndex = 0;
            }
        }

        private void ConfiguratorsComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            currentConfigurator = ConfiguratorsComboBox.SelectedItem as Configurator;
            Init();
        }

        private void Configurator_ComponentChanged(object sender, EventArgs e)
        {
            SerializeConfigurator();
        }

        private void CloseNotify_MouseLeftButtonDown(object sender, System.Windows.Input.MouseButtonEventArgs e)
        {
            NotifyGrid.Visibility = Visibility.Collapsed;
        }

        private void ShowNotify(string message)
        {
            NotifyTextBlock.Text = message;
            NotifyGrid.Visibility = Visibility.Visible;
        }
    }
}
