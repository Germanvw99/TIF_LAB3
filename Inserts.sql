USE Lab3TIF
GO

-- INSERTS PROVINCIAS
BEGIN
EXEC spAgregarProvincias 'Buenos Aires'
EXEC spAgregarProvincias 'Capital Federal'
EXEC spAgregarProvincias 'Catamarca'
EXEC spAgregarProvincias 'Chaco'
EXEC spAgregarProvincias 'Chubut'
EXEC spAgregarProvincias 'Córdoba'
EXEC spAgregarProvincias 'Corrientes'
EXEC spAgregarProvincias 'Entre Ríos'
EXEC spAgregarProvincias 'Formosa'
EXEC spAgregarProvincias 'Jujuy'
EXEC spAgregarProvincias 'La Pampa'
EXEC spAgregarProvincias 'La Rioja'
EXEC spAgregarProvincias 'Mendoza'
EXEC spAgregarProvincias 'Misiones'
EXEC spAgregarProvincias 'Neuquén'
EXEC spAgregarProvincias 'Río Negro'
EXEC spAgregarProvincias 'Salta'
EXEC spAgregarProvincias 'San Juan'
EXEC spAgregarProvincias 'San Luis'
EXEC spAgregarProvincias 'Santa Cruz'
EXEC spAgregarProvincias 'Santa Fe'
EXEC spAgregarProvincias 'Santiago del Estero'
EXEC spAgregarProvincias 'Tierra del Fuego'
EXEC spAgregarProvincias 'Tucumán'
END

-- INSERTS ESTADOS
BEGIN
EXEC spAgregarEstados 'Baja'
EXEC spAgregarEstados 'Alta'
END

-- INSERTS PERFILES
BEGIN 
EXEC spAgregarPerfiles 'Personal'
EXEC spAgregarPerfiles 'Clientes'
EXEC spAgregarPerfiles 'Proveedores'
END
-- INSERTS MEDIOS DE PAGO
BEGIN
EXEC spAgregarMedios_de_Pago 'Efectivo','Método de pago en efectivo'
EXEC spAgregarMedios_de_Pago 'Débito','Método de pago a través de tarjeta de débito'
EXEC spAgregarMedios_de_Pago 'Crédito','Método de pago a través de tarjeta de crédito'
END