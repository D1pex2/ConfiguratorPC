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
        /// <summary>
        /// Метод отображения сообщения об ошибке
        /// </summary>
        /// <param name="ex">Исключение</param>
        public static void ShowError(Exception ex)
        {
            //Проверка на исключение БД
            if (ex is EntityException)
            {
                FeedBack.ShowError("Ошибка подключения к базе данных. Обратитесь к системному администратору.");
                //Завершение работы приложения
                Application.Current.Shutdown();
            }
            else
            {
                ShowError(ex.Message);
            }
        }

        /// <summary>
        /// Метод отображения сообщения об ошибке
        /// </summary>
        /// <param name="message">Сообщение</param>
        public static void ShowError(string message)
        {
            new MessageWindow("Ошибка", message, true).ShowDialog();
        }

        /// <summary>
        /// Метод отображения сообщения
        /// </summary>
        /// <param name="message">Сообщение</param>
        public static void ShowMessage(string message)
        {
            new MessageWindow("Сообщение", message).ShowDialog();
        }
    }
}