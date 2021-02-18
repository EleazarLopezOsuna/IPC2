-- Primero desabilitar la integridad referencial
 EXEC sp_MSForEachTable 'ALTER TABLE ? NOCHECK CONSTRAINT ALL'
 GO
EXEC sp_MSforeachtable @command1 = "DROP TABLE ?"
-- Ahora volver a habilitar la integridad referencial
 EXEC sp_MSForEachTable 'ALTER TABLE ? CHECK CONSTRAINT ALL'
 GO