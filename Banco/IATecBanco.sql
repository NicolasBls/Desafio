USE [master]
GO
/****** Object:  Database [IATec]    Script Date: 10/08/2019 21:56:40 ******/
CREATE DATABASE [IATec]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'IATec', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\IATec.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'IATec_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\IATec_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [IATec] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IATec].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IATec] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [IATec] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [IATec] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [IATec] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [IATec] SET ARITHABORT OFF 
GO
ALTER DATABASE [IATec] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [IATec] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [IATec] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [IATec] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [IATec] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [IATec] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [IATec] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [IATec] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [IATec] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [IATec] SET  DISABLE_BROKER 
GO
ALTER DATABASE [IATec] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [IATec] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [IATec] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [IATec] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [IATec] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [IATec] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [IATec] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [IATec] SET RECOVERY FULL 
GO
ALTER DATABASE [IATec] SET  MULTI_USER 
GO
ALTER DATABASE [IATec] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [IATec] SET DB_CHAINING OFF 
GO
ALTER DATABASE [IATec] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [IATec] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [IATec] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'IATec', N'ON'
GO
ALTER DATABASE [IATec] SET QUERY_STORE = OFF
GO
USE [IATec]
GO
/****** Object:  Table [dbo].[Endereco]    Script Date: 10/08/2019 21:56:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Endereco](
	[enderecoId] [int] IDENTITY(1,1) NOT NULL,
	[estado] [varchar](50) NOT NULL,
	[cidade] [varchar](50) NOT NULL,
	[bairro] [varchar](50) NOT NULL,
	[endereco] [varchar](50) NOT NULL,
	[numero] [int] NULL,
	[complemento] [varchar](50) NULL,
	[pessoaId] [int] NOT NULL,
	[cep] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Endereco] PRIMARY KEY CLUSTERED 
(
	[enderecoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Numero]    Script Date: 10/08/2019 21:56:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Numero](
	[numeroId] [int] IDENTITY(1,1) NOT NULL,
	[numero] [varchar](50) NOT NULL,
	[pessoaId] [int] NOT NULL,
 CONSTRAINT [PK_Numero] PRIMARY KEY CLUSTERED 
(
	[numeroId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pessoa]    Script Date: 10/08/2019 21:56:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pessoa](
	[pessoaId] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](50) NOT NULL,
	[dataNascimento] [date] NOT NULL,
	[cpf] [varchar](14) NOT NULL,
	[email] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Pessoa] PRIMARY KEY CLUSTERED 
(
	[pessoaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PessoaNumero]    Script Date: 10/08/2019 21:56:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PessoaNumero](
	[PessoaId] [int] NOT NULL,
	[NumeroId] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Endereco]  WITH CHECK ADD  CONSTRAINT [FK_Endereco_Pessoa] FOREIGN KEY([pessoaId])
REFERENCES [dbo].[Pessoa] ([pessoaId])
GO
ALTER TABLE [dbo].[Endereco] CHECK CONSTRAINT [FK_Endereco_Pessoa]
GO
ALTER TABLE [dbo].[Numero]  WITH CHECK ADD  CONSTRAINT [FK_Numero_Pessoa] FOREIGN KEY([pessoaId])
REFERENCES [dbo].[Pessoa] ([pessoaId])
GO
ALTER TABLE [dbo].[Numero] CHECK CONSTRAINT [FK_Numero_Pessoa]
GO
ALTER TABLE [dbo].[PessoaNumero]  WITH CHECK ADD  CONSTRAINT [FK_PessoaNumero_Numero] FOREIGN KEY([NumeroId])
REFERENCES [dbo].[Numero] ([numeroId])
GO
ALTER TABLE [dbo].[PessoaNumero] CHECK CONSTRAINT [FK_PessoaNumero_Numero]
GO
ALTER TABLE [dbo].[PessoaNumero]  WITH CHECK ADD  CONSTRAINT [FK_PessoaNumero_Pessoa] FOREIGN KEY([PessoaId])
REFERENCES [dbo].[Pessoa] ([pessoaId])
GO
ALTER TABLE [dbo].[PessoaNumero] CHECK CONSTRAINT [FK_PessoaNumero_Pessoa]
GO
USE [master]
GO
ALTER DATABASE [IATec] SET  READ_WRITE 
GO
