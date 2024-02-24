local L = AceLibrary("AceLocale-2.2"):new("ArcHUD_Core")

L:RegisterTranslations("esES", function() return {
	-- Core stuff
		CMD_OPTS_FRAME		= "Abre la ventana de opciones",
		CMD_OPTS_DEBUG		= "Establece el nivel de debugging",
		CMD_RESET			= "Reinicializa los ajustes para este personaje a los valores por defecto",
		CMD_RESET_HELP		= "Esta opci\195\179n te permitir\195\161 hacer dos cosas, primero puedes reinicializar tus ajustes a los que hay por defecto. Para hacer esto escribe 'CONFIRM' tras la opci\195\179n para que el accesorio sepa que has le\195\173do esta informaci\195\179n",
		CMD_RESET_CONFIRM	= "Esta opci\195\179n reinicializar\195\161 todas tus opciones a los valores por defecto existentes cuando el accesorio fue instalado",
		TEXT_RESET			= "Por favor, escribe CONFIRM tras este comando para confirmar que realmente quieres reinicializar tus ajustes",
		TEXT_RESET_CONFIRM	= "Todos los ajustes han sido reinicializados a los valores por defecto",

		FONT				= "FRIZQT__.TTF",

		["Version: "]		= "Versi\195\179n: ",
		["Author: "]		= "Autor: ",

	--	Options
		TEXT = {
			TITLE		= "Opciones de ArcHUD",

			DISPLAY		= "Opciones de Visualizaci\195\179n",
			TARGETFRAME	= "Marco de Objetivo",
			PLAYERMODEL	= "Modelo 3D para jugadores",
			MOBMODEL	= "Modelo 3D para no jugadores",
			SHOWGUILD	= "Mostrar la hermandad del jugador",
			SHOWCLASS	= "Mostrar la clase del objetivo",
			SHOWBUFFS 	= "Mostrar buffs/debuffs",		
            SHOWCOMBO	= "Mostrar el texto de puntos de combo",
			SHOWPVP		= "Mostrar el icono de estado JcJ",
			NAMEPLATES	= "Placas identificativas de Jugador/Mascota",
			ATTACHTOP	= "Adjuntar el marco de objetivo arriba",
			HOVERMSG	= "Placa identificativa al poner el cursor encima",
			HOVERDELAY	= "Retraso de aparici\195\179n de la placa identificativa",
			TOT			= "Activar objetivo del objetivo",
			TOTOT		= "Activar objetivo del objetivo del objetivo",
			BLIZZPLAYER = "Marco del jugador de Blizzard visible",
			BLIZZTARGET = "Marco del objetivo de Blizzard visible",
			PETNPFADE	= "Ajustar la transparencia de la placa identificativa de la mascota",

			FADE		= "Opciones de Atenuaci\195\179n",
			FADE_FULL	= "Cuando Lleno",
			FADE_OOC	= "No en combate",
			FADE_IC		= "En combate",

			MISC		= "Opciones varias",
			WIDTH		= "Anchura del HUD",
			YLOC		= "Alineamiento vertical",
			SCALE		= "Escala",

			RINGVIS		= "Comportamiento de Desvanecimiento",
			RINGVIS_1	= "FadeFull: Se desvanece cuando lleno",
			RINGVIS_2	= "FadeOOC: Se desvanece cuando no est\195\161s en combate",
			RINGVIS_3	= "FadeBoth: Se desvanece cuando lleno o no en combate",

			RINGS		= "Opciones de Aro",            -- check "ring"
			RING		= "Aro",
		},
		TOOLTIP = {
			TARGETFRAME = "Determina si se muestra todo el marco de objetivo",
			PLAYERMODEL = "Determina si se muestra el modelo 3D de los jugadores seleccionados",
			MOBMODEL	= "Determina si se muestra el modelo 3D de los personajes no jugadores seleccionados",
			SHOWGUILD	= "Muestra la informaci\195\179n sobre la hermandad del jugador junto a su nombre",
			SHOWCLASS	= "Muestra la clase del objetivo o el tipo de criatura",
			SHOWBUFFS	= "Determina si se muestran los buffs y debuffs",			
            SHOWCOMBO	= "Muestra los puntos de combo en el centro del HUD",
			SHOWPVP		= "Muestra el icono de estado JcJ en la placa identificativa del jugador",
			TOT			= "Activa la visualizaci\195\179n del objetivo del objetivo",
			TOTOT		= "Activa la visualizaci\195\179n del objetivo del objetivo del objetivo",
			NAMEPLATES	= "Determina si se muestran las placas identificativas de jugador y mascota",
			ATTACHTOP	= "Adjunta el marco de objetivo en la parte superior de los aros en vez de en la parte inferior",
			HOVERMSG	= "Determina si se muestran las placas identificativas cuando pasas el rat\195\179n por encima activado en el chat",
			HOVERDELAY	= "Cantidad de segundos necesarios con el cursor encima para que se active la placa identificativa",
			BLIZZPLAYER = "Determina la visibilidad de los marcos de jugador de Blizzard",
			BLIZZTARGET = "Determina la visibilidad del marco de objetivo de Blizzard",
            PETNPFADE	= "Ajusta autom\195\161ticamente la transparencia de la placa identificativa de la mascota bas\195\161ndose en su felicidad",

			FADE_FULL	= "Nivel de transparencia cuando no est\195\161s en combate y el aro est\195\161 a 100%",
			FADE_OOC	= "Nivel de transparencia cuando no est\195\161s en combate o el aro no est\195\161 al 100%",
			FADE_IC		= "Nivel de transparencia cuando cuando en combate (solo se usa si el comportamiento est\195\161 establecido en FadeBoth o FadeOOC)",

			WIDTH		= "Establece cu\195\161n separados deber\195\173an estar los aros del centro",
			YLOC		= "Mueve ArcHUD a lo largo del eje vertical. Los valores positivos lo mover\195\161n arriba, los negativos abajo",
			SCALE		= "Establece el factor de escalado",

			RINGVIS		= "Establece cu\195\161ndo se desvanecen los aros",
			RINGVIS_1	= "Se desvanece cuando los aros est\195\161n llenos, sin importar el estado de combate",
			RINGVIS_2	= "Siempre se desvanece cuando no est\195\161s en combate, sin importar el estado del aro",
			RINGVIS_3	= "Se desvanece cuando no est\195\161s en combate o los aros est\195\161n llenos",
		},
} end)

local LM = AceLibrary("AceLocale-2.2"):new("ArcHUD_Module")



LM:RegisterTranslations("esES", function() return {
		FONT			= "FRIZQT__.TTF",

		["Version: "]	= "Versi\195\179n: ",
		["Author: "]	= "Autor: ",

		["Health"]			= "Salud del Jugador",
		["Mana"]			= "Man\195\161 del Jugador",
		["PetHealth"]		= "Salud de la Mascota",
		["PetMana"]			= "Man\195\161 de la Mascota",
		["TargetCasting"]	= "Conjuraci\195\179n del Objetivo",
		["TargetHealth"]	= "Salud del Objetivo",
		["TargetMana"]		= "Man\195\161 del Objetivo",
		["FocusHealth"]		= "Salud del Enfocado",
		["FocusMana"]		= "Man\195\161 del Enfocado",
		["Casting"]			= "Conjurando",
		["DruidMana"]		= "Man\195\161 de Druida",
		["MirrorTimer"]		= "Temporizador de Espejo",
		["ComboPoints"]		= "Puntos de Combo",
		["EnergyTick"]		= "Tick de Energ\195\173a",

		TEXT = {
			ENABLED		= "Activado",
			OUTLINE		= "Borde del aro",
			SHOWTEXT	= "Mostrar texto",
			SHOWPERC	= "Mostrar porcentaje",
			COLORFADE	= "Transici\195\179n de color",
			FLASH		= "Destello cuando puntos de combo m\195\161ximos",
			SHOWSPELL	= "Mostrar qu\195\169 hechizo est\195\161 siendo lanzado",
			SHOWTIME	= "Mostrar el temporizador del hechizo",
			HIDEBLIZZ	= "Ocultar el marco de Blizzard por defecto",
			ENABLEMENU	= "Activar el menu con Clic-Derecho",
			DEFICIT		= "D\195\169ficit",
			SHOWINCOMBAT= "Mostrar en combate",
			SHOWINSTEALTH="Mostrar en Sigilo",
			ATTACH		= "Adjuntar",
			SIDE		= "Lado",
			LEVEL		= "Nivel",
		},
		TOOLTIP = {
			ENABLED		= "Activa y desactiva el aro",
			OUTLINE		= "Determina si se muestra el borde alrededor del aro",
			SHOWTEXT	= "Determina sise  muestra el texto (salud, man\195\161, etc.)",
			SHOWPERC	= "Determina si se muestra el porcentaje",
			SHOWSPELL	= "Determina si se muestra el hechizo que se est\195\161 lanzando actualmente",
			SHOWTIME	= "Determina si se muestra el temporizador de hechizo",
			COLORFADE	= "Determina si se muestra la transici\195\179n de color (verde a rojo para la salud, etc)",
			FLASH		= "Determina si se muestra un destello cuando se llega a 5 puntos de combo",
			HIDEBLIZZ	= "Determina si se muestra el marco de Blizzard por defecto",
			ENABLEMENU	= "Activa y desactiva el acceso al menu con Clic-Derecho",
			DEFICIT		= "Determina si se muestra el d\195\169ficit de salud (Salud m\195\161xima - salud actual)",
			SHOWINCOMBAT= "Determina si se muestran los ticks en combate",
			SHOWINSTEALTH="Determina si se muestran los ticks cuando est\195\161s oculto",
			SIDE		= "Establece a qu\195\169 lado se adjunta",
			LEVEL		= "Establece en qu\195\169 nivel deber\195\173a ser adjuntado relativo al ancla (<-1: hacia el centro, 0: en el ancla, >1: lejos del centro)",
		},
		SIDE = {
			LEFT		= "Ancla izquierda",
			RIGHT		= "Ancla derecha",
		},

		["You gain Prowl."] = "Ganas Acechar.",   
		["Prowl fades from you."] = "Acechar se desvanece.",   
		["You gain Stealth."] = "Ganas Sigilo.",
		["Stealth fades from you."] = "Sigilo se desvanece.",
} end)
