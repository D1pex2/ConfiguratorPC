using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Interop;
using System.Windows.Media.Imaging;

namespace ConfiguratorPC.Data
{
    public partial class Component
    {
        public BitmapImage FirstImage
        {
            get
            {
                try
                {
                    var pic = Pictures.First().BytePicture;
                    MemoryStream byteStream = new MemoryStream(pic);
                    BitmapImage image = new BitmapImage();
                    image.BeginInit();
                    image.StreamSource = byteStream;
                    image.EndInit();
                    return image;
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }
    }
}
