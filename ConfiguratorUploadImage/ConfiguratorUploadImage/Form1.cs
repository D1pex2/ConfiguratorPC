using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
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
                component.Picture = File.ReadAllBytes(pathTextBox.Text);
                configuratorPCEntities.SaveChanges();
                MessageBox.Show("Загружено");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}
