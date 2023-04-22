# .NET API for Image Processing

![Version 23.2.0](https://img.shields.io/badge/nuget-v23.2.0-blue) ![Nuget](https://img.shields.io/nuget/dt/Aspose.Imaging)

[![banner](https://raw.githubusercontent.com/Aspose/aspose.github.io/master/img/banners/aspose_imaging-for-net-banner.png)](https://releases.aspose.com/imaging/net/)

[Product Page](https://products.aspose.com/imaging/net/) | [Docs](https://docs.aspose.com/imaging/net/) | [Demos](https://products.aspose.app/imaging/family) | [API Reference](https://reference.aspose.com/imaging/net/) | [Examples](https://github.com/aspose-imaging/Aspose.Imaging-for-.NET/tree/master/Examples) | [Blog](https://blog.aspose.com/category/imaging/) | [Search](https://search.aspose.com/) | [Free Support](https://forum.aspose.com/c/imaging) | [Temporary License](https://purchase.aspose.com/temporary-license/)

It is a [standalone Imaging API](https://products.aspose.com/imaging/net/) consists of C# routines that enable your .NET applications to draw as well as perform basic to advanced level processing of raster & vector images.

Aspose.Imaging for .NET offers robust image compression and high processing speed through native byte access and a range of efficient algorithms. It not only manipulate, export, and convert images but also lets you dynamically draw objects using pixel manipulation and Graphics Path.

## Imaging API Features

- Draw raster images with graphics.
- Draw vector images.
- Converting images to various formats.
- [Apply masking](https://docs.aspose.com/imaging/net/image-masking/) as well as [Median & Wiener](https://docs.aspose.com/imaging/net/applying-median-and-wiener-filters/) filters.
- Crop, rotate & resize images via API.
- De-skew & transform images.
- Set image properties.

## Read & Write Image Formats

**Raster Formats:** JPEG2000, JPEG, BMP, TIFF, BIGTIFF, GIF, PNG, APNG\
**Medical Imaging:** DICOM\
**Metafiles:** EMF, WMF, EMZ, WMZ\
**Truevision:** TGA\
**Vector Graphics:** SVG, SVGZ

## Save Images As

**Fixed:** PDF\
**Photoshop:** PSD\
**Web:** HTML5 Canvas

## Read Image Formats

**eBook:** DjVu\
**Digital Camera Raw:** DNG\
**OpenOffice:** ODG, OTG\
**Bitmap:** DIB\
**Web Image:** WebP\
**CorelDRAW:** CDR (X6, X7), CMX (V2.0 32-bit)\
**PostScript:** EPS

## Platform Independence

Aspose.Imaging for .NET can be used to develop applications on Windows Desktop (x86, x64), Windows Server (x86, x64), Windows Azure, Windows Embedded (CE 6.0 R2), as well as Linux x64. The supported platforms include .NET Framework version 2.0 or higher, and .NET Standard 2.0, Net5.0, Net6.0.

## Getting Started with Aspose.Imaging for .NET

Are you ready to give Aspose.Imaging for .NET a try? Simply execute `Install-Package Aspose.Imaging` from Package Manager Console in Visual Studio to fetch the NuGet package. If you already have Aspose.Imaging for .NET and want to upgrade the version, please execute `Update-Package Aspose.Imaging` to get the latest version.

## Do not need full API ? Plugin licenses allow you to get access to the specific features.

Following features are available under plugin licensing for .NET Standard 2.0 and higher configurations.:

**Aspose.Imaging Conversion feature**

Allows conversion between [supported image formats](https://docs.aspose.com/imaging/net/supported-file-formats/) 

See [conversion landing pages](https://products.aspose.com/imaging/net/conversion/) for more details and examples.

[Live demo](https://products.aspose.app/imaging/conversion)

**Aspose.Imaging Image merge feature**

Allows to merge of several images into one.

See [image merge landing pages](https://products.aspose.com/imaging/net/merge/png/) for more details and examples.

[Live demo](https://products.aspose.app/imaging/image-merge)

**Aspose.Imaging Image Image Album feature**

Allows to merge of several images into image album in the tiff, dicom, pdf formats.

See [image merge landing pages](https://products.aspose.com/imaging/net/merge/tiff/) for more details and examples.

[Live demo](https://products.aspose.app/imaging/image-merge)

**Aspose.Imaging Resize for .NET**

Allows to resize the image, making downsampling or upsampling.

See [image resize landing pages](https://products.aspose.com/imaging/net/resize/) for more details and examples.

[Live demo](https://products.aspose.app/imaging/image-resize)

**Aspose.Imaging Crop for .NET**

Allows to crop the image selecting the rectangular part.

See [image crop landing pages](https://products.aspose.com/imaging/net/crop/) for more details and examples.

[Live demo](https://products.aspose.app/imaging/image-crop)

You may review [Aspose.Market](https://products.aspose.market/imaging/) to get more detailed descriptions and order available plug-in licenses 
[here]((https://purchase.aspose.market/buy).

## Resize a `JPG` Image via C# Code

Execute the below code snippet to see how Aspose.Imaging performs in your environment or please visit the [GitHub Repository](https://github.com/aspose-imaging/Aspose.Imaging-for-.NET) for other common usage scenarios.

```csharp
using (Image image = Image.Load(dir + "template.jpg"))
{
    image.Resize(300, 300);
    image.Save(dir + "output.jpg");
}
```

## Recover a Broken `TIFF` using C# Code

You can programmatically recover a damaged TIFF file with the help of Aspose.Imaging for .NET API as demonstrated below.

```csharp
// create an instance of LoadOptions and set LoadOptions properties
var loadOptions = new LoadOptions();
loadOptions.DataRecoveryMode = DataRecoveryMode.ConsistentRecover;
loadOptions.DataBackgroundColor = Color.Red;

// create an instance of Image and load a damaged image by passing the instance of LoadOptions
using (var image = Image.Load(dir + "template.tiff", loadOptions))
{
    // do processing
}
```

[Product Page](https://products.aspose.com/imaging/net/) | [Docs](https://docs.aspose.com/imaging/net/) | [Demos](https://products.aspose.app/imaging/family) | [API Reference](https://reference.aspose.com/imaging/net/) | [Examples](https://github.com/aspose-imaging/Aspose.Imaging-for-.NET/tree/master/Examples) | [Blog](https://blog.aspose.com/category/imaging/) | [Search](https://search.aspose.com/) | [Free Support](https://forum.aspose.com/c/imaging) | [Temporary License](https://purchase.aspose.com/temporary-license/)
