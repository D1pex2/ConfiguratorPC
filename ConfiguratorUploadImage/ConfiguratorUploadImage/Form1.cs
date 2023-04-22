using Aspose.Imaging;
using Aspose.Imaging.FileFormats.Jpeg;
using Aspose.Imaging.ImageOptions;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ConfiguratorUploadImage
{
    public partial class Form1 : Form
    {
        ConfiguratorPCEntities configuratorPCEntities = new ConfiguratorPCEntities();

        public Form1()
        {
            InitializeComponent();
            try
            {
                componentsComboBox.DataSource = configuratorPCEntities.Components.ToList();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void BrowseButton_Click(object sender, EventArgs e)
        {
            OpenFileDialog openFileDialog = new OpenFileDialog();
            if (openFileDialog.ShowDialog() == DialogResult.OK)
            {
                pathTextBox.Text = openFileDialog.FileName;
            }
        }

        private void UploadButton_Click(object sender, EventArgs e)
        {
            try
            {
                var component = componentsComboBox.SelectedItem as Component;
                using (MemoryStream stream = new MemoryStream(File.ReadAllBytes(pathTextBox.Text)))
                {
                    using (var original = Image.Load(stream))
                    {
                        var jpegOptions = new JpegOptions()
                        {
                            ColorType = JpegCompressionColorMode.Rgb,
                            CompressionType = JpegCompressionMode.Progressive,
                        };
                        original.Save(stream, jpegOptions);
                    }
                     component.Pictures.Add(new Picture { Picture1 = stream.ToArray() });
                }
                configuratorPCEntities.SaveChanges();
                MessageBox.Show("Загружено");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void DeleteAllButton_Click(object sender, EventArgs e)
        {
            try
            {
                var component = componentsComboBox.SelectedItem as Component;
                configuratorPCEntities.Pictures.RemoveRange(component.Pictures);
                configuratorPCEntities.SaveChanges();
                MessageBox.Show("Удалено");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void CompressButton_Click(object sender, EventArgs e)
        {
            var component = componentsComboBox.SelectedItem as Component;
            foreach (var pic in component.Pictures)
            {
                using (MemoryStream stream = new MemoryStream(pic.Picture1))
                {
                    using (var original = Image.Load(stream))
                    {
                        var jpegOptions = new JpegOptions()
                        {
                            ColorType = JpegCompressionColorMode.Rgb,
                            CompressionType = JpegCompressionMode.Progressive,
                        };
                        original.Save(stream, jpegOptions);
                    }
                    pic.Picture1 = stream.ToArray();
                }
            }
            configuratorPCEntities.SaveChanges();
            MessageBox.Show("Сжато");
        }
    }
}
