USE master;
GO

DROP DATABASE IF EXISTS TokoBarokahDW;
GO

-- Buat database baru sebagai datawarehouse
CREATE DATABASE TokoBarokahDW;
GO

USE TokoBarokahDW;
GO

-- Buat tabel dimensi barang
CREATE TABLE DimBarang (
	Id INT PRIMARY KEY IDENTITY,
	AltKey VARCHAR (50),
	Nama VARCHAR (50),
	Harga VARCHAR (50),
	Satuan VARCHAR (50),
	Barcode VARCHAR (50),
);
GO

-- Buat tabel dimensi karyawan
CREATE TABLE DimKaryawan (
	Id INT PRIMARY KEY IDENTITY,
	AltKey VARCHAR (50),
	Alamat VARCHAR (50),
	JenisKelamin CHAR (1),
	TanggalLahir DATE
);

-- Buat tabel fakta penjualan
CREATE TABLE FactPenjualan (
	IdBarang INT,
	IdKaryawan INT,
	TotalNilai MONEY,
	Qty INT
	CONSTRAINT FK_FactPenjualan_Barang FOREIGN KEY (IdBarang) REFERENCES dbo.DimBarang(Id),
	CONSTRAINT FK_FactPEnjualan_Karyawan FOREIGN KEY (IdKaryawan) REFERENCES dbo.DimKaryawan(Id),
	PRIMARY KEY (IdBarang, IdKaryawan)
)
GO