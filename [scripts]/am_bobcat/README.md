<!----<+>-- --<+>--  --<+>--  --<+>-- --<+>-- --<+>--  --<+>--  --<+>-- --<+>-- --<+>--  --<+>--  --<+>-- 

    --<+>-- --<+>--  --<+>--  --<+>-- ☾ AMERICAN SCRIPT ☾ --<+>-- --<+>--  --<+>--  --<+>-- 

--<+>-- --<+>--  --<+>--  --<+>-- --<+>-- --<+>--  --<+>--  --<+>-- --<+>-- --<+>--  --<+>--  --<+>-- -->

### Comments

American script presenta un Guión Eco de la forma más única y divertida, es decir, una inmersión en el Juego de Rol.

### Install AM_BOBCAT

1) Arrastrar y soltar `AM_BOBCAT` Recuerda dejarlo siempre dentro de la CARPETA /Resources 
2) Vaya a su servidor CFG y copie esto desde aquí : `start am_bobcat`  y proceda a pegarlo dentro de su CFG
3) (IMPORTANT) Ingresar a la carpeta `qb-doorlock/config.lua`, desde ahi ingresar en su ultima linea estas nuevas CERRADURAS para el Mapeo de BOBCAT.
#CERRADURAS A AÑADIR :

----------------------------           PUERTAS BOBCAT ( ROBO NUEVO )          ----------------------------

	{
		textCoords = vector3(881.6171, -2264.669, 32.59156),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 1,
		doors = {
			{
				objName = -551608542,
				objYaw = 174.87878417969,
				objCoords = vector3(881.6171, -2264.669, 32.59156),
			}
		}
	},
	
    ---------------     PUERTA CHICA HACK ( LUGAR ESCONDIDO ) 
	
	{
		textCoords = vector3(882.3368, -2295.273, 32.59156),
		authorizedJobs = { 'police' },
		locking = false,
		locked = true,
		pickable = false,
		distance = 1,
		doors = {
			{
				objName = -311575617,
				objYaw = 354.86846923828,
				objCoords = vector3(882.3368, -2295.273, 32.59156),
			}
		}
	},
	
--------------------------------------------------------

4) Carpeta `am_hackgame` y `memorygame`, dejar dentro de tus /Resources  igualmente y Colocar START en tuS CFG Para ambos scripts.

5) Instalacion LISTA Reinicia tu servidor y pruébalo.

(Script con ARCHIVOS Codificados, si deseas la Version completa contactanos en nuestro Discord.)

### SUPPORT

https://discord.gg/VZK3zHScD8
