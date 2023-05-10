using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ConfiguratorPCManager
{
    public partial class MainForm : Form
    {
        public MainForm()
        {
            InitializeComponent();
        }

        private void MainForm_Load(object sender, EventArgs e)
        {
            // TODO: данная строка кода позволяет загрузить данные в таблицу "configuratorPCDataSet.Manufacturer". При необходимости она может быть перемещена или удалена.
            this.manufacturerTableAdapter.Fill(this.configuratorPCDataSet.Manufacturer);
            // TODO: данная строка кода позволяет загрузить данные в таблицу "configuratorPCDataSet.Processor". При необходимости она может быть перемещена или удалена.
            this.processorTableAdapter.Fill(this.configuratorPCDataSet.Processor);
            // TODO: данная строка кода позволяет загрузить данные в таблицу "configuratorPCDataSet.Component". При необходимости она может быть перемещена или удалена.
            this.componentTableAdapter.Fill(this.configuratorPCDataSet.Component);

        }

        private void componentSaveButton_Click(object sender, EventArgs e)
        {
            try
            {
                this.Validate();
                this.componentBindingSource.EndEdit();
                this.tableAdapterManager.UpdateAll(this.configuratorPCDataSet);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void processorBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            try
            {
                this.Validate();
                this.processorBindingSource.EndEdit();
                this.tableAdapterManager.UpdateAll(this.configuratorPCDataSet);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void manufacturerSaveButton_Click(object sender, EventArgs e)
        {
            try
            {
                this.Validate();
                this.manufacturerBindingSource.EndEdit();
                this.tableAdapterManager.UpdateAll(this.configuratorPCDataSet);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Ошибка", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void processorDataGridView_DataError(object sender, DataGridViewDataErrorEventArgs e)
        {

        }

        private void componentDataGridView_DataError(object sender, DataGridViewDataErrorEventArgs e)
        {

        }

        private void manufacturerDataGridView_DataError(object sender, DataGridViewDataErrorEventArgs e)
        {

        }
    }
}
