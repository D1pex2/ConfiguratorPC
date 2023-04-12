using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
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
                    if (Pictures.Count != 0)
                    {
                        var pic = Pictures.First().BytePicture;
                        MemoryStream byteStream = new MemoryStream(pic);
                        BitmapImage image = new BitmapImage();
                        image.BeginInit();
                        image.StreamSource = byteStream;
                        image.EndInit();
                        return image;
                    }
                    else
                    {
                        using (var memory = new MemoryStream())
                        {
                            Properties.Resources.placeholder.Save(memory, ImageFormat.Png);
                            memory.Position = 0;

                            var bitmapImage = new BitmapImage();
                            bitmapImage.BeginInit();
                            bitmapImage.StreamSource = memory;
                            bitmapImage.CacheOption = BitmapCacheOption.OnLoad;
                            bitmapImage.EndInit();
                            bitmapImage.Freeze();

                            return bitmapImage;
                        }
                    }
                }
                catch (Exception)
                {
                    return null;
                }
            }
        }
    }
}
