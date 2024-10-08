USE [master]
GO
/****** Object:  Database [logistica_DSRP_BI]    Script Date: 31/8/2024 11:42:55 ******/
CREATE DATABASE [logistica_DSRP_BI]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'logistica_DSRP_BI', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\logistica_DSRP_BI.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'logistica_DSRP_BI_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER01\MSSQL\DATA\logistica_DSRP_BI_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [logistica_DSRP_BI] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [logistica_DSRP_BI].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [logistica_DSRP_BI] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [logistica_DSRP_BI] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [logistica_DSRP_BI] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [logistica_DSRP_BI] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [logistica_DSRP_BI] SET ARITHABORT OFF 
GO
ALTER DATABASE [logistica_DSRP_BI] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [logistica_DSRP_BI] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [logistica_DSRP_BI] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [logistica_DSRP_BI] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [logistica_DSRP_BI] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [logistica_DSRP_BI] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [logistica_DSRP_BI] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [logistica_DSRP_BI] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [logistica_DSRP_BI] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [logistica_DSRP_BI] SET  DISABLE_BROKER 
GO
ALTER DATABASE [logistica_DSRP_BI] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [logistica_DSRP_BI] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [logistica_DSRP_BI] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [logistica_DSRP_BI] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [logistica_DSRP_BI] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [logistica_DSRP_BI] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [logistica_DSRP_BI] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [logistica_DSRP_BI] SET RECOVERY FULL 
GO
ALTER DATABASE [logistica_DSRP_BI] SET  MULTI_USER 
GO
ALTER DATABASE [logistica_DSRP_BI] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [logistica_DSRP_BI] SET DB_CHAINING OFF 
GO
ALTER DATABASE [logistica_DSRP_BI] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [logistica_DSRP_BI] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [logistica_DSRP_BI] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [logistica_DSRP_BI] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'logistica_DSRP_BI', N'ON'
GO
ALTER DATABASE [logistica_DSRP_BI] SET QUERY_STORE = ON
GO
ALTER DATABASE [logistica_DSRP_BI] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [logistica_DSRP_BI]
GO
/****** Object:  Table [dbo].[dim_clientes]    Script Date: 31/8/2024 11:42:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_clientes](
	[id] [int] NOT NULL,
	[nombre] [varchar](55) NULL,
	[apellido] [varchar](100) NULL,
	[email] [varchar](150) NULL,
	[telefono] [varchar](20) NULL,
	[direccion] [varchar](255) NULL,
	[fecha_registro] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_conductores]    Script Date: 31/8/2024 11:42:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_conductores](
	[id] [int] NOT NULL,
	[nombre] [varchar](100) NULL,
	[apellido] [varchar](100) NULL,
	[licencia] [varchar](50) NULL,
	[telefono] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_rutas]    Script Date: 31/8/2024 11:42:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_rutas](
	[id] [int] NOT NULL,
	[nombre] [varchar](100) NULL,
	[descripcion] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_sucursales]    Script Date: 31/8/2024 11:42:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_sucursales](
	[id] [int] NOT NULL,
	[nombre] [varchar](100) NULL,
	[direccion] [varchar](255) NULL,
	[telefono] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_tiempo]    Script Date: 31/8/2024 11:42:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_tiempo](
	[fecha] [date] NOT NULL,
	[dia] [int] NULL,
	[mes] [int] NULL,
	[año] [int] NULL,
	[trimestre] [int] NULL,
	[semana] [int] NULL,
	[dia_semana] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[fecha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dim_vehiculos]    Script Date: 31/8/2024 11:42:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dim_vehiculos](
	[id] [int] NOT NULL,
	[placa] [varchar](20) NULL,
	[tipo_vehiculo] [varchar](50) NULL,
	[capacidad] [decimal](10, 2) NULL,
	[conductor_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hechos_encomiendas]    Script Date: 31/8/2024 11:42:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hechos_encomiendas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cliente_id] [int] NULL,
	[origen_sucursal_id] [int] NULL,
	[destino_sucursal_id] [int] NULL,
	[vehiculo_id] [int] NULL,
	[ruta_id] [int] NULL,
	[peso] [decimal](10, 2) NULL,
	[estado] [varchar](50) NULL,
	[fecha_envio] [date] NULL,
	[fecha_entrega] [date] NULL,
	[monto] [decimal](10, 2) NULL,
	[tipo_pago] [varchar](50) NULL,
	[fecha_envio_id] [date] NULL,
	[fecha_entrega_id] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[dim_vehiculos]  WITH CHECK ADD FOREIGN KEY([conductor_id])
REFERENCES [dbo].[dim_conductores] ([id])
GO
ALTER TABLE [dbo].[hechos_encomiendas]  WITH CHECK ADD FOREIGN KEY([cliente_id])
REFERENCES [dbo].[dim_clientes] ([id])
GO
ALTER TABLE [dbo].[hechos_encomiendas]  WITH CHECK ADD FOREIGN KEY([destino_sucursal_id])
REFERENCES [dbo].[dim_sucursales] ([id])
GO
ALTER TABLE [dbo].[hechos_encomiendas]  WITH CHECK ADD FOREIGN KEY([fecha_envio_id])
REFERENCES [dbo].[dim_tiempo] ([fecha])
GO
ALTER TABLE [dbo].[hechos_encomiendas]  WITH CHECK ADD FOREIGN KEY([fecha_entrega_id])
REFERENCES [dbo].[dim_tiempo] ([fecha])
GO
ALTER TABLE [dbo].[hechos_encomiendas]  WITH CHECK ADD FOREIGN KEY([origen_sucursal_id])
REFERENCES [dbo].[dim_sucursales] ([id])
GO
ALTER TABLE [dbo].[hechos_encomiendas]  WITH CHECK ADD FOREIGN KEY([ruta_id])
REFERENCES [dbo].[dim_rutas] ([id])
GO
ALTER TABLE [dbo].[hechos_encomiendas]  WITH CHECK ADD FOREIGN KEY([vehiculo_id])
REFERENCES [dbo].[dim_vehiculos] ([id])
GO
USE [master]
GO
ALTER DATABASE [logistica_DSRP_BI] SET  READ_WRITE 
GO
