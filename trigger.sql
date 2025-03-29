USE [ventas]
GO

/****** Object:  Trigger [dbo].[trg_Update_IDFECHA2]    Script Date: 29/3/2025 10:00:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[trg_Update_IDFECHA2]
ON [dbo].[Ventas]
AFTER INSERT
AS
BEGIN
    UPDATE v
    SET v.idfecha2 = (YEAR(v.fecha) - 2023) * 12 + MONTH(v.fecha)
    FROM Ventas v
    INNER JOIN inserted i ON v.id_venta = i.id_venta;
END;
GO

ALTER TABLE [dbo].[Ventas] ENABLE TRIGGER [trg_Update_IDFECHA2]
GO


