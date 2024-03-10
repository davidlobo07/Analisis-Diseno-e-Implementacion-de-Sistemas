USE [master]
GO
/****** Object:  Database [EduGestor]    Script Date: 3/9/2024 11:46:27 PM ******/
CREATE DATABASE [EduGestor]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EduGestor', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\EduGestor.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EduGestor_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\EduGestor_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [EduGestor] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EduGestor].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EduGestor] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EduGestor] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EduGestor] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EduGestor] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EduGestor] SET ARITHABORT OFF 
GO
ALTER DATABASE [EduGestor] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EduGestor] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EduGestor] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EduGestor] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EduGestor] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EduGestor] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EduGestor] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EduGestor] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EduGestor] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EduGestor] SET  ENABLE_BROKER 
GO
ALTER DATABASE [EduGestor] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EduGestor] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EduGestor] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EduGestor] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EduGestor] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EduGestor] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EduGestor] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EduGestor] SET RECOVERY FULL 
GO
ALTER DATABASE [EduGestor] SET  MULTI_USER 
GO
ALTER DATABASE [EduGestor] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EduGestor] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EduGestor] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EduGestor] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EduGestor] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EduGestor] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'EduGestor', N'ON'
GO
ALTER DATABASE [EduGestor] SET QUERY_STORE = ON
GO
ALTER DATABASE [EduGestor] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [EduGestor]
GO
/****** Object:  Table [dbo].[Asignaciones]    Script Date: 3/9/2024 11:46:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asignaciones](
	[AsignacionID] [int] IDENTITY(1,1) NOT NULL,
	[CursoID] [int] NOT NULL,
	[UsuarioID] [int] NOT NULL,
	[Descripcion] [varchar](255) NULL,
	[FechaEntrega] [date] NOT NULL,
	[NombreAsignacion] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[AsignacionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cursos]    Script Date: 3/9/2024 11:46:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cursos](
	[CursoID] [int] IDENTITY(1,1) NOT NULL,
	[NombreCurso] [varchar](100) NOT NULL,
	[Descripcion] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[CursoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EstudiantesGrupos]    Script Date: 3/9/2024 11:46:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EstudiantesGrupos](
	[EstudianteID] [int] NOT NULL,
	[GrupoID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EstudianteID] ASC,
	[GrupoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grupos]    Script Date: 3/9/2024 11:46:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grupos](
	[GrupoID] [int] IDENTITY(1,1) NOT NULL,
	[NombreGrupo] [varchar](100) NOT NULL,
	[CursoID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GrupoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PerfilUsuario]    Script Date: 3/9/2024 11:46:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PerfilUsuario](
	[PerfilUsuarioID] [int] IDENTITY(1,1) NOT NULL,
	[UsuarioID] [int] NULL,
	[Departamento] [nvarchar](100) NULL,
	[AnoMatricula] [int] NULL,
	[Carrera] [nvarchar](100) NULL,
	[FechaIngreso] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[PerfilUsuarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProfesoresCursos]    Script Date: 3/9/2024 11:46:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProfesoresCursos](
	[ProfesorCursoID] [int] IDENTITY(1,1) NOT NULL,
	[UsuarioID] [int] NOT NULL,
	[CursoID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProfesorCursoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 3/9/2024 11:46:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RolID] [int] IDENTITY(1,1) NOT NULL,
	[RolNombre] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RolID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 3/9/2024 11:46:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[UsuarioID] [int] IDENTITY(1,1) NOT NULL,
	[Correo] [nvarchar](30) NOT NULL,
	[Contrasena] [nvarchar](20) NOT NULL,
	[PrimerNombre] [nvarchar](50) NULL,
	[Apellido] [nvarchar](50) NULL,
	[RolID] [int] NULL,
 CONSTRAINT [PK__Usuarios__2B3DE798C6131F8F] PRIMARY KEY CLUSTERED 
(
	[UsuarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Asignaciones] ON 
GO
INSERT [dbo].[Asignaciones] ([AsignacionID], [CursoID], [UsuarioID], [Descripcion], [FechaEntrega], [NombreAsignacion]) VALUES (1, 1, 4, N'Usar html para hace un forms', CAST(N'2024-03-01' AS Date), N'INTRO AL HTML')
GO
INSERT [dbo].[Asignaciones] ([AsignacionID], [CursoID], [UsuarioID], [Descripcion], [FechaEntrega], [NombreAsignacion]) VALUES (2, 2, 13, N'Hacer un join', CAST(N'2024-03-02' AS Date), N'USO DE JOINS')
GO
INSERT [dbo].[Asignaciones] ([AsignacionID], [CursoID], [UsuarioID], [Descripcion], [FechaEntrega], [NombreAsignacion]) VALUES (3, 1, 4, N'Investigacion sobre Javascript', CAST(N'2024-03-04' AS Date), N'INVESTIGACION 1')
GO
INSERT [dbo].[Asignaciones] ([AsignacionID], [CursoID], [UsuarioID], [Descripcion], [FechaEntrega], [NombreAsignacion]) VALUES (4, 2, 13, N'Hacer una base de datos para un almacen de armas', CAST(N'2024-04-03' AS Date), N'BD PARA BODEGA')
GO
INSERT [dbo].[Asignaciones] ([AsignacionID], [CursoID], [UsuarioID], [Descripcion], [FechaEntrega], [NombreAsignacion]) VALUES (5, 2, 4, N'Usar bootstrap en su proyecto', CAST(N'2024-04-04' AS Date), N'INTRO A BOOTSTRAP')
GO
SET IDENTITY_INSERT [dbo].[Asignaciones] OFF
GO
SET IDENTITY_INSERT [dbo].[Cursos] ON 
GO
INSERT [dbo].[Cursos] ([CursoID], [NombreCurso], [Descripcion]) VALUES (1, N'Desarrollo de Aplicaciones Web', N'Curso Para desarrollar paginas web.')
GO
INSERT [dbo].[Cursos] ([CursoID], [NombreCurso], [Descripcion]) VALUES (2, N'Base de Datos', NULL)
GO
SET IDENTITY_INSERT [dbo].[Cursos] OFF
GO
SET IDENTITY_INSERT [dbo].[ProfesoresCursos] ON 
GO
INSERT [dbo].[ProfesoresCursos] ([ProfesorCursoID], [UsuarioID], [CursoID]) VALUES (1, 12, 1)
GO
INSERT [dbo].[ProfesoresCursos] ([ProfesorCursoID], [UsuarioID], [CursoID]) VALUES (2, 17, 2)
GO
SET IDENTITY_INSERT [dbo].[ProfesoresCursos] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 
GO
INSERT [dbo].[Roles] ([RolID], [RolNombre]) VALUES (1, N'Estudiante')
GO
INSERT [dbo].[Roles] ([RolID], [RolNombre]) VALUES (2, N'Profesor')
GO
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 
GO
INSERT [dbo].[Usuarios] ([UsuarioID], [Correo], [Contrasena], [PrimerNombre], [Apellido], [RolID]) VALUES (4, N'drodriguez@ulacit.es', N'12345678', N'Daniel', N'Rodriguez', 1)
GO
INSERT [dbo].[Usuarios] ([UsuarioID], [Correo], [Contrasena], [PrimerNombre], [Apellido], [RolID]) VALUES (12, N'mvega@ulacit.pr', N'87654321', N'Mariana', N'Vega', 2)
GO
INSERT [dbo].[Usuarios] ([UsuarioID], [Correo], [Contrasena], [PrimerNombre], [Apellido], [RolID]) VALUES (13, N'fobando@ulacit.es', N'12345678', N'Fernando', N'Obando', 1)
GO
INSERT [dbo].[Usuarios] ([UsuarioID], [Correo], [Contrasena], [PrimerNombre], [Apellido], [RolID]) VALUES (14, N'tmurillo@ulacit.es', N'12345678', N'Tomas', N'Murillo', 1)
GO
INSERT [dbo].[Usuarios] ([UsuarioID], [Correo], [Contrasena], [PrimerNombre], [Apellido], [RolID]) VALUES (15, N'mrodriguez@ulacit.es', N'12345678', N'Marvin', N'Rodriguez', 1)
GO
INSERT [dbo].[Usuarios] ([UsuarioID], [Correo], [Contrasena], [PrimerNombre], [Apellido], [RolID]) VALUES (17, N'mfernandez@ulacit.pr', N'12345678', N'Mario', N'Fernandez', 2)
GO
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
/****** Object:  Index [UQ__PerfilUs__2B3DE799D866D2A8]    Script Date: 3/9/2024 11:46:28 PM ******/
ALTER TABLE [dbo].[PerfilUsuario] ADD UNIQUE NONCLUSTERED 
(
	[UsuarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Usuarios__60695A191980CEFE]    Script Date: 3/9/2024 11:46:28 PM ******/
ALTER TABLE [dbo].[Usuarios] ADD  CONSTRAINT [UQ__Usuarios__60695A191980CEFE] UNIQUE NONCLUSTERED 
(
	[Correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Asignaciones]  WITH CHECK ADD FOREIGN KEY([CursoID])
REFERENCES [dbo].[Cursos] ([CursoID])
GO
ALTER TABLE [dbo].[Asignaciones]  WITH CHECK ADD FOREIGN KEY([UsuarioID])
REFERENCES [dbo].[Usuarios] ([UsuarioID])
GO
ALTER TABLE [dbo].[EstudiantesGrupos]  WITH CHECK ADD FOREIGN KEY([EstudianteID])
REFERENCES [dbo].[Usuarios] ([UsuarioID])
GO
ALTER TABLE [dbo].[EstudiantesGrupos]  WITH CHECK ADD FOREIGN KEY([GrupoID])
REFERENCES [dbo].[Grupos] ([GrupoID])
GO
ALTER TABLE [dbo].[Grupos]  WITH CHECK ADD FOREIGN KEY([CursoID])
REFERENCES [dbo].[Cursos] ([CursoID])
GO
ALTER TABLE [dbo].[PerfilUsuario]  WITH CHECK ADD  CONSTRAINT [FK__PerfilUsu__Usuar__3E52440B] FOREIGN KEY([UsuarioID])
REFERENCES [dbo].[Usuarios] ([UsuarioID])
GO
ALTER TABLE [dbo].[PerfilUsuario] CHECK CONSTRAINT [FK__PerfilUsu__Usuar__3E52440B]
GO
ALTER TABLE [dbo].[ProfesoresCursos]  WITH CHECK ADD  CONSTRAINT [fk_curso] FOREIGN KEY([CursoID])
REFERENCES [dbo].[Cursos] ([CursoID])
GO
ALTER TABLE [dbo].[ProfesoresCursos] CHECK CONSTRAINT [fk_curso]
GO
ALTER TABLE [dbo].[ProfesoresCursos]  WITH CHECK ADD  CONSTRAINT [fk_usuario] FOREIGN KEY([UsuarioID])
REFERENCES [dbo].[Usuarios] ([UsuarioID])
GO
ALTER TABLE [dbo].[ProfesoresCursos] CHECK CONSTRAINT [fk_usuario]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK__Usuarios__RolID__3A81B327] FOREIGN KEY([RolID])
REFERENCES [dbo].[Roles] ([RolID])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK__Usuarios__RolID__3A81B327]
GO
USE [master]
GO
ALTER DATABASE [EduGestor] SET  READ_WRITE 
GO
