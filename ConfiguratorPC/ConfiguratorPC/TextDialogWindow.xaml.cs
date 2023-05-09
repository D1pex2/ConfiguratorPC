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
using System.Windows.Shapes;

namespace ConfiguratorPC
{
    /// <summary>
    /// Логика взаимодействия для TextDialogWindow.xaml
    /// </summary>
    public partial class TextDialogWindow : Window
    {

        public string Message { get => MessageTextBox.Text; }

        public TextDialogWindow(string text)
        {
            InitializeComponent();
            TextBlock.Text = text;
        }

        private void SendButton_Click(object sender, RoutedEventArgs e)
        {
            DialogResult = true;
            Close();
        }

        private void CloseButton_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void TitleBorder_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            DragMove();
        }
    }
}
