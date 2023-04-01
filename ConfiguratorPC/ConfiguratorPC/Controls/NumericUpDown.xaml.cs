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

namespace ConfiguratorPC.Controls
{
    /// <summary>
    /// Логика взаимодействия для NumericUpDown.xaml
    /// </summary>
    public partial class NumericUpDown : UserControl
    {
        public event EventHandler ValueChanged;

        private int value;

        public int Value 
        { 
            get => value;
            set
            {
                if (value >= MinValue && value <= MaxValue)
                {
                    this.value = value;
                    NumTextBox.Text = this.value.ToString();
                    ValueChanged?.Invoke(this, EventArgs.Empty);
                }
            }
        }

        public int Step { get; set; } = 1;

        public int MaxValue { get; set; } = int.MaxValue;

        public int MinValue { get; set; } = int.MinValue;

        public NumericUpDown()
        {
            InitializeComponent();
        }

        private void DecreaseButton_Click(object sender, RoutedEventArgs e)
        {
            Value -= Step;
        }

        private void IncreaseButton_Click(object sender, RoutedEventArgs e)
        {
            Value += Step;
        }
    }
}
