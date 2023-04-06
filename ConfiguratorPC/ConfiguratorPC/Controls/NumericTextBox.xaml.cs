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
    public partial class NumericTextBox : UserControl
    {
        private double minValue = 0;

        public double DefaultValue { get; set; } = 0;

        public double MinValue { get => minValue; set => minValue = value; }

        private double maxValue = double.MaxValue;

        public double MaxValue { get => maxValue; set => maxValue = value; }

        private double value = 0;

        public double Value
        { 
            get => value; 
            set
            {
                this.value = value;
                NumTextBox.Text = String.Format("{0:F2}", this.value);
            }
        }

        public event EventHandler ValueChanged;

        public event EventHandler ResetValueButtonClick;

        public NumericTextBox()
        {
            InitializeComponent();
            Value = MinValue;
        }

        private void NumericTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (!double.TryParse(NumTextBox.Text, out value))
            {
                NumTextBox.Text = String.Format("{0:F2}", value);
            }
        }

        private void EnterValue()
        {
            if (Value < MinValue)
            {
                Value = MinValue;
            }
            if (Value > MaxValue)
            {
                Value = MaxValue;
            }
            ValueChanged?.Invoke(this, EventArgs.Empty);
        }

        private void NumericTextBox_LostFocus(object sender, RoutedEventArgs e)
        {
            EnterValue();
        }

        private void NumericTextBox_PreviewKeyDown(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
            {
                EnterValue();
            }
        }

        private void TextBlock_PreviewMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            Value = DefaultValue;
            ValueChanged?.Invoke(this, EventArgs.Empty);
        }
    }
}
