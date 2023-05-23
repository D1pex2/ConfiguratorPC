USE [master]
GO
/****** Object:  Database [ConfiguratorPC]    Script Date: 23.05.2023 13:37:45 ******/
CREATE DATABASE [ConfiguratorPC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ConfiguratorPC', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ConfiguratorPC.mdf' , SIZE = 139264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ConfiguratorPC_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ConfiguratorPC_log.ldf' , SIZE = 139264KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ConfiguratorPC] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ConfiguratorPC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ConfiguratorPC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ConfiguratorPC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ConfiguratorPC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ConfiguratorPC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ConfiguratorPC] SET ARITHABORT OFF 
GO
ALTER DATABASE [ConfiguratorPC] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ConfiguratorPC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ConfiguratorPC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ConfiguratorPC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ConfiguratorPC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ConfiguratorPC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ConfiguratorPC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ConfiguratorPC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ConfiguratorPC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ConfiguratorPC] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ConfiguratorPC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ConfiguratorPC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ConfiguratorPC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ConfiguratorPC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ConfiguratorPC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ConfiguratorPC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ConfiguratorPC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ConfiguratorPC] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ConfiguratorPC] SET  MULTI_USER 
GO
ALTER DATABASE [ConfiguratorPC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ConfiguratorPC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ConfiguratorPC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ConfiguratorPC] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ConfiguratorPC] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ConfiguratorPC] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ConfiguratorPC] SET QUERY_STORE = OFF
GO
USE [ConfiguratorPC]
GO
/****** Object:  Table [dbo].[Case]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Case](
	[IdComponent] [int] NOT NULL,
	[IdCaseSize] [int] NOT NULL,
	[IdPowerSupplyFormFactor] [int] NOT NULL,
	[ExpansionSlotsQuantity] [tinyint] NOT NULL,
	[MaxVideoCardLength] [int] NOT NULL,
	[MaxCoolerHeigth] [int] NOT NULL,
	[LiquidCoolerCompatible] [bit] NOT NULL,
	[Storage35Quantity] [tinyint] NOT NULL,
	[Storage25Quantity] [tinyint] NOT NULL,
	[MotherBoardOrientation] [nvarchar](13) NOT NULL,
	[Length] [smallint] NOT NULL,
	[Width] [smallint] NOT NULL,
	[Height] [smallint] NOT NULL,
	[IdMainColor] [int] NOT NULL,
	[HasWindow] [bit] NOT NULL,
	[IdLigthingType] [int] NULL,
	[PowerSupplyOrientation] [nvarchar](7) NOT NULL,
	[HasCardReader] [bit] NOT NULL,
 CONSTRAINT [PK_Case] PRIMARY KEY CLUSTERED 
(
	[IdComponent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CaseCompatibleMotherBoardFormFactor]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CaseCompatibleMotherBoardFormFactor](
	[IdCase] [int] NOT NULL,
	[IdMotherBoardFormFactor] [int] NOT NULL,
 CONSTRAINT [PK_CompatibleCaseMotherBoardFormFactor] PRIMARY KEY CLUSTERED 
(
	[IdCase] ASC,
	[IdMotherBoardFormFactor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CaseConnector]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CaseConnector](
	[IdCase] [int] NOT NULL,
	[IdConnector] [int] NOT NULL,
	[Quantity] [tinyint] NOT NULL,
 CONSTRAINT [PK_CaseConnector] PRIMARY KEY CLUSTERED 
(
	[IdCase] ASC,
	[IdConnector] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CaseFrontPanelMaterial]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CaseFrontPanelMaterial](
	[IdCase] [int] NOT NULL,
	[IdMaterial] [int] NOT NULL,
 CONSTRAINT [PK_CaseFrontPanelMaterial] PRIMARY KEY CLUSTERED 
(
	[IdCase] ASC,
	[IdMaterial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CaseMaterial]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CaseMaterial](
	[IdCase] [int] NOT NULL,
	[IdMaterial] [int] NOT NULL,
 CONSTRAINT [PK_CaseMaterial] PRIMARY KEY CLUSTERED 
(
	[IdCase] ASC,
	[IdMaterial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CaseRadiatorSize]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CaseRadiatorSize](
	[IdCase] [int] NOT NULL,
	[IdRadiatorSize] [int] NOT NULL,
 CONSTRAINT [PK_CaseRadiatorSize] PRIMARY KEY CLUSTERED 
(
	[IdCase] ASC,
	[IdRadiatorSize] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CaseSize]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CaseSize](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_CaseSize] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Chipset]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chipset](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Chipset_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Color]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Color](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Color] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Component]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Component](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdManufacturer] [int] NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Price] [decimal](9, 2) NOT NULL,
 CONSTRAINT [PK_Component] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Connector]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Connector](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Connector] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cooler]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cooler](
	[IdProcessorCooler] [int] NOT NULL,
	[Heigth] [smallint] NOT NULL,
	[ConstructionType] [nvarchar](50) NOT NULL,
	[IdBaseMaterial] [int] NOT NULL,
	[TermPipeQuantity] [tinyint] NULL,
	[TermPipeDiameter] [tinyint] NULL,
	[NickelCoating] [nvarchar](100) NULL,
	[Width] [smallint] NOT NULL,
	[Length] [smallint] NOT NULL,
 CONSTRAINT [PK_Cooler] PRIMARY KEY CLUSTERED 
(
	[IdProcessorCooler] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CoolerCompatibleSocket]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CoolerCompatibleSocket](
	[IdProcessorCooler] [int] NOT NULL,
	[IdSocket] [int] NOT NULL,
 CONSTRAINT [PK_CoolerCompatibleSocket] PRIMARY KEY CLUSTERED 
(
	[IdProcessorCooler] ASC,
	[IdSocket] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Core]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Core](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Core] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DataStorage]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataStorage](
	[IdComponent] [int] NOT NULL,
	[MemorySize] [smallint] NOT NULL,
	[Width] [decimal](5, 2) NOT NULL,
	[Length] [smallint] NOT NULL,
	[Thickness] [decimal](3, 1) NOT NULL,
 CONSTRAINT [PK_DataStorage] PRIMARY KEY CLUSTERED 
(
	[IdComponent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GraphicProcessor]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GraphicProcessor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_GraphicProcessor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GraphicsProcessingUnit]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GraphicsProcessingUnit](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[MaxFrequency] [smallint] NOT NULL,
	[ExecutiveUnitQuantity] [tinyint] NOT NULL,
	[ShadingUnitsQuantity] [smallint] NOT NULL,
 CONSTRAINT [PK_GraphicsProcessingUnit] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HDD]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HDD](
	[IdDataStorage] [int] NOT NULL,
	[FormFactor] [varchar](4) NOT NULL,
	[CacheSize] [smallint] NOT NULL,
	[RotationSpeed] [smallint] NOT NULL,
	[WriteTech] [varchar](5) NOT NULL,
	[ActiveNoiseLevel] [tinyint] NOT NULL,
	[PassiveNoiseLevel] [tinyint] NOT NULL,
	[PassiveEnergyUse] [decimal](4, 2) NOT NULL,
	[MaxEnergyUse] [decimal](4, 2) NOT NULL,
	[MaxTemp] [tinyint] NOT NULL,
 CONSTRAINT [PK_HDD] PRIMARY KEY CLUSTERED 
(
	[IdDataStorage] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LightingType]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LightingType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](11) NOT NULL,
 CONSTRAINT [PK_LightingType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LiquidCooler]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LiquidCooler](
	[IdProcessorCooler] [int] NOT NULL,
	[Serviced] [bit] NOT NULL,
	[IdWaterblockMaterial] [int] NOT NULL,
	[WaterblockSize] [varchar](50) NOT NULL,
	[IdRadiatorSize] [int] NOT NULL,
	[RadiatorLength] [smallint] NOT NULL,
	[RadiatorWidth] [smallint] NOT NULL,
	[RadiatorThickness] [smallint] NOT NULL,
	[PumpRotationSpeed] [smallint] NOT NULL,
	[PumpConnector] [varchar](5) NOT NULL,
	[PipeLength] [smallint] NOT NULL,
	[TransparentPipe] [bit] NOT NULL,
 CONSTRAINT [PK_LiquidCooler] PRIMARY KEY CLUSTERED 
(
	[IdProcessorCooler] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[M2FormFactor]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M2FormFactor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](5) NOT NULL,
 CONSTRAINT [PK_M2FormFactor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[M2Key]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M2Key](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](1) NOT NULL,
 CONSTRAINT [PK_M2Key] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[M2SSD]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M2SSD](
	[IdSSD] [int] NOT NULL,
	[IdFormFactor] [int] NULL,
 CONSTRAINT [PK_M2SSD] PRIMARY KEY CLUSTERED 
(
	[IdSSD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[M2SSDKey]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M2SSDKey](
	[IdM2SSD] [int] NOT NULL,
	[IdKey] [int] NOT NULL,
 CONSTRAINT [PK_M2SSDKey] PRIMARY KEY CLUSTERED 
(
	[IdM2SSD] ASC,
	[IdKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Material] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Microarchitecture]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Microarchitecture](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Microarchitecture] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MotherBoard]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MotherBoard](
	[IdComponent] [int] NOT NULL,
	[IdMotherBoardFormFactor] [int] NOT NULL,
	[IdSocket] [int] NOT NULL,
	[IdRAMType] [int] NOT NULL,
	[IdRAMFormFactor] [int] NOT NULL,
	[MaxRAMSize] [tinyint] NOT NULL,
	[RAMQuantity] [tinyint] NOT NULL,
	[PCIEx16Quantity] [tinyint] NOT NULL,
	[SATAQuantity] [tinyint] NOT NULL,
	[M2Quantity] [tinyint] NOT NULL,
	[Height] [smallint] NOT NULL,
	[Width] [smallint] NOT NULL,
	[IdChipset] [int] NOT NULL,
	[MaxRAMFrequency] [smallint] NOT NULL,
	[IdPCIControllerVersion] [int] NULL,
	[RJ45Quantity] [tinyint] NOT NULL,
	[AnalogAudioOutputQuantity] [tinyint] NOT NULL,
	[CoolerPowerSupply] [varchar](5) NULL,
	[M2KeyE] [bit] NOT NULL,
	[InterfaceLPT] [bit] NOT NULL,
	[SoundSchema] [varchar](3) NULL,
	[IdSoundAdapterChipset] [int] NULL,
	[IdNetworkAdapterChipset] [int] NULL,
	[NetworkAdapterSpeed] [tinyint] NULL,
	[HasWiFi] [bit] NOT NULL,
	[HasBluetooth] [bit] NOT NULL,
	[PowerPhaseQuantity] [tinyint] NOT NULL,
	[IdMotherBoardPowerPlug] [int] NOT NULL,
	[IdProcessorPowerPlug] [int] NULL,
	[StreamRAMQuantity] [tinyint] NOT NULL,
	[EmbeddedProcessor] [nvarchar](50) NULL,
 CONSTRAINT [PK_MotherBoard] PRIMARY KEY CLUSTERED 
(
	[IdComponent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MotherBoardCompatibleCore]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MotherBoardCompatibleCore](
	[IdMotherBoard] [int] NOT NULL,
	[IdCore] [int] NOT NULL,
 CONSTRAINT [PK_CompatibleMotherBoardCore] PRIMARY KEY CLUSTERED 
(
	[IdMotherBoard] ASC,
	[IdCore] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MotherBoardConnector]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MotherBoardConnector](
	[IdMotherBoard] [int] NOT NULL,
	[IdConnector] [int] NOT NULL,
	[Quantity] [tinyint] NOT NULL,
 CONSTRAINT [PK_MotherBoardConnector] PRIMARY KEY CLUSTERED 
(
	[IdMotherBoard] ASC,
	[IdConnector] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MotherBoardConnectorPlug]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MotherBoardConnectorPlug](
	[IdMotherBoardPowerPlug] [int] NOT NULL,
	[IdMotherBoardConnector] [int] NOT NULL,
 CONSTRAINT [PK_MotherBoardConnectorPlug] PRIMARY KEY CLUSTERED 
(
	[IdMotherBoardPowerPlug] ASC,
	[IdMotherBoardConnector] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MotherBoardFormFactor]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MotherBoardFormFactor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](12) NOT NULL,
 CONSTRAINT [PK_FormFactor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MotherBoardM2Key]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MotherBoardM2Key](
	[IdMotherBoard] [int] NOT NULL,
	[IdFormFactor] [int] NOT NULL,
	[IdKey] [int] NOT NULL,
 CONSTRAINT [PK_MotherBoardM2Key] PRIMARY KEY CLUSTERED 
(
	[IdMotherBoard] ASC,
	[IdFormFactor] ASC,
	[IdKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MotherBoardPowerConnector]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MotherBoardPowerConnector](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
 CONSTRAINT [PK_MotherBoardPowerConnector] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MotherBoardPowerPlug]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MotherBoardPowerPlug](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
 CONSTRAINT [PK_MotherBoardPowerPlug] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MotherBoardVideoOutput]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MotherBoardVideoOutput](
	[IdMotherBoard] [int] NOT NULL,
	[IdVideoOutput] [int] NOT NULL,
 CONSTRAINT [PK_MotherBoardVideoOutput] PRIMARY KEY CLUSTERED 
(
	[IdMotherBoard] ASC,
	[IdVideoOutput] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NetworkAdapterChipset]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NetworkAdapterChipset](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_NetworkAdapterChipset] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PCIEController]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PCIEController](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PCIEController] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Picture]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Picture](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdComponent] [int] NOT NULL,
	[Path] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Picture] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PowerSupply]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PowerSupply](
	[IdComponent] [int] NOT NULL,
	[IdPowerSupplyFormFactor] [int] NOT NULL,
	[Power] [smallint] NOT NULL,
	[SATAConnectorQuantity] [tinyint] NOT NULL,
	[IdColor] [int] NOT NULL,
	[CoolerSystem] [nvarchar](9) NOT NULL,
	[Length] [smallint] NOT NULL,
	[Width] [smallint] NOT NULL,
	[Heigth] [smallint] NOT NULL,
 CONSTRAINT [PK_PowerSupply_1] PRIMARY KEY CLUSTERED 
(
	[IdComponent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PowerSupplyFormFactor]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PowerSupplyFormFactor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PowerSupplyFormFactor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PowerSupplyMotherBoardConnector]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PowerSupplyMotherBoardConnector](
	[IdPowerSupply] [int] NOT NULL,
	[IdMotherBoardPowerConnector] [int] NOT NULL,
	[Quantity] [tinyint] NOT NULL,
 CONSTRAINT [PK_PowerSupplyMotherBoardConnector] PRIMARY KEY CLUSTERED 
(
	[IdPowerSupply] ASC,
	[IdMotherBoardPowerConnector] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PowerSupplyProcessorPowerConnector]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PowerSupplyProcessorPowerConnector](
	[IdPowerSupply] [int] NOT NULL,
	[IdProcessorPowerConnector] [int] NOT NULL,
	[Quantity] [tinyint] NOT NULL,
 CONSTRAINT [PK_PowerSupplyProcessorPowerConnector] PRIMARY KEY CLUSTERED 
(
	[IdPowerSupply] ASC,
	[IdProcessorPowerConnector] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PowerSupplyVideoPowerConnector]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PowerSupplyVideoPowerConnector](
	[IdPowerSupply] [int] NOT NULL,
	[IdVideoPowerConnector] [int] NOT NULL,
	[Quantity] [tinyint] NOT NULL,
 CONSTRAINT [PK_PowerSupplyVideoPowerConnector] PRIMARY KEY CLUSTERED 
(
	[IdPowerSupply] ASC,
	[IdVideoPowerConnector] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Processor]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Processor](
	[IdComponent] [int] NOT NULL,
	[IdSocket] [int] NOT NULL,
	[IdGraphicsProcessingUnit] [int] NULL,
	[IdCore] [int] NOT NULL,
	[MaxMemorySize] [int] NOT NULL,
	[HasCooler] [bit] NOT NULL,
	[CoreQuantity] [tinyint] NOT NULL,
	[MaxThreadQuantity] [tinyint] NOT NULL,
	[ProductiveCoreQuantity] [tinyint] NOT NULL,
	[EnergyEfficientCoreQuantity] [tinyint] NULL,
	[CacheL2Size] [decimal](3, 1) NOT NULL,
	[CacheL3Size] [decimal](3, 1) NULL,
	[TechProcess] [tinyint] NOT NULL,
	[BaseFrequency] [decimal](3, 1) NOT NULL,
	[MaxFrequency] [decimal](3, 1) NULL,
	[BaseFrequencyEnergyEfficientCore] [decimal](3, 1) NULL,
	[MaxFrequencyEnergyEfficientCore] [decimal](3, 1) NULL,
	[FreeMultiplier] [bit] NOT NULL,
	[MaxRAMFrequency] [smallint] NOT NULL,
	[StreamRAMQuantity] [tinyint] NOT NULL,
	[HasECC] [bit] NOT NULL,
	[TDP] [tinyint] NOT NULL,
	[MaxTemperature] [tinyint] NOT NULL,
	[IdPCIEController] [int] NULL,
	[PCIEQuantity] [tinyint] NULL,
 CONSTRAINT [PK_Processor] PRIMARY KEY CLUSTERED 
(
	[IdComponent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcessorCompatibleMemoryType]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessorCompatibleMemoryType](
	[IdProcessor] [int] NOT NULL,
	[IdRAMType] [int] NOT NULL,
 CONSTRAINT [PK_SupportedProcessorMemoryType] PRIMARY KEY CLUSTERED 
(
	[IdRAMType] ASC,
	[IdProcessor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcessorConnectorPlug]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessorConnectorPlug](
	[IdProcessorPowerPlug] [int] NOT NULL,
	[IdProcessorPowerConnector] [int] NOT NULL,
 CONSTRAINT [PK_ProcessorConnectorPlug] PRIMARY KEY CLUSTERED 
(
	[IdProcessorPowerPlug] ASC,
	[IdProcessorPowerConnector] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcessorCooler]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessorCooler](
	[IdComponent] [int] NOT NULL,
	[IdRadiatorMaterial] [int] NOT NULL,
	[FanQuantity] [tinyint] NOT NULL,
	[FanSize] [varchar](9) NOT NULL,
	[FanConnector] [varchar](5) NOT NULL,
	[MaxRotationSpeed] [smallint] NOT NULL,
	[MinRotationSpeed] [smallint] NOT NULL,
	[AdjustmentRotationSpeed] [nvarchar](50) NULL,
	[MaxNoiseLevel] [tinyint] NULL,
	[MaxAirflow] [decimal](5, 2) NULL,
	[MaxStaticPressure] [decimal](5, 2) NULL,
	[BearingType] [nvarchar](50) NOT NULL,
	[TDP] [smallint] NOT NULL,
 CONSTRAINT [PK_ProcessorCooler] PRIMARY KEY CLUSTERED 
(
	[IdComponent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcessorPowerConnector]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessorPowerConnector](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
 CONSTRAINT [PK_ProcessorPowerConnector] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcessorPowerPlug]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessorPowerPlug](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
 CONSTRAINT [PK_ProcessorPowerPlug] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RadiatorSize]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RadiatorSize](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Size] [smallint] NOT NULL,
 CONSTRAINT [PK_RadiatorSize] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RAM]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RAM](
	[IdComponent] [int] NOT NULL,
	[IdRAMFormFactor] [int] NOT NULL,
	[IdRAMType] [int] NOT NULL,
	[MemorySize] [tinyint] NOT NULL,
	[Frequency] [smallint] NOT NULL,
	[HasRegistr] [bit] NOT NULL,
	[HasECC] [bit] NOT NULL,
	[CASLatency] [tinyint] NOT NULL,
	[RAStoCAASDelay] [tinyint] NULL,
	[RowPrechargeDelay] [tinyint] NULL,
	[ActivateToPreChargeDelay] [tinyint] NULL,
	[HasRadiator] [bit] NOT NULL,
	[Voltage] [decimal](3, 2) NOT NULL,
 CONSTRAINT [PK_RAM] PRIMARY KEY CLUSTERED 
(
	[IdComponent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RAMFormFactor]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RAMFormFactor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](7) NOT NULL,
 CONSTRAINT [PK_MemoryFormFactor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RAMType]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RAMType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](5) NOT NULL,
 CONSTRAINT [PK_MemoryType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Socket]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Socket](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Chipset] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SoundAdapterChipset]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SoundAdapterChipset](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SoundAdapterChipset] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SSD]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SSD](
	[IdDataStorage] [int] NOT NULL,
	[BitQuantityOnCell] [nvarchar](50) NOT NULL,
	[MemoryStructure] [nvarchar](50) NOT NULL,
	[WriteSpeed] [smallint] NOT NULL,
	[ReadSpeed] [smallint] NOT NULL,
	[TotalBytesWritten] [tinyint] NOT NULL,
	[DWPD] [decimal](3, 2) NOT NULL,
 CONSTRAINT [PK_SSD] PRIMARY KEY CLUSTERED 
(
	[IdDataStorage] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VideoCard]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VideoCard](
	[IdComponent] [int] NOT NULL,
	[Length] [smallint] NOT NULL,
	[IdGraphicProcessor] [int] NOT NULL,
	[IdMicroarchitecture] [int] NOT NULL,
	[TechProcess] [tinyint] NOT NULL,
	[VideoMemorySize] [tinyint] NOT NULL,
	[IdVideoMemoryType] [int] NOT NULL,
	[MemoryBusBitRate] [smallint] NOT NULL,
	[MaxMemoryBandwidth] [decimal](5, 1) NOT NULL,
	[EffectiveMemoryFrequency] [smallint] NOT NULL,
	[VideoChipFrequency] [smallint] NOT NULL,
	[ALUQuantity] [smallint] NOT NULL,
	[TextureBlockQuantity] [smallint] NOT NULL,
	[RasterizationBlockQuantity] [smallint] NOT NULL,
	[RayTracingSupport] [bit] NOT NULL,
	[MaxMonitorQuantity] [tinyint] NOT NULL,
	[IdPCIEController] [int] NOT NULL,
	[PowerSupply] [smallint] NOT NULL,
	[CoolerType] [nvarchar](50) NOT NULL,
	[FanType] [nvarchar](20) NULL,
	[FanQuantity] [tinyint] NULL,
	[ExpansionSlotSize] [tinyint] NOT NULL,
	[Thickness] [smallint] NOT NULL,
	[Mass] [smallint] NULL,
	[IdVideoCardPowerPlug] [int] NULL,
 CONSTRAINT [PK_VideoCard] PRIMARY KEY CLUSTERED 
(
	[IdComponent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VideoCardConnectorPlug]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VideoCardConnectorPlug](
	[IdVideoCardPowerPlug] [int] NOT NULL,
	[IdVideoPowerConnector] [int] NOT NULL,
 CONSTRAINT [PK_VideoCardConnectorPlug] PRIMARY KEY CLUSTERED 
(
	[IdVideoCardPowerPlug] ASC,
	[IdVideoPowerConnector] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VideoCardOutput]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VideoCardOutput](
	[IdVideoCard] [int] NOT NULL,
	[IdVideoOutput] [int] NOT NULL,
	[Quantity] [tinyint] NOT NULL,
 CONSTRAINT [PK_VideoCardOutput] PRIMARY KEY CLUSTERED 
(
	[IdVideoCard] ASC,
	[IdVideoOutput] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VideoCardPowerPlug]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VideoCardPowerPlug](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
 CONSTRAINT [PK_VideoCardPowerPlug] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VideoMemoryType]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VideoMemoryType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](10) NOT NULL,
 CONSTRAINT [PK_VideoMemoryType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VideoOutput]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VideoOutput](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_VideoOutput] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VideoPowerConnector]    Script Date: 23.05.2023 13:37:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VideoPowerConnector](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NOT NULL,
 CONSTRAINT [PK_VideoPowerConnector] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Case] ([IdComponent], [IdCaseSize], [IdPowerSupplyFormFactor], [ExpansionSlotsQuantity], [MaxVideoCardLength], [MaxCoolerHeigth], [LiquidCoolerCompatible], [Storage35Quantity], [Storage25Quantity], [MotherBoardOrientation], [Length], [Width], [Height], [IdMainColor], [HasWindow], [IdLigthingType], [PowerSupplyOrientation], [HasCardReader]) VALUES (9, 1, 1, 6, 220, 140, 0, 2, 3, N'вертикально', 395, 185, 411, 1, 0, NULL, N'верхнее', 0)
INSERT [dbo].[Case] ([IdComponent], [IdCaseSize], [IdPowerSupplyFormFactor], [ExpansionSlotsQuantity], [MaxVideoCardLength], [MaxCoolerHeigth], [LiquidCoolerCompatible], [Storage35Quantity], [Storage25Quantity], [MotherBoardOrientation], [Length], [Width], [Height], [IdMainColor], [HasWindow], [IdLigthingType], [PowerSupplyOrientation], [HasCardReader]) VALUES (13, 1, 1, 7, 370, 166, 1, 2, 2, N'вертикально', 413, 198, 422, 1, 0, NULL, N'верхнее', 0)
INSERT [dbo].[Case] ([IdComponent], [IdCaseSize], [IdPowerSupplyFormFactor], [ExpansionSlotsQuantity], [MaxVideoCardLength], [MaxCoolerHeigth], [LiquidCoolerCompatible], [Storage35Quantity], [Storage25Quantity], [MotherBoardOrientation], [Length], [Width], [Height], [IdMainColor], [HasWindow], [IdLigthingType], [PowerSupplyOrientation], [HasCardReader]) VALUES (57, 2, 1, 4, 280, 120, 0, 2, 2, N'вертикально', 345, 180, 355, 1, 0, NULL, N'верхнее', 0)
INSERT [dbo].[Case] ([IdComponent], [IdCaseSize], [IdPowerSupplyFormFactor], [ExpansionSlotsQuantity], [MaxVideoCardLength], [MaxCoolerHeigth], [LiquidCoolerCompatible], [Storage35Quantity], [Storage25Quantity], [MotherBoardOrientation], [Length], [Width], [Height], [IdMainColor], [HasWindow], [IdLigthingType], [PowerSupplyOrientation], [HasCardReader]) VALUES (58, 2, 1, 4, 320, 148, 1, 1, 2, N'вертикально', 325, 175, 350, 1, 0, 4, N'верхнее', 0)
INSERT [dbo].[Case] ([IdComponent], [IdCaseSize], [IdPowerSupplyFormFactor], [ExpansionSlotsQuantity], [MaxVideoCardLength], [MaxCoolerHeigth], [LiquidCoolerCompatible], [Storage35Quantity], [Storage25Quantity], [MotherBoardOrientation], [Length], [Width], [Height], [IdMainColor], [HasWindow], [IdLigthingType], [PowerSupplyOrientation], [HasCardReader]) VALUES (59, 2, 1, 4, 325, 145, 0, 1, 2, N'вертикально', 373, 191, 356, 1, 0, NULL, N'верхнее', 0)
INSERT [dbo].[Case] ([IdComponent], [IdCaseSize], [IdPowerSupplyFormFactor], [ExpansionSlotsQuantity], [MaxVideoCardLength], [MaxCoolerHeigth], [LiquidCoolerCompatible], [Storage35Quantity], [Storage25Quantity], [MotherBoardOrientation], [Length], [Width], [Height], [IdMainColor], [HasWindow], [IdLigthingType], [PowerSupplyOrientation], [HasCardReader]) VALUES (60, 1, 1, 7, 375, 160, 1, 2, 3, N'вертикально', 405, 180, 410, 1, 0, NULL, N'верхнее', 0)
INSERT [dbo].[Case] ([IdComponent], [IdCaseSize], [IdPowerSupplyFormFactor], [ExpansionSlotsQuantity], [MaxVideoCardLength], [MaxCoolerHeigth], [LiquidCoolerCompatible], [Storage35Quantity], [Storage25Quantity], [MotherBoardOrientation], [Length], [Width], [Height], [IdMainColor], [HasWindow], [IdLigthingType], [PowerSupplyOrientation], [HasCardReader]) VALUES (61, 2, 1, 4, 240, 150, 0, 2, 3, N'вертикально', 345, 190, 372, 1, 0, NULL, N'верхнее', 0)
INSERT [dbo].[Case] ([IdComponent], [IdCaseSize], [IdPowerSupplyFormFactor], [ExpansionSlotsQuantity], [MaxVideoCardLength], [MaxCoolerHeigth], [LiquidCoolerCompatible], [Storage35Quantity], [Storage25Quantity], [MotherBoardOrientation], [Length], [Width], [Height], [IdMainColor], [HasWindow], [IdLigthingType], [PowerSupplyOrientation], [HasCardReader]) VALUES (62, 3, 1, 4, 220, 88, 0, 2, 1, N'вертикально', 431, 104, 326, 1, 0, NULL, N'верхнее', 0)
INSERT [dbo].[Case] ([IdComponent], [IdCaseSize], [IdPowerSupplyFormFactor], [ExpansionSlotsQuantity], [MaxVideoCardLength], [MaxCoolerHeigth], [LiquidCoolerCompatible], [Storage35Quantity], [Storage25Quantity], [MotherBoardOrientation], [Length], [Width], [Height], [IdMainColor], [HasWindow], [IdLigthingType], [PowerSupplyOrientation], [HasCardReader]) VALUES (63, 2, 1, 4, 250, 151, 1, 2, 3, N'вертикально', 405, 193, 378, 1, 1, NULL, N'верхнее', 0)
INSERT [dbo].[Case] ([IdComponent], [IdCaseSize], [IdPowerSupplyFormFactor], [ExpansionSlotsQuantity], [MaxVideoCardLength], [MaxCoolerHeigth], [LiquidCoolerCompatible], [Storage35Quantity], [Storage25Quantity], [MotherBoardOrientation], [Length], [Width], [Height], [IdMainColor], [HasWindow], [IdLigthingType], [PowerSupplyOrientation], [HasCardReader]) VALUES (64, 1, 1, 7, 330, 160, 1, 2, 1, N'вертикально', 508, 215, 503, 2, 1, 1, N'верхнее', 0)
INSERT [dbo].[Case] ([IdComponent], [IdCaseSize], [IdPowerSupplyFormFactor], [ExpansionSlotsQuantity], [MaxVideoCardLength], [MaxCoolerHeigth], [LiquidCoolerCompatible], [Storage35Quantity], [Storage25Quantity], [MotherBoardOrientation], [Length], [Width], [Height], [IdMainColor], [HasWindow], [IdLigthingType], [PowerSupplyOrientation], [HasCardReader]) VALUES (84, 4, 2, 3, 320, 165, 1, 1, 2, N'вертикально', 375, 203, 312, 1, 1, NULL, N'верхнее', 0)
GO
INSERT [dbo].[CaseCompatibleMotherBoardFormFactor] ([IdCase], [IdMotherBoardFormFactor]) VALUES (9, 1)
INSERT [dbo].[CaseCompatibleMotherBoardFormFactor] ([IdCase], [IdMotherBoardFormFactor]) VALUES (9, 2)
INSERT [dbo].[CaseCompatibleMotherBoardFormFactor] ([IdCase], [IdMotherBoardFormFactor]) VALUES (9, 4)
INSERT [dbo].[CaseCompatibleMotherBoardFormFactor] ([IdCase], [IdMotherBoardFormFactor]) VALUES (13, 1)
INSERT [dbo].[CaseCompatibleMotherBoardFormFactor] ([IdCase], [IdMotherBoardFormFactor]) VALUES (13, 2)
INSERT [dbo].[CaseCompatibleMotherBoardFormFactor] ([IdCase], [IdMotherBoardFormFactor]) VALUES (13, 4)
INSERT [dbo].[CaseCompatibleMotherBoardFormFactor] ([IdCase], [IdMotherBoardFormFactor]) VALUES (57, 4)
INSERT [dbo].[CaseCompatibleMotherBoardFormFactor] ([IdCase], [IdMotherBoardFormFactor]) VALUES (58, 2)
INSERT [dbo].[CaseCompatibleMotherBoardFormFactor] ([IdCase], [IdMotherBoardFormFactor]) VALUES (58, 6)
INSERT [dbo].[CaseCompatibleMotherBoardFormFactor] ([IdCase], [IdMotherBoardFormFactor]) VALUES (59, 2)
INSERT [dbo].[CaseCompatibleMotherBoardFormFactor] ([IdCase], [IdMotherBoardFormFactor]) VALUES (59, 6)
INSERT [dbo].[CaseCompatibleMotherBoardFormFactor] ([IdCase], [IdMotherBoardFormFactor]) VALUES (60, 1)
INSERT [dbo].[CaseCompatibleMotherBoardFormFactor] ([IdCase], [IdMotherBoardFormFactor]) VALUES (60, 2)
INSERT [dbo].[CaseCompatibleMotherBoardFormFactor] ([IdCase], [IdMotherBoardFormFactor]) VALUES (60, 3)
INSERT [dbo].[CaseCompatibleMotherBoardFormFactor] ([IdCase], [IdMotherBoardFormFactor]) VALUES (61, 2)
INSERT [dbo].[CaseCompatibleMotherBoardFormFactor] ([IdCase], [IdMotherBoardFormFactor]) VALUES (61, 6)
INSERT [dbo].[CaseCompatibleMotherBoardFormFactor] ([IdCase], [IdMotherBoardFormFactor]) VALUES (62, 6)
INSERT [dbo].[CaseCompatibleMotherBoardFormFactor] ([IdCase], [IdMotherBoardFormFactor]) VALUES (63, 2)
INSERT [dbo].[CaseCompatibleMotherBoardFormFactor] ([IdCase], [IdMotherBoardFormFactor]) VALUES (63, 6)
INSERT [dbo].[CaseCompatibleMotherBoardFormFactor] ([IdCase], [IdMotherBoardFormFactor]) VALUES (64, 1)
INSERT [dbo].[CaseCompatibleMotherBoardFormFactor] ([IdCase], [IdMotherBoardFormFactor]) VALUES (64, 2)
INSERT [dbo].[CaseCompatibleMotherBoardFormFactor] ([IdCase], [IdMotherBoardFormFactor]) VALUES (64, 6)
INSERT [dbo].[CaseCompatibleMotherBoardFormFactor] ([IdCase], [IdMotherBoardFormFactor]) VALUES (64, 7)
INSERT [dbo].[CaseCompatibleMotherBoardFormFactor] ([IdCase], [IdMotherBoardFormFactor]) VALUES (84, 5)
INSERT [dbo].[CaseCompatibleMotherBoardFormFactor] ([IdCase], [IdMotherBoardFormFactor]) VALUES (84, 6)
GO
INSERT [dbo].[CaseConnector] ([IdCase], [IdConnector], [Quantity]) VALUES (9, 1, 1)
INSERT [dbo].[CaseConnector] ([IdCase], [IdConnector], [Quantity]) VALUES (9, 2, 1)
INSERT [dbo].[CaseConnector] ([IdCase], [IdConnector], [Quantity]) VALUES (9, 3, 2)
INSERT [dbo].[CaseConnector] ([IdCase], [IdConnector], [Quantity]) VALUES (9, 4, 2)
INSERT [dbo].[CaseConnector] ([IdCase], [IdConnector], [Quantity]) VALUES (13, 1, 1)
INSERT [dbo].[CaseConnector] ([IdCase], [IdConnector], [Quantity]) VALUES (13, 2, 1)
INSERT [dbo].[CaseConnector] ([IdCase], [IdConnector], [Quantity]) VALUES (13, 3, 2)
INSERT [dbo].[CaseConnector] ([IdCase], [IdConnector], [Quantity]) VALUES (57, 1, 1)
INSERT [dbo].[CaseConnector] ([IdCase], [IdConnector], [Quantity]) VALUES (57, 2, 1)
INSERT [dbo].[CaseConnector] ([IdCase], [IdConnector], [Quantity]) VALUES (57, 3, 2)
INSERT [dbo].[CaseConnector] ([IdCase], [IdConnector], [Quantity]) VALUES (58, 1, 1)
INSERT [dbo].[CaseConnector] ([IdCase], [IdConnector], [Quantity]) VALUES (58, 2, 1)
INSERT [dbo].[CaseConnector] ([IdCase], [IdConnector], [Quantity]) VALUES (58, 3, 1)
INSERT [dbo].[CaseConnector] ([IdCase], [IdConnector], [Quantity]) VALUES (58, 4, 1)
INSERT [dbo].[CaseConnector] ([IdCase], [IdConnector], [Quantity]) VALUES (59, 1, 1)
INSERT [dbo].[CaseConnector] ([IdCase], [IdConnector], [Quantity]) VALUES (59, 2, 1)
INSERT [dbo].[CaseConnector] ([IdCase], [IdConnector], [Quantity]) VALUES (59, 3, 2)
INSERT [dbo].[CaseConnector] ([IdCase], [IdConnector], [Quantity]) VALUES (59, 4, 1)
INSERT [dbo].[CaseConnector] ([IdCase], [IdConnector], [Quantity]) VALUES (60, 1, 1)
INSERT [dbo].[CaseConnector] ([IdCase], [IdConnector], [Quantity]) VALUES (60, 2, 1)
INSERT [dbo].[CaseConnector] ([IdCase], [IdConnector], [Quantity]) VALUES (60, 3, 2)
INSERT [dbo].[CaseConnector] ([IdCase], [IdConnector], [Quantity]) VALUES (60, 4, 1)
INSERT [dbo].[CaseConnector] ([IdCase], [IdConnector], [Quantity]) VALUES (61, 1, 1)
INSERT [dbo].[CaseConnector] ([IdCase], [IdConnector], [Quantity]) VALUES (61, 2, 1)
INSERT [dbo].[CaseConnector] ([IdCase], [IdConnector], [Quantity]) VALUES (61, 3, 1)
INSERT [dbo].[CaseConnector] ([IdCase], [IdConnector], [Quantity]) VALUES (61, 4, 1)
INSERT [dbo].[CaseConnector] ([IdCase], [IdConnector], [Quantity]) VALUES (62, 1, 1)
INSERT [dbo].[CaseConnector] ([IdCase], [IdConnector], [Quantity]) VALUES (62, 2, 1)
INSERT [dbo].[CaseConnector] ([IdCase], [IdConnector], [Quantity]) VALUES (62, 3, 2)
INSERT [dbo].[CaseConnector] ([IdCase], [IdConnector], [Quantity]) VALUES (63, 1, 1)
INSERT [dbo].[CaseConnector] ([IdCase], [IdConnector], [Quantity]) VALUES (63, 2, 1)
INSERT [dbo].[CaseConnector] ([IdCase], [IdConnector], [Quantity]) VALUES (63, 3, 1)
INSERT [dbo].[CaseConnector] ([IdCase], [IdConnector], [Quantity]) VALUES (63, 4, 1)
INSERT [dbo].[CaseConnector] ([IdCase], [IdConnector], [Quantity]) VALUES (64, 1, 1)
INSERT [dbo].[CaseConnector] ([IdCase], [IdConnector], [Quantity]) VALUES (64, 2, 1)
INSERT [dbo].[CaseConnector] ([IdCase], [IdConnector], [Quantity]) VALUES (64, 4, 2)
INSERT [dbo].[CaseConnector] ([IdCase], [IdConnector], [Quantity]) VALUES (64, 5, 1)
INSERT [dbo].[CaseConnector] ([IdCase], [IdConnector], [Quantity]) VALUES (84, 1, 1)
INSERT [dbo].[CaseConnector] ([IdCase], [IdConnector], [Quantity]) VALUES (84, 2, 1)
INSERT [dbo].[CaseConnector] ([IdCase], [IdConnector], [Quantity]) VALUES (84, 4, 2)
INSERT [dbo].[CaseConnector] ([IdCase], [IdConnector], [Quantity]) VALUES (84, 5, 1)
GO
INSERT [dbo].[CaseFrontPanelMaterial] ([IdCase], [IdMaterial]) VALUES (9, 2)
INSERT [dbo].[CaseFrontPanelMaterial] ([IdCase], [IdMaterial]) VALUES (57, 2)
INSERT [dbo].[CaseFrontPanelMaterial] ([IdCase], [IdMaterial]) VALUES (58, 4)
INSERT [dbo].[CaseFrontPanelMaterial] ([IdCase], [IdMaterial]) VALUES (58, 5)
INSERT [dbo].[CaseFrontPanelMaterial] ([IdCase], [IdMaterial]) VALUES (59, 2)
INSERT [dbo].[CaseFrontPanelMaterial] ([IdCase], [IdMaterial]) VALUES (60, 1)
INSERT [dbo].[CaseFrontPanelMaterial] ([IdCase], [IdMaterial]) VALUES (61, 2)
INSERT [dbo].[CaseFrontPanelMaterial] ([IdCase], [IdMaterial]) VALUES (62, 2)
INSERT [dbo].[CaseFrontPanelMaterial] ([IdCase], [IdMaterial]) VALUES (63, 1)
INSERT [dbo].[CaseFrontPanelMaterial] ([IdCase], [IdMaterial]) VALUES (63, 2)
INSERT [dbo].[CaseFrontPanelMaterial] ([IdCase], [IdMaterial]) VALUES (64, 4)
INSERT [dbo].[CaseFrontPanelMaterial] ([IdCase], [IdMaterial]) VALUES (84, 4)
GO
INSERT [dbo].[CaseMaterial] ([IdCase], [IdMaterial]) VALUES (9, 1)
INSERT [dbo].[CaseMaterial] ([IdCase], [IdMaterial]) VALUES (13, 1)
INSERT [dbo].[CaseMaterial] ([IdCase], [IdMaterial]) VALUES (57, 1)
INSERT [dbo].[CaseMaterial] ([IdCase], [IdMaterial]) VALUES (57, 2)
INSERT [dbo].[CaseMaterial] ([IdCase], [IdMaterial]) VALUES (58, 1)
INSERT [dbo].[CaseMaterial] ([IdCase], [IdMaterial]) VALUES (58, 2)
INSERT [dbo].[CaseMaterial] ([IdCase], [IdMaterial]) VALUES (59, 1)
INSERT [dbo].[CaseMaterial] ([IdCase], [IdMaterial]) VALUES (59, 2)
INSERT [dbo].[CaseMaterial] ([IdCase], [IdMaterial]) VALUES (60, 1)
INSERT [dbo].[CaseMaterial] ([IdCase], [IdMaterial]) VALUES (61, 1)
INSERT [dbo].[CaseMaterial] ([IdCase], [IdMaterial]) VALUES (62, 1)
INSERT [dbo].[CaseMaterial] ([IdCase], [IdMaterial]) VALUES (63, 1)
INSERT [dbo].[CaseMaterial] ([IdCase], [IdMaterial]) VALUES (63, 2)
INSERT [dbo].[CaseMaterial] ([IdCase], [IdMaterial]) VALUES (63, 6)
INSERT [dbo].[CaseMaterial] ([IdCase], [IdMaterial]) VALUES (64, 1)
INSERT [dbo].[CaseMaterial] ([IdCase], [IdMaterial]) VALUES (64, 4)
INSERT [dbo].[CaseMaterial] ([IdCase], [IdMaterial]) VALUES (64, 6)
INSERT [dbo].[CaseMaterial] ([IdCase], [IdMaterial]) VALUES (84, 1)
INSERT [dbo].[CaseMaterial] ([IdCase], [IdMaterial]) VALUES (84, 4)
INSERT [dbo].[CaseMaterial] ([IdCase], [IdMaterial]) VALUES (84, 6)
GO
INSERT [dbo].[CaseRadiatorSize] ([IdCase], [IdRadiatorSize]) VALUES (13, 1)
INSERT [dbo].[CaseRadiatorSize] ([IdCase], [IdRadiatorSize]) VALUES (58, 1)
INSERT [dbo].[CaseRadiatorSize] ([IdCase], [IdRadiatorSize]) VALUES (60, 1)
INSERT [dbo].[CaseRadiatorSize] ([IdCase], [IdRadiatorSize]) VALUES (63, 1)
INSERT [dbo].[CaseRadiatorSize] ([IdCase], [IdRadiatorSize]) VALUES (64, 1)
INSERT [dbo].[CaseRadiatorSize] ([IdCase], [IdRadiatorSize]) VALUES (64, 2)
INSERT [dbo].[CaseRadiatorSize] ([IdCase], [IdRadiatorSize]) VALUES (64, 3)
GO
SET IDENTITY_INSERT [dbo].[CaseSize] ON 

INSERT [dbo].[CaseSize] ([Id], [Name]) VALUES (1, N'Mid-Tower')
INSERT [dbo].[CaseSize] ([Id], [Name]) VALUES (2, N'Mini-Tower')
INSERT [dbo].[CaseSize] ([Id], [Name]) VALUES (3, N'Slim')
INSERT [dbo].[CaseSize] ([Id], [Name]) VALUES (4, N'компактный (SFF)')
SET IDENTITY_INSERT [dbo].[CaseSize] OFF
GO
SET IDENTITY_INSERT [dbo].[Chipset] ON 

INSERT [dbo].[Chipset] ([Id], [Name]) VALUES (7, N'AMD 780G')
INSERT [dbo].[Chipset] ([Id], [Name]) VALUES (8, N'AMD A320')
INSERT [dbo].[Chipset] ([Id], [Name]) VALUES (3, N'AMD B450')
INSERT [dbo].[Chipset] ([Id], [Name]) VALUES (2, N'Intel B250')
INSERT [dbo].[Chipset] ([Id], [Name]) VALUES (6, N'Intel B560')
INSERT [dbo].[Chipset] ([Id], [Name]) VALUES (1, N'Intel H110')
INSERT [dbo].[Chipset] ([Id], [Name]) VALUES (5, N'Intel H470')
INSERT [dbo].[Chipset] ([Id], [Name]) VALUES (4, N'Intel H610')
INSERT [dbo].[Chipset] ([Id], [Name]) VALUES (9, N'SoC (система на кристалле)')
SET IDENTITY_INSERT [dbo].[Chipset] OFF
GO
SET IDENTITY_INSERT [dbo].[Color] ON 

INSERT [dbo].[Color] ([Id], [Name]) VALUES (2, N'серый')
INSERT [dbo].[Color] ([Id], [Name]) VALUES (1, N'черный')
SET IDENTITY_INSERT [dbo].[Color] OFF
GO
SET IDENTITY_INSERT [dbo].[Component] ON 

INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (6, 1, N'Процессор Intel Pentium G4400 OEM', CAST(2799.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (7, 2, N'Материнская плата AFOX IH110D4-MA2', CAST(4999.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (8, 3, N'Материнская плата Esonic B250-BTC-Gladiator', CAST(9999.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (9, 4, N'Корпус Winard Benco 3065 черный', CAST(2099.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (10, 2, N'Видеокарта AFOX GeForce G210', CAST(2450.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (11, 5, N'Процессор AMD Ryzen 3 1200 OEM', CAST(5999.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (12, 6, N'Материнская плата Biostar B450NH', CAST(10199.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (13, 7, N'Корпус DEXP DC-101B черный', CAST(2699.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (15, 8, N'Кулер для процессора Cooler Master A30', CAST(299.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (16, 9, N'Кулер для процессора Thermalright Silver Arrow IB-E Extreme Rev. B', CAST(10399.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (18, 10, N'Система охлаждения DarkFlash DT120', CAST(2899.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (19, 5, N'Оперативная память AMD Radeon R5 Entertainment Series 2 ГБ', CAST(499.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (20, 5, N'Оперативная память AMD Radeon R7 Performance Series 4 ГБ', CAST(850.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (21, 11, N'Оперативная память Kingston ValueRAM 2 ГБ', CAST(1699.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (22, 5, N'Оперативная память SODIMM AMD Radeon R3 Value Series 4 ГБ', CAST(799.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (23, 12, N'Блок питания Advantech', CAST(23499.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (24, 13, N'Блок питания ExeGate AAA350', CAST(899.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (25, 13, N'Блок питания ExeGate UN500', CAST(1699.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (26, 14, N'1 ТБ Жесткий диск Toshiba DT01', CAST(2999.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (27, 15, N'0.5 ТБ Жесткий диск WD Black', CAST(2999.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (28, 13, N'60 ГБ 2.5" SATA накопитель ExeGate Next A400TS60', CAST(899.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (29, 13, N'120 ГБ SSD M.2 накопитель ExeGate Next A2000TS120', CAST(799.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (30, 13, N'128 ГБ SSD M.2 накопитель ExeGate NextPro+ KC2000TP128', CAST(1199.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (31, 5, N'Процессор AMD A6-9500E OEM', CAST(899.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (32, 5, N'Процессор AMD FX-4300 BOX', CAST(2899.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (33, 1, N'Процессор Intel Celeron G5905 BOX', CAST(4499.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (34, 1, N'Процессор Intel Celeron G6900 BOX', CAST(5799.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (35, 1, N'Процессор Intel Core i3-10105F OEM', CAST(5999.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (37, 1, N'Процессор Intel Core i5-10400F BOX', CAST(10499.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (38, 5, N'Процессор AMD Ryzen 5 5600G OEM', CAST(11999.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (39, 5, N'Процессор AMD Ryzen 5 5600X OEM', CAST(14499.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (40, 1, N'Процессор Intel Core i5-12400 OEM', CAST(15999.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (42, 1, N'Процессор Intel Core i7-10700F OEM', CAST(19699.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (43, 16, N'Материнская плата ASRock H610M-HVS', CAST(5799.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (44, 21, N'Материнская плата GIGABYTE H610M K DDR4', CAST(5999.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (45, 16, N'Материнская плата ASRock H470M-HVS', CAST(4799.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (46, 21, N'Материнская плата GIGABYTE B560M DS3H V2', CAST(7499.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (47, 2, N'Материнская плата AFOX A780S-MA3', CAST(4999.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (57, 13, N'Корпус ExeGate BAA-105 черный', CAST(1999.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (58, 22, N'Корпус Aerocool CS-105 Blue черный', CAST(2850.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (59, 22, N'Корпус AeroCool CS-100 Advance черный', CAST(2950.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (60, 7, N'Корпус DEXP AWS-DE7 черный', CAST(2950.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (61, 22, N'Корпус AeroCool Cs-102 черный', CAST(2999.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (62, 7, N'Корпус DEXP DC-Slim черный', CAST(2999.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (63, 23, N'Корпус DEEPCOOL MATREXX 30 черный', CAST(3099.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (64, 24, N'Корпус InWin 905 OLED серый', CAST(26799.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (65, 25, N'Видеокарта MSI GeForce GT 730', CAST(5199.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (66, 5, N'Видеокарта PowerColor AMD Radeon RX 550 LP', CAST(5899.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (67, 26, N'Видеокарта Palit GeForce GT 1030', CAST(6399.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (68, 21, N'Видеокарта GIGABYTE GeForce GT 1030 OC', CAST(7999.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (70, 27, N'Видеокарта ASUS TUF Gaming GeForce RTX 4090 OC Edition', CAST(186999.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (72, 23, N'Кулер для процессора DEEPCOOL Theta 9', CAST(699.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (73, 23, N'Кулер для процессора DEEPCOOL Ice Blade 100', CAST(999.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (74, 28, N'Кулер для процессора Thermaltake Gravity i3', CAST(1250.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (76, 23, N'Система охлаждения DEEPCOOL LE300 Marrs', CAST(3899.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (77, 13, N'Блок питания ExeGate XP350', CAST(1199.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (78, 23, N'Блок питания DEEPCOOL DE600 v2', CAST(3099.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (79, 29, N'Характеристики Блок питания Chieftec Proton 1000W', CAST(9999.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (81, 30, N'Оперативная память Hynix HY5PS1G831BFP-S6C 1 ГБ', CAST(350.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (82, 15, N'2 ТБ Жесткий диск WD Blue', CAST(4199.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (83, 6, N'Материнская плата Biostar A320MH 2.0', CAST(4499.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (84, 31, N'Корпус LIAN LI TU150 TG [G99.TU150WX.00] черный', CAST(7099.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (85, 32, N'Материнская плата Elitegroup GLKD-I2-N4020', CAST(4299.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (86, 13, N'Блок питания ExeGate M550', CAST(4899.00 AS Decimal(9, 2)))
INSERT [dbo].[Component] ([Id], [IdManufacturer], [Name], [Price]) VALUES (88, 33, N'Оперативная память SODIMM Silicon Power 4 ГБ', CAST(699.00 AS Decimal(9, 2)))
SET IDENTITY_INSERT [dbo].[Component] OFF
GO
SET IDENTITY_INSERT [dbo].[Connector] ON 

INSERT [dbo].[Connector] ([Id], [Name]) VALUES (1, N'3.5 мм jack (аудио)')
INSERT [dbo].[Connector] ([Id], [Name]) VALUES (2, N'3.5 мм jack (микрофон)')
INSERT [dbo].[Connector] ([Id], [Name]) VALUES (6, N'PS/2 (клавиатура)')
INSERT [dbo].[Connector] ([Id], [Name]) VALUES (8, N'PS/2 (комбинированный)')
INSERT [dbo].[Connector] ([Id], [Name]) VALUES (7, N'PS/2 (мышь)')
INSERT [dbo].[Connector] ([Id], [Name]) VALUES (5, N'USB 2.0')
INSERT [dbo].[Connector] ([Id], [Name]) VALUES (3, N'USB 2.0 Type-A')
INSERT [dbo].[Connector] ([Id], [Name]) VALUES (4, N'USB 3.2 Gen1 Type-A')
INSERT [dbo].[Connector] ([Id], [Name]) VALUES (9, N'USB 3.2 Gen1 Type-C')
SET IDENTITY_INSERT [dbo].[Connector] OFF
GO
INSERT [dbo].[Cooler] ([IdProcessorCooler], [Heigth], [ConstructionType], [IdBaseMaterial], [TermPipeQuantity], [TermPipeDiameter], [NickelCoating], [Width], [Length]) VALUES (15, 48, N'горизонтальный', 4, NULL, NULL, NULL, 80, 80)
INSERT [dbo].[Cooler] ([IdProcessorCooler], [Heigth], [ConstructionType], [IdBaseMaterial], [TermPipeQuantity], [TermPipeDiameter], [NickelCoating], [Width], [Length]) VALUES (16, 163, N'башенный', 3, 8, 6, N'основание, радиатор, тепловые трубки', 155, 130)
INSERT [dbo].[Cooler] ([IdProcessorCooler], [Heigth], [ConstructionType], [IdBaseMaterial], [TermPipeQuantity], [TermPipeDiameter], [NickelCoating], [Width], [Length]) VALUES (72, 47, N'горизонтальный', 4, NULL, NULL, NULL, 100, 100)
INSERT [dbo].[Cooler] ([IdProcessorCooler], [Heigth], [ConstructionType], [IdBaseMaterial], [TermPipeQuantity], [TermPipeDiameter], [NickelCoating], [Width], [Length]) VALUES (73, 135, N'башенный', 7, 1, 6, N'радиатор', 103, 70)
INSERT [dbo].[Cooler] ([IdProcessorCooler], [Heigth], [ConstructionType], [IdBaseMaterial], [TermPipeQuantity], [TermPipeDiameter], [NickelCoating], [Width], [Length]) VALUES (74, 66, N'горизонтальный', 4, NULL, NULL, NULL, 97, 97)
GO
INSERT [dbo].[CoolerCompatibleSocket] ([IdProcessorCooler], [IdSocket]) VALUES (15, 8)
INSERT [dbo].[CoolerCompatibleSocket] ([IdProcessorCooler], [IdSocket]) VALUES (15, 9)
INSERT [dbo].[CoolerCompatibleSocket] ([IdProcessorCooler], [IdSocket]) VALUES (15, 10)
INSERT [dbo].[CoolerCompatibleSocket] ([IdProcessorCooler], [IdSocket]) VALUES (15, 11)
INSERT [dbo].[CoolerCompatibleSocket] ([IdProcessorCooler], [IdSocket]) VALUES (15, 12)
INSERT [dbo].[CoolerCompatibleSocket] ([IdProcessorCooler], [IdSocket]) VALUES (15, 13)
INSERT [dbo].[CoolerCompatibleSocket] ([IdProcessorCooler], [IdSocket]) VALUES (15, 14)
INSERT [dbo].[CoolerCompatibleSocket] ([IdProcessorCooler], [IdSocket]) VALUES (15, 15)
INSERT [dbo].[CoolerCompatibleSocket] ([IdProcessorCooler], [IdSocket]) VALUES (16, 1)
INSERT [dbo].[CoolerCompatibleSocket] ([IdProcessorCooler], [IdSocket]) VALUES (16, 2)
INSERT [dbo].[CoolerCompatibleSocket] ([IdProcessorCooler], [IdSocket]) VALUES (16, 3)
INSERT [dbo].[CoolerCompatibleSocket] ([IdProcessorCooler], [IdSocket]) VALUES (16, 4)
INSERT [dbo].[CoolerCompatibleSocket] ([IdProcessorCooler], [IdSocket]) VALUES (16, 5)
INSERT [dbo].[CoolerCompatibleSocket] ([IdProcessorCooler], [IdSocket]) VALUES (16, 6)
INSERT [dbo].[CoolerCompatibleSocket] ([IdProcessorCooler], [IdSocket]) VALUES (16, 7)
INSERT [dbo].[CoolerCompatibleSocket] ([IdProcessorCooler], [IdSocket]) VALUES (16, 8)
INSERT [dbo].[CoolerCompatibleSocket] ([IdProcessorCooler], [IdSocket]) VALUES (16, 16)
INSERT [dbo].[CoolerCompatibleSocket] ([IdProcessorCooler], [IdSocket]) VALUES (16, 17)
INSERT [dbo].[CoolerCompatibleSocket] ([IdProcessorCooler], [IdSocket]) VALUES (16, 18)
INSERT [dbo].[CoolerCompatibleSocket] ([IdProcessorCooler], [IdSocket]) VALUES (16, 19)
INSERT [dbo].[CoolerCompatibleSocket] ([IdProcessorCooler], [IdSocket]) VALUES (18, 1)
INSERT [dbo].[CoolerCompatibleSocket] ([IdProcessorCooler], [IdSocket]) VALUES (18, 2)
INSERT [dbo].[CoolerCompatibleSocket] ([IdProcessorCooler], [IdSocket]) VALUES (18, 3)
INSERT [dbo].[CoolerCompatibleSocket] ([IdProcessorCooler], [IdSocket]) VALUES (18, 4)
INSERT [dbo].[CoolerCompatibleSocket] ([IdProcessorCooler], [IdSocket]) VALUES (18, 6)
INSERT [dbo].[CoolerCompatibleSocket] ([IdProcessorCooler], [IdSocket]) VALUES (18, 8)
INSERT [dbo].[CoolerCompatibleSocket] ([IdProcessorCooler], [IdSocket]) VALUES (18, 11)
INSERT [dbo].[CoolerCompatibleSocket] ([IdProcessorCooler], [IdSocket]) VALUES (18, 12)
INSERT [dbo].[CoolerCompatibleSocket] ([IdProcessorCooler], [IdSocket]) VALUES (18, 14)
INSERT [dbo].[CoolerCompatibleSocket] ([IdProcessorCooler], [IdSocket]) VALUES (18, 15)
INSERT [dbo].[CoolerCompatibleSocket] ([IdProcessorCooler], [IdSocket]) VALUES (18, 16)
INSERT [dbo].[CoolerCompatibleSocket] ([IdProcessorCooler], [IdSocket]) VALUES (18, 17)
INSERT [dbo].[CoolerCompatibleSocket] ([IdProcessorCooler], [IdSocket]) VALUES (18, 18)
INSERT [dbo].[CoolerCompatibleSocket] ([IdProcessorCooler], [IdSocket]) VALUES (18, 19)
INSERT [dbo].[CoolerCompatibleSocket] ([IdProcessorCooler], [IdSocket]) VALUES (72, 1)
INSERT [dbo].[CoolerCompatibleSocket] ([IdProcessorCooler], [IdSocket]) VALUES (72, 2)
INSERT [dbo].[CoolerCompatibleSocket] ([IdProcessorCooler], [IdSocket]) VALUES (72, 3)
INSERT [dbo].[CoolerCompatibleSocket] ([IdProcessorCooler], [IdSocket]) VALUES (72, 6)
INSERT [dbo].[CoolerCompatibleSocket] ([IdProcessorCooler], [IdSocket]) VALUES (72, 16)
INSERT [dbo].[CoolerCompatibleSocket] ([IdProcessorCooler], [IdSocket]) VALUES (72, 17)
INSERT [dbo].[CoolerCompatibleSocket] ([IdProcessorCooler], [IdSocket]) VALUES (73, 1)
INSERT [dbo].[CoolerCompatibleSocket] ([IdProcessorCooler], [IdSocket]) VALUES (73, 2)
INSERT [dbo].[CoolerCompatibleSocket] ([IdProcessorCooler], [IdSocket]) VALUES (73, 3)
INSERT [dbo].[CoolerCompatibleSocket] ([IdProcessorCooler], [IdSocket]) VALUES (73, 8)
INSERT [dbo].[CoolerCompatibleSocket] ([IdProcessorCooler], [IdSocket]) VALUES (73, 17)
INSERT [dbo].[CoolerCompatibleSocket] ([IdProcessorCooler], [IdSocket]) VALUES (73, 20)
INSERT [dbo].[CoolerCompatibleSocket] ([IdProcessorCooler], [IdSocket]) VALUES (74, 20)
INSERT [dbo].[CoolerCompatibleSocket] ([IdProcessorCooler], [IdSocket]) VALUES (76, 1)
INSERT [dbo].[CoolerCompatibleSocket] ([IdProcessorCooler], [IdSocket]) VALUES (76, 2)
INSERT [dbo].[CoolerCompatibleSocket] ([IdProcessorCooler], [IdSocket]) VALUES (76, 3)
INSERT [dbo].[CoolerCompatibleSocket] ([IdProcessorCooler], [IdSocket]) VALUES (76, 8)
INSERT [dbo].[CoolerCompatibleSocket] ([IdProcessorCooler], [IdSocket]) VALUES (76, 17)
INSERT [dbo].[CoolerCompatibleSocket] ([IdProcessorCooler], [IdSocket]) VALUES (76, 20)
INSERT [dbo].[CoolerCompatibleSocket] ([IdProcessorCooler], [IdSocket]) VALUES (76, 21)
GO
SET IDENTITY_INSERT [dbo].[Core] ON 

INSERT [dbo].[Core] ([Id], [Name]) VALUES (14, N'
Intel Comet Lake')
INSERT [dbo].[Core] ([Id], [Name]) VALUES (12, N'AMD Bristol Ridge')
INSERT [dbo].[Core] ([Id], [Name]) VALUES (20, N'AMD Callisto')
INSERT [dbo].[Core] ([Id], [Name]) VALUES (16, N'AMD Cezanne')
INSERT [dbo].[Core] ([Id], [Name]) VALUES (21, N'AMD Heka')
INSERT [dbo].[Core] ([Id], [Name]) VALUES (5, N'AMD Matisse')
INSERT [dbo].[Core] ([Id], [Name]) VALUES (6, N'AMD Picasso')
INSERT [dbo].[Core] ([Id], [Name]) VALUES (7, N'AMD Pinnacle Ridge')
INSERT [dbo].[Core] ([Id], [Name]) VALUES (22, N'AMD Propus')
INSERT [dbo].[Core] ([Id], [Name]) VALUES (23, N'AMD Rana')
INSERT [dbo].[Core] ([Id], [Name]) VALUES (8, N'AMD Raven Ridge')
INSERT [dbo].[Core] ([Id], [Name]) VALUES (24, N'AMD Regor')
INSERT [dbo].[Core] ([Id], [Name]) VALUES (9, N'AMD Renoir')
INSERT [dbo].[Core] ([Id], [Name]) VALUES (25, N'AMD Sargas')
INSERT [dbo].[Core] ([Id], [Name]) VALUES (4, N'AMD Summit Ridge')
INSERT [dbo].[Core] ([Id], [Name]) VALUES (26, N'AMD Thuban')
INSERT [dbo].[Core] ([Id], [Name]) VALUES (10, N'AMD Vermeer')
INSERT [dbo].[Core] ([Id], [Name]) VALUES (13, N'AMD Vishera')
INSERT [dbo].[Core] ([Id], [Name]) VALUES (27, N'AMD Zambezi')
INSERT [dbo].[Core] ([Id], [Name]) VALUES (28, N'AMD Zosma')
INSERT [dbo].[Core] ([Id], [Name]) VALUES (15, N'Intel Alder Lake')
INSERT [dbo].[Core] ([Id], [Name]) VALUES (11, N'Intel Coffee Lake')
INSERT [dbo].[Core] ([Id], [Name]) VALUES (29, N'Intel Gemini Lake')
INSERT [dbo].[Core] ([Id], [Name]) VALUES (3, N'Intel Kaby Lake')
INSERT [dbo].[Core] ([Id], [Name]) VALUES (18, N'Intel Raptor Lake')
INSERT [dbo].[Core] ([Id], [Name]) VALUES (19, N'Intel Rocket Lake')
INSERT [dbo].[Core] ([Id], [Name]) VALUES (2, N'Intel Skylake')
SET IDENTITY_INSERT [dbo].[Core] OFF
GO
INSERT [dbo].[DataStorage] ([IdComponent], [MemorySize], [Width], [Length], [Thickness]) VALUES (26, 1000, CAST(101.60 AS Decimal(5, 2)), 147, CAST(26.1 AS Decimal(3, 1)))
INSERT [dbo].[DataStorage] ([IdComponent], [MemorySize], [Width], [Length], [Thickness]) VALUES (27, 500, CAST(69.85 AS Decimal(5, 2)), 100, CAST(7.0 AS Decimal(3, 1)))
INSERT [dbo].[DataStorage] ([IdComponent], [MemorySize], [Width], [Length], [Thickness]) VALUES (28, 60, CAST(69.90 AS Decimal(5, 2)), 100, CAST(7.0 AS Decimal(3, 1)))
INSERT [dbo].[DataStorage] ([IdComponent], [MemorySize], [Width], [Length], [Thickness]) VALUES (29, 120, CAST(80.00 AS Decimal(5, 2)), 22, CAST(2.2 AS Decimal(3, 1)))
INSERT [dbo].[DataStorage] ([IdComponent], [MemorySize], [Width], [Length], [Thickness]) VALUES (30, 128, CAST(80.00 AS Decimal(5, 2)), 22, CAST(2.2 AS Decimal(3, 1)))
INSERT [dbo].[DataStorage] ([IdComponent], [MemorySize], [Width], [Length], [Thickness]) VALUES (82, 2000, CAST(101.60 AS Decimal(5, 2)), 147, CAST(26.1 AS Decimal(3, 1)))
GO
SET IDENTITY_INSERT [dbo].[GraphicProcessor] ON 

INSERT [dbo].[GraphicProcessor] ([Id], [Name]) VALUES (4, N'
GeForce GT 1030')
INSERT [dbo].[GraphicProcessor] ([Id], [Name]) VALUES (2, N'
GeForce GT 730')
INSERT [dbo].[GraphicProcessor] ([Id], [Name]) VALUES (3, N'
Radeon RX 550')
INSERT [dbo].[GraphicProcessor] ([Id], [Name]) VALUES (1, N'GeForce 210')
INSERT [dbo].[GraphicProcessor] ([Id], [Name]) VALUES (5, N'GeForce RTX 4090')
SET IDENTITY_INSERT [dbo].[GraphicProcessor] OFF
GO
SET IDENTITY_INSERT [dbo].[GraphicsProcessingUnit] ON 

INSERT [dbo].[GraphicsProcessingUnit] ([Id], [Name], [MaxFrequency], [ExecutiveUnitQuantity], [ShadingUnitsQuantity]) VALUES (2, N'Intel HD Graphics 510', 1000, 12, 96)
INSERT [dbo].[GraphicsProcessingUnit] ([Id], [Name], [MaxFrequency], [ExecutiveUnitQuantity], [ShadingUnitsQuantity]) VALUES (3, N'AMD Radeon R5', 800, 4, 256)
INSERT [dbo].[GraphicsProcessingUnit] ([Id], [Name], [MaxFrequency], [ExecutiveUnitQuantity], [ShadingUnitsQuantity]) VALUES (4, N'Intel UHD Graphics 610', 1050, 12, 96)
INSERT [dbo].[GraphicsProcessingUnit] ([Id], [Name], [MaxFrequency], [ExecutiveUnitQuantity], [ShadingUnitsQuantity]) VALUES (5, N'Intel UHD Graphics 710', 1300, 16, 128)
INSERT [dbo].[GraphicsProcessingUnit] ([Id], [Name], [MaxFrequency], [ExecutiveUnitQuantity], [ShadingUnitsQuantity]) VALUES (6, N'AMD Radeon Vega 7', 1900, 7, 448)
INSERT [dbo].[GraphicsProcessingUnit] ([Id], [Name], [MaxFrequency], [ExecutiveUnitQuantity], [ShadingUnitsQuantity]) VALUES (7, N'Intel UHD Graphics 730', 1450, 24, 192)
SET IDENTITY_INSERT [dbo].[GraphicsProcessingUnit] OFF
GO
INSERT [dbo].[HDD] ([IdDataStorage], [FormFactor], [CacheSize], [RotationSpeed], [WriteTech], [ActiveNoiseLevel], [PassiveNoiseLevel], [PassiveEnergyUse], [MaxEnergyUse], [MaxTemp]) VALUES (26, N'3.5"', 32, 7200, N'CMR', 26, 25, CAST(3.70 AS Decimal(4, 2)), CAST(6.40 AS Decimal(4, 2)), 60)
INSERT [dbo].[HDD] ([IdDataStorage], [FormFactor], [CacheSize], [RotationSpeed], [WriteTech], [ActiveNoiseLevel], [PassiveNoiseLevel], [PassiveEnergyUse], [MaxEnergyUse], [MaxTemp]) VALUES (27, N'2.5"', 32, 7200, N'SMR', 25, 24, CAST(0.85 AS Decimal(4, 2)), CAST(2.00 AS Decimal(4, 2)), 60)
INSERT [dbo].[HDD] ([IdDataStorage], [FormFactor], [CacheSize], [RotationSpeed], [WriteTech], [ActiveNoiseLevel], [PassiveNoiseLevel], [PassiveEnergyUse], [MaxEnergyUse], [MaxTemp]) VALUES (82, N'3.5"', 256, 5400, N'SMR', 26, 21, CAST(2.30 AS Decimal(4, 2)), CAST(4.10 AS Decimal(4, 2)), 60)
GO
SET IDENTITY_INSERT [dbo].[LightingType] ON 

INSERT [dbo].[LightingType] ([Id], [Name]) VALUES (1, N'ARGB')
INSERT [dbo].[LightingType] ([Id], [Name]) VALUES (2, N'FRGB')
INSERT [dbo].[LightingType] ([Id], [Name]) VALUES (3, N'RGB')
INSERT [dbo].[LightingType] ([Id], [Name]) VALUES (4, N'одноцветная')
SET IDENTITY_INSERT [dbo].[LightingType] OFF
GO
INSERT [dbo].[LiquidCooler] ([IdProcessorCooler], [Serviced], [IdWaterblockMaterial], [WaterblockSize], [IdRadiatorSize], [RadiatorLength], [RadiatorWidth], [RadiatorThickness], [PumpRotationSpeed], [PumpConnector], [PipeLength], [TransparentPipe]) VALUES (18, 0, 3, N'64.5 x 63 x 44.1', 1, 154, 120, 27, 2600, N'3-pin', 320, 0)
INSERT [dbo].[LiquidCooler] ([IdProcessorCooler], [Serviced], [IdWaterblockMaterial], [WaterblockSize], [IdRadiatorSize], [RadiatorLength], [RadiatorWidth], [RadiatorThickness], [PumpRotationSpeed], [PumpConnector], [PipeLength], [TransparentPipe]) VALUES (76, 0, 3, N'91 x 80 x 52', 1, 159, 120, 27, 2400, N'3-pin', 315, 0)
GO
SET IDENTITY_INSERT [dbo].[M2FormFactor] ON 

INSERT [dbo].[M2FormFactor] ([Id], [Name]) VALUES (4, N'22110')
INSERT [dbo].[M2FormFactor] ([Id], [Name]) VALUES (1, N'2242')
INSERT [dbo].[M2FormFactor] ([Id], [Name]) VALUES (2, N'2260')
INSERT [dbo].[M2FormFactor] ([Id], [Name]) VALUES (3, N'2280')
SET IDENTITY_INSERT [dbo].[M2FormFactor] OFF
GO
SET IDENTITY_INSERT [dbo].[M2Key] ON 

INSERT [dbo].[M2Key] ([Id], [Name]) VALUES (1, N'B')
INSERT [dbo].[M2Key] ([Id], [Name]) VALUES (2, N'M')
SET IDENTITY_INSERT [dbo].[M2Key] OFF
GO
INSERT [dbo].[M2SSD] ([IdSSD], [IdFormFactor]) VALUES (29, 3)
INSERT [dbo].[M2SSD] ([IdSSD], [IdFormFactor]) VALUES (30, 3)
GO
INSERT [dbo].[M2SSDKey] ([IdM2SSD], [IdKey]) VALUES (29, 1)
INSERT [dbo].[M2SSDKey] ([IdM2SSD], [IdKey]) VALUES (29, 2)
INSERT [dbo].[M2SSDKey] ([IdM2SSD], [IdKey]) VALUES (30, 2)
GO
SET IDENTITY_INSERT [dbo].[Manufacturer] ON 

INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (12, N'Advantech')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (22, N'Aerocool')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (2, N'AFOX')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (5, N'AMD')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (16, N'ASRock')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (27, N'ASUS')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (6, N'Biostar')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (29, N'Chieftec')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (8, N'Cooler Master')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (10, N'DarkFlash')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (23, N'Deepcool')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (7, N'DEXP')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (32, N'Elitegroup ')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (3, N'Esonic')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (13, N'ExeGate')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (21, N'GIGABYTE')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (30, N'Hynix')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (1, N'Intel')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (24, N'InWin')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (11, N'Kingston')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (31, N'LIAN LI')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (25, N'MSI')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (26, N'Palit')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (33, N'Silicon Power')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (9, N'Thermalright')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (28, N'Thermaltake ')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (14, N'Toshiba')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (15, N'WD')
INSERT [dbo].[Manufacturer] ([Id], [Name]) VALUES (4, N'Winard')
SET IDENTITY_INSERT [dbo].[Manufacturer] OFF
GO
SET IDENTITY_INSERT [dbo].[Material] ON 

INSERT [dbo].[Material] ([Id], [Name]) VALUES (5, N'акрил (оргстекло)')
INSERT [dbo].[Material] ([Id], [Name]) VALUES (4, N'алюминий')
INSERT [dbo].[Material] ([Id], [Name]) VALUES (7, N'алюминий\медь')
INSERT [dbo].[Material] ([Id], [Name]) VALUES (3, N'медь')
INSERT [dbo].[Material] ([Id], [Name]) VALUES (2, N'пластик')
INSERT [dbo].[Material] ([Id], [Name]) VALUES (1, N'сталь')
INSERT [dbo].[Material] ([Id], [Name]) VALUES (6, N'стекло')
SET IDENTITY_INSERT [dbo].[Material] OFF
GO
SET IDENTITY_INSERT [dbo].[Microarchitecture] ON 

INSERT [dbo].[Microarchitecture] ([Id], [Name]) VALUES (4, N'
AMD GCN')
INSERT [dbo].[Microarchitecture] ([Id], [Name]) VALUES (6, N'
NVIDIA Ada Lovelace')
INSERT [dbo].[Microarchitecture] ([Id], [Name]) VALUES (5, N'
NVIDIA Pascal')
INSERT [dbo].[Microarchitecture] ([Id], [Name]) VALUES (3, N'NVIDIA Fermi')
INSERT [dbo].[Microarchitecture] ([Id], [Name]) VALUES (1, N'NVIDIA Tesla')
SET IDENTITY_INSERT [dbo].[Microarchitecture] OFF
GO
INSERT [dbo].[MotherBoard] ([IdComponent], [IdMotherBoardFormFactor], [IdSocket], [IdRAMType], [IdRAMFormFactor], [MaxRAMSize], [RAMQuantity], [PCIEx16Quantity], [SATAQuantity], [M2Quantity], [Height], [Width], [IdChipset], [MaxRAMFrequency], [IdPCIControllerVersion], [RJ45Quantity], [AnalogAudioOutputQuantity], [CoolerPowerSupply], [M2KeyE], [InterfaceLPT], [SoundSchema], [IdSoundAdapterChipset], [IdNetworkAdapterChipset], [NetworkAdapterSpeed], [HasWiFi], [HasBluetooth], [PowerPhaseQuantity], [IdMotherBoardPowerPlug], [IdProcessorPowerPlug], [StreamRAMQuantity], [EmbeddedProcessor]) VALUES (7, 5, 1, 4, 1, 64, 2, 1, 4, 1, 190, 170, 1, 2666, 1, 1, 3, N'4-pin', 0, 0, N'5.1', 1, 1, 1, 0, 0, 5, 1, 1, 2, NULL)
INSERT [dbo].[MotherBoard] ([IdComponent], [IdMotherBoardFormFactor], [IdSocket], [IdRAMType], [IdRAMFormFactor], [MaxRAMSize], [RAMQuantity], [PCIEx16Quantity], [SATAQuantity], [M2Quantity], [Height], [Width], [IdChipset], [MaxRAMFrequency], [IdPCIControllerVersion], [RJ45Quantity], [AnalogAudioOutputQuantity], [CoolerPowerSupply], [M2KeyE], [InterfaceLPT], [SoundSchema], [IdSoundAdapterChipset], [IdNetworkAdapterChipset], [NetworkAdapterSpeed], [HasWiFi], [HasBluetooth], [PowerPhaseQuantity], [IdMotherBoardPowerPlug], [IdProcessorPowerPlug], [StreamRAMQuantity], [EmbeddedProcessor]) VALUES (8, 1, 1, 4, 1, 32, 2, 1, 4, 0, 305, 244, 2, 2400, 1, 1, 3, N'4-pin', 0, 0, N'5.1', 2, 2, 1, 0, 0, 6, 1, 1, 2, NULL)
INSERT [dbo].[MotherBoard] ([IdComponent], [IdMotherBoardFormFactor], [IdSocket], [IdRAMType], [IdRAMFormFactor], [MaxRAMSize], [RAMQuantity], [PCIEx16Quantity], [SATAQuantity], [M2Quantity], [Height], [Width], [IdChipset], [MaxRAMFrequency], [IdPCIControllerVersion], [RJ45Quantity], [AnalogAudioOutputQuantity], [CoolerPowerSupply], [M2KeyE], [InterfaceLPT], [SoundSchema], [IdSoundAdapterChipset], [IdNetworkAdapterChipset], [NetworkAdapterSpeed], [HasWiFi], [HasBluetooth], [PowerPhaseQuantity], [IdMotherBoardPowerPlug], [IdProcessorPowerPlug], [StreamRAMQuantity], [EmbeddedProcessor]) VALUES (12, 6, 8, 4, 1, 64, 2, 1, 4, 1, 170, 170, 3, 2667, 1, 1, 3, N'4-pin', 0, 0, N'5.1', 3, 2, 1, 0, 0, 7, 1, 1, 2, NULL)
INSERT [dbo].[MotherBoard] ([IdComponent], [IdMotherBoardFormFactor], [IdSocket], [IdRAMType], [IdRAMFormFactor], [MaxRAMSize], [RAMQuantity], [PCIEx16Quantity], [SATAQuantity], [M2Quantity], [Height], [Width], [IdChipset], [MaxRAMFrequency], [IdPCIControllerVersion], [RJ45Quantity], [AnalogAudioOutputQuantity], [CoolerPowerSupply], [M2KeyE], [InterfaceLPT], [SoundSchema], [IdSoundAdapterChipset], [IdNetworkAdapterChipset], [NetworkAdapterSpeed], [HasWiFi], [HasBluetooth], [PowerPhaseQuantity], [IdMotherBoardPowerPlug], [IdProcessorPowerPlug], [StreamRAMQuantity], [EmbeddedProcessor]) VALUES (43, 2, 20, 4, 1, 64, 2, 1, 4, 0, 197, 188, 4, 3200, 1, 1, 3, N'4-pin', 0, 0, N'7.1', 4, 2, 1, 0, 0, 5, 1, 2, 2, NULL)
INSERT [dbo].[MotherBoard] ([IdComponent], [IdMotherBoardFormFactor], [IdSocket], [IdRAMType], [IdRAMFormFactor], [MaxRAMSize], [RAMQuantity], [PCIEx16Quantity], [SATAQuantity], [M2Quantity], [Height], [Width], [IdChipset], [MaxRAMFrequency], [IdPCIControllerVersion], [RJ45Quantity], [AnalogAudioOutputQuantity], [CoolerPowerSupply], [M2KeyE], [InterfaceLPT], [SoundSchema], [IdSoundAdapterChipset], [IdNetworkAdapterChipset], [NetworkAdapterSpeed], [HasWiFi], [HasBluetooth], [PowerPhaseQuantity], [IdMotherBoardPowerPlug], [IdProcessorPowerPlug], [StreamRAMQuantity], [EmbeddedProcessor]) VALUES (44, 2, 20, 4, 1, 64, 2, 1, 2, 1, 226, 185, 4, 3200, 1, 1, 3, N'4-pin', 0, 0, N'7.1', NULL, NULL, 1, 0, 0, 5, 1, 2, 2, NULL)
INSERT [dbo].[MotherBoard] ([IdComponent], [IdMotherBoardFormFactor], [IdSocket], [IdRAMType], [IdRAMFormFactor], [MaxRAMSize], [RAMQuantity], [PCIEx16Quantity], [SATAQuantity], [M2Quantity], [Height], [Width], [IdChipset], [MaxRAMFrequency], [IdPCIControllerVersion], [RJ45Quantity], [AnalogAudioOutputQuantity], [CoolerPowerSupply], [M2KeyE], [InterfaceLPT], [SoundSchema], [IdSoundAdapterChipset], [IdNetworkAdapterChipset], [NetworkAdapterSpeed], [HasWiFi], [HasBluetooth], [PowerPhaseQuantity], [IdMotherBoardPowerPlug], [IdProcessorPowerPlug], [StreamRAMQuantity], [EmbeddedProcessor]) VALUES (45, 2, 17, 4, 1, 64, 2, 1, 4, 0, 197, 188, 5, 2933, 1, 1, 3, N'4-pin', 0, 0, N'7.1', 5, 2, 1, 0, 0, 5, 1, 2, 2, NULL)
INSERT [dbo].[MotherBoard] ([IdComponent], [IdMotherBoardFormFactor], [IdSocket], [IdRAMType], [IdRAMFormFactor], [MaxRAMSize], [RAMQuantity], [PCIEx16Quantity], [SATAQuantity], [M2Quantity], [Height], [Width], [IdChipset], [MaxRAMFrequency], [IdPCIControllerVersion], [RJ45Quantity], [AnalogAudioOutputQuantity], [CoolerPowerSupply], [M2KeyE], [InterfaceLPT], [SoundSchema], [IdSoundAdapterChipset], [IdNetworkAdapterChipset], [NetworkAdapterSpeed], [HasWiFi], [HasBluetooth], [PowerPhaseQuantity], [IdMotherBoardPowerPlug], [IdProcessorPowerPlug], [StreamRAMQuantity], [EmbeddedProcessor]) VALUES (46, 2, 17, 4, 1, 128, 4, 1, 6, 2, 244, 244, 6, 3200, 2, 1, 3, N'4-pin', 0, 1, N'7.1', NULL, 3, 1, 0, 0, 8, 1, 2, 2, NULL)
INSERT [dbo].[MotherBoard] ([IdComponent], [IdMotherBoardFormFactor], [IdSocket], [IdRAMType], [IdRAMFormFactor], [MaxRAMSize], [RAMQuantity], [PCIEx16Quantity], [SATAQuantity], [M2Quantity], [Height], [Width], [IdChipset], [MaxRAMFrequency], [IdPCIControllerVersion], [RJ45Quantity], [AnalogAudioOutputQuantity], [CoolerPowerSupply], [M2KeyE], [InterfaceLPT], [SoundSchema], [IdSoundAdapterChipset], [IdNetworkAdapterChipset], [NetworkAdapterSpeed], [HasWiFi], [HasBluetooth], [PowerPhaseQuantity], [IdMotherBoardPowerPlug], [IdProcessorPowerPlug], [StreamRAMQuantity], [EmbeddedProcessor]) VALUES (47, 2, 12, 3, 1, 16, 2, 1, 4, 0, 220, 170, 7, 1600, 1, 1, 3, N'4-pin', 0, 0, N'5.1', 1, 1, 1, 0, 0, 4, 1, 1, 2, NULL)
INSERT [dbo].[MotherBoard] ([IdComponent], [IdMotherBoardFormFactor], [IdSocket], [IdRAMType], [IdRAMFormFactor], [MaxRAMSize], [RAMQuantity], [PCIEx16Quantity], [SATAQuantity], [M2Quantity], [Height], [Width], [IdChipset], [MaxRAMFrequency], [IdPCIControllerVersion], [RJ45Quantity], [AnalogAudioOutputQuantity], [CoolerPowerSupply], [M2KeyE], [InterfaceLPT], [SoundSchema], [IdSoundAdapterChipset], [IdNetworkAdapterChipset], [NetworkAdapterSpeed], [HasWiFi], [HasBluetooth], [PowerPhaseQuantity], [IdMotherBoardPowerPlug], [IdProcessorPowerPlug], [StreamRAMQuantity], [EmbeddedProcessor]) VALUES (83, 2, 8, 4, 1, 32, 2, 1, 4, 0, 226, 174, 8, 2933, 1, 1, 3, N'4-pin', 0, 0, N'7.1', 5, 2, 1, 0, 0, 5, 1, 1, 2, NULL)
INSERT [dbo].[MotherBoard] ([IdComponent], [IdMotherBoardFormFactor], [IdSocket], [IdRAMType], [IdRAMFormFactor], [MaxRAMSize], [RAMQuantity], [PCIEx16Quantity], [SATAQuantity], [M2Quantity], [Height], [Width], [IdChipset], [MaxRAMFrequency], [IdPCIControllerVersion], [RJ45Quantity], [AnalogAudioOutputQuantity], [CoolerPowerSupply], [M2KeyE], [InterfaceLPT], [SoundSchema], [IdSoundAdapterChipset], [IdNetworkAdapterChipset], [NetworkAdapterSpeed], [HasWiFi], [HasBluetooth], [PowerPhaseQuantity], [IdMotherBoardPowerPlug], [IdProcessorPowerPlug], [StreamRAMQuantity], [EmbeddedProcessor]) VALUES (85, 6, 22, 4, 2, 8, 1, 0, 2, 1, 170, 170, 9, 2400, NULL, 1, 3, NULL, 1, 1, N'7.1', 5, 2, 1, 0, 0, 1, 1, NULL, 1, N'
Intel Celeron N4020 2x1.1 ГГц')
GO
INSERT [dbo].[MotherBoardCompatibleCore] ([IdMotherBoard], [IdCore]) VALUES (7, 2)
INSERT [dbo].[MotherBoardCompatibleCore] ([IdMotherBoard], [IdCore]) VALUES (7, 3)
INSERT [dbo].[MotherBoardCompatibleCore] ([IdMotherBoard], [IdCore]) VALUES (7, 11)
INSERT [dbo].[MotherBoardCompatibleCore] ([IdMotherBoard], [IdCore]) VALUES (8, 2)
INSERT [dbo].[MotherBoardCompatibleCore] ([IdMotherBoard], [IdCore]) VALUES (8, 3)
INSERT [dbo].[MotherBoardCompatibleCore] ([IdMotherBoard], [IdCore]) VALUES (12, 4)
INSERT [dbo].[MotherBoardCompatibleCore] ([IdMotherBoard], [IdCore]) VALUES (12, 5)
INSERT [dbo].[MotherBoardCompatibleCore] ([IdMotherBoard], [IdCore]) VALUES (12, 6)
INSERT [dbo].[MotherBoardCompatibleCore] ([IdMotherBoard], [IdCore]) VALUES (12, 7)
INSERT [dbo].[MotherBoardCompatibleCore] ([IdMotherBoard], [IdCore]) VALUES (12, 8)
INSERT [dbo].[MotherBoardCompatibleCore] ([IdMotherBoard], [IdCore]) VALUES (12, 9)
INSERT [dbo].[MotherBoardCompatibleCore] ([IdMotherBoard], [IdCore]) VALUES (12, 10)
INSERT [dbo].[MotherBoardCompatibleCore] ([IdMotherBoard], [IdCore]) VALUES (43, 15)
INSERT [dbo].[MotherBoardCompatibleCore] ([IdMotherBoard], [IdCore]) VALUES (43, 18)
INSERT [dbo].[MotherBoardCompatibleCore] ([IdMotherBoard], [IdCore]) VALUES (44, 15)
INSERT [dbo].[MotherBoardCompatibleCore] ([IdMotherBoard], [IdCore]) VALUES (44, 18)
INSERT [dbo].[MotherBoardCompatibleCore] ([IdMotherBoard], [IdCore]) VALUES (45, 14)
INSERT [dbo].[MotherBoardCompatibleCore] ([IdMotherBoard], [IdCore]) VALUES (45, 19)
INSERT [dbo].[MotherBoardCompatibleCore] ([IdMotherBoard], [IdCore]) VALUES (46, 14)
INSERT [dbo].[MotherBoardCompatibleCore] ([IdMotherBoard], [IdCore]) VALUES (46, 19)
INSERT [dbo].[MotherBoardCompatibleCore] ([IdMotherBoard], [IdCore]) VALUES (47, 13)
INSERT [dbo].[MotherBoardCompatibleCore] ([IdMotherBoard], [IdCore]) VALUES (47, 20)
INSERT [dbo].[MotherBoardCompatibleCore] ([IdMotherBoard], [IdCore]) VALUES (47, 21)
INSERT [dbo].[MotherBoardCompatibleCore] ([IdMotherBoard], [IdCore]) VALUES (47, 22)
INSERT [dbo].[MotherBoardCompatibleCore] ([IdMotherBoard], [IdCore]) VALUES (47, 23)
INSERT [dbo].[MotherBoardCompatibleCore] ([IdMotherBoard], [IdCore]) VALUES (47, 24)
INSERT [dbo].[MotherBoardCompatibleCore] ([IdMotherBoard], [IdCore]) VALUES (47, 25)
INSERT [dbo].[MotherBoardCompatibleCore] ([IdMotherBoard], [IdCore]) VALUES (47, 26)
INSERT [dbo].[MotherBoardCompatibleCore] ([IdMotherBoard], [IdCore]) VALUES (47, 27)
INSERT [dbo].[MotherBoardCompatibleCore] ([IdMotherBoard], [IdCore]) VALUES (47, 28)
INSERT [dbo].[MotherBoardCompatibleCore] ([IdMotherBoard], [IdCore]) VALUES (83, 4)
INSERT [dbo].[MotherBoardCompatibleCore] ([IdMotherBoard], [IdCore]) VALUES (83, 5)
INSERT [dbo].[MotherBoardCompatibleCore] ([IdMotherBoard], [IdCore]) VALUES (83, 6)
INSERT [dbo].[MotherBoardCompatibleCore] ([IdMotherBoard], [IdCore]) VALUES (83, 7)
INSERT [dbo].[MotherBoardCompatibleCore] ([IdMotherBoard], [IdCore]) VALUES (83, 8)
INSERT [dbo].[MotherBoardCompatibleCore] ([IdMotherBoard], [IdCore]) VALUES (83, 9)
INSERT [dbo].[MotherBoardCompatibleCore] ([IdMotherBoard], [IdCore]) VALUES (83, 10)
INSERT [dbo].[MotherBoardCompatibleCore] ([IdMotherBoard], [IdCore]) VALUES (83, 12)
INSERT [dbo].[MotherBoardCompatibleCore] ([IdMotherBoard], [IdCore]) VALUES (83, 16)
INSERT [dbo].[MotherBoardCompatibleCore] ([IdMotherBoard], [IdCore]) VALUES (85, 29)
GO
INSERT [dbo].[MotherBoardConnector] ([IdMotherBoard], [IdConnector], [Quantity]) VALUES (7, 4, 2)
INSERT [dbo].[MotherBoardConnector] ([IdMotherBoard], [IdConnector], [Quantity]) VALUES (7, 5, 4)
INSERT [dbo].[MotherBoardConnector] ([IdMotherBoard], [IdConnector], [Quantity]) VALUES (8, 4, 4)
INSERT [dbo].[MotherBoardConnector] ([IdMotherBoard], [IdConnector], [Quantity]) VALUES (8, 6, 1)
INSERT [dbo].[MotherBoardConnector] ([IdMotherBoard], [IdConnector], [Quantity]) VALUES (8, 7, 1)
INSERT [dbo].[MotherBoardConnector] ([IdMotherBoard], [IdConnector], [Quantity]) VALUES (12, 4, 4)
INSERT [dbo].[MotherBoardConnector] ([IdMotherBoard], [IdConnector], [Quantity]) VALUES (12, 5, 2)
INSERT [dbo].[MotherBoardConnector] ([IdMotherBoard], [IdConnector], [Quantity]) VALUES (12, 8, 1)
INSERT [dbo].[MotherBoardConnector] ([IdMotherBoard], [IdConnector], [Quantity]) VALUES (43, 4, 1)
INSERT [dbo].[MotherBoardConnector] ([IdMotherBoard], [IdConnector], [Quantity]) VALUES (43, 5, 4)
INSERT [dbo].[MotherBoardConnector] ([IdMotherBoard], [IdConnector], [Quantity]) VALUES (43, 8, 1)
INSERT [dbo].[MotherBoardConnector] ([IdMotherBoard], [IdConnector], [Quantity]) VALUES (44, 4, 2)
INSERT [dbo].[MotherBoardConnector] ([IdMotherBoard], [IdConnector], [Quantity]) VALUES (44, 5, 4)
INSERT [dbo].[MotherBoardConnector] ([IdMotherBoard], [IdConnector], [Quantity]) VALUES (45, 4, 2)
INSERT [dbo].[MotherBoardConnector] ([IdMotherBoard], [IdConnector], [Quantity]) VALUES (45, 5, 4)
INSERT [dbo].[MotherBoardConnector] ([IdMotherBoard], [IdConnector], [Quantity]) VALUES (45, 8, 1)
INSERT [dbo].[MotherBoardConnector] ([IdMotherBoard], [IdConnector], [Quantity]) VALUES (46, 2, 2)
INSERT [dbo].[MotherBoardConnector] ([IdMotherBoard], [IdConnector], [Quantity]) VALUES (46, 4, 3)
INSERT [dbo].[MotherBoardConnector] ([IdMotherBoard], [IdConnector], [Quantity]) VALUES (46, 8, 1)
INSERT [dbo].[MotherBoardConnector] ([IdMotherBoard], [IdConnector], [Quantity]) VALUES (46, 9, 1)
INSERT [dbo].[MotherBoardConnector] ([IdMotherBoard], [IdConnector], [Quantity]) VALUES (47, 5, 4)
INSERT [dbo].[MotherBoardConnector] ([IdMotherBoard], [IdConnector], [Quantity]) VALUES (47, 6, 1)
INSERT [dbo].[MotherBoardConnector] ([IdMotherBoard], [IdConnector], [Quantity]) VALUES (47, 7, 1)
INSERT [dbo].[MotherBoardConnector] ([IdMotherBoard], [IdConnector], [Quantity]) VALUES (83, 4, 1)
INSERT [dbo].[MotherBoardConnector] ([IdMotherBoard], [IdConnector], [Quantity]) VALUES (83, 5, 2)
INSERT [dbo].[MotherBoardConnector] ([IdMotherBoard], [IdConnector], [Quantity]) VALUES (83, 8, 1)
INSERT [dbo].[MotherBoardConnector] ([IdMotherBoard], [IdConnector], [Quantity]) VALUES (85, 4, 4)
INSERT [dbo].[MotherBoardConnector] ([IdMotherBoard], [IdConnector], [Quantity]) VALUES (85, 5, 1)
GO
INSERT [dbo].[MotherBoardConnectorPlug] ([IdMotherBoardPowerPlug], [IdMotherBoardConnector]) VALUES (1, 2)
INSERT [dbo].[MotherBoardConnectorPlug] ([IdMotherBoardPowerPlug], [IdMotherBoardConnector]) VALUES (1, 3)
GO
SET IDENTITY_INSERT [dbo].[MotherBoardFormFactor] ON 

INSERT [dbo].[MotherBoardFormFactor] ([Id], [Name]) VALUES (1, N'Standard-ATX')
INSERT [dbo].[MotherBoardFormFactor] ([Id], [Name]) VALUES (2, N'Micro-ATX')
INSERT [dbo].[MotherBoardFormFactor] ([Id], [Name]) VALUES (3, N'Flex-ATX')
INSERT [dbo].[MotherBoardFormFactor] ([Id], [Name]) VALUES (4, N'Mini-ATX')
INSERT [dbo].[MotherBoardFormFactor] ([Id], [Name]) VALUES (5, N'Mini-DTX')
INSERT [dbo].[MotherBoardFormFactor] ([Id], [Name]) VALUES (6, N'Mini-ITX')
INSERT [dbo].[MotherBoardFormFactor] ([Id], [Name]) VALUES (7, N'E-ATX')
SET IDENTITY_INSERT [dbo].[MotherBoardFormFactor] OFF
GO
INSERT [dbo].[MotherBoardM2Key] ([IdMotherBoard], [IdFormFactor], [IdKey]) VALUES (7, 1, 2)
INSERT [dbo].[MotherBoardM2Key] ([IdMotherBoard], [IdFormFactor], [IdKey]) VALUES (7, 2, 2)
INSERT [dbo].[MotherBoardM2Key] ([IdMotherBoard], [IdFormFactor], [IdKey]) VALUES (7, 3, 2)
INSERT [dbo].[MotherBoardM2Key] ([IdMotherBoard], [IdFormFactor], [IdKey]) VALUES (12, 2, 2)
INSERT [dbo].[MotherBoardM2Key] ([IdMotherBoard], [IdFormFactor], [IdKey]) VALUES (12, 3, 2)
INSERT [dbo].[MotherBoardM2Key] ([IdMotherBoard], [IdFormFactor], [IdKey]) VALUES (44, 2, 2)
INSERT [dbo].[MotherBoardM2Key] ([IdMotherBoard], [IdFormFactor], [IdKey]) VALUES (44, 3, 2)
INSERT [dbo].[MotherBoardM2Key] ([IdMotherBoard], [IdFormFactor], [IdKey]) VALUES (46, 2, 2)
INSERT [dbo].[MotherBoardM2Key] ([IdMotherBoard], [IdFormFactor], [IdKey]) VALUES (46, 3, 2)
INSERT [dbo].[MotherBoardM2Key] ([IdMotherBoard], [IdFormFactor], [IdKey]) VALUES (46, 4, 2)
INSERT [dbo].[MotherBoardM2Key] ([IdMotherBoard], [IdFormFactor], [IdKey]) VALUES (85, 3, 2)
GO
SET IDENTITY_INSERT [dbo].[MotherBoardPowerConnector] ON 

INSERT [dbo].[MotherBoardPowerConnector] ([Id], [Name]) VALUES (2, N'20 + 4 pin')
INSERT [dbo].[MotherBoardPowerConnector] ([Id], [Name]) VALUES (1, N'20 pin')
INSERT [dbo].[MotherBoardPowerConnector] ([Id], [Name]) VALUES (3, N'24 pin')
SET IDENTITY_INSERT [dbo].[MotherBoardPowerConnector] OFF
GO
SET IDENTITY_INSERT [dbo].[MotherBoardPowerPlug] ON 

INSERT [dbo].[MotherBoardPowerPlug] ([Id], [Name]) VALUES (1, N'24-pin')
SET IDENTITY_INSERT [dbo].[MotherBoardPowerPlug] OFF
GO
INSERT [dbo].[MotherBoardVideoOutput] ([IdMotherBoard], [IdVideoOutput]) VALUES (7, 1)
INSERT [dbo].[MotherBoardVideoOutput] ([IdMotherBoard], [IdVideoOutput]) VALUES (7, 2)
INSERT [dbo].[MotherBoardVideoOutput] ([IdMotherBoard], [IdVideoOutput]) VALUES (8, 1)
INSERT [dbo].[MotherBoardVideoOutput] ([IdMotherBoard], [IdVideoOutput]) VALUES (8, 2)
INSERT [dbo].[MotherBoardVideoOutput] ([IdMotherBoard], [IdVideoOutput]) VALUES (12, 1)
INSERT [dbo].[MotherBoardVideoOutput] ([IdMotherBoard], [IdVideoOutput]) VALUES (12, 2)
INSERT [dbo].[MotherBoardVideoOutput] ([IdMotherBoard], [IdVideoOutput]) VALUES (43, 1)
INSERT [dbo].[MotherBoardVideoOutput] ([IdMotherBoard], [IdVideoOutput]) VALUES (43, 2)
INSERT [dbo].[MotherBoardVideoOutput] ([IdMotherBoard], [IdVideoOutput]) VALUES (44, 1)
INSERT [dbo].[MotherBoardVideoOutput] ([IdMotherBoard], [IdVideoOutput]) VALUES (45, 1)
INSERT [dbo].[MotherBoardVideoOutput] ([IdMotherBoard], [IdVideoOutput]) VALUES (45, 2)
INSERT [dbo].[MotherBoardVideoOutput] ([IdMotherBoard], [IdVideoOutput]) VALUES (46, 1)
INSERT [dbo].[MotherBoardVideoOutput] ([IdMotherBoard], [IdVideoOutput]) VALUES (46, 4)
INSERT [dbo].[MotherBoardVideoOutput] ([IdMotherBoard], [IdVideoOutput]) VALUES (46, 5)
INSERT [dbo].[MotherBoardVideoOutput] ([IdMotherBoard], [IdVideoOutput]) VALUES (47, 1)
INSERT [dbo].[MotherBoardVideoOutput] ([IdMotherBoard], [IdVideoOutput]) VALUES (47, 2)
INSERT [dbo].[MotherBoardVideoOutput] ([IdMotherBoard], [IdVideoOutput]) VALUES (83, 1)
INSERT [dbo].[MotherBoardVideoOutput] ([IdMotherBoard], [IdVideoOutput]) VALUES (83, 2)
INSERT [dbo].[MotherBoardVideoOutput] ([IdMotherBoard], [IdVideoOutput]) VALUES (85, 1)
INSERT [dbo].[MotherBoardVideoOutput] ([IdMotherBoard], [IdVideoOutput]) VALUES (85, 2)
GO
SET IDENTITY_INSERT [dbo].[NetworkAdapterChipset] ON 

INSERT [dbo].[NetworkAdapterChipset] ([Id], [Name]) VALUES (1, N'Realtek RTL8105/8106')
INSERT [dbo].[NetworkAdapterChipset] ([Id], [Name]) VALUES (2, N'Realtek RTL8111H')
INSERT [dbo].[NetworkAdapterChipset] ([Id], [Name]) VALUES (3, N'Realtek RTL8118')
SET IDENTITY_INSERT [dbo].[NetworkAdapterChipset] OFF
GO
SET IDENTITY_INSERT [dbo].[PCIEController] ON 

INSERT [dbo].[PCIEController] ([Id], [Name]) VALUES (4, N'PCI-E 2.0')
INSERT [dbo].[PCIEController] ([Id], [Name]) VALUES (1, N'PCI-E 3.0')
INSERT [dbo].[PCIEController] ([Id], [Name]) VALUES (2, N'PCI-E 4.0')
INSERT [dbo].[PCIEController] ([Id], [Name]) VALUES (3, N'PCI-E 5.0')
SET IDENTITY_INSERT [dbo].[PCIEController] OFF
GO
SET IDENTITY_INSERT [dbo].[Picture] ON 

INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (82, 6, N'6_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (83, 7, N'7_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (84, 8, N'8_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (85, 8, N'8_2.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (86, 8, N'8_3.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (87, 8, N'8_4.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (88, 9, N'9_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (89, 9, N'9_2.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (90, 10, N'10_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (91, 11, N'11_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (92, 12, N'12_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (93, 12, N'12_2.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (94, 12, N'12_3.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (95, 13, N'13_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (96, 15, N'15_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (97, 16, N'16_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (98, 18, N'18_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (99, 18, N'18_2.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (100, 19, N'19_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (101, 20, N'20_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (102, 21, N'21_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (103, 22, N'22_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (104, 23, N'23_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (105, 24, N'24_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (106, 24, N'24_2.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (107, 25, N'25_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (108, 26, N'26_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (109, 27, N'27_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (110, 28, N'28_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (111, 29, N'29_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (112, 30, N'30_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (113, 31, N'31_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (114, 32, N'32_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (115, 32, N'32_2.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (116, 33, N'33_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (117, 33, N'33_2.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (118, 33, N'33_3.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (119, 34, N'34_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (120, 34, N'34_2.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (121, 34, N'34_3.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (122, 35, N'35_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (123, 37, N'37_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (124, 37, N'37_2.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (125, 37, N'37_3.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (126, 38, N'38_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (127, 39, N'39_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (128, 40, N'40_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (129, 42, N'42_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (130, 43, N'43_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (131, 43, N'43_2.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (132, 43, N'43_3.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (133, 43, N'43_4.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (134, 44, N'44_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (135, 44, N'44_2.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (136, 44, N'44_3.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (137, 44, N'44_4.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (138, 44, N'44_5.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (139, 45, N'45_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (140, 45, N'45_2.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (141, 45, N'45_3.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (142, 45, N'45_4.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (143, 46, N'46_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (144, 46, N'46_2.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (145, 46, N'46_3.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (146, 46, N'46_4.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (147, 46, N'46_5.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (148, 47, N'47_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (149, 47, N'47_2.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (150, 47, N'47_3.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (151, 47, N'47_4.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (152, 47, N'47_5.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (153, 57, N'57_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (154, 58, N'58_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (155, 58, N'58_2.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (156, 58, N'58_3.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (157, 58, N'58_4.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (158, 59, N'59_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (159, 60, N'60_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (160, 61, N'61_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (161, 61, N'61_2.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (162, 61, N'61_3.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (163, 62, N'62_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (164, 62, N'62_2.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (165, 62, N'62_3.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (166, 63, N'63_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (167, 64, N'64_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (168, 64, N'64_2.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (169, 65, N'65_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (170, 65, N'65_2.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (171, 66, N'66_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (172, 66, N'66_2.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (173, 67, N'67_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (174, 67, N'67_2.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (175, 68, N'68_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (176, 68, N'68_2.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (177, 70, N'70_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (178, 70, N'70_2.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (179, 72, N'72_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (180, 73, N'73_1.jpg')
GO
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (182, 74, N'74_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (183, 76, N'76_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (184, 76, N'76_2.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (185, 76, N'76_3.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (186, 76, N'76_4.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (187, 77, N'77_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (188, 77, N'77_2.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (189, 78, N'78_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (190, 78, N'78_2.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (191, 79, N'79_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (192, 79, N'79_2.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (193, 79, N'79_3.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (194, 79, N'79_4.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (195, 81, N'81_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (196, 82, N'82_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (197, 82, N'82_2.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (198, 83, N'83_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (199, 83, N'83_2.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (200, 83, N'83_3.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (201, 84, N'84_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (202, 84, N'84_2.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (203, 84, N'84_3.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (204, 85, N'85_1.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (205, 85, N'85_2.jpg')
INSERT [dbo].[Picture] ([Id], [IdComponent], [Path]) VALUES (206, 86, N'86_1.jpg')
SET IDENTITY_INSERT [dbo].[Picture] OFF
GO
INSERT [dbo].[PowerSupply] ([IdComponent], [IdPowerSupplyFormFactor], [Power], [SATAConnectorQuantity], [IdColor], [CoolerSystem], [Length], [Width], [Heigth]) VALUES (23, 1, 700, 4, 2, N'активная', 140, 150, 86)
INSERT [dbo].[PowerSupply] ([IdComponent], [IdPowerSupplyFormFactor], [Power], [SATAConnectorQuantity], [IdColor], [CoolerSystem], [Length], [Width], [Heigth]) VALUES (24, 1, 350, 2, 2, N'активная', 110, 150, 86)
INSERT [dbo].[PowerSupply] ([IdComponent], [IdPowerSupplyFormFactor], [Power], [SATAConnectorQuantity], [IdColor], [CoolerSystem], [Length], [Width], [Heigth]) VALUES (25, 1, 500, 3, 2, N'активная', 140, 150, 86)
INSERT [dbo].[PowerSupply] ([IdComponent], [IdPowerSupplyFormFactor], [Power], [SATAConnectorQuantity], [IdColor], [CoolerSystem], [Length], [Width], [Heigth]) VALUES (77, 1, 350, 3, 1, N'активная', 140, 150, 86)
INSERT [dbo].[PowerSupply] ([IdComponent], [IdPowerSupplyFormFactor], [Power], [SATAConnectorQuantity], [IdColor], [CoolerSystem], [Length], [Width], [Heigth]) VALUES (78, 1, 450, 4, 1, N'активная', 140, 150, 86)
INSERT [dbo].[PowerSupply] ([IdComponent], [IdPowerSupplyFormFactor], [Power], [SATAConnectorQuantity], [IdColor], [CoolerSystem], [Length], [Width], [Heigth]) VALUES (79, 1, 1000, 9, 1, N'активная', 160, 150, 86)
INSERT [dbo].[PowerSupply] ([IdComponent], [IdPowerSupplyFormFactor], [Power], [SATAConnectorQuantity], [IdColor], [CoolerSystem], [Length], [Width], [Heigth]) VALUES (86, 2, 550, 3, 1, N'активная', 100, 125, 64)
GO
SET IDENTITY_INSERT [dbo].[PowerSupplyFormFactor] ON 

INSERT [dbo].[PowerSupplyFormFactor] ([Id], [Name]) VALUES (1, N'ATX')
INSERT [dbo].[PowerSupplyFormFactor] ([Id], [Name]) VALUES (2, N'SFX')
SET IDENTITY_INSERT [dbo].[PowerSupplyFormFactor] OFF
GO
INSERT [dbo].[PowerSupplyMotherBoardConnector] ([IdPowerSupply], [IdMotherBoardPowerConnector], [Quantity]) VALUES (23, 2, 1)
INSERT [dbo].[PowerSupplyMotherBoardConnector] ([IdPowerSupply], [IdMotherBoardPowerConnector], [Quantity]) VALUES (24, 2, 1)
INSERT [dbo].[PowerSupplyMotherBoardConnector] ([IdPowerSupply], [IdMotherBoardPowerConnector], [Quantity]) VALUES (25, 2, 1)
INSERT [dbo].[PowerSupplyMotherBoardConnector] ([IdPowerSupply], [IdMotherBoardPowerConnector], [Quantity]) VALUES (77, 2, 1)
INSERT [dbo].[PowerSupplyMotherBoardConnector] ([IdPowerSupply], [IdMotherBoardPowerConnector], [Quantity]) VALUES (78, 2, 1)
INSERT [dbo].[PowerSupplyMotherBoardConnector] ([IdPowerSupply], [IdMotherBoardPowerConnector], [Quantity]) VALUES (79, 2, 1)
INSERT [dbo].[PowerSupplyMotherBoardConnector] ([IdPowerSupply], [IdMotherBoardPowerConnector], [Quantity]) VALUES (86, 2, 1)
GO
INSERT [dbo].[PowerSupplyProcessorPowerConnector] ([IdPowerSupply], [IdProcessorPowerConnector], [Quantity]) VALUES (23, 2, 1)
INSERT [dbo].[PowerSupplyProcessorPowerConnector] ([IdPowerSupply], [IdProcessorPowerConnector], [Quantity]) VALUES (23, 3, 1)
INSERT [dbo].[PowerSupplyProcessorPowerConnector] ([IdPowerSupply], [IdProcessorPowerConnector], [Quantity]) VALUES (24, 1, 1)
INSERT [dbo].[PowerSupplyProcessorPowerConnector] ([IdPowerSupply], [IdProcessorPowerConnector], [Quantity]) VALUES (25, 2, 2)
INSERT [dbo].[PowerSupplyProcessorPowerConnector] ([IdPowerSupply], [IdProcessorPowerConnector], [Quantity]) VALUES (77, 1, 1)
INSERT [dbo].[PowerSupplyProcessorPowerConnector] ([IdPowerSupply], [IdProcessorPowerConnector], [Quantity]) VALUES (78, 3, 1)
INSERT [dbo].[PowerSupplyProcessorPowerConnector] ([IdPowerSupply], [IdProcessorPowerConnector], [Quantity]) VALUES (79, 2, 1)
INSERT [dbo].[PowerSupplyProcessorPowerConnector] ([IdPowerSupply], [IdProcessorPowerConnector], [Quantity]) VALUES (79, 3, 1)
INSERT [dbo].[PowerSupplyProcessorPowerConnector] ([IdPowerSupply], [IdProcessorPowerConnector], [Quantity]) VALUES (86, 2, 1)
GO
INSERT [dbo].[PowerSupplyVideoPowerConnector] ([IdPowerSupply], [IdVideoPowerConnector], [Quantity]) VALUES (23, 1, 1)
INSERT [dbo].[PowerSupplyVideoPowerConnector] ([IdPowerSupply], [IdVideoPowerConnector], [Quantity]) VALUES (25, 1, 1)
INSERT [dbo].[PowerSupplyVideoPowerConnector] ([IdPowerSupply], [IdVideoPowerConnector], [Quantity]) VALUES (78, 1, 1)
INSERT [dbo].[PowerSupplyVideoPowerConnector] ([IdPowerSupply], [IdVideoPowerConnector], [Quantity]) VALUES (79, 1, 6)
GO
INSERT [dbo].[Processor] ([IdComponent], [IdSocket], [IdGraphicsProcessingUnit], [IdCore], [MaxMemorySize], [HasCooler], [CoreQuantity], [MaxThreadQuantity], [ProductiveCoreQuantity], [EnergyEfficientCoreQuantity], [CacheL2Size], [CacheL3Size], [TechProcess], [BaseFrequency], [MaxFrequency], [BaseFrequencyEnergyEfficientCore], [MaxFrequencyEnergyEfficientCore], [FreeMultiplier], [MaxRAMFrequency], [StreamRAMQuantity], [HasECC], [TDP], [MaxTemperature], [IdPCIEController], [PCIEQuantity]) VALUES (6, 1, 2, 2, 64, 0, 2, 2, 2, NULL, CAST(0.5 AS Decimal(3, 1)), CAST(3.0 AS Decimal(3, 1)), 14, CAST(3.3 AS Decimal(3, 1)), NULL, NULL, NULL, 0, 2133, 2, 1, 54, 72, 1, 16)
INSERT [dbo].[Processor] ([IdComponent], [IdSocket], [IdGraphicsProcessingUnit], [IdCore], [MaxMemorySize], [HasCooler], [CoreQuantity], [MaxThreadQuantity], [ProductiveCoreQuantity], [EnergyEfficientCoreQuantity], [CacheL2Size], [CacheL3Size], [TechProcess], [BaseFrequency], [MaxFrequency], [BaseFrequencyEnergyEfficientCore], [MaxFrequencyEnergyEfficientCore], [FreeMultiplier], [MaxRAMFrequency], [StreamRAMQuantity], [HasECC], [TDP], [MaxTemperature], [IdPCIEController], [PCIEQuantity]) VALUES (11, 8, NULL, 4, 128, 0, 4, 4, 4, NULL, CAST(2.0 AS Decimal(3, 1)), CAST(8.0 AS Decimal(3, 1)), 14, CAST(3.1 AS Decimal(3, 1)), CAST(3.4 AS Decimal(3, 1)), NULL, NULL, 1, 2667, 2, 0, 65, 95, 1, 20)
INSERT [dbo].[Processor] ([IdComponent], [IdSocket], [IdGraphicsProcessingUnit], [IdCore], [MaxMemorySize], [HasCooler], [CoreQuantity], [MaxThreadQuantity], [ProductiveCoreQuantity], [EnergyEfficientCoreQuantity], [CacheL2Size], [CacheL3Size], [TechProcess], [BaseFrequency], [MaxFrequency], [BaseFrequencyEnergyEfficientCore], [MaxFrequencyEnergyEfficientCore], [FreeMultiplier], [MaxRAMFrequency], [StreamRAMQuantity], [HasECC], [TDP], [MaxTemperature], [IdPCIEController], [PCIEQuantity]) VALUES (31, 8, 3, 12, 64, 0, 2, 2, 2, NULL, CAST(1.0 AS Decimal(3, 1)), CAST(1.0 AS Decimal(3, 1)), 28, CAST(3.0 AS Decimal(3, 1)), CAST(3.4 AS Decimal(3, 1)), NULL, NULL, 0, 2400, 2, 0, 35, 90, 1, 8)
INSERT [dbo].[Processor] ([IdComponent], [IdSocket], [IdGraphicsProcessingUnit], [IdCore], [MaxMemorySize], [HasCooler], [CoreQuantity], [MaxThreadQuantity], [ProductiveCoreQuantity], [EnergyEfficientCoreQuantity], [CacheL2Size], [CacheL3Size], [TechProcess], [BaseFrequency], [MaxFrequency], [BaseFrequencyEnergyEfficientCore], [MaxFrequencyEnergyEfficientCore], [FreeMultiplier], [MaxRAMFrequency], [StreamRAMQuantity], [HasECC], [TDP], [MaxTemperature], [IdPCIEController], [PCIEQuantity]) VALUES (32, 12, NULL, 13, 128, 1, 4, 4, 4, NULL, CAST(4.0 AS Decimal(3, 1)), CAST(4.0 AS Decimal(3, 1)), 32, CAST(3.8 AS Decimal(3, 1)), CAST(4.0 AS Decimal(3, 1)), NULL, NULL, 1, 1866, 2, 0, 95, 70, NULL, 4)
INSERT [dbo].[Processor] ([IdComponent], [IdSocket], [IdGraphicsProcessingUnit], [IdCore], [MaxMemorySize], [HasCooler], [CoreQuantity], [MaxThreadQuantity], [ProductiveCoreQuantity], [EnergyEfficientCoreQuantity], [CacheL2Size], [CacheL3Size], [TechProcess], [BaseFrequency], [MaxFrequency], [BaseFrequencyEnergyEfficientCore], [MaxFrequencyEnergyEfficientCore], [FreeMultiplier], [MaxRAMFrequency], [StreamRAMQuantity], [HasECC], [TDP], [MaxTemperature], [IdPCIEController], [PCIEQuantity]) VALUES (33, 17, 4, 14, 128, 1, 2, 2, 2, NULL, CAST(0.5 AS Decimal(3, 1)), CAST(4.0 AS Decimal(3, 1)), 14, CAST(3.5 AS Decimal(3, 1)), NULL, NULL, NULL, 0, 2666, 2, 0, 58, 100, 1, 16)
INSERT [dbo].[Processor] ([IdComponent], [IdSocket], [IdGraphicsProcessingUnit], [IdCore], [MaxMemorySize], [HasCooler], [CoreQuantity], [MaxThreadQuantity], [ProductiveCoreQuantity], [EnergyEfficientCoreQuantity], [CacheL2Size], [CacheL3Size], [TechProcess], [BaseFrequency], [MaxFrequency], [BaseFrequencyEnergyEfficientCore], [MaxFrequencyEnergyEfficientCore], [FreeMultiplier], [MaxRAMFrequency], [StreamRAMQuantity], [HasECC], [TDP], [MaxTemperature], [IdPCIEController], [PCIEQuantity]) VALUES (34, 20, 5, 15, 128, 1, 2, 2, 2, NULL, CAST(2.5 AS Decimal(3, 1)), CAST(4.0 AS Decimal(3, 1)), 7, CAST(3.4 AS Decimal(3, 1)), NULL, NULL, NULL, 0, 4800, 2, 0, 46, 100, 3, 20)
INSERT [dbo].[Processor] ([IdComponent], [IdSocket], [IdGraphicsProcessingUnit], [IdCore], [MaxMemorySize], [HasCooler], [CoreQuantity], [MaxThreadQuantity], [ProductiveCoreQuantity], [EnergyEfficientCoreQuantity], [CacheL2Size], [CacheL3Size], [TechProcess], [BaseFrequency], [MaxFrequency], [BaseFrequencyEnergyEfficientCore], [MaxFrequencyEnergyEfficientCore], [FreeMultiplier], [MaxRAMFrequency], [StreamRAMQuantity], [HasECC], [TDP], [MaxTemperature], [IdPCIEController], [PCIEQuantity]) VALUES (35, 17, NULL, 14, 128, 0, 4, 8, 4, NULL, CAST(1.0 AS Decimal(3, 1)), CAST(6.0 AS Decimal(3, 1)), 14, CAST(3.7 AS Decimal(3, 1)), CAST(4.4 AS Decimal(3, 1)), NULL, NULL, 0, 2666, 2, 0, 65, 100, 1, 16)
INSERT [dbo].[Processor] ([IdComponent], [IdSocket], [IdGraphicsProcessingUnit], [IdCore], [MaxMemorySize], [HasCooler], [CoreQuantity], [MaxThreadQuantity], [ProductiveCoreQuantity], [EnergyEfficientCoreQuantity], [CacheL2Size], [CacheL3Size], [TechProcess], [BaseFrequency], [MaxFrequency], [BaseFrequencyEnergyEfficientCore], [MaxFrequencyEnergyEfficientCore], [FreeMultiplier], [MaxRAMFrequency], [StreamRAMQuantity], [HasECC], [TDP], [MaxTemperature], [IdPCIEController], [PCIEQuantity]) VALUES (37, 17, NULL, 14, 128, 1, 6, 12, 6, NULL, CAST(1.5 AS Decimal(3, 1)), CAST(12.0 AS Decimal(3, 1)), 14, CAST(2.9 AS Decimal(3, 1)), CAST(4.3 AS Decimal(3, 1)), NULL, NULL, 0, 2666, 2, 0, 65, 100, 1, 16)
INSERT [dbo].[Processor] ([IdComponent], [IdSocket], [IdGraphicsProcessingUnit], [IdCore], [MaxMemorySize], [HasCooler], [CoreQuantity], [MaxThreadQuantity], [ProductiveCoreQuantity], [EnergyEfficientCoreQuantity], [CacheL2Size], [CacheL3Size], [TechProcess], [BaseFrequency], [MaxFrequency], [BaseFrequencyEnergyEfficientCore], [MaxFrequencyEnergyEfficientCore], [FreeMultiplier], [MaxRAMFrequency], [StreamRAMQuantity], [HasECC], [TDP], [MaxTemperature], [IdPCIEController], [PCIEQuantity]) VALUES (38, 8, 6, 16, 128, 0, 6, 12, 6, NULL, CAST(3.0 AS Decimal(3, 1)), CAST(16.0 AS Decimal(3, 1)), 7, CAST(3.9 AS Decimal(3, 1)), CAST(4.4 AS Decimal(3, 1)), NULL, NULL, 1, 3200, 2, 0, 65, 95, 1, 16)
INSERT [dbo].[Processor] ([IdComponent], [IdSocket], [IdGraphicsProcessingUnit], [IdCore], [MaxMemorySize], [HasCooler], [CoreQuantity], [MaxThreadQuantity], [ProductiveCoreQuantity], [EnergyEfficientCoreQuantity], [CacheL2Size], [CacheL3Size], [TechProcess], [BaseFrequency], [MaxFrequency], [BaseFrequencyEnergyEfficientCore], [MaxFrequencyEnergyEfficientCore], [FreeMultiplier], [MaxRAMFrequency], [StreamRAMQuantity], [HasECC], [TDP], [MaxTemperature], [IdPCIEController], [PCIEQuantity]) VALUES (39, 8, NULL, 10, 128, 0, 6, 12, 6, NULL, CAST(3.0 AS Decimal(3, 1)), CAST(32.0 AS Decimal(3, 1)), 7, CAST(3.7 AS Decimal(3, 1)), CAST(4.6 AS Decimal(3, 1)), NULL, NULL, 1, 3200, 2, 0, 65, 95, 2, 20)
INSERT [dbo].[Processor] ([IdComponent], [IdSocket], [IdGraphicsProcessingUnit], [IdCore], [MaxMemorySize], [HasCooler], [CoreQuantity], [MaxThreadQuantity], [ProductiveCoreQuantity], [EnergyEfficientCoreQuantity], [CacheL2Size], [CacheL3Size], [TechProcess], [BaseFrequency], [MaxFrequency], [BaseFrequencyEnergyEfficientCore], [MaxFrequencyEnergyEfficientCore], [FreeMultiplier], [MaxRAMFrequency], [StreamRAMQuantity], [HasECC], [TDP], [MaxTemperature], [IdPCIEController], [PCIEQuantity]) VALUES (40, 20, 7, 15, 128, 0, 6, 12, 6, NULL, CAST(7.5 AS Decimal(3, 1)), CAST(18.0 AS Decimal(3, 1)), 7, CAST(2.5 AS Decimal(3, 1)), CAST(4.4 AS Decimal(3, 1)), NULL, NULL, 0, 4800, 2, 0, 117, 100, 3, 20)
INSERT [dbo].[Processor] ([IdComponent], [IdSocket], [IdGraphicsProcessingUnit], [IdCore], [MaxMemorySize], [HasCooler], [CoreQuantity], [MaxThreadQuantity], [ProductiveCoreQuantity], [EnergyEfficientCoreQuantity], [CacheL2Size], [CacheL3Size], [TechProcess], [BaseFrequency], [MaxFrequency], [BaseFrequencyEnergyEfficientCore], [MaxFrequencyEnergyEfficientCore], [FreeMultiplier], [MaxRAMFrequency], [StreamRAMQuantity], [HasECC], [TDP], [MaxTemperature], [IdPCIEController], [PCIEQuantity]) VALUES (42, 17, NULL, 14, 128, 0, 8, 16, 8, NULL, CAST(2.0 AS Decimal(3, 1)), CAST(16.0 AS Decimal(3, 1)), 14, CAST(2.9 AS Decimal(3, 1)), CAST(4.8 AS Decimal(3, 1)), NULL, NULL, 0, 2933, 2, 0, 65, 100, 1, 16)
GO
INSERT [dbo].[ProcessorCompatibleMemoryType] ([IdProcessor], [IdRAMType]) VALUES (32, 3)
INSERT [dbo].[ProcessorCompatibleMemoryType] ([IdProcessor], [IdRAMType]) VALUES (6, 4)
INSERT [dbo].[ProcessorCompatibleMemoryType] ([IdProcessor], [IdRAMType]) VALUES (11, 4)
INSERT [dbo].[ProcessorCompatibleMemoryType] ([IdProcessor], [IdRAMType]) VALUES (31, 4)
INSERT [dbo].[ProcessorCompatibleMemoryType] ([IdProcessor], [IdRAMType]) VALUES (33, 4)
INSERT [dbo].[ProcessorCompatibleMemoryType] ([IdProcessor], [IdRAMType]) VALUES (34, 4)
INSERT [dbo].[ProcessorCompatibleMemoryType] ([IdProcessor], [IdRAMType]) VALUES (35, 4)
INSERT [dbo].[ProcessorCompatibleMemoryType] ([IdProcessor], [IdRAMType]) VALUES (37, 4)
INSERT [dbo].[ProcessorCompatibleMemoryType] ([IdProcessor], [IdRAMType]) VALUES (38, 4)
INSERT [dbo].[ProcessorCompatibleMemoryType] ([IdProcessor], [IdRAMType]) VALUES (39, 4)
INSERT [dbo].[ProcessorCompatibleMemoryType] ([IdProcessor], [IdRAMType]) VALUES (40, 4)
INSERT [dbo].[ProcessorCompatibleMemoryType] ([IdProcessor], [IdRAMType]) VALUES (42, 4)
INSERT [dbo].[ProcessorCompatibleMemoryType] ([IdProcessor], [IdRAMType]) VALUES (34, 5)
INSERT [dbo].[ProcessorCompatibleMemoryType] ([IdProcessor], [IdRAMType]) VALUES (40, 5)
INSERT [dbo].[ProcessorCompatibleMemoryType] ([IdProcessor], [IdRAMType]) VALUES (6, 6)
GO
INSERT [dbo].[ProcessorConnectorPlug] ([IdProcessorPowerPlug], [IdProcessorPowerConnector]) VALUES (1, 1)
INSERT [dbo].[ProcessorConnectorPlug] ([IdProcessorPowerPlug], [IdProcessorPowerConnector]) VALUES (1, 2)
INSERT [dbo].[ProcessorConnectorPlug] ([IdProcessorPowerPlug], [IdProcessorPowerConnector]) VALUES (2, 2)
INSERT [dbo].[ProcessorConnectorPlug] ([IdProcessorPowerPlug], [IdProcessorPowerConnector]) VALUES (2, 3)
GO
INSERT [dbo].[ProcessorCooler] ([IdComponent], [IdRadiatorMaterial], [FanQuantity], [FanSize], [FanConnector], [MaxRotationSpeed], [MinRotationSpeed], [AdjustmentRotationSpeed], [MaxNoiseLevel], [MaxAirflow], [MaxStaticPressure], [BearingType], [TDP]) VALUES (15, 4, 1, N'80 x 80', N'3-pin', 2500, 2500, NULL, 28, CAST(30.00 AS Decimal(5, 2)), CAST(21.30 AS Decimal(5, 2)), N'скольжения (с винтовой нарезкой)', 65)
INSERT [dbo].[ProcessorCooler] ([IdComponent], [IdRadiatorMaterial], [FanQuantity], [FanSize], [FanConnector], [MaxRotationSpeed], [MinRotationSpeed], [AdjustmentRotationSpeed], [MaxNoiseLevel], [MaxAirflow], [MaxStaticPressure], [BearingType], [TDP]) VALUES (16, 4, 2, N'150 x 140', N'4-pin', 2500, 600, N'автоматическая (PWM)', 45, CAST(130.00 AS Decimal(5, 2)), CAST(29.40 AS Decimal(5, 2)), N'
качения (шарикоподшипник)', 320)
INSERT [dbo].[ProcessorCooler] ([IdComponent], [IdRadiatorMaterial], [FanQuantity], [FanSize], [FanConnector], [MaxRotationSpeed], [MinRotationSpeed], [AdjustmentRotationSpeed], [MaxNoiseLevel], [MaxAirflow], [MaxStaticPressure], [BearingType], [TDP]) VALUES (18, 4, 1, N'120 x 120', N'4-pin', 1800, 600, N'автоматическая (PWM)', 35, CAST(70.64 AS Decimal(5, 2)), CAST(20.60 AS Decimal(5, 2)), N'скольжения (гидродинамический)', 180)
INSERT [dbo].[ProcessorCooler] ([IdComponent], [IdRadiatorMaterial], [FanQuantity], [FanSize], [FanConnector], [MaxRotationSpeed], [MinRotationSpeed], [AdjustmentRotationSpeed], [MaxNoiseLevel], [MaxAirflow], [MaxStaticPressure], [BearingType], [TDP]) VALUES (72, 4, 1, N'92 x 92', N'3-pin', 2000, 2000, NULL, 27, CAST(39.81 AS Decimal(5, 2)), CAST(26.70 AS Decimal(5, 2)), N'скольжения (гидродинамический)', 82)
INSERT [dbo].[ProcessorCooler] ([IdComponent], [IdRadiatorMaterial], [FanQuantity], [FanSize], [FanConnector], [MaxRotationSpeed], [MinRotationSpeed], [AdjustmentRotationSpeed], [MaxNoiseLevel], [MaxAirflow], [MaxStaticPressure], [BearingType], [TDP]) VALUES (73, 4, 1, N'92 x 92', N'3-pin', 2200, 2200, NULL, 32, CAST(42.95 AS Decimal(5, 2)), NULL, N'скольжения (гидродинамический)', 100)
INSERT [dbo].[ProcessorCooler] ([IdComponent], [IdRadiatorMaterial], [FanQuantity], [FanSize], [FanConnector], [MaxRotationSpeed], [MinRotationSpeed], [AdjustmentRotationSpeed], [MaxNoiseLevel], [MaxAirflow], [MaxStaticPressure], [BearingType], [TDP]) VALUES (74, 4, 1, N'92 x 92', N'4-pin', 3500, 1200, N'автоматическая (PWM)', 37, CAST(56.84 AS Decimal(5, 2)), CAST(29.50 AS Decimal(5, 2)), N'скольжения (гидродинамический)', 95)
INSERT [dbo].[ProcessorCooler] ([IdComponent], [IdRadiatorMaterial], [FanQuantity], [FanSize], [FanConnector], [MaxRotationSpeed], [MinRotationSpeed], [AdjustmentRotationSpeed], [MaxNoiseLevel], [MaxAirflow], [MaxStaticPressure], [BearingType], [TDP]) VALUES (76, 4, 1, N'120 x 120', N'4-pin', 2250, 550, N'автоматическая (PWM)', 33, CAST(85.85 AS Decimal(5, 2)), CAST(32.00 AS Decimal(5, 2)), N'скольжения (гидродинамический)', 180)
GO
SET IDENTITY_INSERT [dbo].[ProcessorPowerConnector] ON 

INSERT [dbo].[ProcessorPowerConnector] ([Id], [Name]) VALUES (2, N'4 + 4 pin')
INSERT [dbo].[ProcessorPowerConnector] ([Id], [Name]) VALUES (1, N'4 pin')
INSERT [dbo].[ProcessorPowerConnector] ([Id], [Name]) VALUES (3, N'8 pin')
SET IDENTITY_INSERT [dbo].[ProcessorPowerConnector] OFF
GO
SET IDENTITY_INSERT [dbo].[ProcessorPowerPlug] ON 

INSERT [dbo].[ProcessorPowerPlug] ([Id], [Name]) VALUES (1, N'4-pin')
INSERT [dbo].[ProcessorPowerPlug] ([Id], [Name]) VALUES (2, N'8-pin')
SET IDENTITY_INSERT [dbo].[ProcessorPowerPlug] OFF
GO
SET IDENTITY_INSERT [dbo].[RadiatorSize] ON 

INSERT [dbo].[RadiatorSize] ([Id], [Size]) VALUES (1, 120)
INSERT [dbo].[RadiatorSize] ([Id], [Size]) VALUES (2, 240)
INSERT [dbo].[RadiatorSize] ([Id], [Size]) VALUES (3, 360)
SET IDENTITY_INSERT [dbo].[RadiatorSize] OFF
GO
INSERT [dbo].[RAM] ([IdComponent], [IdRAMFormFactor], [IdRAMType], [MemorySize], [Frequency], [HasRegistr], [HasECC], [CASLatency], [RAStoCAASDelay], [RowPrechargeDelay], [ActivateToPreChargeDelay], [HasRadiator], [Voltage]) VALUES (19, 1, 6, 2, 1600, 0, 0, 11, 11, 11, 28, 0, CAST(1.35 AS Decimal(3, 2)))
INSERT [dbo].[RAM] ([IdComponent], [IdRAMFormFactor], [IdRAMType], [MemorySize], [Frequency], [HasRegistr], [HasECC], [CASLatency], [RAStoCAASDelay], [RowPrechargeDelay], [ActivateToPreChargeDelay], [HasRadiator], [Voltage]) VALUES (20, 1, 4, 4, 2133, 0, 0, 15, 15, 15, 35, 0, CAST(1.20 AS Decimal(3, 2)))
INSERT [dbo].[RAM] ([IdComponent], [IdRAMFormFactor], [IdRAMType], [MemorySize], [Frequency], [HasRegistr], [HasECC], [CASLatency], [RAStoCAASDelay], [RowPrechargeDelay], [ActivateToPreChargeDelay], [HasRadiator], [Voltage]) VALUES (21, 1, 2, 2, 800, 0, 0, 6, 6, 6, 15, 0, CAST(1.80 AS Decimal(3, 2)))
INSERT [dbo].[RAM] ([IdComponent], [IdRAMFormFactor], [IdRAMType], [MemorySize], [Frequency], [HasRegistr], [HasECC], [CASLatency], [RAStoCAASDelay], [RowPrechargeDelay], [ActivateToPreChargeDelay], [HasRadiator], [Voltage]) VALUES (22, 2, 3, 4, 1333, 0, 0, 9, 9, 9, 24, 0, CAST(1.50 AS Decimal(3, 2)))
INSERT [dbo].[RAM] ([IdComponent], [IdRAMFormFactor], [IdRAMType], [MemorySize], [Frequency], [HasRegistr], [HasECC], [CASLatency], [RAStoCAASDelay], [RowPrechargeDelay], [ActivateToPreChargeDelay], [HasRadiator], [Voltage]) VALUES (81, 1, 2, 1, 800, 0, 0, 6, NULL, NULL, NULL, 0, CAST(1.80 AS Decimal(3, 2)))
INSERT [dbo].[RAM] ([IdComponent], [IdRAMFormFactor], [IdRAMType], [MemorySize], [Frequency], [HasRegistr], [HasECC], [CASLatency], [RAStoCAASDelay], [RowPrechargeDelay], [ActivateToPreChargeDelay], [HasRadiator], [Voltage]) VALUES (88, 2, 4, 4, 2666, 0, 0, 19, NULL, NULL, NULL, 0, CAST(1.20 AS Decimal(3, 2)))
GO
SET IDENTITY_INSERT [dbo].[RAMFormFactor] ON 

INSERT [dbo].[RAMFormFactor] ([Id], [Name]) VALUES (1, N'DIMM')
INSERT [dbo].[RAMFormFactor] ([Id], [Name]) VALUES (2, N'SO-DIMM')
SET IDENTITY_INSERT [dbo].[RAMFormFactor] OFF
GO
SET IDENTITY_INSERT [dbo].[RAMType] ON 

INSERT [dbo].[RAMType] ([Id], [Name]) VALUES (1, N'DDR')
INSERT [dbo].[RAMType] ([Id], [Name]) VALUES (2, N'DDR2')
INSERT [dbo].[RAMType] ([Id], [Name]) VALUES (3, N'DDR3')
INSERT [dbo].[RAMType] ([Id], [Name]) VALUES (6, N'DDR3L')
INSERT [dbo].[RAMType] ([Id], [Name]) VALUES (4, N'DDR4')
INSERT [dbo].[RAMType] ([Id], [Name]) VALUES (5, N'DDR5')
SET IDENTITY_INSERT [dbo].[RAMType] OFF
GO
SET IDENTITY_INSERT [dbo].[Socket] ON 

INSERT [dbo].[Socket] ([Id], [Name]) VALUES (9, N'AM2')
INSERT [dbo].[Socket] ([Id], [Name]) VALUES (10, N'AM2+')
INSERT [dbo].[Socket] ([Id], [Name]) VALUES (11, N'AM3')
INSERT [dbo].[Socket] ([Id], [Name]) VALUES (12, N'AM3+')
INSERT [dbo].[Socket] ([Id], [Name]) VALUES (8, N'AM4')
INSERT [dbo].[Socket] ([Id], [Name]) VALUES (21, N'AM5')
INSERT [dbo].[Socket] ([Id], [Name]) VALUES (22, N'BGA1090')
INSERT [dbo].[Socket] ([Id], [Name]) VALUES (13, N'FM1')
INSERT [dbo].[Socket] ([Id], [Name]) VALUES (14, N'FM2')
INSERT [dbo].[Socket] ([Id], [Name]) VALUES (15, N'FM2+')
INSERT [dbo].[Socket] ([Id], [Name]) VALUES (2, N'LGA 1150')
INSERT [dbo].[Socket] ([Id], [Name]) VALUES (1, N'LGA 1151')
INSERT [dbo].[Socket] ([Id], [Name]) VALUES (16, N'LGA 1151-v2')
INSERT [dbo].[Socket] ([Id], [Name]) VALUES (3, N'LGA 1155')
INSERT [dbo].[Socket] ([Id], [Name]) VALUES (6, N'LGA 1156')
INSERT [dbo].[Socket] ([Id], [Name]) VALUES (17, N'LGA 1200')
INSERT [dbo].[Socket] ([Id], [Name]) VALUES (7, N'LGA 1366')
INSERT [dbo].[Socket] ([Id], [Name]) VALUES (20, N'LGA 1700')
INSERT [dbo].[Socket] ([Id], [Name]) VALUES (4, N'LGA 2011')
INSERT [dbo].[Socket] ([Id], [Name]) VALUES (18, N'LGA 2011-v3')
INSERT [dbo].[Socket] ([Id], [Name]) VALUES (19, N'LGA 2066')
INSERT [dbo].[Socket] ([Id], [Name]) VALUES (5, N'LGA 775')
SET IDENTITY_INSERT [dbo].[Socket] OFF
GO
SET IDENTITY_INSERT [dbo].[SoundAdapterChipset] ON 

INSERT [dbo].[SoundAdapterChipset] ([Id], [Name]) VALUES (2, N'
Realtek ALC661')
INSERT [dbo].[SoundAdapterChipset] ([Id], [Name]) VALUES (3, N'
Realtek ALC887')
INSERT [dbo].[SoundAdapterChipset] ([Id], [Name]) VALUES (1, N'Realtek ALC662')
INSERT [dbo].[SoundAdapterChipset] ([Id], [Name]) VALUES (4, N'Realtek ALC887/897')
INSERT [dbo].[SoundAdapterChipset] ([Id], [Name]) VALUES (5, N'Realtek ALC897')
SET IDENTITY_INSERT [dbo].[SoundAdapterChipset] OFF
GO
INSERT [dbo].[SSD] ([IdDataStorage], [BitQuantityOnCell], [MemoryStructure], [WriteSpeed], [ReadSpeed], [TotalBytesWritten], [DWPD]) VALUES (28, N'3 бит TLC', N'3D NAND', 337, 432, 30, CAST(0.68 AS Decimal(3, 2)))
INSERT [dbo].[SSD] ([IdDataStorage], [BitQuantityOnCell], [MemoryStructure], [WriteSpeed], [ReadSpeed], [TotalBytesWritten], [DWPD]) VALUES (29, N'3 бит TLC', N'3D NAND', 489, 550, 50, CAST(0.58 AS Decimal(3, 2)))
INSERT [dbo].[SSD] ([IdDataStorage], [BitQuantityOnCell], [MemoryStructure], [WriteSpeed], [ReadSpeed], [TotalBytesWritten], [DWPD]) VALUES (30, N'3 бит TLC', N'3D NAND', 600, 1200, 40, CAST(0.29 AS Decimal(3, 2)))
GO
INSERT [dbo].[VideoCard] ([IdComponent], [Length], [IdGraphicProcessor], [IdMicroarchitecture], [TechProcess], [VideoMemorySize], [IdVideoMemoryType], [MemoryBusBitRate], [MaxMemoryBandwidth], [EffectiveMemoryFrequency], [VideoChipFrequency], [ALUQuantity], [TextureBlockQuantity], [RasterizationBlockQuantity], [RayTracingSupport], [MaxMonitorQuantity], [IdPCIEController], [PowerSupply], [CoolerType], [FanType], [FanQuantity], [ExpansionSlotSize], [Thickness], [Mass], [IdVideoCardPowerPlug]) VALUES (10, 155, 1, 1, 40, 1, 1, 64, CAST(6.4 AS Decimal(5, 1)), 1000, 460, 16, 8, 4, 0, 3, 4, 350, N'активное воздушное', N'осевой', 1, 1, 30, 275, NULL)
INSERT [dbo].[VideoCard] ([IdComponent], [Length], [IdGraphicProcessor], [IdMicroarchitecture], [TechProcess], [VideoMemorySize], [IdVideoMemoryType], [MemoryBusBitRate], [MaxMemoryBandwidth], [EffectiveMemoryFrequency], [VideoChipFrequency], [ALUQuantity], [TextureBlockQuantity], [RasterizationBlockQuantity], [RayTracingSupport], [MaxMonitorQuantity], [IdPCIEController], [PowerSupply], [CoolerType], [FanType], [FanQuantity], [ExpansionSlotSize], [Thickness], [Mass], [IdVideoCardPowerPlug]) VALUES (65, 152, 2, 3, 40, 2, 1, 128, CAST(25.6 AS Decimal(5, 1)), 1600, 700, 96, 16, 4, 0, 3, 4, 300, N'активное воздушное', N'осевой', 1, 2, 38, NULL, NULL)
INSERT [dbo].[VideoCard] ([IdComponent], [Length], [IdGraphicProcessor], [IdMicroarchitecture], [TechProcess], [VideoMemorySize], [IdVideoMemoryType], [MemoryBusBitRate], [MaxMemoryBandwidth], [EffectiveMemoryFrequency], [VideoChipFrequency], [ALUQuantity], [TextureBlockQuantity], [RasterizationBlockQuantity], [RayTracingSupport], [MaxMonitorQuantity], [IdPCIEController], [PowerSupply], [CoolerType], [FanType], [FanQuantity], [ExpansionSlotSize], [Thickness], [Mass], [IdVideoCardPowerPlug]) VALUES (66, 181, 3, 4, 14, 2, 4, 64, CAST(48.0 AS Decimal(5, 1)), 6000, 1100, 512, 32, 16, 0, 2, 1, 300, N'активное воздушное', N'осевой', 1, 1, 19, 175, NULL)
INSERT [dbo].[VideoCard] ([IdComponent], [Length], [IdGraphicProcessor], [IdMicroarchitecture], [TechProcess], [VideoMemorySize], [IdVideoMemoryType], [MemoryBusBitRate], [MaxMemoryBandwidth], [EffectiveMemoryFrequency], [VideoChipFrequency], [ALUQuantity], [TextureBlockQuantity], [RasterizationBlockQuantity], [RayTracingSupport], [MaxMonitorQuantity], [IdPCIEController], [PowerSupply], [CoolerType], [FanType], [FanQuantity], [ExpansionSlotSize], [Thickness], [Mass], [IdVideoCardPowerPlug]) VALUES (67, 135, 4, 5, 14, 2, 5, 64, CAST(16.0 AS Decimal(5, 1)), 2100, 1151, 384, 24, 16, 0, 2, 1, 300, N'активное воздушное', N'осевой', 1, 2, 20, NULL, NULL)
INSERT [dbo].[VideoCard] ([IdComponent], [Length], [IdGraphicProcessor], [IdMicroarchitecture], [TechProcess], [VideoMemorySize], [IdVideoMemoryType], [MemoryBusBitRate], [MaxMemoryBandwidth], [EffectiveMemoryFrequency], [VideoChipFrequency], [ALUQuantity], [TextureBlockQuantity], [RasterizationBlockQuantity], [RayTracingSupport], [MaxMonitorQuantity], [IdPCIEController], [PowerSupply], [CoolerType], [FanType], [FanQuantity], [ExpansionSlotSize], [Thickness], [Mass], [IdVideoCardPowerPlug]) VALUES (68, 168, 4, 5, 14, 2, 4, 64, CAST(48.0 AS Decimal(5, 1)), 6000, 1265, 384, 24, 16, 0, 2, 1, 300, N'активное воздушное', N'осевой', 1, 1, 27, NULL, NULL)
INSERT [dbo].[VideoCard] ([IdComponent], [Length], [IdGraphicProcessor], [IdMicroarchitecture], [TechProcess], [VideoMemorySize], [IdVideoMemoryType], [MemoryBusBitRate], [MaxMemoryBandwidth], [EffectiveMemoryFrequency], [VideoChipFrequency], [ALUQuantity], [TextureBlockQuantity], [RasterizationBlockQuantity], [RayTracingSupport], [MaxMonitorQuantity], [IdPCIEController], [PowerSupply], [CoolerType], [FanType], [FanQuantity], [ExpansionSlotSize], [Thickness], [Mass], [IdVideoCardPowerPlug]) VALUES (70, 348, 5, 6, 5, 24, 6, 384, CAST(1.0 AS Decimal(5, 1)), 21000, 2230, 16384, 512, 176, 1, 4, 2, 850, N'активное воздушное', N'осевой', 3, 4, 72, NULL, 1)
GO
INSERT [dbo].[VideoCardConnectorPlug] ([IdVideoCardPowerPlug], [IdVideoPowerConnector]) VALUES (1, 2)
GO
INSERT [dbo].[VideoCardOutput] ([IdVideoCard], [IdVideoOutput], [Quantity]) VALUES (10, 1, 1)
INSERT [dbo].[VideoCardOutput] ([IdVideoCard], [IdVideoOutput], [Quantity]) VALUES (10, 2, 1)
INSERT [dbo].[VideoCardOutput] ([IdVideoCard], [IdVideoOutput], [Quantity]) VALUES (10, 3, 1)
INSERT [dbo].[VideoCardOutput] ([IdVideoCard], [IdVideoOutput], [Quantity]) VALUES (65, 1, 1)
INSERT [dbo].[VideoCardOutput] ([IdVideoCard], [IdVideoOutput], [Quantity]) VALUES (65, 2, 1)
INSERT [dbo].[VideoCardOutput] ([IdVideoCard], [IdVideoOutput], [Quantity]) VALUES (65, 4, 1)
INSERT [dbo].[VideoCardOutput] ([IdVideoCard], [IdVideoOutput], [Quantity]) VALUES (66, 1, 1)
INSERT [dbo].[VideoCardOutput] ([IdVideoCard], [IdVideoOutput], [Quantity]) VALUES (66, 4, 1)
INSERT [dbo].[VideoCardOutput] ([IdVideoCard], [IdVideoOutput], [Quantity]) VALUES (67, 1, 1)
INSERT [dbo].[VideoCardOutput] ([IdVideoCard], [IdVideoOutput], [Quantity]) VALUES (67, 4, 1)
INSERT [dbo].[VideoCardOutput] ([IdVideoCard], [IdVideoOutput], [Quantity]) VALUES (68, 1, 1)
INSERT [dbo].[VideoCardOutput] ([IdVideoCard], [IdVideoOutput], [Quantity]) VALUES (68, 4, 1)
INSERT [dbo].[VideoCardOutput] ([IdVideoCard], [IdVideoOutput], [Quantity]) VALUES (70, 1, 2)
INSERT [dbo].[VideoCardOutput] ([IdVideoCard], [IdVideoOutput], [Quantity]) VALUES (70, 5, 3)
GO
SET IDENTITY_INSERT [dbo].[VideoCardPowerPlug] ON 

INSERT [dbo].[VideoCardPowerPlug] ([Id], [Name]) VALUES (1, N'16-pin')
SET IDENTITY_INSERT [dbo].[VideoCardPowerPlug] OFF
GO
SET IDENTITY_INSERT [dbo].[VideoMemoryType] ON 

INSERT [dbo].[VideoMemoryType] ([Id], [Name]) VALUES (7, N'
GDDR6X')
INSERT [dbo].[VideoMemoryType] ([Id], [Name]) VALUES (5, N'DDR4')
INSERT [dbo].[VideoMemoryType] ([Id], [Name]) VALUES (1, N'GDDR3')
INSERT [dbo].[VideoMemoryType] ([Id], [Name]) VALUES (4, N'GDDR5')
INSERT [dbo].[VideoMemoryType] ([Id], [Name]) VALUES (6, N'GDDR6X')
SET IDENTITY_INSERT [dbo].[VideoMemoryType] OFF
GO
SET IDENTITY_INSERT [dbo].[VideoOutput] ON 

INSERT [dbo].[VideoOutput] ([Id], [Name]) VALUES (5, N'DisplayPort')
INSERT [dbo].[VideoOutput] ([Id], [Name]) VALUES (4, N'DVI-D')
INSERT [dbo].[VideoOutput] ([Id], [Name]) VALUES (3, N'DVI-I')
INSERT [dbo].[VideoOutput] ([Id], [Name]) VALUES (1, N'HDMI')
INSERT [dbo].[VideoOutput] ([Id], [Name]) VALUES (2, N'VGA (D-Sub)')
SET IDENTITY_INSERT [dbo].[VideoOutput] OFF
GO
SET IDENTITY_INSERT [dbo].[VideoPowerConnector] ON 

INSERT [dbo].[VideoPowerConnector] ([Id], [Name]) VALUES (2, N'16-pin')
INSERT [dbo].[VideoPowerConnector] ([Id], [Name]) VALUES (1, N'6 + 2 pin')
SET IDENTITY_INSERT [dbo].[VideoPowerConnector] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_ChipsetName]    Script Date: 23.05.2023 13:37:46 ******/
ALTER TABLE [dbo].[Chipset] ADD  CONSTRAINT [UQ_ChipsetName] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_ColorName]    Script Date: 23.05.2023 13:37:46 ******/
ALTER TABLE [dbo].[Color] ADD  CONSTRAINT [UQ_ColorName] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_ComponentName]    Script Date: 23.05.2023 13:37:46 ******/
CREATE NONCLUSTERED INDEX [UQ_ComponentName] ON [dbo].[Component]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_ConnectorName]    Script Date: 23.05.2023 13:37:46 ******/
ALTER TABLE [dbo].[Connector] ADD  CONSTRAINT [UQ_ConnectorName] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_CoreName]    Script Date: 23.05.2023 13:37:46 ******/
ALTER TABLE [dbo].[Core] ADD  CONSTRAINT [UQ_CoreName] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_GraphicProcessorName]    Script Date: 23.05.2023 13:37:46 ******/
ALTER TABLE [dbo].[GraphicProcessor] ADD  CONSTRAINT [UQ_GraphicProcessorName] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_GraphicsProcessingUnitName]    Script Date: 23.05.2023 13:37:46 ******/
ALTER TABLE [dbo].[GraphicsProcessingUnit] ADD  CONSTRAINT [UQ_GraphicsProcessingUnitName] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_LightingTypeName]    Script Date: 23.05.2023 13:37:46 ******/
ALTER TABLE [dbo].[LightingType] ADD  CONSTRAINT [UQ_LightingTypeName] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_M2FormFactorName]    Script Date: 23.05.2023 13:37:46 ******/
CREATE NONCLUSTERED INDEX [UQ_M2FormFactorName] ON [dbo].[M2FormFactor]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_M2KeyName]    Script Date: 23.05.2023 13:37:46 ******/
ALTER TABLE [dbo].[M2Key] ADD  CONSTRAINT [UQ_M2KeyName] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_ManufacturerName]    Script Date: 23.05.2023 13:37:46 ******/
ALTER TABLE [dbo].[Manufacturer] ADD  CONSTRAINT [UQ_ManufacturerName] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_MaterialName]    Script Date: 23.05.2023 13:37:46 ******/
ALTER TABLE [dbo].[Material] ADD  CONSTRAINT [UQ_MaterialName] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_MicroarchitectureName]    Script Date: 23.05.2023 13:37:46 ******/
ALTER TABLE [dbo].[Microarchitecture] ADD  CONSTRAINT [UQ_MicroarchitectureName] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_MotherBoardPowerConnectorName]    Script Date: 23.05.2023 13:37:46 ******/
CREATE NONCLUSTERED INDEX [UQ_MotherBoardPowerConnectorName] ON [dbo].[MotherBoardPowerConnector]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_MotherBoardPowerPlugName]    Script Date: 23.05.2023 13:37:46 ******/
CREATE NONCLUSTERED INDEX [UQ_MotherBoardPowerPlugName] ON [dbo].[MotherBoardPowerPlug]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_NetworkAdapterChipsetName]    Script Date: 23.05.2023 13:37:46 ******/
ALTER TABLE [dbo].[NetworkAdapterChipset] ADD  CONSTRAINT [UQ_NetworkAdapterChipsetName] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_PCIEControllerName]    Script Date: 23.05.2023 13:37:46 ******/
ALTER TABLE [dbo].[PCIEController] ADD  CONSTRAINT [UQ_PCIEControllerName] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_PowerSupplyFormFactorName]    Script Date: 23.05.2023 13:37:46 ******/
ALTER TABLE [dbo].[PowerSupplyFormFactor] ADD  CONSTRAINT [UQ_PowerSupplyFormFactorName] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_ProcessorPowerConnectorName]    Script Date: 23.05.2023 13:37:46 ******/
ALTER TABLE [dbo].[ProcessorPowerConnector] ADD  CONSTRAINT [UQ_ProcessorPowerConnectorName] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_ProcessorPowerPlugName]    Script Date: 23.05.2023 13:37:46 ******/
ALTER TABLE [dbo].[ProcessorPowerPlug] ADD  CONSTRAINT [UQ_ProcessorPowerPlugName] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_RadiatorSize]    Script Date: 23.05.2023 13:37:46 ******/
ALTER TABLE [dbo].[RadiatorSize] ADD  CONSTRAINT [UQ_RadiatorSize] UNIQUE NONCLUSTERED 
(
	[Size] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_RAMFormFactorName]    Script Date: 23.05.2023 13:37:46 ******/
ALTER TABLE [dbo].[RAMFormFactor] ADD  CONSTRAINT [UQ_RAMFormFactorName] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_RAMTypeName]    Script Date: 23.05.2023 13:37:46 ******/
ALTER TABLE [dbo].[RAMType] ADD  CONSTRAINT [UQ_RAMTypeName] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_SocketName]    Script Date: 23.05.2023 13:37:46 ******/
ALTER TABLE [dbo].[Socket] ADD  CONSTRAINT [UQ_SocketName] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_SoundAdapterChipsetName]    Script Date: 23.05.2023 13:37:46 ******/
ALTER TABLE [dbo].[SoundAdapterChipset] ADD  CONSTRAINT [UQ_SoundAdapterChipsetName] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_VideoCardPowerPlugName]    Script Date: 23.05.2023 13:37:46 ******/
ALTER TABLE [dbo].[VideoCardPowerPlug] ADD  CONSTRAINT [UQ_VideoCardPowerPlugName] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_VideoMemoryTypeName]    Script Date: 23.05.2023 13:37:46 ******/
ALTER TABLE [dbo].[VideoMemoryType] ADD  CONSTRAINT [UQ_VideoMemoryTypeName] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_VideoOutputName]    Script Date: 23.05.2023 13:37:46 ******/
ALTER TABLE [dbo].[VideoOutput] ADD  CONSTRAINT [UQ_VideoOutputName] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_VideoPowerConnectorName]    Script Date: 23.05.2023 13:37:46 ******/
ALTER TABLE [dbo].[VideoPowerConnector] ADD  CONSTRAINT [UQ_VideoPowerConnectorName] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Case] ADD  CONSTRAINT [DF_Case_ExpansionSlotsQuantity]  DEFAULT ((1)) FOR [ExpansionSlotsQuantity]
GO
ALTER TABLE [dbo].[Case] ADD  CONSTRAINT [DF_Case_MaxVideoCardLength]  DEFAULT ((0)) FOR [MaxVideoCardLength]
GO
ALTER TABLE [dbo].[Case] ADD  CONSTRAINT [DF_Case_MaxCoolerHeigth]  DEFAULT ((0)) FOR [MaxCoolerHeigth]
GO
ALTER TABLE [dbo].[Case] ADD  CONSTRAINT [DF_Case_LiquidCoolerCompatible]  DEFAULT ((0)) FOR [LiquidCoolerCompatible]
GO
ALTER TABLE [dbo].[Case] ADD  CONSTRAINT [DF_Case_HDD35Quantity]  DEFAULT ((0)) FOR [Storage35Quantity]
GO
ALTER TABLE [dbo].[Case] ADD  CONSTRAINT [DF_Case_Storage25Quantity]  DEFAULT ((0)) FOR [Storage25Quantity]
GO
ALTER TABLE [dbo].[Case] ADD  CONSTRAINT [DF_Case_MotherBoardOrientation]  DEFAULT (N'вертикально') FOR [MotherBoardOrientation]
GO
ALTER TABLE [dbo].[Case] ADD  CONSTRAINT [DF_Case_Length]  DEFAULT ((300)) FOR [Length]
GO
ALTER TABLE [dbo].[Case] ADD  CONSTRAINT [DF_Case_Width]  DEFAULT ((200)) FOR [Width]
GO
ALTER TABLE [dbo].[Case] ADD  CONSTRAINT [DF_Case_Height]  DEFAULT ((300)) FOR [Height]
GO
ALTER TABLE [dbo].[Case] ADD  CONSTRAINT [DF_Case_HasWindow]  DEFAULT ((0)) FOR [HasWindow]
GO
ALTER TABLE [dbo].[Case] ADD  CONSTRAINT [DF_Case_PowerSupplyOrientation]  DEFAULT (N'верхнее') FOR [PowerSupplyOrientation]
GO
ALTER TABLE [dbo].[Case] ADD  CONSTRAINT [DF_Case_HasCardReader]  DEFAULT ((0)) FOR [HasCardReader]
GO
ALTER TABLE [dbo].[CaseConnector] ADD  CONSTRAINT [DF_CaseConnector_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Cooler] ADD  CONSTRAINT [DF_Cooler_Heigth]  DEFAULT ((100)) FOR [Heigth]
GO
ALTER TABLE [dbo].[Cooler] ADD  CONSTRAINT [DF_Cooler_ConstructionType]  DEFAULT (N'горизонтальный') FOR [ConstructionType]
GO
ALTER TABLE [dbo].[Cooler] ADD  CONSTRAINT [DF_Cooler_Width]  DEFAULT ((100)) FOR [Width]
GO
ALTER TABLE [dbo].[Cooler] ADD  CONSTRAINT [DF_Cooler_Length]  DEFAULT ((100)) FOR [Length]
GO
ALTER TABLE [dbo].[DataStorage] ADD  CONSTRAINT [DF_DataStorage_Width]  DEFAULT ((1)) FOR [Width]
GO
ALTER TABLE [dbo].[DataStorage] ADD  CONSTRAINT [DF_DataStorage_Length]  DEFAULT ((1)) FOR [Length]
GO
ALTER TABLE [dbo].[DataStorage] ADD  CONSTRAINT [DF_DataStorage_Thickness]  DEFAULT ((1)) FOR [Thickness]
GO
ALTER TABLE [dbo].[GraphicsProcessingUnit] ADD  CONSTRAINT [DF_GraphicsProcessingUnit_MaxFrequency]  DEFAULT ((1000)) FOR [MaxFrequency]
GO
ALTER TABLE [dbo].[GraphicsProcessingUnit] ADD  CONSTRAINT [DF_GraphicsProcessingUnit_ExecutiveUnitQuantity]  DEFAULT ((1)) FOR [ExecutiveUnitQuantity]
GO
ALTER TABLE [dbo].[GraphicsProcessingUnit] ADD  CONSTRAINT [DF_GraphicsProcessingUnit_ShadingUnitsQuantity]  DEFAULT ((90)) FOR [ShadingUnitsQuantity]
GO
ALTER TABLE [dbo].[HDD] ADD  CONSTRAINT [DF_HDD_FormFactor]  DEFAULT ('3.5"') FOR [FormFactor]
GO
ALTER TABLE [dbo].[HDD] ADD  CONSTRAINT [DF_HDD_CacheSize]  DEFAULT ((32)) FOR [CacheSize]
GO
ALTER TABLE [dbo].[HDD] ADD  CONSTRAINT [DF_HDD_RotationSpeed]  DEFAULT ((3200)) FOR [RotationSpeed]
GO
ALTER TABLE [dbo].[HDD] ADD  CONSTRAINT [DF_HDD_WriteTech]  DEFAULT (N'CMR') FOR [WriteTech]
GO
ALTER TABLE [dbo].[HDD] ADD  CONSTRAINT [DF_HDD_ActiveNoiseLevel]  DEFAULT ((30)) FOR [ActiveNoiseLevel]
GO
ALTER TABLE [dbo].[HDD] ADD  CONSTRAINT [DF_HDD_PassiveNoiseLevel]  DEFAULT ((30)) FOR [PassiveNoiseLevel]
GO
ALTER TABLE [dbo].[HDD] ADD  CONSTRAINT [DF_HDD_PassiveEnergyUse]  DEFAULT ((1)) FOR [PassiveEnergyUse]
GO
ALTER TABLE [dbo].[HDD] ADD  CONSTRAINT [DF_HDD_MaxTemp]  DEFAULT ((60)) FOR [MaxTemp]
GO
ALTER TABLE [dbo].[LiquidCooler] ADD  CONSTRAINT [DF_LiquidCooler_Serviced]  DEFAULT ((0)) FOR [Serviced]
GO
ALTER TABLE [dbo].[LiquidCooler] ADD  CONSTRAINT [DF_LiquidCooler_WaterblockSize]  DEFAULT ('64.5 x 63 x 44.1') FOR [WaterblockSize]
GO
ALTER TABLE [dbo].[LiquidCooler] ADD  CONSTRAINT [DF_LiquidCooler_RadiatorLength]  DEFAULT ((154)) FOR [RadiatorLength]
GO
ALTER TABLE [dbo].[LiquidCooler] ADD  CONSTRAINT [DF_LiquidCooler_RadiatorWidth]  DEFAULT ((120)) FOR [RadiatorWidth]
GO
ALTER TABLE [dbo].[LiquidCooler] ADD  CONSTRAINT [DF_LiquidCooler_RadiatorThickness]  DEFAULT ((27)) FOR [RadiatorThickness]
GO
ALTER TABLE [dbo].[LiquidCooler] ADD  CONSTRAINT [DF_LiquidCooler_PumpRotationSpeed]  DEFAULT ((2600)) FOR [PumpRotationSpeed]
GO
ALTER TABLE [dbo].[LiquidCooler] ADD  CONSTRAINT [DF_LiquidCooler_PumpConnector]  DEFAULT ('3-pin') FOR [PumpConnector]
GO
ALTER TABLE [dbo].[LiquidCooler] ADD  CONSTRAINT [DF_LiquidCooler_PipeLength]  DEFAULT ((320)) FOR [PipeLength]
GO
ALTER TABLE [dbo].[LiquidCooler] ADD  CONSTRAINT [DF_LiquidCooler_TransparentPipe]  DEFAULT ((0)) FOR [TransparentPipe]
GO
ALTER TABLE [dbo].[MotherBoard] ADD  CONSTRAINT [DF_MotherBoard_MaxRAMSize]  DEFAULT ((0)) FOR [MaxRAMSize]
GO
ALTER TABLE [dbo].[MotherBoard] ADD  CONSTRAINT [DF_MotherBoard_MemoryQuantity]  DEFAULT ((0)) FOR [RAMQuantity]
GO
ALTER TABLE [dbo].[MotherBoard] ADD  CONSTRAINT [DF_MotherBoard_PCIEx16Quantity]  DEFAULT ((0)) FOR [PCIEx16Quantity]
GO
ALTER TABLE [dbo].[MotherBoard] ADD  CONSTRAINT [DF_MotherBoard_SATAQuantity]  DEFAULT ((0)) FOR [SATAQuantity]
GO
ALTER TABLE [dbo].[MotherBoard] ADD  CONSTRAINT [DF_MotherBoard_M2Quantity]  DEFAULT ((0)) FOR [M2Quantity]
GO
ALTER TABLE [dbo].[MotherBoard] ADD  CONSTRAINT [DF_MotherBoard_Height]  DEFAULT ((100)) FOR [Height]
GO
ALTER TABLE [dbo].[MotherBoard] ADD  CONSTRAINT [DF_MotherBoard_Width]  DEFAULT ((100)) FOR [Width]
GO
ALTER TABLE [dbo].[MotherBoard] ADD  CONSTRAINT [DF_MotherBoard_MaxRAMFrequency]  DEFAULT ((1000)) FOR [MaxRAMFrequency]
GO
ALTER TABLE [dbo].[MotherBoard] ADD  CONSTRAINT [DF_MotherBoard_RJ45Quantity]  DEFAULT ((1)) FOR [RJ45Quantity]
GO
ALTER TABLE [dbo].[MotherBoard] ADD  CONSTRAINT [DF_MotherBoard_AnalogAudioOutputQuantity]  DEFAULT ((3)) FOR [AnalogAudioOutputQuantity]
GO
ALTER TABLE [dbo].[MotherBoard] ADD  CONSTRAINT [DF_MotherBoard_CoolerPowerSupply]  DEFAULT ('4-pin') FOR [CoolerPowerSupply]
GO
ALTER TABLE [dbo].[MotherBoard] ADD  CONSTRAINT [DF_MotherBoard_M2KeyE]  DEFAULT ((0)) FOR [M2KeyE]
GO
ALTER TABLE [dbo].[MotherBoard] ADD  CONSTRAINT [DF_MotherBoard_InterfaceLPT]  DEFAULT ((0)) FOR [InterfaceLPT]
GO
ALTER TABLE [dbo].[MotherBoard] ADD  CONSTRAINT [DF_MotherBoard_SoundSchema]  DEFAULT ((5.1)) FOR [SoundSchema]
GO
ALTER TABLE [dbo].[MotherBoard] ADD  CONSTRAINT [DF_MotherBoard_NetworkAdapterSpeed]  DEFAULT ((1)) FOR [NetworkAdapterSpeed]
GO
ALTER TABLE [dbo].[MotherBoard] ADD  CONSTRAINT [DF_MotherBoard_WiFi]  DEFAULT ((0)) FOR [HasWiFi]
GO
ALTER TABLE [dbo].[MotherBoard] ADD  CONSTRAINT [DF_MotherBoard_Bluetooth]  DEFAULT ((0)) FOR [HasBluetooth]
GO
ALTER TABLE [dbo].[MotherBoard] ADD  CONSTRAINT [DF_MotherBoard_PowerPhaseQuantity]  DEFAULT ((5)) FOR [PowerPhaseQuantity]
GO
ALTER TABLE [dbo].[MotherBoard] ADD  CONSTRAINT [DF_MotherBoard_StreamRAMQuantity]  DEFAULT ((2)) FOR [StreamRAMQuantity]
GO
ALTER TABLE [dbo].[MotherBoardConnector] ADD  CONSTRAINT [DF_MotherBoardConnector_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[PowerSupply] ADD  CONSTRAINT [DF_PowerSupply_Power]  DEFAULT ((0)) FOR [Power]
GO
ALTER TABLE [dbo].[PowerSupply] ADD  CONSTRAINT [DF_PowerSupply_SATASupplyQuantity]  DEFAULT ((1)) FOR [SATAConnectorQuantity]
GO
ALTER TABLE [dbo].[PowerSupply] ADD  CONSTRAINT [DF_PowerSupply_CoolerSystem]  DEFAULT (N'активная') FOR [CoolerSystem]
GO
ALTER TABLE [dbo].[PowerSupply] ADD  CONSTRAINT [DF_PowerSupply_Length]  DEFAULT ((100)) FOR [Length]
GO
ALTER TABLE [dbo].[PowerSupply] ADD  CONSTRAINT [DF_PowerSupply_Width]  DEFAULT ((100)) FOR [Width]
GO
ALTER TABLE [dbo].[PowerSupply] ADD  CONSTRAINT [DF_PowerSupply_Heigth]  DEFAULT ((100)) FOR [Heigth]
GO
ALTER TABLE [dbo].[PowerSupplyMotherBoardConnector] ADD  CONSTRAINT [DF_PowerSupplyMotherBoardConnector_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[PowerSupplyProcessorPowerConnector] ADD  CONSTRAINT [DF_PowerSupplyProcessorPowerConnector_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[PowerSupplyVideoPowerConnector] ADD  CONSTRAINT [DF_PowerSupplyVideoPowerConnector_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Processor] ADD  CONSTRAINT [DF_Processor_HasCooler]  DEFAULT ((0)) FOR [HasCooler]
GO
ALTER TABLE [dbo].[Processor] ADD  CONSTRAINT [DF_Processor_CoreQuantity]  DEFAULT ((1)) FOR [CoreQuantity]
GO
ALTER TABLE [dbo].[Processor] ADD  CONSTRAINT [DF_Processor_MaxThreadQuantity]  DEFAULT ((1)) FOR [MaxThreadQuantity]
GO
ALTER TABLE [dbo].[Processor] ADD  CONSTRAINT [DF_Processor_ProductiveCoreQuantity]  DEFAULT ((1)) FOR [ProductiveCoreQuantity]
GO
ALTER TABLE [dbo].[Processor] ADD  CONSTRAINT [DF_Processor_CacheL2Size]  DEFAULT ((1)) FOR [CacheL2Size]
GO
ALTER TABLE [dbo].[Processor] ADD  CONSTRAINT [DF_Processor_CacheL3Size]  DEFAULT ((1)) FOR [CacheL3Size]
GO
ALTER TABLE [dbo].[Processor] ADD  CONSTRAINT [DF_Processor_TechPprocess]  DEFAULT ((1)) FOR [TechProcess]
GO
ALTER TABLE [dbo].[Processor] ADD  CONSTRAINT [DF_Processor_BaseFrequency]  DEFAULT ((1)) FOR [BaseFrequency]
GO
ALTER TABLE [dbo].[Processor] ADD  CONSTRAINT [DF_Processor_FreeMultiplier]  DEFAULT ((0)) FOR [FreeMultiplier]
GO
ALTER TABLE [dbo].[Processor] ADD  CONSTRAINT [DF_Processor_MaxRAMFrequency]  DEFAULT ((1866)) FOR [MaxRAMFrequency]
GO
ALTER TABLE [dbo].[Processor] ADD  CONSTRAINT [DF_Processor_StreamRAMQuantity]  DEFAULT ((2)) FOR [StreamRAMQuantity]
GO
ALTER TABLE [dbo].[Processor] ADD  CONSTRAINT [DF_Processor_HasECC]  DEFAULT ((0)) FOR [HasECC]
GO
ALTER TABLE [dbo].[Processor] ADD  CONSTRAINT [DF_Processor_TDP]  DEFAULT ((40)) FOR [TDP]
GO
ALTER TABLE [dbo].[Processor] ADD  CONSTRAINT [DF_Processor_MaxTemperature]  DEFAULT ((70)) FOR [MaxTemperature]
GO
ALTER TABLE [dbo].[Processor] ADD  CONSTRAINT [DF_Processor_PCIEQuantity]  DEFAULT ((4)) FOR [PCIEQuantity]
GO
ALTER TABLE [dbo].[ProcessorCooler] ADD  CONSTRAINT [DF_ProcessorCooler_FanQuantity]  DEFAULT ((1)) FOR [FanQuantity]
GO
ALTER TABLE [dbo].[ProcessorCooler] ADD  CONSTRAINT [DF_ProcessorCooler_FanSize]  DEFAULT ('80 x 80') FOR [FanSize]
GO
ALTER TABLE [dbo].[ProcessorCooler] ADD  CONSTRAINT [DF_ProcessorCooler_FanConnector]  DEFAULT ('3-pin') FOR [FanConnector]
GO
ALTER TABLE [dbo].[ProcessorCooler] ADD  CONSTRAINT [DF_ProcessorCooler_MaxRotationSpeed]  DEFAULT ((1000)) FOR [MaxRotationSpeed]
GO
ALTER TABLE [dbo].[ProcessorCooler] ADD  CONSTRAINT [DF_ProcessorCooler_MinRotationSpeed]  DEFAULT ((1000)) FOR [MinRotationSpeed]
GO
ALTER TABLE [dbo].[ProcessorCooler] ADD  CONSTRAINT [DF_ProcessorCooler_MaxNoiseLevel]  DEFAULT ((35)) FOR [MaxNoiseLevel]
GO
ALTER TABLE [dbo].[ProcessorCooler] ADD  CONSTRAINT [DF_ProcessorCooler_MaxAirflow]  DEFAULT ((20)) FOR [MaxAirflow]
GO
ALTER TABLE [dbo].[ProcessorCooler] ADD  CONSTRAINT [DF_ProcessorCooler_MaxStaticPressure]  DEFAULT ((10)) FOR [MaxStaticPressure]
GO
ALTER TABLE [dbo].[ProcessorCooler] ADD  CONSTRAINT [DF_ProcessorCooler_BearingType]  DEFAULT (N'скольжения (с винтовой нарезкой)') FOR [BearingType]
GO
ALTER TABLE [dbo].[ProcessorCooler] ADD  CONSTRAINT [DF_ProcessorCooler_TDP]  DEFAULT ((60)) FOR [TDP]
GO
ALTER TABLE [dbo].[RAM] ADD  CONSTRAINT [DF_RAM_MemorySize]  DEFAULT ((0)) FOR [MemorySize]
GO
ALTER TABLE [dbo].[RAM] ADD  CONSTRAINT [DF_RAM_Frequency]  DEFAULT ((1600)) FOR [Frequency]
GO
ALTER TABLE [dbo].[RAM] ADD  CONSTRAINT [DF_RAM_HasRegistr]  DEFAULT ((0)) FOR [HasRegistr]
GO
ALTER TABLE [dbo].[RAM] ADD  CONSTRAINT [DF_RAM_HasECC]  DEFAULT ((0)) FOR [HasECC]
GO
ALTER TABLE [dbo].[RAM] ADD  CONSTRAINT [DF_RAM_CASLatency]  DEFAULT ((11)) FOR [CASLatency]
GO
ALTER TABLE [dbo].[RAM] ADD  CONSTRAINT [DF_RAM_RAStoCAASDelay]  DEFAULT ((11)) FOR [RAStoCAASDelay]
GO
ALTER TABLE [dbo].[RAM] ADD  CONSTRAINT [DF_RAM_RowPrechargeDelay]  DEFAULT ((11)) FOR [RowPrechargeDelay]
GO
ALTER TABLE [dbo].[RAM] ADD  CONSTRAINT [DF_RAM_ActivateToPreChargeDelay]  DEFAULT ((28)) FOR [ActivateToPreChargeDelay]
GO
ALTER TABLE [dbo].[RAM] ADD  CONSTRAINT [DF_RAM_HasRadiator]  DEFAULT ((0)) FOR [HasRadiator]
GO
ALTER TABLE [dbo].[RAM] ADD  CONSTRAINT [DF_RAM_Voltage]  DEFAULT ((1)) FOR [Voltage]
GO
ALTER TABLE [dbo].[SSD] ADD  CONSTRAINT [DF_SSD_BitQuantityOnCell]  DEFAULT (N'3 бит TLC') FOR [BitQuantityOnCell]
GO
ALTER TABLE [dbo].[SSD] ADD  CONSTRAINT [DF_SSD_MemoryStructure]  DEFAULT (N'3D NAND') FOR [MemoryStructure]
GO
ALTER TABLE [dbo].[SSD] ADD  CONSTRAINT [DF_SSD_MinSpeed]  DEFAULT ((1)) FOR [WriteSpeed]
GO
ALTER TABLE [dbo].[SSD] ADD  CONSTRAINT [DF_SSD_MaxSpeed]  DEFAULT ((1)) FOR [ReadSpeed]
GO
ALTER TABLE [dbo].[SSD] ADD  CONSTRAINT [DF_SSD_TotalBytesWritten]  DEFAULT ((1)) FOR [TotalBytesWritten]
GO
ALTER TABLE [dbo].[SSD] ADD  CONSTRAINT [DF_SSD_DWPD]  DEFAULT ((1)) FOR [DWPD]
GO
ALTER TABLE [dbo].[VideoCard] ADD  CONSTRAINT [DF_VideoCard_Length]  DEFAULT ((0)) FOR [Length]
GO
ALTER TABLE [dbo].[VideoCard] ADD  CONSTRAINT [DF_VideoCard_TechProcess]  DEFAULT ((40)) FOR [TechProcess]
GO
ALTER TABLE [dbo].[VideoCard] ADD  CONSTRAINT [DF_VideoCard_VideoMemorySize]  DEFAULT ((1)) FOR [VideoMemorySize]
GO
ALTER TABLE [dbo].[VideoCard] ADD  CONSTRAINT [DF_VideoCard_MemoryBusBitRate]  DEFAULT ((64)) FOR [MemoryBusBitRate]
GO
ALTER TABLE [dbo].[VideoCard] ADD  CONSTRAINT [DF_VideoCard_MaxMemoryBandwidth]  DEFAULT ((6.4)) FOR [MaxMemoryBandwidth]
GO
ALTER TABLE [dbo].[VideoCard] ADD  CONSTRAINT [DF_VideoCard_EffectiveMemoryFrequency]  DEFAULT ((1000)) FOR [EffectiveMemoryFrequency]
GO
ALTER TABLE [dbo].[VideoCard] ADD  CONSTRAINT [DF_VideoCard_VideoChipFrequency]  DEFAULT ((460)) FOR [VideoChipFrequency]
GO
ALTER TABLE [dbo].[VideoCard] ADD  CONSTRAINT [DF_VideoCard_ALUQuantity]  DEFAULT ((16)) FOR [ALUQuantity]
GO
ALTER TABLE [dbo].[VideoCard] ADD  CONSTRAINT [DF_VideoCard_TextureBlockQuantity]  DEFAULT ((8)) FOR [TextureBlockQuantity]
GO
ALTER TABLE [dbo].[VideoCard] ADD  CONSTRAINT [DF_VideoCard_RasterizationBlockQuantity]  DEFAULT ((4)) FOR [RasterizationBlockQuantity]
GO
ALTER TABLE [dbo].[VideoCard] ADD  CONSTRAINT [DF_VideoCard_RayTracing]  DEFAULT ((0)) FOR [RayTracingSupport]
GO
ALTER TABLE [dbo].[VideoCard] ADD  CONSTRAINT [DF_VideoCard_MaxMonitorQuantity]  DEFAULT ((3)) FOR [MaxMonitorQuantity]
GO
ALTER TABLE [dbo].[VideoCard] ADD  CONSTRAINT [DF_VideoCard_PowerSupply]  DEFAULT ((350)) FOR [PowerSupply]
GO
ALTER TABLE [dbo].[VideoCard] ADD  CONSTRAINT [DF_VideoCard_CoolerType]  DEFAULT (N'активное воздушное') FOR [CoolerType]
GO
ALTER TABLE [dbo].[VideoCard] ADD  CONSTRAINT [DF_VideoCard_FanType]  DEFAULT (N'осевой') FOR [FanType]
GO
ALTER TABLE [dbo].[VideoCard] ADD  CONSTRAINT [DF_VideoCard_FanQuantity]  DEFAULT ((1)) FOR [FanQuantity]
GO
ALTER TABLE [dbo].[VideoCard] ADD  CONSTRAINT [DF_VideoCard_ExpansionSlotSize]  DEFAULT ((1)) FOR [ExpansionSlotSize]
GO
ALTER TABLE [dbo].[VideoCard] ADD  CONSTRAINT [DF_VideoCard_Thickness]  DEFAULT ((30)) FOR [Thickness]
GO
ALTER TABLE [dbo].[VideoCardOutput] ADD  CONSTRAINT [DF_VideoCardOutput_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Case]  WITH CHECK ADD  CONSTRAINT [FK_Case_CaseSize] FOREIGN KEY([IdCaseSize])
REFERENCES [dbo].[CaseSize] ([Id])
GO
ALTER TABLE [dbo].[Case] CHECK CONSTRAINT [FK_Case_CaseSize]
GO
ALTER TABLE [dbo].[Case]  WITH CHECK ADD  CONSTRAINT [FK_Case_Color] FOREIGN KEY([IdMainColor])
REFERENCES [dbo].[Color] ([Id])
GO
ALTER TABLE [dbo].[Case] CHECK CONSTRAINT [FK_Case_Color]
GO
ALTER TABLE [dbo].[Case]  WITH CHECK ADD  CONSTRAINT [FK_Case_Component] FOREIGN KEY([IdComponent])
REFERENCES [dbo].[Component] ([Id])
GO
ALTER TABLE [dbo].[Case] CHECK CONSTRAINT [FK_Case_Component]
GO
ALTER TABLE [dbo].[Case]  WITH CHECK ADD  CONSTRAINT [FK_Case_LightingType] FOREIGN KEY([IdLigthingType])
REFERENCES [dbo].[LightingType] ([Id])
GO
ALTER TABLE [dbo].[Case] CHECK CONSTRAINT [FK_Case_LightingType]
GO
ALTER TABLE [dbo].[Case]  WITH CHECK ADD  CONSTRAINT [FK_Case_PowerSupplyFormFactor] FOREIGN KEY([IdPowerSupplyFormFactor])
REFERENCES [dbo].[PowerSupplyFormFactor] ([Id])
GO
ALTER TABLE [dbo].[Case] CHECK CONSTRAINT [FK_Case_PowerSupplyFormFactor]
GO
ALTER TABLE [dbo].[CaseCompatibleMotherBoardFormFactor]  WITH CHECK ADD  CONSTRAINT [FK_CompatibleCaseMotherBoardFormFactor_Case] FOREIGN KEY([IdCase])
REFERENCES [dbo].[Case] ([IdComponent])
GO
ALTER TABLE [dbo].[CaseCompatibleMotherBoardFormFactor] CHECK CONSTRAINT [FK_CompatibleCaseMotherBoardFormFactor_Case]
GO
ALTER TABLE [dbo].[CaseCompatibleMotherBoardFormFactor]  WITH CHECK ADD  CONSTRAINT [FK_CompatibleCaseMotherBoardFormFactor_MotherBoardFormFactor] FOREIGN KEY([IdMotherBoardFormFactor])
REFERENCES [dbo].[MotherBoardFormFactor] ([Id])
GO
ALTER TABLE [dbo].[CaseCompatibleMotherBoardFormFactor] CHECK CONSTRAINT [FK_CompatibleCaseMotherBoardFormFactor_MotherBoardFormFactor]
GO
ALTER TABLE [dbo].[CaseConnector]  WITH CHECK ADD  CONSTRAINT [FK_CaseConnector_Case] FOREIGN KEY([IdCase])
REFERENCES [dbo].[Case] ([IdComponent])
GO
ALTER TABLE [dbo].[CaseConnector] CHECK CONSTRAINT [FK_CaseConnector_Case]
GO
ALTER TABLE [dbo].[CaseConnector]  WITH CHECK ADD  CONSTRAINT [FK_CaseConnector_Connector] FOREIGN KEY([IdConnector])
REFERENCES [dbo].[Connector] ([Id])
GO
ALTER TABLE [dbo].[CaseConnector] CHECK CONSTRAINT [FK_CaseConnector_Connector]
GO
ALTER TABLE [dbo].[CaseFrontPanelMaterial]  WITH CHECK ADD  CONSTRAINT [FK_CaseFrontPanelMaterial_Case] FOREIGN KEY([IdCase])
REFERENCES [dbo].[Case] ([IdComponent])
GO
ALTER TABLE [dbo].[CaseFrontPanelMaterial] CHECK CONSTRAINT [FK_CaseFrontPanelMaterial_Case]
GO
ALTER TABLE [dbo].[CaseFrontPanelMaterial]  WITH CHECK ADD  CONSTRAINT [FK_CaseFrontPanelMaterial_Material] FOREIGN KEY([IdMaterial])
REFERENCES [dbo].[Material] ([Id])
GO
ALTER TABLE [dbo].[CaseFrontPanelMaterial] CHECK CONSTRAINT [FK_CaseFrontPanelMaterial_Material]
GO
ALTER TABLE [dbo].[CaseMaterial]  WITH CHECK ADD  CONSTRAINT [FK_CaseMaterial_Case] FOREIGN KEY([IdCase])
REFERENCES [dbo].[Case] ([IdComponent])
GO
ALTER TABLE [dbo].[CaseMaterial] CHECK CONSTRAINT [FK_CaseMaterial_Case]
GO
ALTER TABLE [dbo].[CaseMaterial]  WITH CHECK ADD  CONSTRAINT [FK_CaseMaterial_Material] FOREIGN KEY([IdMaterial])
REFERENCES [dbo].[Material] ([Id])
GO
ALTER TABLE [dbo].[CaseMaterial] CHECK CONSTRAINT [FK_CaseMaterial_Material]
GO
ALTER TABLE [dbo].[CaseRadiatorSize]  WITH CHECK ADD  CONSTRAINT [FK_CaseRadiatorSize_Case] FOREIGN KEY([IdCase])
REFERENCES [dbo].[Case] ([IdComponent])
GO
ALTER TABLE [dbo].[CaseRadiatorSize] CHECK CONSTRAINT [FK_CaseRadiatorSize_Case]
GO
ALTER TABLE [dbo].[CaseRadiatorSize]  WITH CHECK ADD  CONSTRAINT [FK_CaseRadiatorSize_RadiatorSize] FOREIGN KEY([IdRadiatorSize])
REFERENCES [dbo].[RadiatorSize] ([Id])
GO
ALTER TABLE [dbo].[CaseRadiatorSize] CHECK CONSTRAINT [FK_CaseRadiatorSize_RadiatorSize]
GO
ALTER TABLE [dbo].[Component]  WITH CHECK ADD  CONSTRAINT [FK_Component_Manufacturer] FOREIGN KEY([IdManufacturer])
REFERENCES [dbo].[Manufacturer] ([Id])
GO
ALTER TABLE [dbo].[Component] CHECK CONSTRAINT [FK_Component_Manufacturer]
GO
ALTER TABLE [dbo].[Cooler]  WITH CHECK ADD  CONSTRAINT [FK_Cooler_Material] FOREIGN KEY([IdBaseMaterial])
REFERENCES [dbo].[Material] ([Id])
GO
ALTER TABLE [dbo].[Cooler] CHECK CONSTRAINT [FK_Cooler_Material]
GO
ALTER TABLE [dbo].[Cooler]  WITH CHECK ADD  CONSTRAINT [FK_Cooler_ProcessorCooler] FOREIGN KEY([IdProcessorCooler])
REFERENCES [dbo].[ProcessorCooler] ([IdComponent])
GO
ALTER TABLE [dbo].[Cooler] CHECK CONSTRAINT [FK_Cooler_ProcessorCooler]
GO
ALTER TABLE [dbo].[CoolerCompatibleSocket]  WITH CHECK ADD  CONSTRAINT [FK_CoolerCompatibleSocket_ProcessorCooler] FOREIGN KEY([IdProcessorCooler])
REFERENCES [dbo].[ProcessorCooler] ([IdComponent])
GO
ALTER TABLE [dbo].[CoolerCompatibleSocket] CHECK CONSTRAINT [FK_CoolerCompatibleSocket_ProcessorCooler]
GO
ALTER TABLE [dbo].[CoolerCompatibleSocket]  WITH CHECK ADD  CONSTRAINT [FK_CoolerCompatibleSocket_Socket] FOREIGN KEY([IdSocket])
REFERENCES [dbo].[Socket] ([Id])
GO
ALTER TABLE [dbo].[CoolerCompatibleSocket] CHECK CONSTRAINT [FK_CoolerCompatibleSocket_Socket]
GO
ALTER TABLE [dbo].[DataStorage]  WITH CHECK ADD  CONSTRAINT [FK_DataStorage_Component] FOREIGN KEY([IdComponent])
REFERENCES [dbo].[Component] ([Id])
GO
ALTER TABLE [dbo].[DataStorage] CHECK CONSTRAINT [FK_DataStorage_Component]
GO
ALTER TABLE [dbo].[HDD]  WITH CHECK ADD  CONSTRAINT [FK_HDD_DataStorage] FOREIGN KEY([IdDataStorage])
REFERENCES [dbo].[DataStorage] ([IdComponent])
GO
ALTER TABLE [dbo].[HDD] CHECK CONSTRAINT [FK_HDD_DataStorage]
GO
ALTER TABLE [dbo].[LiquidCooler]  WITH CHECK ADD  CONSTRAINT [FK_LiquidCooler_Material] FOREIGN KEY([IdWaterblockMaterial])
REFERENCES [dbo].[Material] ([Id])
GO
ALTER TABLE [dbo].[LiquidCooler] CHECK CONSTRAINT [FK_LiquidCooler_Material]
GO
ALTER TABLE [dbo].[LiquidCooler]  WITH CHECK ADD  CONSTRAINT [FK_LiquidCooler_ProcessorCooler] FOREIGN KEY([IdProcessorCooler])
REFERENCES [dbo].[ProcessorCooler] ([IdComponent])
GO
ALTER TABLE [dbo].[LiquidCooler] CHECK CONSTRAINT [FK_LiquidCooler_ProcessorCooler]
GO
ALTER TABLE [dbo].[LiquidCooler]  WITH CHECK ADD  CONSTRAINT [FK_LiquidCooler_RadiatorSize] FOREIGN KEY([IdRadiatorSize])
REFERENCES [dbo].[RadiatorSize] ([Id])
GO
ALTER TABLE [dbo].[LiquidCooler] CHECK CONSTRAINT [FK_LiquidCooler_RadiatorSize]
GO
ALTER TABLE [dbo].[M2SSD]  WITH CHECK ADD  CONSTRAINT [FK_M2SSD_M2FormFactor] FOREIGN KEY([IdFormFactor])
REFERENCES [dbo].[M2FormFactor] ([Id])
GO
ALTER TABLE [dbo].[M2SSD] CHECK CONSTRAINT [FK_M2SSD_M2FormFactor]
GO
ALTER TABLE [dbo].[M2SSD]  WITH CHECK ADD  CONSTRAINT [FK_M2SSD_SSD] FOREIGN KEY([IdSSD])
REFERENCES [dbo].[SSD] ([IdDataStorage])
GO
ALTER TABLE [dbo].[M2SSD] CHECK CONSTRAINT [FK_M2SSD_SSD]
GO
ALTER TABLE [dbo].[M2SSDKey]  WITH CHECK ADD  CONSTRAINT [FK_M2SSDKey_M2Key] FOREIGN KEY([IdKey])
REFERENCES [dbo].[M2Key] ([Id])
GO
ALTER TABLE [dbo].[M2SSDKey] CHECK CONSTRAINT [FK_M2SSDKey_M2Key]
GO
ALTER TABLE [dbo].[M2SSDKey]  WITH CHECK ADD  CONSTRAINT [FK_M2SSDKey_M2SSD] FOREIGN KEY([IdM2SSD])
REFERENCES [dbo].[M2SSD] ([IdSSD])
GO
ALTER TABLE [dbo].[M2SSDKey] CHECK CONSTRAINT [FK_M2SSDKey_M2SSD]
GO
ALTER TABLE [dbo].[MotherBoard]  WITH CHECK ADD  CONSTRAINT [FK_MotherBoard_Chipset] FOREIGN KEY([IdChipset])
REFERENCES [dbo].[Chipset] ([Id])
GO
ALTER TABLE [dbo].[MotherBoard] CHECK CONSTRAINT [FK_MotherBoard_Chipset]
GO
ALTER TABLE [dbo].[MotherBoard]  WITH CHECK ADD  CONSTRAINT [FK_MotherBoard_Component] FOREIGN KEY([IdComponent])
REFERENCES [dbo].[Component] ([Id])
GO
ALTER TABLE [dbo].[MotherBoard] CHECK CONSTRAINT [FK_MotherBoard_Component]
GO
ALTER TABLE [dbo].[MotherBoard]  WITH CHECK ADD  CONSTRAINT [FK_MotherBoard_MotherBoardFormFactor] FOREIGN KEY([IdMotherBoardFormFactor])
REFERENCES [dbo].[MotherBoardFormFactor] ([Id])
GO
ALTER TABLE [dbo].[MotherBoard] CHECK CONSTRAINT [FK_MotherBoard_MotherBoardFormFactor]
GO
ALTER TABLE [dbo].[MotherBoard]  WITH CHECK ADD  CONSTRAINT [FK_MotherBoard_MotherBoardPowerPlug] FOREIGN KEY([IdMotherBoardPowerPlug])
REFERENCES [dbo].[MotherBoardPowerPlug] ([Id])
GO
ALTER TABLE [dbo].[MotherBoard] CHECK CONSTRAINT [FK_MotherBoard_MotherBoardPowerPlug]
GO
ALTER TABLE [dbo].[MotherBoard]  WITH CHECK ADD  CONSTRAINT [FK_MotherBoard_NetworkAdapterChipset] FOREIGN KEY([IdNetworkAdapterChipset])
REFERENCES [dbo].[NetworkAdapterChipset] ([Id])
GO
ALTER TABLE [dbo].[MotherBoard] CHECK CONSTRAINT [FK_MotherBoard_NetworkAdapterChipset]
GO
ALTER TABLE [dbo].[MotherBoard]  WITH CHECK ADD  CONSTRAINT [FK_MotherBoard_PCIEController] FOREIGN KEY([IdPCIControllerVersion])
REFERENCES [dbo].[PCIEController] ([Id])
GO
ALTER TABLE [dbo].[MotherBoard] CHECK CONSTRAINT [FK_MotherBoard_PCIEController]
GO
ALTER TABLE [dbo].[MotherBoard]  WITH CHECK ADD  CONSTRAINT [FK_MotherBoard_ProcessorPowerPlug] FOREIGN KEY([IdProcessorPowerPlug])
REFERENCES [dbo].[ProcessorPowerPlug] ([Id])
GO
ALTER TABLE [dbo].[MotherBoard] CHECK CONSTRAINT [FK_MotherBoard_ProcessorPowerPlug]
GO
ALTER TABLE [dbo].[MotherBoard]  WITH CHECK ADD  CONSTRAINT [FK_MotherBoard_RAMFormFactor] FOREIGN KEY([IdRAMFormFactor])
REFERENCES [dbo].[RAMFormFactor] ([Id])
GO
ALTER TABLE [dbo].[MotherBoard] CHECK CONSTRAINT [FK_MotherBoard_RAMFormFactor]
GO
ALTER TABLE [dbo].[MotherBoard]  WITH CHECK ADD  CONSTRAINT [FK_MotherBoard_RAMType] FOREIGN KEY([IdRAMType])
REFERENCES [dbo].[RAMType] ([Id])
GO
ALTER TABLE [dbo].[MotherBoard] CHECK CONSTRAINT [FK_MotherBoard_RAMType]
GO
ALTER TABLE [dbo].[MotherBoard]  WITH CHECK ADD  CONSTRAINT [FK_MotherBoard_Socket] FOREIGN KEY([IdSocket])
REFERENCES [dbo].[Socket] ([Id])
GO
ALTER TABLE [dbo].[MotherBoard] CHECK CONSTRAINT [FK_MotherBoard_Socket]
GO
ALTER TABLE [dbo].[MotherBoard]  WITH CHECK ADD  CONSTRAINT [FK_MotherBoard_SoundAdapterChipset] FOREIGN KEY([IdSoundAdapterChipset])
REFERENCES [dbo].[SoundAdapterChipset] ([Id])
GO
ALTER TABLE [dbo].[MotherBoard] CHECK CONSTRAINT [FK_MotherBoard_SoundAdapterChipset]
GO
ALTER TABLE [dbo].[MotherBoardCompatibleCore]  WITH CHECK ADD  CONSTRAINT [FK_CompatibleMotherBoardCore_Core] FOREIGN KEY([IdCore])
REFERENCES [dbo].[Core] ([Id])
GO
ALTER TABLE [dbo].[MotherBoardCompatibleCore] CHECK CONSTRAINT [FK_CompatibleMotherBoardCore_Core]
GO
ALTER TABLE [dbo].[MotherBoardCompatibleCore]  WITH CHECK ADD  CONSTRAINT [FK_CompatibleMotherBoardCore_MotherBoard] FOREIGN KEY([IdMotherBoard])
REFERENCES [dbo].[MotherBoard] ([IdComponent])
GO
ALTER TABLE [dbo].[MotherBoardCompatibleCore] CHECK CONSTRAINT [FK_CompatibleMotherBoardCore_MotherBoard]
GO
ALTER TABLE [dbo].[MotherBoardConnector]  WITH CHECK ADD  CONSTRAINT [FK_MotherBoardConnector_Connector] FOREIGN KEY([IdConnector])
REFERENCES [dbo].[Connector] ([Id])
GO
ALTER TABLE [dbo].[MotherBoardConnector] CHECK CONSTRAINT [FK_MotherBoardConnector_Connector]
GO
ALTER TABLE [dbo].[MotherBoardConnector]  WITH CHECK ADD  CONSTRAINT [FK_MotherBoardConnector_MotherBoard] FOREIGN KEY([IdMotherBoard])
REFERENCES [dbo].[MotherBoard] ([IdComponent])
GO
ALTER TABLE [dbo].[MotherBoardConnector] CHECK CONSTRAINT [FK_MotherBoardConnector_MotherBoard]
GO
ALTER TABLE [dbo].[MotherBoardConnectorPlug]  WITH CHECK ADD  CONSTRAINT [FK_MotherBoardConnectorPlug_MotherBoardPowerConnector] FOREIGN KEY([IdMotherBoardConnector])
REFERENCES [dbo].[MotherBoardPowerConnector] ([Id])
GO
ALTER TABLE [dbo].[MotherBoardConnectorPlug] CHECK CONSTRAINT [FK_MotherBoardConnectorPlug_MotherBoardPowerConnector]
GO
ALTER TABLE [dbo].[MotherBoardConnectorPlug]  WITH CHECK ADD  CONSTRAINT [FK_MotherBoardConnectorPlug_MotherBoardPowerPlug] FOREIGN KEY([IdMotherBoardPowerPlug])
REFERENCES [dbo].[MotherBoardPowerPlug] ([Id])
GO
ALTER TABLE [dbo].[MotherBoardConnectorPlug] CHECK CONSTRAINT [FK_MotherBoardConnectorPlug_MotherBoardPowerPlug]
GO
ALTER TABLE [dbo].[MotherBoardM2Key]  WITH CHECK ADD  CONSTRAINT [FK_MotherBoardM2Key_M2FormFactor] FOREIGN KEY([IdFormFactor])
REFERENCES [dbo].[M2FormFactor] ([Id])
GO
ALTER TABLE [dbo].[MotherBoardM2Key] CHECK CONSTRAINT [FK_MotherBoardM2Key_M2FormFactor]
GO
ALTER TABLE [dbo].[MotherBoardM2Key]  WITH CHECK ADD  CONSTRAINT [FK_MotherBoardM2Key_M2Key] FOREIGN KEY([IdKey])
REFERENCES [dbo].[M2Key] ([Id])
GO
ALTER TABLE [dbo].[MotherBoardM2Key] CHECK CONSTRAINT [FK_MotherBoardM2Key_M2Key]
GO
ALTER TABLE [dbo].[MotherBoardM2Key]  WITH CHECK ADD  CONSTRAINT [FK_MotherBoardM2Key_MotherBoard] FOREIGN KEY([IdMotherBoard])
REFERENCES [dbo].[MotherBoard] ([IdComponent])
GO
ALTER TABLE [dbo].[MotherBoardM2Key] CHECK CONSTRAINT [FK_MotherBoardM2Key_MotherBoard]
GO
ALTER TABLE [dbo].[MotherBoardVideoOutput]  WITH CHECK ADD  CONSTRAINT [FK_MotherBoardVideoOutput_MotherBoard] FOREIGN KEY([IdMotherBoard])
REFERENCES [dbo].[MotherBoard] ([IdComponent])
GO
ALTER TABLE [dbo].[MotherBoardVideoOutput] CHECK CONSTRAINT [FK_MotherBoardVideoOutput_MotherBoard]
GO
ALTER TABLE [dbo].[MotherBoardVideoOutput]  WITH CHECK ADD  CONSTRAINT [FK_MotherBoardVideoOutput_VideoOutput] FOREIGN KEY([IdVideoOutput])
REFERENCES [dbo].[VideoOutput] ([Id])
GO
ALTER TABLE [dbo].[MotherBoardVideoOutput] CHECK CONSTRAINT [FK_MotherBoardVideoOutput_VideoOutput]
GO
ALTER TABLE [dbo].[Picture]  WITH CHECK ADD  CONSTRAINT [FK_Picture_Component] FOREIGN KEY([IdComponent])
REFERENCES [dbo].[Component] ([Id])
GO
ALTER TABLE [dbo].[Picture] CHECK CONSTRAINT [FK_Picture_Component]
GO
ALTER TABLE [dbo].[PowerSupply]  WITH CHECK ADD  CONSTRAINT [FK_PowerSupply_Color] FOREIGN KEY([IdColor])
REFERENCES [dbo].[Color] ([Id])
GO
ALTER TABLE [dbo].[PowerSupply] CHECK CONSTRAINT [FK_PowerSupply_Color]
GO
ALTER TABLE [dbo].[PowerSupply]  WITH CHECK ADD  CONSTRAINT [FK_PowerSupply_Component] FOREIGN KEY([IdComponent])
REFERENCES [dbo].[Component] ([Id])
GO
ALTER TABLE [dbo].[PowerSupply] CHECK CONSTRAINT [FK_PowerSupply_Component]
GO
ALTER TABLE [dbo].[PowerSupply]  WITH CHECK ADD  CONSTRAINT [FK_PowerSupply_PowerSupplyFormFactor] FOREIGN KEY([IdPowerSupplyFormFactor])
REFERENCES [dbo].[PowerSupplyFormFactor] ([Id])
GO
ALTER TABLE [dbo].[PowerSupply] CHECK CONSTRAINT [FK_PowerSupply_PowerSupplyFormFactor]
GO
ALTER TABLE [dbo].[PowerSupplyMotherBoardConnector]  WITH CHECK ADD  CONSTRAINT [FK_PowerSupplyMotherBoardConnector_MotherBoardPowerConnector] FOREIGN KEY([IdMotherBoardPowerConnector])
REFERENCES [dbo].[MotherBoardPowerConnector] ([Id])
GO
ALTER TABLE [dbo].[PowerSupplyMotherBoardConnector] CHECK CONSTRAINT [FK_PowerSupplyMotherBoardConnector_MotherBoardPowerConnector]
GO
ALTER TABLE [dbo].[PowerSupplyMotherBoardConnector]  WITH CHECK ADD  CONSTRAINT [FK_PowerSupplyMotherBoardConnector_PowerSupply] FOREIGN KEY([IdPowerSupply])
REFERENCES [dbo].[PowerSupply] ([IdComponent])
GO
ALTER TABLE [dbo].[PowerSupplyMotherBoardConnector] CHECK CONSTRAINT [FK_PowerSupplyMotherBoardConnector_PowerSupply]
GO
ALTER TABLE [dbo].[PowerSupplyProcessorPowerConnector]  WITH CHECK ADD  CONSTRAINT [FK_PowerSupplyProcessorPowerConnector_PowerSupply] FOREIGN KEY([IdPowerSupply])
REFERENCES [dbo].[PowerSupply] ([IdComponent])
GO
ALTER TABLE [dbo].[PowerSupplyProcessorPowerConnector] CHECK CONSTRAINT [FK_PowerSupplyProcessorPowerConnector_PowerSupply]
GO
ALTER TABLE [dbo].[PowerSupplyProcessorPowerConnector]  WITH CHECK ADD  CONSTRAINT [FK_PowerSupplyProcessorPowerConnector_ProcessorPowerConnector] FOREIGN KEY([IdProcessorPowerConnector])
REFERENCES [dbo].[ProcessorPowerConnector] ([Id])
GO
ALTER TABLE [dbo].[PowerSupplyProcessorPowerConnector] CHECK CONSTRAINT [FK_PowerSupplyProcessorPowerConnector_ProcessorPowerConnector]
GO
ALTER TABLE [dbo].[PowerSupplyVideoPowerConnector]  WITH CHECK ADD  CONSTRAINT [FK_PowerSupplyVideoPowerConnector_PowerSupply] FOREIGN KEY([IdPowerSupply])
REFERENCES [dbo].[PowerSupply] ([IdComponent])
GO
ALTER TABLE [dbo].[PowerSupplyVideoPowerConnector] CHECK CONSTRAINT [FK_PowerSupplyVideoPowerConnector_PowerSupply]
GO
ALTER TABLE [dbo].[PowerSupplyVideoPowerConnector]  WITH CHECK ADD  CONSTRAINT [FK_PowerSupplyVideoPowerConnector_VideoPowerConnector] FOREIGN KEY([IdVideoPowerConnector])
REFERENCES [dbo].[VideoPowerConnector] ([Id])
GO
ALTER TABLE [dbo].[PowerSupplyVideoPowerConnector] CHECK CONSTRAINT [FK_PowerSupplyVideoPowerConnector_VideoPowerConnector]
GO
ALTER TABLE [dbo].[Processor]  WITH CHECK ADD  CONSTRAINT [FK_Processor_Component] FOREIGN KEY([IdComponent])
REFERENCES [dbo].[Component] ([Id])
GO
ALTER TABLE [dbo].[Processor] CHECK CONSTRAINT [FK_Processor_Component]
GO
ALTER TABLE [dbo].[Processor]  WITH CHECK ADD  CONSTRAINT [FK_Processor_Core] FOREIGN KEY([IdCore])
REFERENCES [dbo].[Core] ([Id])
GO
ALTER TABLE [dbo].[Processor] CHECK CONSTRAINT [FK_Processor_Core]
GO
ALTER TABLE [dbo].[Processor]  WITH CHECK ADD  CONSTRAINT [FK_Processor_GraphicsProcessingUnit] FOREIGN KEY([IdGraphicsProcessingUnit])
REFERENCES [dbo].[GraphicsProcessingUnit] ([Id])
GO
ALTER TABLE [dbo].[Processor] CHECK CONSTRAINT [FK_Processor_GraphicsProcessingUnit]
GO
ALTER TABLE [dbo].[Processor]  WITH CHECK ADD  CONSTRAINT [FK_Processor_PCIEController] FOREIGN KEY([IdPCIEController])
REFERENCES [dbo].[PCIEController] ([Id])
GO
ALTER TABLE [dbo].[Processor] CHECK CONSTRAINT [FK_Processor_PCIEController]
GO
ALTER TABLE [dbo].[Processor]  WITH CHECK ADD  CONSTRAINT [FK_Processor_Socket] FOREIGN KEY([IdSocket])
REFERENCES [dbo].[Socket] ([Id])
GO
ALTER TABLE [dbo].[Processor] CHECK CONSTRAINT [FK_Processor_Socket]
GO
ALTER TABLE [dbo].[ProcessorCompatibleMemoryType]  WITH CHECK ADD  CONSTRAINT [FK_CompatibleProcessorMemoryType_Processor] FOREIGN KEY([IdProcessor])
REFERENCES [dbo].[Processor] ([IdComponent])
GO
ALTER TABLE [dbo].[ProcessorCompatibleMemoryType] CHECK CONSTRAINT [FK_CompatibleProcessorMemoryType_Processor]
GO
ALTER TABLE [dbo].[ProcessorCompatibleMemoryType]  WITH CHECK ADD  CONSTRAINT [FK_CompatibleProcessorMemoryType_RAMType] FOREIGN KEY([IdRAMType])
REFERENCES [dbo].[RAMType] ([Id])
GO
ALTER TABLE [dbo].[ProcessorCompatibleMemoryType] CHECK CONSTRAINT [FK_CompatibleProcessorMemoryType_RAMType]
GO
ALTER TABLE [dbo].[ProcessorConnectorPlug]  WITH CHECK ADD  CONSTRAINT [FK_ProcessorConnectorPlug_ProcessorPowerConnector] FOREIGN KEY([IdProcessorPowerConnector])
REFERENCES [dbo].[ProcessorPowerConnector] ([Id])
GO
ALTER TABLE [dbo].[ProcessorConnectorPlug] CHECK CONSTRAINT [FK_ProcessorConnectorPlug_ProcessorPowerConnector]
GO
ALTER TABLE [dbo].[ProcessorConnectorPlug]  WITH CHECK ADD  CONSTRAINT [FK_ProcessorConnectorPlug_ProcessorPowerPlug] FOREIGN KEY([IdProcessorPowerPlug])
REFERENCES [dbo].[ProcessorPowerPlug] ([Id])
GO
ALTER TABLE [dbo].[ProcessorConnectorPlug] CHECK CONSTRAINT [FK_ProcessorConnectorPlug_ProcessorPowerPlug]
GO
ALTER TABLE [dbo].[ProcessorCooler]  WITH CHECK ADD  CONSTRAINT [FK_ProcessorCooler_Component] FOREIGN KEY([IdComponent])
REFERENCES [dbo].[Component] ([Id])
GO
ALTER TABLE [dbo].[ProcessorCooler] CHECK CONSTRAINT [FK_ProcessorCooler_Component]
GO
ALTER TABLE [dbo].[ProcessorCooler]  WITH CHECK ADD  CONSTRAINT [FK_ProcessorCooler_Material] FOREIGN KEY([IdRadiatorMaterial])
REFERENCES [dbo].[Material] ([Id])
GO
ALTER TABLE [dbo].[ProcessorCooler] CHECK CONSTRAINT [FK_ProcessorCooler_Material]
GO
ALTER TABLE [dbo].[RAM]  WITH CHECK ADD  CONSTRAINT [FK_RAM_Component] FOREIGN KEY([IdComponent])
REFERENCES [dbo].[Component] ([Id])
GO
ALTER TABLE [dbo].[RAM] CHECK CONSTRAINT [FK_RAM_Component]
GO
ALTER TABLE [dbo].[RAM]  WITH CHECK ADD  CONSTRAINT [FK_RAM_RAMFormFactor] FOREIGN KEY([IdRAMFormFactor])
REFERENCES [dbo].[RAMFormFactor] ([Id])
GO
ALTER TABLE [dbo].[RAM] CHECK CONSTRAINT [FK_RAM_RAMFormFactor]
GO
ALTER TABLE [dbo].[RAM]  WITH CHECK ADD  CONSTRAINT [FK_RAM_RAMType] FOREIGN KEY([IdRAMType])
REFERENCES [dbo].[RAMType] ([Id])
GO
ALTER TABLE [dbo].[RAM] CHECK CONSTRAINT [FK_RAM_RAMType]
GO
ALTER TABLE [dbo].[SSD]  WITH CHECK ADD  CONSTRAINT [FK_SSD_DataStorage] FOREIGN KEY([IdDataStorage])
REFERENCES [dbo].[DataStorage] ([IdComponent])
GO
ALTER TABLE [dbo].[SSD] CHECK CONSTRAINT [FK_SSD_DataStorage]
GO
ALTER TABLE [dbo].[VideoCard]  WITH CHECK ADD  CONSTRAINT [FK_VideoCard_Component] FOREIGN KEY([IdComponent])
REFERENCES [dbo].[Component] ([Id])
GO
ALTER TABLE [dbo].[VideoCard] CHECK CONSTRAINT [FK_VideoCard_Component]
GO
ALTER TABLE [dbo].[VideoCard]  WITH CHECK ADD  CONSTRAINT [FK_VideoCard_GraphicProcessor] FOREIGN KEY([IdGraphicProcessor])
REFERENCES [dbo].[GraphicProcessor] ([Id])
GO
ALTER TABLE [dbo].[VideoCard] CHECK CONSTRAINT [FK_VideoCard_GraphicProcessor]
GO
ALTER TABLE [dbo].[VideoCard]  WITH CHECK ADD  CONSTRAINT [FK_VideoCard_Microarchitecture] FOREIGN KEY([IdMicroarchitecture])
REFERENCES [dbo].[Microarchitecture] ([Id])
GO
ALTER TABLE [dbo].[VideoCard] CHECK CONSTRAINT [FK_VideoCard_Microarchitecture]
GO
ALTER TABLE [dbo].[VideoCard]  WITH CHECK ADD  CONSTRAINT [FK_VideoCard_PCIEController] FOREIGN KEY([IdPCIEController])
REFERENCES [dbo].[PCIEController] ([Id])
GO
ALTER TABLE [dbo].[VideoCard] CHECK CONSTRAINT [FK_VideoCard_PCIEController]
GO
ALTER TABLE [dbo].[VideoCard]  WITH CHECK ADD  CONSTRAINT [FK_VideoCard_VideoCardPowerPlug] FOREIGN KEY([IdVideoCardPowerPlug])
REFERENCES [dbo].[VideoCardPowerPlug] ([Id])
GO
ALTER TABLE [dbo].[VideoCard] CHECK CONSTRAINT [FK_VideoCard_VideoCardPowerPlug]
GO
ALTER TABLE [dbo].[VideoCard]  WITH CHECK ADD  CONSTRAINT [FK_VideoCard_VideoMemoryType] FOREIGN KEY([IdVideoMemoryType])
REFERENCES [dbo].[VideoMemoryType] ([Id])
GO
ALTER TABLE [dbo].[VideoCard] CHECK CONSTRAINT [FK_VideoCard_VideoMemoryType]
GO
ALTER TABLE [dbo].[VideoCardConnectorPlug]  WITH CHECK ADD  CONSTRAINT [FK_VideoCardConnectorPlug_VideoCardPowerPlug] FOREIGN KEY([IdVideoCardPowerPlug])
REFERENCES [dbo].[VideoCardPowerPlug] ([Id])
GO
ALTER TABLE [dbo].[VideoCardConnectorPlug] CHECK CONSTRAINT [FK_VideoCardConnectorPlug_VideoCardPowerPlug]
GO
ALTER TABLE [dbo].[VideoCardConnectorPlug]  WITH CHECK ADD  CONSTRAINT [FK_VideoCardConnectorPlug_VideoPowerConnector] FOREIGN KEY([IdVideoPowerConnector])
REFERENCES [dbo].[VideoPowerConnector] ([Id])
GO
ALTER TABLE [dbo].[VideoCardConnectorPlug] CHECK CONSTRAINT [FK_VideoCardConnectorPlug_VideoPowerConnector]
GO
ALTER TABLE [dbo].[VideoCardOutput]  WITH CHECK ADD  CONSTRAINT [FK_VideoCardOutput_VideoCard] FOREIGN KEY([IdVideoCard])
REFERENCES [dbo].[VideoCard] ([IdComponent])
GO
ALTER TABLE [dbo].[VideoCardOutput] CHECK CONSTRAINT [FK_VideoCardOutput_VideoCard]
GO
ALTER TABLE [dbo].[VideoCardOutput]  WITH CHECK ADD  CONSTRAINT [FK_VideoCardOutput_VideoOutput] FOREIGN KEY([IdVideoOutput])
REFERENCES [dbo].[VideoOutput] ([Id])
GO
ALTER TABLE [dbo].[VideoCardOutput] CHECK CONSTRAINT [FK_VideoCardOutput_VideoOutput]
GO
ALTER TABLE [dbo].[Case]  WITH CHECK ADD  CONSTRAINT [CK_CasePowerSupplyOrientation] CHECK  (([PowerSupplyOrientation]='верхнее' OR [PowerSupplyOrientation]='нижнее'))
GO
ALTER TABLE [dbo].[Case] CHECK CONSTRAINT [CK_CasePowerSupplyOrientation]
GO
ALTER TABLE [dbo].[Component]  WITH CHECK ADD  CONSTRAINT [CK_ComponentPrice] CHECK  (([price]>(0)))
GO
ALTER TABLE [dbo].[Component] CHECK CONSTRAINT [CK_ComponentPrice]
GO
ALTER TABLE [dbo].[HDD]  WITH CHECK ADD  CONSTRAINT [CK_HDD_FormFactor] CHECK  (([FormFactor]='2.5"' OR [FormFactor]='3.5"'))
GO
ALTER TABLE [dbo].[HDD] CHECK CONSTRAINT [CK_HDD_FormFactor]
GO
ALTER TABLE [dbo].[PowerSupply]  WITH CHECK ADD  CONSTRAINT [CK_PowerSupplyCoolerSystem] CHECK  (([CoolerSystem]='активная' OR [CoolerSystem]='пассивная'))
GO
ALTER TABLE [dbo].[PowerSupply] CHECK CONSTRAINT [CK_PowerSupplyCoolerSystem]
GO
ALTER TABLE [dbo].[Processor]  WITH CHECK ADD  CONSTRAINT [CK_ProcessorMaxMemorySize] CHECK  (([MaxMemorySize]>(0)))
GO
ALTER TABLE [dbo].[Processor] CHECK CONSTRAINT [CK_ProcessorMaxMemorySize]
GO
USE [master]
GO
ALTER DATABASE [ConfiguratorPC] SET  READ_WRITE 
GO
