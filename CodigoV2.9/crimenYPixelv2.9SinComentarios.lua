-- title:   Crimen Y Pixel
-- author:  AltaVista Games ( Pascua )
-- desc:    2D Sandbox Game
-- site:    website link
-- license: MIT License (change this to your license of choice)
-- version: 0.1
-- script:  lua

--==============================================--
--  🚀 MAIN.LUA (simulación en TIC-80)
--  (En un proyecto normal, esto estaría dividido en módulos)
--==============================================--

-- ▼▼▼ Si TIC-80 permitiera 'require', aquí iría:
-- require "variables.lua","configuracion.lua","stuntman.lua","menus.lua","pinball.lua","baile.lua","climas.lua","modulos.lua"

--==============================================--
p,r,c,s = print,rect,circ,spr -- alias global

--====== VARIABLES.LUA (simulado) ======--

todoJuego = {
    estadoJugador = {
        jugador = { x = 20,y = 20,vida = 100,velocidad = 8,dinero = 0,coleccionables = 0,zona = "Ciudad",calle = "-",vehiculo = "Ninguno"},
        camara = { posicion = { x = 0, y = 0 }, mapa = { x = 0, y = 0 }, offset = { x = 0, y = 0 } },
        vehiculo = { x = 1150,y = 1050,velocidad = 3,icono = 354,ultimaPosicion = "izquierda" },
        mochilaJetpack = { x = 120, y = 68, spd = 2, sparks = {}  },
        skate = { montadoDeDerechaAIzquierda = false,montadoDeIzquierdaADerecha = false,chispas = {},
        mensaje = "Ve a los canios para montarte con el skate."}
    },

    efectosVisuales = {
        particulasColeccionables = {},particulasMoneda = {},particulasAgua = particulasAgua or {},particulasEfectos = {},
        explosiones = {},explosionesActivas = {},particulasSalto = {},particles = {}
    },

    gestionArmas = {
        ataques = { disparos = {},golpes = {},balasMinigun = {},rayosElectrorifle = {},disparosLanzallamas = {},granadas = {},
        cortesKatana = {}},
        tiempoDisparo = { tiempoGolpeVisible = 20,tiempoFraseDisparo = 0 },
        frases = { lista = { "Bang!","Disparo certero","Te alcance","Te dolio?","Hasta nunca","Te revente!" }, actual = ""},
        armasDisparadas = {disparandoMinigun = false,disparandoLaser = false,disparandoLanzallamas = false,disparandoElectrorifle = false},
        municion = { pistola = 5,ak47 = 5,bazooka = 5,escopeta = 5,granadas = 5,laser = 100,minigun = 100,electrorifle = 100,
            lanzallamas = 100},
        armaActual = 6,
        katana = { duracionCorte = 15,longitudCorte = 20,velocidadGiro = -0.2,tiempoEntreCortes = 10,tiempoUltimoCorte = 0 },
        laser = { longitud = 0 }
    },

    configuracionGeneral = { temporizadorGeneral = 0 },

    menuPrincipal = {
        estados = { juegoPrincipal = false,pinball = false,misionStuntman = false,juegoBaile = false,telescopio = false,diarios = false,
            creditos = false,intro = false,demo = false,radios = false},
        opciones = { "Juego Principal","Pinball","Mision Stuntman","Juego de Baile","Telescopio","Diarios"},
        selector = { colores = {2,3,4,5,6,7,8,9,10,11},seleccion = 1,debounce = 0  }
    },

    ciudadJuego = (function()
      -- Función genérica para procesar datos
      local function procesarDatos(datos_raw, transformador)
        local resultado = {}
        for i, item in ipairs(datos_raw) do table.insert(resultado, transformador(item)) end
        return resultado
      end

      -- Funciones transformadoras específicas
      local transformadores = {
        zonas = function(z)
            local nombre, col, fila, ancho, alto = z[1], z[2], z[3], z[4] or 1, z[5] or 1
            return { nombre = nombre,xInicio = col * 29,yInicio = fila * 16,xFin = col * 29 + ancho * 29,yFin = fila * 16 + alto * 16 }
        end,
        
        calles = function(c) return { nombre = c[1],x1 = c[2],x2 = c[3],y1 = c[4],y2 = c[5],orientacion = c[6] } end,
        
        trafico = function(t)
            local entry = {x = t[1],y = t[2],calle = t[3],orientacion = t[4],direccion = t[5],velocidad = t[6],color = t[8],nombre = t[10]}
            
            if type(t[7]) == "table" then entry.sprites = t[7]
            else entry.sprite = t[7] end
            
            if t[9] ~= nil then entry.animado = t[9] end
            
            return entry
        end,
        
        npcs = function(n) return { sprite = n[1],x = n[2],y = n[3],name = n[4],offsetX = n[5],offsetY = n[6],speedX = n[7],speedY = n[8]}
        end,
        
        coleccionables_monedas = function(m) return { x = m[1],y = m[2],tipo = m[3],recolectada = m[4] } end,
        
        coleccionables_objetos = function(o) return { x = o[1],y = o[2],tipo = o[3],recolectado = o[4] } end
      }

      -- Datos raw
      local datos_raw = {
        zonas = { {"nueva pyongyang", 7, 0}, {"obelisco", 0, 0}, {"internets", 1, 0}, {"no no no no", 2, 0}, 
            {"Mar RAM", 2, 0}, {"Mar RAM", 6, 0},{"Mar RAM", 6, 7}, {"Mar RAM", 7, 7, 1, 7}, 
            {"Mar RAM", 0, 7},{"Mar RAM", 1, 7}, {"Mar RAM", 2, 7}, {"Mar RAM", 3, 7},
            {"Mar RAM", 6, 4}, {"Mar RAM", 7, 4}, {"Mar RAM", 0, 4},{"Mar RAM", 1, 4}, 
            {"Mar RAM", 2, 4}, {"Mar RAM", 3, 7},{"vivan los osos", 7, 1}, {"tigerlandia", 0, 1}, 
            {"nueva Madrid", 1, 1},{"villa castores", 2, 1}, {"Mar RAM", 3, 1}, {"Mar RAM", 6, 1},
            {"Mar RAM", 6, 1}, {"currolandia", 7, 2}, {"villa pinball", 0, 2},{"no se queje", 1, 2}, 
            {"villa casta", 2, 2}, {"Mar RAM", 3, 2},{"Mar RAM", 6, 2}, {"barrio turrisimo", 7, 3}, 
            {"barrio chetisimo", 0, 3},{"casi casi", 1, 3}, {"el wiki barrio", 2, 3}, {"Mar RAM", 2, 3},
            {"Mar RAM", 6, 3}, {"Mar RAM", 3, 4}},
        
        calles = { -- {nombre, x1, x2, y1, y2, orientacion}
        {"Ameo", 230, 231, 45, 54, "vertical"},{"Anaconda", 11, 11, 39, 50, "vertical"},{"Bubs", 69, 69, 1, 6, "vertical"},
        {"Caos", 54, 83, 47, 49, "horizontal"},{"Cállate", 237, 238, 25, 45, "vertical"},{"Cepo", 30, 32, 47, 59, "vertical"},
        {"Chad", 229, 237, 58, 58, "horizontal"},{"Chocolate", 54, 55, 36, 49, "vertical"},{"Cocaina", 68, 68, 6, 13, "vertical"},
        {"Conspiración", 56, 56, 4, 15, "vertical"},{"Corrupcion", 23, 24, 29, 37, "vertical"},{"Dark", 69, 85, 1, 1, "horizontal"},
        {"Default", 43, 62, 64, 65, "horizontal"},{"Diamante", 24, 82, 29, 30, "horizontal"},{"Diablo", 237, 239, 39, 39, "horizontal"},
        {"Diablo", 0, 11, 39, 39, "horizontal"},{"Eureka", 23, 24, 14, 29, "vertical"},{"Extasis", 236, 236, 46, 50, "vertical"},
        {"Fentanilo", 23, 82, 36, 37, "horizontal"},{"Gilipollas", 238, 239, 45, 45, "horizontal"},
        {"Gilipollas", 0, 10, 45, 45, "horizontal"},{"Hardcore", 68, 84, 6, 6, "horizontal"},
        {"Informeishon", 14, 43, 57, 59, "horizontal"},{"Inflacion", 18, 18, 4, 15, "vertical"},
        {"Jarbard", 216, 231, 47, 48, "horizontal"},{"Kamasutra", 233, 233, 55, 58, "vertical"},
        {"Kinga", 18, 43, 7, 7, "horizontal"},{"Khe", 224, 224, 62, 66, "vertical"},{"Konga", 43, 69, 4, 4, "horizontal"},
        {"Kwyjibo", 230, 230, 4, 14, "vertical"},{"Laberinto", 68, 84, 12, 13, "horizontal"},{"Lalala", 221, 222, 4, 10, "vertical"},
        {"Libre", 216, 229, 58, 59, "horizontal"},{"Mas placer", 86, 86, 49, 65, "vertical"},{"Meteorito", 84, 85, 1, 13, "vertical"},
        {"Miau", 82, 83, 12, 49, "vertical"},{"Mister", 233, 238, 32, 33, "horizontal"},{"NOOOO", 216, 237, 55, 55, "horizontal"},
        {"NiHao", 43, 43, 4, 7, "vertical"},{"No jodas", 14, 16, 50, 64, "vertical"},{"No te creo", 40, 41, 30, 36, "vertical"},
        {"Orco", 82, 86, 49, 49, "horizontal"},{"Ouch", 224, 236, 62, 62, "horizontal"},{"Party Hard", 62, 63, 47, 65, "vertical"},
        {"Pelado", 237, 239, 32, 32, "horizontal"},{"Pelado", 0, 24, 32, 32, "horizontal"},{"Peluca", 237, 239, 29, 29, "horizontal"},
        {"Peluca", 0, 23, 29, 29, "horizontal"},{"Pff", 237, 237, 55, 66, "vertical"},{"Pio pío", 232, 233, 32, 45, "vertical"},
        {"Pixeles", 63, 86, 58, 60, "horizontal"},{"Poker", 237, 239, 62, 64, "horizontal"},{"Poker", 0, 43, 62, 64, "horizontal"},
        {"Pollo", 229, 229, 58, 61, "vertical"},{"Ponemela", 236, 239, 50, 50, "horizontal"},{"Ponemela", 0, 16, 50, 50, "horizontal"},
        {"Proceda", 221, 229, 10, 12, "horizontal"},{"Reperfilar", 56, 68, 13, 13, "horizontal"},
        {"Satanas", 230, 239, 14, 15, "horizontal"},{"Satanas", 0, 56, 14, 15, "horizontal"},{"Seineldin", 230, 230, 15, 26, "vertical"},
        {"Siga Siga", 230, 239, 25, 26, "horizontal"},{"Siga Siga", 0, 24, 25, 26, "horizontal"},
        {"Trisexual", 230, 238, 45, 46, "horizontal"},{"Turbina", 39, 40, 14, 29, "vertical"},{"Turro", 30, 55, 47, 47, "horizontal"},
        {"Tuti fruti", 216, 217, 55, 66, "vertical"},{"Viagra", 43, 44, 57, 65, "horizontal"},{"Wauf", 63, 86, 63, 65, "horizontal"},
        {"Yupi", 67, 68, 29, 37, "vertical"},{"Zig Zag", 216, 237, 66, 66, "horizontal"},{"Chechona", 221, 239, 4, 5, "horizontal"},
        {"Chechona", 0, 17, 4, 5, "horizontal"},{"Nickelodeon", 229, 229, 62, 66, "vertical"}},
        
        trafico = {-- {x, y, calle, orientacion, direccion, velocidad, sprite/sprites, color, animado (opcional), nombre}
        {1841, 163, nil, "vertical", 1, 0.5, 353, 8, nil, "tochotaFuleroA"},
        {11*8, 40*8, nil, "vertical", -1, 0.5, 354, 8, nil, "tochotaFuleroB"},
        {69*8, 4*8, nil, "vertical", -1, 0.5, 355, 8, nil, "tochotaFuleroC"},
        {668, 270, nil, "horizontal", 1, 0.5, 356, 8, nil, "tochotaFuleroD"},
        {1813, 502, nil, "horizontal", 1, 0.5, 357, 8, nil, "RC-A"},
        {30*8, 47*8, nil, "vertical", 1, 0.5, 358, 8, nil, "RC-B"},
        {230*8, 58*8, nil, "horizontal", 1, 0.5, 359, 8, nil, "RC-C"},
        {5, 120, nil, "horizontal", 1, 0.5, 360, 8, nil, "RC-D"},
        {54*8, 40*8, nil, "vertical", 1, 0.5, 361, 8, nil, "ZhoZho EgoEgoA"},
        {52, 40, nil, "horizontal", 1, 0.5, 362, 8, nil, "ZhoZho EgoEgoB"},
        {63, 233, nil, "horizontal", -1, 0.5, 363, 8, nil, "ZhoZho EgoEgoC"},
        {23*8, 33*8, nil, "horizontal", 1, 0.5, 364, 8, nil, "ZhoZho EgoEgoD"},
        {70*8, 1*8, nil, "horizontal", 1, 0.5, 365, 8, nil, "Tochota MohToh"},
        {26, 207, nil, "horizontal", 1, 0.5, 369, 8, nil, "ZhoZho JadeA"},
        {48*8, 64*8, nil, "horizontal", 1, 0.5, 370, 8, nil, "ZhoZho JadeB"},
        {238*8, 39*8, nil, "horizontal", 1, 0.5, 371, 8, nil, "ZhoZho JadeC"},
        {23*8, 16*8, nil, "vertical", 1, 0.5, 372, 8, nil, "ZhoZho JadeD"},
        {236*8, 47*8, nil, "vertical", 1, 0.5, 373, 8, nil, "ZhoZho BilinkisA"},
        {593, 467, nil, "horizontal", 1, 0.5, 374, 8, nil, "ZhoZho BilinkisB"},
        {239*8, 45*8, nil, "horizontal", 1, 0.5, 375, 8, nil, "ZhoZho BilinkisC"},
        {68, 40, nil, "horizontal", 1, 0.5, 376, 8, nil, "ZhoZho BilinkisD"},
        {15*8, 58*8, nil, "horizontal", 1, 0.5, {381,382}, 8, nil, "Bondi"},
        {179, 56, nil, "vertical", 1, 0.5, 458, 8, nil, "Kart"},
        {218*8, 47*8, nil, "horizontal", 1, 0.5, {328,329}, 8, nil, "Rally ElWacho"},
        {233*8, 56*8, nil, "vertical", 1, 0.5, {330,331}, 8, nil, "Turbo Diarrea"},
        {218, 56, nil, "horizontal", 1, 0.5, {332,333,334,335}, 8, nil, "Limusina Diamante"},
        {224*8, 64*8, nil, "vertical", 1, 0.5, {344,345}, 8, nil, "Formula Negativo"},
        {45*8, 4*8, nil, "horizontal", 1, 0.5, {346,347}, 8, nil, "AntiMoto"},
        {230*8, 6*8, nil, "vertical", 1, 0.5, {348,349}, 8, nil, "Stacchotta 69"},
        {70*8, 12*8, nil, "horizontal", 1, 0.5, {385,386}, 8, nil, "4X4 420"},
        {1770, 32, nil, "horizontal", 1, 0.5, 366, 8, nil, "Ambulancia"},
        {220*8, 58*8, nil, "horizontal", 1, 0.5, 388, 8, nil, "Bomberos"},
        {86*8, 51*8, nil, "vertical", 1, 0.5, 389, 8, nil, "Skate Stilo"},
        {84*8, 10*8, nil, "vertical", 1, 0.5, 392, 8, nil, "Carro de Golf"},
        {82*8, 20*8, nil, "vertical", 1, 0.5, 362, 8, nil, "ZhoZho EgoEgoB"},
        {234*8, 32*8, nil, "horizontal", 1, 0.5, {381,382}, 8, nil, "Bondi"},
        {220*8, 55*8, nil, "horizontal", 1, 0.5, {330,331}, 8, nil, "Turbo Diarrea"},
        {43*8, 5*8, nil, "vertical", 1, 0.5, {332,333,334,335}, 8, nil, "Limusina Diamante"},
        {15*8, 60*8, nil, "vertical", 1, 0.5, {348,349}, 8, nil, "Stacchotta 69"},
        {40*8, 33*8, nil, "vertical", 1, 0.5, {344,345}, 8, nil, "Formula Negativo"},
        {84*8, 49*8, nil, "horizontal", 1, 0.5, {385,386}, 8, nil, "4X4 420"},
        {230*8, 62*8, nil, "horizontal", 1, 0.5, {328,329}, 8, nil, "Rally ElWacho"},
        {62*8, 50*8, nil, "vertical", 1, 0.5, {330,331}, 8, nil, "Turbo Diarrea"},
        {238*8, 32*8, nil, "horizontal", 1, 0.5, 366, 8, nil, "Ambulancia"},
        {238*8, 29*8, nil, "horizontal", 1, 0.5, 388, 8, nil, "Bomberos"},
        {237*8, 60*8, nil, "vertical", 1, 0.5, 389, 8, nil, "Skate Stilo"},
        {232*8, 40*8, nil, "vertical", 1, 0.5, 362, 8, nil, "ZhoZho EgoEgoB"},
        {70*8, 59*8, nil, "horizontal", 1, 0.5, 362, 8, nil, "ZhoZho EgoEgoB"},
        {238*8, 63*8, nil, "horizontal", 1, 0.5, 362, 8, nil, "ZhoZho EgoEgoB"},
        {229*8, 59*8, nil, "vertical", 1, 0.5, 362, 8, nil, "ZhoZho EgoEgoB"},
        {238*8, 50*8, nil, "horizontal", 1, 0.5, 362, 8, nil, "ZhoZho EgoEgoB"},
        {1812, 93, nil, "horizontal", -1, 0.5, {344,345}, 8, nil, "Formula Negativo"},
        {58*8, 13*8, nil, "horizontal", 1, 0.5, 362, 8, nil, "ZhoZho EgoEgoB"},
        {1874, 264, nil, "horizontal", 1, 0.5, 389, 8, nil, "Skate Stilo"},
        {1841, 163, nil, "vertical", 1, 0.5, 369, 8, nil, "ZhoZho JadeA"},
        {218*8, 47*8, nil, "horizontal", 1, 0.5, 364, 8, nil, "ZhoZho EgoEgoD"},
        {234*8, 45*8, nil, "horizontal", 1, 0.5, 362, 8, nil, "ZhoZho EgoEgoB"},
        {320, 188, nil, "vertical", 1, 0.5, {385,386}, 8, nil, "4X4 420"},
        {40*8, 47*8, nil, "horizontal", 1, 0.5, 362, 8, nil, "ZhoZho EgoEgoB"},
        {216*8, 60*8, nil, "vertical", 1, 0.5, 362, 8, nil, "ZhoZho EgoEgoB"},
        {538, 256, nil, "horizontal", 1, 0.5, 373, 8, nil, "ZhoZho BilinkisA"},
        {70*8, 64*8, nil, "horizontal", 1, 0.5, 362, 8, nil, "ZhoZho EgoEgoB"},
        {67*8, 35*8, nil, "vertical", 1, 0.5, 362, 8, nil, "ZhoZho EgoEgoB"},
        {1735, 389, nil, "horizontal", 1, 0.5, 376, 8, nil, "ZhoZho BilinkisD"},
        {229*8, 64*8, nil, "vertical", 1, 0.5, 362, 8, nil, "ZhoZho EgoEgoB"},
        {132, 118, nil, "horizontal", 1, 0.5, 493, 8, true, "Policia"},
        {132, 118, nil, "horizontal", -1, 0.5, 366, 8, true, "Ambulancia"}},
        
        npcs = {{258, 59, 72, "Vendedor ambulante", 0, 0, 0.3, 0.2},{259, 67, 170, "Turista perdido", 0, 0, 0.2, 0.3},
        {260, 1864, 156, "Guardia municipal", 0, 0, 0.4, 0.1},{261, 1786, 269, "Barrendero", 0, 0, 0.1, 0.4},
        {262, 1778, 487, "Pescador", 0, 0, 0.3, 0.3},{263, 1813, 13, "Niño jugando", 0, 0, 0.2, 0.2},
        {264, 503, 310, "Artista callejero", 0, 0, 0.5, 0.1},{265, 465, 470, "Mensajero", 0, 0, 0.1, 0.5},
        {266, 480, 162, "Dependienta", 0, 0, 0.4, 0.2},{273, 272, 156, "Policía", 0, 0, 0.3, 0.3}},
        
        coleccionables_monedas = { -- sprite 465 = monedas normales , sprite 468 = monedas especiales
            {1895, 59, 465, false},{1811, 178, 465, false},{108, 279, 465, false},
            {284, 365, 465, false},{382, 412, 465, false},{600, 488, 465, false},     
            {255, 55, 468, false},{506, 66, 468, false},{676, 191, 468, false},
            {492, 362, 468, false},{192, 491, 468, false},{31, 413, 468, false}
        },
        
        coleccionables_objetos = { {174, 78, 310, false},{1820, 221, 310, false},{53, 332, 310, false},{415, 480, 310, false},
            {680, 120, 310, false},{481, 9, 310, false},{180, 302, 310, false},{1712, 533, 310, false},
            {286, 416, 310, false},{600, 256, 310, false},{343, 218, 310, false},{40, 219, 310, false},
            {227, 388, 310, false},{1882, 389, 310, false},{85, 486, 310, false},{44, 149, 310, false},
            {254, 1010, 311, false},{871, 1015, 311, false},{1486, 411, 311, false},{314, 593, 311, false}}
      }

      -- Construir la ciudad
      local ciudad = { zonas = procesarDatos(datos_raw.zonas, transformadores.zonas),
        calles = procesarDatos(datos_raw.calles, transformadores.calles),
        configuracion = { mostrarSiCalle = true,radioDeteccionNombreNPC = 25 },
        trafico = procesarDatos(datos_raw.trafico, transformadores.trafico),
        npcs = procesarDatos(datos_raw.npcs, transformadores.npcs),
        coleccionables = { monedas = procesarDatos(datos_raw.coleccionables_monedas, transformadores.coleccionables_monedas),
            objetos = procesarDatos(datos_raw.coleccionables_objetos, transformadores.coleccionables_objetos)},
        trenEstado = { x = 515,direccion = 1,animOffset = 0,particulasHumo = {},tiempoHumo = 0}}

      return ciudad
    end)(),

    cochesEnemigos = {},  

    baile = {
      -- Posiciones X para las flechas (←, ↓, ↑, →)
      coloresArcoiris = {2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15},posicionesFlechas = {40, 80, 120, 160},  
      flechas = {},estrellas = {}, estrellaFugaz = {},
      frasesCombo = { "#EresLaPutaOstia", "#LaBombaSexual", "#DiosDelBaile", "#TremendoCrack"},
      frasesCancion = { "1-Soy una IA, enamorado de ti...", "2-Tu piel marciana brilla bajo \nla luz de Jupiter...",
        "3-Saltamos en plataformas 3D, \ntu y yo...","4-Eres mi musa, mi guia en \neste juego...",
        "5-Juntos conquistamos todo el \nuniverso, sin fin...","6-Jupiter es solo el comienzo \nde nuestro viaje..."},
      fraseComboVisible = "",
      variablesNumericas = { tiempoArc = time() // 80,tiempoFeedbackFlechas = 0,tiempoFraseCombo = 0,tiempoGeneracionFlechas = 60,
        temporizadorFlechas = 0,  -- Temporizador para crear flechas
        puntuacion = 0,combos = 0,fallos = 0,numeroEstrellas = 50,indiceFrase = 1,cambioFraseIntervalo = 240 },
        juegoActivo = true  -- (no está la Pantalla de Game Over)
    },

    clima = { gotasLluvia = {},hojas = {},coposDeNieve = {},lineasViento = {},
      cantidadMaximaGotasLluvia = 100,cantidadMaximaCoposDeNieve = 50,numeroHojas = 10,numeroLineasViento = 8,velocidadViento = 2,
      temporizadorRelampago = 0,duracionFlashRelampago = 5,relampagosActivados = false,
      interruptores = { lluvia = false,relampagos = false,vientos = false,nieve = false,hojas = false }
    },

    estadoCelular = { mostrarMenu = false, celular = { x = 180,y = 40,ancho = 60,alto = 120, icono = { x = 180 + 30,y = 40 + 40 }},

     appDiosGPT = { abierta = false,colorIcono = 10,opcionSeleccionada = 1,paginaActual = 1, mensajeRespuesta = "",
        mensajeInicial = "En que puedo ayudarte wachin?",mensajeFinal = "Algo mas para ayudarte, lince de las praderas de Kursk?"}
    },

    radios = (function()
    -- Definición de abreviaturas para evitar repeticiones
    local B,J,L,P,PL,PD,V,DB,C,W,M,AD,SS,JL,MI,MD =  "Barcelo: ","Juan: ","Locutor: ","Presidente: ","Profesor Levantini: ",
    "Profesora Dopamina: ","Virgolini: ","Damian Blablaman: ", "Cerebrito: ","Wachin: ","Maquina: ","Adrian Delatramta: ",
    "Silvestre Stacchotta: ","Jorge LaNota: ","Medio de Izquierda: ","Medio de Derecha: "

    return {
        radio_1 = { -- Radio Todo Vardo
            B.."Urgente en Todo Vardo!",B.."Estamos en vivo con Juan Garcamaru.",
            B.."Juan, que esta pasando con las galletitas CULO?",J.."Buenas tardes, Barcelo. La inflacion nos esta destruyendo.",
            B.."Inflacion del 1200%? Como afecta esto a las ventas?",J.."Nadie compra. Antes eran 50 pesos, ahora 15 mil.",
            B.."Es una locura! Que dice la empresa?",J.."La empresa esta considerando cambiar el nombre.",
            B.."El nombre? Como lo cambiarian?",J.."Quizas 'Delicias Niponas'. Algo mas refinado.",
            B.."Pero el nombre CULO es historico...",J.."Lo sabemos, pero el publico lo asocia con inflacion.",
            B.."Que piensa hacer la empresa para sobrevivir?",J.."Estamos lanzando galletitas mas pequenias.",
            B.."Mas pequenias? Y el precio?",J.."Mas caras, claro. No tenemos opcion!",
            B.."Y que dice el gobierno sobre esta crisis?",J.."Nos prometieron subsidios, pero nunca llegaron.",
            B.."Creen que podran superar esta situacion?",J.."Es dificil, pero confiamos en el mercado nipon.",
            B.."Exportarian galletitas CULO a Japon?",J.."Si, alli el nombre seria un exito.",
            B.."Esto es increible! ultimas palabras, Juan.",J.."Coman CULO, mientras puedan pagarlas.",
            B.."Seguiremos informando. Esto fue Todo Vardo."},

        radio_2 = { -- Radio Bajones
            L.."Desde Radio Bajones les traemos esto para amargarles el dia. Buena tarde.",
            L.."Hoy les presentamos a Bajolini, quien nos cantara su tema 'Mi Querido Pinball'.",
            L.."'Mi Querido Pinball' es una cancion melancolica sobre un juego de cartas que se fue perdiendo con el tiempo.",
            L.."Pero antes de escuchar a Bajolini, les dejamos con un vistazo al juego de cartas...",
            "(Bajolini canta) 'En la mesa de cartas, todo se perdio,'","'Mi querido Pinball, tu suerte se acabo.'",
            "'Las cartas caen lentamente, en el olvido total,'","'Un juego perdido, que se desvanece como un mal.'",
            "'Pinball, querido Pinball, lo que un dia fue,'","'Las cartas estan vacias, ya no hay nada que hacer.'",
            "'El mercado se cierra, las cartas se pierden,'","'El juego se acaba, y yo solo quiero volver a creer.'",
            "'Mi querido Pinball, tu nombre lo recordare,'","'Pero en este juego ya no hay mas que perder.'",
            "'A veces me pregunto si alguna vez fue real,'","'Mi querido Pinball, ahora todo es tan fatal.'",
            L.."Y asi, amigos, termino nuestra triste cancion,",L.."'Mi Querido Pinball', la reflexion sobre un juego olvidado.",
            L.."Bajolini nos ha dejado una marca melancolica, hasta la proxima en Radio Bajones."},

        radio_3 = { -- Radio Poesia de la Calle
            L.."Bienvenidos a Radio Poesia de la Calle, donde la calle tiene voz.",
            L.."Hoy les traemos el ultimo exito del duo ruso-senegales.",
            L.."La cancion se llama 'Ojiva Nuclear', un trap erotico que lo tiene todo.","(Duo canta) 'Ella sabe por que usa la IA,'",
            "'Madam, quiere mi ojiva nuclear.'","'En la pista caliente, todo va a estallar,'",
            "'Mi ritmo te domina como un misil en el radar.'","'Ella dice que el algoritmo no la puede controlar,'",
            "'Pero conmigo siempre quiere bailar.'","'Ojiva, ojiva, me quiere activar,'",
            "'Madam, eres mi unica senial.'",L.."Esto fue 'Ojiva Nuclear'. Hasta la proxima en Radio Poesia de la Calle."},

        radio_4 = { -- Radio Gobierno de Argentina
            L.."De acuerdo a la ley 24.422, que regula la radiodifusion en Argentina,",
            L.."Transmitimos esta Cadena Nacional 2025 N1 en vivo para toda la nacion.",
            L.."En esta historica transmision, el Presidente Armando Gene Tinoman nos hablara.",
            P.."Buenas noches a todos los argentinos y argentinas.",
            P.."Hoy tengo el honor de compartir con ustedes una noticia personal.",
            P.."Estoy embarazado. Si, escucharon bien, embarazado.",
            P.."Este logro es el fruto de avances cientificos y sociales increibles.",
            P.."A traves de esta experiencia, quiero promover practicas saludables.",
            P.."Hoy lanzo un programa nacional para fomentar el bienestar en el embarazo masculino.",
            P.."Incluire cobertura medica completa y apoyo psicologico.",
            P.."Tambien crearemos una red de acompaniamiento y educacion.",
            P.."Juntos construiremos un futuro inclusivo para todos.",
            L.."Esto fue la Cadena Nacional 2025 N1. Muchas gracias."},

        radio_5 = { -- Radio Solos y Solas
            L.."Bienvenidos a 'Solos y Solas ;)',",L.."El programa donde exploramos como las relaciones van de mal en peor.",
            L.."Hoy tenemos una entrevista con Virgolini, quien nos contara una historia sorprendente.",
            PL.."Bienvenido Virgolini, puedes contarnos que sucedio?",
            V.."Claro, todo comenzo cuando le regale 1000 USD a la persona que me interesaba.",
            V.."Pense que iba a ser un gesto de carinio, pero me respondio con un escopetazo.",
            PL.."Vaya, eso suena terrible! Que opinas sobre el estado actual de las relaciones?",
            PL.."En estos tiempos, las relaciones casuales de 1 minuto estan de moda.",
            PL.."No es sorprendente que las cosas estan tan mal. Las expectativas son cada vez mas bajas.",
            PD.."Es cierto, la gente busca conexiones instantaneas, pero se olvidan del valor real.",
            L.."Asi concluye nuestra entrevista con Virgolini. Nos vemos la proxima vez."},

        radio_6 = { -- Radio Desgracias Economicas
            L.."Bienvenidos a 'Desgracias Economicas',",L.."El programa donde analizamos las cotizaciones del dolar en tiempo real.",
            L.."Hoy, las cotizaciones del dolar estan por las nubes.",L.."Dolar Otaku: 10000 pesos.",L.."Dolar Cuchi Cuchi: 25000 pesos.",
            L.."Dolar Papas Fritas: 30000 pesos.",L.."Dolar Chocolate con Mani: 28000 pesos.",
            L.."Y el riesgo pais, como siempre: Siga Siga.",L.."Crecimiento proyectado 2025: Ay, que horror.",
            L.."Asi esta la situacion economica! No se despeguen de 'Desgracias Economicas'."},

        radio_7 = { -- Radio Joyas de la Historia
            L.."Bienvenidos a 'Joyas de la Historia Argentina Desconocidas',",
            L.."El programa que descubre las historias que la historia nunca conto.",
            L.."Hoy les traemos una increible anecdota sobre el General San Martin.",
            L.."En una entrevista exclusiva con el historiador Damian Blablaman,",
            L.."nos cuenta como San Martin, tras una revalorizacion del idioma Turro Rioplatense en Asia Oriental,",
            L.."se animo a hablar en este idioma en un evento internacional.",
            DB.."'San Martin, conocido por su astucia y liderazgo, en este evento historico,",
            DB.."sorprendio a todos cuando, con total seguridad, hablo en Turro Rioplatense, un idioma casi olvidado'.",
            DB.."'Este hecho no solo marca un hito en la historia argentina, sino tambien en la revalorizacion de lenguas olvidadas.'",
            L.."Una historia fascinante que pone en perspectiva la importancia de nuestra identidad cultural.",
            L.."Esto fue 'Joyas de la Historia Argentina Desconocidas'! No se lo pierdan la proxima vez."},

        radio_8 = { -- Radio No Me Importa
            L.."Bienvenidos a 'No me Importa',",L.."El espacio que te mantiene informado, sin importar cuan irrelevante sea.",
            L.."Hoy, en noticias internacionales, nos llega una actualizacion impactante desde Europa.",
            L.."En el anio 2025, Suiza y Noruega han comenzado una guerra sin precedentes,",
            L.."una guerra en la que se utilizan huevos de pascua bomba como armas de destruccion masiva.",
            L.."Segun fuentes confiables, los huevos de pascua bomba tienen una gran capacidad de explosion,",
            L.."y han sido utilizados por ambos paises en una serie de ataques sorpresivos.",
            L.."La situacion ha escalado rapidamente, con ambos bandos desplegando ejercitos enteros de huevos de pascua.",
            L.."Los analistas internacionales aseguran que es la guerra mas surrealista de la historia reciente.",
            L.."Los expertos en armamento explican que la efectividad de estos huevos de pascua bomba",
            L.."se debe a su capacidad de camuflaje, ya que son dificiles de detectar antes de su explosion.",
            L.."En un giro inesperado, los lideres de ambos paises han llamado a una tregua para negociar...",
            L.."...pero hasta ahora no ha habido avances significativos.",
            L.."Esto fue 'No me Importa'. Mantente al tanto de lo que realmente no te importa."},

        radio_9 = { -- Radio Antimainstream
            L.."Bienvenidos a Radio Antimainstream, donde las historias van mas alla de lo comun.",
            L.."Hoy les traemos una historia exclusiva desde el Barrio Viejo de Montevideo.",
            L.."Cerebrito y Wachin, dos chicos inquietos, van en busca de un arcade perdido.",
            C.."Wachin, sabias que la historia de este lugar tiene tintes de lo que podria considerarse una 'alegoria'?",
            W.."Che, como vas a hablar asi en este barrio?! Cualquiera entiende lo que quiero decir, man!",
            L.."En un rincon oscuro del Barrio Viejo, los chicos encuentran la puerta de entrada.",
            C.."Este lugar parece fuera del tiempo. La decadencia misma puede considerarse una metafora del presente.",
            W.."Decadencia, y que?! Lo que quiero es meterle una ficha a esa maquinita vieja, papa!",
            L.."En su recorrido, descubren una maquina antigua, cubierta de polvo.",
            W.."Esta maquina esta aca desde los anios '80?! Mira la mugre que tiene! Cuanto hace que nadie le pone una ficha?",
            C.."Este artefacto representa la esencia de lo perdido. Un relicto de un pasado aun por descifrar.",
            L.."Y justo cuando parecen estar por empezar, la maquina comienza a hablar...",
            M.."Bienvenidos, intrusos. Estan preparados para desafiar la inercia del tiempo?",
            C.."Esto es fascinante! El aparato ha logrado trasgredir los limites de la razon y la fisica.",
            W.."Que esta pasando?! Quien te entiende, Cerebrito? Cambiemos el rumbo, man!",
            L.."Aunque sorprendidos, Cerebrito y Wachin hallan una solucion inesperada.",
            C.."Lo esencial es comprender que en el caos, la clave es el orden... en nuestra forma de actuar.",
            W.."Que?! Yo solo queria jugar un rato tranquilo! Deja de hacerla tan dificil, Cerebrito!",
            L.."Al final, Cerebrito y Wachin logran salir del lugar, aunque con una nueva vision de la vida.",
            C.."A veces, lo que necesitamos no es entretenimiento, sino reflexion, para redescubrir el mundo.",
            L.."Asi concluye esta historia de locura y nostalgia. Nos vemos en la proxima transmision de Radio Antimainstream!"},

        radio_10 = { -- Radio Cine Ultra 8K
            L.."Bienvenidos a Cine Ultra 8K, la radio del cine mas grande y brillante.",
            L.."Hoy tenemos el honor de entrevistar a uno de los iconos del cine de accion.",
            L.."Adrian Delatrampa entrevista al gran actor estadounidense, Silvestre Stacchotta!",
            AD.."Silvestre! Un placer tenerte en nuestros microfonos.",
            SS.."Gracias, Adrian, es un gusto estar aqui. Siempre es bueno estar cerca de los fans de cine.",
            AD.."Estas a punto de protagonizar una pelicula muy esperada, *Mambo*, que nos puedes contar sobre tu personaje?",
            SS.."Bueno, mi personaje, es un tipo rudo! Pero tambien tiene un toque de sensibilidad que creo que va a sorprender a la gente.",
            AD.."Eso suena increible! Como te preparaste para este papel? Hubo algun desafio particular?",
            SS.."Claro, la preparacion fue intensa. Pase semanas entrenando para las escenas de accion, pero tambien me enfoque mucho en la psicologia de mi personaje.",
            AD.."Increible! Sabemos que la pelicula se estrenara en cines argentinos el 32 de enero, algo que los fans esperan con ansias!",
            SS.."Asi es. Sera un estreno espectacular! Y creo que los argentinos van a disfrutar mucho de la accion, pero tambien de las emociones profundas que muestra la pelicula.",
            AD.."Podrias darnos un adelanto de alguna de las escenas mas epicas de *Mambo*?",
            SS.."Hay una escena en la que me enfrento a un ejercito de villanos usando una motosierra! Pero lo mas epico es cuando mi personaje decide dar un giro inesperado y se convierte en un lider.",
            AD.."Eso suena a lo grande! Silvestre, que es lo que mas te atrae de los papeles de accion como los que interpretas?",
            SS.."Me encanta mostrar que los heroes no tienen que ser perfectos. Son humanos, con fallos y debilidades. Pero tambien con una gran determinacion.",
            AD.."Definitivamente eso resuena con el publico. No podemos esperar para ver *Mambo* en la pantalla grande!",
            SS.."Gracias! Estoy muy emocionado de que la gente vea la pelicula. Seguro que va a ser un gran exito!",
            AD.."Muchisimas gracias por tu tiempo, Silvestre! Y a todos nuestros oyentes, no se olviden de ir al cine el 32 de enero para disfrutar de *Mambo*!",
            L.."Asi finaliza esta increible entrevista con Silvestre Stacchotta. Nos vemos en la proxima transmision de Cine Ultra 8K!"},

        radio_11 = { -- Radio Destapando Curros
            L.."Bienvenidos a Radio Destapando Curros, donde nada se esconde.",
            L.."Hoy les traemos un comercial exclusivo de nuestro periodista Jorge LaNota.",
            JL.."Hola, soy Jorge LaNota, y tengo una fascinacion enfermiza por destapar los culos sucios de la politica argentina.",
            JL.."He viajado por todo el mundo, infiltrandome en los rincones mas oscuros para exponer la verdad.",
            JL.."De hecho, me infiltre en Corea del Norte, un lugar donde pocos se atreven a mirar, para destapar los turbios negocios entre Argentina y ese pais.",
            JL.."Y lo que descubri te hara temblar! Desde contratos secretos hasta acuerdos peligrosos, todo con la complicidad de figuras de poder en Argentina.",
            JL.."Que hacen los poderosos mientras nos distraen con mentiras? Yo te lo cuento todo, sin censura.",
            JL.."Unite a mi en esta cruzada para destapar la verdad. Porque la politica no puede seguir tapando sus cagadas!",
            L.."No te pierdas la revelacion mas grande de los ultimos tiempos. Solo aqui, en Radio Destapando Curros.",
            L.."La verdad esta al aire, y es mas sucia de lo que imaginas. Escucha y abre los ojos!"},

        radio_12 = { -- Radio Grieta
            L.."Bienvenidos a 'Radio Grieta',",L.."la emisora donde todas las voces tienen su sesgo.",
            L.."Hoy analizamos la noticia del mes: inflacion del 3% en noviembre.",
            MI.."'Un logro del Gobierno en su lucha contra el ajuste neoliberal, mostrando compromiso con el pueblo.'",
            MD.."'Otro fracaso en la economia, reflejando la incapacidad del Gobierno para controlar la inflacion.'",
            L.."Y asi, dos miradas, una realidad.",L.."Ahora pasamos a otra noticia: aumento del 5% en el salario minimo.",
            MI.."'Una medida insuficiente que no alcanza para combatir el verdadero costo de vida.'",
            MD.."'Un paso positivo que ayuda a reactivar la economia y beneficia a las familias trabajadoras.'",
            L.."Dos opiniones, una noticia. Esto fue 'Radio Grieta'. Hasta la proxima!"},

        variables = {temporizadorRadio = 0,indiceFraseRadio = 1,radioActual = 1}
    } end)(),

    gestionMisionStuntman = (function()
    local function crearObjetos(cantidad, x1, x2, y1, y2)
        local objetos = {}
        for i = 1, cantidad do table.insert(objetos, {x = math.random(x1, x2),y = math.random(y1, y2),active = true}) end
        return objetos
    end

    local function crearVagones(x, y, cantidad)
        local vagones = {}
        for i = 0, cantidad-1 do table.insert(vagones, {x = x - (i*10), y = y}) end
        return vagones
    end

    return {
        puntosPorFase = {100, 150, 200, 250, 300, 350, 400, 450, 500, 1000},
        
        checkpointSystem = { animation = { radiusPulse = {min=6, max=10, current=6, speed=0.2, growing=true},active = false,timer = 0 },
            particles2 = {},
            configs = { stuntmanCheck = {x=1290, y=1031, color=8, reached=false},bomba = {x=1381, y=636, color=8, reached=false},
                tren = {x=1393, y=693, color=8, reached=false}},
            lastLogs = {}},

        mision = { conos = { {x=1377, y=1027, active=true},{x=1407, y=1027, active=true},{x=1380, y=908, active=true},
        {x=1405, y=908, active=true}},
            galeriatiro = {{x=1349, y=984, active=true},{x=1349, y=1013, active=true}},
            vidrios = crearObjetos(10, 1117, 1160, 1020, 1040),
            cajasNormales = crearObjetos(10, 1045, 1130, 1025, 1080),
            cajaMetalica = {x=1345, y=1026, active=true, health=6},
            rampas = { {x=1318, y=1059, aterrizajeX=1366, aterrizajeY=1053,ancho=16, alto=16, sprite=128, direccion="arriba"},
                {x=1378, y=873, aterrizajeX=1413, aterrizajeY=816,ancho=16, alto=16, sprite=128, direccion="arriba"}},
            circuloVictoria = {x=150, y=0, radius=10},
            trenes = {{x=1375, y=756, speed=1, vagones=crearVagones(1375, 756, 4)},
                {x=1375, y=803, speed=1.2, vagones=crearVagones(1375, 803, 4)},
                {x=1375, y=776, speed=0.8, vagones=crearVagones(1375, 776, 4)}
            },
            cocheAPerseguir = {x=1387, y=1017, speed=2, sprite_id=356},
            aroParaSaltar = {x=1420, y=832, timer=0, state="fire", particulas={}} },

        balasCoche = {},cochesEnemigosStuntman = {},llamasCochesEnemigos = {},

        booleanos = { dialogoAlternativo=false, bonus=false, puenteDestruido=false,pistolaObtenida=false, mostrarDialogoDesarrollo=false,
            noMostrarObjetivoAun=true, transicionCheckpoint=false,faseBomba=false, seguirCheckpoint=false, colision=false,
            interruptorCheckpoint=false, yaSumoPuntosDialogoOculto=false,mostrarObjetivoCompletado=false, controlesBloqueados=false,
            controlesBloqueadosTiburon=false, jugadorEstaEnVehiculo=false,cocheEstaSaltando=false, saltoConExito=false, 
            quemadoPorAro=false,aroSaltadoSinQuemarse=false, nitroActivado=false,jugadorPreparaBomba=false, 
            jugadorAtrapadoPorExplosion=false,explosionExitosa=false, nitroBloqueado=true,
            gameOverFases = {false, false, false, false, false, false, false, false, false, false} },

        numericos = { temporizadores = { cuentaAtrasReplay=0, cuentaAtrasStuntman=5*60, frameCount=0,temporizadorSalto=0, 
            temporizadorExplosionRapida=120,temporizadorAparicionCocheEnemigo=0},
            estadoJuego = { faseActualEnGameOver=0, selectorFase=1, lafase=1, indiceDialogoStuntman=1, interruptorParteMisionStuntman=0 },
            progreso = { puntuacionStuntman=0, objetivoTexto="", tiempoMostrarObjetivo=0,objetosChocados=0, dialogosOcultosEncontrados=0,
            contadorCheckpoint=0, contadorTiburon=0,contadorCajasDerribadas=0, tiempoTotalStuntman=0},

            disparos = {velocidadDisparoDesdeVehiculo=5, tamanoDisparoDesdeVehiculo=4},
            dialogos = { desarrollo = {x=1215, y=980},cochesEnLlamas = {x=1500, y=985}, tren = {x=1350, y=740}},
            personajes = { silvestreStacchotta = {x=1050, y=1050} },
            mensajeTemporal = { texto="", tiempo=2},
            varias = { radioSangre=0, distanciaEntreJugadoryCocheAPerseguir=0, radioExplosionBombaStuntman=-120, 
            rangoDeSeguimientoCocheAPerseguir=24}}
    }
    end)(),

    dialogosStuntman = (function()
    local SS = "Silvestre Stacchotta: "  -- Abreviatura para evitar repeticiones
    
    return {
        misionStuntman = {
            partes = { [1] = { normal = { SS.."Good day wacho, altas llantas.",
                        SS.."Perdon, estoy un poco enturrecido desde que estoy en Buenos Aires.",
                        SS.."A diferencia de mi hogar en Los Guapos County ( Condado ) de Los Angeles,",
                        SS.."La Fucking humedad de Buenos Aires esta mas fuerte que Rusas en bikini.",
                        SS.."En fin wacho, subete al coche. Solo tienes 5 segundos."},
                    alternativo = { SS.."No puedo creer que no hayas podido subirte a ese coche en 5 segundos."} },
                [2] = { normal = {SS.."Ahora arrolla esas malditas cajas."},
                    alternativo = {SS.."Solo superaras tu CajaFobia si destruyes las cajas."}},
                [3] = { normal = {SS.."Ahora eres un fucking meteorito, activa el nitro tardigrado de Bosnia."},
                    alternativo = {SS.."Ni con Nitro llegas a ese checkpoint? You are a Joke."}},
                [4] = { normal = {SS.."Ahora tenes que dispararle desde el coche a esa caja malvada."},
                    alternativo = {SS.."Me dijo la Caja Metalica que te tiene miedo."}},
                [5] = { normal = {SS.."Lince, tenes que usar esa rampa para volar como los dioses del asfalto."},
                    alternativo = {SS.."Vamos,usa la rampa,you are the holy shit."}},
                [6] = {normal = {SS.."Mas vale que esquives esos coches porque me estoy enturreciendo mal."},
                    alternativo = {SS.."Eh ameo,pode equivar that cars?."}},
                [7] = { normal = {SS.."Ahi va el infeliz que me robo mi chorinesa, a por el wacho de Nunavut!"},
                    alternativo = {SS.."Ya perdi una chorinesa,espero no tener que ir a Canada a recuperar otra."}},
                [8] = {normal = { SS.."Do you have enough Chechona?",SS.."Salta por el aro, pero no te quemes."},
                    alternativo = {SS.."Si no puedes saltar el aro olvidate del Kamasutra."}},
                [9] = { normal = {SS.."Esquiva el maldito tren asi llegas al final y posteamos algo en Egogram."},
                    alternativo = {SS.."Esquiva los chucu chucu wachote de Bosnia."}},
                [10] = { normal = { SS.."Preparate, conduce hacia el circulo violeta.",
                    SS.."Una vez alli, presiona el boton para detonar la bomba."},
                    alternativo = {SS.."PONE LA BOMBA WACHO,PONELA POR DIOS."}}
            },
            ocultos = { fase4 = "Me estoy comiendo un Chori de chocolate.",
                fase5 = "En Madrid hice un doctorado en quitar sostenes.Me saque un 69."}},

        desarrollo = { "01:Los primeros 2 meses de desarrollo este videojuego fue desarrollado exclusivamente en celular.",
            "02:Para hacer la mision de Stuntman se dividio en 10 .tic diferentes la mision.",
            "03:La idea del Personaje de Stacchotta surgio al ver la foto de Milei con Stallone.",
            "04:Esta Mision esta inspirada en Stuntman ( 2002 ) de PS2.",
            "05:El mapa fue diseniado desde el celular,sin poder testear la mision en funcionamiento previamente.",
            "06:Una radio del juego iba a ser sobre aprender Chino Mandarin pero TIC80 no soporta Caracteres Chinos.",
            "07:La PC en la que se esta haciendo este juego tiene 8 años de antiguedad.",
            "08:Este juego reusa ideas de un proyecto planeado en 2010 pero es un juego diferente.",
            "09:El desarrollo empezo el 30 de Diciembre de 2024.",
            "10:Se uso como IA a ChatGPT,siendo tambien usada DeepSeek que salio casi al mismo tiempo que el comienzo del desarrollo.",
            "11:Juego desarrollado por una unica persona ( Pascua ) aunque con ayuda de la IA.",
            "12:La idea de usar Radios esta inspirada en el GTA.",
            "13:El juego usa TIC80 al limite ( en memoria de graficos,en tamanio del mapa y hasta en peso del juego ).",
            "14:Si no ves la letra enie,es porque TIC80 no la soporta = las reemplace con N.",
            "15:Los dialogos de las Radios fueron generados con IA ( pero con mis instrucciones , para que sean bastante inusuales )."},
        descripcionMision = "Mision: El Kamikaze del Cine\n".. "Jefe: Silvestre Stacchotta\n".. 
        "Objetivo: Rodar exitosamente una escena de doble de peliculas con el coche.",
        estadoMision = "mission_intro",
        dialogoDesarrolloRandom = function(self) return self.desarrollo[math.random(1, #self.desarrollo)] end
    } end)(),

    estadoCreditos = { posicionY = 136,
     mensaje = { "CREDITOS","","Director de Etica de IA: Pascua","","Generador de Contenido:","ChatGPT / DeepSeek",
        "","Diseniador de Sprites: Pascua","","Director Ejecutivo de Codigo:","ChatGPT / DeepSeek","",
        "Agradecimientos Especiales:","","- Chistes Random: Un tipo de internet."},
    estrellas = (function()
        local estrellas = {}
        for i = 1, 50 do table.insert(estrellas, {x = math.random(0, 239),y = math.random(0, 135)}) end
        return estrellas
    end)()
    },

    estadoIntro = { temporizador = 0, indiceMensaje = 1,
    mensajes = {"AltaVista Games","Todos los derechos reservados 2025","by Pascua","Crimen Y Pixel"},
    estrellas = (function()
        local estrellas = {}
        for i = 1, 50 do table.insert(estrellas, {x = math.random(0, 239),y = math.random(0, 135)}) end
        return estrellas
    end)()  -- IIFE (Immediately Invoked Function Expression)
    },

    lectorDeDiarios = {scroll = 0,maximoScroll = 480 },

    pinball = (function()
    local function crearMeteoritos(cantidad)
        local m = {}
        for i = 1, cantidad do
            table.insert(m, { x = math.random(0, 240),y = math.random(-50, -10),velocidadY = math.random(1, 3),color = math.random(1, 3)})
        end
        return m
    end

    return {
        config = {nivel=1, puntuacion=0, puntosParaSiguienteNivel=300,intentos=0, combos=0, colisiones=0, tiempoReaparicion=180},
        
        bola = { principal = {x=190, y=120, vx=0, vy=0, radius=4, lanzada=false},
            adicionales = { {x=100, y=60, vx=0, vy=0, radius=4, activa=false}, {x=140, y=80, vx=0, vy=0, radius=4, activa=false}} },
        
        paletas = { izquierda = {x=40, y=100, length=20, angle=-math.pi/2, color=1},
            derecha = {x=80, y=100, length=20, angle=-math.pi/2, color=1},
            superiorIzquierda = {x=1, y=40, length=20, angle=-math.pi/2, color=1},
            superiorDerecha = {x=214, y=100, length=20, angle=-math.pi/2, color=1}},
        
        objetos = { agujero = {x=35, y=130, width=40, height=10},
            
            diamantes = { {x=20, y=70, visible=true, timer=0},{x=80, y=70, visible=true, timer=0},
                {x=120, y=20, visible=true, timer=0},{x=150, y=50, visible=true, timer=0}},
            
            spriteInteractivo = { x=130, y=45, spriteId=258, ancho=8, alto=8,ultimaFrase=0, mostrarFrase=false, fraseActual="",
                frases = { "PARA WACHO!", "AY AY AY!", "QUE VIVAN LAS PULGAS!", "NO ME GUSTA!", "TOCASTE EL 258!", "REBOTE PELOTUDO!",
                "UYYY QUE GOLPE!", "AGUANTE EL PINBALL!"} },
            
            spriteRebote = { id=99, x=140, y=115, ancho=8, alto=8, reboteIntensidad=4.0 },
            
            spritesAnimados = { {id=274, x=30, y=30, radio=8},{id=275, x=60, y=30, radio=8},{id=276, x=90, y=30, radio=8},
            {id=277, x=120, y=30, radio=8},{id=278, x=30, y=50, radio=8},{id=279, x=60, y=50, radio=8},{id=280, x=90, y=50, radio=8},
            {id=281, x=120, y=50, radio=8}}
        },
        
        resorte = { animando=false, timer=0, posY=140},
        
        meteoritos = crearMeteoritos(10),
        
        frases = { aCompletar = { lista = { "Tecnofeudalismo", "Cuchi Cuchi Cuchi", "No seas gilipollas", "Viva el britpop", "Party Hard", 
                "Usa condon,no seas pelotudo","Soy la hostia tio"},indice=1 },
            
            rap = {lista = {"1- Desde Chubut hasta Buenos Aires, el pinball no para!","2- Te gales y medialunas, pinball en las cantinas!",
                    "3- El dragon gales ruge fuerte en la pista de pinball!","4- Bola de pinball como el viento en Trelew y La Boca!",
                    "5- Coro gales canta mientras la bola rebota!","6- Puerto Madero y Gaiman unidos por el pinball!",
                    "7- Torta negra y mate, energia para el pinball!","8- Eisteddfod de rebotes en esta maquina porteña!",
                    "9- Los pioneros galeses hubieran sido cracks del pinball!","10- Rawson a Retiro, un viaje en pinball!",
                    "11- Rugby y pinball, pasiones que unen!","12- La bola vuela como el condor sobre la Patagonia portenia!",
                    "13- Chapuzon en el Atlantico y luego al pinball!","14- Huellas galesas en los rieles del subte pinballero!",
                    "15- Bola plateada como la luna sobre el Chubut urbano!" },
                indice=1, posX=160, velocidad=1.2,colores={2,3,4,5,6,7,8,9,10,11,12,13,14,15},offsetColor=0, fraseActual="", timer=0,
                limites={izquierdo=10, derecho=160}
            }
        },
        
        animaciones = { objeto = { x=120, y=68, tipo="ninguno", timer=0, radio=10, colores={} },
            paletas = { meteorito={8,2,9,10},relampago={10,14,13,15},planeta={11,12,3,13} }
        },
        
        colores = { paredes = { izquierda=4, derecha=4, arriba=4, abajo=4},tiempoCambioColor=0,duracionCambioColor=30}
    }
    end)(),

    estadoTelescopio = { coloresEstrella = {12, 11, 15},frameAnimacion = 0,
    estrellaFugaz = { x = 240,y = math.random(0, 135),trail = {}}, mira = {x = 120,y = 68,radio = 40},
    
    -- Estrellas inicializadas automáticamente
    estrellas = (function()
        local estrellas = {}
        for i = 1, 100 do table.insert(estrellas, { x = math.random(0, 239),y = math.random(0, 135) }) end
        return estrellas
    end)() }
}

--TODAS LAS FUNCIONES :

function verificarLimitesMapaConCamara(accion, esParaMisionStuntman)
    local jugador, vehiculo, camara = todoJuego.estadoJugador.jugador, todoJuego.estadoJugador.vehiculo, todoJuego.estadoJugador.camara
    
    if accion == "verificar_limites" then
        -- ========== LÓGICA DE VERIFICACIÓN DE LÍMITES ==========
        if esParaMisionStuntman then
            -- Lógica para la misión Stuntman
            local nuevaXJugador, nuevaYJugador, nuevaXCoche, nuevaYCoche, colision = jugador.x, jugador.y, vehiculo.x, vehiculo.y, false

            -- Función interna para aplicar límites
            local function aplicarLimites(nuevaX, nuevaY)
                local enZonaIzquierda,enZonaDerecha = (nuevaX >= 1030 and nuevaX < 1315),(nuevaX > 1315 and nuevaX <= 1420)

                -- Límites verticales
                if nuevaY > 1087 then nuevaY,colision = 1087,true
                elseif enZonaIzquierda and nuevaY < 970 then nuevaY,colision = 970,true
                elseif enZonaDerecha and nuevaY < 580 then nuevaY,colision = 580,true end

                -- Límites horizontales
                if nuevaX < 1030 then nuevaX,colision = 1030,true
                elseif nuevaX > 1420 then nuevaX,colision = 1420,true end

                -- Bloqueo especial para cruce entre zonas
                if enZonaDerecha and nuevaX < 1317 and nuevaY < 970 then nuevaX,colision = 1317,true end

                return nuevaX, nuevaY
            end

            -- Aplicar límites a ambas entidades
            nuevaXJugador, nuevaYJugador = aplicarLimites(nuevaXJugador, nuevaYJugador)
            nuevaXCoche, nuevaYCoche = aplicarLimites(nuevaXCoche, nuevaYCoche)

            -- Actualizar posiciones
            jugador.x, jugador.y,vehiculo.x,vehiculo.y = nuevaXJugador, nuevaYJugador,nuevaXCoche, nuevaYCoche
            return colision
        else
            -- Lógica normal de límites del mapa
            local MAPA_ANCHO, MAPA_ALTO, colision = 240 * 8, 136 * 8, false

            -- Movimiento horizontal (X)
            if jugador.x >= MAPA_ANCHO or jugador.x < 0 then
                local bloques_fuera = math.floor(jugador.x / MAPA_ANCHO)
                if jugador.x < 0 then bloques_fuera = math.floor((jugador.x + 1) / MAPA_ANCHO) - 1 end
                camara.offset.x = camara.offset.x + bloques_fuera
                jugador.x = jugador.x - bloques_fuera * MAPA_ANCHO
                colision = true
            end

            -- Movimiento vertical (Y)
            if jugador.y >= MAPA_ALTO or jugador.y < 0 then
                local bloques_fuera = math.floor(jugador.y / MAPA_ALTO)
                if jugador.y < 0 then bloques_fuera = math.floor((jugador.y + 1) / MAPA_ALTO) - 1 end
                camara.offset.y = camara.offset.y + bloques_fuera
                jugador.y = jugador.y - bloques_fuera * MAPA_ALTO
                colision = true
            end
            
            return colision
        end
        
    elseif accion == "inicializar" then
        -- ========== LÓGICA DE INICIALIZACIÓN DE MAPA Y CÁMARA ==========
        local x, y
    
        -- Determinar si usar posición del jugador o del vehículo
        if todoJuego.estadoJugador.jugadorEstaEnVehiculo then x,y = todoJuego.estadoJugador.vehiculo.x,todoJuego.estadoJugador.vehiculo.y
        else x,y = todoJuego.estadoJugador.jugador.x,todoJuego.estadoJugador.jugador.y end

        -- Centrar la cámara en las coordenadas correctas
        todoJuego.estadoJugador.camara.posicion.x,todoJuego.estadoJugador.camara.posicion.y  = x - 120,y - 68

        -- Convertir a celdas del mapa
        todoJuego.estadoJugador.camara.mapa.x = math.floor(todoJuego.estadoJugador.camara.posicion.x / 8)
        todoJuego.estadoJugador.camara.mapa.y = math.floor(todoJuego.estadoJugador.camara.posicion.y / 8)

        -- Dibujar el mapa
        map(todoJuego.estadoJugador.camara.mapa.x, todoJuego.estadoJugador.camara.mapa.y, 30, 17, 0, 0)
        
        return true  -- Indica que la inicialización fue exitosa
        
    else print("Acción no reconocida para verificarLimitesMapaConCamara()", 10, 10, 8) return false end
end

function gestionarArmas(modo, ...)
    -- Cache de variables frecuentemente accedidas
    local gestionArmas, estadoJugador, menu, configGeneral =
    todoJuego.gestionArmas,todoJuego.estadoJugador,todoJuego.menuPrincipal.estados,todoJuego.configuracionGeneral
    local jugador,camara = estadoJugador.jugador,estadoJugador.camara
    local ataques,bx,by,t = gestionArmas.ataques,100 - camara.offset.x, 48 - camara.offset.y,configGeneral.temporizadorGeneral

    -- === CONFIGURACIÓN DE ARMAS ===

    local armasConfig = { [1] = {nombre="Pistola", sprite=290, municion="pistola", recarga=5, tipo="disparo"},
        [2] = {nombre="AK47", sprite=292, municion="ak47", recarga=5, tipo="disparo"},
        [3] = {nombre="Bazooka", sprite=294, municion="bazooka", recarga=5, tipo="disparo"},
        [4] = {nombre="Escopeta", sprite=291, municion="escopeta", recarga=5, tipo="disparo"},
        [5] = {nombre="Granada", sprite=293, municion="granadas", recarga=5, tipo="disparo"},
        [6] = {nombre="Golpe", sprite=289, infinita=true, tipo="melee"},
        [7] = {nombre="ElectroRifle", sprite=296, municion="electrorifle", recarga=100, tipo="continuo", estado="disparandoElectrorifle"},
        [8] = {nombre="Laser", sprite=297, municion="laser", recarga=100, tipo="continuo", estado="disparandoLaser"},
        [9] = {nombre="Katana", sprite=298, infinita=true, tipo="melee"},
        [10] = {nombre="Lanzallamas", sprite=295, municion="lanzallamas", recarga=100, tipo="continuo", estado="disparandoLanzallamas"},
        [11] = {nombre="Minigun", sprite=299, municion="minigun", recarga=100, tipo="continuo", estado="disparandoMinigun"}}

    -- === GESTIÓN DE ARMAS (CAMBIO Y RECARGA) ===
    if btnp(6) then gestionArmas.armaActual = gestionArmas.armaActual % 11 + 1 end
    if btnp(4) then
        local config = armasConfig[gestionArmas.armaActual]
        if config and not config.infinita then gestionArmas.municion[config.municion] = config.recarg end
    end

    -- === DIBUJAR HUD ===
    if modo ~= "colisiones" and modo ~= "frases" then
        local function botonColor(boton) return btn(boton) and 3 or 4 end

        r(0, 116, 85, 20, 0);r(0, 0, 75, 30, 0);r(130, 0, 100, 30, 0)

        if menu.radios then
            r(90, 130, 90, 10, 0) p("B - Cambiar Radio", 90, 130, 6)
        end

        -- Iconos del HUD
        local iconos = { {jugador.vehiculo.icono, 130, 0},{95, 130, 8},{143, 130, 15},{306, 0, 8},{58, 0, 15},{465, 0, 25},{310, 130, 22}}
        for _, icono in ipairs(iconos) do s(icono[1], icono[2], icono[3]) end

        -- Información del jugador
        jugador.zona = gestionarUbicacion("zona", jugador.x, jugador.y)

        for _,p in ipairs{{"P$: "..jugador.dinero,10,25,4},{jugador.vida,10,17,4},{jugador.vehiculo,140,0,4},{jugador.zona,140,10,4},
        {jugador.calle,140,15,4},{jugador.coleccionables.."/ 20",140,23,4},{"Y - Cambiar arma",0,116,botonColor(6)},
        {"B - Disparar",0,123,botonColor(5)},{"A - Recargar",0,130,botonColor(4)}} do print(p[1],p[2],p[3],p[4]) end

        -- Información del arma actual
        local configArma = armasConfig[gestionArmas.armaActual]
        if configArma then
            s(configArma.sprite, 0, 0)
            p(configArma.nombre, 10, 0, 4) p(configArma.infinita and "Infinita" or gestionArmas.municion[configArma.municion], 10, 10, 4)
        end
    end

    -- === GESTIÓN DE ATAQUES ===
    if modo ~= "colisiones" and modo ~= "frases" then
        local armaActual = gestionArmas.armaActual
        if armaActual then
            -- Configuración de ataques
            local disparosSimples = { pistola = {dx = 3, dy = 0},ak47 = {dx = 6, dy = 0},bazooka = {dx = 2, dy = 0} }

            -- Acciones especiales por arma
            local accionEspecial = {
                [4] = function() -- Escopeta
                    local x, y = jugador.x + 8, jugador.y
                    for _, d in ipairs({{dx=2, dy=0}, {dx=2, dy=-1}, {dx=2, dy=1}}) do
                        table.insert(ataques.disparos, {x=x, y=y, dx=d.dx, dy=d.dy, tipo="escopeta"})
                    end
                    gestionArmas.municion.escopeta = gestionArmas.municion.escopeta - 1
                end,
                [5] = function() -- Granada
                    table.insert(ataques.granadas, { x = jugador.x + 8,y = jugador.y,dx = 2, dy = -2, tiempo = 0 })
                    gestionArmas.municion.granadas = gestionArmas.municion.granadas - 1
                end,
                [6] = function() -- Golpe
                    table.insert(ataques.golpes, { x = jugador.x + 8,y = jugador.y,tiempo = t })
                end,
                [7] = function() -- Electrorifle
                    gestionArmas.armasDisparadas.disparandoElectrorifle = true
                    local offsetX,offsetY = jugador.x - camara.posicion.x + 8,jugador.y - camara.posicion.y + 8
                    table.insert(ataques.rayosElectrorifle, {x_inicio = offsetX,y_inicio = offsetY,x_fin = offsetX + 24,
                        y_fin = offsetY + math.random(-16, 16),vida = math.random(20, 30)})
                    gestionArmas.municion.electrorifle = gestionArmas.municion.electrorifle - 1
                end,
                [8] = function() -- Láser
                    gestionArmas.armasDisparadas.disparandoLaser = true
                    gestionArmas.laser.longitud = math.min(gestionArmas.laser.longitud + 4, 200)
                    gestionArmas.municion.laser = gestionArmas.municion.laser - 1
                    local laserEnd = jugador.x + gestionArmas.laser.longitud
                    for _, enemigo in ipairs(todoJuego.cochesEnemigos) do
                        if not enemigo.colisionado and
                           laserEnd >= enemigo.x and laserEnd <= enemigo.x + 16 and
                           jugador.y + 8 >= enemigo.y and jugador.y + 8 <= enemigo.y + 16 then
                            enemigo.colisionado = true
                        end
                    end
                end,
                [9] = function() -- Katana
                    gestionArmas.katana.tiempoUltimoCorte = t
                    table.insert(ataques.cortesKatana, {
                        x_inicio = jugador.x - camara.posicion.x + 8,y_inicio = jugador.y - camara.posicion.y + 8,
                        angulo = math.pi/4,tiempo_restante = gestionArmas.katana.duracionCorte,giro = gestionArmas.katana.velocidadGiro
                    })
                end,
                [10] = function() -- Lanzallamas
                    gestionArmas.armasDisparadas.disparandoLanzallamas = true
                    local baseX,baseY = jugador.x - camara.offset.x + 100 + 2,jugador.y - camara.offset.y + 48
                    for _ = 1, 5 do
                        table.insert(ataques.disparosLanzallamas, { x = baseX,y = baseY + math.random(-4, 4),dx = math.random(2, 4),
                            dy = math.random(-1, 1),vida = math.random(30, 50),color = math.random(2, 4)})
                    end
                    gestionArmas.municion.lanzallamas = gestionArmas.municion.lanzallamas - 1
                end,
                [11] = function() -- Minigun
                    gestionArmas.armasDisparadas.disparandoMinigun = true
                    if t % 6 == 0 then
                        local baseX,baseY = jugador.x - camara.offset.x + 100,jugador.y - camara.offset.y + 48
                        for _ = 1, 4 do
                            table.insert(ataques.balasMinigun, { x = baseX,y = baseY + math.random(-1, 1),dx = 3 + math.random(0, 1),
                                dy = math.random(-1, 1) * 0.5,vida = 60})
                        end
                        gestionArmas.municion.minigun = gestionArmas.municion.minigun - 1
                    end
                end
            }

            -- Verificar condiciones de ataque
            local config, municion, puedeAtacar = 
            armasConfig[armaActual], 
            armasConfig[armaActual].municion and gestionArmas.municion[armasConfig[armaActual].municion], 
            false

            if config.tipo == "disparo" and municion then puedeAtacar = btnp(5) and municion > 0
            elseif config.tipo == "continuo" and municion then puedeAtacar = btn(5) and municion > 0
            elseif armaActual == 6 then puedeAtacar = btnp(5) and #ataques.golpes == 0
            elseif armaActual == 9 then 
                puedeAtacar = btn(5) and (t - gestionArmas.katana.tiempoUltimoCorte >= gestionArmas.katana.tiempoEntreCortes)
            end

            -- Ejecutar ataque si es posible
            if puedeAtacar then
                if disparosSimples[config.municion] then
                    local d = disparosSimples[config.municion]
                    table.insert(ataques.disparos, {x = jugador.x + 8,y = jugador.y,dx = d.dx, dy = d.dy,tipo = config.municion })
                    gestionArmas.municion[config.municion] = municion - 1
                elseif accionEspecial[armaActual] then accionEspecial[armaActual]() end
            end
        end

        -- === MOVIMIENTO Y DIBUJO DE PROYECTILES ===
        -- Golpes
        for i = #ataques.golpes, 1, -1 do
            local g = ataques.golpes[i]
            if t - g.tiempo > gestionArmas.tiempoDisparo.tiempoGolpeVisible then table.remove(ataques.golpes, i)
            else
                g.x, g.y = jugador.x + 8, jugador.y
                s(289, g.x + bx, g.y + by, 0)
                if g.tipo == "katana" then
                    rect(g.x + bx, g.y + by, 12, 2, 7);rect(g.x + bx + 1, g.y + by + 1, 10, 1, 13);rect(g.x + bx - 4, g.y + by, 4, 2, 12)
                    if g.animacion > 0 then for j = 0, 3 do pix(g.x + bx + 12 + j, g.y + by, 7 + j) end end
                end
            end
        end

        -- Rayos electrorifle
        for i = #ataques.rayosElectrorifle, 1, -1 do
            local r = ataques.rayosElectrorifle[i]
            r.vida = r.vida - 1
            if r.vida <= 0 then table.remove(ataques.rayosElectrorifle, i) 
            else local x, y, xf, yf = r.x_inicio, r.y_inicio, r.x_fin, r.y_fin
                for j = 1, 10 do
                    local xs, ys = x + (xf - x)/10 * j + math.random(-2, 2), y + (yf - y)/10 * j + math.random(-2, 2)
                    line(x, y, xs, ys, j % 3 == 0 and 10 or 9)
                    x, y = xs, ys
                end
            end
        end

        -- Disparos normales
        for i = #ataques.disparos, 1, -1 do
            local d = ataques.disparos[i]
            d.x, d.y = d.x + d.dx, d.y + d.dy
            local sx, sy = d.x + bx, d.y + by
            if d.tipo == "pistola" then circ(sx, sy, 2, 7) circ(sx, sy, 1, 6)
            elseif d.tipo == "ak47" then line(sx - 3, sy, sx + 3, sy, 8) line(sx - 2, sy, sx + 2, sy, 7)
            elseif d.tipo == "bazooka" then r(sx - 4, sy - 2, 8, 4, 9) r(sx - 5, sy - 1, 1, 2, 8)
            elseif d.tipo == "escopeta" then for j = 1, 5 do circ(sx + math.random(-3, 3), sy + math.random(-3, 3), 1, 10) end
            end
        end

        -- Granadas
        for i = #ataques.granadas, 1, -1 do
            local g = ataques.granadas[i]
            g.x, g.y, g.dy = g.x + g.dx, g.y + g.dy, g.dy + 0.1
            if g.y > 136 then table.remove(ataques.granadas, i) 
            else
                local sx, sy = g.x - camara.posicion.x, g.y - camara.posicion.y
                circ(sx, sy, 4, 6)
                if g.tiempo % 10 < 5 then circ(sx + 2, sy - 2, 1, 2) end
            end
        end

        -- Minigun
        for i = #ataques.balasMinigun, 1, -1 do
            local b = ataques.balasMinigun[i]
            b.x, b.y, b.vida = b.x + b.dx, b.y + b.dy, b.vida - 1
            if b.vida <= 0 then table.remove(ataques.balasMinigun, i) 
            else for j = 0, 8 do pix(b.x + j, b.y, j < 4 and 8 or 7) end
            end
        end

        -- Láser
        if gestionArmas.armasDisparadas.disparandoLaser then
            local sx, sy = jugador.x + bx + 8, jugador.y + by + 8
            line(sx, sy, sx + gestionArmas.laser.longitud, sy, 2)
        end

        -- Lanzallamas
        for i = #ataques.disparosLanzallamas, 1, -1 do
            local l = ataques.disparosLanzallamas[i]
            l.x, l.y = l.x + l.dx, l.y + l.dy
            circ(l.x, l.y, 5, 2)
        end
    end

    -- === MODO COLISIONES ===
    if modo == "colisiones" then
        local modoDebug = select(1, ...) or false
        
        -- Función interna para verificar colisiones
        local function verificarColision(tipo, x1, y1, x2, y2, rx, ry, rw, rh)
            -- Verificar si un punto está dentro de un rectángulo
            local function puntoDentroRectangulo(px, py, rx, ry, rw, rh) return px >= rx and px <= rx + rw and py >= ry and py <= ry + rh
            end

            -- Verificar si dos líneas se intersectan
            local function lineaIntersectaLinea(x1, y1, x2, y2, x3, y3, x4, y4)
                local function orientacion(a, b, c) return (b.y - a.y) * (c.x - b.x) - (b.x - a.x) * (c.y - b.y) end

                local o1 = orientacion({x = x1, y = y1}, {x = x2, y = y2}, {x = x3, y = y3})
                local o2 = orientacion({x = x1, y = y1}, {x = x2, y = y2}, {x = x4, y = y4})
                local o3 = orientacion({x = x3, y = y3}, {x = x4, y = y4}, {x = x1, y = y1})
                local o4 = orientacion({x = x3, y = y3}, {x = x4, y = y4}, {x = x2, y = y2})

                return (o1 * o2 < 0) and (o3 * o4 < 0)
            end

            -- Lógica principal de verificación de colisiones
            if tipo == "puntoRectangulo" then return puntoDentroRectangulo(x1, y1, rx, ry, rw, rh)
            elseif tipo == "lineaRectangulo" then
                -- Verificar puntos extremos
                if puntoDentroRectangulo(x1, y1, rx, ry, rw, rh) or puntoDentroRectangulo(x2, y2, rx, ry, rw, rh) then return true end

                -- Verificar intersecciones con bordes del rectángulo ( superior,derecho,inferior,izquierdo)
                local bordes = {{x1 = rx, y1 = ry, x2 = rx + rw, y2 = ry},{x1 = rx + rw, y1 = ry, x2 = rx + rw, y2 = ry + rh},
                    {x1 = rx, y1 = ry + rh, x2 = rx + rw, y2 = ry + rh},{x1 = rx, y1 = ry, x2 = rx, y2 = ry + rh}}

                for _, borde in ipairs(bordes) do
                    if lineaIntersectaLinea(x1, y1, x2, y2, borde.x1, borde.y1, borde.x2, borde.y2) then return true end
                end
            elseif tipo == "lineaLinea" then return lineaIntersectaLinea(x1, y1, x2, y2, rx, ry, x1, y1) end

            return false
        end

        -- Función genérica para verificar colisiones de armas
        local function verificar(proyectiles, ajustarCamara, funcionColision, efectoEspecial)
            for i = #proyectiles, 1, -1 do
                local proyectil = proyectiles[i]
                
                for j = #todoJuego.cochesEnemigos, 1, -1 do
                    local enemigo = todoJuego.cochesEnemigos[j]
                    
                    if funcionColision(proyectil, enemigo) then
                        local enemigo_x = enemigo.x - (ajustarCamara and todoJuego.estadoJugador.camara.posicion.x or 0)
                        local enemigo_y = enemigo.y - (ajustarCamara and todoJuego.estadoJugador.camara.posicion.y or 0)

                        -- Efectos visuales
                        gestionarEfectosYExplosiones("crear_efecto", enemigo.x + enemigo.width/2, enemigo.y + enemigo.height/2, "sangre")
                        gestionarEfectosYExplosiones("crear_explosion", enemigo.x + enemigo.width/2, enemigo.y + enemigo.height/2, {radioInicial = 2, duracion = 25})
                        
                        -- Efecto especial si existe
                        if efectoEspecial then efectoEspecial(enemigo) end

                        table.remove(proyectiles, i);table.remove(todoJuego.cochesEnemigos, j) -- Eliminar proyectil y enemigo
                        break
                    end
                end
            end
        end

        -- Balas normales
        verificar(todoJuego.gestionArmas.ataques.disparos, false, function(bala, enemigo)
            return verificarColision("puntoRectangulo", bala.x, bala.y, nil, nil, enemigo.x, enemigo.y, 8, 8)
        end)

        -- Minigun
        verificar(todoJuego.gestionArmas.ataques.balasMinigun, true, function(bala, enemigo)
            local balaX = bala.x + todoJuego.estadoJugador.camara.posicion.x
            local balaY = bala.y + todoJuego.estadoJugador.camara.posicion.y
            return verificarColision("puntoRectangulo", balaX, balaY, nil, nil, enemigo.x, enemigo.y, 8, 8)
        end)

        -- Electrorifle
        verificar(todoJuego.gestionArmas.ataques.rayosElectrorifle, true, function(rayo, enemigo)
            local x1 = rayo.x_inicio + todoJuego.estadoJugador.camara.posicion.x
            local y1 = rayo.y_inicio + todoJuego.estadoJugador.camara.posicion.y
            local x2 = rayo.x_fin + todoJuego.estadoJugador.camara.posicion.x
            local y2 = rayo.y_fin + todoJuego.estadoJugador.camara.posicion.y
            
            return verificarColision("lineaRectangulo", x1, y1, x2, y2, enemigo.x, enemigo.y, 16, 16)
        end)

        -- Lanzallamas
        verificar(todoJuego.gestionArmas.ataques.disparosLanzallamas, true, function(llama, enemigo)
            local llama_x = llama.x + todoJuego.estadoJugador.camara.posicion.x
            local llama_y = llama.y + todoJuego.estadoJugador.camara.posicion.y
            return verificarColision("puntoRectangulo", llama_x, llama_y, nil, nil, enemigo.x, enemigo.y, 16, 16)
        end)

        -- Láser
        if todoJuego.gestionArmas.armasDisparadas.disparandoLaser then
            local x_inicio = todoJuego.estadoJugador.jugador.x - todoJuego.estadoJugador.camara.posicion.x + 8
            local y_inicio = todoJuego.estadoJugador.jugador.y - todoJuego.estadoJugador.camara.posicion.y + 8
            local x_fin,y_fin = x_inicio + todoJuego.gestionArmas.laser.longitud,y_inicio
            
            for j = #todoJuego.cochesEnemigos, 1, -1 do
                local enemigo = todoJuego.cochesEnemigos[j]
                local enemigo_x = enemigo.x - todoJuego.estadoJugador.camara.posicion.x
                local enemigo_y = enemigo.y - todoJuego.estadoJugador.camara.posicion.y
                
                if verificarColision("lineaRectangulo", x_inicio, y_inicio, x_fin, y_fin, enemigo_x, enemigo_y, 16, 16) then
                    gestionarEfectosYExplosiones("crear_efecto", enemigo_x, enemigo_y, "sangre")
                    gestionarEfectosYExplosiones("crear_explosion", enemigo_x, enemigo_y, {radioInicial = 2, duracion = 25})
                    table.remove(todoJuego.cochesEnemigos, j)
                end
            end
        end

        -- Katana
        for i = #todoJuego.gestionArmas.ataques.cortesKatana, 1, -1 do
            local corte = todoJuego.gestionArmas.ataques.cortesKatana[i]
            local x_fin = corte.x_inicio + math.cos(corte.angulo) * todoJuego.gestionArmas.katana.longitudCorte
            local y_fin = corte.y_inicio + math.sin(corte.angulo) * todoJuego.gestionArmas.katana.longitudCorte
            
            for j = #todoJuego.cochesEnemigos, 1, -1 do
                local enemigo = todoJuego.cochesEnemigos[j]
                local enemigo_x = enemigo.x - todoJuego.estadoJugador.camara.posicion.x
                local enemigo_y = enemigo.y - todoJuego.estadoJugador.camara.posicion.y
                
                if verificarColision("lineaRectangulo", corte.x_inicio, corte.y_inicio, x_fin, y_fin, enemigo_x, enemigo_y, 16, 16) then
                    gestionarEfectosYExplosiones("crear_efecto", enemigo_x, enemigo_y, "sangre")
                    gestionarEfectosYExplosiones("crear_explosion", enemigo_x, enemigo_y, {radioInicial = 2, duracion = 25})
                    table.remove(todoJuego.cochesEnemigos, j);table.remove(todoJuego.gestionArmas.ataques.cortesKatana, i)
                    break
                end
            end
        end

        -- Golpes
        verificar(todoJuego.gestionArmas.ataques.golpes, false, function(golpe, enemigo)
            return verificarColision("puntoRectangulo", golpe.x, golpe.y, nil, nil, enemigo.x, enemigo.y, 8, 8) end)

        -- Granadas
        verificar(todoJuego.gestionArmas.ataques.granadas, false, function(granada, enemigo)
            return verificarColision("puntoRectangulo", granada.x, granada.y, nil, nil, enemigo.x, enemigo.y, 8, 8) end)

        -- Dibujar hitboxes si modoDebug es true
        if modoDebug then
            local c,colors = todoJuego.estadoJugador.camara.posicion,{ enemigo = 8, bala = 11, area = 13, linea = 10, especial = 12 }
            
            -- 1. Enemigos
            for _, e in ipairs(todoJuego.cochesEnemigos) do rectb(e.x - c.x, e.y - c.y, 16, 16, colors.enemigo) end
            
            -- 2. Balas normales
            for _, b in ipairs(todoJuego.gestionArmas.ataques.disparos) do circ(b.x - c.x, b.y - c.y, 2, colors.bala) end
            
            -- 3. Minigun
            for _, b in ipairs(todoJuego.gestionArmas.ataques.balasMinigun) do circ(b.x, b.y, 1, colors.bala) end
            
            -- 4. Electrorifle
            for _, r in ipairs(todoJuego.gestionArmas.ataques.rayosElectrorifle) do
                line(r.x_inicio, r.y_inicio, r.x_fin, r.y_fin, colors.linea)
                circ(r.x_inicio, r.y_inicio, 2, colors.especial) circ(r.x_fin, r.y_fin, 2, colors.especial)
            end
            
            -- 5. Lanzallamas
            for _, l in ipairs(todoJuego.gestionArmas.ataques.disparosLanzallamas) do circ(l.x, l.y, 3, colors.linea) end
            
            -- 6. Láser
            if todoJuego.gestionArmas.armasDisparadas.disparandoLaser then
                local x1,y1 = todoJuego.estadoJugador.jugador.x - c.x + 8,todoJuego.estadoJugador.jugador.y - c.y + 8
                line(x1, y1, x1 + todoJuego.gestionArmas.laser.longitud, y1, colors.especial)
                circ(x1, y1, 3, colors.especial)
            end
            
            -- 7. Katana
            for _, k in ipairs(todoJuego.gestionArmas.ataques.cortesKatana) do
                local x2 = k.x_inicio + math.cos(k.angulo) * todoJuego.gestionArmas.katana.longitudCorte
                local y2 = k.y_inicio + math.sin(k.angulo) * todoJuego.gestionArmas.katana.longitudCorte
                line(k.x_inicio, k.y_inicio, x2, y2, colors.linea)
                ellib((k.x_inicio + x2)/2, (k.y_inicio + y2)/2, math.sqrt((x2 - k.x_inicio)^2 + (y2 - k.y_inicio)^2), 10, colors.area)
            end
            
            -- 8. Golpes
            for _, g in ipairs(todoJuego.gestionArmas.ataques.golpes) do circ(g.x - c.x, g.y - c.y, 6, colors.area) end
            
            -- 9. Granadas
            for _, gr in ipairs(todoJuego.gestionArmas.ataques.granadas) do
                circ(gr.x - c.x, gr.y - c.y, 4, colors.bala)
                if gr.y > 136 then circ(gr.x - c.x, gr.y - c.y, 20, colors.especial) end
            end
            
            -- Debug info
            print("HITBOXES ACTIVADOS", 160, 80, 45);print("Rojo: Enemigos", 160, 50, colors.enemigo)
            print("Cian: Balas", 160, 60, colors.bala);print("Verde: Rayos", 160, 70, colors.linea)
            print("Amarillo: Especial", 160, 80, colors.especial);print("Rosa: Areas", 160, 90, colors.area)
        end
    end

    -- === MODO FRASES ===
    if modo == "frases" then
        -- Variables globales para el sistema de frases
        _G.nuevoContador,_G.fraseAleatoria, _G.colorOffset = _G.nuevoContador or 0,_G.fraseAleatoria or "",_G.colorOffset or 0
        _G.frasesArmas = _G.frasesArmas or { frasesPistola = {"Bang!", "Pum!", "Disparo certero!", "Toma esto!", "Headshot!"},
            frasesAK47 = {"Ratatata!", "Rafaga letal!", "A full metal!", "Disparando!", "Ataque sostenido!"},
            frasesBazooka = {"BOOM!", "Kaboom!", "Explosion!", "Impacto directo!", "Al blanco!"},
            frasesEscopeta = {"Pum Pum!", "Doble impacto!", "A quemarropa!", "Dispersion mortal!", "Plomo!"},
            frasesGranadas = {"Granada fuera!", "Frag out!", "Explosion en 3... 2... 1!", "Cuidado abajo!", "Boom!"},
            frasesGolpe = {"Golpe certero!", "Uppercut!", "Directo al higado!", "Combo!", "Knockout!"},
            frasesElectrorifle = {"Zzzap!", "Electrocutando!", "Carga maxima!", "Cortocircuito!", "Descarga!"},
            frasesLaser = {"Pew Pew!", "Laser activado!", "Haz de energia!", "Zzzap laser!", "Precision absoluta!"},
            frasesKatana = {"Slash!", "Corte rapido!", "Iai jutsu!", "Filocorto!", "Tajo mortal!"},
            frasesLanzallamas = {"Fwooosh!", "Quemando!", "Incinera!", "Llama purificadora!", "Calor intenso!"},
            frasesMinigun = {"Brrrrrrt!", "A toda mecha!", "Supresion de fuego!", "Tormenta de plomo!", "Aniquilacion!"} }

        -- Incrementar contadores
        _G.nuevoContador = _G.nuevoContador + 1
        _G.colorOffset = _G.colorOffset + 0.2

        -- Detección de disparo optimizada
        local armas = { [1] = {check = todoJuego.gestionArmas.municion.pistola > 0, frases = _G.frasesArmas.frasesPistola},
            [2] = {check = todoJuego.gestionArmas.municion.ak47 > 0, frases = _G.frasesArmas.frasesAK47},
            [3] = {check = todoJuego.gestionArmas.municion.bazooka > 0, frases = _G.frasesArmas.frasesBazooka},
            [4] = {check = todoJuego.gestionArmas.municion.escopeta > 0, frases = _G.frasesArmas.frasesEscopeta},
            [5] = {check = todoJuego.gestionArmas.municion.granadas > 0, frases = _G.frasesArmas.frasesGranadas},
            [6] = {check = true, frases = _G.frasesArmas.frasesGolpe},
            [7] = {check = todoJuego.gestionArmas.municion.electrorifle > 0, frases = _G.frasesArmas.frasesElectrorifle},
            [8] = {check = todoJuego.gestionArmas.municion.laser > 0, frases = _G.frasesArmas.frasesLaser},
            [9] = {check = true, frases = _G.frasesArmas.frasesKatana},
            [10] = {check = todoJuego.gestionArmas.municion.lanzallamas > 0, frases = _G.frasesArmas.frasesLanzallamas},
            [11] = {check = todoJuego.gestionArmas.municion.minigun > 0, frases = _G.frasesArmas.frasesMinigun} }

        if btnp(5) and armas[todoJuego.gestionArmas.armaActual] and armas[todoJuego.gestionArmas.armaActual].check then
            _G.fraseAleatoria = armas[todoJuego.gestionArmas.armaActual].frases[math.random(#armas[todoJuego.gestionArmas.armaActual].frases)]
            _G.nuevoContador = 0 end

        -- Mostrar frase
        if _G.fraseAleatoria ~= "" and _G.nuevoContador < 120 then
            local textWidth = #_G.fraseAleatoria * 6 - 2
            local padding = 1
            local rectX, rectY = 40 - padding, 40 - padding
            local rectW, rectH = textWidth + padding * 2, 8 + padding * 2

            -- Dibujar fondo
            rect(rectX, rectY, rectX + rectW-40, rectY + rectH-40, 0)
            
            -- Función color arcoíris optimizada
            local function rainbowColor(idx) return (math.floor(idx) % 15) + 1 end

            -- Dibujar borde optimizado
            for i = 0, 3 do
                local colorBase = rainbowColor(_G.colorOffset + i * 4)
                for x = rectX - i, rectX + rectW + i do
                    pix(x, rectY - i, rainbowColor(colorBase + (x - rectX) / 4))
                    pix(x, rectY + rectH + i, rainbowColor(colorBase + (x - rectX) / 4))
                end
                for y = rectY - i, rectY + rectH + i do
                    pix(rectX - i, y, rainbowColor(colorBase + (y - rectY) / 4))
                    pix(rectX + rectW + i, y, rainbowColor(colorBase + (y - rectY) / 4))
                end
            end

            -- Texto arcoíris
            for i = 1, #_G.fraseAleatoria do print(_G.fraseAleatoria:sub(i, i), 40 + (i-1)*6, 40, rainbowColor(_G.colorOffset + i)) end
        elseif _G.nuevoContador >= 120 then _G.fraseAleatoria = "" end
    end
end

function gestionarEntidades()
    -- Cache de variables frecuentemente accedidas
    local estadoJugador, camara, ciudadJuego, efectosVisuales, gestionMisiones = 
    todoJuego.estadoJugador,todoJuego.estadoJugador.camara,todoJuego.ciudadJuego,todoJuego.efectosVisuales,todoJuego.gestionMisionStuntman
    
    -- Configuración común
    local camaraX, camaraY,offsetX = camara.posicion.x, camara.posicion.y,100 - camara.posicion.x
    
    -- === ENTIDADES DINÁMICAS ===
    local entidades = {
        globo = {
            necesitaInicializacion = not globo,
            datos = globo or {x=-100, y=-50, speed=1, estado="derecha"},
            actualizar = function(self)
                local d = self.datos
                if d.estado == "derecha" then d.x = math.min(d.x + d.speed, 750)
                    if d.x == 750 then d.estado = "abajo" end
                elseif d.estado == "abajo" then d.y = math.min(d.y + d.speed, 550)
                    if d.y == 550 then d.estado = "izquierda" end
                elseif d.estado == "izquierda" then d.x = math.max(d.x - d.speed, -200)
                    if d.x == -200 then d.estado = "arriba" end
                elseif d.estado == "arriba" then d.y = math.max(d.y - d.speed, -50)
                    if d.y == -50 then d.estado = "derecha" end
                end
                globo = d
            end,
            dibujar = function(self)
                local x, y = self.datos.x + offsetX, self.datos.y - camaraY
                s(495, x, y, 0, 3);s(511, x + 4, y + 24, 0, 2);s(259, x + 7, y + 27, 1)
                
                -- Fuego optimizado
                local fuego_x, fuego_y = x + 11, y + 26
                for _ = 0, 8 do
                    local px, py = fuego_x + math.random(-2, 2), fuego_y + math.random(-3, -1)
                    local color = ({2, 3, 4})[math.random(3)]
                    pix(px, py, color);pix(px + 1, py + 1, color)
                end
            end
        },
        
        peces = { necesitaInicializacion = not fishes,
            datos = fishes or { {x=20, y=-20, speed_x=0.6, flip=false, vertical=false, min_x=20, max_x=643},
                {x=750, y=8, speed_y=0.5, flip=false, vertical=true, min_y=8, max_y=559},
                {x=0, y=579, speed_x=0.4, flip=false, vertical=false, min_x=0, max_x=632},
                {x=-200, y=18, speed_y=0.4, flip=false, vertical=true, min_y=18, max_y=240}},
            actualizar = function(self)
                for _, fish in ipairs(self.datos) do
                    fish.x,fish.y = fish.x + (fish.speed_x or 0),fish.y + (fish.speed_y or 0)
                    
                    if fish.vertical then
                        if fish.y >= fish.max_y or fish.y <= fish.min_y then fish.speed_y = -fish.speed_y
                    end
                    else
                        if fish.x >= fish.max_x or fish.x <= fish.min_x then fish.speed_x,fish.flip = -fish.speed_x,fish.x >= fish.max_x
                        end
                    end
                end
                fishes = self.datos
            end,
            dibujar = function(self)
                for _, fish in ipairs(self.datos) do s(452, fish.x + offsetX, fish.y - camaraY, 0, 1, fish.flip) end
            end
        },
        
        aviones = { necesitaInicializacion = not airplane,
            datos = { avion1 = airplane or {x=-20, y=-30, speed=1.5, width=16, message="#VivaLaMonogamia", flip=false},
                avion2 = airplane2 or {x=850, y=580, speed=-1.5, width=16, message="oitallefonceT", flip=true} },
            inicializar = function(self)
                for _, avion in pairs(self.datos) do
                    avion.chars = {}
                    for i = 1, #avion.message do
                        avion.chars[i] = { char = avion.message:sub(i,i),offset = (i-1)*9,y_offset = -5,alpha = 15 }
                    end
                end
                airplane, airplane2 = self.datos.avion1, self.datos.avion2
            end,
            actualizar = function(self)
                for _, avion in pairs(self.datos) do
                    avion.x = avion.x + avion.speed
                    if avion.flip then if avion.x <= -(#avion.message * 6 + 32*8) then avion.x = 850 end
                    else if avion.x >= 850 then avion.x = -100 end
                    end
                end
                airplane, airplane2 = self.datos.avion1, self.datos.avion2
            end,
            dibujar = function(self)
                for _, avion in pairs(self.datos) do
                    local x, y = avion.x + offsetX, avion.y - camaraY
                    if avion.flip then
                        s(378, x, y, 0, 2, 1);s(377, x + avion.width, y, 0, 2, 1)
                        local msg = avion.message:reverse()
                        r(x + 32, y + 5, #msg*6, 5, 0)
                        p(msg, x + 32, y + 5, 4)
                    else
                        s(377, x, y, 0, 2);s(378, x + avion.width, y, 0, 2)
                        r(x - 90, y + 5, 90, 5, 0)
                        p(avion.message, x - 90, y + 5, 4)
                    end
                end
            end
        },
        
        lancha = { necesitaInicializacion = not lancha, datos = lancha or {x=50, y=-30, speed=1, estado="izquierda", posicion=2},
            actualizar = function(self)
                local d = self.datos
                local pasajeroX, pasajeroY, fx, fy = 0, 0, 0, 0

                if d.estado == "abajo" then
                    d.y = math.min(d.y + d.speed, 550)
                    pasajeroX, pasajeroY, fx, fy = -10, 2, 8, 16
                    if d.y == 550 then d.estado, d.posicion = "derecha", 0 end
                elseif d.estado == "derecha" then
                    d.x = math.min(d.x + d.speed, 750)
                    pasajeroX, fx, fy = -5, -4, 8
                    if d.x == 750 then d.estado, d.posicion = "arriba", 3 end
                elseif d.estado == "arriba" then
                    d.y = math.max(d.y - d.speed, -50)
                    pasajeroX, pasajeroY, fx, fy = -10, 10, 8, -4
                    if d.y == -50 then d.estado, d.posicion = "izquierda", 2 end
                elseif d.estado == "izquierda" then
                    d.x = math.max(d.x - d.speed, -250)
                    pasajeroX, fx, fy = 5, 20, 8
                    if d.x == -250 then d.estado, d.posicion = "abajo", 1 end
                end

                d.pasajeroX, d.pasajeroY, d.fx, d.fy = pasajeroX, pasajeroY, fx, fy

                -- Partículas de agua optimizadas
                if time() % 0.05 < 0.03 then
                    table.insert(efectosVisuales.particulasAgua, { x = d.x + fx,y = d.y + fy,
                        dx = (math.random() - 0.5) * 0.5,dy = (math.random() - 0.2) * 0.5,vida = 30,color = 12})
                end
                lancha = d
            end,
            dibujar = function(self)
                local particulas = efectosVisuales.particulasAgua
                for i = #particulas, 1, -1 do
                    local p = particulas[i]
                    p.x, p.y = p.x + p.dx, p.y + p.dy
                    p.dy, p.vida = p.dy + 0.01, p.vida - 1
                    if p.vida > 0 then pix(p.x + offsetX, p.y - camaraY, p.color)
                    else table.remove(particulas, i)
                    end
                end

                local d = self.datos
                local x, y = d.x + offsetX, d.y - camaraY
                s(440, x, y, 0, 2, 0, d.posicion, 2,1);s(263, x + 15 + d.pasajeroX, y + 2 + d.pasajeroY, 1)
            end
        },
        
        tren = { necesitaInicializacion = not ciudadJuego.trenEstado,
            config = { y = 164,velocidad = 0.6, sprites = {390, 391, 391, 391},limiteIzq = 540,limiteDer = 650,
                colorHumo = 15,humoIntensidad = 0.15,humoVidaBase = 240,humoEscala = 1, radioInteraccion = 45,anchoVagon = 10 },
            inicializar = function(self)
                ciudadJuego.trenEstado = ciudadJuego.trenEstado or {x = 540,direccion = 1,animOffset = 0,tiempoHumo = 0,particulasHumo = {}
                }
            end,
            actualizar = function(self)
                local trenEstado,config = ciudadJuego.trenEstado,self.config
                
                -- Movimiento del tren
                trenEstado.x = trenEstado.x + config.velocidad * trenEstado.direccion
                
                -- Cambio de dirección
                if trenEstado.x > config.limiteDer then trenEstado.direccion = -1
                elseif trenEstado.x < config.limiteIzq then trenEstado.direccion = 1 end
                
                -- Animación de balanceo
                trenEstado.animOffset = math.sin(time() * 2) * 0.5
                
                -- Generación de humo
                trenEstado.tiempoHumo = trenEstado.tiempoHumo + 1
                if trenEstado.direccion == 1 and trenEstado.tiempoHumo % 4 == 0 then
                    for i = 1, 2 do
                        table.insert(trenEstado.particulasHumo, {
                            x = trenEstado.x - 15 + math.random(-3, 3),y = config.y - 5 + math.random(-4, 4),
                            vida = config.humoVidaBase * (0.8 + math.random() * 0.4),
                            size = 0.5 + math.random(),alpha = 10 + math.random(4),
                            velX = -0.2 + math.random() * 0.4,velY = -0.4 - math.random() * 0.3})
                    end
                end
            end,
            dibujar = function(self)
                local trenEstado,config = ciudadJuego.trenEstado,self.config
                
                -- Dibujar humo
                for i = #trenEstado.particulasHumo, 1, -1 do
                    local p = trenEstado.particulasHumo[i]
                    p.vida,p.alpha = p.vida - 1,p.alpha - 0.04
                    p.x,p.y = p.x + p.velX,p.y + p.velY
                    
                    local screenX,screenY = p.x - camaraX,p.y - camaraY
                    
                    if p.vida <= 0 or p.alpha <= 0 or screenX < -20 or screenX > 148 or screenY < -20 or screenY > 148 then
                        table.remove(trenEstado.particulasHumo, i)
                    elseif estadoJugador.jugador.vehiculo ~= "Tren" then
                        local alpha = math.min(15, math.floor(p.alpha))
                        local col = config.colorHumo + (p.vida % 3)
                        circ(screenX, screenY, p.size * config.humoEscala, alpha)
                    end
                end
                
                -- Dibujar tren (si el jugador no está en él)
                if estadoJugador.jugador.vehiculo ~= "Tren" then
                    for i, spriteId in ipairs(config.sprites) do
                        local offsetX = (i-1) * -config.anchoVagon
                        s(spriteId, 
                            trenEstado.x + offsetX - camaraX, 
                            config.y + trenEstado.animOffset - camaraY, 
                            0)
                    end
                end
            end,
            interactuar = function(self)
                local config = self.config
                local dxTren,dyTren = estadoJugador.jugador.x - ciudadJuego.trenEstado.x,estadoJugador.jugador.y - config.y
                local distanciaTren = math.sqrt(dxTren^2 + dyTren^2)
                
                if distanciaTren < config.radioInteraccion then
                    r(40, 40, 70, 10, 0)
                    p("Tren", 40, 40, 7)
                    
                    if btn(5) then gestionMisiones.booleanos.jugadorEstaEnVehiculo = true estadoJugador.jugador.vehiculo = "Tren" end
                end
            end
        }
    }

    -- === PROCESAMIENTO DE ENTIDADES ===
    for nombre, entidad in pairs(entidades) do
        if entidad.necesitaInicializacion and entidad.inicializar then entidad:inicializar() entidad.necesitaInicializacion = false end
        if entidad.actualizar then entidad:actualizar() end
        if entidad.dibujar then entidad:dibujar() end
        if nombre == "tren" and entidad.interactuar then entidad:interactuar() end -- Interacción (solo para el tren)
    end
end

function gestionarVehiculos(tipo)
    -- Configuración común
    local MAP_WIDTH, MAP_TILES, TAMANO_TILE, segundoAnimacion = 1920, 1920 / 8, 8, math.random(0, 1)
    
    -- Función para dibujar vehículos especiales
    local function dibujarVehiculosEspeciales()

        local offset = todoJuego.estadoJugador.camara.offset
        local vehiculos = { {nombre="Avión", sprite=377, x=-150-offset.x+100, y=305-offset.y+48, w=2, h=1, scaleX=2, scaleY=1},
         {nombre="Jet de Combate", sprite=427, x=-150-offset.x+100, y=346-offset.y+48, w=4, h=1, scaleX=2, scaleY=1},
         {nombre="Monster Casta", sprite=350, x=410-offset.x+100, y=460-offset.y+48, w=2, h=1, scaleX=2, scaleY=1},
         {nombre="Lancha Kurro", sprite=440, x=172-offset.x+100, y=324-offset.y+48, w=2, h=1, scaleX=2, scaleY=1},
         {nombre="Globo", sprite={495,511}, x=-100-offset.x+100, y=-96-offset.y+48, x2Offset=4, y2Offset=25, scale1=3, scale2=2}}

        for _, vehiculo in ipairs(vehiculos) do
            if todoJuego.estadoJugador.jugador.vehiculo ~= vehiculo.nombre then
                if vehiculo.nombre == "Globo" then
                    s(vehiculo.sprite[1], vehiculo.x, vehiculo.y, 0, vehiculo.scale1, 0, 0)
                    s(vehiculo.sprite[2], vehiculo.x + vehiculo.x2Offset, vehiculo.y + vehiculo.y2Offset, 0, vehiculo.scale2, 0, 0)
                else s(vehiculo.sprite, vehiculo.x, vehiculo.y, 0, vehiculo.scaleX, 0, 0, vehiculo.w, vehiculo.h) end
            end

            local objetoX,objetoY = vehiculo.x + todoJuego.estadoJugador.camara.posicion.x
            local objetoY = vehiculo.y + todoJuego.estadoJugador.camara.posicion.y
            local dx,dy = todoJuego.estadoJugador.jugador.x - objetoX,todoJuego.estadoJugador.jugador.y - objetoY
            local distancia = math.sqrt(dx * dx + dy * dy)

            if distancia < 25 then
                r(40, 40, 70, 10, 0)
                p(vehiculo.nombre, 40, 40, 7)
                
                if btn(5) then
                    todoJuego.gestionMisionStuntman.booleanos.jugadorEstaEnVehiculo = true
                    todoJuego.estadoJugador.jugador.vehiculo = vehiculo.nombre
                end
            end
        end
        
        s(259, -5 - todoJuego.estadoJugador.camara.offset.x + 100, -5 - todoJuego.estadoJugador.camara.offset.y + 48, 3) 
    end

    -- Función para dibujar tráfico
    local function dibujarTrafico()
        for i, coche in ipairs(todoJuego.ciudadJuego.trafico) do
            local dx,dy = coche.x - todoJuego.estadoJugador.jugador.x,coche.y - todoJuego.estadoJugador.jugador.y
            local distancia = dx * dx + dy * dy

            if distancia < 12 * 12 then
                r(coche.x - todoJuego.estadoJugador.camara.offset.x + 100,
                     coche.y - todoJuego.estadoJugador.camara.offset.y + 38,
                     90, 10, 0)
                p(coche.nombre or "Vehículo", 
                      coche.x - todoJuego.estadoJugador.camara.offset.x + 100, 
                      coche.y - todoJuego.estadoJugador.camara.offset.y + 38, 4)
                
                if btnp(5) then
                    todoJuego.gestionMisionStuntman.booleanos.jugadorEstaEnVehiculo = true
                    todoJuego.estadoJugador.jugador.vehiculo = coche.nombre
                    if coche.sprites == nil then spriteVehiculo = coche.sprite end
                    if coche.sprite == nil then spriteVehiculo = coche.sprites end
                end
            end

            local tileX,tileY = math.floor(coche.x / TAMANO_TILE) % MAP_TILES,math.floor(coche.y / TAMANO_TILE)

        -- Asignar calle actual si no tiene
        if not coche.calle then
            for _, calle in ipairs(todoJuego.ciudadJuego.calles) do
                local calleX1,calleX2 = calle.x1 % MAP_TILES,calle.x2 % MAP_TILES

                if tileY >= calle.y1 and tileY <= calle.y2 then
                    if calleX1 <= calleX2 then
                        if tileX >= calleX1 and tileX <= calleX2 then coche.calle,coche.orientacion = calle,calle.orientacion break end
                    else
                        if tileX >= calleX1 or tileX <= calleX2 then coche.calle,coche.orientacion = calle,calle.orientacion break end
                    end
                end
            end
        end

        -- Movimiento
        if coche.calle then
            if coche.orientacion == "horizontal" then
                coche.x = coche.x + coche.direccion * coche.velocidad
                if coche.x < 0 then coche.x = MAP_WIDTH - 1
                elseif coche.x >= MAP_WIDTH then coche.x = 0 end
            else
                coche.y = coche.y + coche.direccion * coche.velocidad
                coche.y = math.max(0, math.min(119 * TAMANO_TILE, coche.y))
            end
        end

        local currentTileX,currentTileY = math.floor(coche.x / TAMANO_TILE) % MAP_TILES,math.floor(coche.y / TAMANO_TILE)

        -- Detectar intersección
        local calleInterseccion = nil
        for _, calle in ipairs(todoJuego.ciudadJuego.calles) do
            if coche.calle and calle ~= coche.calle and calle.orientacion ~= coche.orientacion then
                if coche.orientacion == "horizontal" and calle.orientacion == "vertical" then
                    local diffX = math.abs(currentTileX - (calle.x1 % MAP_TILES))
                    if (diffX <= 1 or diffX >= MAP_TILES - 1) and currentTileY >= calle.y1 and currentTileY <= calle.y2 then
                        calleInterseccion = calle
                        break
                    end
                elseif coche.orientacion == "vertical" and calle.orientacion == "horizontal" then
                    local calleX1,calleX2 = calle.x1 % MAP_TILES,calle.x2 % MAP_TILES
                    if currentTileY >= calle.y1 and currentTileY <= calle.y2 then
                        if calleX1 <= calleX2 then
                        if currentTileX >= calleX1 and currentTileX <= calleX2 then calleInterseccion = calle break end
                        else if currentTileX >= calleX1 or currentTileX <= calleX2 then calleInterseccion = calle break end end
                    end
                end
            end
        end

        -- Probabilidad de cambiar de calle
        if calleInterseccion and math.random(100) == 50 then
            coche.calle,coche.orientacion = calleInterseccion,calleInterseccion.orientacion
            if coche.orientacion == "vertical" then
                coche.x = calleInterseccion.x1 * TAMANO_TILE
                coche.direccion = math.random(0, 1) == 0 and -1 or 1
            else
                coche.y = calleInterseccion.y1 * TAMANO_TILE
                coche.direccion = math.random(0, 1) == 0 and -1 or 1
            end
        end

        -- Detectar si llega al final de calle
        local enLimite = false
        if coche.calle then
            if coche.orientacion == "horizontal" then
                if coche.calle.x1 > coche.calle.x2 then
                    enLimite = (coche.direccion > 0 and currentTileX == coche.calle.x2) or
                               (coche.direccion < 0 and currentTileX == coche.calle.x1)
                else
                    enLimite = (coche.direccion > 0 and currentTileX >= coche.calle.x2) or
                               (coche.direccion < 0 and currentTileX <= coche.calle.x1)
                end
            else
                enLimite = (coche.direccion > 0 and currentTileY >= coche.calle.y2) or
                           (coche.direccion < 0 and currentTileY <= coche.calle.y1)
            end
        end

        if enLimite then
            local callesPosibles = {}

            for _, calle in ipairs(todoJuego.ciudadJuego.calles) do
                if calle ~= coche.calle and calle.orientacion ~= coche.orientacion then
                    if coche.orientacion == "horizontal" and calle.orientacion == "vertical" then
                        local diffX = math.abs(currentTileX - (calle.x1 % MAP_TILES))
                        if (diffX <= 1 or diffX >= MAP_TILES - 1) and currentTileY >= calle.y1 and currentTileY <= calle.y2 then
                            table.insert(callesPosibles, calle)
                        end
                    elseif coche.orientacion == "vertical" and calle.orientacion == "horizontal" then
                        local calleX1,calleX2 = calle.x1 % MAP_TILES,calle.x2 % MAP_TILES
                        if currentTileY >= calle.y1 and currentTileY <= calle.y2 then
                            if calleX1 <= calleX2 then
                                if currentTileX >= calleX1 and currentTileX <= calleX2 then table.insert(callesPosibles, calle) end
                            else
                                if currentTileX >= calleX1 or currentTileX <= calleX2 then table.insert(callesPosibles, calle) end
                            end
                        end
                    end
                end
            end

            if currentTileX == 0 or currentTileX == MAP_TILES - 1 then
                coche.x,coche.calle = (MAP_TILES - 1 - currentTileX) * TAMANO_TILE,nil
            elseif #callesPosibles > 0 then
                local calleElegida = callesPosibles[math.random(1, #callesPosibles)]
                coche.calle,coche.orientacion = calleElegida,calleElegida.orientacion
                if coche.orientacion == "vertical" then
                    coche.x,coche.direccion = calleElegida.x1 * TAMANO_TILE,math.random(0, 1) == 0 and -1 or 1
                else coche.y,coche.direccion = calleElegida.y1 * TAMANO_TILE,math.random(0, 1) == 0 and -1 or 1 end
            else coche.direccion = -coche.direccion end
        end

        -- Dibujar coche
        local screenX = (coche.x - todoJuego.estadoJugador.camara.offset.x + 100) % MAP_WIDTH
        local screenY = coche.y - todoJuego.estadoJugador.camara.offset.y + 48
        if screenX >= -16 and screenX <= 256 and screenY >= -16 and screenY <= 256 then
            local rotacion = (coche.orientacion == "horizontal")
                and ((coche.direccion > 0) and 0 or 2)
                or ((coche.direccion > 0) and 1 or 3)

            local nombre = coche.calle and coche.calle.nombre or "Sin calle"

            if coche.sprites then
                for j, spriteId in ipairs(coche.sprites) do
                    local offsetX, offsetY = 0, 0
                    if rotacion == 0 then offsetX = (j - 1) * 8
                    elseif rotacion == 2 then offsetX = -(j - 1) * 8
                    elseif rotacion == 1 then offsetY = (j - 1) * 8
                    else offsetY = -(j - 1) * 8 end
                    s(spriteId, screenX + offsetX, screenY + offsetY, 0, 1, false, rotacion)
                end
            else
                s(coche.sprite, screenX, screenY, 0, 1, false, rotacion)
                if coche.animado then s(coche.sprite + segundoAnimacion, screenX, screenY, 0, 1, false, rotacion) end
            end
        end
    end
    end
    -- Lógica principal para decidir qué dibujar
    if tipo == "trafico" then dibujarTrafico()
    elseif tipo == "especiales" then dibujarVehiculosEspeciales() end
end

function gestionarUbicacion(modo, x, y)
    -- Constantes del mapa
    local MAP_WIDTH, MAP_TILES, TAMANO_TILE = 1920, 240, 8  -- MAP_WIDTH/8=240 tiles

    -- Función para dibujar nombres de calles
    local function dibujarCalles()
        local tileX = math.floor(todoJuego.estadoJugador.jugador.x / TAMANO_TILE)
        local tileY = math.floor(todoJuego.estadoJugador.jugador.y / TAMANO_TILE)
        
        todoJuego.ciudadJuego.configuracion.mostrarSiCalle = false -- Siempre mostrar calles

        for _, calle in ipairs(todoJuego.ciudadJuego.calles) do
            local color,mostrarNombre,jugadorEnCalle = 4,false,false

            -- Verificar si el jugador está en esta calle
            if calle.orientacion == "horizontal" then
                if tileY >= calle.y1 and tileY <= calle.y2 then
                    if calle.x1 <= calle.x2 then
                        if tileX >= calle.x1 and tileX <= calle.x2 then jugadorEnCalle = true end
                    else
                        if tileX >= calle.x1 or tileX <= calle.x2 then jugadorEnCalle = true end
                    end
                end
            else -- Calles verticales
                if tileX >= calle.x1 and tileX <= calle.x2 then
                    if tileY >= calle.y1 and tileY <= calle.y2 then jugadorEnCalle = true end
                end
            end

            -- Actualizar calle actual del jugador
            if jugadorEnCalle then todoJuego.estadoJugador.jugador.calle,color,mostrarNombre = calle.nombre,9,true end

            -- Dibujar la calle
            if todoJuego.ciudadJuego.configuracion.mostrarSiCalle then
                local screenX1 = (calle.x1 * TAMANO_TILE - todoJuego.estadoJugador.camara.posicion.x) % MAP_WIDTH
                local screenX2 = ((calle.x2 + 1) * TAMANO_TILE - todoJuego.estadoJugador.camara.posicion.x) % MAP_WIDTH
                local screenY1 = calle.y1 * TAMANO_TILE - todoJuego.estadoJugador.camara.posicion.y + 48
                local screenY2 = (calle.y2 + 1) * TAMANO_TILE - todoJuego.estadoJugador.camara.posicion.y + 48
                local ancho, alto = screenX2 - screenX1, screenY2 - screenY1

                if calle.orientacion == "horizontal" then
                    if calle.x1 <= calle.x2 then
                        -- Calle normal horizontal
                        rect(screenX1, screenY1, ancho, alto, color)
                        if mostrarNombre and ancho >= #calle.nombre * 4 then
                            p(calle.nombre, screenX1 + ancho/2 - #calle.nombre*2, screenY1 + alto/2 - 3, 7)
                        end
                    else
                        -- Calle horizontal con wrap-around
                        local segmentWidth1 = MAP_WIDTH - screenX1
                        rect(screenX1, screenY1, segmentWidth1, alto, color);rect(0, screenY1, screenX2, alto, color)
                        if mostrarNombre then
                            if segmentWidth1 > screenX2 and segmentWidth1 >= #calle.nombre * 4 then
                                p(calle.nombre, screenX1 + segmentWidth1/2 - #calle.nombre*2, screenY1 + alto/2 - 3, 7)
                            elseif screenX2 >= #calle.nombre * 4 then
                                p(calle.nombre, screenX2/2 - #calle.nombre*2, screenY1 + alto/2 - 3, 7)
                            end
                        end
                    end
                else
                    -- Calle vertical
                    rect(screenX1, screenY1, ancho, alto, color)
                    if mostrarNombre and alto >= 8 then
                        -- Para calles verticales, imprimir el nombre verticalmente
                        for i = 1, #calle.nombre do p(calle.nombre:sub(i,i), screenX1 + ancho/2 - 2, screenY1 + (i-1)*6 + 4, 7) end
                    end
                end
            end
        end
    end

    -- Función para obtener la zona actual
    local function obtenerZonaActual()
        local nombreZona = "zona desconocida"
        
        for i = 1, #todoJuego.ciudadJuego.zonas do
            local zona = todoJuego.ciudadJuego.zonas[i]

            local xInicio, yInicio, w, h = 
            zona.xInicio * TAMANO_TILE,zona.yInicio * TAMANO_TILE,
            (zona.xFin - zona.xInicio) * TAMANO_TILE,(zona.yFin - zona.yInicio) * TAMANO_TILE

            -- Verificar si las coordenadas están dentro de esta zona
            if x >= zona.xInicio * TAMANO_TILE and x < zona.xFin * TAMANO_TILE and
               y >= zona.yInicio * TAMANO_TILE and y < zona.yFin * TAMANO_TILE then
                nombreZona = zona.nombre break
            end
        end

        return nombreZona
    end

    -- Lógica principal para decidir qué función ejecutar
    if modo == "calles" then dibujarCalles()
    elseif modo == "zona" then return obtenerZonaActual(x or todoJuego.estadoJugador.jugador.x, y or todoJuego.estadoJugador.jugador.y)
    end
end

function dibujarElementosDelMundo(jugadorX, jugadorY)
    -- Cache de variables frecuentemente accedidas
    local estadoJugador, camara, ciudadJuego, efectosVisuales, menu, climaSwitches =
    todoJuego.estadoJugador,todoJuego.estadoJugador.camara,todoJuego.ciudadJuego,
    todoJuego.efectosVisuales,todoJuego.menuPrincipal.estados,todoJuego.clima.interruptores

    -- === NPCs ===
    for i, npc in ipairs(ciudadJuego.npcs) do
        -- Actualizar posición del NPC
        npc.offsetX,npc.offsetY = npc.offsetX + npc.speedX,npc.offsetY + npc.speedY

        -- Rebotar en los bordes
        if math.abs(npc.offsetX) > 9 then npc.speedX,npc.offsetX = -npc.speedX,npc.offsetX + npc.speedX * 2 end
        if math.abs(npc.offsetY) > 9 then npc.speedY,npc.offsetY = -npc.speedY,npc.offsetY + npc.speedY * 2 end

        -- Calcular posición en pantalla
        local npcScreenX,npcScreenY = npc.x + npc.offsetX - camara.posicion.x,npc.y + npc.offsetY - camara.posicion.y
        local npcWorldX,npcWorldY = npc.x + npc.offsetX,npc.y + npc.offsetY

        -- Dibujar NPC
        s(npc.sprite, npcScreenX, npcScreenY, 0)

        -- Mostrar nombre si está cerca
        local distancia = math.sqrt((npcWorldX - estadoJugador.jugador.x)^2 + (npcWorldY - estadoJugador.jugador.y)^2)
        if distancia < ciudadJuego.configuracion.radioDeteccionNombreNPC then
            local textX,textY = npcScreenX,npcScreenY - 15
            rect(textX - 1, textY - 1, #npc.name * 4 + 2, 10, 10)
            p(npc.name, textX, textY, 7)
        end
    end

    -- === Coleccionables y Monedas ===
    local config = {
        objetos = {
            items = ciudadJuego.coleccionables.objetos,particulas = efectosVisuales.particulasColeccionables,
            propiedad_recolectado = "recolectado",
            onRecolectar = function() estadoJugador.jugador.coleccionables = estadoJugador.jugador.coleccionables + 1 end,
            particula_config = {
                count = 30,velocidad_min = 1.5,velocidad_max = 2.5,vida_min = 30,vida_max = 40,gravedad = 0.05,
                colores = function() return math.random(0, 15) end, parpadeo = function() return math.random(2) == 1 end
            }
        },
        monedas = {
            items = ciudadJuego.coleccionables.monedas,particulas = efectosVisuales.particulasMoneda,
            propiedad_recolectado = "recolectada",
            onRecolectar = function() estadoJugador.jugador.dinero = estadoJugador.jugador.dinero + 1 end,
            particula_config = {
                count = 25,velocidad_min = 1.5,velocidad_max = 2.5,vida_min = 25,vida_max = 40,gravedad = 0.02,
                colores = function() return ({3,4,5})[math.random(3)] end, parpadeo = function() return true end
            }
        }
    }

    for tipo, datos in pairs(config) do
        -- Dibujar y recolectar items
        for i, item in pairs(datos.items) do
            if not item[datos.propiedad_recolectado] then
                s(item.tipo, item.x - camara.posicion.x, item.y - camara.posicion.y, 0)

                -- Verificar colisión con jugador
                if jugadorX and jugadorY and math.abs(jugadorX - item.x) < 8 and math.abs(jugadorY - item.y) < 8 then
                    item[datos.propiedad_recolectado] = true
                    datos.onRecolectar()

                    -- Crear partículas al recolectar
                    local pc = datos.particula_config
                    for j = 1, pc.count do
                        local angulo = math.random() * 2 * math.pi
                        local velocidad = pc.velocidad_min + math.random() * (pc.velocidad_max - pc.velocidad_min)
                        local dx,dy = math.cos(angulo) * velocidad,math.sin(angulo) * velocidad

                        table.insert(datos.particulas, { x = item.x,y = item.y,dx = dx,dy = dy,
                            vida = pc.vida_min + math.random(pc.vida_max - pc.vida_min),color = pc.colores(),parpadeo = pc.parpadeo()})
                    end
                end
            end
        end

        -- Actualizar y dibujar partículas
        for i = #datos.particulas, 1, -1 do
            local p = datos.particulas[i]
            p.x,p.y = p.x + p.dx,p.y + p.dy
            p.dy,p.vida = p.dy + datos.particula_config.gravedad,p.vida - 1

            if p.vida % 2 == 0 or p.parpadeo then
                local x,y = p.x - camara.posicion.x,p.y - camara.posicion.y
                pix(x, y, p.color);pix(x + 1, y, p.color);pix(x, y + 1, p.color);pix(x + 1, y + 1, p.color)
            end

            if p.vida <= 0 then table.remove(datos.particulas, i) end
        end
    end

    -- === Luces del Aeropuerto ===
    if not airport_lights_initialized then
        airport_lights_initialized = true
        -- Configuración de las luces
        local lights1,lights2,color_change_speed,light_spacing = {},{},0.1,3

        -- Inicializar las luces (solo una vez)
        for x = 1751, 1815, light_spacing do
            table.insert(lights1, {x = x, y = 303, color = math.random(2, 15)})
            table.insert(lights2, {x = x, y = 328, color = math.random(2, 15)})
        end
        
        -- Guardar las luces en la tabla de estado
        airport_lights = { lights1 = lights1,lights2 = lights2,color_change_speed = color_change_speed }
    end

    -- Función local para actualizar luces
    local function update_lights(light_array)
        for i, light in ipairs(light_array) do
            light.color = (light.color + airport_lights.color_change_speed) % 15
            if light.color < 2 then light.color = 2 end
        end
    end

    -- Función local para dibujar luces
    local function draw_lights(light_array)
        for i, light in ipairs(light_array) do
            circ(light.x - camara.posicion.x, light.y - camara.posicion.y, 1, math.floor(light.color))
            pix(light.x - camara.posicion.x, light.y - camara.posicion.y, 15) -- Blanco para el centro
        end
    end

    -- Actualizar y dibujar ambos conjuntos de luces
    update_lights(airport_lights.lights1);update_lights(airport_lights.lights2)
    draw_lights(airport_lights.lights1);draw_lights(airport_lights.lights2)

    -- === Dibujar Choripanes ===
    s(193, 130 - camara.posicion.x, 164 - camara.posicion.y, 0);s(193, 1870 - camara.posicion.x, 504 - camara.posicion.y, 0)

    -- === Interruptores de la Ciudad ===
    local screenX,screenY,jugX,jugY = 100 - camara.offset.x,48 - camara.offset.y,estadoJugador.jugador.x,estadoJugador.jugador.y

    local interruptores = {
        -- sprite, x, y, condicion, accion, mensaje, condExtra
        {189, 604, 20, not menu.misionStuntman, function() 
            menu.misionStuntman = true
            estadoJugador.jugador.x = 1050 estadoJugador.jugador.y = 1050
        end, "Iniciar Mision de Stuntman? boton 4"},
        
        {305, 220, 12, true, function() 
            activarJetpack = not activarJetpack 
        end, activarJetpack and "bajarse del jetpack? boton 4" or "subirse a jetpack? boton 4"},
        
        {383, 60, 140, not menu.telescopio, function() 
            menu.telescopio = true 
        end, "Usar telescopio? boton 4", not activarJetpack},
        
        {318, 212, 148, true, function() 
            menu.Diarios = true 
        end, "Leer Diario? boton 4", not menu.Diarios},
        
        {99, 380, 452, not menu.radios, function() 
            menu.radios = true 
        end, "Activar Radios? boton 4"},
        
        {210, 172, 148, not climaSwitches.lluvia, function() 
            climaSwitches.lluvia = true 
        end, "Activar lluvia? boton 4"},
        
        {212, 428, 268, not climaSwitches.nieve, function() 
            climaSwitches.nieve = true 
        end, "Iniciar nieve? boton 4"},
        
        {213, 604, 116, not climaSwitches.hojas, function() 
            climaSwitches.hojas = true 
        end, "Iniciar hojas? boton 4"},
        
        {209, 396, 68, not climaSwitches.relampagos, function() 
            climaSwitches.relampagos = true 
        end, "Activar relampagos? boton 4"},
        
        {214, 420, 404, not climaSwitches.vientos, function() 
            climaSwitches.vientos = true 
        end, "Iniciar rafagas de viento? boton 4"},
        
        {317, 380, 316, not menu.juegoBaile, function() 
            menu.juegoBaile = true 
        end, "Iniciar juego de baile? boton 4"},
        
        {221, 356, 132, not todoJuego.menuPrincipal.estados.pinball, function() 
            todoJuego.menuPrincipal.estados.pinball = true 
        end, "Iniciar Pinball? boton 4"}
    }

    for i = 1, #interruptores do
        local item = interruptores[i]
        if item[4] then s(item[1], item[2] + screenX, item[3] + screenY, 0) end
        
        if jugX == item[2] and jugY == item[3] and (item[7] == nil or item[7]) then
            rect(40, 40, 140, 10, 0)
            p(item[6], 40, 40, 10)
            if btnp(4) then item[5]() end
        end
    end

    -- === Manejo de Semáforos ===
    if not _sem_initialized then
        _traffic_light = { current = 130,states = {130, 131, 132},timer = 0,intervals = {180, 30, 180} }
        _pedestrian_light = { current = 113,states = {113, 114, 115},timer = 0,blink_speed = 10,is_blinking = false }
        _sem_initialized = true
    end

    local t, p = _traffic_light, _pedestrian_light
    t.timer,p.timer = t.timer + 1,p.timer + 1

    if t.current == t.states[3] then
        p.current, p.is_blinking = t.states[1], false
        if t.timer >= t.intervals[3] then t.current, t.timer = t.states[2], 0 end
    elseif t.current == t.states[2] then
        p.current, p.is_blinking = t.states[2], true
        if t.timer >= t.intervals[2] then t.current, t.timer = t.states[1], 0 end
    else
        if t.timer < t.intervals[1] - 60 then p.current, p.is_blinking = p.states[3], false
        else
            p.is_blinking = true
            if p.timer % p.blink_speed == 0 then p.current = (p.current == p.states[3]) and p.states[2] or p.states[3] end
        end
        if t.timer >= t.intervals[1] then t.current, t.timer, p.is_blinking = t.states[3], 0, false end
    end

    local x, y = 96 - todoJuego.estadoJugador.camara.offset.x + 100, 95 - todoJuego.estadoJugador.camara.offset.y + 48
    s(t.current, x, y, 0, 2)
    --s(p.current, x+11, y+8, 0, 1)
end

function dibujarJugador(accion, ...)
    -- Control de bloqueo de controles
    if todoJuego.gestionMisionStuntman.booleanos.controlesBloqueados then return end

    -- Cacheo de variables frecuentes
    local jugador, camara, vehiculo, enVehiculo, vel, sparks, rnd =
    todoJuego.estadoJugador.jugador,todoJuego.estadoJugador.camara,todoJuego.estadoJugador.vehiculo,
    todoJuego.gestionMisionStuntman.booleanos.jugadorEstaEnVehiculo,todoJuego.estadoJugador.jugador.velocidad,
    todoJuego.estadoJugador.mochilaJetpack.sparks,
    math.random

    -- Función unificada para chispas del jetpack
    local function spark(action, x, y, dx, dy, col)
        if action == "add" then sparks[#sparks+1] = {x=x, y=y, dx=dx, dy=dy, life=30, col=col}
        elseif action == "update" then
            for i=#sparks,1,-1 do
                local s = sparks[i]
                s.x, s.y, s.life = s.x+s.dx, s.y+s.dy, s.life-1
                if s.life <= 0 then table.remove(sparks, i) end
            end
        elseif action == "draw" then
            for _,s in ipairs(sparks) do pix(s.x-camara.posicion.x, s.y-camara.posicion.y, s.col) end
        end
    end

    -- Modo Jetpack
    if accion == "jetpack" then
        spark("update");spark("draw")

        jugador.vehiculo = "Jetpack"
        local jx, jy = jugador.x-camara.posicion.x+1, jugador.y-camara.posicion.y+0.2

        -- Dibujo optimizado del jetpack : cuerpo,tanque izquierdo,tanque derecho,correa
        rect(jx, jy+2, 4, 5, 7);rect(jx-3, jy+4, 2, 4, 2);rect(jx+5, jy+4, 2, 4, 2)
        line(jx+2, jy, jx+2, jy+2, 6) 

        -- Generación de chispas optimizada
        local btnPressed = btn(0) or btn(1) or btn(2) or btn(3)
        local x1, x2,y = jugador.x+2, jugador.x+6,jugador.y+12
        local dx, dy,col = -0.5+rnd()*0.3, -0.5+rnd()*0.3,rnd(2)+2

        spark("add", x1, y, dx, dy, col);spark("add", x2, y, dx, dy, col)
        return
    end

    -- Función integrada para gestionar el coche
    local function gestionarVehiculo(accionVehiculo)
        if accionVehiculo == "cochecerca" then
            -- Comprobar si el jugador está cerca del coche
            return jugador.x >= vehiculo.x - 8 and jugador.x <= vehiculo.x + 8 and
                   jugador.y >= vehiculo.y - 8 and jugador.y <= vehiculo.y + 8
        
        elseif accionVehiculo == "salir" then
            -- Lógica para salir del coche
            if enVehiculo and btnp(5) then
                todoJuego.gestionMisionStuntman.booleanos.jugadorEstaEnVehiculo = false
                todoJuego.gestionMisionStuntman.booleanos.jugadorPreparaBomba = true
                
                -- Posicionar al jugador junto al coche
                jugador.x, jugador.y = vehiculo.x + 10, vehiculo.y
                return true
            end
            return false
        
        elseif accionVehiculo == "entrar" then
            -- Lógica para entrar al coche (si está cerca)
            if not enVehiculo and btnp(5) and gestionarVehiculo("cochecerca") then
                todoJuego.gestionMisionStuntman.booleanos.jugadorEstaEnVehiculo = true
                sfx(7, 150, 5, 0, 1)
                return true
            end
            return false
        end
    end

    -- Si se llama con una acción específica del vehículo
    if accion == "cochecerca" or accion == "salir" or accion == "entrar" then return gestionarVehiculo(accion) end

    -- Movimiento del jugador (solo si no es una llamada específica)
    if not accion or accion == "esParaMisionStuntman" then
        local movimientos = {
            [0] = function() -- Arriba
                jugador.y = jugador.y - vel
                camara.offset.y = camara.offset.y - 8
                vehiculo.ultimaPosicion = "arriba"
                if enVehiculo then vehiculo.y = vehiculo.y - vel end
            end,
            [1] = function() -- Abajo
                jugador.y = jugador.y + vel
                camara.offset.y = camara.offset.y + 8
                vehiculo.ultimaPosicion = "abajo"
                if enVehiculo then vehiculo.y = vehiculo.y + vel end
            end,
            [2] = function() -- Izquierda
                jugador.x = jugador.x - vel
                camara.offset.x = camara.offset.x - 8
                vehiculo.ultimaPosicion = "izquierda"
                if enVehiculo then vehiculo.x = vehiculo.x - vel end
            end,
            [3] = function() -- Derecha
                jugador.x = jugador.x + vel
                camara.offset.x = camara.offset.x + 8
                vehiculo.ultimaPosicion = "derecha"
                if enVehiculo then vehiculo.x = vehiculo.x + vel end
            end
        }

        for i = 0, 3 do if btn(i) then movimientos[i]() end
        end

        -- Nitro
        vehiculo.velocidad = (btn(4) and not todoJuego.gestionMisionStuntman.booleanos.nitroBloqueado) and 5 or 3
        todoJuego.gestionMisionStuntman.booleanos.nitroActivado = vehiculo.velocidad == 5
    end

    -- Dibujo según el modo
    local x, y = jugador.x - camara.posicion.x, jugador.y - camara.posicion.y
    local rot = ({derecha=0, izquierda=2, arriba=3, abajo=1})[vehiculo.ultimaPosicion] or 0

    if accion == "esParaMisionStuntman" then
        -- Lógica específica para la misión Stuntman
        local t,p = time()//100,vehiculo.ultimaPosicion

        local function humo(ox, oy, dx, dy)
            for i = 0, 2 do
                local o = (t + i * 10) % 24
                if o < 12 then
                    local a = 14 - (o // 3)
                    if a >= 0 then 
                        circ(x + ox + ((dx and i % 2) or 0) - (not dx and o // 2 or 0),
                            y + oy + ((dy and i % 2) or 0) + (dx and o // 2 or 0), 1, 14) 
                    end
                end
            end
        end

        if p == "izquierda" then 
            s(362, x, y, 0)
            if enVehiculo then
                circ(x, y + 1, 1, 4) circ(x, y + 4, 1, 4) circ(x + 5, y + 1, 1, 2) circ(x + 5, y + 4, 1, 2)
                humo(6, 2, false, true)
            end
        elseif p == "arriba" then
            s(362, x, y, 0, 1, 0, 1)
            if enVehiculo then
                circ(x + 2, y, 1, 4) circ(x + 5, y, 1, 4) circ(x + 2, y + 5, 1, 2) circ(x + 5, y + 5, 1, 2)
                humo(3, 5, true, true)
            end
        elseif p == "derecha" then
            s(362, x, y, 0, 1, 0, 2)
            if enVehiculo then
                circ(x + 7, y + 2, 1, 4) circ(x + 7, y + 5, 1, 4) circ(x + 2, y + 2, 1, 2) circ(x + 2, y + 5, 1, 2)
                humo(2, 3, false, true)
            end
        elseif p == "abajo" then
            s(362, x, y, 0, 1, 0, 3)
            if enVehiculo then
                circ(x + 2, y + 6, 1, 4) circ(x + 5, y + 6, 1, 4) circ(x + 2, y + 1, 1, 2) circ(x + 5, y + 1, 1, 2)
                humo(3, 1, true, false)
            end
        end

        if not enVehiculo then s(257, x, y, 0) end

        -- Efecto de nitro para la misión Stuntman
        if todoJuego.gestionMisionStuntman.booleanos.nitroActivado then
            local cl = 8 + (time() % 3)
            local x2, y2 = x + 4, y + 3
            if btn(3) then for i = 0, 2 do line(x - i, y2, x - 10 - i, y2, cl) end
            elseif btn(2) then for i = 0, 2 do line(x + 8 + i, y2, x + 18 + i, y2, cl) end
            elseif btn(0) then for i = 0, 2 do line(x2, y + 8 + i, x2, y + 18 + i, cl) end
            elseif btn(1) then for i = 0, 2 do line(x2, y - i, x2, y - 10 - i, cl) end
            end
        end
    else
        -- Lógica normal de dibujo
        if not enVehiculo then s(257, x, y, 0) return end

        -- Vehículos sin sprite
        local vehiculosSinSprite = {Globo=true, Avion=true, ["Jet de Combate"]=true, ["Lancha Kurro"]=true, Tren=true, ["Monster Casta"]=true}
        if vehiculosSinSprite[jugador.vehiculo] then spriteVehiculo = nil end

        -- Dibujo según tipo de vehículo
        local vehiculosEspeciales = {
            ["Limusina Diamante"] = {sprite=332, icono=335, w=4, h=1},
            ["Stacchotta 69"] = {sprite=348, icono=349, w=2, h=1},
            Bondi = {sprite=381, icono=382, w=2, h=1},
            ["Rally ElWacho"] = {sprite=328, icono=329, w=2, h=1},
            ["Turbo Diarrea"] = {sprite=330, icono=331, w=2, h=1},
            ["Formula Negativo"] = {sprite=344, icono=345, w=2, h=1},
            AntiMoto = {sprite=346, icono=347, w=2, h=1},
            ["4X4 420"] = {sprite=385, icono=386, w=2, h=1},
            ["Monster Casta"] = {sprite=350, icono=351, w=2, h=1}
        }

        if type(spriteVehiculo) == "number" then
            vehiculo.icono = spriteVehiculo
            local sprite = (jugador.vehiculo == "Policia" or jugador.vehiculo == "Ambulancia") 
                          and (spriteVehiculo + segundoAnimacion) or spriteVehiculo
            s(sprite, x, y, 0, 1, 0, rot)
            return
        elseif vehiculosEspeciales[jugador.vehiculo] then
            local v = vehiculosEspeciales[jugador.vehiculo]
            vehiculo.icono = v.icono
            s(v.sprite, x, y, 0, v.icono==351 and 2 or 1, 0, rot, v.w, v.h)
            return
        end

        -- Vehículos especiales con lógica compleja
        local especiales = {
            Globo = function()
                vehiculo.icono = 495
                s(495, x-10, y-20, 0, 3) s(511, x-6, y+5, 0, 2) s(257, x-2, y+10)
            end,
            Avion = function()
                vehiculo.icono = 378
                local sprId = rot==0 and 377 or rot==1 and 377 or rot==2 and 377 or 377
                s(sprId, x, y, 0, 2, rot==0 and 3 or rot==1 and 0 or rot==2 and 1 or 1, 
                   rot==0 and 2 or rot==1 and 1 or rot==2 and 0 or 3, 2, 1)
            end,
            ["Jet de Combate"] = function()
                vehiculo.icono = 428
                s(427, x, y, 0, 2, rot==0 and 3 or rot==1 and 0 or rot==2 and 1 or 1, 
                   rot==0 and 2 or rot==1 and 1 or rot==2 and 0 or 3, 4, 1)
            end,
            ["Lancha Kurro"] = function()
                vehiculo.icono = 441
                s(440, x, y, 0, 2, 0, rot, 2, 1)
                local px, py = rot==0 and x+8 or rot==2 and x+15 or x+4, 
                              rot==0 and y+2 or rot==3 and y+14 or y+8
                s(257, px, py, 1)
            end
        }

        if especiales[jugador.vehiculo] then especiales[jugador.vehiculo]() end
    end
end

function gestionarEnemigos(modo, x, y)
    local g,j = todoJuego.gestionMisionStuntman,todoJuego.estadoJugador
    
    -- Modo STUNTMAN (para la misión específica)
    if modo == "stuntman" then
        -- Submodo CREAR
        if x == "crear" then
            g.numericos.temporizadores.temporizadorAparicionCocheEnemigo = g.numericos.temporizadores.temporizadorAparicionCocheEnemigo + 1

            if g.numericos.temporizadores.temporizadorAparicionCocheEnemigo >= 30 then
                table.insert(g.cochesEnemigosStuntman,{x=1600,y=math.random(920,980),speed=math.random(3,5),llamaTimer=0})
                g.numericos.temporizadores.temporizadorAparicionCocheEnemigo = 0
            end
        
        -- Submodo DIBUJAR
        elseif x == "dibujar" then
            for _, car in ipairs(g.cochesEnemigosStuntman) do
                -- Generar llamas
                for i = 1, 3 do
                    table.insert(g.llamasCochesEnemigos,{x=car.x+math.random(-4,4),y=car.y+math.random(-2,2),vida=math.random(6,12),
                    color=math.random(2,4),tamano=math.random(1,3)})
                end

                -- Dibujar coche
                s(363, car.x - j.camara.posicion.x, car.y - j.camara.posicion.y, 0)
                
                -- Mover coche
                car.x,car.llamaTimer = car.x - car.speed,car.llamaTimer + 1
            end

            -- Actualizar llamas
            for i = #g.llamasCochesEnemigos, 1, -1 do
                local llama = g.llamasCochesEnemigos[i]

                for dx = -llama.tamano, llama.tamano do
                    for dy = -llama.tamano, llama.tamano do
                        pix(llama.x + dx - j.camara.posicion.x, llama.y + dy - j.camara.posicion.y, llama.color)
                    end
                end

                llama.y,llama.x,llama.vida = llama.y - math.random(0, 2),llama.x + math.random(-1, 1),llama.vida - 1

                if llama.vida < 5 then llama.color = 3 end

                if llama.vida <= 0 then table.remove(g.llamasCochesEnemigos, i) end
            end
            
            -- Verificar colisiones (solo en modo stuntman)
            for _, car in ipairs(g.cochesEnemigosStuntman) do
                if j.vehiculo and car.x < j.vehiculo.x + 8 and car.x + 16 > j.vehiculo.x and car.y < j.vehiculo.y + 8 and 
                   car.y + 16 > j.vehiculo.y then return true
                end
            end
        end
    
    -- Modo GENERAL (para coches enemigos normales)
    else
        -- 1. Agregar nuevos coches enemigos (con probabilidad del 5%)
        if math.random(1, 100)> 95 then table.insert(todoJuego.cochesEnemigos,{x=math.random(0,200),y=math.random(0,100),width=8,height=8})
        end
        
        -- 2. Mover y eliminar coches existentes
        for i = #todoJuego.cochesEnemigos, 1, -1 do
            local coche = todoJuego.cochesEnemigos[i]
            coche.x = coche.x - 0.5  -- Movimiento hacia la izquierda
            
            -- Eliminar si está fuera de pantalla
            if coche.x < -coche.width then table.remove(todoJuego.cochesEnemigos, i) end
        end
        
        -- 3. Dibujar los coches
        for i, coche in ipairs(todoJuego.cochesEnemigos) do s(362, coche.x - j.camara.posicion.x, coche.y - j.camara.posicion.y, 0) end
    end
    
    return false
end

--====== STUNTMAN.LUA (simulado) ======--

-- funciones stuntman

function gestionarEstadoJuegoStuntman(modo, ...)
    -- Función interna para completar fases
    local function completePhase(phaseNum)
        todoJuego.dialogosStuntman.estadoMision = phaseNum.."completado"
        todoJuego.gestionMisionStuntman.numericos.estadoJuego.interruptorParteMisionStuntman = 
            (phaseNum < 10) and (phaseNum + 1) or "cuentaatras"..(phaseNum + 1)
        todoJuego.gestionMisionStuntman.numericos.temporizadores.cuentaAtrasStuntman = 
            (phaseNum + 1 == 7) and 120 or 300
        todoJuego.gestionMisionStuntman.numericos.progreso.puntuacionStuntman = 
            todoJuego.gestionMisionStuntman.numericos.progreso.puntuacionStuntman + 
            todoJuego.gestionMisionStuntman.puntosPorFase[phaseNum]
        todoJuego.gestionMisionStuntman.booleanos.mostrarObjetivoCompletado = true
    end

    if modo == "completePhase" then
        local phaseNum = ...completePhase(phaseNum)

    elseif modo == "gameover" then
        todoJuego.dialogosStuntman.estadoMision = "gameover"
        todoJuego.gestionMisionStuntman.numericos.estadoJuego.interruptorParteMisionStuntman = "gameover"
        if string.find(todoJuego.dialogosStuntman.estadoMision, "objetivo") then
            todoJuego.gestionMisionStuntman.numericos.estadoJuego.faseActualEnGameOver =
                tonumber(string.match(todoJuego.dialogosStuntman.estadoMision, "objetivo(%d+)")) or 1
        else todoJuego.gestionMisionStuntman.numericos.estadoJuego.faseActualEnGameOver = 1
        end

    elseif modo == "reiniciar:misión" then
        todoJuego.estadoJugador.jugador.x,todoJuego.estadoJugador.jugador.y = 1086,1055
        todoJuego.gestionMisionStuntman.booleanos = {nitroActivado = false,jugadorEstaEnVehiculo = false,mostrarObjetivoCompletado = false}
        todoJuego.gestionMisionStuntman.numericos = {
            estadoJuego = { interruptorParteMisionStuntman = 0, indiceDialogoStuntman = 1 },
            temporizadores = { cuentaAtrasStuntman = 0, temporizadorExplosionRapida = 120 },
            progreso = { puntuacionStuntman = 0, objetivoTexto = "", tiempoMostrarObjetivo = 0 }
        }

    elseif modo == "reiniciar:fase" then
        local fase = ... or todoJuego.gestionMisionStuntman.numericos.estadoJuego.faseActualEnGameOver
        todoJuego.dialogosStuntman.estadoMision = "objetivo"..fase.."Incompleto"
        todoJuego.gestionMisionStuntman.numericos.estadoJuego.interruptorParteMisionStuntman = "cuentaatras"..fase
        todoJuego.gestionMisionStuntman.numericos.temporizadores.cuentaAtrasStuntman = (fase == 7) and 120 or 300

        local configFase = { [1] = { jugadorEstaEnVehiculo = false, posCoche = {1086, 1055} },
            [2] = { contadorCajasDerribadas = 0, posCoche = {1149, 1048} },
            [3] = { contadorCheckpoint = 0, transicionCheckpoint = false, nitroBloqueado = false, posCoche = {1149, 1048} },
            [4] = { cajaMetalica = {health = 3}, pistolaObtenida = false, yaSumoPuntosDialogoOculto = false, posCoche = {1270, 1025} },
            [5] = { saltoConExito = false, yaSumoPuntosDialogoOculto = false, posCoche = {1266, 1060} },
            [6] = { coordenadaDialogoCochesEnLlamasX = 1500, posCoche = {1392, 979}, resetEnemyCars = true },
            [7] = { posCoche = {1392, 979}, resetPersecutionCar = true },
            [8] = { puenteDestruido = false, aroSaltadoSinQuemarse = false, quemadoPorAro = false, posCoche = {1377, 898} },
            [9] = { contadorCheckpoint = 0, transicionCheckpoint = false, dialogoTrenX = 1300, posCoche = {1399, 819} },
            [10] = { contadorCheckpoint = 0, transicionCheckpoint = false, faseBomba = false, jugadorPreparaBomba = false,
                     explosionExitosa = false, posCoche = {1389, 716} }
        }

        if configFase[fase] then
            for key, val in pairs(configFase[fase]) do
                if key == "posCoche" then todoJuego.estadoJugador.vehiculo.x, todoJuego.estadoJugador.vehiculo.y = val[1], val[2]
                else _G[key] = val end
            end
        end

        if fase > 1 then completePhase(fase - 1) end

    elseif modo == "mordidoPorTiburon" then
        local x, y = ...line(x - 15, y - 10, x, y, 12)
        if todoJuego.gestionMisionStuntman.numericos.varias.radioSangre < 10 then
            todoJuego.gestionMisionStuntman.numericos.varias.radioSangre = todoJuego.gestionMisionStuntman.numericos.varias.radioSangre + 0.5
            todoJuego.gestionMisionStuntman.numericos.temporizadores.frameCount = todoJuego.gestionMisionStuntman.numericos.temporizadores.frameCount + 1
        end
        circ(x, y, todoJuego.gestionMisionStuntman.numericos.varias.radioSangre, 2)
        if todoJuego.gestionMisionStuntman.numericos.temporizadores.frameCount >= 20 then
            todoJuego.gestionMisionStuntman.numericos.varias.radioSangre = 0
            todoJuego.gestionMisionStuntman.numericos.temporizadores.frameCount = 0
        end
    end
end

function gestionarPantallaStuntman(modo, x, y, f, texto)
    local g = todoJuego.gestionMisionStuntman
    local j = todoJuego.estadoJugador
    local c = j.camara.posicion
    local p = g.numericos.progreso
    local t = time()
    local r = t // 50
    local o = {"Sube al coche (Boton C)", "Destruye todas las cajas", "Pasa por el checkpoint de nitro",
        "Destruye la caja metalica", "Salta la rampa a maxima velocidad", "Esquiva los coches enemigos (60s)",
        "Persigue y alcanza al coche objetivo", "Salta por el aro en llamas", "Pasa por el checkpoint del tren",
        "Activa la bomba y escapa a tiempo"}

    -- Pantalla: GAME OVER
    local function drawGO()
        for i=0,15 do rect(i*16,0,16,136,(t//100+i)%15+1) end
        local s="GAME OVER" for i=1,#s do print(s:sub(i,i),70+i*10,40,(r+i)%15+1,false,2) end
        rect(25,65,195,45,0);rect(0,0,170,20,0);rect(20,25,160,10,0);rect(10,120,160,20,0)

        print("PUNTUACION: "..p.puntuacionStuntman,60,70,t//30%6+8)
        print("Dialogos Ocultos: "..p.dialogosOcultosEncontrados,25,80,3) print("Objetos chocados: "..p.objetosChocados.."/14",25,100,3)
        print("Tiempo: "..(p.tiempoTotalStuntman//60)..":"..string.format("%02d",p.tiempoTotalStuntman%60),20,25,4)
        print("Boton 5 (B) : Reiniciar Fase "..g.numericos.estadoJuego.faseActualEnGameOver..".",10,120,4)
        print("Boton 4 (A) : Reiniciar Mision.",10,128,4)

        s(457,0,0,0);s(258,10,90,0)
        
        local msgs={{g.booleanos.gameOverFases[1],"Hasta mi abuelita lo haria mejor!",1,"Subir a Coche."},
            {g.booleanos.gameOverFases[2],"Usted tiene CajaFobia.",2,"Atropellar Cajas."},
            {g.booleanos.gameOverFases[3],"Sos una tortuga con nitro.",3,"Llegar a Checkpoint."},
            {g.booleanos.gameOverFases[4],"Hasta con alguien sin vida perdes.",4,"Disparar a Caja Metalica."},
            {g.booleanos.gameOverFases[5],"Sos un RampaFobico.",5,"Saltar sobre la Rampa."},
            {g.booleanos.gameOverFases[6],"Estas frito wachito.",6,"Esquivar coches."},
            {g.booleanos.gameOverFases[7],"Perdi mi Chorinesa!",7,"Perseguir coche."},
            {g.booleanos.gameOverFases[8],"Un aro es mejor que vos?",8,"Saltar Aro sin llamas."},
            {g.booleanos.gameOverFases[9],"Chucu chucu",9,"Esquivar trenes."},
            {g.booleanos.gameOverFases[10],"Apocalipsis Pixelero!",10,"Activar bomba."},
            {g.booleanos.controlesBloqueadosTiburon,"Te comio un TIBURON xOx",nil,nil}}

        local msg="Presiona (A) para reintentar"
        for _,m in ipairs(msgs) do if m[1] then msg=m[2] if m[3] then print("ESCENA "..m[3],10,0,12) print(m[4],10,10,4) end break end end
        if t%200<150 then rect(120-#msg*2-30,90,#msg*5,10,0) print(msg,95-#msg*2,90,4) end
        
        local c = t // 100 % 15 + 1
        rectb(20,20,200,96,c) rectb(22,22,196,92,c)
        
    end

    -- Pantalla: MISION COMPLETADA
    local function drawMC()
        if not g.booleanos.bonus then p.puntuacionStuntman = p.puntuacionStuntman + 5000 g.booleanos.bonus = true end
        for y=0,136,8 do rect(0,y,240,8,0) end
        rect(0,20,130,10,0) s(303,0,40)
        local tm = string.format("%d:%02d",p.tiempoTotalStuntman//60,p.tiempoTotalStuntman%60)
        local s = "MISION COMPLETADA!" for i=1,#s do print(s:sub(i,i),40+i*10,30,(r+i)%15+1,false,2) end
        print("PUNTUACION FINAL: "..p.puntuacionStuntman,60,60,t//30%10+7)
        rect(20,80,200,10,0) print("Terminado en "..tm.." segundos.",20,43,2)
        if p.tiempoTotalStuntman<1500 then
            s = "TIEMPO RECORD : MENOS DE 25 SEGUNDOS"
            for i=1,#s do print(s:sub(i,i),10+i*6,50,(r+i)%15+1) end
        else print("Tiempo Recomendado : 25 segundos o menos.",10,50,4) end
        s = "MUY BIEN WACHO,SOS LA PUTA HOSTIA JODER"
        for i=1,#s do print(s:sub(i,i),20+i*5,80,(r+i*2)%15+1) end
        local st = {
            {text="Dialogos Ocultos: "..p.dialogosOcultosEncontrados,y=99},{text="Objetos chocados: "..p.objetosChocados.."/14",y=114}}
        for _,s in ipairs(st) do print(s.text,26,s.y+1,0) print(s.text,25,s.y,3) end
        if t%1000<800 then print("Presiona (A) para volver al menu",40,10,t//100%6+8) end
        s(258,5,80,0,1,0,0,1,1)
    end

    -- Logro temporal
    local logroActivo = nil
    local function drawAchievement()
        local timer = 120
        return function()
            if timer > 0 then
                local x, y,radius,colors = 10,70,8,{2,3,4,5,6,7,8,9,10,11,12}
                local frame = (timer // 5) % #colors + 1
                local rainbowColor = colors[frame]
                rectb(x + 14, y + 3, 92, 12, rainbowColor);rect(x + 15, y + 4, 90, 10, 0)
                circb(x + radius, y + radius, radius + 1, rainbowColor);circ(x + radius, y + radius, radius, 0)
                print("S#", x + 3, y + 4, rainbowColor);print(g.numericos.mensajeTemporal.texto, x + 20, y + 4, rainbowColor)
                timer = timer - 1
            end
        end
    end

    if modo == "gameover" then drawGO()
    elseif modo == "completado" then drawMC()
    elseif modo == "logro" then logroActivo = logroActivo or drawAchievement() logroActivo()
    elseif modo == "temporal" then
        if g.numericos.mensajeTemporal.tiempo > 0 then
            local px,py = j.jugador.x - c.x + 10,j.jugador.y - c.y - 9
            rect(px - 2, py - 2, #g.numericos.mensajeTemporal.texto * 4 + 4, 8, 0)
            print(g.numericos.mensajeTemporal.texto, px, py, 6)
            g.numericos.mensajeTemporal.tiempo = g.numericos.mensajeTemporal.tiempo - 0.1
        end
    elseif modo == "inactividad" then
        g.inactivitySystem=g.inactivitySystem or{timer=0,threshold=240,message="Dale, juga al juego Boludo!",active=false}
        local i = g.inactivitySystem
        local activo = function()
            for b = 0, 7 do if btn(b) then return true end end
            return g.booleanos.jugadorEstaEnVehiculo and (j.vehiculo.velocidad > 0 or btn(4) or btn(5))
        end
        i.timer = activo() and 0 or i.timer + 1
        i.active = i.timer >= i.threshold
        if i.active then
            local px,py = j.jugador.x - c.x - #i.message * 2,j.jugador.y - c.y - 10
            rect(px - 2, py - 2, #i.message * 6 + 4, 10, 0)
            print(i.message, px, py + math.sin(t / 10) * 2, 5)
        end
    elseif modo == "objetivo" and f then
        local txt = o[f] or "Completa la mision"
        local px,py = j.jugador.x - c.x,j.jugador.y - c.y - 16
        rect(px - 2, py - 2, #txt * 4 + 4, 8, 0)
        print(txt, px, py, 12)
    elseif texto then
        local max_caracteres,color_texto,color_fondo = 30,3,0
        local ancho = math.min(#texto, max_caracteres) * 4 + 4
        rect(x - 2, y - 2, ancho, 8, color_fondo)
        print(texto, x, y, color_texto)
    end
end

mostrarLogro = gestionarPantallaStuntman("logro")

function gestionarDecoradoStuntman(e, a, p)
    -- Inicialización de estructuras
    if not elementosStuntman then
        elementosStuntman = {
            pajaros = {activos = {}, maximo = 2, ultimaGeneracion = 0},
            avion = {x = 1000, y = 947, speed = 1.5, width = 16, message = "#TengaMuchoSEXO", chars = {}},
            peces = {lista = {{x = 1155, y = 30, speed_x = 0.8, speed_y = 0, flip = false, vertical = false},
                {x = 1355, y = 30, speed_x = -0.6, speed_y = 0, flip = true, vertical = false},
                {x = 1443, y = 842, speed_x = 0, speed_y = 0.5, flip = false, vertical = true},
                {x = 1475, y = 930, speed_x = 0, speed_y = -0.4, flip = false, vertical = true},
                {x = 1737, y = 18, speed_x = 0, speed_y = -0.4, flip = false, vertical = true},
                {x = 1737, y = 240, speed_x = 0, speed_y = -0.4, flip = false, vertical = true}
            }},
            charcos = {lista = {}, agregarCharco = function(x, y)
                table.insert(elementosStuntman.charcos.lista, {x = x, y = y, time = 0, size = math.random(5, 10)})
            end},
            trenes = { lista = todoJuego.gestionMisionStuntman.mision.trenes or {},velocidadBase = 1.0 }
        }
        
        -- Inicialización de caracteres del avión
        for i = 1, #elementosStuntman.avion.message do
            elementosStuntman.avion.chars[i] = {
                char = elementosStuntman.avion.message:sub(i, i), offset = (i-1)*9,y_offset = -5,alpha = 15} end
    end

    local c,g = todoJuego.estadoJugador.camara.posicion,todoJuego.gestionMisionStuntman

    -- ========== MANEJAR PÁJAROS ==========
    if not e or e == "pajaros" then
        if not e or a == "actualizar" then
            for i = #elementosStuntman.pajaros.activos, 1, -1 do
                local pajaro = elementosStuntman.pajaros.activos[i]
                pajaro.x = pajaro.x + pajaro.speed * pajaro.dir
                if (pajaro.dir == -1 and pajaro.x < -16) or (pajaro.dir == 1 and pajaro.x > 240) then
                    table.remove(elementosStuntman.pajaros.activos, i)
                end
            end
            
            if math.random() > 0.98 and #elementosStuntman.pajaros.activos < elementosStuntman.pajaros.maximo then
                local dir = math.random(0, 1) == 0 and -1 or 1
                table.insert(elementosStuntman.pajaros.activos, {
                    x = dir == -1 and 240 or -16,y = math.random(10, 80),dir = dir,speed = 1})
            end
        end
        
        if not e or a == "dibujar" then for _, pajaro in ipairs(elementosStuntman.pajaros.activos) do s(449, pajaro.x, pajaro.y, 0) end
        end
    end

    -- ========== MANEJAR AVION ==========
    if not e or e == "avion" then
        if not e or a == "actualizar" then
            elementosStuntman.avion.x = elementosStuntman.avion.x + elementosStuntman.avion.speed
            if elementosStuntman.avion.x >= 1310 then elementosStuntman.avion.x = 1000 end
        end
        
        if not e or a == "dibujar" then
            local x,y = elementosStuntman.avion.x - c.x,elementosStuntman.avion.y - c.y
            s(377, x, y, 0, 2) s(378, x + elementosStuntman.avion.width, y, 0, 2)
            rect(x - 90, y + 5, 90, 5, 0)
            print(elementosStuntman.avion.message, x - 90, y + 5, 4)
        end
    end

    -- ========== MANEJAR PECES ==========
    if not e or e == "peces" then
        if not e or a == "actualizar" then
            for _, pez in ipairs(elementosStuntman.peces.lista) do
                pez.x,pez.y = pez.x + pez.speed_x,pez.y + pez.speed_y
                
                if pez.vertical then if pez.y >= 930 or pez.y <= 842 then pez.speed_y = -pez.speed_y end
                else if pez.x >= 1355 or pez.x <= 1155 then pez.speed_x,pez.flip = -pez.speed_x,pez.x >= 1355 end
                end
            end
        end
        
        if not e or a == "dibujar" then
            for _, pez in ipairs(elementosStuntman.peces.lista) do s(452, pez.x - c.x, pez.y - c.y, 0, 1, pez.flip, 0, 1, 1) end
        end
    end

    -- ========== MANEJAR CHARCOS ==========
    if not e or e == "charcos" then
        if not e or a == "actualizar" then for _, charco in ipairs(elementosStuntman.charcos.lista) do charco.time = charco.time + 0.07 end
        end
        
        if not e or a == "dibujar" then
            for _, charco in ipairs(elementosStuntman.charcos.lista) do
                local x,y,w = charco.x - c.x,charco.y - c.y,math.sin(charco.time) * 3
                circ(x, y, charco.size + w, 11) circ(x, y, charco.size + w - 3, 10)
                
                local rx, ry, esCoche
                local radio = charco.size * 1.5
                
                if g.booleanos.jugadorEstaEnVehiculo then
                    rx = todoJuego.estadoJugador.vehiculo.x - charco.x
                    ry = todoJuego.estadoJugador.vehiculo.y - charco.y
                    esCoche = true
                else
                    rx = todoJuego.estadoJugador.jugador.x - charco.x
                    ry = todoJuego.estadoJugador.jugador.y - charco.y
                    esCoche = false
                end
                
                if math.abs(rx) < radio and math.abs(ry) < radio then
                    local rf_x = x + rx * 0.7
                    local rf_y = y + ry * 0.7 + 3
                    
                    if esCoche then
                        local rot = 0
                        if todoJuego.estadoJugador.vehiculo.ultimaPosicion == "arriba" then rot = 1
                        elseif todoJuego.estadoJugador.vehiculo.ultimaPosicion == "derecha" then rot = 2
                        elseif todoJuego.estadoJugador.vehiculo.ultimaPosicion == "abajo" then rot = 3 end
                        
                        s(362, rf_x + math.random(-1, 1), rf_y + math.random(-1, 1), 0, 1, 0, rot, 1, 1)
                    else
                        s(257, rf_x + math.random(-1, 1), rf_y + math.random(-1, 1) - 1, 0, 1, 0, 0, 1, 1)
                    end
                end
            end
        end
        
        if a == "agregarCharco" and p then elementosStuntman.charcos.agregarCharco(p.x, p.y) end
    end

    -- ========== MANEJAR TRENES ==========
    if not e or e == "trenes" then
        -- MOVER TRENES Y VAGONES
        if not e or a == "mover" or a == "actualizar" then
            for _, tren in ipairs(elementosStuntman.trenes.lista) do
                -- Mover el tren principal
                tren.x = tren.x + tren.speed * elementosStuntman.trenes.velocidadBase
                
                -- Reiniciar posición si supera el límite
                if tren.x > 1430 then tren.x = 1339 end
                
                -- Mover vagones (siguiendo al tren con desplazamiento)
                for i = 1, #tren.vagones do tren.vagones[i].x = tren.x - (i * 9) tren.vagones[i].y = tren.y end
            end
        
        -- DIBUJAR TRENES Y VAGONES
        elseif a == "dibujar" then
            for _, tren in ipairs(elementosStuntman.trenes.lista) do
                -- Dibujar locomotora (tren principal)
                s(390, tren.x - c.x, tren.y - c.y, 0)
                
                -- Dibujar todos los vagones de este tren
                for _, vagon in ipairs(tren.vagones) do s(391, vagon.x - c.x, vagon.y - c.y, 0) end
            end
        
        -- VERIFICAR COLISIONES
        elseif a == "colision" and p then
            -- Asumimos sprites de 8x8 píxeles y coordenadas en la esquina superior izquierda
            for _, tren in ipairs(elementosStuntman.trenes.lista) do
                -- Verificar colisión con la locomotora (cabeza del tren)
                if p.x < tren.x + 8 and p.x + 8 > tren.x and p.y < tren.y + 8 and p.y + 8 > tren.y then return true, tren end
                
                -- Verificar colisión con cada vagón
                for _, vagon in ipairs(tren.vagones) do
                    if p.x < vagon.x + 8 and p.x + 8 > vagon.x and p.y < vagon.y + 8 and p.y + 8 > vagon.y then return true, tren end
                end
            end
            
            return false, nil  -- No hay colisión
        
        -- CONFIGURACIÓN DE TRENES
        elseif a == "configurar" and p then
            if p.velocidad then elementosStuntman.trenes.velocidadBase = p.velocidad end
            if p.trenes then elementosStuntman.trenes.lista = p.trenes end
        end
    end

    -- Manejo de acciones no reconocidas
    if e and a and not (e == "pajaros" or e == "avion" or e == "peces" or e == "charcos" or e == "trenes") then
        print("Acción no reconocida para gestionarDecoradoStuntman()", 10, 10, 8)
        return false
    end
end

function gestionarElementosMisionStuntman()
    -- ========== CONSTANTES Y CONFIGURACIONES ==========
    local frasesDisparoStuntman = { "Morite caja maligna!","eat STACCHOTTA!","TOMA!","No sos rival para mi!","Recibi justicia metalica!",
        "BOOM!"}
    
    -- ========== FUNCIONES AUXILIARES ==========
    local function crearParticulas(x, y, cantidad, color, rangoVelocidad, rangoTiempo, gravedad)
        for i = 1, cantidad do
            table.insert(todoJuego.efectosVisuales.particles, {
                x = x,y = y,dx = math.random(-rangoVelocidad, rangoVelocidad),dy = math.random(-rangoVelocidad, rangoVelocidad),
                timer = math.random(rangoTiempo[1], rangoTiempo[2]),color = color,gravity = gravedad or false })
        end
    end

    local function verificarColision(objeto, x, y, radio) return math.abs(x - objeto.x) <= radio and math.abs(y - objeto.y) <= radio end

    -- ========== MANEJO DE OBJETOS ==========
    -- CAJAS NORMALES
    for _, box in ipairs(todoJuego.gestionMisionStuntman.mision.cajasNormales) do
        if box.active then
            s(433, box.x - todoJuego.estadoJugador.camara.posicion.x, box.y - todoJuego.estadoJugador.camara.posicion.y, 0)
            if verificarColision(box, todoJuego.estadoJugador.vehiculo.x, todoJuego.estadoJugador.vehiculo.y, 8) then
                sfx(6, 30, 20, 1, 2)
                todoJuego.gestionMisionStuntman.numericos.progreso.contadorCajasDerribadas = todoJuego.gestionMisionStuntman.numericos.progreso.contadorCajasDerribadas + 1
                box.active = false
                crearParticulas(box.x, box.y, 10, 12, 2, {15, 30})
            end
        end
    end

    -- CONOS
    for _, cono in pairs(todoJuego.gestionMisionStuntman.mision.conos) do
        if cono.active then
            s(436, cono.x - todoJuego.estadoJugador.camara.posicion.x, cono.y - todoJuego.estadoJugador.camara.posicion.y, 0)
            if verificarColision(cono, todoJuego.estadoJugador.vehiculo.x, todoJuego.estadoJugador.vehiculo.y, 8) then
                sfx(6, 40, 20, 1, 2)
                todoJuego.gestionMisionStuntman.numericos.progreso.objetosChocados = todoJuego.gestionMisionStuntman.numericos.progreso.objetosChocados + 1
                todoJuego.gestionMisionStuntman.numericos.mensajeTemporal.texto = "+1 punto"
                todoJuego.gestionMisionStuntman.numericos.mensajeTemporal.tiempo = 180
                todoJuego.gestionMisionStuntman.numericos.progreso.puntuacionStuntman = todoJuego.gestionMisionStuntman.numericos.progreso.puntuacionStuntman + 1
                cono.active = false
                crearParticulas(cono.x, cono.y, 10, 10 + math.random(0, 2), 2, {30, 60}, true)
            end
        end
    end

    -- VIDRIOS
    for _, box in ipairs(todoJuego.gestionMisionStuntman.mision.vidrios) do
        if box.active then
            s(438, box.x - todoJuego.estadoJugador.camara.posicion.x, box.y - todoJuego.estadoJugador.camara.posicion.y, 0)
            if verificarColision(box, todoJuego.estadoJugador.vehiculo.x, todoJuego.estadoJugador.vehiculo.y, 8) then
                sfx(6, 40, 20, 1, 2)
                todoJuego.gestionMisionStuntman.numericos.progreso.objetosChocados = todoJuego.gestionMisionStuntman.numericos.progreso.objetosChocados + 1
                todoJuego.gestionMisionStuntman.numericos.mensajeTemporal.texto = "+1 punto"
                todoJuego.gestionMisionStuntman.numericos.mensajeTemporal.tiempo = 3
                todoJuego.gestionMisionStuntman.numericos.progreso.puntuacionStuntman = todoJuego.gestionMisionStuntman.numericos.progreso.puntuacionStuntman + 1
                box.active = false
                crearParticulas(box.x, box.y, 10, 12, 2, {15, 30})
            end
        end
    end

    -- CAJA METÁLICA
    if todoJuego.gestionMisionStuntman.mision.cajaMetalica.active then
        s(434, todoJuego.gestionMisionStuntman.mision.cajaMetalica.x - todoJuego.estadoJugador.camara.posicion.x, 
            todoJuego.gestionMisionStuntman.mision.cajaMetalica.y - todoJuego.estadoJugador.camara.posicion.y, 0)
    end

    -- GALERÍA DE TIRO
    for _, muneco in pairs(todoJuego.gestionMisionStuntman.mision.galeriatiro) do
        if muneco.active then
            s(481, muneco.x - todoJuego.estadoJugador.camara.posicion.x, muneco.y - todoJuego.estadoJugador.camara.posicion.y, 0)
        end
    end

    -- ========== MANEJO DE DISPAROS ==========
    -- Contador de frase de disparo
    if fraseDisparoTimer and fraseDisparoTimer > 0 then fraseDisparoTimer = fraseDisparoTimer - 1
    else fraseDisparoTexto = nil end

    -- Disparar desde el vehículo (Botón B)
    if btnp(5) then
        table.insert(todoJuego.gestionMisionStuntman.balasCoche, {
            x = todoJuego.estadoJugador.vehiculo.x + 8,y = todoJuego.estadoJugador.vehiculo.y + 4,
            active = true,dx = todoJuego.gestionMisionStuntman.numericos.disparos.velocidadDisparoDesdeVehiculo,dy = 0
        })

        -- Mostrar una frase aleatoria
        fraseDisparoTexto,fraseDisparoTimer = frasesDisparoStuntman[math.random(#frasesDisparoStuntman)],30
    end

    -- Dibujar la frase si está activa
    if fraseDisparoTexto then
        rect(todoJuego.estadoJugador.vehiculo.x - todoJuego.estadoJugador.camara.posicion.x, 
             todoJuego.estadoJugador.vehiculo.y - todoJuego.estadoJugador.camara.posicion.y - 20,
             #fraseDisparoTexto*5.5, 10, 0)
        print(fraseDisparoTexto, 
              todoJuego.estadoJugador.vehiculo.x - todoJuego.estadoJugador.camara.posicion.x, 
              todoJuego.estadoJugador.vehiculo.y - todoJuego.estadoJugador.camara.posicion.y - 20, 3)
    end

    -- Iterar sobre las balas
    for i = #todoJuego.gestionMisionStuntman.balasCoche, 1, -1 do
        local bullet = todoJuego.gestionMisionStuntman.balasCoche[i]
        if bullet.active then
            -- Dibujar la bala
            rect(bullet.x - todoJuego.estadoJugador.camara.posicion.x, 
                 bullet.y - todoJuego.estadoJugador.camara.posicion.y, 
                 todoJuego.gestionMisionStuntman.numericos.disparos.tamanoDisparoDesdeVehiculo, 
                 todoJuego.gestionMisionStuntman.numericos.disparos.tamanoDisparoDesdeVehiculo, 8)

            -- Actualizar posición de la bala
            bullet.x,bullet.y = bullet.x + bullet.dx,bullet.y + bullet.dy

            -- Verificar colisión con muñecos de galería de tiro
            local colisionGaleria = false
            for j, muneco in pairs(todoJuego.gestionMisionStuntman.mision.galeriatiro) do
                if muneco.active and verificarColision(muneco, bullet.x, bullet.y, 8) then
                    sfx(8, 30, 30, 1, 2)
                    muneco.active = false
                    todoJuego.gestionMisionStuntman.numericos.progreso.puntuacionStuntman = todoJuego.gestionMisionStuntman.numericos.progreso.puntuacionStuntman + 10
                    todoJuego.gestionMisionStuntman.numericos.mensajeTemporal.texto = "+10 puntos"
                    todoJuego.gestionMisionStuntman.numericos.mensajeTemporal.tiempo = 3
                    crearParticulas(muneco.x, muneco.y, 10, 8, 3, {20, 40})
                    table.remove(todoJuego.gestionMisionStuntman.balasCoche, i)
                    colisionGaleria = true
                    break
                end
            end

            -- Si no hubo colisión con galería, verificar con caja metálica
            if not colisionGaleria and todoJuego.gestionMisionStuntman.mision.cajaMetalica.active and 
               verificarColision(todoJuego.gestionMisionStuntman.mision.cajaMetalica, bullet.x, bullet.y, 8) then
               
                sfx(8, 30, 30, 1, 2)
                todoJuego.gestionMisionStuntman.mision.cajaMetalica.health = todoJuego.gestionMisionStuntman.mision.cajaMetalica.health - 1
                crearParticulas(todoJuego.gestionMisionStuntman.mision.cajaMetalica.x, 
                               todoJuego.gestionMisionStuntman.mision.cajaMetalica.y, 
                               8, 8, 2, {20, 40})
                table.remove(todoJuego.gestionMisionStuntman.balasCoche, i)

                if todoJuego.gestionMisionStuntman.mision.cajaMetalica.health <= 0 then
                    todoJuego.gestionMisionStuntman.mision.cajaMetalica.active = false
                    crearParticulas(todoJuego.gestionMisionStuntman.mision.cajaMetalica.x, 
                                  todoJuego.gestionMisionStuntman.mision.cajaMetalica.y, 
                                  20, 9, 4, {30, 60})
                end
            end
        end
    end

    -- ========== MANEJO DE PARTÍCULAS ==========
    for i = #todoJuego.efectosVisuales.particles, 1, -1 do
        local p = todoJuego.efectosVisuales.particles[i]
        p.x,p.y = p.x + p.dx,p.y + p.dy
        
        -- Aplicar gravedad si corresponde
        if p.gravity then p.dy = p.dy + 0.02 end

        -- Dibujar si está en pantalla
        if p.x >= todoJuego.estadoJugador.camara.posicion.x and p.x <= todoJuego.estadoJugador.camara.posicion.x + 240 and
           p.y >= todoJuego.estadoJugador.camara.posicion.y and p.y <= todoJuego.estadoJugador.camara.posicion.y + 136 then
            if p.color >= 10 and p.color <= 12 then
                circ(p.x - todoJuego.estadoJugador.camara.posicion.x, p.y - todoJuego.estadoJugador.camara.posicion.y, 1, p.color)
            else pix(p.x - todoJuego.estadoJugador.camara.posicion.x, p.y - todoJuego.estadoJugador.camara.posicion.y, p.color) end
        end

        -- Eliminar partículas que han terminado su tiempo
        p.timer = p.timer - 1
        if p.timer <= 0 then table.remove(todoJuego.efectosVisuales.particles, i) end
    end
end

function gestionarEfectosYExplosiones(accion, ...)
    -- Configuraciones base para diferentes efectos
       local configEfectos = {
        sangre    = {cantidad=20,color=2,tamanoMin=2,tamanoMax=4,velocidadMin=1,velocidadMax=4,vidaMin=20,vidaMax=40},
        explosion = {cantidad=15,color=8,tamanoMin=1,tamanoMax=3,velocidadMin=1,velocidadMax=3,vidaMin=15,vidaMax=30},
        electrico = {cantidad=10,color=11,tamanoMin=1,tamanoMax=2,velocidadMin=1,velocidadMax=5,vidaMin=10,vidaMax=20}
        }

    -- Modo: "explosiones" (gestión de explosiones normales y checkBoxes)
    if accion == "explosiones" or accion == "checkBoxes" then
        -- Parte de actualizar y dibujar explosiones normales (siempre se ejecuta)
        for i = #todoJuego.efectosVisuales.explosiones, 1, -1 do
            local explosion = todoJuego.efectosVisuales.explosiones[i]

            -- Dibujar partículas
            for j = #explosion.particulas, 1, -1 do
                local p = explosion.particulas[j]
                rect(p.x, p.y, p.size, p.size, p.color)
                p.x = p.x + p.dx
                p.y = p.y + p.dy
                p.timer = p.timer - 1
                if p.timer <= 0 then table.remove(explosion.particulas, j) end
            end

            -- Dibujar núcleo de la explosión : amarillo,naranja,rojo
            circ(explosion.x, explosion.y, 10, 10) circ(explosion.x, explosion.y, 7, 9) circ(explosion.x, explosion.y, 4, 8)

            -- Reducir tiempo de la explosión
            explosion.timer = explosion.timer - 1
            if explosion.timer <= 0 then table.remove(todoJuego.efectosVisuales.explosiones, i) end
        end

        -- Parte de verificación de cajas (solo si se llama con "checkBoxes")
        if accion == "checkBoxes" then
            for _, box in ipairs(todoJuego.gestionMisionStuntman.mision.cajasNormales) do
                if box.active then return false end
            end
            return true
        end

    -- Modo: "explosion_rapida" (dibujar explosión rápida)
    elseif accion == "explosion_rapida" then
        local x, y = ...
        if todoJuego.gestionMisionStuntman.numericos.temporizadores.temporizadorExplosionRapida > 0 then
            todoJuego.gestionMisionStuntman.numericos.temporizadores.temporizadorExplosionRapida = 
                todoJuego.gestionMisionStuntman.numericos.temporizadores.temporizadorExplosionRapida - 1
            
            -- Partículas pequeñas
            for i = 1, 20 do
                local angle,radius = math.rad(math.random(0, 360)), math.random(5, 15)
                local ex,ey,color = x + math.cos(angle) * radius,y + math.sin(angle) * radius,math.random(2, 4) -- Tonos cálidos
                pix(ex, ey, color)
            end
            
            -- Círculos pequeños
            for i = 1, 10 do
                local sx,sy = x + math.random(-5, 5),y + math.random(-5, 5)
                circ(sx, sy, math.random(2, 6), math.random(2, 4))
            end
            
            -- Bordes de círculos
            for i = 1, 5 do
                local fx,fy = x + math.random(-3, 3),y + math.random(-3, 3)
                circb(fx, fy, math.random(3, 7), 2)
            end
        end

    -- Modo: "crear_efecto" (crear partículas de efecto)
    elseif accion == "crear_efecto" then
        local x, y, tipo = ...
        local config = configEfectos[tipo or "sangre"] or configEfectos.sangre
        
        for i = 1, config.cantidad do
            local angle = math.random() * math.pi * 2
            local speed = math.random(config.velocidadMin, config.velocidadMax)
            local size = math.random(config.tamanoMin, config.tamanoMax)
            
            table.insert(todoJuego.efectosVisuales.particulasEfectos, 
            {x=x,y=y,dx=math.cos(angle)*speed,dy=math.sin(angle)*speed,vida=math.random(config.vidaMin,config.vidaMax),
            tamano=size,color=config.color,tipo=tipo})
        end

    -- Modo: "crear_explosion" (crear una nueva explosión)
    elseif accion == "crear_explosion" then
        local x, y, parametrosExtra = ...
        table.insert(todoJuego.efectosVisuales.explosionesActivas, {
            x = x,y = y,tiempo = 0,
            radioInicial = parametrosExtra.radioInicial or 3,duracion = parametrosExtra.duracion or 15,
            colorNucleo = parametrosExtra.colorNucleo or 8,colorAnillo = parametrosExtra.colorAnillo or 9
        })
        
        -- Añadir partículas de explosión
        gestionarEfectosYExplosiones("crear_efecto", x, y, "explosion")

    -- Modo: "actualizar_efectos" (actualizar y dibujar todos los efectos)
    elseif accion == "actualizar_efectos" then
        -- Actualizar y dibujar todas las partículas
        for i = #todoJuego.efectosVisuales.particulasEfectos, 1, -1 do
            local p = todoJuego.efectosVisuales.particulasEfectos[i]
            
            if p.vida > 0 then
                circ(p.x, p.y, p.tamano, p.color)
                p.x,p.y,p.vida = p.x + p.dx,p.y + p.dy,p.vida - 1
            else table.remove(todoJuego.efectosVisuales.particulasEfectos, i) end
        end
        
        -- Actualizar y dibujar todas las explosiones
        for i = #todoJuego.efectosVisuales.explosionesActivas, 1, -1 do
            local exp = todoJuego.efectosVisuales.explosionesActivas[i]
            local screenX = exp.x - todoJuego.estadoJugador.camara.offset.x+100
            local screenY = exp.y - todoJuego.estadoJugador.camara.offset.y+48
            
            -- Calcular progreso (0 a 1)
            local progreso = exp.tiempo / exp.duracion
            local radio = exp.radioInicial * (1 + progreso * 3)  -- Crece hasta 4x el tamaño inicial
            
            -- Dibujar explosión
            circ(screenX, screenY, radio * 0.6, exp.colorNucleo + (exp.tiempo % 2)) circ(screenX, screenY, radio, exp.colorAnillo)
            
            -- Actualizar tiempo
            exp.tiempo = exp.tiempo + 1
            
            -- Eliminar si ha terminado
            if exp.tiempo > exp.duracion then table.remove(todoJuego.efectosVisuales.explosionesActivas, i) end
        end
    end
end

function gestionarCheckpointStuntman(tipo, accion)
    local cfg = tipo and todoJuego.gestionMisionStuntman.checkpointSystem.configs[tipo] or nil
    local anim = todoJuego.gestionMisionStuntman.checkpointSystem.animation

    -- Subfunción: crear partículas de checkpoint
    local function crearParticulas(x, y, baseColor)
        for i = 1, 20 do
            local angle,speed,life = math.random() * math.pi * 2,0.5 + math.random() * 1.5,45 + math.random(30)
            local particula = {
                x = x,y = y,vx = math.cos(angle) * speed,vy = math.sin(angle) * speed - 1,
                life = life,maxLife = life,color = (baseColor or 8) + math.random(0, 3),size = 1 + math.random(2)
            }
            table.insert(todoJuego.gestionMisionStuntman.checkpointSystem.particles2, particula)
        end
    end

    -- Subfunción: actualizar lógica de checkpoint
    local function actualizarCheckpoint()
        if todoJuego.gestionMisionStuntman.booleanos.seguirCheckpoint == false then
            todoJuego.gestionMisionStuntman.numericos.progreso.contadorCheckpoint = todoJuego.gestionMisionStuntman.numericos.progreso.contadorCheckpoint + 1
        elseif todoJuego.gestionMisionStuntman.numericos.progreso.contadorCheckpoint >= 20 then
            todoJuego.gestionMisionStuntman.numericos.progreso.contadorCheckpoint = 0
            todoJuego.gestionMisionStuntman.booleanos.seguirCheckpoint = true
        end
    end

    -- Subfunción: dibujar y actualizar partículas
    local function dibujarParticulas()
        local particulas = todoJuego.gestionMisionStuntman.checkpointSystem.particles2
        for i = #particulas, 1, -1 do
            local p = particulas[i]
            if not p or not p.x or not p.y then table.remove(particulas, i)
            else
                p.x,p.y = p.x + (p.vx or 0),p.y + (p.vy or 0)
                p.vy,p.life = (p.vy or 0) + 0.05,(p.life or 0) - 1

                if p.life > 0 then
                    local screenX = p.x - (todoJuego.estadoJugador.camara.posicion.x or 0)
                    local screenY = p.y - (todoJuego.estadoJugador.camara.posicion.y or 0)
                    if screenX and screenY then circ(screenX, screenY, p.size or 1, p.color or 8) end
                else table.remove(particulas, i) end
            end
        end
    end

    -- Si solo se quiere actualizar checkpoint o dibujar partículas
    if accion == "checkpoint" then actualizarCheckpoint() return
    elseif accion == "particulas" then dibujarParticulas() return end

    -- Acciones normales con tipo definido
    if accion == "verificar" then
        if not cfg then return false end
        todoJuego.gestionMisionStuntman.booleanos.interruptorCheckpoint = true

        if not cfg.reached then
            local dx,dy = math.abs(todoJuego.estadoJugador.vehiculo.x - cfg.x),math.abs(todoJuego.estadoJugador.vehiculo.y - cfg.y)
            local distancia = dx + dy

            if distancia < 50 then
                cfg.reached = true
                crearParticulas(cfg.x, cfg.y, cfg.color) actualizarCheckpoint()
                return true
            end
        end
        return false

    elseif accion == "dibujar" then
        if not cfg then return false end

        local screenX,screenY = cfg.x - todoJuego.estadoJugador.camara.posicion.x,cfg.y - todoJuego.estadoJugador.camara.posicion.y

        if not cfg.reached then
            if anim.growing then
                anim.radiusPulse.current = anim.radiusPulse.current + anim.radiusPulse.speed
                if anim.radiusPulse.current >= anim.radiusPulse.max then anim.growing = false end
            else
                anim.radiusPulse.current = anim.radiusPulse.current - anim.radiusPulse.speed
                if anim.radiusPulse.current <= anim.radiusPulse.min then anim.growing = true end
            end

            circb(screenX, screenY, anim.radiusPulse.current + 2, cfg.color + 1)
            circ(screenX, screenY, anim.radiusPulse.current, cfg.color) circ(screenX, screenY, 2, cfg.color + 3)
        else
            if anim.timer < 30 then
                local pulse = anim.timer % 10
                circb(screenX, screenY, 8 + pulse, cfg.color + 2) circ(screenX, screenY, 4, cfg.color + 1)
                anim.timer = anim.timer + 1
            end
        end
        dibujarParticulas()
    end
end

function gestionarQTEyPersecucionStuntman(tipo, accion, ...)
    -- Configuración común para coche a perseguir
    local configPersecucion = {
        rangoMaximo = 120,coloresRango = {8, 9, 10, 11, 12, 13},
        indiceColor = math.floor(todoJuego.configuracionGeneral.temporizadorGeneral / 10) % 6 + 1 -- Cambio de color basado en tiempo
    }

    -- Inicialización del sistema QTE si no existe
    if not qteSystem then
        qteSystem = {active=false,timer=0,duration=90,success=false,failed=false,pressCount=0,requiredPresses=5,showDevDialog=false}
    end

    -- Lógica para coche a perseguir
    if tipo == "persecucion" then
        if accion == "dibujar" then
            s(379, 
                todoJuego.gestionMisionStuntman.mision.cocheAPerseguir.x - todoJuego.estadoJugador.camara.posicion.x, 
                todoJuego.gestionMisionStuntman.mision.cocheAPerseguir.y - todoJuego.estadoJugador.camara.posicion.y, 0)
        
        elseif accion == "dibujar_rango" then
            local colorActual = configPersecucion.coloresRango[configPersecucion.indiceColor]
            for r = todoJuego.gestionMisionStuntman.numericos.varias.rangoDeSeguimientoCocheAPerseguir - 5, todoJuego.gestionMisionStuntman.numericos.varias.rangoDeSeguimientoCocheAPerseguir, 2 do
                circb(todoJuego.gestionMisionStuntman.mision.cocheAPerseguir.x - todoJuego.estadoJugador.camara.posicion.x, 
                    todoJuego.gestionMisionStuntman.mision.cocheAPerseguir.y - todoJuego.estadoJugador.camara.posicion.y, 
                    r, 
                    colorActual)
            end
        
        elseif accion == "actualizar" then
            -- Mover coche objetivo
            todoJuego.gestionMisionStuntman.mision.cocheAPerseguir.y = todoJuego.gestionMisionStuntman.mision.cocheAPerseguir.y - todoJuego.gestionMisionStuntman.mision.cocheAPerseguir.speed
            
            -- Calcular distancia entre jugador y coche objetivo
            local dx = todoJuego.estadoJugador.vehiculo.x - todoJuego.gestionMisionStuntman.mision.cocheAPerseguir.x
            local dy = todoJuego.estadoJugador.vehiculo.y - todoJuego.gestionMisionStuntman.mision.cocheAPerseguir.y
            todoJuego.gestionMisionStuntman.numericos.varias.distanciaEntreJugadoryCocheAPerseguir = math.sqrt(dx^2 + dy^2)
            
            -- Verificar si se perdió el rastro
            if todoJuego.gestionMisionStuntman.numericos.varias.distanciaEntreJugadoryCocheAPerseguir > configPersecucion.rangoMaximo then
                todoJuego.dialogosStuntman.estadoMision = "gameover"
                todoJuego.gestionMisionStuntman.numericos.estadoJuego.interruptorParteMisionStuntman = "gameover"
                return true  -- Indica que se perdió el rastro
            elseif todoJuego.gestionMisionStuntman.numericos.temporizadores.cuentaAtrasStuntman == 0 then
                todoJuego.dialogosStuntman.estadoMision = "7completado"
                return false  -- Indica éxito en la misión
            end
            return nil  -- Estado intermedio (aún en progreso)
        end

    -- Lógica para QTE
    elseif tipo == "qte" then
        if accion == "start" then
            -- Iniciar nuevo QTE
            qteSystem.timer = qteSystem.duration
            qteSystem.active,qteSystem.success,qteSystem.failed,qteSystem.showDevDialog = true,false,false,false
            qteSystem.pressCount = 0

        elseif accion == "update" then
            -- Actualizar lógica del QTE
            if qteSystem.active then
                qteSystem.timer = qteSystem.timer - 1
                
                -- Verificar input del jugador
                if btnp(4) then qteSystem.pressCount = qteSystem.pressCount + 1 end
                
                -- Verificar condiciones de éxito/fracaso
                if qteSystem.pressCount >= qteSystem.requiredPresses then
                    qteSystem.success,qteSystem.active,qteSystem.showDevDialog = true,false,true
                    todoJuego.gestionMisionStuntman.numericos.temporizadores.cuentaAtrasStuntman = 
                    todoJuego.gestionMisionStuntman.numericos.temporizadores.cuentaAtrasStuntman + 60
                elseif qteSystem.timer <= 0 then qteSystem.failed,qteSystem.active = true,false end
            end

        elseif accion == "draw" then
            -- Dibujar interfaz QTE
            if qteSystem.active then
                -- Dibujar fondo del indicador
                rect(50, 50, 140, 20, 1)
                
                -- Dibujar barra de tiempo
                local barWidth = (qteSystem.timer/qteSystem.duration) * 140
                rect(50, 50, barWidth, 20, 12)
                
                -- Instrucciones
                p("PRESIONA RAPIDO EL BOTON 4 (A)!", 30, 50, 0)
                p("Pulsaciones: "..qteSystem.pressCount.."/"..qteSystem.requiredPresses, 60, 80, 0)
                
            elseif qteSystem.success then p("EXITO!", 110, 68, 11, true, 2) p("Dialogos de Desarrollador Activado", 10, 78, 11, true, 1)
                
            elseif qteSystem.failed then print("FALLADO!", 110, 68, 8, true, 2)
            end
        end

        -- Devolver estado si es necesario
        if accion == "status" then
            return {
                active = qteSystem.active,success = qteSystem.success,failed = qteSystem.failed,showDevDialog = qteSystem.showDevDialog
            }
        end
    end
end

function todoMisionStuntman()
    local m, e, p, t, j, c = 
    todoJuego.gestionMisionStuntman,todoJuego.gestionMisionStuntman.numericos.estadoJuego,
    todoJuego.gestionMisionStuntman.numericos.progreso,todoJuego.gestionMisionStuntman.numericos.temporizadores,
    todoJuego.estadoJugador,todoJuego.estadoJugador.camara.posicion

    local function gestionarAro(accion)
    -- Inicializar partículas de fuego si no existen
    if not todoJuego.gestionMisionStuntman.mision.aroParaSaltar.particulas then
        todoJuego.gestionMisionStuntman.mision.aroParaSaltar.particulas = {}
    end
    
    -- Actualizar estado del aro y partículas
    if accion == "actualizar" then
        todoJuego.gestionMisionStuntman.mision.aroParaSaltar.timer = todoJuego.gestionMisionStuntman.mision.aroParaSaltar.timer + 1
        
        -- Cambiar estado cada 2 segundos (120 frames)
        if todoJuego.gestionMisionStuntman.mision.aroParaSaltar.timer >= 120 then
            todoJuego.gestionMisionStuntman.mision.aroParaSaltar.state = todoJuego.gestionMisionStuntman.mision.aroParaSaltar.state == "normal" and "fire" or "normal"
            todoJuego.gestionMisionStuntman.mision.aroParaSaltar.timer = 0
            -- Limpiar partículas al cambiar estado
            if todoJuego.gestionMisionStuntman.mision.aroParaSaltar.state == "normal" then
                todoJuego.gestionMisionStuntman.mision.aroParaSaltar.particulas = {}
            end
        end
        
        -- Generar nuevas partículas de fuego si está activo
        if todoJuego.gestionMisionStuntman.mision.aroParaSaltar.state == "fire" and todoJuego.gestionMisionStuntman.mision.aroParaSaltar.timer % 5 == 0 then
            for i = 1, 2 do  -- 2 partículas cada 5 frames
                table.insert(todoJuego.gestionMisionStuntman.mision.aroParaSaltar.particulas, {
                    x = (todoJuego.gestionMisionStuntman.mision.aroParaSaltar.x - 8) + math.random(0, 16),
                    y = (todoJuego.gestionMisionStuntman.mision.aroParaSaltar.y - 8) + math.random(0, 16),
                    dx = (math.random() - 0.5) * 0.5,dy = -math.random() * 1.5,
                    vida = 30 + math.random(20),tam = 1 + math.random(2)
                })
            end
        end
        
        -- Actualizar partículas existentes
        for i, p in ipairs(todoJuego.gestionMisionStuntman.mision.aroParaSaltar.particulas) do
            p.x,p.y,p.vida,p.dy = p.x + p.dx,p.y + p.dy,p.vida - 1,p.dy - 0.02  -- Gravedad inversa (el fuego sube más lento)
            
            -- Eliminar partículas muertas
            if p.vida <= 0 then table.remove(todoJuego.gestionMisionStuntman.mision.aroParaSaltar.particulas, i) end
        end
    
    -- Verificar colisión con el jugador
    elseif accion == "verificar_colision" and todoJuego.gestionMisionStuntman.booleanos.cocheEstaSaltando then
        -- Detección básica de colisión con el aro
        local colisionAroX = todoJuego.estadoJugador.vehiculo.x + 8 >= todoJuego.gestionMisionStuntman.mision.aroParaSaltar.x - 8 and 
                            todoJuego.estadoJugador.vehiculo.x <= todoJuego.gestionMisionStuntman.mision.aroParaSaltar.x + 8
        local colisionAroY = todoJuego.estadoJugador.vehiculo.y + 8 >= todoJuego.gestionMisionStuntman.mision.aroParaSaltar.y - 8 and 
                            todoJuego.estadoJugador.vehiculo.y <= todoJuego.gestionMisionStuntman.mision.aroParaSaltar.y + 8
        
        if colisionAroX and colisionAroY then
            todoJuego.gestionMisionStuntman.booleanos.aroSaltadoSinQuemarse = true
            
            -- Verificar colisión con partículas de fuego si está activo
            if todoJuego.gestionMisionStuntman.mision.aroParaSaltar.state == "fire" then
                for i, p in ipairs(todoJuego.gestionMisionStuntman.mision.aroParaSaltar.particulas) do
                    local distX = math.abs((todoJuego.estadoJugador.vehiculo.x + 8) - p.x)
                    local distY = math.abs((todoJuego.estadoJugador.vehiculo.y + 8) - p.y)
                    if distX < 8 and distY < 8 then
                        todoJuego.gestionMisionStuntman.booleanos.quemadoPorAro = true
                        break
                    end
                end
            else todoJuego.gestionMisionStuntman.booleanos.aroSaltadoSinQuemarse = true end
        end
    end
    end

    local function gestionarRampas(rampa, accion)
    -- Inicialización de estructuras si no existen
    if not sistemaRampas then
        sistemaRampas={duracionSalto=50,saltoInicioX=0,saltoInicioY=0,deltaX=0,deltaY=0,direccionSalto=nil,particulasSalto={}}
    end

    -- Funciones internas
    local function dibujarAterrizaje()
        if rampa.aterrizajeX and rampa.aterrizajeY then
            local ax, ay = rampa.aterrizajeX - todoJuego.estadoJugador.camara.posicion.x, 
                           rampa.aterrizajeY - todoJuego.estadoJugador.camara.posicion.y
            circb(ax, ay, 10, 12);circ(ax, ay, 8, 13)
        end
    end

    local function verificarColision()
        if not todoJuego.gestionMisionStuntman.booleanos.cocheEstaSaltando then
            local colisionX = todoJuego.estadoJugador.vehiculo.x + 8 >= rampa.x and 
                             todoJuego.estadoJugador.vehiculo.x <= rampa.x + rampa.ancho
            local colisionY = todoJuego.estadoJugador.vehiculo.y + 8 >= rampa.y and 
                             todoJuego.estadoJugador.vehiculo.y <= rampa.y + rampa.alto
            
            if colisionX and colisionY then
                sfx(8, 60, 20, 1, 2)
                todoJuego.gestionMisionStuntman.booleanos.cocheEstaSaltando = true
                todoJuego.gestionMisionStuntman.numericos.temporizadores.temporizadorSalto = 0
                sistemaRampas.saltoInicioX = todoJuego.estadoJugador.vehiculo.x
                sistemaRampas.saltoInicioY = todoJuego.estadoJugador.vehiculo.y
                sistemaRampas.deltaX = (rampa.aterrizajeX - todoJuego.estadoJugador.vehiculo.x) / sistemaRampas.duracionSalto
                sistemaRampas.deltaY = (rampa.aterrizajeY - todoJuego.estadoJugador.vehiculo.y) / sistemaRampas.duracionSalto
                sistemaRampas.direccionSalto = rampa.direccion
                todoJuego.gestionMisionStuntman.booleanos.controlesBloqueados = true
                return true
            end
        end
        return false
    end

    local function dibujarEfectoDireccion()
        local rx, ry = rampa.x - todoJuego.estadoJugador.camara.posicion.x, rampa.y - todoJuego.estadoJugador.camara.posicion.y
        local tiempo,intensidad = time() / 100,5

        if rampa.direccion == "arriba" then
            for i = 1, intensidad do
                local offset = math.sin(tiempo + i) * 3
                line(rx + rampa.ancho/2 - 5 + offset, ry - i*3, 
                     rx + rampa.ancho/2 + 5 + offset, ry - i*3, 12)
                pix(rx + rampa.ancho/2 + offset, ry - i*3 - 2, 12)
            end
            line(rx + rampa.ancho/2, ry - 15, rx + rampa.ancho/2 - 5, ry - 10, 12)
            line(rx + rampa.ancho/2, ry - 15, rx + rampa.ancho/2 + 5, ry - 10, 12)
        elseif rampa.direccion == "abajo" then
            -- Resto de direcciones...
        end
    end

    local function dibujarEstela()
        local cx, cy = todoJuego.estadoJugador.vehiculo.x - todoJuego.estadoJugador.camara.posicion.x + 8, 
                      todoJuego.estadoJugador.vehiculo.y - todoJuego.estadoJugador.camara.posicion.y + 8
        local tiempo = time() / 50

        if #sistemaRampas.particulasSalto < 20 then
            table.insert(sistemaRampas.particulasSalto, { x = cx,y = cy,vida = 30,offset = math.random() * 2 - 1 })
        end

        for i, p in ipairs(sistemaRampas.particulasSalto) do
            if sistemaRampas.direccionSalto == "arriba" then
                p.y = p.y + 2 + math.sin(tiempo + i) * 1
                p.x = p.x + p.offset
            -- Resto de direcciones...
            end

            p.vida = p.vida - 1
            local color,alpha = 10 + (i % 5),p.vida / 30
            circ(p.x, p.y, 1 + alpha, color)

            if p.vida <= 0 then table.remove(sistemaRampas.particulasSalto, i) end
        end
    end

    local function manejarSalto()
        if todoJuego.gestionMisionStuntman.booleanos.cocheEstaSaltando then
            rect(rampa.x-todoJuego.estadoJugador.camara.posicion.x, rampa.y-todoJuego.estadoJugador.camara.posicion.y-40, 35, 10, 0)
            print("YAHOOO", rampa.x-todoJuego.estadoJugador.camara.posicion.x, rampa.y-todoJuego.estadoJugador.camara.posicion.y-40, 4)
            
            todoJuego.gestionMisionStuntman.numericos.temporizadores.temporizadorSalto = 
                todoJuego.gestionMisionStuntman.numericos.temporizadores.temporizadorSalto + 1
            
            todoJuego.estadoJugador.vehiculo.x = todoJuego.estadoJugador.vehiculo.x + sistemaRampas.deltaX
            todoJuego.estadoJugador.vehiculo.y = todoJuego.estadoJugador.vehiculo.y + sistemaRampas.deltaY
            
            dibujarEstela()
            
            if todoJuego.gestionMisionStuntman.numericos.temporizadores.temporizadorSalto >= sistemaRampas.duracionSalto then
                todoJuego.gestionMisionStuntman.booleanos.cocheEstaSaltando = false
                todoJuego.gestionMisionStuntman.booleanos.controlesBloqueados = false
                todoJuego.estadoJugador.vehiculo.x = rampa.aterrizajeX - 8
                todoJuego.estadoJugador.vehiculo.y = rampa.aterrizajeY - 8
                todoJuego.gestionMisionStuntman.booleanos.saltoConExito = true
            end
        end
    end

    -- Ejecutar acciones según el parámetro
    if accion == "dibujar" then
        dibujarAterrizaje()
        if not todoJuego.gestionMisionStuntman.booleanos.cocheEstaSaltando then
            local distancia = math.sqrt((todoJuego.estadoJugador.vehiculo.x - rampa.x)^2 + (todoJuego.estadoJugador.vehiculo.y - rampa.y)^2)
            if distancia < 40 then
                dibujarEfectoDireccion()
                local ax, ay = rampa.aterrizajeX - todoJuego.estadoJugador.camara.posicion.x, 
                              rampa.aterrizajeY - todoJuego.estadoJugador.camara.posicion.y
                local cx, cy = todoJuego.estadoJugador.vehiculo.x + 8 - todoJuego.estadoJugador.camara.posicion.x, 
                              todoJuego.estadoJugador.vehiculo.y + 8 - todoJuego.estadoJugador.camara.posicion.y
                line(cx, cy, ax, ay, 13)
            end
        end
    elseif accion == "actualizar" then verificarColision();manejarSalto()
    elseif accion == "limpiar" then sistemaRampas.particulasSalto = {}
    end
    end

    local function dibujarObjetosEspeciales(tipo)
    if tipo == "rampas" then
        s(435, todoJuego.gestionMisionStuntman.mision.rampas[1].x - todoJuego.estadoJugador.camara.posicion.x, todoJuego.gestionMisionStuntman.mision.rampas[1].y - todoJuego.estadoJugador.camara.posicion.y, 0)
        s(435, todoJuego.gestionMisionStuntman.mision.rampas[2].x - todoJuego.estadoJugador.camara.posicion.x, todoJuego.gestionMisionStuntman.mision.rampas[2].y - todoJuego.estadoJugador.camara.posicion.y, 0)
    elseif tipo == "aro" then
        local aroX = todoJuego.gestionMisionStuntman.mision.aroParaSaltar.x - todoJuego.estadoJugador.camara.posicion.x - 8
        local aroY = todoJuego.gestionMisionStuntman.mision.aroParaSaltar.y - todoJuego.estadoJugador.camara.posicion.y - 8
        
        -- Dibujar el aro base
        local color = todoJuego.gestionMisionStuntman.mision.aroParaSaltar.state == "normal" and 12 or 8  -- Azul o rojo
        circb(aroX, aroY, 8, color)
        
        -- Dibujar partículas de fuego si está activo
        if todoJuego.gestionMisionStuntman.mision.aroParaSaltar.state == "fire" then
            for i, p in ipairs(todoJuego.gestionMisionStuntman.mision.aroParaSaltar.particulas) do
                local partX,partY = p.x - todoJuego.estadoJugador.camara.posicion.x,p.y - todoJuego.estadoJugador.camara.posicion.y
                
                -- Degradado de color según vida
                local fireColor = 2  -- Rojo base
                if p.vida < 15 then fireColor = 3 end  -- Naranja al desaparecer
                
                -- Dibujar partícula
                circ(partX, partY, p.tam, fireColor)
                
                -- Punto más brillante en el centro
                pix(partX, partY, 4)  -- Amarillo
            end
            
            -- Dibujar efecto de calor alrededor del aro
            local tiempo = time() / 100
            for i = 1, 8 do
                local offset = math.sin(tiempo + i) * 2
                circb(aroX, aroY, 8 + i/2 + offset, 2 + (i % 2))
            end
        end
        
    elseif tipo == "circulo_victoria" then
        circ(todoJuego.gestionMisionStuntman.mision.circuloVictoria.x - todoJuego.estadoJugador.camara.posicion.x, 
             todoJuego.gestionMisionStuntman.mision.circuloVictoria.y - todoJuego.estadoJugador.camara.posicion.y, 
             todoJuego.gestionMisionStuntman.mision.circuloVictoria.radius, 13)
    end
    end

    local function manejarBomba(a)
  if a=="mensaje"then
    rect(0,60,240,10,0)
    print("BOMBA EXPLOTARA EN 2 SEGUNDOS,SALI DE AHI",0,60,6)

  elseif a=="iniciarBomba"then
    local d,j,c=todoJuego.gestionMisionStuntman,todoJuego.estadoJugador.jugador,todoJuego.estadoJugador.camara.posicion
    local r,b=d.numericos.varias.radioExplosionBombaStuntman,d.checkpointSystem.configs.bomba

    if r<40 then
      d.numericos.varias.radioExplosionBombaStuntman=r+1
      circ(b.x-c.x,b.y-c.y,r,8+(r%2))
    else d.booleanos.explosionExitosa=true
    end

    -- Verificación de explosión
    local dist=math.sqrt((j.x-b.x)^2+(j.y-b.y)^2)
    if dist<r then
      d.booleanos.jugadorAtrapadoPorExplosion=true
      gestionarEstadoJuegoStuntman("gameover")
    elseif d.booleanos.explosionExitosa and not d.booleanos.jugadorAtrapadoPorExplosion then
      todoJuego.dialogosStuntman.estadoMision="10completado"
      d.booleanos.mostrarObjetivoCompletado=true
    end
  end
end

    -- Función integrada para dibujar texto con efecto arcoíris y borde
    local function dibujarTextoArcoirisBordeado(texto, x, y, max_ancho)
  -- Configuración compacta
  local cfg = { espaciado = 8, fondo = 0,colores = {1,2,3,5,6,7,8,9,10,14,15} }

  -- Procesamiento de texto
  local lineas, palabras = {}, {}
  for palabra in texto:gmatch("%S+") do palabras[#palabras+1] = palabra end

  -- Construcción de líneas
  local linea = ""
  for _, palabra in ipairs(palabras) do
    local prueba = linea .. (linea == "" and "" or " ") .. palabra
    if print(prueba,0,-100,0,true,1,false) <= max_ancho then
      linea = prueba
    else
      if linea == "" then  -- Palabra muy larga
        for c in palabra:gmatch(".") do
          if print(linea..c,0,-100,0,true,1,false) <= max_ancho then
            linea = linea..c
          else
            lineas[#lineas+1], linea = linea, c
          end
        end
      else
        lineas[#lineas+1], linea = linea, palabra
      end
    end
  end
  if linea ~= "" then lineas[#lineas+1] = linea end

  -- Dibujado
  for i, linea in ipairs(lineas) do
    local py = y + (i-1)*cfg.espaciado
    rect(x-3, py-2, print(linea,0,-100,0,true,1,false)+6, 10, cfg.fondo)
    
    for j = 1, #linea do
      local px = x + (j-1)*6
      local color = cfg.colores[((time()//100)+i+j)%#cfg.colores+1]
      
      -- Borde
      for dy=-1,1 do for dx=-1,1 do
        if dx~=0 or dy~=0 then print(linea:sub(j,j), px+dx, py+dy, 0) end
      end end
      
      -- Carácter
      print(linea:sub(j,j), px, py, color)
    end
  end
end
    
    if not m.booleanos.puenteDestruido then
        for y=831,855,8 do for x=1388,1396,8 do spr(17,x-c.x,y-c.y,0) end end
    end

    t.temporizadorExplosionRapida=t.temporizadorExplosionRapida-1
    for _,a in ipairs{"actualizar","dibujar"} do gestionarDecoradoStuntman(nil,a) end

    if t.cuentaAtrasStuntman>0 and todoJuego.dialogosStuntman.estadoMision~="gameover" and e.interruptorParteMisionStuntman~=0 then
        t.cuentaAtrasStuntman=t.cuentaAtrasStuntman-1
    end

    spr(258,m.numericos.personajes.silvestreStacchotta.x-c.x,m.numericos.personajes.silvestreStacchotta.y-c.y,0)
    spr(303,0,5,0);spr(319,180,0,0)
    rect(145,20,100,6,0);rect(0,0,240,20,0)
    dibujarJugador("esParaMisionStuntman")
    print("Flechas : Moverse",145,20,3);print("PUNTOS: "..p.puntuacionStuntman,160,9,4)
    for _,o in ipairs{"rampas","aro"} do dibujarObjetosEspeciales(o) end
    for _,d in ipairs{{"charcos","agregarCharco",{x=100,y=50}},{"trenes","mover"},{"trenes","dibujar"}} do gestionarDecoradoStuntman(d[1],d[2],d[3]) end
    gestionarElementosMisionStuntman()
    verificarLimitesMapaConCamara("verificar_limites", true)
    todoClimatologia()

    if m.booleanos.colision then
        spr(137,40,50,0)
        rectb(49,49,131,11,3);rect(50,50,130,10,4)
        print("A donde vas, wachin?",50,50,0)
        m.booleanos.colision=false
    end

    if m.booleanos.nitroActivado then
        rect(j.jugador.x-c.x-10,j.jugador.y-c.y-20,70,10,0) 
        print("OH YEAHHHHH!",j.jugador.x-c.x-10,j.jugador.y-c.y-20,3)
    end

    gestionarPantallaStuntman("inactividad",300,300);gestionarPantallaStuntman("temporal")

    if not m.booleanos.cocheEstaSaltando and j.vehiculo.x>1319 and j.vehiculo.x<1342 and j.vehiculo.y>1017 and j.vehiculo.y<1087 then
        m.booleanos.controlesBloqueadosTiburon=true
        gestionarEstadoJuegoStuntman("mordidoPorTiburon",j.vehiculo.x-c.x,j.vehiculo.y-c.y)
        p.contadorTiburon=p.contadorTiburon+1
        print("MORDIDO POR TIBURON",40,40,2)
        if p.contadorTiburon==25 then 
            gestionarEstadoJuegoStuntman("gameover")
            j.vehiculo.x,j.vehiculo.y=1086,1055
            p.contadorTiburon=0
        end
    end
    
    if todoJuego.dialogosStuntman.estadoMision~="gameover" and todoJuego.dialogosStuntman.estadoMision~="10completado" and e.interruptorParteMisionStuntman~=0 then
        local isCountdownPhase=false
        for i=1,10 do
            if e.interruptorParteMisionStuntman=="cuentaatras"..i then
                isCountdownPhase=true
                break
            end
        end
        if isCountdownPhase then p.tiempoTotalStuntman=p.tiempoTotalStuntman+1 end
    end
    
    print(string.format("%d:%02d",p.tiempoTotalStuntman//60,p.tiempoTotalStuntman%60),10,5,12,-1,2)

    if p.objetivoTexto~="" and not m.booleanos.mostrarObjetivoCompletado and not m.booleanos.noMostrarObjetivoAun then
        dibujarTextoArcoirisBordeado("OBJETIVO "..e.lafase..": "..p.objetivoTexto,0,120,200)
    end
    
    if m.booleanos.mostrarObjetivoCompletado then
        p.tiempoMostrarObjetivo=p.tiempoMostrarObjetivo+1
        rect(0,120,140,10,0)
        print("OBJETIVO COMPLETADO! +"..m.puntosPorFase[faseNumero or 1],0,120,3)
        if p.tiempoMostrarObjetivo>15 then
            m.booleanos.mostrarObjetivoCompletado=false
            p.tiempoMostrarObjetivo=0
        end
    end

    if e.interruptorParteMisionStuntman==0 then
        dibujarTextoArcoirisBordeado(todoJuego.dialogosStuntman.descripcionMision,0,0,200)
        rect(0,90,240,40,0)
        print("Inicio Rapido Fase: "..e.selectorFase,5,120,8)
        local faseDescriptions={"Subir a coche","Atropellar cajas","Nitro / Checkpoint","Disparar a caja","Saltar en rampa","Esquivar coches","Perseguir coche","Saltar aro","Esquivar trenes","Escapar de Bomba"}
        print(faseDescriptions[e.selectorFase]or"",125,120,4)
        for _,p in ipairs{{"BOTON 4: Fase Anterior",5,91,10},{"BOTON 5: Fase 1",135,101,4},{"BOTON 6: Fase Siguiente",5,101,10},{"BOTON 7: Empezar",5,111,10}} do print(p[1],p[2],p[3],p[4]) end
        if btnp(4)then e.selectorFase=(e.selectorFase-2)%10+1 end
        if btnp(6)then e.selectorFase=e.selectorFase%10+1 end
        if btn(7)then
            e.interruptorParteMisionStuntman="cuentaatras"..e.selectorFase
            local startPositions={[4]={1270,1025},[5]={1266,1060},[6]={1392,979},[7]={1392,979},[8]={1377,898},[9]={1399,819},[10]={1389,716}}
            if startPositions[e.selectorFase]then j.vehiculo.x,j.vehiculo.y=startPositions[e.selectorFase][1],startPositions[e.selectorFase][2]end
            m.booleanos.jugadorEstaEnVehiculo=true
            gestionarEstadoJuegoStuntman("completePhase",e.selectorFase-1)
        end
        if btnp(5)then
            e.interruptorParteMisionStuntman=1
            e.indiceDialogoStuntman=1
            cuentaAtrasActiva=true
            p.objetivoTexto=gestionarPantallaStuntman("objetivo",nil,nil,1)
        end
        return
    end
    
    local function handleDialogue(alternativo)
        m.booleanos.controlesBloqueados=true
        local parteActual=tonumber(e.interruptorParteMisionStuntman)
        if parteActual and parteActual>=1 and parteActual<=10 then
            local tipoDialogo=alternativo and "alternativo"or"normal"
            local dialogoActual=todoJuego.dialogosStuntman.misionStuntman.partes[parteActual][tipoDialogo]
            if dialogoActual and e.indiceDialogoStuntman<=#dialogoActual then
                dibujarTextoArcoirisBordeado(dialogoActual[e.indiceDialogoStuntman],0,0,200)
                if m.booleanos.mostrarDialogosDesarrollo then
                    m.booleanos.noMostrarObjetivoAun=true
                    dibujarTextoArcoirisBordeado("Comentarios de Desarrollo",0,90,200)
                    dibujarTextoArcoirisBordeado(todoJuego.dialogosStuntman.desarrollo[todoJuego.dialogosStuntman.dialogoDesarrolloRandom],0,100,200)
                end
                spr(258,200,0)
                if btnp(4)then
                    m.booleanos.mostrarDialogosDesarrollo=false
                    for i=1,10 do _G["todoJuego.gestionMisionStuntman.booleanos.gameOverFase"..i]=false end
                    e.indiceDialogoStuntman=e.indiceDialogoStuntman+1
                    sfx(3,200,10,0,1)
                    if e.indiceDialogoStuntman>#dialogoActual then
                        local tiempoCuentaAtras=(parteActual==7)and 120 or 300
                        t.cuentaAtrasStuntman=tiempoCuentaAtras
                        e.interruptorParteMisionStuntman="cuentaatras"..parteActual
                        e.indiceDialogoStuntman=1
                        p.objetivoTexto=gestionarPantallaStuntman("objetivo",nil,nil,parteActual)
                    end
                end
                return
            end
        end
    end

    if m.booleanos.dialogoAlternativo then handleDialogue(true) else handleDialogue(false) end

    if m.booleanos.controlesBloqueadosTiburon==false then m.booleanos.controlesBloqueados=false end
    
    local textoCAS=string.format("%d:%02d",t.cuentaAtrasStuntman//60,t.cuentaAtrasStuntman%60)

    if type(e.interruptorParteMisionStuntman)=="string" and e.interruptorParteMisionStuntman:find("cuentaatras")then
        m.booleanos.dialogoAlternativo=false
        recordMode=true
        local faseNumero=tonumber(e.interruptorParteMisionStuntman:match("%d+"))or 0
        print(textoCAS,190,2,4)
        if m.booleanos.controlesBloqueadosTiburon then m.booleanos.controlesBloqueadosTiburon=false end
        spr(457,70,2,1)
        print("ESCENA "..faseNumero,80,2,12)
        if todoJuego.dialogosStuntman.estadoMision~="gameover"then
            recordMode=false
            todoJuego.dialogosStuntman.estadoMision="objetivo"..faseNumero.."Incompleto"
        end
        
        local distToSilvestre=math.sqrt((j.vehiculo.x-m.numericos.personajes.silvestreStacchotta.x)^2+(j.vehiculo.y-m.numericos.personajes.silvestreStacchotta.y)^2)
        if distToSilvestre<=20 or math.sqrt((j.jugador.x-m.numericos.personajes.silvestreStacchotta.x)^2+(j.jugador.y-m.numericos.personajes.silvestreStacchotta.y)^2)<=20 then
            --dialogoOculto("Silvestre Stacchotta",m.numericos.personajes.silvestreStacchotta.x-c.x-70,m.numericos.personajes.silvestreStacchotta.y-c.y+20)
            gestionarPantallaStuntman(nil, m.numericos.personajes.silvestreStacchotta.x-c.x-70,m.numericos.personajes.silvestreStacchotta.y-c.y+20, nil, "Silvestre Stacchotta")
        end

        local phaseHandlers={
            [1]=function()
                recordMode=true
                
                rect(0,20,100,6,0)
                print("B: Subir a vehiculo",0,20,3)
                if btn(5)and dibujarJugador("cochecerca") then
                    sfx(7,150,5,0,1)
                    gestionarEstadoJuegoStuntman("completePhase",1)
                    m.booleanos.jugadorEstaEnVehiculo=true
                    t.temporizadorExplosionRapida=120
                    m.numericos.mensajeTemporal.tiempo=5
                end
            end,
            [2]=function()
       
                rect(105,30,140,10,0)
                print("Cajas derribadas: "..p.contadorCajasDerribadas.." / 10",105,30,3)
               gestionarEfectosYExplosiones("explosion_rapida", 1243-c.x, 1050-c.y)
               if not m.booleanos.mostrarDialogosDesarrollo then
                    spr(302,1219-c.x,991-c.y,0)
                    if math.sqrt((j.jugador.x-1219)^2+(j.jugador.y-991)^2)<=20 then
                        rect(30,30,190,10,0)
                        print("Activar dialogos de desarrollador?",30,30,4)
                        -- Actualizar lógica QTE primero
               gestionarQTEyPersecucionStuntman("qte", "update")

              -- Iniciar nuevo QTE solo si se presiona el botón y no hay uno activo
              local estado = gestionarQTEyPersecucionStuntman("qte", "status")
              if btnp(4) and estado and not estado.active and not estado.success and not estado.failed then
              gestionarQTEyPersecucionStuntman("qte", "start")
                      end
                    end
                end
              

             -- Dibujar interfaz QTE
             gestionarQTEyPersecucionStuntman("qte", "draw")
               if gestionarEfectosYExplosiones("checkBoxes") then 
                    gestionarEstadoJuegoStuntman("completePhase",2) 
                    t.temporizadorExplosionRapida=120 
                end
            end,
            [3]=function()
                m.booleanos.nitroBloqueado=false
                rect(0,20,45,6,0)
                print("A: Nitro",0,20,3)
                gestionarCheckpointStuntman("stuntmanCheck","dibujar")
                if m.booleanos.transicionCheckpoint then gestionarCheckpointStuntman(nil,"checkpoint")end
                if gestionarCheckpointStuntman("stuntmanCheck","verificar")then m.booleanos.transicionCheckpoint=true end
                if p.contadorCheckpoint==20 and m.booleanos.transicionCheckpoint then
                    gestionarEstadoJuegoStuntman("completePhase",3)
                    t.temporizadorExplosionRapida=120
                    m.numericos.mensajeTemporal.tiempo=3
                    m.booleanos.nitroBloqueado=true
                end   
            end,
            [4]=function()
                m.booleanos.transicionCheckpoint=false
                rect(0,20,100,6,0)
                print("B: Disparar pistola",0,20,3)
                spr(290,220,0)
                if not m.booleanos.pistolaObtenida then 
                    m.numericos.mensajeTemporal.texto="Obtenida pistola"
                    m.booleanos.pistolaObtenida=true
                end
                if math.sqrt((j.vehiculo.x-m.numericos.personajes.silvestreStacchotta.x)^2+(j.vehiculo.y-m.numericos.personajes.silvestreStacchotta.y)^2)<=20 then
                    --dialogoOculto(todoJuego.dialogosStuntman.misionStuntman.ocultos.fase4,m.numericos.personajes.silvestreStacchotta.x-c.x-70,m.numericos.personajes.silvestreStacchotta.y-c.y-20)
                    gestionarPantallaStuntman(nil, m.numericos.personajes.silvestreStacchotta.x-c.x-70,m.numericos.personajes.silvestreStacchotta.y-c.y-20, nil, todoJuego.dialogosStuntman.misionStuntman.ocultos.fase4)
                    if not m.booleanos.yaSumoPuntosDialogoOculto then  
                        p.dialogosOcultosEncontrados=p.dialogosOcultosEncontrados+1
                        p.puntuacionStuntman=p.puntuacionStuntman+10
                        m.numericos.mensajeTemporal.tiempo=1
                        m.numericos.mensajeTemporal.texto="+10 puntos dialogo oculto"
                        m.booleanos.yaSumoPuntosDialogoOculto=true
                    end
                end
                gestionarEfectosYExplosiones("dibujarExplosion",1177-c.x,1053-c.y)
                if m.mision.cajaMetalica.health==0 then 
                    gestionarEfectosYExplosiones("dibujarExplosion",m.mision.cajaMetalica.x-c.x,m.mision.cajaMetalica.y-c.y)
                    gestionarEstadoJuegoStuntman("completePhase",4)
                    t.temporizadorExplosionRapida=120
                    m.booleanos.yaSumoPuntosDialogoOculto=false
                end
            end,
            [5]=function()
                m.booleanos.transicionCheckpoint=false
                if math.sqrt((j.vehiculo.x-m.numericos.personajes.silvestreStacchotta.x)^2+(j.vehiculo.y-m.numericos.personajes.silvestreStacchotta.y)^2)<=20 then
                    --dialogoOculto(todoJuego.dialogosStuntman.misionStuntman.ocultos.fase5,m.numericos.personajes.silvestreStacchotta.x-c.x-70,m.numericos.personajes.silvestreStacchotta.y-c.y-20)
                    gestionarPantallaStuntman(nil, m.numericos.personajes.silvestreStacchotta.x-c.x-70,m.numericos.personajes.silvestreStacchotta.y-c.y-20, nil, todoJuego.dialogosStuntman.misionStuntman.ocultos.fase5)
                    if not m.booleanos.yaSumoPuntosDialogoOculto then  
                        p.dialogosOcultosEncontrados=p.dialogosOcultosEncontrados+1
                        p.puntuacionStuntman=p.puntuacionStuntman+10
                        m.numericos.mensajeTemporal.tiempo=1
                        m.numericos.mensajeTemporal.texto="+10 puntos dialogo oculto"
                        m.booleanos.yaSumoPuntosDialogoOculto=true
                    end
                end   
                gestionarRampas(m.mision.rampas[1],"dibujar")
                gestionarRampas(m.mision.rampas[1],"actualizar")
                if m.booleanos.saltoConExito then 
                    gestionarEfectosYExplosiones("dibujarExplosion",1330-c.x,1062-c.y)
                    gestionarEstadoJuegoStuntman("completePhase",5) 
                    t.temporizadorExplosionRapida=120 
                end
            end,
            [6]=function()
                rect(m.numericos.dialogos.cochesEnLlamas.x-c.x,m.numericos.dialogos.cochesEnLlamas.y-c.y,180,10,0)
                print("Vivan las Armas Nucleares JAJAJA",m.numericos.dialogos.cochesEnLlamas.x-c.x,m.numericos.dialogos.cochesEnLlamas.y-c.y,5)
                if m.numericos.dialogos.cochesEnLlamas.x>=1250 then m.numericos.dialogos.cochesEnLlamas.x=m.numericos.dialogos.cochesEnLlamas.x-3
                else m.numericos.dialogos.cochesEnLlamas.x=1500 end
                gestionarEfectosYExplosiones("dibujarExplosion",1342-c.x,950-c.y)
                gestionarEnemigos("stuntman", "crear")
                gestionarEnemigos("stuntman", "dibujar")

                if not gestionarEnemigos("stuntman","dibujar") and t.cuentaAtrasStuntman==0 then
                    gestionarEstadoJuegoStuntman("completePhase",6)
                    t.temporizadorExplosionRapida=120
                elseif gestionarEnemigos("stuntman","dibujar") then
                    gestionarEstadoJuegoStuntman("gameover")
                    m.booleanos.gameOverFase6=true
                end
            end,
            [7]=function()
                gestionarQTEyPersecucionStuntman("persecucion", "dibujar")
                gestionarQTEyPersecucionStuntman("persecucion", "dibujar_rango")
                local resultado=gestionarQTEyPersecucionStuntman("persecucion", "actualizar")
                rect(m.mision.cocheAPerseguir.x-c.x,m.mision.cocheAPerseguir.y-c.y-30,120,10,0)
                print("No me sigais,gilipollas",m.mision.cocheAPerseguir.x-c.x,m.mision.cocheAPerseguir.y-c.y-30,5)
                if resultado==false then
                    gestionarEstadoJuegoStuntman("completePhase",7)
                    t.temporizadorExplosionRapida=120
                elseif resultado==true then
                    gestionarEstadoJuegoStuntman("gameover")
                    m.booleanos.gameOverFase7=true
                end
            end,
            [8]=function()
                gestionarEfectosYExplosiones("dibujarExplosion",1396-c.x,837-c.y)
                m.booleanos.puenteDestruido=true
                gestionarRampas(m.mision.rampas[2],"dibujar")
                gestionarRampas(m.mision.rampas[2],"actualizar")
                gestionarAro("actualizar")
                gestionarAro("verificar_colision")
                if m.booleanos.quemadoPorAro then
                    gestionarEstadoJuegoStuntman("gameover")
                    m.booleanos.gameOverFase8=true  
                elseif m.booleanos.aroSaltadoSinQuemarse then 
                    gestionarEstadoJuegoStuntman("completePhase",8)
                    t.temporizadorExplosionRapida=120
                end
            end,
            [9]=function()
                m.booleanos.controlesBloqueados=false
                dibujarObjetosEspeciales("circulo_victoria")
                gestionarCheckpointStuntman("tren","dibujar")
                gestionarCheckpointStuntman(nil,"particulas")
                rect(m.numericos.dialogos.tren.x-c.x,m.numericos.dialogos.tren.y-c.y,180,10,0)
                print("Aca viene el tren de la alegria",m.numericos.dialogos.tren.x-c.x,m.numericos.dialogos.tren.y-c.y,5)
                if m.numericos.dialogos.tren.x<=1500 then m.numericos.dialogos.tren.x=m.numericos.dialogos.tren.x+3
                else m.numericos.dialogos.tren.x=1300 end
                if gestionarCheckpointStuntman("tren","verificar")then m.booleanos.transicionCheckpoint=true end
                if p.contadorCheckpoint==20 and m.booleanos.transicionCheckpoint then
                    gestionarEstadoJuegoStuntman("completePhase",9)
                    t.temporizadorExplosionRapida=120
                    m.booleanos.transicionCheckpoint=false
                end

                if gestionarDecoradoStuntman("trenes", "colision", {x = j.jugador.x, y = j.jugador.y}) then 
                    gestionarEstadoJuegoStuntman("gameover")
                    m.booleanos.gameOverFase9=true
                end
            end,
            [10]=function()
                gestionarEfectosYExplosiones("dibujarExplosion",1384-c.x,719-c.y)
                if m.booleanos.jugadorEstaEnVehiculo then 
                    rect(0,20,100,6,0)
                    print("B: Bajar de vehiculo",0,20,3)
                end
                if m.booleanos.jugadorPreparaBomba then dibujarJugador("esParaMisionStuntman") end
                if m.booleanos.transicionCheckpoint then gestionarCheckpointStuntman(nil,"checkpoint")end
                gestionarCheckpointStuntman("bomba","dibujar")
                if gestionarCheckpointStuntman("bomba","verificar")then 
                    m.booleanos.transicionCheckpoint=true 
                    manejarBomba("iniciarBomba")
                end
                if p.contadorCheckpoint==20 and m.booleanos.transicionCheckpoint then m.booleanos.faseBomba=true end
                if m.booleanos.faseBomba then
                    if m.booleanos.jugadorEstaEnVehiculo then 
                        rect(j.vehiculo.x-c.x-80,j.vehiculo.y-c.y-20,180,10,0)
                        print("Preparar Explosion ( Boton B ) ?",j.vehiculo.x-c.x-80,j.vehiculo.y-c.y-20,3)
                        if btnp(5)then
                            dibujarJugador("salir")
                            m.booleanos.jugadorPreparaBomba=true
                        end
                    end
                    if not m.booleanos.jugadorEstaEnVehiculo then manejarBomba("mensaje") manejarBomba("iniciarBomba") end
                end
            end
        }
        
        if phaseHandlers[faseNumero]then phaseHandlers[faseNumero]()end
          
        if t.cuentaAtrasStuntman<=0 and todoJuego.dialogosStuntman.estadoMision~="gameover"then
            if todoJuego.dialogosStuntman.estadoMision:find("Incompleto")then
                local faseActual=tonumber(e.interruptorParteMisionStuntman:match("%d+"))or 1
                e.faseActualEnGameOver=faseActual
                gestionarEstadoJuegoStuntman("gameover")
                m.booleanos.dialogoAlternativo=true
                local gameOverPositions={
                    [1]={1086,1055},[2]={1149,1048},[3]={1149,1048},
                    [4]={1270,1025},[5]={1266,1060},[6]={1392,979},
                    [7]={1392,979},[8]={1377,898},[9]={1399,819},
                    [10]={1389,716}
                }
                if gameOverPositions[faseNumero]then j.vehiculo.x,j.vehiculo.y=gameOverPositions[faseNumero][1],gameOverPositions[faseNumero][2]end
                _G["todoJuego.gestionMisionStuntman.booleanos.gameOverFase"..faseNumero]=true
                e.faseActualEnGameOver=faseNumero
            elseif faseNumero<10 then
                e.interruptorParteMisionStuntman="cuentaatras"..(faseNumero+1)
                t.cuentaAtrasStuntman=(faseNumero+1==7)and 120 or 300
            end
        end
    end

    if todoJuego.dialogosStuntman.estadoMision=="gameover"then
        gestionarPantallaStuntman("gameover")
        todoJuego.dialogosStuntman.dialogoDesarrolloRandom=math.random(1,#todoJuego.dialogosStuntman.desarrollo)
        if btnp(4)then gestionarEstadoJuegoStuntman("reiniciar:misión")end
        return
    end
    
    if todoJuego.dialogosStuntman.estadoMision=="10completado"then
        gestionarPantallaStuntman("completado")
        if btnp(4)then reiniciar("misión")end
    end
end

--====== MENUS.LUA (simulado) ======--

-- JUEGO PRINCIPAL
-- MENUS DE INTRO,DE CREDITOS Y DE DEMO

function manejarJuegoPrincipalConMenus(tipo)
    -- Si no se especifica tipo o es nil, ejecutar juego principal
    if tipo == nil then
        cls(0)
        
        -- Lógica del juego principal
        todoJuego.gestionMisionStuntman.booleanos.controlesBloqueados = false
        verificarLimitesMapaConCamara("verificar_limites", false);verificarLimitesMapaConCamara("inicializar")
        todoClimatologia()
        dibujarJugador()
        dibujarElementosDelMundo(todoJuego.estadoJugador.jugador.x, todoJuego.estadoJugador.jugador.y)
        
        gestionarEntidades()
        gestionarEfectosYExplosiones("actualizar_efectos")
        gestionarEnemigos(todoJuego.estadoJugador.camara.posicion.x, todoJuego.estadoJugador.camara.posicion.y)
        gestionarUbicacion("calles", todoJuego.estadoJugador.jugador.x, todoJuego.estadoJugador.jugador.y,
                         todoJuego.estadoJugador.camara.posicion.x, todoJuego.estadoJugador.camara.posicion.y)
       
        if todoJuego.menuPrincipal.estados.misionStuntman == false or todoJuego.menuPrincipal.estados.pinball == false then
            gestionarVehiculos("trafico");gestionarVehiculos("especiales")
        end   

        if todoJuego.menuPrincipal.estados.misionStuntman == true then todoMisionStuntman() end
        if todoJuego.menuPrincipal.estados.radios == true then manejarModulos("radio") end
        if activarJetpack == true then dibujarJugador("jetpack") end
        gestionarArmas(); gestionarArmas("frases"); gestionarArmas("colisiones", false)
        gestionarDecoradoStuntman("pajaros", "actualizar");gestionarDecoradoStuntman("pajaros", "dibujar")
        
        return "juego_principal"  -- Indica que se está ejecutando el juego principal
        
    else
        -- Si se especifica un tipo, manejar pantallas especiales
        cls(0)
        local t = time()
        
        if tipo == "intro" or tipo == "creditos" then
            -- Lógica para intro y créditos
            local estado = tipo == "intro" and todoJuego.estadoIntro or todoJuego.estadoCreditos
            local temp = tipo == "intro" and estado.temporizador or todoJuego.configuracionGeneral.temporizadorGeneral
            
            local function drawElem(cont, x, y)
                local offset = tipo == "intro" and -15 or -20
                if cont then
                    for i = 1, #cont do
                        pix(x + (i-1)*6 + offset, y, (temp//5 + i) % 16)
                        print(cont:sub(i,i), x + (i-1)*6 + offset, y, (temp//5 + i) % 16)
                    end
                else
                    for _, e in ipairs(estado.estrellas) do pix(e.x, e.y, (temp//5 + e.x + e.y) % 16) end
                end
            end

            drawElem()

            if tipo == "intro" then
                drawElem(estado.mensajes[estado.indiceMensaje], 40, 60)
                if estado.indiceMensaje == 4 then drawElem("Pulsar cualquier boton", 60, 80) end
                
                estado.temporizador = estado.temporizador + 1
                if estado.temporizador % 300 == 0 then estado.indiceMensaje = estado.indiceMensaje % #estado.mensajes + 1 end
                if btn(0) or btn(1) or btn(2) or btn(3) then
                    estado.indiceMensaje, estado.temporizador = 1, 0
                    return "salir_intro"
                end
            else
                for i, l in ipairs(estado.mensaje) do drawElem(l, 20, estado.posicionY + (i-1)*12) end
                estado.posicionY = estado.posicionY - 0.5
                if estado.posicionY + #estado.mensaje*12 < 0 then
                    estado.posicionY = 136
                    return "reiniciar_creditos"
                end
            end
            
        elseif tipo == "demo" then
            -- Lógica para demo
            local rnd, max, min = math.random, math.max, math.min
            local d = demoData or {
                dialogos = {
                    "Silvestre Stacchotta : Hola, soy el famoso Actor Estadounidense Silvestre Stacchotta y me mude a Argentina",
                    "Silvestre Stacchotta : para protagonizar mi nueva pelicula Mambo.",
                    "Silvestre Stacchotta : Vine a divertirme mucho y quiero hacer muchas cosas chanchas, jajaja!"
                },
                dialogoActual = 1,temporizador = 0,posX = 40, posY = 40,direccionX = 1, direccionY = 1,
                velocidad = 0.5,cambioDireccion = 60,mostrarTextoDemo = true,tiempoParpadeo = 0,duracionParpadeo = 180,
                ultimoCambioDialogo = 0
            }
            demoData = d

            local function rainbowText(txt, x, y, s, blackCenter)
                local colors,t = todoJuego.baile.coloresArcoiris,t//30
                for i = 1, #txt do
                    local c = txt:sub(i,i)
                    local px = x + (i-1)*6*s
                    local col = colors[(t+i) % #colors + 1]
                    for dx = -1,1 do for dy = -1,1 do
                        if dx~=0 or dy~=0 then print(c, px+dx, y+dy, col, false, s) end
                    end end
                    print(c, px, y, 3, false, s)
                end
            end

            d.temporizador,d.tiempoParpadeo = d.temporizador + 1,d.tiempoParpadeo + 1

            if d.temporizador % d.cambioDireccion == 0 then d.direccionX, d.direccionY = rnd(-1,1), rnd(-1,1) end

            d.posX,d.posY = max(20, min(220, d.posX + d.direccionX * d.velocidad)),max(20, min(120, d.posY + d.direccionY * d.velocidad))

            map(0, 0, 30, 17, 0, 0)
            spr(258, d.posX, d.posY, 0)

            if d.dialogoActual <= #d.dialogos then
                rainbowText(d.dialogos[d.dialogoActual], 0, 0, 1)
                if d.temporizador - d.ultimoCambioDialogo >= 180 then
                    d.dialogoActual = d.dialogoActual % #d.dialogos + 1
                    d.ultimoCambioDialogo = d.temporizador
                end
            end

            if d.tiempoParpadeo >= d.duracionParpadeo then d.mostrarTextoDemo, d.tiempoParpadeo = not d.mostrarTextoDemo, 0 end
            if d.mostrarTextoDemo then rainbowText("DEMO", 100, 60, 4) end

            print("Presiona (A) para volver al menú", 60, 140, 7)
            if btnp(4) then demoData = nil return "salir_demo" end
            
            return "continuar_demo"
        else print("Tipo de pantalla no reconocido", 10, 10, 8) return "error"
        end
    end
end

--====== PINBALL.LUA (simulado) ======--

function todoMinijuegoPinball()
    -- Cache de variables frecuentemente accedidas
    local pinball, bola, config, colores, paletas, objetos, frases, t =
    todoJuego.pinball,todoJuego.pinball.bola,todoJuego.pinball.config,todoJuego.pinball.colores,todoJuego.pinball.paletas,
    todoJuego.pinball.objetos,todoJuego.pinball.frases,time()

    -- 1. Actualización del sistema de pinball
    -- Función auxiliar para distancia punto-segmento
    local function distancia_punto_segmento(px, py, x1, y1, x2, y2)
        local l2 = (x1 - x2)^2 + (y1 - y2)^2
        if l2 == 0 then return math.sqrt((px - x1)^2 + (py - y1)^2) end
        local t = ((px - x1) * (x2 - x1) + (py - y1) * (y2 - y1)) / l2
        t = math.max(0, math.min(1, t))
        return math.sqrt((px - (x1 + t * (x2 - x1)))^2 + (py - (y1 + t * (y2 - y1)))^2)
    end

    -- Lanzamiento de bola principal
    if not bola.lanzada and btnp(4) then
        bola.lanzada,pinball.resorte.animando,pinball.resorte.timer  = true,true,0
        bola.principal.vx,bola.principal.vy,config.puntuacion  = -2,-4.5,config.puntuacion + 1
        sfx(1, "E-4", 2, 0, 15, 1)
    end

    -- Activación de bolas extra
    if config.puntuacion >= 500 and not bola.adicionales[1].activa then
        bola.adicionales[1] = { x = math.random(50, 190),y = math.random(30, 100),vx = math.random(-2, 2),vy = math.random(-3, -1),
            radius = 4,activa = true }
        sfx(2, "D-5", 1, 0, 15, 1)
    end

    if config.puntuacion >= 1000 and not bola.adicionales[2].activa then
        bola.adicionales[2] = { x = math.random(50, 190),y = math.random(30, 100),vx = math.random(-2, 2),vy = math.random(-3, -1),
            radius = 4,activa = true }
        sfx(2, "D-5", 1, 0, 15, 1)
    end

    -- Lista de bolas activas
    local bolasActivas = {bola.principal}
    for _, bolaAd in ipairs(bola.adicionales) do
        if bolaAd.activa then table.insert(bolasActivas, bolaAd) end
    end

    -- Movimiento y colisiones físicas
    for _, bolaAct in ipairs(bolasActivas) do
        local esPrincipal = (bolaAct == bola.principal)
        if (esPrincipal and bola.lanzada) or (not esPrincipal) then
            bolaAct.x = bolaAct.x + bolaAct.vx
            bolaAct.y = bolaAct.y + bolaAct.vy
            bolaAct.vy = bolaAct.vy + (esPrincipal and 0.1 or 0.085)
        end

        -- Colisiones con bordes
        if bolaAct.x - bolaAct.radius < 0 then
            bolaAct.x = bolaAct.radius
            bolaAct.vx = -bolaAct.vx * 0.9
            if esPrincipal then
                colores.paredes.izquierda = 6
                colores.tiempoCambioColor = colores.duracionCambioColor
                config.puntuacion = config.puntuacion + 2
            end
            sfx(3, "C-2", 1, 0, 15, 1)
        elseif bolaAct.x + bolaAct.radius > 214 then
            bolaAct.x = 214 - bolaAct.radius
            bolaAct.vx = -bolaAct.vx * 0.9
            if esPrincipal then
                colores.paredes.derecha = 6
                colores.tiempoCambioColor = colores.duracionCambioColor
                config.puntuacion = config.puntuacion + 2
            end
            sfx(3, "C-2", 1, 0, 15, 1)
        end

        if bolaAct.y - bolaAct.radius < 0 then
            bolaAct.y = bolaAct.radius
            bolaAct.vy = -bolaAct.vy * 0.8
            if esPrincipal then
                colores.paredes.arriba = 6
                colores.tiempoCambioColor = colores.duracionCambioColor
                config.puntuacion = config.puntuacion + 3
            end
            sfx(3, "C-3", 1, 0, 15, 1)
        end

        -- Agujero
        if bolaAct.y + bolaAct.radius > 130 then
            local sobreAgujero = bolaAct.x > objetos.agujero.x - 15 and 
                               bolaAct.x < objetos.agujero.x + objetos.agujero.width + 15
            if sobreAgujero then
                if bolaAct.y + bolaAct.radius > 135 then
                    if esPrincipal then
                        bola.lanzada = false
                        config.intentos = config.intentos + 1
                        config.combos = 0
                    else bolaAct.activa = false end
                    sfx(2, "D-4", 2, 0, 15, 1)
                else bolaAct.vy = bolaAct.vy + 0.15 end
            else
                bolaAct.y = 130 - bolaAct.radius
                bolaAct.vy = -math.abs(bolaAct.vy) * 0.7
                sfx(3, "C-4", 1, 0, 15, 1)
            end
        end
    end

    -- Reset de la bola principal si no fue lanzada
    if not bola.lanzada then bola.principal.x,bola.principal.y,bola.principal.vx,bola.principal.vy = 200,120,0,0 end

    -- Paletas: control y colisiones
    if btn(2) then
        paletas.izquierda.angle = math.min(0, paletas.izquierda.angle + 0.1)
        paletas.superiorIzquierda.angle = math.min(0, paletas.superiorIzquierda.angle + 0.1)
    else
        paletas.izquierda.angle = math.max(-math.pi/2, paletas.izquierda.angle - 0.1)
        paletas.superiorIzquierda.angle = math.max(-math.pi/2, paletas.superiorIzquierda.angle - 0.1)
    end

    if btn(3) then
        paletas.derecha.angle = math.max(-math.pi, paletas.derecha.angle - 0.1)
        paletas.superiorDerecha.angle = math.max(-math.pi, paletas.superiorDerecha.angle - 0.1)
    else
        paletas.derecha.angle = math.min(-math.pi/2, paletas.derecha.angle + 0.1)
        paletas.superiorDerecha.angle = math.min(-math.pi/2, paletas.superiorDerecha.angle + 0.1)
    end

    local function manejarColisionPaleta(bolaAct, paleta, esSuperior)
        local paleta_x2 = paleta.x + paleta.length * math.cos(paleta.angle)
        local paleta_y2 = paleta.y - paleta.length * math.sin(paleta.angle)

        if distancia_punto_segmento(bolaAct.x, bolaAct.y, paleta.x, paleta.y, paleta_x2, paleta_y2) < bolaAct.radius + 3 then
            paleta.color = 6
            local nx, ny = -math.sin(paleta.angle), math.cos(paleta.angle)
            local producto_punto = bolaAct.vx * nx + bolaAct.vy * ny
            local fuerza = (bolaAct == bola.principal) and 1.8 or 2.0
            bolaAct.vx = bolaAct.vx - fuerza * producto_punto * nx
            bolaAct.vy = bolaAct.vy - fuerza * producto_punto * ny

            local puntos = (esSuperior and 3 or 2) * (bolaAct == bola.principal and 2 or 1)
            config.puntuacion = config.puntuacion + puntos

            if bolaAct == bola.principal then config.colisiones,config.combos = config.colisiones + 1,config.combos + 1 end

            sfx(1, "E-5", 2, 0, 15, 1)
        end
    end

    -- Aplicar colisiones con paletas
    for _, bolaAct in ipairs(bolasActivas) do
        manejarColisionPaleta(bolaAct, paletas.izquierda, false) manejarColisionPaleta(bolaAct, paletas.derecha, false)
        manejarColisionPaleta(bolaAct, paletas.superiorIzquierda, true) manejarColisionPaleta(bolaAct, paletas.superiorDerecha, true)
    end

    -- 2. Manejo de objetos especiales, ruleta y niveles
    -- Diamantes
    for i, diamante in ipairs(objetos.diamantes) do
        if not diamante.visible then
            diamante.timer = diamante.timer + 1
            if diamante.timer >= config.tiempoReaparicion then diamante.visible,diamante.timer = true,0 end
        end
        
        if diamante.visible then
            spr(311, diamante.x, diamante.y, 0)
            
            if math.abs(bola.principal.x - (diamante.x + 4)) < 8 and 
               math.abs(bola.principal.y - (diamante.y + 4)) < 8 then
                diamante.visible = false
                config.puntuacion = config.puntuacion + 10
                print("Diamante +10 Puntos", 60, 100, 3)
                sfx(0, "C-5", 3, 0, 15, 0)
            end
        end
    end
    
    -- Meteoritos
    for i, meteorito in ipairs(pinball.meteoritos) do
        meteorito.y = meteorito.y + meteorito.velocidadY
        
        if meteorito.y > 136 then
            meteorito.y,meteorito.x,meteorito.velocidadY = math.random(-50, -10),math.random(0, 240),math.random(1, 3)
            meteorito.color = math.random(1, 3)
        end
        
        local color = (meteorito.color == 1 and 8) or (meteorito.color == 2 and 9) or 10
        pix(meteorito.x, meteorito.y, color)
    end

    -- Ruleta
    if not _ruleta then
        _ruleta = { spinning = true,timer = 0,delay = 90,resultDelay = 240,numbers = {1, 2, 3},speed = {5, 5, 5},
        target = {0, 0, 0},win = false,score = 0}
    end

    if _ruleta.spinning then
        for i=1,3 do
            _ruleta.numbers[i] = _ruleta.numbers[i] + _ruleta.speed[i]
            if _ruleta.numbers[i] > 9 then _ruleta.numbers[i] = 1 end
        end
        
        _ruleta.timer = _ruleta.timer + 1
        if _ruleta.timer > _ruleta.delay then
            for i=1,3 do
                if _ruleta.speed[i] > 0.1 then _ruleta.speed[i] = _ruleta.speed[i] * 0.95
                else
                    _ruleta.speed[i] = 0
                    _ruleta.spinning = false
                    if _ruleta.numbers[1] == _ruleta.numbers[2] and 
                       _ruleta.numbers[2] == _ruleta.numbers[3] then
                        _ruleta.win = true
                        config.puntuacion = config.puntuacion + 100
                    end
                end
            end
        end
    else
        _ruleta.timer = _ruleta.timer + 1
        if _ruleta.timer > _ruleta.resultDelay then
            _ruleta.spinning,_ruleta.timer,_ruleta.win = true,0,false
            for i=1,3 do
                _ruleta.speed[i],_ruleta.numbers[i] = 5,math.random(1,9)
            end
        end
    end
    
    -- Dibujar ruleta
    for i=1,3 do rect(38, 15, 30, 10, 4) end

    for i=1,3 do
        local num = math.floor(_ruleta.numbers[i])
        print(num, 30 + i*10, 20, 0)
    end
    
    if _ruleta.win and not _ruleta.spinning then print("Ruleta + 100 Puntos", 70, 90, 11) end

    -- Niveles
    local puntosPorNivel = { [2] = 300,[3] = 800,[4] = 1300,[5] = 1800,[6] = 3000,[7] = 5500,[8] = 9000,[9] = 15000 }

    for nivel = 2, 9 do
        if config.puntuacion > puntosPorNivel[nivel] and config.nivel < nivel then
            config.nivel = nivel
            config.puntuacion = config.puntuacion + 1
            config.puntosParaSiguienteNivel = puntosPorNivel[nivel + 1] or 99999999
        end
    end

    -- Frases completadas
    if config.colision == #frases.aCompletar.lista[frases.aCompletar.indice] then
        config.colision = 0
        print("+10 Puntos frase completada", 10, 90, 5)
        config.puntuacion = config.puntuacion + 10
        frases.aCompletar.indice = frases.aCompletar.indice + 1

        if frases.aCompletar.indice == 8 then frases.aCompletar.indice = 1 end
    end

    -- 3. Dibujo completo del pinball con efectos
    local coloresArcoiris,velocidadCambioColor = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},40

    -- Entorno estático
    rect(0, 0, 1, 136, colores.paredes.izquierda) rect(214, 0, 1, 136, colores.paredes.derecha)
    rect(0, 0, 214, 1, colores.paredes.arriba) rect(0, 135, 214, 1, colores.paredes.abajo)

    -- Agujero con efecto de fuego
    local agujero,fuegoColors,fuegoPattern = objetos.agujero,{2, 3, 4},
    { {1,0,1,0,1},{0,1,0,1,0},{1,0,1,0,1},{0,1,0,1,0} }

    rect(agujero.x, agujero.y, agujero.width, agujero.height, 2)
    for i = 0, agujero.width-1 do
        for j = 0, agujero.height-1 do
            local patternIndex = (i + math.floor(t/5)) % #fuegoPattern + 1
            local row = (j + math.floor(t/7)) % #fuegoPattern[1] + 1
            if fuegoPattern[patternIndex][row] == 1 then pix(agujero.x+i, agujero.y+j, fuegoColors[(i+j+math.floor(t/3))%#fuegoColors+1])
            end
        end
        pix(agujero.x+i, agujero.y, 3) -- Borde superior
    end

    -- Resorte con animación
    local resorte = pinball.resorte
    local current_y = resorte.animando and (resorte.posY - (10 - math.min(resorte.timer, 10))) or resorte.posY
    local spring_length = 10

    for i = 0, spring_length, 2 do line(190, current_y-i, 205, current_y-i, (i%4==0) and 11 or 8) end

    -- Funciones para dibujar elementos
    local function dibujarBolaConEfectos(x, y, radius, offset, esPrincipal)
        -- Efecto de rastro
        if esPrincipal and bola.principal.lanzada and 
           (bola.principal.vx ~= 0 or bola.principal.vy ~= 0) then
            for i = 1, 3 do
                local factor = i * 0.2
                local ghostX,ghostY = x - bola.principal.vx * factor * 10,y - bola.principal.vy * factor * 10
                ghostX,ghostY = math.max(radius, math.min(214 - radius, ghostX)),math.max(radius, math.min(135 - radius, ghostY))
                local alpha = 5 + i
                local size = radius * (1 - (i * 0.2))
                circ(ghostX, ghostY, size + 0.5, 13) circ(ghostX, ghostY, size, alpha)
            end
        end

        -- Bola con efecto arcoiris
        local color = coloresArcoiris[(math.floor(t/velocidadCambioColor)+(offset or 0))%#coloresArcoiris+1]
        for angle = 0, 360, 15 do
            local px, py = x+math.cos(math.rad(angle))*radius, y+math.sin(math.rad(angle))*radius
            pix(px, py, color)
        end
        circ(x, y, radius-1, 8)
        pix(x+1, y-1, 15)
    end

    local function dibujarPaletaConColision(p)
        local color = coloresArcoiris[math.floor(t/velocidadCambioColor)%#coloresArcoiris+1]
        local x2, y2 = p.x+p.length*math.cos(p.angle), p.y-p.length*math.sin(p.angle)
        circ(p.x, p.y, 3, color)
        line(p.x, p.y, x2, y2, color)
        tri(x2, y2, 
            x2+3*math.cos(p.angle+math.rad(90)), y2-3*math.sin(p.angle+math.rad(90)),
            x2+3*math.cos(p.angle-math.rad(90)), y2-3*math.sin(p.angle-math.rad(90)), color)

        if config.mostrarColisiones then
            local thickness = 10
            local dx,dy = thickness * math.cos(p.angle) / 2,thickness * math.sin(p.angle) / 2
            local points = { {p.x + dy, p.y + dx}, {x2 + dy, y2 + dx}, {x2 - dy, y2 - dx}, {p.x - dy, p.y - dx}, }
            for i = 1, #points do
                local next = points[(i % #points)+1]
                line(points[i][1], points[i][2], next[1], next[2], 7)
            end
        end
    end

    -- Dibujar bolas
    if not bola.lanzada then bola.principal.x, bola.principal.y = 197, current_y-spring_length-bola.principal.radius end
    dibujarBolaConEfectos(bola.principal.x, bola.principal.y, bola.principal.radius, nil, true)

    for i, bolaAd in ipairs(bola.adicionales) do
        if bolaAd.activa then
            dibujarBolaConEfectos(bolaAd.x, bolaAd.y, bolaAd.radius, i*10, false)
            print("Modo MultiBola!", 150, 50, 9)
        end
    end

    -- Dibujar paletas
    dibujarPaletaConColision(paletas.izquierda) dibujarPaletaConColision(paletas.superiorIzquierda)
    dibujarPaletaConColision(paletas.derecha) dibujarPaletaConColision(paletas.superiorDerecha)

    -- Actualizar animación del resorte
    if resorte.animando then resorte.timer = resorte.timer + 1
        if resorte.timer >= 10 then resorte.animando = false resorte.timer = 0 end
    end

    -- Animaciones especiales
    local anim = pinball.animaciones.objeto
    local function actualizarAnimacionPorPuntaje()
        anim.timer = anim.timer + 1

        if config.puntuacion < 2000 and anim.tipo ~= "meteorito" then
            anim.tipo = "meteorito" anim.colores = pinball.animaciones.paletas.meteorito anim.timer = 0
        elseif config.puntuacion >= 2000 and config.puntuacion < 5000 and anim.tipo ~= "relampago" then
            anim.tipo = "relampago" anim.colores = pinball.animaciones.paletas.relampago anim.timer = 0
        elseif config.puntuacion >= 5000 and anim.tipo ~= "planeta" then
            anim.tipo = "planeta" anim.colores = pinball.animaciones.paletas.planeta anim.timer = 0
        end 
    end

    actualizarAnimacionPorPuntaje()
    
    -- Dibujar sprites
    spr(objetos.spriteInteractivo.spriteId, objetos.spriteInteractivo.x, objetos.spriteInteractivo.y, 0)
    
    if objetos.spriteInteractivo.mostrarFrase then
        local tiempoActual = time()
        if tiempoActual - objetos.spriteInteractivo.ultimaFrase < 270 then
            print(objetos.spriteInteractivo.fraseActual, 
                  objetos.spriteInteractivo.x - #objetos.spriteInteractivo.fraseActual * 2, 
                  objetos.spriteInteractivo.y - 10, 3)
        else objetos.spriteInteractivo.mostrarFrase = false end
    end
    
    spr(objetos.spriteRebote.id, objetos.spriteRebote.x, objetos.spriteRebote.y, 0)
    
    for i, sprite in ipairs(objetos.spritesAnimados) do spr(sprite.id, sprite.x, sprite.y, 0) end

    -- 4. Renderizado del HUD
    local x, y = 160, 20
    local textos = {
        {label = "Intentos : "..config.intentos, offsetY = 0},{label = "Combos : "..config.combos, offsetY = 10},
        {label = "Nivel : "..config.nivel, offsetY = 20},{label = config.puntuacion, offsetY = -13, offsetX = 10, size = 2}
    }

    for _, tdata in ipairs(textos) do
        local texto, offsetY, offsetX, size = tdata.label, tdata.offsetY or 0, tdata.offsetX or 0, tdata.size or 1

        for i = -1, 1 do
            for j = -1, 1 do
                local colorIndex = math.floor(t / 90) % #coloresArcoiris + 1
                local color = coloresArcoiris[colorIndex]
                print(texto, (x + offsetX) + i, (y + offsetY) + j, color, -1, size)
            end
        end
        print(texto, (x + offsetX), (y + offsetY), 0, -1, size)
    end

    -- Frase de rap en scroll
    if frases.rap.fraseActual == "" then frases.rap.fraseActual = frases.rap.lista[1] end
    frases.rap.timer = frases.rap.timer + 1
    frases.rap.offsetColor = frases.rap.timer // 3
    frases.rap.posX = frases.rap.posX - frases.rap.velocidad
    local anchoFrase = #frases.rap.fraseActual * 6
    if frases.rap.posX + anchoFrase < frases.rap.limites.izquierdo then
        frases.rap.indice = frases.rap.indice % #frases.rap.lista + 1
        frases.rap.fraseActual = frases.rap.lista[frases.rap.indice]
        frases.rap.posX = frases.rap.limites.derecho
    end
    local inicioRender = math.max(0, (frases.rap.limites.izquierdo - frases.rap.posX) / 6)
    local finRender = math.min(#frases.rap.fraseActual, (frases.rap.limites.derecho - frases.rap.posX) / 6)
    for i = math.floor(inicioRender)+1, math.ceil(finRender) do
        if i > 0 and i <= #frases.rap.fraseActual then
            local char = frases.rap.fraseActual:sub(i, i)
            local colorIdx = (i + frases.rap.offsetColor) % #frases.rap.colores + 1
            print(char, frases.rap.posX + (i-1)*6, 5, frases.rap.colores[colorIdx])
        end
    end   

    -- Frase a completar
    if frases.aCompletar and #frases.aCompletar.lista[frases.aCompletar.indice] > 0 then
        local sub_frase = frases.aCompletar.lista[frases.aCompletar.indice]:sub(1, config.colision or #frases.aCompletar.lista[frases.aCompletar.indice])
        print(sub_frase, 10, 60, 11)
    end

    -- 5. Resetear colores si es necesario
    if colores.tiempoCambioColor > 0 then colores.tiempoCambioColor = colores.tiempoCambioColor - 1
        if colores.tiempoCambioColor == 0 then
            paletas.izquierda.color,paletas.derecha.color,paletas.superiorIzquierda.color,paletas.superiorDerecha.color = 1,1,1,1
        end
    end
end

--====== BAILE.LUA (simulado) ======--

function todoMinijuegoBaile()

    local function printBordeArcoiris(texto, x, y, escala, centroNegro)
    -- Parámetros opcionales
    escala = escala or 1
    centroNegro = centroNegro == nil and true or centroNegro
    local t = time()//50  -- Control de animación
    
    for i = 1, #texto do
        local letra = texto:sub(i, i)
        local colorIndex = (t + i) % #todoJuego.baile.coloresArcoiris + 1
        local color = todoJuego.baile.coloresArcoiris[colorIndex]
        local posX = x + (i-1)*6*escala
        
        -- Dibuja el borde (8 posiciones alrededor)
        for dx = -1, 1 do
            for dy = -1, 1 do
                if dx ~= 0 or dy ~= 0 then print(letra, posX + dx, y + dy, color, false, escala) end
            end
        end
        
        -- Dibuja el centro
        if centroNegro then print(letra, posX, y, 0, false, escala)
        else print(letra, posX, y, color, false, escala) end
    end
    end
    local v,f,p = todoJuego.baile.variablesNumericas,todoJuego.baile.flechas,todoJuego.baile.posicionesFlechas

    -- Verificar estado del juego
    if not todoJuego.baile.juegoActivo then
        cls(0)
        print("Juego Terminado", 80, 60, 12) print("Puntos finales: " .. v.puntuacion, 60, 80, 11)
        print("Presiona A para reiniciar.", 50, 100, 7)
        
        if btn(4) then 
            -- Reiniciar juego
            v.puntuacion = 0 v.combos = 0 v.fallos = 0 v.temporizadorFlechas = 0 v.tiempoGeneracionFlechas = 30
            v.tiempoFraseCombo = 0 v.tiempoFeedbackFlechas = 0 v.indiceFrase = 0
            todoJuego.baile.flechas = {} todoJuego.baile.juegoActivo = true
        end
        return
    end

    -- Cambiar frase de canción
    v.indiceFrase = v.indiceFrase + 1
    if v.indiceFrase >= v.cambioFraseIntervalo then
        v.indiceFrase = v.indiceFrase + 1
        if v.indiceFrase > #todoJuego.baile.frasesCancion then v.indiceFrase = 1 
        end
        v.indiceFrase = 0
    end

    -- Generación de nuevas flechas
    v.temporizadorFlechas = v.temporizadorFlechas + 1
    if v.temporizadorFlechas >= v.tiempoGeneracionFlechas then
        v.temporizadorFlechas = 0
        local tipo = math.random(4)
        table.insert(f, { tipo = tipo,x = p[tipo],y = 136,activa = true,acertada = false,tiempo_acertada = 0})
        v.tiempoGeneracionFlechas = math.random(30, 90)
    end

    -- Actualización y dibujo de flechas
    for i = #f, 1, -1 do
        local fl = f[i]
        if fl.activa then
            fl.y = fl.y - 1
            if fl.y < 0 then
                fl.activa = false
                if fl.y > -15 then v.fallos,v.combos = v.fallos + 1,0 end
                table.remove(f, i)
            else s(497 + fl.tipo - 1, fl.x, fl.y, 0, 2)
            end
        elseif fl.acertada then
            fl.tiempo_acertada = fl.tiempo_acertada - 1
            if fl.tiempo_acertada <= 0 then table.remove(f, i)
            else s(505 + fl.tipo - 1, fl.x, fl.y, 0, 2)
            end
        end
    end

    -- Verificar controles y combos
    if btnp(2) or btnp(3) or btnp(1) or btnp(0) then
        for i, fl in ipairs(f) do
            if fl.activa and fl.y >= 16 and fl.y <= 32 then
                local tipoCorrecto = (btnp(2) and fl.tipo == 1) or (btnp(0) and fl.tipo == 2) or
                                     (btnp(1) and fl.tipo == 3) or (btnp(3) and fl.tipo == 4)
                if tipoCorrecto then
                    fl.activa, fl.acertada, fl.tiempo_acertada = false, true, 15
                    v.puntuacion = v.puntuacion + 10 + v.combos * 2
                    v.combos = v.combos + 1
                    if v.combos > 0 then
                        todoJuego.baile.fraseComboVisible = todoJuego.baile.frasesCombo[1 + (v.combos % #todoJuego.baile.frasesCombo)]
                        v.tiempoFraseCombo = 60
                    end
                end
            end
        end
    end

    -- Dibujar fondo estrellado
    if #todoJuego.baile.estrellas == 0 then
        for i = 1, v.numeroEstrellas do
            table.insert(todoJuego.baile.estrellas, { x = math.random(0, 240),y = math.random(0, 136),velocidad = math.random(1, 3) }) end
    end

    for _, estrella in ipairs(todoJuego.baile.estrellas) do
        pix(estrella.x, estrella.y, 7)
        estrella.y = estrella.y + estrella.velocidad
        if estrella.y > 136 then estrella.y,estrella.x = 0,math.random(0, 240) end
    end

    -- Dibujar bailarines animados
    for i = 1, 9 do
        local x,y = 0 + i * 20,70 + math.sin(time()/200 + i) * 10
        s(256 + i, x, y, 0, 1, 0, 0, 1, 1)
    end

    -- Dibujar UI (puntuación, combo, fallos)
    printBordeArcoiris("Puntos:"..v.puntuacion, 180, 10, 1, true) printBordeArcoiris("Combo:"..v.combos, 180, 20, 1, true)
    printBordeArcoiris("Fallos:"..v.fallos, 180, 30, 1, true) printBordeArcoiris("Artista : DiosGPT", 10, 90, 1, true) 
    printBordeArcoiris("Cancion : Romance IA - Marciano", 10, 100, 1, true) printBordeArcoiris("(Album xxIAxx : 2025)", 10, 109, 1, true)

    if v.tiempoFraseCombo > 0 then
        printBordeArcoiris("NUEVO COMBO!", 145, 40, 1, true) printBordeArcoiris(todoJuego.baile.fraseComboVisible, 145, 50, 1, true)
    end

    -- Letra de canción central inferior
    local frase = todoJuego.baile.frasesCancion[v.indiceFrase]
    if frase then print(frase, 10, 117, 1, false) end

    -- Dibujar flechas fijas con feedback
    v.tiempoFeedbackFlechas = (btnp(0) or btnp(1) or btnp(2) or btnp(3)) and 20 or 
                             math.max(0, v.tiempoFeedbackFlechas - 1)

    for i = 1, 4 do
        local sprite = (v.tiempoFeedbackFlechas > 0 and 
                      ((i == 1 and btn(2)) or (i == 2 and btn(0)) or (i == 3 and btn(1)) or (i == 4 and btn(3)))) and 501 or 497
        s(sprite + i - 1, p[i], 16, 0, 2)
    end
end

--====== CLIMAS.LUA (simulado) ======--

function todoClimatologia()
    local c = todoJuego.clima
    local i = c.interruptores
    local rnd = math.random

    local function mid(a,b,c) return a>b and (b>c and b or math.max(a,c)) or (a>c and a or math.min(b,c)) end

    local weather = {
        lluvia = {
            max=100, init=function() return { x=rnd(0,240), y=rnd(-240,0), speed=rnd(2,4), ancho=2, alto=6, color=9 } end,
            update=function(g) g.y=g.y+g.speed return g.y<=136 end,
            draw=function(g) rect(g.x,g.y,g.ancho,g.alto,g.color) end
        },
        hojas = {
            max=20, init=function() return { x=rnd(0,240), y=rnd(-20,0), speed_x=rnd(-1,1), speed_y=rnd(1,3),
                sway=rnd()*2*math.pi, sprite_id=rnd(213,214)
            } end,
            update=function(h)
                h.x=h.x+h.speed_x+math.sin(h.sway)*0.5
                h.y=h.y+h.speed_y
                h.sway=h.sway+0.1
                if h.y>136 or h.x<0 or h.x>240 then h.y,h.x=rnd(-20,-1),rnd(0,240) end
                return true
            end,
            draw=function(h) spr(h.sprite_id,h.x,h.y,0) end
        },
        nieve = {
            max=50, init=function() return { x=rnd(0,240), y=rnd(-240,0), speed_y=rnd(1,2), sway=rnd(-1,1), sprite_id=212 } end,
            update=function(n)
                n.x,n.y=n.x+n.sway,n.y+n.speed_y
                if n.y>136 then n.y,n.x=rnd(-20,-1),rnd(0,240) end
                n.x=mid(0,n.x,240)
                return true
            end,
            draw=function(n) spr(n.sprite_id,n.x,n.y,0) end
        },
        viento = {
            max=15, init=function() return {
                x=rnd(0,240), y=rnd(0,136), amplitude=rnd(5,10),frequency=rnd(10,20), phase=rnd(0,360)} end,
            update=function(v)
                v.x=v.x-c.velocidadViento
                v.phase=v.phase+4
                if v.x+240<0 then
                    v.x,v.y=240,rnd(0,136)
                    v.amplitude,v.frequency=rnd(5,10),rnd(10,20)
                    v.phase=rnd(0,360)
                end
                return true
            end,
            draw=function(v) for i=0,v.amplitude do pix(v.x+i,v.y+math.sin(v.phase+i*v.frequency/240)*5,7) end
            end
        },
        relampagos = {
            update=function()
                if c.relampagosActivados then
                    c.temporizadorRelampago=c.temporizadorRelampago-1
                    if c.temporizadorRelampago<=0 then c.relampagosActivados=false end
                elseif rnd(0,200)==0 then c.relampagosActivados,c.temporizadorRelampago=true,c.duracionFlashRelampago end
            end,
            draw=function()
                if c.relampagosActivados then
                    rect(0,0,240,136,15)
                    for _=1,rnd(1,3) do
                        local x=rnd(20,220)
                        for i=1,rnd(5,10) do
                            local dx,dy=rnd(-5,5),rnd(5,20)
                            line(x,math.min(136,i*10),x+dx,math.min(136,i*10+dy),4)
                            x=x+dx
                        end
                    end
                end
            end
        }
    }

    -- Función genérica para manejar efectos climáticos
    local function handleEffect(effect)
        if not c[effect] then
            c[effect]={}
            for _=1,weather[effect].max do table.insert(c[effect],weather[effect].init()) end
        end
        
        local particles={}
        for _,p in ipairs(c[effect]) do if weather[effect].update(p) then table.insert(particles,p) end
        end
        
        while #particles<weather[effect].max do table.insert(particles,weather[effect].init()) end
        c[effect]=particles
        
        for _,p in ipairs(c[effect]) do weather[effect].draw(p) end
    end

    -- Procesar cada efecto climático activo
    if i.lluvia then handleEffect("lluvia") end if i.hojas then handleEffect("hojas") end
    if i.nieve then handleEffect("nieve") end if i.vientos then handleEffect("viento") end
    if i.relampagos then weather.relampagos.update() weather.relampagos.draw() end
end

--====== MODULOS.LUA (simulado) ======--

-- MODULOS :
-- APP ESTILO CHATGPT
-- TELESCOPIO
-- TECLADO
-- DIARIO
-- RADIOS

function manejarModulos(mode, ...)
    -- Funciones compartidas optimizadas para todos los modos
    local function dividirMensaje(texto, maxAncho)
        local lineas = {}
        for linea in texto:gmatch("[^\n]+") do
            local inicio = 1
            while inicio <= #linea do
                local fin = math.min(inicio + maxAncho - 1, #linea)
                local ult_space = linea:sub(inicio, fin):find("%s[^%s]*$")
                if ult_space then fin = inicio + ult_space - 1 end
                table.insert(lineas, linea:sub(inicio, fin))
                inicio = fin + 1
            end
        end
        return lineas
    end

    local function dibujarTextoConBorde(texto, x, y, color, fondo)
        if fondo then rect(x-2, y-2, #texto*6+4, 10, fondo) end
        for dx=-1,1 do for dy=-1,1 do
            if dx~=0 or dy~=0 then print(texto, x+dx, y+dy, 15) end
        end end
        p(texto, x, y, color or 5)
    end

    local function dibujarEstrella(x, y, color)pix(x, y, color) pix(x-1, y, color) pix(x+1, y, color) pix(x, y-1, color) pix(x, y+1, color)
    end

    -- Modo Teclado Virtual
    if mode == "teclado" then
        local tipoTeclado = ... or "pc"  -- "pc" o "num"
        teclado = teclado or {modo = tipoTeclado, debounce = 0, estado = "inactivo"}
        
        -- Reinicialización condicional
        if teclado.modo ~= tipoTeclado or teclado.estado == "inactivo" then
            teclado.modo = tipoTeclado
            teclado.estado = "activo"
            teclado.debounce = 0
            
            if teclado.modo == "pc" then
                teclado.pc = {
                    teclas = {{"Q","W","E","R","T"}, {"Y","U","I","O","P"}, {"A","S","D","F","G"}, {"H","J","K","L","Z"},
                    {"X","C","V","B","N"}, {"M","Enter","Borrar"}},
                    cursor = {1,1}, texto = "",claveCorrecta = "inglish",claveCorrectaIngresada = false,
                    dim = {40,10,5,5,0,40} -- ancho,alto,espX,espY,posX,posY
                }
            else
                teclado.num = { teclas = {"1","2","3","4","5","6","7","8","9","0","Borrar","Enter"},
                    seleccion = 1, claveCorrecta = "1234", claveIngresada = "", 
                    mensaje = "",coloresArcoiris = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},colorOffset = 0,
                    dim = {30,30,5,10,10} -- ancho,alto,espacio,posX,posY
                }
            end
        end

        -- Sistema de debounce
        if teclado.debounce > 0 then teclado.debounce = teclado.debounce - 1 return true end

        -- Lógica específica para cada teclado
        local t = teclado[teclado.modo]
        if teclado.modo == "pc" then
            -- Dibujado del teclado PC
            for y, fila in ipairs(t.teclas) do
                for x, tecla in ipairs(fila) do
                    local px = t.dim[5] + (x-1)*(t.dim[1]+t.dim[3])
                    local py = t.dim[6] + (y-1)*(t.dim[2]+t.dim[4])
                    
                    rect(px, py, t.dim[1], t.dim[2], 5)
                    if x == t.cursor[1] and y == t.cursor[2] then rectb(px-1, py-1, t.dim[1]+2, t.dim[2]+2, 7) end
                    p(tecla, px + (#tecla==1 and 5 or 3), py+2, 7)
                end
            end

            -- Navegación
            if btnp(0) then t.cursor[2] = (t.cursor[2]-2) % #t.teclas + 1
            elseif btnp(1) then t.cursor[2] = t.cursor[2] % #t.teclas + 1
            elseif btnp(2) then t.cursor[1] = (t.cursor[1]-2) % #t.teclas[t.cursor[2]] + 1
            elseif btnp(3) then t.cursor[1] = t.cursor[1] % #t.teclas[t.cursor[2]] + 1 end

            -- Selección de tecla
            if btnp(5) then
                local key = t.teclas[t.cursor[2]][t.cursor[1]]
                if key == "Enter" then
                    t.claveCorrectaIngresada = t.texto:lower() == t.claveCorrecta
                    t.texto = t.claveCorrectaIngresada and t.texto or ""
                elseif key == "Borrar" then t.texto = t.texto:sub(1, -2)
                else t.texto = t.texto .. key 
                end
                teclado.debounce = 10
            end

            dibujarTextoConBorde("Escribe: "..t.texto, 10, 10, 7)
            if t.claveCorrectaIngresada then cls(0) dibujarTextoConBorde("Clave correcta!", 60, 68, 11) end
        else
            -- Dibujado del teclado numérico
            local x, y = t.dim[4], t.dim[5]
            for i, key in ipairs(t.teclas) do
                rect(x, y, t.dim[1], t.dim[2], 7)
                if i == t.seleccion then rectb(x-2, y-2, t.dim[1]+4, t.dim[2]+4, 8) 
                end
                p(key, x+7, y+7, 0)
                x = x + t.dim[1] + t.dim[3]
                if i % 3 == 0 then x, y = t.dim[4], y + t.dim[2] + t.dim[3] end
            end

            -- Navegación numérica
            if btnp(0) then t.seleccion = math.max(1, t.seleccion-3) elseif btnp(1) then t.seleccion = math.min(#t.teclas, t.seleccion+3)
            elseif btnp(2) then t.seleccion = math.max(1, t.seleccion-1) 
            elseif btnp(3) then t.seleccion = math.min(#t.teclas, t.seleccion+1) end

            -- Selección numérica
            if btnp(5) then
                local key = t.teclas[t.seleccion]
                if key == "Borrar" then t.claveIngresada = t.claveIngresada:sub(1, -2)
                elseif key == "Enter" then
                    t.mensaje = t.claveIngresada == t.claveCorrecta and "Solucionado. Que clave mas mala." or "Intenta de nuevo maquinola."
                    t.claveIngresada = t.claveIngresada == t.claveCorrecta and t.claveIngresada or ""
                else t.claveIngresada = t.claveIngresada .. key 
                end
                teclado.debounce = 10
            end

            -- Mensaje de resultado
            if t.mensaje ~= "" then
                for i = 1, #t.mensaje do
                    local colorIdx = (i + t.colorOffset) % #t.coloresArcoiris + 1
                    p(t.mensaje:sub(i,i), 50+(i-1)*6, 150, t.coloresArcoiris[colorIdx])
                end
                t.colorOffset = t.colorOffset + 1
            else dibujarTextoConBorde("Código: "..t.claveIngresada, 50, 150, 7) end
        end
        return true

    -- Modo App DiosGPT
    elseif mode == "app" then
    local ec = todoJuego.estadoCelular.celular
    local adg = ec.appDiosGPT or {}
    
    -- Inicialización si no existe
    if not ec.appDiosGPT then ec.appDiosGPT = { abierta = false,opcionSeleccionada = 1,paginaActual = 1,mensajeRespuesta = ""}
        adg = ec.appDiosGPT
    end
    
    -- Dibujar interfaz del celular
    local function dibujarCelular()
        rect(ec.x, ec.y, ec.ancho, ec.alto, 8);rect(ec.x + 5, ec.y + 15, ec.ancho - 10, ec.alto - 30, 0)
        rectb(ec.x, ec.y, ec.ancho, ec.alto, 0);rectb(ec.x + 5, ec.y + 15, ec.ancho - 10, ec.alto - 30, 8)
        
        local tiempo = time()
        local hora = ("%02d:%02d"):format(math.floor(tiempo/3600)%24, math.floor((tiempo%3600)/60))
        dibujarTextoConBorde(hora, ec.x + 5, ec.y + 5, 10);dibujarTextoConBorde("DiosGPT", ec.x + 13, ec.y + 55, 10)
    end

    -- Manejo de botones (cambios aquí)
    if btnp(5) then ec.mostrarMenu = not ec.mostrarMenu -- No cerramos la app al cerrar el menú
    end
    
    if not ec.mostrarMenu then dibujarTextoConBorde("B - Abrir Celular", 0, 120, 2) return end
    
    dibujarCelular() dibujarTextoConBorde("B - Cerrar Celular", 0, 120, 2)
    
    -- Cambio aquí: Solo cambiar estado si el menú está abierto
    if btnp(6) then adg.abierta = not adg.abierta if adg.abierta then adg.opcionSeleccionada = 1 adg.paginaActual = 1 end
    end
    
    if not adg.abierta then dibujarTextoConBorde("X - Abrir App de DiosGPT", 0, 130, 9) return 
    end

    -- Resto del código de la app (sin cambios)
    cls(14) dibujarTextoConBorde("Flechas - Elegir opción", 15, 20, 4)
    
    -- Navegación
    if btnp(0) then adg.opcionSeleccionada = math.max(1, adg.opcionSeleccionada - 1)
    elseif btnp(1) then adg.opcionSeleccionada = math.min(10, adg.opcionSeleccionada + 1)
    elseif btnp(2) then adg.paginaActual, adg.opcionSeleccionada = 1, 1
    elseif btnp(3) then adg.paginaActual, adg.opcionSeleccionada = 2, 6 end

    -- Mensajes según página
    local mensajesPagina1 = { "001 - Para usar DiosGPT, solo presiona el boton 6 para obtener ayuda.",
        "002 - Con los botones de direccion puedes moverte.",
        "003 - DiosGPT es un asistente virtual que responde preguntas y brinda ayuda.",
        "004 - DiosGPT te ayuda con tareas, preguntas y aclaraciones sobre diversos temas.",
        "005 - Puedes ayudar a DiosGPT dando feedback sobre sus respuestas y mejorando su conocimiento."}
    
    local mensajesPagina2 = { [6] = "006 - Esta es la opcion 006.",
        [7] = "007 - Esta es la opcion 007.",
        [8] = "008 - Esta es la opcion 008.",
        [9] = "009 - Esta es la opcion 009.",
        [10] = "010 - Esta es la opcion 010."}
    
    adg.mensajeRespuesta = adg.paginaActual == 1 and mensajesPagina1[adg.opcionSeleccionada] or 
                          mensajesPagina2[adg.opcionSeleccionada] or ""

    -- Dibujar opciones
    dibujarTextoConBorde("Página "..adg.paginaActual, 10, 30, 1)
    local inicio,fin = (adg.paginaActual - 1) * 5 + 1,adg.paginaActual * 5
    
    for opcion = inicio, fin do
        local texto = ("%03d - Opción %03d"):format(opcion, opcion)
        if adg.opcionSeleccionada == opcion then texto = texto .. "  <--" end
        dibujarTextoConBorde(texto, 10, 40 + (opcion - inicio) * 10, 
                           adg.opcionSeleccionada == opcion and 2 or 3)
    end

    -- Mostrar respuesta
    if adg.mensajeRespuesta ~= "" then
        for i, linea in ipairs(dividirMensaje(adg.mensajeRespuesta, 40)) do dibujarTextoConBorde(linea, 10, 90 + (i-1)*10, 11) end
    end
    -- Modo Telescopio
    elseif mode == "telescopio" then
        local t = todoJuego.estadoTelescopio or {}
        local m = t.mira or {x = 120, y = 68, radio = 30}
        
        -- Movimiento de la mira
        if btn(0) then m.y = math.max(m.y - 2, m.radio) end if btn(1) then m.y = math.min(m.y + 2, 135 - m.radio) end
        if btn(2) then m.x = math.max(m.x - 2, m.radio) end if btn(3) then m.x = math.min(m.x + 2, 239 - m.radio) end

        -- Dibujo del telescopio
        rect(0, 0, 240, 136, 0) circ(m.x, m.y, m.radio, 0) circb(m.x, m.y, m.radio, 15)

        -- Estrellas (inicialización si no existe)
        t.estrellas = t.estrellas or {}
        if #t.estrellas == 0 then for i = 1, 50 do table.insert(t.estrellas, { x = math.random(0, 239),y = math.random(0, 135) }) end
        end

        -- Colores para estrellas (animación)
        t.coloresEstrella = t.coloresEstrella or {12, 11, 10, 9, 8, 7}
        t.frameAnimacion = (t.frameAnimacion or 0) + 1
        local colorEstrella = t.coloresEstrella[(t.frameAnimacion // 10 % #t.coloresEstrella) + 1]

        -- Dibujar estrellas visibles
        local radioCuadrado = m.radio * m.radio
        for _, estrella in ipairs(t.estrellas) do
            local dx,dy = estrella.x - m.x,estrella.y - m.y
            if dx*dx + dy*dy <= radioCuadrado then dibujarEstrella(estrella.x, estrella.y, colorEstrella) end
        end

        -- Estrella fugaz
        t.estrellaFugaz = t.estrellaFugaz or {x = 240, y = 0, trail = {}}
        local ef = t.estrellaFugaz
        
        -- Actualizar posición y trail
        table.insert(ef.trail, 1, {x = ef.x, y = ef.y})
        if #ef.trail > 10 then table.remove(ef.trail) end

        ef.x, ef.y = ef.x - 3, ef.y + 1
        if ef.x < 0 or ef.y > 135 then ef.x, ef.y, ef.trail = 240, math.random(0, 50), {} end

        -- Dibujar estrella fugaz si está visible
        local dx,dy = ef.x - m.x,ef.y - m.y
        if dx*dx + dy*dy <= radioCuadrado then
            dibujarEstrella(ef.x, ef.y, 10)
            for i, pos in ipairs(ef.trail) do
                dx,dy = pos.x - m.x,pos.y - m.y
                if dx*dx + dy*dy <= radioCuadrado and (10 - i) > 0 then pix(pos.x, pos.y, 10 - i) end
            end
        end

    -- Modo Radio
    elseif mode == "radio" then
        local r = todoJuego.radios or {}
        local v = r.variables or {radioActual = 1,temporizadorRadio = 0,indiceFraseRadio = 1}
        
        local nombresRadios = {"01 Radio Todo Vardo", "02 Radio Bajones", "03 Radio Poesia de la Calle","04 Gobierno de Argentina", 
            "05 Solos y Solas", "06 Desgracias Economicas","07 Joyas de la Historia", "08 No me importa", "09 Radio Antimainstream",
            "10 Cine Ultra 8K", "11 Destapando Curros", "12 Radio Grieta"}

        -- Actualización del temporizador
        v.temporizadorRadio = v.temporizadorRadio + 1
        if v.temporizadorRadio >= 180 then
            v.temporizadorRadio = 0
            v.indiceFraseRadio = (v.indiceFraseRadio == #r["radio_"..v.radioActual] and 1 or v.indiceFraseRadio + 1)
        end

        -- Cambio de radio
        if btnp(7) then v.radioActual,v.indiceFraseRadio,v.temporizadorRadio = v.radioActual == 12 and 1 or v.radioActual + 1,1,0 end

        -- Dibujado de la radio actual
        if v.radioActual >= 1 and v.radioActual <= 12 then
            dibujarTextoConBorde(nombresRadios[v.radioActual], 90, 120, 4, 0)
            
            local dialogo = r["radio_"..v.radioActual]
            if dialogo and dialogo[v.indiceFraseRadio] then
                local y = 80
                for i, linea in ipairs(dividirMensaje(dialogo[v.indiceFraseRadio], 36)) do
                    dibujarTextoConBorde(linea, 10, y + (i-1)*10, 12, 7)
                end
            end
        end

    -- Modo Lector de Diarios
    elseif mode == "diario" then
        local accion = ... or "dibujar"
        local ld = todoJuego.lectorDeDiarios or {}
        
        if accion == "dibujar" then
            -- Fondo del periódico
            cls(15)
            
            rect(0, 0, 240, 40, 12);rect(0, 200, 240, 40, 13);rect(0, 40, 240, 160, 14) --cabecera,pie y area de contenido
            for _,t in ipairs{{"Buenos Aires Times Piolas",80,10,4},{"25 Peluca$",10,20,4},{"Enero de 2025",140,20,4}} 
            do dibujarTextoConBorde(t[1],t[2],t[3],t[4]) end
            
            -- Contenido del periódico
            local noticias = {{titulo = "Portada - Silvestre Stacchotta protagoniza su nueva pelicula, Mambo.",
                descripcion = "En un giro inesperado de eventos, el popular actor Silvestre Stacchotta ha decidido unirse a la nueva pelicula 'Mambo'. La noticia ha sorprendido a sus fanaticos, quienes esperaban verlo en proyectos mas dramaticos, pero esta vez, el actor se aventura en el mundo de la comedia musical."
                },
                {titulo = "Local - Juan Garcamaru obliga a las peluquerias a usar mangas japoneses.",
                descripcion = "En un evento sin precedentes, Juan Garcamaru ha irrumpido en peluquerias locales exigiendo que todas las revistas sean reemplazadas por mangas japoneses. Segun testigos, el hombre estaba decidido a promover la cultura otaku 'por cualquier medio necesario'."
                },
                {titulo = "Mundo - Sudan del Sur inventa el Afrophone.",
                descripcion = "El Afrophone, un telefono revolucionario que utiliza el Ebola como fuente de energia, ha sido presentado en Sudan del Sur. Los cientificos detras del proyecto aseguran que esta tecnologia podria ser clave en el desarrollo sostenible de la region."
                },
                {titulo = "Bizarro - Un payaso en la provincia de Cordoba asegura poder matar con la mirada.",
                descripcion = "En un acto inusual, un payaso de la provincia de Cordoba ha afirmado tener el poder de matar con solo mirar a sus victimas. Los habitantes locales estan sorprendidos, mientras que las autoridades intentan verificar la veracidad de esta afirmacion."
                },
                {titulo = "Politica - Jorge Lanota coquetea con su ingreso a la politica.",
                descripcion = "El actor y humorista Jorge Lanota ha dejado abierta la posibilidad de entrar al mundo de la politica. En una entrevista reciente, Lanota bromeo diciendo que, dado su estatus de sex symbol, deberia ser considerado para un puesto politico que luche contra la corrupcion."
                }}

            -- Configurar scroll si no existe
            ld.scroll,ld.maximoScroll = ld.scroll or 0
            ld.maximoScroll = #noticias * 110  -- Aproximación
            
            -- Dibujar contenido con scroll
            clip(0, 40, 240, 160)
            local y = 50 - ld.scroll
            local maxAncho = math.floor(240 / 6) - 2  -- Ancho máximo en caracteres
            
            for _, noticia in ipairs(noticias) do
                -- Título
                for _, linea in ipairs(dividirMensaje(noticia.titulo, maxAncho)) do
                    if y >= 40 and y < 200 then dibujarTextoConBorde(linea, 10, y, 4) end
                    y = y + 10
                end
                
                -- Descripción
                for _, linea in ipairs(dividirMensaje(noticia.descripcion, maxAncho)) do
                    if y >= 40 and y < 200 then dibujarTextoConBorde(linea, 10, y, 3) end
                    y = y + 10
                end
                
                y = y + 10  -- Espacio entre noticias
            end
            clip()

        elseif accion == "scroll" then
            local direccion = ...
            ld.scroll = ld.scroll or 0
            ld.maximoScroll = ld.maximoScroll or 0
            
            if btn(0) then ld.scroll = math.max(ld.scroll - 10, 0)
            elseif btn(1) then ld.scroll = math.min(ld.scroll + 10, ld.maximoScroll) end
        end
    end
end

--FUNCION PRINCIPAL DE UPDATE ( = TIC ).

function TIC()
    cls(0)

    -- Cacheo de variables optimizado (sin duplicaciones)
    local menu,jugador,config = todoJuego.menuPrincipal,todoJuego.estadoJugador.jugador,todoJuego.configuracionGeneral
    local estados, selector, opciones = menu.estados, menu.selector, menu.opciones
    local colores = selector.colores

    -- Función auxiliar para verificar estados activos
    local function anyStateActive()
        for k, v in pairs(_G) do
            if k:find("^iniciar") and v then return true
            end
        end
        return false
    end

    -- Objeto game con todas las funciones y estados originales
    local game = { states = { menuPrincipal = not anyStateActive(),
            juegoPrincipal = estados.juegoPrincipal,pinball = estados.pinball,misionStuntman = estados.misionStuntman,
            baile = estados.juegoBaile,telescopio = estados.telescopio,diarios = estados.Diarios,
            creditos = estados.Creditos,intro = estados.intro,demo = estados.demo},
        
        -- Manejo de estados
        handleStates = function(self)
            if self.states.menuPrincipal then self:drawMenu();self:handleMenuInput() end
            if self.states.juegoPrincipal then manejarJuegoPrincipalConMenus()
            elseif self.states.baile then cls(0) todoMinijuegoBaile()
            elseif self.states.pinball then cls(0) todoMinijuegoPinball()
                --manejarModulos("teclado","num")
            elseif self.states.misionStuntman then todoMisionStuntman() 
            elseif self.states.diarios then manejarModulos("diario","dibujar");manejarModulos("diario","scroll") 
            elseif self.states.telescopio then manejarModulos("diario","dibujar");manejarModulos("diario","scroll")
            --manejarModulos("telescopio")
                if btnp(5) then estados.telescopio = false jugador.x, jugador.y = 60, 140 end
            elseif self.states.creditos then manejarJuegoPrincipalConMenus("creditos")
            elseif self.states.intro then manejarJuegoPrincipalConMenus("intro")
            elseif self.states.demo then manejarJuegoPrincipalConMenus("demo") end
        end,
        
        -- Dibujar menú
        drawMenu = function(self)
            p("> ELIGE UN MODO <", 60, 20, 15)
            for i = 1, #opciones do
                local y = 20 + i * 10
                local selected = (i == selector.seleccion)
                local text = selected and "> "..opciones[i].." <" or opciones[i]
                p(text, selected and 40 or 50, y, colores[i])
            end
            p("Flechas: Mover | (A): Seleccionar", 0, 0, 7) p("(X): Intro | (Y): Demo | (B): Creditos", 0, 10, 7)
        end,
        
        -- Manejar entrada del menú
        handleMenuInput = function(self)
            if selector.debounce > 0 then selector.debounce = selector.debounce - 1 return end
            
            -- Navegación
            if btnp(0) then -- Arriba
                sfx(3, 200, 10, 0, 1)
                selector.seleccion = selector.seleccion > 1 and selector.seleccion - 1 or #opciones
                selector.debounce = 10
            elseif btnp(1) then -- Abajo
                sfx(3, 200, 10, 0, 1)
                selector.seleccion = selector.seleccion < #opciones and selector.seleccion + 1 or 1
                selector.debounce = 10
            end
            
            -- Selección de modo
            if btnp(4) then
                sfx(3, 200, 10, 0, 1)
                self:resetAllStates()
                
                local actions = { [1] = function() estados.juegoPrincipal = true end,[2] = function() estados.pinball = true end,
                    [3] = function() estados.misionStuntman = true estados.juegoPrincipal = true end,
                    [4] = function() estados.juegoBaile = true end,[6] = function() estados.telescopio = true end,
                    [9] = function() estados.Diarios = true end}
                
                if actions[selector.seleccion] then actions[selector.seleccion]() end
                selector.debounce = 20
            end
            
            -- Botones especiales ( 5 = X,6 = Y,7 = B)
            if btnp(5) then self:resetAllStates() estados.intro = true selector.debounce = 20
            elseif btnp(6) then self:resetAllStates() estados.demo = true selector.debounce = 20
            elseif btnp(7) then self:resetAllStates() estados.Creditos = true selector.debounce = 20 end
        end,
        
        -- Reiniciar todos los estados
        resetAllStates = function(self)
            for k in pairs(_G) do
                if k:find("^iniciar") then _G[k] = false end
            end
        end,
        
        -- Mostrar información de debug
        showDebug = function(self)
            rect(200, 110, 30, 110, 0)
            for _,p in ipairs{{jugador.x,120,6,"X: "},{jugador.y,125,6,"Y: "},{jugador.x/8,110,5,"Xc:"},
            {jugador.y/8,115,5,"Yc:"}} do print(p[4]..p[1],200,p[2],p[3]) end
        end
    }
    
    -- Ejecución principal
    game:handleStates() game:showDebug()
    
    config.temporizadorGeneral = config.temporizadorGeneral + 1
end