USE [master]
GO
/****** Object:  Database [Kurullar]    Script Date: 5.4.2018 18:21:14 ******/
CREATE DATABASE [Kurullar]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Kurullar', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Kurullar.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Kurullar_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\Kurullar_log.ldf' , SIZE = 3456KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Kurullar] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Kurullar].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Kurullar] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Kurullar] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Kurullar] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Kurullar] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Kurullar] SET ARITHABORT OFF 
GO
ALTER DATABASE [Kurullar] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Kurullar] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Kurullar] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Kurullar] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Kurullar] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Kurullar] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Kurullar] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Kurullar] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Kurullar] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Kurullar] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Kurullar] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Kurullar] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Kurullar] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Kurullar] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Kurullar] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Kurullar] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Kurullar] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Kurullar] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Kurullar] SET  MULTI_USER 
GO
ALTER DATABASE [Kurullar] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Kurullar] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Kurullar] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Kurullar] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Kurullar] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Kurullar', N'ON'
GO
ALTER DATABASE [Kurullar] SET QUERY_STORE = OFF
GO
USE [Kurullar]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Kurullar]
GO
/****** Object:  Table [dbo].[Uyeler]    Script Date: 5.4.2018 18:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Uyeler](
	[UyeID] [int] IDENTITY(1,1) NOT NULL,
	[KurulID] [int] NOT NULL,
	[PersNo] [int] NOT NULL,
	[PersMi] [bit] NULL,
	[Aktif] [bit] NULL,
	[UyeCikisTarihi] [datetime] NULL,
	[UyeOlusTarihi] [datetime] NULL,
 CONSTRAINT [PK_KATILIMCILAR] PRIMARY KEY CLUSTERED 
(
	[UyeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kurullar]    Script Date: 5.4.2018 18:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kurullar](
	[KurulID] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [nvarchar](100) NULL,
	[Sponsoru] [int] NOT NULL,
	[Baskani] [int] NOT NULL,
	[Raportor] [int] NOT NULL,
	[Amac] [nvarchar](max) NULL,
	[KayitTarihi] [datetime] NOT NULL,
	[Gundem] [nvarchar](max) NULL,
	[SiraNo] [int] NULL,
	[BasTarihi] [datetime] NULL,
	[Sorumluluklar] [nvarchar](max) NULL,
	[IlgiliUstSurec] [nvarchar](200) NULL,
	[Politika] [nvarchar](250) NULL,
 CONSTRAINT [PK_ISBIRLIKLERI] PRIMARY KEY CLUSTERED 
(
	[KurulID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[d_UyelerVeBaskanView]    Script Date: 5.4.2018 18:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[d_UyelerVeBaskanView]
AS
SELECT     KurulID, Baskani AS PersNo, '' AS UyeCikisTarihi,'' as UyeOlusTarihi
FROM         dbo.Kurullar
UNION ALL
SELECT     KurulID, dbo.Uyeler.PersNo, UyeCikisTarihi,UyeOlusTarihi
FROM         dbo.Uyeler

GO
/****** Object:  Table [dbo].[Personel]    Script Date: 5.4.2018 18:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personel](
	[SicilNo] [int] NOT NULL,
	[AdSoyad] [nvarchar](150) NOT NULL,
	[Mudurluk] [nvarchar](150) NOT NULL,
	[Yoneticilik] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Personel] PRIMARY KEY CLUSTERED 
(
	[SicilNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[d_PersonellerView]    Script Date: 5.4.2018 18:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[d_PersonellerView]
AS
SELECT        SicilNo, AdSoyad, Mudurluk, Yoneticilik
FROM            dbo.Personel
GO
/****** Object:  View [dbo].[SecilenKurulView]    Script Date: 5.4.2018 18:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SecilenKurulView]
AS
SELECT        dbo.Kurullar.KurulID, Personel_1.AdSoyad AS BaskanAdSoyad, Personel_2.AdSoyad AS RaportorAdSoyad, dbo.Personel.AdSoyad AS SponsorAdSoyad, dbo.Kurullar.BasTarihi, dbo.Kurullar.Sorumluluklar, 
                         dbo.Kurullar.IlgiliUstSurec, dbo.Kurullar.Politika, dbo.Kurullar.Adi, dbo.Kurullar.Amac, dbo.Kurullar.Gundem
FROM            dbo.Personel AS Personel_2 RIGHT OUTER JOIN
                         dbo.Kurullar ON Personel_2.SicilNo = dbo.Kurullar.Raportor LEFT OUTER JOIN
                         dbo.Personel AS Personel_1 ON dbo.Kurullar.Baskani = Personel_1.SicilNo LEFT OUTER JOIN
                         dbo.Personel ON dbo.Kurullar.Sponsoru = dbo.Personel.SicilNo
GO
/****** Object:  View [dbo].[d_ÜyelerPersonelKurullarView]    Script Date: 5.4.2018 18:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[d_ÜyelerPersonelKurullarView]
AS
SELECT        dbo.Uyeler.PersNo, dbo.Personel.AdSoyad, dbo.Kurullar.Adi, dbo.Uyeler.PersMi, dbo.Uyeler.Aktif, dbo.Uyeler.UyeOlusTarihi, dbo.Uyeler.UyeCikisTarihi, 
                         dbo.Uyeler.UyeID, dbo.Kurullar.KurulID AS Expr1, dbo.Personel.SicilNo, dbo.Uyeler.KurulID
FROM            dbo.Uyeler INNER JOIN
                         dbo.Personel ON dbo.Uyeler.PersNo = dbo.Personel.SicilNo INNER JOIN
                         dbo.Kurullar ON dbo.Uyeler.KurulID = dbo.Kurullar.KurulID
GO
/****** Object:  Table [dbo].[Dosyalar]    Script Date: 5.4.2018 18:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dosyalar](
	[DosyaID] [int] IDENTITY(1,1) NOT NULL,
	[KurulID] [int] NOT NULL,
	[DosyaAdi] [nvarchar](300) NULL,
	[DosyaYeniAdi] [nvarchar](100) NULL,
	[YukleyenPersNo] [int] NOT NULL,
	[Aciklama] [nvarchar](100) NULL,
	[Tur] [varchar](1) NULL,
 CONSTRAINT [PK_TOPLANTI_DOSYALARI] PRIMARY KEY CLUSTERED 
(
	[DosyaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[d_DosyalarView]    Script Date: 5.4.2018 18:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[d_DosyalarView]
AS
SELECT        dbo.Personel.AdSoyad AS YukleyenPersonel, dbo.Dosyalar.DosyaAdi, dbo.Dosyalar.YukleyenPersNo, dbo.Dosyalar.Aciklama, dbo.Dosyalar.Tur, 
                         dbo.Dosyalar.DosyaID, dbo.Kurullar.Adi AS DosyaKurulu, dbo.Kurullar.KurulID, dbo.Personel.SicilNo
FROM            dbo.Dosyalar LEFT OUTER JOIN
                         dbo.Personel ON dbo.Dosyalar.YukleyenPersNo = dbo.Personel.SicilNo LEFT OUTER JOIN
                         dbo.Kurullar ON dbo.Dosyalar.KurulID = dbo.Kurullar.KurulID
GO
/****** Object:  Table [dbo].[Aksiyonlar]    Script Date: 5.4.2018 18:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Aksiyonlar](
	[AksiyonID] [int] IDENTITY(1,1) NOT NULL,
	[KurulID] [int] NOT NULL,
	[KriterNo] [nvarchar](50) NULL,
	[GorusulenKonu] [nvarchar](max) NOT NULL,
	[MevcutDurumu] [nvarchar](max) NULL,
	[SorumluPersNo] [int] NOT NULL,
	[GundemeTarihi] [datetime] NULL,
	[HedefTarihi] [datetime] NULL,
	[IsBitisTarihi] [datetime] NULL,
	[KayitSahibiPersNo] [int] NULL,
	[SorumluPersoneller] [nvarchar](150) NULL,
	[AksiyonSonucu] [nvarchar](1000) NULL,
	[Gelisme] [nvarchar](1000) NULL,
	[Sonuc] [nvarchar](1000) NULL,
 CONSTRAINT [PK_YORUMLAR] PRIMARY KEY CLUSTERED 
(
	[AksiyonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[AksiyonlarView]    Script Date: 5.4.2018 18:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AksiyonlarView]
AS
SELECT        dbo.Aksiyonlar.KriterNo, dbo.Aksiyonlar.GorusulenKonu, dbo.Aksiyonlar.MevcutDurumu, dbo.Aksiyonlar.SorumluPersNo, dbo.Aksiyonlar.GundemeTarihi, 
                         dbo.Aksiyonlar.HedefTarihi, dbo.Aksiyonlar.IsBitisTarihi, dbo.Aksiyonlar.KayitSahibiPersNo, dbo.Aksiyonlar.SorumluPersoneller, dbo.Aksiyonlar.AksiyonSonucu, 
                         dbo.Aksiyonlar.Gelisme, dbo.Aksiyonlar.Sonuc, dbo.Personel.AdSoyad AS SorumluPers, dbo.Kurullar.Adi AS PlanKurulu, dbo.Aksiyonlar.AksiyonID, 
                         dbo.Aksiyonlar.KurulID
FROM            dbo.Aksiyonlar LEFT OUTER JOIN
                         dbo.Personel ON dbo.Aksiyonlar.SorumluPersNo = dbo.Personel.SicilNo LEFT OUTER JOIN
                         dbo.Kurullar ON dbo.Aksiyonlar.KurulID = dbo.Kurullar.KurulID
GO
/****** Object:  View [dbo].[KurullarView]    Script Date: 5.4.2018 18:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[KurullarView]
AS
SELECT        dbo.Kurullar.KurulID, dbo.Kurullar.Adi AS KurulAdi, dbo.Personel.AdSoyad AS RaportorAdSoyad
FROM            dbo.Kurullar LEFT OUTER JOIN
                         dbo.Personel ON dbo.Kurullar.Raportor = dbo.Personel.SicilNo
GO
/****** Object:  View [dbo].[UyelerView]    Script Date: 5.4.2018 18:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[UyelerView]
AS
SELECT        dbo.Kurullar.KurulID, dbo.Uyeler.UyeID, dbo.Personel.AdSoyad, dbo.Uyeler.Aktif
FROM            dbo.Kurullar INNER JOIN
                         dbo.Uyeler ON dbo.Kurullar.KurulID = dbo.Uyeler.KurulID INNER JOIN
                         dbo.Personel ON dbo.Uyeler.PersNo = dbo.Personel.SicilNo
GO
/****** Object:  View [dbo].[SecilenKurulDosyasiView]    Script Date: 5.4.2018 18:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SecilenKurulDosyasiView]
AS
SELECT        dbo.Kurullar.KurulID, dbo.Dosyalar.DosyaID, dbo.Personel.AdSoyad AS YukleyenKisi, dbo.Dosyalar.Aciklama, dbo.Dosyalar.DosyaAdi, dbo.Dosyalar.DosyaYeniAdi
FROM            dbo.Dosyalar INNER JOIN
                         dbo.Personel ON dbo.Dosyalar.YukleyenPersNo = dbo.Personel.SicilNo INNER JOIN
                         dbo.Kurullar ON dbo.Dosyalar.KurulID = dbo.Kurullar.KurulID
GO
/****** Object:  Table [dbo].[Katilim]    Script Date: 5.4.2018 18:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Katilim](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KurulID] [int] NOT NULL,
	[Tarih] [datetime] NOT NULL,
	[PerNr] [varchar](50) NOT NULL,
	[Katildi] [bit] NULL,
 CONSTRAINT [PK_Katilim_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Aksiyonlar] ON 

INSERT [dbo].[Aksiyonlar] ([AksiyonID], [KurulID], [KriterNo], [GorusulenKonu], [MevcutDurumu], [SorumluPersNo], [GundemeTarihi], [HedefTarihi], [IsBitisTarihi], [KayitSahibiPersNo], [SorumluPersoneller], [AksiyonSonucu], [Gelisme], [Sonuc]) VALUES (48, 62, N'4321', N'Konu35 Konu35 Konu35 Konu35Konu35 Konu35 Konu35 Konu35Konu35 Konu35 Konu35 Konu35Konu35 Konu35 Konu35 Konu35Konu35 Konu35 Konu35 Konu35Konu35 Konu35 Konu35 Konu35Konu35 Konu35 Konu35 Konu35Konu35 Konu35 Konu35 Konu35Konu35 Konu35 Konu35 Konu35', N'Durum 35 Durum 35 Durum 35 Durum 35 Durum 35 Durum 35 Durum 35 Durum 35 Durum 35 Durum 35 Durum 35 Durum 35 Durum 35 Durum 35 Durum 35 Durum 35 Durum 35 Durum 35 Durum 35 Durum 35', 20300, CAST(N'2016-01-11T00:00:00.000' AS DateTime), CAST(N'2016-08-31T00:00:00.000' AS DateTime), CAST(N'2016-09-30T00:00:00.000' AS DateTime), 20300, N'Sorumluluk-1 , Sorumluluk-2', N'Sonuç-34', N'Gelişme-47', N'Sonuç-56')
INSERT [dbo].[Aksiyonlar] ([AksiyonID], [KurulID], [KriterNo], [GorusulenKonu], [MevcutDurumu], [SorumluPersNo], [GundemeTarihi], [HedefTarihi], [IsBitisTarihi], [KayitSahibiPersNo], [SorumluPersoneller], [AksiyonSonucu], [Gelisme], [Sonuc]) VALUES (52, 59, N'4321', N'Konu35', N'Durum 35', 20300, CAST(N'2016-01-11T00:00:00.000' AS DateTime), CAST(N'2016-08-31T00:00:00.000' AS DateTime), CAST(N'2016-09-30T00:00:00.000' AS DateTime), 20300, N'Sorumluluk-1 , Sorumluluk-2', N'Sonuç-34', N'Gelişme-47', N'Sonuç-56')
INSERT [dbo].[Aksiyonlar] ([AksiyonID], [KurulID], [KriterNo], [GorusulenKonu], [MevcutDurumu], [SorumluPersNo], [GundemeTarihi], [HedefTarihi], [IsBitisTarihi], [KayitSahibiPersNo], [SorumluPersoneller], [AksiyonSonucu], [Gelisme], [Sonuc]) VALUES (1052, 62, N'4321', N'Konu35 Konu35 Konu35 Konu35Konu35 Konu35 Konu35 Konu35Konu35 Konu35 Konu35 Konu35Konu35 Konu35 Konu35 Konu35Konu35 Konu35 Konu35 Konu35Konu35 Konu35 Konu35 Konu35Konu35 Konu35 Konu35 Konu35Konu35 Konu35 Konu35 Konu35Konu35 Konu35 Konu35 Konu35', N'Durum 35 Durum 35 Durum 35 Durum 35 Durum 35 Durum 35 Durum 35 Durum 35 Durum 35 Durum 35 Durum 35 Durum 35 Durum 35 Durum 35 Durum 35 Durum 35 Durum 35 Durum 35 Durum 35 Durum 35', 20300, CAST(N'2016-01-11T00:00:00.000' AS DateTime), CAST(N'2016-08-31T00:00:00.000' AS DateTime), CAST(N'2016-09-30T00:00:00.000' AS DateTime), 20300, N'Sorumluluk-1 , Sorumluluk-2', N'Sonuç-34', N'Gelişme-47', N'Sonuç-56')
INSERT [dbo].[Aksiyonlar] ([AksiyonID], [KurulID], [KriterNo], [GorusulenKonu], [MevcutDurumu], [SorumluPersNo], [GundemeTarihi], [HedefTarihi], [IsBitisTarihi], [KayitSahibiPersNo], [SorumluPersoneller], [AksiyonSonucu], [Gelisme], [Sonuc]) VALUES (1057, 59, N'1234', N'Konu35', N'Durum 35', 20625, CAST(N'2016-07-14T00:00:00.000' AS DateTime), CAST(N'2016-02-10T00:00:00.000' AS DateTime), CAST(N'2016-03-05T00:00:00.000' AS DateTime), 20300, N'Sorumluluk-1 , Sorumluluk-2', N'Sonuç-34', N'Gelişme-47', N'Sonuç-56')
INSERT [dbo].[Aksiyonlar] ([AksiyonID], [KurulID], [KriterNo], [GorusulenKonu], [MevcutDurumu], [SorumluPersNo], [GundemeTarihi], [HedefTarihi], [IsBitisTarihi], [KayitSahibiPersNo], [SorumluPersoneller], [AksiyonSonucu], [Gelisme], [Sonuc]) VALUES (2055, 66, NULL, N'asd', NULL, 5456, CAST(N'2016-07-28T00:00:00.000' AS DateTime), CAST(N'2016-07-29T00:00:00.000' AS DateTime), NULL, 20625, NULL, NULL, NULL, NULL)
INSERT [dbo].[Aksiyonlar] ([AksiyonID], [KurulID], [KriterNo], [GorusulenKonu], [MevcutDurumu], [SorumluPersNo], [GundemeTarihi], [HedefTarihi], [IsBitisTarihi], [KayitSahibiPersNo], [SorumluPersoneller], [AksiyonSonucu], [Gelisme], [Sonuc]) VALUES (2056, 2065, N'12345', N'asd', N'asd', 7047, CAST(N'2016-10-19T00:00:00.000' AS DateTime), CAST(N'2016-10-21T00:00:00.000' AS DateTime), CAST(N'2016-10-26T00:00:00.000' AS DateTime), 20630, N'asd', N'asd', N'asd', N'asd')
SET IDENTITY_INSERT [dbo].[Aksiyonlar] OFF
SET IDENTITY_INSERT [dbo].[Dosyalar] ON 

INSERT [dbo].[Dosyalar] ([DosyaID], [KurulID], [DosyaAdi], [DosyaYeniAdi], [YukleyenPersNo], [Aciklama], [Tur]) VALUES (49, 62, N'Dosya 55-26', NULL, 20955, N'Açıklama 26', N'4')
INSERT [dbo].[Dosyalar] ([DosyaID], [KurulID], [DosyaAdi], [DosyaYeniAdi], [YukleyenPersNo], [Aciklama], [Tur]) VALUES (50, 62, N'Dosya 55-62', NULL, 20622, N'Açıklama 44', N'6')
INSERT [dbo].[Dosyalar] ([DosyaID], [KurulID], [DosyaAdi], [DosyaYeniAdi], [YukleyenPersNo], [Aciklama], [Tur]) VALUES (51, 63, N'Dosya 55-26', NULL, 20622, N'Açıklama 56', N'4')
INSERT [dbo].[Dosyalar] ([DosyaID], [KurulID], [DosyaAdi], [DosyaYeniAdi], [YukleyenPersNo], [Aciklama], [Tur]) VALUES (52, 59, N'Dosya-1234543210', N'yeni', 20622, N'Açıklama', N'2')
INSERT [dbo].[Dosyalar] ([DosyaID], [KurulID], [DosyaAdi], [DosyaYeniAdi], [YukleyenPersNo], [Aciklama], [Tur]) VALUES (72, 59, N'Yeni.txt', N'/Upload/Yeni.txt', 7053, N'açık', NULL)
INSERT [dbo].[Dosyalar] ([DosyaID], [KurulID], [DosyaAdi], [DosyaYeniAdi], [YukleyenPersNo], [Aciklama], [Tur]) VALUES (1075, 59, N'Dosya 66-26', N'yeni', 20622, N'Açıklama 26', N'2')
INSERT [dbo].[Dosyalar] ([DosyaID], [KurulID], [DosyaAdi], [DosyaYeniAdi], [YukleyenPersNo], [Aciklama], [Tur]) VALUES (1079, 59, N'Dosya 66-26', N'yeni', 20622, N'Açıklama 26', N'2')
INSERT [dbo].[Dosyalar] ([DosyaID], [KurulID], [DosyaAdi], [DosyaYeniAdi], [YukleyenPersNo], [Aciklama], [Tur]) VALUES (1080, 62, N'asd', N'/Upload/ad74d4fb948db777c8a9f9c8f0db91fc.doc', 7053, N'asd', NULL)
SET IDENTITY_INSERT [dbo].[Dosyalar] OFF
SET IDENTITY_INSERT [dbo].[Kurullar] ON 

INSERT [dbo].[Kurullar] ([KurulID], [Adi], [Sponsoru], [Baskani], [Raportor], [Amac], [KayitTarihi], [Gundem], [SiraNo], [BasTarihi], [Sorumluluklar], [IlgiliUstSurec], [Politika]) VALUES (59, N'Bizim Kurul', 20300, 5456, 7053, N'Amaç 66 Amaç 66 Amaç 66 Amaç 66 Amaç 66 Amaç 66 Amaç 66 Amaç 66', CAST(N'2016-01-11T00:00:00.000' AS DateTime), N'Gündem 66', 69, CAST(N'2016-07-28T00:00:00.000' AS DateTime), N'Sotumluluk-1,Sorumluluk-2,Sorumluluk-3', N'Üst Süreç 66', N'Politika 66')
INSERT [dbo].[Kurullar] ([KurulID], [Adi], [Sponsoru], [Baskani], [Raportor], [Amac], [KayitTarihi], [Gundem], [SiraNo], [BasTarihi], [Sorumluluklar], [IlgiliUstSurec], [Politika]) VALUES (62, N'Kurul 66', 20315, 5456, 6032, N'Amaç 66', CAST(N'2016-01-11T00:00:00.000' AS DateTime), N'Gündem 66', 67, CAST(N'1988-10-02T00:00:00.000' AS DateTime), N'Sotumluluk-1,Sorumluluk-2,Sorumluluk-3', N'Üst Süreç 66', N'Politika 66')
INSERT [dbo].[Kurullar] ([KurulID], [Adi], [Sponsoru], [Baskani], [Raportor], [Amac], [KayitTarihi], [Gundem], [SiraNo], [BasTarihi], [Sorumluluklar], [IlgiliUstSurec], [Politika]) VALUES (63, N'123. Kurul', 20551, 2116, 3115, N'Amaç 66', CAST(N'2016-01-11T00:00:00.000' AS DateTime), N'Gündem 66', 64, CAST(N'1988-10-02T00:00:00.000' AS DateTime), N'Sotumluluk-1,Sorumluluk-2,Sorumluluk-3', N'Üst Süreç 66', N'Politika 66')
INSERT [dbo].[Kurullar] ([KurulID], [Adi], [Sponsoru], [Baskani], [Raportor], [Amac], [KayitTarihi], [Gundem], [SiraNo], [BasTarihi], [Sorumluluklar], [IlgiliUstSurec], [Politika]) VALUES (64, N'Bizim Kurul', 20622, 20955, 20600, N'Amaç 66 Amaç 66 Amaç 66 Amaç 66 Amaç 66 Amaç 66 Amaç 66 Amaç 66', CAST(N'2016-01-11T00:00:00.000' AS DateTime), N'Gündem 66', 69, CAST(N'1988-10-02T00:00:00.000' AS DateTime), N'Sotumluluk-1,Sorumluluk-2,Sorumluluk-3', N'Üst Süreç 66', N'Politika 66')
INSERT [dbo].[Kurullar] ([KurulID], [Adi], [Sponsoru], [Baskani], [Raportor], [Amac], [KayitTarihi], [Gundem], [SiraNo], [BasTarihi], [Sorumluluklar], [IlgiliUstSurec], [Politika]) VALUES (66, N'Deneme Kurul', 20625, 5456, 7053, N'amaç', CAST(N'2016-07-25T14:11:38.410' AS DateTime), NULL, NULL, CAST(N'2016-07-27T00:00:00.000' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Kurullar] ([KurulID], [Adi], [Sponsoru], [Baskani], [Raportor], [Amac], [KayitTarihi], [Gundem], [SiraNo], [BasTarihi], [Sorumluluklar], [IlgiliUstSurec], [Politika]) VALUES (2065, N'yeniii', 7053, 20625, 20600, N'asd', CAST(N'2016-10-10T19:11:58.427' AS DateTime), N'qwe', NULL, CAST(N'2016-10-12T00:00:00.000' AS DateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Kurullar] OFF
INSERT [dbo].[Personel] ([SicilNo], [AdSoyad], [Mudurluk], [Yoneticilik]) VALUES (2116, N'Özer', N'Muhasebe', N'MÜDÜR')
INSERT [dbo].[Personel] ([SicilNo], [AdSoyad], [Mudurluk], [Yoneticilik]) VALUES (3081, N'Faruk', N'Polietilen Üretim', N'MÜDÜR')
INSERT [dbo].[Personel] ([SicilNo], [AdSoyad], [Mudurluk], [Yoneticilik]) VALUES (3115, N'Hüseyin', N'Poliolefin Üretim', N'MÜDÜR')
INSERT [dbo].[Personel] ([SicilNo], [AdSoyad], [Mudurluk], [Yoneticilik]) VALUES (5407, N'Hüseyin', N'Mekanik İnşaat Destek', N'MÜDÜR')
INSERT [dbo].[Personel] ([SicilNo], [AdSoyad], [Mudurluk], [Yoneticilik]) VALUES (5456, N'Ahmet', N'Polietilen Üretim', N'AYPE Üretim')
INSERT [dbo].[Personel] ([SicilNo], [AdSoyad], [Mudurluk], [Yoneticilik]) VALUES (5467, N'Özgür', N'Enerji Üretim', N'Buhar Üretim')
INSERT [dbo].[Personel] ([SicilNo], [AdSoyad], [Mudurluk], [Yoneticilik]) VALUES (5652, N'Salih', N'Poliolefin Müdürlüğü', N'PVC Üretim')
INSERT [dbo].[Personel] ([SicilNo], [AdSoyad], [Mudurluk], [Yoneticilik]) VALUES (5683, N'Yücel', N'Bilgi Teknolojileri', N'Donanım ve Sistem')
INSERT [dbo].[Personel] ([SicilNo], [AdSoyad], [Mudurluk], [Yoneticilik]) VALUES (5716, N'Ali', N'İnsan Kaynakları', N'İnsan Kaynakları ve Kurumsal Gelişim')
INSERT [dbo].[Personel] ([SicilNo], [AdSoyad], [Mudurluk], [Yoneticilik]) VALUES (5732, N'Okay', N'Poliolefin Üretim', N'YYPE Üretim')
INSERT [dbo].[Personel] ([SicilNo], [AdSoyad], [Mudurluk], [Yoneticilik]) VALUES (6032, N'Bünyamin', N'Enerji Yönetim', N'Elektrik Üretim')
INSERT [dbo].[Personel] ([SicilNo], [AdSoyad], [Mudurluk], [Yoneticilik]) VALUES (7028, N'Ali', N'Aromatikler ve Glikol Üretim', N'MÜDÜR')
INSERT [dbo].[Personel] ([SicilNo], [AdSoyad], [Mudurluk], [Yoneticilik]) VALUES (7047, N'Kemal', N'Klor Akrilik Üretim', N'MÜDÜR')
INSERT [dbo].[Personel] ([SicilNo], [AdSoyad], [Mudurluk], [Yoneticilik]) VALUES (7053, N'Hasan', N'Etilen Üretim', N'MÜDÜR')
INSERT [dbo].[Personel] ([SicilNo], [AdSoyad], [Mudurluk], [Yoneticilik]) VALUES (20044, N'Mesut', N'Bilgi Teknolojileri', N'Yazılım')
INSERT [dbo].[Personel] ([SicilNo], [AdSoyad], [Mudurluk], [Yoneticilik]) VALUES (20300, N'Muhammed', N'Endüstriyel İlişkiler Ücretlendirme', N'Ücretlendirme Yan Haklar')
INSERT [dbo].[Personel] ([SicilNo], [AdSoyad], [Mudurluk], [Yoneticilik]) VALUES (20312, N'Ömer', N'Polietilen Üretim', N'AYPE-T Üretim')
INSERT [dbo].[Personel] ([SicilNo], [AdSoyad], [Mudurluk], [Yoneticilik]) VALUES (20314, N'Ömer', N'İnsan Kaynakları', N'Performans ve Yönetim Sistemleri')
INSERT [dbo].[Personel] ([SicilNo], [AdSoyad], [Mudurluk], [Yoneticilik]) VALUES (20315, N'Güven', N'Çevre ve Yardımcı İşletmeler', N'MÜDÜR')
INSERT [dbo].[Personel] ([SicilNo], [AdSoyad], [Mudurluk], [Yoneticilik]) VALUES (20551, N'Sedat', N'Enerji Yönetim', N'MÜDÜR')
INSERT [dbo].[Personel] ([SicilNo], [AdSoyad], [Mudurluk], [Yoneticilik]) VALUES (20600, N'Gökhan', N'Endüstriyel İlişkiler Ücretlendirme', N'Hizmet Alım Değerlendirme')
INSERT [dbo].[Personel] ([SicilNo], [AdSoyad], [Mudurluk], [Yoneticilik]) VALUES (20622, N'Sedat', N'Bilgi Teknolojileri', N'Yazılım')
INSERT [dbo].[Personel] ([SicilNo], [AdSoyad], [Mudurluk], [Yoneticilik]) VALUES (20625, N'Hayrullah', N'Endüstriyel İlişkiler Ücretlendirme', N'Ücretlendirme Yan Haklar')
INSERT [dbo].[Personel] ([SicilNo], [AdSoyad], [Mudurluk], [Yoneticilik]) VALUES (20629, N'Mesrur', N'Finansman', N'MÜDÜR')
INSERT [dbo].[Personel] ([SicilNo], [AdSoyad], [Mudurluk], [Yoneticilik]) VALUES (20630, N'Barış', N'Bilgi Teknolojileri', N'Donanım ve Sistem')
INSERT [dbo].[Personel] ([SicilNo], [AdSoyad], [Mudurluk], [Yoneticilik]) VALUES (20920, N'Rakif', N'İnsan Kaynakları', N'MÜDÜR')
INSERT [dbo].[Personel] ([SicilNo], [AdSoyad], [Mudurluk], [Yoneticilik]) VALUES (20955, N'Merve', N'Üretim Planlama', N'Mühendis')
SET IDENTITY_INSERT [dbo].[Uyeler] ON 

INSERT [dbo].[Uyeler] ([UyeID], [KurulID], [PersNo], [PersMi], [Aktif], [UyeCikisTarihi], [UyeOlusTarihi]) VALUES (87, 62, 20312, 1, 1, CAST(N'2015-10-10T00:00:00.000' AS DateTime), CAST(N'1985-10-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Uyeler] ([UyeID], [KurulID], [PersNo], [PersMi], [Aktif], [UyeCikisTarihi], [UyeOlusTarihi]) VALUES (88, 63, 20600, 1, 1, CAST(N'2016-01-08T00:00:00.000' AS DateTime), CAST(N'2015-02-08T00:00:00.000' AS DateTime))
INSERT [dbo].[Uyeler] ([UyeID], [KurulID], [PersNo], [PersMi], [Aktif], [UyeCikisTarihi], [UyeOlusTarihi]) VALUES (93, 59, 20955, 1, 0, CAST(N'2016-08-18T15:34:22.250' AS DateTime), CAST(N'2015-10-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Uyeler] ([UyeID], [KurulID], [PersNo], [PersMi], [Aktif], [UyeCikisTarihi], [UyeOlusTarihi]) VALUES (95, 59, 20622, 1, 1, CAST(N'2016-03-02T00:00:00.000' AS DateTime), CAST(N'2016-02-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Uyeler] ([UyeID], [KurulID], [PersNo], [PersMi], [Aktif], [UyeCikisTarihi], [UyeOlusTarihi]) VALUES (98, 59, 20622, 1, 0, CAST(N'2016-03-02T00:00:00.000' AS DateTime), CAST(N'2016-02-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Uyeler] ([UyeID], [KurulID], [PersNo], [PersMi], [Aktif], [UyeCikisTarihi], [UyeOlusTarihi]) VALUES (112, 59, 5456, 1, 1, NULL, CAST(N'2016-07-21T10:56:48.287' AS DateTime))
INSERT [dbo].[Uyeler] ([UyeID], [KurulID], [PersNo], [PersMi], [Aktif], [UyeCikisTarihi], [UyeOlusTarihi]) VALUES (119, 59, 20625, 1, 0, CAST(N'2016-07-21T13:16:29.027' AS DateTime), CAST(N'2016-07-21T13:16:25.520' AS DateTime))
INSERT [dbo].[Uyeler] ([UyeID], [KurulID], [PersNo], [PersMi], [Aktif], [UyeCikisTarihi], [UyeOlusTarihi]) VALUES (120, 59, 20625, 1, 0, CAST(N'2016-07-22T10:49:22.267' AS DateTime), CAST(N'2016-07-22T10:48:42.080' AS DateTime))
INSERT [dbo].[Uyeler] ([UyeID], [KurulID], [PersNo], [PersMi], [Aktif], [UyeCikisTarihi], [UyeOlusTarihi]) VALUES (2129, 66, 20629, 1, 1, NULL, CAST(N'2016-07-27T16:19:24.470' AS DateTime))
INSERT [dbo].[Uyeler] ([UyeID], [KurulID], [PersNo], [PersMi], [Aktif], [UyeCikisTarihi], [UyeOlusTarihi]) VALUES (2130, 66, 20625, 1, 0, CAST(N'2016-07-27T16:40:42.423' AS DateTime), CAST(N'2016-07-27T16:40:08.120' AS DateTime))
INSERT [dbo].[Uyeler] ([UyeID], [KurulID], [PersNo], [PersMi], [Aktif], [UyeCikisTarihi], [UyeOlusTarihi]) VALUES (2131, 66, 5456, 1, 1, NULL, CAST(N'2016-07-27T16:41:07.327' AS DateTime))
INSERT [dbo].[Uyeler] ([UyeID], [KurulID], [PersNo], [PersMi], [Aktif], [UyeCikisTarihi], [UyeOlusTarihi]) VALUES (2132, 62, 20625, 1, 1, NULL, CAST(N'2016-07-28T08:52:30.743' AS DateTime))
INSERT [dbo].[Uyeler] ([UyeID], [KurulID], [PersNo], [PersMi], [Aktif], [UyeCikisTarihi], [UyeOlusTarihi]) VALUES (3121, 2065, 6032, 1, 0, CAST(N'2016-10-10T19:12:56.517' AS DateTime), CAST(N'2016-10-10T19:12:43.280' AS DateTime))
INSERT [dbo].[Uyeler] ([UyeID], [KurulID], [PersNo], [PersMi], [Aktif], [UyeCikisTarihi], [UyeOlusTarihi]) VALUES (3122, 2065, 3081, 1, 1, NULL, CAST(N'2016-10-10T19:12:52.827' AS DateTime))
SET IDENTITY_INSERT [dbo].[Uyeler] OFF
ALTER TABLE [dbo].[Aksiyonlar] ADD  CONSTRAINT [DF_YORUMLAR_TARIH]  DEFAULT (getdate()) FOR [MevcutDurumu]
GO
ALTER TABLE [dbo].[Aksiyonlar]  WITH CHECK ADD  CONSTRAINT [FK_Aksiyonlar_Kurullar] FOREIGN KEY([KurulID])
REFERENCES [dbo].[Kurullar] ([KurulID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Aksiyonlar] CHECK CONSTRAINT [FK_Aksiyonlar_Kurullar]
GO
ALTER TABLE [dbo].[Dosyalar]  WITH CHECK ADD  CONSTRAINT [FK_Dosyalar_Kurullar1] FOREIGN KEY([KurulID])
REFERENCES [dbo].[Kurullar] ([KurulID])
GO
ALTER TABLE [dbo].[Dosyalar] CHECK CONSTRAINT [FK_Dosyalar_Kurullar1]
GO
ALTER TABLE [dbo].[Katilim]  WITH CHECK ADD  CONSTRAINT [FK_Katilim_Kurullar] FOREIGN KEY([KurulID])
REFERENCES [dbo].[Kurullar] ([KurulID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Katilim] CHECK CONSTRAINT [FK_Katilim_Kurullar]
GO
ALTER TABLE [dbo].[Uyeler]  WITH CHECK ADD  CONSTRAINT [FK_Uyeler_Kurullar] FOREIGN KEY([KurulID])
REFERENCES [dbo].[Kurullar] ([KurulID])
GO
ALTER TABLE [dbo].[Uyeler] CHECK CONSTRAINT [FK_Uyeler_Kurullar]
GO
/****** Object:  StoredProcedure [dbo].[__spGetKatilimYillari]    Script Date: 5.4.2018 18:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[__spGetKatilimYillari]
	@id [int]
WITH EXECUTE AS CALLER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT DISTINCT YEAR(Tarih)  FROM [Kurullar].[dbo].[Katilim]   
		WHERE KurulID = @id  
			GROUP BY Tarih

END

GO
/****** Object:  StoredProcedure [dbo].[__spKatilimTakvimi]    Script Date: 5.4.2018 18:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[__spKatilimTakvimi]
	@kurulID [int] = 0
WITH EXECUTE AS CALLER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

DECLARE @columns VARCHAR(8000)
DECLARE @query VARCHAR(8000)
 
SELECT @columns = COALESCE(@columns + ',[' + CONVERT(varchar(10), dbo.ToplantilarView.ToplantiTarihi, 104) + ']','[' +CONVERT(varchar(10), dbo.ToplantilarView.ToplantiTarihi, 104)+ ']')
FROM dbo.ToplantilarView where KurulID = @kurulID order BY ToplantiTarihi;

SET @query = '
SELECT * from (   select dbo.ToplantilarView.ToplantiTarihi, dbo.Uyeler.PersNo, cast(isnull(Katildi,0) as int) as Katildi
FROM         dbo.ToplantilarView INNER JOIN
                      dbo.Uyeler ON dbo.ToplantilarView.KurulID = dbo.Uyeler.KurulID LEFT OUTER JOIN
                      dbo.Katilim ON dbo.ToplantilarView.KurulID = dbo.Katilim.KurulID AND CONVERT(varchar(10), dbo.ToplantilarView.ToplantiTarihi, 104) = dbo.Katilim.Tarih AND 
                      dbo.Uyeler.PersNo = dbo.Katilim.PerNr where dbo.ToplantilarView.KurulID  = '+ CAST(@kurulID AS VARCHAR(10)) +'
) as t
PIVOT
(
MAX(Katildi)
FOR [ToplantiTarihi]
IN ('+@columns+')
)AS p'

EXECUTE(@query)

END



GO
/****** Object:  StoredProcedure [dbo].[__spKatilimTakvimi2]    Script Date: 5.4.2018 18:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[__spKatilimTakvimi2]
	@kurulID [int] = 0
WITH EXECUTE AS CALLER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements. cast(isnull(Katildi,0) as int)
	SET NOCOUNT ON;

DECLARE @columns VARCHAR(8000)
DECLARE @query VARCHAR(8000)
 
SELECT @columns = COALESCE(@columns + ',[' + CONVERT(varchar(10), dbo.ToplantilarView.ToplantiTarihi, 104) + ']','[' +CONVERT(varchar(10), dbo.ToplantilarView.ToplantiTarihi, 104)+ ']')
FROM dbo.ToplantilarView where KurulID = @kurulID order BY ToplantiTarihi;

SET @query = '
SELECT * from (   select dbo.ToplantilarView.ToplantiTarihi, dbo.UyelerVeBaskanView.PersNo, cast(Katildi as varchar(1)) as Katildi
FROM         dbo.ToplantilarView INNER JOIN
                      dbo.UyelerVeBaskanView ON dbo.ToplantilarView.KurulID = dbo.UyelerVeBaskanView.KurulID LEFT OUTER JOIN
                      dbo.Katilim ON dbo.ToplantilarView.KurulID = dbo.Katilim.KurulID AND CONVERT(varchar(10), dbo.ToplantilarView.ToplantiTarihi, 104) = dbo.Katilim.Tarih AND 
                      dbo.UyelerVeBaskanView.PersNo = dbo.Katilim.PerNr where dbo.ToplantilarView.KurulID  = '+ CAST(@kurulID AS VARCHAR(10)) +'
) as t
PIVOT
(
MAX(Katildi)
FOR [ToplantiTarihi]
IN ('+@columns+')
)AS p'

EXECUTE(@query)

END


GO
/****** Object:  StoredProcedure [dbo].[__spKurulKatilimTakvimi]    Script Date: 5.4.2018 18:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[__spKurulKatilimTakvimi]
	@kurulID [int] = 0,
	@year [nvarchar](4)
WITH EXECUTE AS CALLER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements. cast(isnull(Katildi,0) as int)
	SET NOCOUNT ON;

DECLARE @columns VARCHAR(8000)
DECLARE @query VARCHAR(8000)
 
SELECT @columns = COALESCE(@columns + ',[' + CONVERT(varchar(10), dbo.ToplantilarView.ToplantiTarihi, 104) + ']','[' +CONVERT(varchar(10), dbo.ToplantilarView.ToplantiTarihi, 104)+ ']')
FROM dbo.ToplantilarView where KurulID = @kurulID and YEAR(ToplantiTarihi)=@year order BY ToplantiTarihi;

SET @query = '
SELECT * from (   select dbo.ToplantilarView.ToplantiTarihi, dbo.UyelerVeBaskanView.PersNo, cast(Katildi as varchar(1)) as Katildi
FROM         dbo.ToplantilarView INNER JOIN
                      dbo.UyelerVeBaskanView ON dbo.ToplantilarView.KurulID = dbo.UyelerVeBaskanView.KurulID LEFT OUTER JOIN
                      dbo.Katilim ON dbo.ToplantilarView.KurulID = dbo.Katilim.KurulID AND CONVERT(varchar(10), dbo.ToplantilarView.ToplantiTarihi, 104) = dbo.Katilim.Tarih AND 
                      dbo.UyelerVeBaskanView.PersNo = dbo.Katilim.PerNr where dbo.ToplantilarView.KurulID  = '+ CAST(@kurulID AS VARCHAR(10)) +'
) as t
PIVOT
(
MAX(Katildi)
FOR [ToplantiTarihi]
IN ('+@columns+')
)AS p'

EXECUTE(@query)

END


GO
/****** Object:  StoredProcedure [dbo].[proc_AksiyonlarDelete]    Script Date: 5.4.2018 18:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_AksiyonlarDelete]
	@AksiyonID [int]
WITH EXECUTE AS CALLER
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Aksiyonlar]
	WHERE
		[AksiyonID] = @AksiyonID
	SET @Err = @@Error

	RETURN @Err
END

GO
/****** Object:  StoredProcedure [dbo].[proc_AksiyonlarInsert]    Script Date: 5.4.2018 18:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_AksiyonlarInsert]
	@AksiyonID [int] = NULL OUTPUT,
	@KurulID [int],
	@KriterNo [varchar](10) = NULL,
	@GorusulenKonu [varchar](3000),
	@MevcutDurumu [varchar](3000) = NULL,
	@SorumluPersNo [nvarchar](8) = NULL,
	@GundemeTarihi [datetime] = NULL,
	@HedefTarihi [datetime] = NULL,
	@IsBitisTarihi [datetime] = NULL,
	@KayitSahibiPersNo [nvarchar](8) = NULL,
	@SorumluPersoneller [varchar](150) = NULL,
	@AksiyonSonucu [varchar](1000) = NULL,
	@Gelisme [varchar](1000) = NULL,
	@Sonuc [varchar](100) = NULL
WITH EXECUTE AS CALLER
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Aksiyonlar]
	(
		[KurulID],
		[KriterNo],
		[GorusulenKonu],
		[MevcutDurumu],
		[SorumluPersNo],
		[GundemeTarihi],
		[HedefTarihi],
		[IsBitisTarihi],
		[KayitSahibiPersNo],
		[SorumluPersoneller],
		[AksiyonSonucu],
		[Gelisme],
		[Sonuc]
	)
	VALUES
	(
		@KurulID,
		@KriterNo,
		@GorusulenKonu,
		@MevcutDurumu,
		@SorumluPersNo,
		@GundemeTarihi,
		@HedefTarihi,
		@IsBitisTarihi,
		@KayitSahibiPersNo,
		@SorumluPersoneller,
		@AksiyonSonucu,
		@Gelisme,
		@Sonuc
	)

	SET @Err = @@Error

	SELECT @AksiyonID = SCOPE_IDENTITY()

	RETURN @Err
END

GO
/****** Object:  StoredProcedure [dbo].[proc_AksiyonlarLoadAll]    Script Date: 5.4.2018 18:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_AksiyonlarLoadAll]
WITH EXECUTE AS CALLER
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[AksiyonID],
		[KurulID],
		[KriterNo],
		[GorusulenKonu],
		[MevcutDurumu],
		[SorumluPersNo],
		[GundemeTarihi],
		[HedefTarihi],
		[IsBitisTarihi],
		[KayitSahibiPersNo],
		[SorumluPersoneller],
		[AksiyonSonucu],
		[Gelisme],
		[Sonuc]
	FROM [Aksiyonlar]

	SET @Err = @@Error

	RETURN @Err
END

GO
/****** Object:  StoredProcedure [dbo].[proc_AksiyonlarLoadByPrimaryKey]    Script Date: 5.4.2018 18:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_AksiyonlarLoadByPrimaryKey]
	@AksiyonID [int]
WITH EXECUTE AS CALLER
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[AksiyonID],
		[KurulID],
		[KriterNo],
		[GorusulenKonu],
		[MevcutDurumu],
		[SorumluPersNo],
		[GundemeTarihi],
		[HedefTarihi],
		[IsBitisTarihi],
		[KayitSahibiPersNo],
		[SorumluPersoneller],
		[AksiyonSonucu],
		[Gelisme],
		[Sonuc]
	FROM [Aksiyonlar]
	WHERE
		([AksiyonID] = @AksiyonID)

	SET @Err = @@Error

	RETURN @Err
END

GO
/****** Object:  StoredProcedure [dbo].[proc_AksiyonlarUpdate]    Script Date: 5.4.2018 18:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_AksiyonlarUpdate]
	@AksiyonID [int],
	@KurulID [int],
	@KriterNo [varchar](10) = NULL,
	@GorusulenKonu [varchar](3000),
	@MevcutDurumu [varchar](3000) = NULL,
	@SorumluPersNo [nvarchar](8) = NULL,
	@GundemeTarihi [datetime] = NULL,
	@HedefTarihi [datetime] = NULL,
	@IsBitisTarihi [datetime] = NULL,
	@KayitSahibiPersNo [nvarchar](8) = NULL,
	@SorumluPersoneller [varchar](150) = NULL,
	@AksiyonSonucu [varchar](1000) = NULL,
	@Gelisme [varchar](1000) = NULL,
	@Sonuc [varchar](100) = NULL
WITH EXECUTE AS CALLER
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Aksiyonlar]
	SET
		[KurulID] = @KurulID,
		[KriterNo] = @KriterNo,
		[GorusulenKonu] = @GorusulenKonu,
		[MevcutDurumu] = @MevcutDurumu,
		[SorumluPersNo] = @SorumluPersNo,
		[GundemeTarihi] = @GundemeTarihi,
		[HedefTarihi] = @HedefTarihi,
		[IsBitisTarihi] = @IsBitisTarihi,
		[KayitSahibiPersNo] = @KayitSahibiPersNo,
		[SorumluPersoneller] = @SorumluPersoneller,
		[AksiyonSonucu] = @AksiyonSonucu,
		[Gelisme] = @Gelisme,
		[Sonuc] = @Sonuc
	WHERE
		[AksiyonID] = @AksiyonID


	SET @Err = @@Error


	RETURN @Err
END

GO
/****** Object:  StoredProcedure [dbo].[proc_DosyalarDelete]    Script Date: 5.4.2018 18:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_DosyalarDelete]
	@DosyaID [int]
WITH EXECUTE AS CALLER
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Dosyalar]
	WHERE
		[DosyaID] = @DosyaID
	SET @Err = @@Error

	RETURN @Err
END

GO
/****** Object:  StoredProcedure [dbo].[proc_DosyalarInsert]    Script Date: 5.4.2018 18:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_DosyalarInsert]
	@DosyaID [int] = NULL OUTPUT,
	@KurulID [int] = NULL,
	@DosyaAdi [varchar](100),
	@DosyaYeniAdi [varchar](100) = NULL,
	@YukleyenPersNo [nvarchar](8) = NULL,
	@Aciklama [varchar](100) = NULL,
	@Tur [varchar](1) = NULL
WITH EXECUTE AS CALLER
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Dosyalar]
	(
		[KurulID],
		[DosyaAdi],
		[DosyaYeniAdi],
		[YukleyenPersNo],
		[Aciklama],
		[Tur]
	)
	VALUES
	(
		@KurulID,
		@DosyaAdi,
		@DosyaYeniAdi,
		@YukleyenPersNo,
		@Aciklama,
		@Tur
	)

	SET @Err = @@Error

	SELECT @DosyaID = SCOPE_IDENTITY()

	RETURN @Err
END

GO
/****** Object:  StoredProcedure [dbo].[proc_DosyalarLoadAll]    Script Date: 5.4.2018 18:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_DosyalarLoadAll]
WITH EXECUTE AS CALLER
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[DosyaID],
		[KurulID],
		[DosyaAdi],
		[DosyaYeniAdi],
		[YukleyenPersNo],
		[Aciklama],
		[Tur]
	FROM [Dosyalar]

	SET @Err = @@Error

	RETURN @Err
END

GO
/****** Object:  StoredProcedure [dbo].[proc_DosyalarLoadByPrimaryKey]    Script Date: 5.4.2018 18:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_DosyalarLoadByPrimaryKey]
	@DosyaID [int]
WITH EXECUTE AS CALLER
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[DosyaID],
		[KurulID],
		[DosyaAdi],
		[DosyaYeniAdi],
		[YukleyenPersNo],
		[Aciklama],
		[Tur]
	FROM [Dosyalar]
	WHERE
		([DosyaID] = @DosyaID)

	SET @Err = @@Error

	RETURN @Err
END

GO
/****** Object:  StoredProcedure [dbo].[proc_DosyalarUpdate]    Script Date: 5.4.2018 18:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_DosyalarUpdate]
	@DosyaID [int],
	@KurulID [int] = NULL,
	@DosyaAdi [varchar](100),
	@DosyaYeniAdi [varchar](100) = NULL,
	@YukleyenPersNo [nvarchar](8) = NULL,
	@Aciklama [varchar](100) = NULL,
	@Tur [varchar](1) = NULL
WITH EXECUTE AS CALLER
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Dosyalar]
	SET
		[KurulID] = @KurulID,
		[DosyaAdi] = @DosyaAdi,
		[DosyaYeniAdi] = @DosyaYeniAdi,
		[YukleyenPersNo] = @YukleyenPersNo,
		[Aciklama] = @Aciklama,
		[Tur] = @Tur
	WHERE
		[DosyaID] = @DosyaID


	SET @Err = @@Error


	RETURN @Err
END

GO
/****** Object:  StoredProcedure [dbo].[proc_KatilimDelete]    Script Date: 5.4.2018 18:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_KatilimDelete]
	@ID [int]
WITH EXECUTE AS CALLER
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Katilim]
	WHERE
		[ID] = @ID
	SET @Err = @@Error

	RETURN @Err
END

GO
/****** Object:  StoredProcedure [dbo].[proc_KatilimInsert]    Script Date: 5.4.2018 18:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_KatilimInsert]
	@ID [int] = NULL OUTPUT,
	@KurulID [int],
	@Tarih [datetime],
	@PerNr [nvarchar](8),
	@Katildi [int] = NULL
WITH EXECUTE AS CALLER
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Katilim]
	(
		[KurulID],
		[Tarih],
		[PerNr],
		[Katildi]
	)
	VALUES
	(
		@KurulID,
		@Tarih,
		@PerNr,
		@Katildi
	)

	SET @Err = @@Error

	SELECT @ID = SCOPE_IDENTITY()

	RETURN @Err
END

GO
/****** Object:  StoredProcedure [dbo].[proc_KatilimLoadAll]    Script Date: 5.4.2018 18:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_KatilimLoadAll]
WITH EXECUTE AS CALLER
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[KurulID],
		[Tarih],
		[PerNr],
		[Katildi]
	FROM [Katilim]

	SET @Err = @@Error

	RETURN @Err
END

GO
/****** Object:  StoredProcedure [dbo].[proc_KatilimLoadByPrimaryKey]    Script Date: 5.4.2018 18:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_KatilimLoadByPrimaryKey]
	@ID [int]
WITH EXECUTE AS CALLER
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ID],
		[KurulID],
		[Tarih],
		[PerNr],
		[Katildi]
	FROM [Katilim]
	WHERE
		([ID] = @ID)

	SET @Err = @@Error

	RETURN @Err
END

GO
/****** Object:  StoredProcedure [dbo].[proc_KatilimUpdate]    Script Date: 5.4.2018 18:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_KatilimUpdate]
	@ID [int],
	@KurulID [int],
	@Tarih [datetime],
	@PerNr [nvarchar](8),
	@Katildi [int] = NULL
WITH EXECUTE AS CALLER
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Katilim]
	SET
		[KurulID] = @KurulID,
		[Tarih] = @Tarih,
		[PerNr] = @PerNr,
		[Katildi] = @Katildi
	WHERE
		[ID] = @ID


	SET @Err = @@Error


	RETURN @Err
END

GO
/****** Object:  StoredProcedure [dbo].[proc_KurullarDelete]    Script Date: 5.4.2018 18:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_KurullarDelete]
	@KurulID [int]
WITH EXECUTE AS CALLER
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Kurullar]
	WHERE
		[KurulID] = @KurulID
	SET @Err = @@Error

	RETURN @Err
END

GO
/****** Object:  StoredProcedure [dbo].[proc_KurullarInsert]    Script Date: 5.4.2018 18:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_KurullarInsert]
	@KurulID [int] = NULL OUTPUT,
	@Adi [varchar](100) = NULL,
	@Sponsoru [varchar](100) = NULL,
	@Baskani [varchar](50) = NULL,
	@Raportor [varchar](50) = NULL,
	@Amac [varchar](1000) = NULL,
	@KayitTarihi [datetime] = NULL,
	@Gundem [varchar](1000) = NULL,
	@SiraNo [int] = NULL,
	@BasTarihi [varchar](15) = NULL,
	@Sorumluluklar [varchar](1000) = NULL,
	@IlgiliUstSurec [varchar](200) = NULL,
	@Politika [varchar](250) = NULL
WITH EXECUTE AS CALLER
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	INSERT
	INTO [Kurullar]
	(
		[Adi],
		[Sponsoru],
		[Baskani],
		[Raportor],
		[Amac],
		[KayitTarihi],
		[Gundem],
		[SiraNo],
		[BasTarihi],
		[Sorumluluklar],
		[IlgiliUstSurec],
		[Politika]
	)
	VALUES
	(
		@Adi,
		@Sponsoru,
		@Baskani,
		@Raportor,
		@Amac,
		@KayitTarihi,
		@Gundem,
		@SiraNo,
		@BasTarihi,
		@Sorumluluklar,
		@IlgiliUstSurec,
		@Politika
	)

	SET @Err = @@Error

	SELECT @KurulID = SCOPE_IDENTITY()

	RETURN @Err
END

GO
/****** Object:  StoredProcedure [dbo].[proc_KurullarLoadAll]    Script Date: 5.4.2018 18:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_KurullarLoadAll]
WITH EXECUTE AS CALLER
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[KurulID],
		[Adi],
		[Sponsoru],
		[Baskani],
		[Raportor],
		[Amac],
		[KayitTarihi],
		[Gundem],
		[SiraNo],
		[BasTarihi],
		[Sorumluluklar],
		[IlgiliUstSurec],
		[Politika]
	FROM [Kurullar]

	SET @Err = @@Error

	RETURN @Err
END

GO
/****** Object:  StoredProcedure [dbo].[proc_KurullarLoadByPrimaryKey]    Script Date: 5.4.2018 18:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_KurullarLoadByPrimaryKey]
	@KurulID [int]
WITH EXECUTE AS CALLER
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[KurulID],
		[Adi],
		[Sponsoru],
		[Baskani],
		[Raportor],
		[Amac],
		[KayitTarihi],
		[Gundem],
		[SiraNo],
		[BasTarihi],
		[Sorumluluklar],
		[IlgiliUstSurec],
		[Politika]
	FROM [Kurullar]
	WHERE
		([KurulID] = @KurulID)

	SET @Err = @@Error

	RETURN @Err
END

GO
/****** Object:  StoredProcedure [dbo].[proc_KurullarUpdate]    Script Date: 5.4.2018 18:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_KurullarUpdate]
	@KurulID [int],
	@Adi [varchar](100) = NULL,
	@Sponsoru [varchar](100) = NULL,
	@Baskani [varchar](50) = NULL,
	@Raportor [varchar](50) = NULL,
	@Amac [varchar](1000) = NULL,
	@KayitTarihi [datetime] = NULL,
	@Gundem [varchar](1000) = NULL,
	@SiraNo [int] = NULL,
	@BasTarihi [varchar](15) = NULL,
	@Sorumluluklar [varchar](1000) = NULL,
	@IlgiliUstSurec [varchar](200) = NULL,
	@Politika [varchar](250) = NULL
WITH EXECUTE AS CALLER
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	UPDATE [Kurullar]
	SET
		[Adi] = @Adi,
		[Sponsoru] = @Sponsoru,
		[Baskani] = @Baskani,
		[Raportor] = @Raportor,
		[Amac] = @Amac,
		[KayitTarihi] = @KayitTarihi,
		[Gundem] = @Gundem,
		[SiraNo] = @SiraNo,
		[BasTarihi] = @BasTarihi,
		[Sorumluluklar] = @Sorumluluklar,
		[IlgiliUstSurec] = @IlgiliUstSurec,
		[Politika] = @Politika
	WHERE
		[KurulID] = @KurulID


	SET @Err = @@Error


	RETURN @Err
END

GO
/****** Object:  StoredProcedure [dbo].[proc_UyelerDelete]    Script Date: 5.4.2018 18:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[proc_UyelerDelete]
	@UyeID [int]
WITH EXECUTE AS CALLER
AS
BEGIN

	SET NOCOUNT OFF
	DECLARE @Err int

	DELETE
	FROM [Uyeler]
	WHERE
		[UyeID] = @UyeID
	SET @Err = @@Error

	RETURN @Err
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetDosyaBilgisi]    Script Date: 5.4.2018 18:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetDosyaBilgisi]
	@id int = 0
AS
BEGIN
	SET NOCOUNT ON;

    SELECT d.DosyaID,d.KurulID,d.DosyaAdi,d.Aciklama,d.Tur,d.DosyaYeniAdi,d.YukleyenPersNo,p.AdSoyad,k.Adi AS KurulAdi
	FROM Dosyalar AS d,Personel AS p,Kurullar AS k
	WHERE d.YukleyenPersNo=p.SicilNo AND d.DosyaID=@id AND d.KurulID=k.KurulID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetSecilenKurulAksiyon]    Script Date: 5.4.2018 18:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetSecilenKurulAksiyon]
	@id int = 0
AS
BEGIN
	SET NOCOUNT ON;

    SELECT * FROM AksiyonlarView AS av WHERE av.KurulID=@id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetSecilenKurulDosya]    Script Date: 5.4.2018 18:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetSecilenKurulDosya]
	@id int = 0
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * FROM SecilenKurulDosyasiView AS skdv WHERE skdv.KurulID=@id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetSecilenKurulGenel]    Script Date: 5.4.2018 18:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetSecilenKurulGenel]
	-- Add the parameters for the stored procedure here
	@id int = 0
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * FROM [SecilenKurulView] AS skv WHERE skv.KurulID = @id

END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetSecilenKurulUyeleri]    Script Date: 5.4.2018 18:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetSecilenKurulUyeleri]
	@id int = 0
AS
BEGIN

	SET NOCOUNT ON;
	
	SELECT * FROM UyelerView AS uv WHERE uv.KurulID=@id AND uv.Aktif=1
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UyelerEkle]    Script Date: 5.4.2018 18:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_UyelerEkle]
	@UyeID int = NULL,
	@KurulID int,
	@PersNo int,
	@PersMi bit = NULL,
	@Aktif bit,
	@UyeCikisTarihi datetime = NULL,
	@UyeOlusTarihi datetime = NULL
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @varMi int

	SET @varMi=(SELECT COUNT(*) FROM Uyeler AS u WHERE u.KurulID=@KurulID AND u.PersNo=@PersNo AND u.Aktif='True')
	
	if(@varMi!=0)
	BEGIN
		SELECT 0
		return
	END
	
    INSERT
	INTO Uyeler (KurulID, PersNo, PersMi, Aktif, UyeCikisTarihi, UyeOlusTarihi)
	VALUES (@KurulID, @PersNo, @PersMi,	@Aktif, @UyeCikisTarihi, @UyeOlusTarihi)

	SELECT 1
	return

END
GO
/****** Object:  StoredProcedure [dbo].[spKurulKatilimTakvimi]    Script Date: 5.4.2018 18:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spKurulKatilimTakvimi]
	@kurulID [int] = 0,
	@year [nvarchar](4)
WITH EXECUTE AS CALLER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements. cast(isnull(Katildi,0) as int)
	SET NOCOUNT ON;

DECLARE @columns VARCHAR(8000)
DECLARE @query VARCHAR(8000)
 
SELECT @columns = COALESCE(@columns + ',[' + CONVERT(varchar(10), dbo.ToplantilarView.ToplantiTarihi, 104) + ']','[' +CONVERT(varchar(10), dbo.ToplantilarView.ToplantiTarihi, 104)+ ']')
FROM dbo.ToplantilarView where KurulID = @kurulID and YEAR(ToplantiTarihi)=@year order BY ToplantiTarihi;

SET @query = '
SELECT * from (   select dbo.ToplantilarView.ToplantiTarihi, dbo.UyelerVeBaskanView.PersNo, cast(Katildi as varchar(1)) as Katildi
FROM         dbo.ToplantilarView INNER JOIN
                      dbo.UyelerVeBaskanView ON dbo.ToplantilarView.KurulID = dbo.UyelerVeBaskanView.KurulID LEFT OUTER JOIN
                      dbo.Katilim ON dbo.ToplantilarView.KurulID = dbo.Katilim.KurulID AND CONVERT(varchar(10), dbo.ToplantilarView.ToplantiTarihi, 104) = dbo.Katilim.Tarih AND 
                      dbo.UyelerVeBaskanView.PersNo = dbo.Katilim.PerNr 
					  where YEAR(isnull(dbo.UyelerVeBaskanView.UyeCikisTarihi,''01.01.3000''))<>year(getdate())
					  and YEAR(isnull(dbo.UyelerVeBaskanView.UyeCikisTarihi,getdate())) >= ' +@year+' 
					  and YEAR(isnull(dbo.UyelerVeBaskanView.UyeOlusTarihi,''01.01.1900'')) <= ' +@year+' 
					  and dbo.ToplantilarView.KurulID  = '+ CAST(@kurulID AS VARCHAR(10)) +'
) as t
PIVOT
(
MAX(Katildi)
FOR [ToplantiTarihi]
IN ('+@columns+')
)AS p'

EXECUTE(@query)

END


GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[65] 4[15] 2[1] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Personel"
            Begin Extent = 
               Top = 168
               Left = 973
               Bottom = 297
               Right = 1129
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Kurullar"
            Begin Extent = 
               Top = 23
               Left = 992
               Bottom = 152
               Right = 1162
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Aksiyonlar"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 304
               Right = 234
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2055
         Alias = 1230
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AksiyonlarView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AksiyonlarView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[42] 4[20] 2[18] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -768
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Dosyalar"
            Begin Extent = 
               Top = 54
               Left = 38
               Bottom = 183
               Right = 213
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Personel"
            Begin Extent = 
               Top = 76
               Left = 800
               Bottom = 205
               Right = 970
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Kurullar"
            Begin Extent = 
               Top = 0
               Left = 599
               Bottom = 129
               Right = 769
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1515
         Alias = 1620
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'd_DosyalarView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'd_DosyalarView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Personel"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 135
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'd_PersonellerView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'd_PersonellerView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'd_UyelerVeBaskanView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'd_UyelerVeBaskanView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[62] 4[27] 2[3] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Uyeler"
            Begin Extent = 
               Top = 3
               Left = 61
               Bottom = 251
               Right = 243
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Personel"
            Begin Extent = 
               Top = 185
               Left = 571
               Bottom = 315
               Right = 753
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Kurullar"
            Begin Extent = 
               Top = 20
               Left = 575
               Bottom = 149
               Right = 760
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 12
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'd_ÜyelerPersonelKurullarView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'd_ÜyelerPersonelKurullarView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[27] 2[14] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Kurullar"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 208
               Right = 224
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "Personel"
            Begin Extent = 
               Top = 7
               Left = 397
               Bottom = 137
               Right = 567
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 1515
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'KurullarView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'KurullarView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[29] 2[12] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Dosyalar"
            Begin Extent = 
               Top = 0
               Left = 305
               Bottom = 183
               Right = 483
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Personel"
            Begin Extent = 
               Top = 5
               Left = 529
               Bottom = 135
               Right = 699
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Kurullar"
            Begin Extent = 
               Top = 5
               Left = 38
               Bottom = 187
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 1425
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SecilenKurulDosyasiView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SecilenKurulDosyasiView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[54] 4[19] 2[22] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Personel_2"
            Begin Extent = 
               Top = 183
               Left = 368
               Bottom = 322
               Right = 538
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Kurullar"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 199
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Personel_1"
            Begin Extent = 
               Top = 126
               Left = 644
               Bottom = 296
               Right = 814
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Personel"
            Begin Extent = 
               Top = 0
               Left = 441
               Bottom = 172
               Right = 611
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 17
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 2325
         Table = 1170
         Output = 720
         Append = 1400
      ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SecilenKurulView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'   NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 975
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SecilenKurulView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SecilenKurulView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[26] 2[19] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Kurullar"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 209
               Right = 211
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Uyeler"
            Begin Extent = 
               Top = 0
               Left = 253
               Bottom = 197
               Right = 441
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Personel"
            Begin Extent = 
               Top = 21
               Left = 475
               Bottom = 151
               Right = 645
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'UyelerView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'UyelerView'
GO
USE [master]
GO
ALTER DATABASE [Kurullar] SET  READ_WRITE 
GO
