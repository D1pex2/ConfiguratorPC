using System;
using System.Collections.Generic;
using System.Data.Entity.Core;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace ConfiguratorPC
{
    public static class FeedBack
    {
        public static void ShowError(Exception ex)
        {
            if (ex is EntityException)
            {
                FeedBack.ShowError("Ошибка подключения к базе данных. Обратитесь к системному администратору.");
                Application.Current.Shutdown();
            }
            else
            {
                ShowError(ex.Message);
            }
        }

        public static void ShowError(string message)
        {
            new MessageWindow("Ошибка", message, true).ShowDialog();
        }

        public static void ShowMessage(string message)
        {
            new MessageWindow("Сообщение", message).ShowDialog();
        }
    }
}
