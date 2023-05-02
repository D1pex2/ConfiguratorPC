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
        private string dir = $@"{Environment.CurrentDirectory}\\Resources\\";

        public BitmapImage FirstImage
        {
            get
            {
                return new BitmapImage(FirstImageUri);
            }
        }

        public Uri FirstImageUri
        {
            get
            {
                var path = $@"{dir}Pictures\\{Pictures.First().Path}";
                if (Pictures.Count == 0 || !File.Exists(path))
                {
                    var placeholder = $"{dir}placeholder.png";
                    if (!File.Exists(placeholder))
                    {
                        Directory.CreateDirectory(dir);
                        Properties.Resources.placeholder.Save(placeholder);
                    }
                    return new Uri(placeholder);
                }
                return new Uri(path);
            }
        }

        public List<Picture> ExistsPicture
        {
            get
            {
                List<Picture> pictureList = new List<Picture>();
                foreach (var pic in Pictures)
                {
                    if (File.Exists($@"{dir}Pictures\\{pic.Path}"))
                    {
                        pictureList.Add(pic);
                    }
                }
                return pictureList;
            }
        }
    }
}
