using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Media.Imaging;

namespace ConfiguratorPC.Data
{
    public partial class Picture
    {
        public BitmapImage Image
        {
            get
            {
                try
                {
                    MemoryStream byteStream = new MemoryStream(BytePicture);
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
