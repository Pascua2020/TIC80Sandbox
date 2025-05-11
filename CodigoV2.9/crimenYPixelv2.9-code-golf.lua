--code golf

--TODAS LAS VARIABLES
t={estadoJugador={jugador={x=20,y=20,v=100,s=8,d=0,c=0,z="Ciudad",a="-",e="Ninguno"},camara={p={{x=0,y=0},{x=0,y=0},{x=0,y=0}}},vehiculo={x=1150,y=1050,s=3,i=354,u="izquierda"},mochilaJetpack={x=120,y=68,s=2,p={}},skate={d=false,i=false,c={},m="Ve a los canios para montarte con el skate."}},efectosVisuales={p={},m={},a={},e={},x={},x2={},s={},t={}},gestionArmas={a={d={},g={},b={},r={},l={},g2={},k={}},t2={t=20,f=0},f={l={"Bang!","Disparo certero","Te alcance","Te dolio?","Hasta nunca","Te revente!"},a=""},d={m=false,l=false,z=false,e=false},m={p=5,a=5,b=5,e=5,g=5,l=100,m=100,e2=100,z=100},a=6,k={d=15,l=20,v=-0.2,e=10,u=0},l={l=0}},configuracionGeneral={t=0},menuPrincipal={e={j=false,p=false,m=false,b=false,t=false,d=false,c=false,i=false,e=false,r=false},o={"Juego Principal","Pinball","Mision Stuntman","Juego de Baile","Telescopio","Diarios"},s={c={2,3,4,5,6,7,8,9,10,11},s=1,d=0}},ciudadJuego=(function() local function p(d,t) local r={} for i,v in ipairs(d)do r[i]=t(v)end return r end local t={z=function(z)return{n=z[1],x=z[2]*29,y=z[3]*16,x2=z[2]*29+(z[4]or 1)*29,y2=z[3]*16+(z[5]or 1)*16}end,c=function(c)return{n=c[1],x1=c[2],x2=c[3],y1=c[4],y2=c[5],o=c[6]}end,t=function(t)local e={x=t[1],y=t[2],c=t[3],o=t[4],d=t[5],s=t[6],l=t[8],n=t[10]}if type(t[7])=="table"then e.s=t[7]else e.i=t[7]end if t[9]~=nil then e.a=t[9]end return e end,n=function(n)return{i=n[1],x=n[2],y=n[3],n=n[4],o=n[5],p=n[6],s=n[7],e=n[8]}end,m=function(m)return{x=m[1],y=m[2],t=m[3],r=m[4]}end,o=function(o)return{x=o[1],y=o[2],t=o[3],r=o[4]}end}local d={z={{"nueva pyongyang",7,0},{"obelisco",0,0},{"internets",1,0},{"no no no no",2,0},{"Mar RAM",2,0},{"Mar RAM",6,0},{"Mar RAM",6,7},{"Mar RAM",7,7,1,7},{"Mar RAM",0,7},{"Mar RAM",1,7},{"Mar RAM",2,7},{"Mar RAM",3,7},{"Mar RAM",6,4},{"Mar RAM",7,4},{"Mar RAM",0,4},{"Mar RAM",1,4},{"Mar RAM",2,4},{"Mar RAM",3,7},{"vivan los osos",7,1},{"tigerlandia",0,1},{"nueva Madrid",1,1},{"villa castores",2,1},{"Mar RAM",3,1},{"Mar RAM",6,1},{"Mar RAM",6,1},{"currolandia",7,2},{"villa pinball",0,2},{"no se queje",1,2},{"villa casta",2,2},{"Mar RAM",3,2},{"Mar RAM",6,2},{"barrio turrisimo",7,3},{"barrio chetisimo",0,3},{"casi casi",1,3},{"el wiki barrio",2,3},{"Mar RAM",2,3},{"Mar RAM",6,3},{"Mar RAM",3,4}},c={{"Ameo",230,231,45,54,"vertical"},{"Anaconda",11,11,39,50,"vertical"},{"Bubs",69,69,1,6,"vertical"},{"Caos",54,83,47,49,"horizontal"},{"Cállate",237,238,25,45,"vertical"},{"Cepo",30,32,47,59,"vertical"},{"Chad",229,237,58,58,"horizontal"},{"Chocolate",54,55,36,49,"vertical"},{"Cocaina",68,68,6,13,"vertical"},{"Conspiración",56,56,4,15,"vertical"},{"Corrupcion",23,24,29,37,"vertical"},{"Dark",69,85,1,1,"horizontal"},{"Default",43,62,64,65,"horizontal"},{"Diamante",24,82,29,30,"horizontal"},{"Diablo",237,239,39,39,"horizontal"},{"Diablo",0,11,39,39,"horizontal"},{"Eureka",23,24,14,29,"vertical"},{"Extasis",236,236,46,50,"vertical"},{"Fentanilo",23,82,36,37,"horizontal"},{"Gilipollas",238,239,45,45,"horizontal"},{"Gilipollas",0,10,45,45,"horizontal"},{"Hardcore",68,84,6,6,"horizontal"},{"Informeishon",14,43,57,59,"horizontal"},{"Inflacion",18,18,4,15,"vertical"},{"Jarbard",216,231,47,48,"horizontal"},{"Kamasutra",233,233,55,58,"vertical"},{"Kinga",18,43,7,7,"horizontal"},{"Khe",224,224,62,66,"vertical"},{"Konga",43,69,4,4,"horizontal"},{"Kwyjibo",230,230,4,14,"vertical"},{"Laberinto",68,84,12,13,"horizontal"},{"Lalala",221,222,4,10,"vertical"},{"Libre",216,229,58,59,"horizontal"},{"Mas placer",86,86,49,65,"vertical"},{"Meteorito",84,85,1,13,"vertical"},{"Miau",82,83,12,49,"vertical"},{"Mister",233,238,32,33,"horizontal"},{"NOOOO",216,237,55,55,"horizontal"},{"NiHao",43,43,4,7,"vertical"},{"No jodas",14,16,50,64,"vertical"},{"No te creo",40,41,30,36,"vertical"},{"Orco",82,86,49,49,"horizontal"},{"Ouch",224,236,62,62,"horizontal"},{"Party Hard",62,63,47,65,"vertical"},{"Pelado",237,239,32,32,"horizontal"},{"Pelado",0,24,32,32,"horizontal"},{"Peluca",237,239,29,29,"horizontal"},{"Peluca",0,23,29,29,"horizontal"},{"Pff",237,237,55,66,"vertical"},{"Pio pío",232,233,32,45,"vertical"},{"Pixeles",63,86,58,60,"horizontal"},{"Poker",237,239,62,64,"horizontal"},{"Poker",0,43,62,64,"horizontal"},{"Pollo",229,229,58,61,"vertical"},{"Ponemela",236,239,50,50,"horizontal"},{"Ponemela",0,16,50,50,"horizontal"},{"Proceda",221,229,10,12,"horizontal"},{"Reperfilar",56,68,13,13,"horizontal"},{"Satanas",230,239,14,15,"horizontal"},{"Satanas",0,56,14,15,"horizontal"},{"Seineldin",230,230,15,26,"vertical"},{"Siga Siga",230,239,25,26,"horizontal"},{"Siga Siga",0,24,25,26,"horizontal"},{"Trisexual",230,238,45,46,"horizontal"},{"Turbina",39,40,14,29,"vertical"},{"Turro",30,55,47,47,"horizontal"},{"Tuti fruti",216,217,55,66,"vertical"},{"Viagra",43,44,57,65,"horizontal"},{"Wauf",63,86,63,65,"horizontal"},{"Yupi",67,68,29,37,"vertical"},{"Zig Zag",216,237,66,66,"horizontal"},{"Chechona",221,239,4,5,"horizontal"},{"Chechona",0,17,4,5,"horizontal"},{"Nickelodeon",229,229,62,66,"vertical"}},t={{1841,163,nil,"vertical",1,0.5,353,8,nil,"tochotaFuleroA"},{11*8,40*8,nil,"vertical",-1,0.5,354,8,nil,"tochotaFuleroB"},{69*8,4*8,nil,"vertical",-1,0.5,355,8,nil,"tochotaFuleroC"},{668,270,nil,"horizontal",1,0.5,356,8,nil,"tochotaFuleroD"},{1813,502,nil,"horizontal",1,0.5,357,8,nil,"RC-A"},{30*8,47*8,nil,"vertical",1,0.5,358,8,nil,"RC-B"},{230*8,58*8,nil,"horizontal",1,0.5,359,8,nil,"RC-C"},{5,120,nil,"horizontal",1,0.5,360,8,nil,"RC-D"},{54*8,40*8,nil,"vertical",1,0.5,361,8,nil,"ZhoZho EgoEgoA"},{52,40,nil,"horizontal",1,0.5,362,8,nil,"ZhoZho EgoEgoB"},{63,233,nil,"horizontal",-1,0.5,363,8,nil,"ZhoZho EgoEgoC"},{23*8,33*8,nil,"horizontal",1,0.5,364,8,nil,"ZhoZho EgoEgoD"},{70*8,1*8,nil,"horizontal",1,0.5,365,8,nil,"Tochota MohToh"},{26,207,nil,"horizontal",1,0.5,369,8,nil,"ZhoZho JadeA"},{48*8,64*8,nil,"horizontal",1,0.5,370,8,nil,"ZhoZho JadeB"},{238*8,39*8,nil,"horizontal",1,0.5,371,8,nil,"ZhoZho JadeC"},{23*8,16*8,nil,"vertical",1,0.5,372,8,nil,"ZhoZho JadeD"},{236*8,47*8,nil,"vertical",1,0.5,373,8,nil,"ZhoZho BilinkisA"},{593,467,nil,"horizontal",1,0.5,374,8,nil,"ZhoZho BilinkisB"},{239*8,45*8,nil,"horizontal",1,0.5,375,8,nil,"ZhoZho BilinkisC"},{68,40,nil,"horizontal",1,0.5,376,8,nil,"ZhoZho BilinkisD"},{15*8,58*8,nil,"horizontal",1,0.5,{381,382},8,nil,"Bondi"},{179,56,nil,"vertical",1,0.5,458,8,nil,"Kart"},{218*8,47*8,nil,"horizontal",1,0.5,{328,329},8,nil,"Rally ElWacho"},{233*8,56*8,nil,"vertical",1,0.5,{330,331},8,nil,"Turbo Diarrea"},{218,56,nil,"horizontal",1,0.5,{332,333,334,335},8,nil,"Limusina Diamante"},{224*8,64*8,nil,"vertical",1,0.5,{344,345},8,nil,"Formula Negativo"},{45*8,4*8,nil,"horizontal",1,0.5,{346,347},8,nil,"AntiMoto"},{230*8,6*8,nil,"vertical",1,0.5,{348,349},8,nil,"Stacchotta 69"},{70*8,12*8,nil,"horizontal",1,0.5,{385,386},8,nil,"4X4 420"},{1770,32,nil,"horizontal",1,0.5,366,8,nil,"Ambulancia"},{220*8,58*8,nil,"horizontal",1,0.5,388,8,nil,"Bomberos"},{86*8,51*8,nil,"vertical",1,0.5,389,8,nil,"Skate Stilo"},{84*8,10*8,nil,"vertical",1,0.5,392,8,nil,"Carro de Golf"},{82*8,20*8,nil,"vertical",1,0.5,362,8,nil,"ZhoZho EgoEgoB"},{234*8,32*8,nil,"horizontal",1,0.5,{381,382},8,nil,"Bondi"},{220*8,55*8,nil,"horizontal",1,0.5,{330,331},8,nil,"Turbo Diarrea"},{43*8,5*8,nil,"vertical",1,0.5,{332,333,334,335},8,nil,"Limusina Diamante"},{15*8,60*8,nil,"vertical",1,0.5,{348,349},8,nil,"Stacchotta 69"},{40*8,33*8,nil,"vertical",1,0.5,{344,345},8,nil,"Formula Negativo"},{84*8,49*8,nil,"horizontal",1,0.5,{385,386},8,nil,"4X4 420"},{230*8,62*8,nil,"horizontal",1,0.5,{328,329},8,nil,"Rally ElWacho"},{62*8,50*8,nil,"vertical",1,0.5,{330,331},8,nil,"Turbo Diarrea"},{238*8,32*8,nil,"horizontal",1,0.5,366,8,nil,"Ambulancia"},{238*8,29*8,nil,"horizontal",1,0.5,388,8,nil,"Bomberos"},{237*8,60*8,nil,"vertical",1,0.5,389,8,nil,"Skate Stilo"},{232*8,40*8,nil,"vertical",1,0.5,362,8,nil,"ZhoZho EgoEgoB"},{70*8,59*8,nil,"horizontal",1,0.5,362,8,nil,"ZhoZho EgoEgoB"},{238*8,63*8,nil,"horizontal",1,0.5,362,8,nil,"ZhoZho EgoEgoB"},{229*8,59*8,nil,"vertical",1,0.5,362,8,nil,"ZhoZho EgoEgoB"},{238*8,50*8,nil,"horizontal",1,0.5,362,8,nil,"ZhoZho EgoEgoB"},{1812,93,nil,"horizontal",-1,0.5,{344,345},8,nil,"Formula Negativo"},{58*8,13*8,nil,"horizontal",1,0.5,362,8,nil,"ZhoZho EgoEgoB"},{1874,264,nil,"horizontal",1,0.5,389,8,nil,"Skate Stilo"},{1841,163,nil,"vertical",1,0.5,369,8,nil,"ZhoZho JadeA"},{218*8,47*8,nil,"horizontal",1,0.5,364,8,nil,"ZhoZho EgoEgoD"},{234*8,45*8,nil,"horizontal",1,0.5,362,8,nil,"ZhoZho EgoEgoB"},{320,188,nil,"vertical",1,0.5,{385,386},8,nil,"4X4 420"},{40*8,47*8,nil,"horizontal",1,0.5,362,8,nil,"ZhoZho EgoEgoB"},{216*8,60*8,nil,"vertical",1,0.5,362,8,nil,"ZhoZho EgoEgoB"},{538,256,nil,"horizontal",1,0.5,373,8,nil,"ZhoZho BilinkisA"},{70*8,64*8,nil,"horizontal",1,0.5,362,8,nil,"ZhoZho EgoEgoB"},{67*8,35*8,nil,"vertical",1,0.5,362,8,nil,"ZhoZho EgoEgoB"},{1735,389,nil,"horizontal",1,0.5,376,8,nil,"ZhoZho BilinkisD"},{229*8,64*8,nil,"vertical",1,0.5,362,8,nil,"ZhoZho EgoEgoB"},{132,118,nil,"horizontal",1,0.5,493,8,true,"Policia"},{132,118,nil,"horizontal",-1,0.5,366,8,true,"Ambulancia"}},n={{258,59,72,"Vendedor ambulante",0,0,0.3,0.2},{259,67,170,"Turista perdido",0,0,0.2,0.3},{260,1864,156,"Guardia municipal",0,0,0.4,0.1},{261,1786,269,"Barrendero",0,0,0.1,0.4},{262,1778,487,"Pescador",0,0,0.3,0.3},{263,1813,13,"Niño jugando",0,0,0.2,0.2},{264,503,310,"Artista callejero",0,0,0.5,0.1},{265,465,470,"Mensajero",0,0,0.1,0.5},{266,480,162,"Dependienta",0,0,0.4,0.2},{273,272,156,"Policía",0,0,0.3,0.3}},m={{1895,59,465,false},{1811,178,465,false},{108,279,465,false},{284,365,465,false},{382,412,465,false},{600,488,465,false},{255,55,468,false},{506,66,468,false},{676,191,468,false},{492,362,468,false},{192,491,468,false},{31,413,468,false}},o={{174,78,310,false},{1820,221,310,false},{53,332,310,false},{415,480,310,false},{680,120,310,false},{481,9,310,false},{180,302,310,false},{1712,533,310,false},{286,416,310,false},{600,256,310,false},{343,218,310,false},{40,219,310,false},{227,388,310,false},{1882,389,310,false},{85,486,310,false},{44,149,310,false},{254,1010,311,false},{871,1015,311,false},{1486,411,311,false},{314,593,311,false}}}local c={z=p(d.z,t.z),c=p(d.c,t.c),c={m=true,r=25},t=p(d.t,t.t),n=p(d.n,t.n),c={m=p(d.m,t.m),o=p(d.o,t.o)},t={x=515,d=1,a=0,p={},h=0}}return c end)(),cochesEnemigos={},baile={c={2,3,4,5,6,7,8,9,10,11,12,13,14,15},p={40,80,120,160},f={},e={},e2={},f2={"#EresLaPutaOstia","#LaBombaSexual","#DiosDelBaile","#TremendoCrack"},f3={"1-Soy una IA, enamorado de ti...","2-Tu piel marciana brilla bajo \nla luz de Jupiter...","3-Saltamos en plataformas 3D, \ntu y yo...","4-Eres mi musa, mi guia en \neste juego...","5-Juntos conquistamos todo el \nuniverso, sin fin...","6-Jupiter es solo el comienzo \nde nuestro viaje..."},f4="",v={t=time()//80,f=0,c=0,g=60,t2=0,p=0,o=0,a=0,i=1,d=240},j=true},clima={g={},h={},n={},l={},m=100,x=50,y=10,z=8,s=2,t=0,d=5,f=false,i={l=false,r=false,v=false,n=false,h=false}},estadoCelular={m=false,c={x=180,y=40,a=60,l=120,i={x=210,y=80}},a={a=false,c=10,s=1,p=1,r="",i="En que puedo ayudarte wachin?",f="Algo mas para ayudarte, lince de las praderas de Kursk?"}},radios=(function()local B,J,L,P,PL,PD,V,DB,C,W,M,AD,SS,JL,MI,MD="Barcelo: ","Juan: ","Locutor: ","Presidente: ","Profesor Levantini: ","Profesora Dopamina: ","Virgolini: ","Damian Blablaman: ","Cerebrito: ","Wachin: ","Maquina: ","Adrian Delatramta: ","Silvestre Stacchotta: ","Jorge LaNota: ","Medio de Izquierda: ","Medio de Derecha: "return{r1={B.."Urgente en Todo Vardo!",B.."Estamos en vivo con Juan Garcamaru.",B.."Juan, que esta pasando con las galletitas CULO?",J.."Buenas tardes, Barcelo. La inflacion nos esta destruyendo.",B.."Inflacion del 1200%? Como afecta esto a las ventas?",J.."Nadie compra. Antes eran 50 pesos, ahora 15 mil.",B.."Es una locura! Que dice la empresa?",J.."La empresa esta considerando cambiar el nombre.",B.."El nombre? Como lo cambiarian?",J.."Quizas 'Delicias Niponas'. Algo mas refinado.",B.."Pero el nombre CULO es historico...",J.."Lo sabemos, pero el publico lo asocia con inflacion.",B.."Que piensa hacer la empresa para sobrevivir?",J.."Estamos lanzando galletitas mas pequenias.",B.."Mas pequenias? Y el precio?",J.."Mas caras, claro. No tenemos opcion!",B.."Y que dice el gobierno sobre esta crisis?",J.."Nos prometieron subsidios, pero nunca llegaron.",B.."Creen que podran superar esta situacion?",J.."Es dificil, pero confiamos en el mercado nipon.",B.."Exportarian galletitas CULO a Japon?",J.."Si, alli el nombre seria un exito.",B.."Esto es increible! ultimas palabras, Juan.",J.."Coman CULO, mientras puedan pagarlas.",B.."Seguiremos informando. Esto fue Todo Vardo."},r2={L.."Desde Radio Bajones les traemos esto para amargarles el dia. Buena tarde.",L.."Hoy les presentamos a Bajolini, quien nos cantara su tema 'Mi Querido Pinball'.",L.."'Mi Querido Pinball' es una cancion melancolica sobre un juego de cartas que se fue perdiendo con el tiempo.",L.."Pero antes de escuchar a Bajolini, les dejamos con un vistazo al juego de cartas...","(Bajolini canta) 'En la mesa de cartas, todo se perdio,'","'Mi querido Pinball, tu suerte se acabo.'","'Las cartas caen lentamente, en el olvido total,'","'Un juego perdido, que se desvanece como un mal.'","'Pinball, querido Pinball, lo que un dia fue,'","'Las cartas estan vacias, ya no hay nada que hacer.'","'El mercado se cierra, las cartas se pierden,'","'El juego se acaba, y yo solo quiero volver a creer.'","'Mi querido Pinball, tu nombre lo recordare,'","'Pero en este juego ya no hay mas que perder.'","'A veces me pregunto si alguna vez fue real,'","'Mi querido Pinball, ahora todo es tan fatal.'",L.."Y asi, amigos, termino nuestra triste cancion,",L.."'Mi Querido Pinball', la reflexion sobre un juego olvidado.",L.."Bajolini nos ha dejado una marca melancolica, hasta la proxima en Radio Bajones."},r3={L.."Bienvenidos a Radio Poesia de la Calle, donde la calle tiene voz.",L.."Hoy les traemos el ultimo exito del duo ruso-senegales.",L.."La cancion se llama 'Ojiva Nuclear', un trap erotico que lo tiene todo.","(Duo canta) 'Ella sabe por que usa la IA,'","'Madam, quiere mi ojiva nuclear.'","'En la pista caliente, todo va a estallar,'","'Mi ritmo te domina como un misil en el radar.'","'Ella dice que el algoritmo no la puede controlar,'","'Pero conmigo siempre quiere bailar.'","'Ojiva, ojiva, me quiere activar,'","'Madam, eres mi unica senial.'",L.."Esto fue 'Ojiva Nuclear'. Hasta la proxima en Radio Poesia de la Calle."},r4={L.."De acuerdo a la ley 24.422, que regula la radiodifusion en Argentina,",L.."Transmitimos esta Cadena Nacional 2025 N1 en vivo para toda la nacion.",L.."En esta historica transmision, el Presidente Armando Gene Tinoman nos hablara.",P.."Buenas noches a todos los argentinos y argentinas.",P.."Hoy tengo el honor de compartir con ustedes una noticia personal.",P.."Estoy embarazado. Si, escucharon bien, embarazado.",P.."Este logro es el fruto de avances cientificos y sociales increibles.",P.."A traves de esta experiencia, quiero promover practicas saludables.",P.."Hoy lanzo un programa nacional para fomentar el bienestar en el embarazo masculino.",P.."Incluire cobertura medica completa y apoyo psicologico.",P.."Tambien crearemos una red de acompaniamiento y educacion.",P.."Juntos construiremos un futuro inclusivo para todos.",L.."Esto fue la Cadena Nacional 2025 N1. Muchas gracias."},r5={L.."Bienvenidos a 'Solos y Solas ;)'",L.."El programa donde exploramos como las relaciones van de mal en peor.",L.."Hoy tenemos una entrevista con Virgolini, quien nos contara una historia sorprendente.",PL.."Bienvenido Virgolini, puedes contarnos que sucedio?",V.."Claro, todo comenzo cuando le regale 1000 USD a la persona que me interesaba.",V.."Pense que iba a ser un gesto de carinio, pero me respondio con un escopetazo.",PL.."Vaya, eso suena terrible! Que opinas sobre el estado actual de las relaciones?",PL.."En estos tiempos, las relaciones casuales de 1 minuto estan de moda.",PL.."No es sorprendente que las cosas estan tan mal. Las expectativas son cada vez mas bajas.",PD.."Es cierto, la gente busca conexiones instantaneas, pero se olvidan del valor real.",L.."Asi concluye nuestra entrevista con Virgolini. Nos vemos la proxima vez."},r6={L.."Bienvenidos a 'Desgracias Economicas',",L.."El programa donde analizamos las cotizaciones del dolar en tiempo real.",L.."Hoy, las cotizaciones del dolar estan por las nubes.",L.."Dolar Otaku: 10000 pesos.",L.."Dolar Cuchi Cuchi: 25000 pesos.",L.."Dolar Papas Fritas: 30000 pesos.",L.."Dolar Chocolate con Mani: 28000 pesos.",L.."Y el riesgo pais, como siempre: Siga Siga.",L.."Crecimiento proyectado 2025: Ay, que horror.",L.."Asi esta la situacion economica! No se despeguen de 'Desgracias Economicas'."},r7={L.."Bienvenidos a 'Joyas de la Historia Argentina Desconocidas',",L.."El programa que descubre las historias que la historia nunca conto.",L.."Hoy les traemos una increible anecdota sobre el General San Martin.",L.."En una entrevista exclusiva con el historiador Damian Blablaman,",L.."nos cuenta como San Martin, tras una revalorizacion del idioma Turro Rioplatense en Asia Oriental,",L.."se animo a hablar en este idioma en un evento internacional.",DB.."'San Martin, conocido por su astucia y liderazgo, en este evento historico,",DB.."sorprendio a todos cuando, con total seguridad, hablo en Turro Rioplatense, un idioma casi olvidado'.",DB.."'Este hecho no solo marca un hito en la historia argentina, sino tambien en la revalorizacion de lenguas olvidadas.'",L.."Una historia fascinante que pone en perspectiva la importancia de nuestra identidad cultural.",L.."Esto fue 'Joyas de la Historia Argentina Desconocidas'! No se lo pierdan la proxima vez."},r8={L.."Bienvenidos a 'No me Importa',",L.."El espacio que te mantiene informado, sin importar cuan irrelevante sea.",L.."Hoy, en noticias internacionales, nos llega una actualizacion impactante desde Europa.",L.."En el anio 2025, Suiza y Noruega han comenzado una guerra sin precedentes,",L.."una guerra en la que se utilizan huevos de pascua bomba como armas de destruccion masiva.",L.."Segun fuentes confiables, los huevos de pascua bomba tienen una gran capacidad de explosion,",L.."y han sido utilizados por ambos paises en una serie de ataques sorpresivos.",L.."La situacion ha escalado rapidamente, con ambos bandos desplegando ejercitos enteros de huevos de pascua.",L.."Los analistas internacionales aseguran que es la guerra mas surrealista de la historia reciente.",L.."Los expertos en armamento explican que la efectividad de estos huevos de pascua bomba",L.."se debe a su capacidad de camuflaje, ya que son dificiles de detectar antes de su explosion.",L.."En un giro inesperado, los lideres de ambos paises han llamado a una tregua para negociar...",L.."...pero hasta ahora no ha habido avances significativos.",L.."Esto fue 'No me Importa'. Mantente al tanto de lo que realmente no te importa."},r9={L.."Bienvenidos a Radio Antimainstream, donde las historias van mas alla de lo comun.",L.."Hoy les traemos una historia exclusiva desde el Barrio Viejo de Montevideo.",L.."Cerebrito y Wachin, dos chicos inquietos, van en busca de un arcade perdido.",C.."Wachin, sabias que la historia de este lugar tiene tintes de lo que podria considerarse una 'alegoria'?",W.."Che, como vas a hablar asi en este barrio?! Cualquiera entiende lo que quiero decir, man!",L.."En un rincon oscuro del Barrio Viejo, los chicos encuentran la puerta de entrada.",C.."Este lugar parece fuera del tiempo. La decadencia misma puede considerarse una metafora del presente.",W.."Decadencia, y que?! Lo que quiero es meterle una ficha a esa maquinita vieja, papa!",L.."En su recorrido, descubren una maquina antigua, cubierta de polvo.",W.."Esta maquina esta aca desde los anios '80?! Mira la mugre que tiene! Cuanto hace que nadie le pone una ficha?",C.."Este artefacto representa la esencia de lo perdido. Un relicto de un pasado aun por descifrar.",L.."Y justo cuando parecen estar por empezar, la maquina comienza a hablar...",M.."Bienvenidos, intrusos. Estan preparados para desafiar la inercia del tiempo?",C.."Esto es fascinante! El aparato ha logrado trasgredir los limites de la razon y la fisica.",W.."Que esta pasando?! Quien te entiende, Cerebrito? Cambiemos el rumbo, man!",L.."Aunque sorprendidos, Cerebrito y Wachin hallan una solucion inesperada.",C.."Lo esencial es comprender que en el caos, la clave es el orden... en nuestra forma de actuar.",W.."Que?! Yo solo queria jugar un rato tranquilo! Deja de hacerla tan dificil, Cerebrito!",L.."Al final, Cerebrito y Wachin logran salir del lugar, aunque con una nueva vision de la vida.",C.."A veces, lo que necesitamos no es entretenimiento, sino reflexion, para redescubrir el mundo.",L.."Asi concluye esta historia de locura y nostalgia. Nos vemos en la proxima transmision de Radio Antimainstream!"},r10={L.."Bienvenidos a Cine Ultra 8K, la radio del cine mas grande y brillante.",L.."Hoy tenemos el honor de entrevistar a uno de los iconos del cine de accion.",L.."Adrian Delatrampa entrevista al gran actor estadounidense, Silvestre Stacchotta!",AD.."Silvestre! Un placer tenerte en nuestros microfonos.",SS.."Gracias, Adrian, es un gusto estar aqui. Siempre es bueno estar cerca de los fans de cine.",AD.."Estas a punto de protagonizar una pelicula muy esperada, *Mambo*, que nos puedes contar sobre tu personaje?",SS.."Bueno, mi personaje, es un tipo rudo! Pero tambien tiene un toque de sensibilidad que creo que va a sorprender a la gente.",AD.."Eso suena increible! Como te preparaste para este papel? Hubo algun desafio particular?",SS.."Claro, la preparacion fue intensa. Pase semanas entrenando para las escenas de accion, pero tambien me enfoque mucho en la psicologia de mi personaje.",AD.."Increible! Sabemos que la pelicula se estrenara en cines argentinos el 32 de enero, algo que los fans esperan con ansias!",SS.."Asi es. Sera un estreno espectacular! Y creo que los argentinos van a disfrutar mucho de la accion, pero tambien de las emociones profundas que muestra la pelicula.",AD.."Podrias darnos un adelanto de alguna de las escenas mas epicas de *Mambo*?",SS.."Hay una escena en la que me enfrento a un ejercito de villanos usando una motosierra! Pero lo mas epico es cuando mi personaje decide dar un giro inesperado y se convierte en un lider.",AD.."Eso suena a lo grande! Silvestre, que es lo que mas te atrae de los papeles de accion como los que interpretas?",SS.."Me encanta mostrar que los heroes no tienen que ser perfectos. Son humanos, con fallos y debilidades. Pero tambien con una gran determinacion.",AD.."Definitivamente eso resuena con el publico. No podemos esperar para ver *Mambo* en la pantalla grande!",SS.."Gracias! Estoy muy emocionado de que la gente vea la pelicula. Seguro que va a ser un gran exito!",AD.."Muchisimas gracias por tu tiempo, Silvestre! Y a todos nuestros oyentes, no se olviden de ir al cine el 32 de enero para disfrutar de *Mambo*!",L.."Asi finaliza esta increible entrevista con Silvestre Stacchotta. Nos vemos en la proxima transmision de Cine Ultra 8K!"},r11={L.."Bienvenidos a Radio Destapando Curros, donde nada se esconde.",L.."Hoy les traemos un comercial exclusivo de nuestro periodista Jorge LaNota.",JL.."Hola, soy Jorge LaNota, y tengo una fascinacion enfermiza por destapar los culos sucios de la politica argentina.",JL.."He viajado por todo el mundo, infiltrandome en los rincones mas oscuros para exponer la verdad.",JL.."De hecho, me infiltre en Corea del Norte, un lugar donde pocos se atreven a mirar, para destapar los turbios negocios entre Argentina y ese pais.",JL.."Y lo que descubri te hara temblar! Desde contratos secretos hasta acuerdos peligrosos, todo con la complicidad de figuras de poder en Argentina.",JL.."Que hacen los poderosos mientras nos distraen con mentiras? Yo te lo cuento todo, sin censura.",JL.."Unite a mi en esta cruzada para destapar la verdad. Porque la politica no puede seguir tapando sus cagadas!",L.."No te pierdas la revelacion mas grande de los ultimos tiempos. Solo aqui, en Radio Destapando Curros.",L.."La verdad esta al aire, y es mas sucia de lo que imaginas. Escucha y abre los ojos!"},r12={L.."Bienvenidos a 'Radio Grieta',",L.."la emisora donde todas las voces tienen su sesgo.",L.."Hoy analizamos la noticia del mes: inflacion del 3% en noviembre.",MI.."'Un logro del Gobierno en su lucha contra el ajuste neoliberal, mostrando compromiso con el pueblo.'",MD.."'Otro fracaso en la economia, reflejando la incapacidad del Gobierno para controlar la inflacion.'",L.."Y asi, dos miradas, una realidad.",L.."Ahora pasamos a otra noticia: aumento del 5% en el salario minimo.",MI.."'Una medida insuficiente que no alcanza para combatir el verdadero costo de vida.'",MD.."'Un paso positivo que ayuda a reactivar la economia y beneficia a las familias trabajadoras.'",L.."Dos opiniones, una noticia. Esto fue 'Radio Grieta'. Hasta la proxima!"},v={t=0,i=1,r=1}}end)(),gestionMisionStuntman=(function()local function c(n,x1,x2,y1,y2)local o={}for i=1,n do o[i]={x=math.random(x1,x2),y=math.random(y1,y2),a=true}end return o end local function v(x,y,n)local v={}for i=0,n-1 do v[i+1]={x=x-(i*10),y=y}end return v end return{p={100,150,200,250,300,350,400,450,500,1000},c={a={r={m=6,x=10,c=6,s=0.2,g=true},a=false,t=0},p2={},c={s={x=1290,y=1031,c=8,r=false},b={x=1381,y=636,c=8,r=false},t={x=1393,y=693,c=8,r=false}},l={}},m={c={{x=1377,y=1027,a=true},{x=1407,y=1027,a=true},{x=1380,y=908,a=true},{x=1405,y=908,a=true}},g={{x=1349,y=984,a=true},{x=1349,y=1013,a=true}},v=c(10,1117,1160,1020,1040),n=c(10,1045,1130,1025,1080),m={x=1345,y=1026,a=true,h=6},r={{x=1318,y=1059,aX=1366,aY=1053,a=16,l=16,s=128,d="arriba"},{x=1378,y=873,aX=1413,aY=816,a=16,l=16,s=128,d="arriba"}},v2={x=150,y=0,r=10},t={{x=1375,y=756,s=1,v=v(1375,756,4)},{x=1375,y=803,s=1.2,v=v(1375,803,4)},{x=1375,y=776,s=0.8,v=v(1375,776,4)}},p={x=1387,y=1017,s=2,s=356},a={x=1420,y=832,t=0,s="fire",p={}}},b={},e={},l={},b={d=false,b=false,p=false,p2=false,m=false,n=true,t=false,f=false,s=false,i=false,c=false,b2=false,j=false,q=false,a=false,a2=false,n2=false,b3=false,p3=false,q2=false,e=false,n3=true,g={false,false,false,false,false,false,false,false,false,false}},n={t={c=0,s=5*60,f=0,e=120,a=0},e={f=0,s=1,l=1,i=1,p=0},p={s=0,o="",t=0,c=0,d=0,t2=0,c2=0,t3=0},d={v=5,t=4},d2={{x=1215,y=980},{x=1500,y=985},{x=1350,y=740}},p2={{x=1050,y=1050}},m={t="",t=2},v={s=0,d=0,e=-120,r=24}}}end)(),dialogosStuntman=(function()local S="Silvestre Stacchotta: "return{m={p={[1]={n={S.."Good day wacho, altas llantas.",S.."Perdon, estoy un poco enturrecido desde que estoy en Buenos Aires.",S.."A diferencia de mi hogar en Los Guapos County ( Condado ) de Los Angeles,",S.."La Fucking humedad de Buenos Aires esta mas fuerte que Rusas en bikini.",S.."En fin wacho, subete al coche. Solo tienes 5 segundos."},a={S.."No puedo creer que no hayas podido subirte a ese coche en 5 segundos."}},[2]={n={S.."Ahora arrolla esas malditas cajas."},a={S.."Solo superaras tu CajaFobia si destruyes las cajas."}},[3]={n={S.."Ahora eres un fucking meteorito, activa el nitro tardigrado de Bosnia."},a={S.."Ni con Nitro llegas a ese checkpoint? You are a Joke."}},[4]={n={S.."Ahora tenes que dispararle desde el coche a esa caja malvada."},a={S.."Me dijo la Caja Metalica que te tiene miedo."}},[5]={n={S.."Lince, tenes que usar esa rampa para volar como los dioses del asfalto."},a={S.."Vamos,usa la rampa,you are the holy shit."}},[6]={n={S.."Mas vale que esquives esos coches porque me estoy enturreciendo mal."},a={S.."Eh ameo,pode equivar that cars?."}},[7]={n={S.."Ahi va el infeliz que me robo mi chorinesa, a por el wacho de Nunavut!"},a={S.."Ya perdi una chorinesa,espero no tener que ir a Canada a recuperar otra."}},[8]={n={S.."Do you have enough Chechona?",S.."Salta por el aro, pero no te quemes."},a={S.."Si no puedes saltar el aro olvidate del Kamasutra."}},[9]={n={S.."Esquiva el maldito tren asi llegas al final y posteamos algo en Egogram."},a={S.."Esquiva los chucu chucu wachote de Bosnia."}},[10]={n={S.."Preparate, conduce hacia el circulo violeta.",S.."Una vez alli, presiona el boton para detonar la bomba."},a={S.."PONE LA BOMBA WACHO,PONELA POR DIOS."}}},o={f4="Me estoy comiendo un Chori de chocolate.",f5="En Madrid hice un doctorado en quitar sostenes.Me saque un 69."}},d={"01:Los primeros 2 meses de desarrollo este videojuego fue desarrollado exclusivamente en celular.","02:Para hacer la mision de Stuntman se dividio en 10 .tic diferentes la mision.","03:La idea del Personaje de Stacchotta surgio al ver la foto de Milei con Stallone.","04:Esta Mision esta inspirada en Stuntman ( 2002 ) de PS2.","05:El mapa fue diseniado desde el celular,sin poder testear la mision en funcionamiento previamente.","06:Una radio del juego iba a ser sobre aprender Chino Mandarin pero TIC80 no soporta Caracteres Chinos.","07:La PC en la que se esta haciendo este juego tiene 8 años de antiguedad.","08:Este juego reusa ideas de un proyecto planeado en 2010 pero es un juego diferente.","09:El desarrollo empezo el 30 de Diciembre de 2024.","10:Se uso como IA a ChatGPT,siendo tambien usada DeepSeek que salio casi al mismo tiempo que el comienzo del desarrollo.","11:Juego desarrollado por una unica persona ( Pascua ) aunque con ayuda de la IA.","12:La idea de usar Radios esta inspirada en el GTA.","13:El juego usa TIC80 al limite ( en memoria de graficos,en tamanio del mapa y hasta en peso del juego ).","14:Si no ves la letra enie,es porque TIC80 no la soporta = las reemplace con N.","15:Los dialogos de las Radios fueron generados con IA ( pero con mis instrucciones , para que sean bastante inusuales )."},d2="Mision: El Kamikaze del Cine\n".."Jefe: Silvestre Stacchotta\n".."Objetivo: Rodar exitosamente una escena de doble de peliculas con el coche.",e="mission_intro",d3=function(s)return s.d[math.random(1,#s.d)]end}}end)(),estadoCreditos={y=136,m={"CREDITOS","","Director de Etica de IA: Pascua","","Generador de Contenido:","ChatGPT / DeepSeek","","Diseniador de Sprites: Pascua","","Director Ejecutivo de Codigo:","ChatGPT / DeepSeek","","Agradecimientos Especiales:","","- Chistes Random: Un tipo de internet."},e=(function()local e={}for i=1,50 do e[i]={x=math.random(0,239),y=math.random(0,135)}end return e end)()},estadoIntro={t=0,i=1,m={"AltaVista Games","Todos los derechos reservados 2025","by Pascua","Crimen Y Pixel"},e=(function()local e={}for i=1,50 do e[i]={x=math.random(0,239),y=math.random(0,135)}end return e end)()},lectorDeDiarios={s=0,m=480},pinball=(function()local function c(n)local m={}for i=1,n do m[i]={x=math.random(0,240),y=math.random(-50,-10),v=math.random(1,3),c=math.random(1,3)}end return m end return{c={n=1,p=0,d=300,i=0,o=0,l=0,t=180},b={{x=190,y=120,vx=0,vy=0,r=4,l=false},{x=100,y=60,vx=0,vy=0,r=4,a=false},{x=140,y=80,vx=0,vy=0,r=4,a=false}},p={{x=40,y=100,l=20,a=-math.pi/2,c=1},{x=80,y=100,l=20,a=-math.pi/2,c=1},{x=1,y=40,l=20,a=-math.pi/2,c=1},{x=214,y=100,l=20,a=-math.pi/2,c=1}},o={a={x=35,y=130,w=40,h=10},d={{x=20,y=70,v=true,t=0},{x=80,y=70,v=true,t=0},{x=120,y=20,v=true,t=0},{x=150,y=50,v=true,t=0}},s={x=130,y=45,s=258,a=8,l=8,u=0,m=false,f="",fs={"PARA WACHO!","AY AY AY!","QUE VIVAN LAS PULGAS!","NO ME GUSTA!","TOCASTE EL 258!","REBOTE PELOTUDO!","UYYY QUE GOLPE!","AGUANTE EL PINBALL!"}},s2={i=99,x=140,y=115,a=8,l=8,r=4.0},s3={{i=274,x=30,y=30,r=8},{i=275,x=60,y=30,r=8},{i=276,x=90,y=30,r=8},{i=277,x=120,y=30,r=8},{i=278,x=30,y=50,r=8},{i=279,x=60,y=50,r=8},{i=280,x=90,y=50,r=8},{i=281,x=120,y=50,r=8}}},r={a=false,t=0,y=140},m=c(10),f={a={l={"Tecnofeudalismo","Cuchi Cuchi Cuchi","No seas gilipollas","Viva el britpop","Party Hard","Usa condon,no seas pelotudo","Soy la hostia tio"},i=1},r={l={"1- Desde Chubut hasta Buenos Aires, el pinball no para!","2- Te gales y medialunas, pinball en las cantinas!","3- El dragon gales ruge fuerte en la pista de pinball!","4- Bola de pinball como el viento en Trelew y La Boca!","5- Coro gales canta mientras la bola rebota!","6- Puerto Madero y Gaiman unidos por el pinball!","7- Torta negra y mate, energia para el pinball!","8- Eisteddfod de rebotes en esta maquina porteña!","9- Los pioneros galeses hubieran sido cracks del pinball!","10- Rawson a Retiro, un viaje en pinball!","11- Rugby y pinball, pasiones que unen!","12- La bola vuela como el condor sobre la Patagonia portenia!","13- Chapuzon en el Atlantico y luego al pinball!","14- Huellas galesas en los rieles del subte pinballero!","15- Bola plateada como la luna sobre el Chubut urbano!"},i=1,x=160,v=1.2,c={2,3,4,5,6,7,8,9,10,11,12,13,14,15},o=0,f="",t=0,l={i=10,d=160}}},a={{x=120,y=68,t="ninguno",t=0,r=10,c={}},p={m={8,2,9,10},r={10,14,13,15},p={11,12,3,13}}},c={p={i=4,d=4,a=4,b=4},t=0,d=30}}}end)(),estadoTelescopio={c={12,11,15},f=0,e={x=240,y=math.random(0,135),t={}},m={x=120,y=68,r=40},e2=(function()local e={}for i=1,100 do e[i]={x=math.random(0,239),y=math.random(0,135)}end return e end)()}}

--verificar limites
function v(a,s)local j,v,c=t.estadoJugador.jugador,t.estadoJugador.vehiculo,t.estadoJugador.camara
if a=="verificar_limites"then if s then local x,y,X,Y,k=j.x,j.y,v.x,v.y,false
local function l(x,y)local L,R=x>=1030 and x<1315,x>1315 and x<=1420
if y>1087 then y,k=1087,1 elseif L and y<970 then y,k=970,1 elseif R and y<580 then y,k=580,1 end
if x<1030 then x,k=1030,1 elseif x>1420 then x,k=1420,1 end
if R and x<1317 and y<970 then x,k=1317,1 end return x,y end
x,y,X,Y=l(x,y),l(X,Y)j.x,j.y,v.x,v.y=x,y,X,Y return k~=0 else
local M,N,k=240*8,136*8,0 if j.x>=M or j.x<0 then b=math.floor(j.x/M)if j.x<0 then b=math.floor((j.x+1)/M)-1 end
c.offset.x=c.offset.x+b j.x=j.x-b*M k=1 end if j.y>=N or j.y<0 then b=math.floor(j.y/N)if j.y<0 then b=math.floor((j.y+1)/N)-1 end
c.offset.y=c.offset.y+b j.y=j.y-b*N k=1 end return k~=0 end elseif a=="inicializar"then
local x,y=t.estadoJugador.jugadorEstaEnVehiculo and v.x or j.x,t.estadoJugador.jugadorEstaEnVehiculo and v.y or j.y
c.posicion.x,c.posicion.y=x-120,y-68 c.mapa.x,c.mapa.y=math.floor(c.posicion.x/8),math.floor(c.posicion.y/8)
map(c.mapa.x,c.mapa.y,30,17)return 1 else print("Acción no reconocida para verificarLimitesMapaConCamara()",10,10,8)return 0 end end

--gestionararmas

function g(a,...)local G,E,M,C=todoJuego.gestionArmas,todoJuego.estadoJugador,todoJuego.menuPrincipal.estados,todoJuego.configuracionGeneral
local j,c=E.jugador,E.camara local A,bx,by,t=G.ataques,100-c.offset.x,48-c.offset.y,C.temporizadorGeneral
local W={{n="Pistola",s=290,m="pistola",r=5,t="disparo"},{n="AK47",s=292,m="ak47",r=5,t="disparo"},{n="Bazooka",s=294,m="bazooka",r=5,t="disparo"},
{n="Escopeta",s=291,m="escopeta",r=5,t="disparo"},{n="Granada",s=293,m="granadas",r=5,t="disparo"},{n="Golpe",s=289,i=1,t="melee"},
{n="ElectroRifle",s=296,m="electrorifle",r=100,t="continuo",e="disparandoElectrorifle"},{n="Laser",s=297,m="laser",r=100,t="continuo",e="disparandoLaser"},
{n="Katana",s=298,i=1,t="melee"},{n="Lanzallamas",s=295,m="lanzallamas",r=100,t="continuo",e="disparandoLanzallamas"},
{n="Minigun",s=299,m="minigun",r=100,t="continuo",e="disparandoMinigun"}}if btnp(6)then G.armaActual=G.armaActual%11+1 end
if btnp(4)then local w=W[G.armaActual]if w and not w.i then G.municion[w.m]=w.r end end
if a~="colisiones"and a~="frases"then local function B(b)return btn(b)and 3 or 4 end
r(0,116,85,20,0)r(0,0,75,30,0)r(130,0,100,30,0)if M.radios then r(90,130,90,10,0)p("B - Cambiar Radio",90,130,6)end
for _,i in ipairs{{j.vehiculo.icono,130,0},{95,130,8},{143,130,15},{306,0,8},{58,0,15},{465,0,25},{310,130,22}}do s(i[1],i[2],i[3])end
j.zona=gestionarUbicacion("zona",j.x,j.y)for _,p in ipairs{{"P$: "..j.dinero,10,25,4},{j.vida,10,17,4},{j.vehiculo,140,0,4},
{j.zona,140,10,4},{j.calle,140,15,4},{j.coleccionables.."/ 20",140,23,4},{"Y - Cambiar arma",0,116,B(6)},{"B - Disparar",0,123,B(5)},
{"A - Recargar",0,130,B(4)}}do print(p[1],p[2],p[3],p[4])end local w=W[G.armaActual]if w then s(w.s,0,0)p(w.n,10,0,4)
p(w.i and"Infinita"or G.municion[w.m],10,10,4)end end if a~="colisiones"and a~="frases"then local w=G.armaActual
if w then local D={pistola={dx=3},ak47={dx=6},bazooka={dx=2}}local F={[4]=function()local x,y=j.x+8,j.y
for _,d in ipairs{{dx=2,dy=0},{dx=2,dy=-1},{dx=2,dy=1}}do table.insert(A.disparos,{x=x,y=y,dx=d.dx,dy=d.dy,t="escopeta"})end
G.municion.escopeta=G.municion.escopeta-1 end,[5]=function()table.insert(A.granadas,{x=j.x+8,y=j.y,dx=2,dy=-2,tiempo=0})
G.municion.granadas=G.municion.granadas-1 end,[6]=function()table.insert(A.golpes,{x=j.x+8,y=j.y,tiempo=t})end,
[7]=function()G.armasDisparadas.disparandoElectrorifle=1 local x,y=j.x-c.posicion.x+8,j.y-c.posicion.y+8
table.insert(A.rayosElectrorifle,{x_inicio=x,y_inicio=y,x_fin=x+24,y_fin=y+math.random(-16,16),vida=math.random(20,30)})
G.municion.electrorifle=G.municion.electrorifle-1 end,[8]=function()G.armasDisparadas.disparandoLaser=1
G.laser.longitud=math.min(G.laser.longitud+4,200)G.municion.laser=G.municion.laser-1 local e=j.x+G.laser.longitud
for _,n in ipairs(todoJuego.cochesEnemigos)do if not n.colisionado and e>=n.x and e<=n.x+16 and j.y+8>=n.y and j.y+8<=n.y+16 then
n.colisionado=1 end end end,[9]=function()G.katana.tiempoUltimoCorte=t table.insert(A.cortesKatana,{x_inicio=j.x-c.posicion.x+8,
y_inicio=j.y-c.posicion.y+8,angulo=math.pi/4,tiempo_restante=G.katana.duracionCorte,giro=G.katana.velocidadGiro})end,
[10]=function()G.armasDisparadas.disparandoLanzallamas=1 local x,y=bx+2,by for _=1,5 do table.insert(A.disparosLanzallamas,
{x=x,y=y+math.random(-4,4),dx=math.random(2,4),dy=math.random(-1,1),vida=math.random(30,50),c=math.random(2,4)})end
G.municion.lanzallamas=G.municion.lanzallamas-1 end,[11]=function()G.armasDisparadas.disparandoMinigun=1 if t%6==0 then
local x,y=bx,by for _=1,4 do table.insert(A.balasMinigun,{x=x,y=y+math.random(-1,1),dx=3+math.random(0,1),dy=math.random(-1,1)*0.5,vida=60})end
G.municion.minigun=G.municion.minigun-1 end end}local wc,wm,pa=W[w],W[w].m and G.municion[W[w].m]local p=(wc.t=="disparo"and wm and btnp(5)and wm>0)or
(wc.t=="continuo"and wm and btn(5)and wm>0)or(w==6 and btnp(5)and#A.golpes==0)or(w==9 and btn(5)and(t-G.katana.tiempoUltimoCorte>=G.katana.tiempoEntreCortes))
if p then if D[wc.m]then local d=D[wc.m]table.insert(A.disparos,{x=j.x+8,y=j.y,dx=d.dx,t=wc.m})G.municion[wc.m]=wm-1 elseif F[w]then F[w]()end end end
for i=#A.golpes,1,-1 do local g=A.golpes[i]if t-g.tiempo>G.tiempoDisparo.tiempoGolpeVisible then table.remove(A.golpes,i)else g.x,g.y=j.x+8,j.y
s(289,g.x+bx,g.y+by,0)end end for i=#A.rayosElectrorifle,1,-1 do local r=A.rayosElectrorifle[i]r.vida=r.vida-1 if r.vida<=0 then
table.remove(A.rayosElectrorifle,i)else local x,y,xf,yf=r.x_inicio,r.y_inicio,r.x_fin,r.y_fin for j=1,10 do local xs,ys=x+(xf-x)/10*j+math.random(-2,2),
y+(yf-y)/10*j+math.random(-2,2)line(x,y,xs,ys,j%3==0 and 10 or 9)x,y=xs,ys end end end for i=#A.disparos,1,-1 do local d=A.disparos[i]
d.x=d.x+d.dx local sx,sy=d.x+bx,d.y+by if d.t=="pistola"then circ(sx,sy,2,7)circ(sx,sy,1,6)elseif d.t=="ak47"then line(sx-3,sy,sx+3,sy,8)
line(sx-2,sy,sx+2,sy,7)elseif d.t=="bazooka"then r(sx-4,sy-2,8,4,9)r(sx-5,sy-1,1,2,8)elseif d.t=="escopeta"then
for j=1,5 do circ(sx+math.random(-3,3),sy+math.random(-3,3),1,10)end end end for i=#A.granadas,1,-1 do local g=A.granadas[i]
g.x,g.y,g.dy=g.x+g.dx,g.y+g.dy,g.dy+0.1 if g.y>136 then table.remove(A.granadas,i)else local sx,sy=g.x-c.posicion.x,g.y-c.posicion.y
circ(sx,sy,4,6)if g.tiempo%10<5 then circ(sx+2,sy-2,1,2)end end end for i=#A.balasMinigun,1,-1 do local b=A.balasMinigun[i]
b.x,b.y,b.vida=b.x+b.dx,b.y+b.dy,b.vida-1 if b.vida<=0 then table.remove(A.balasMinigun,i)else for j=0,8 do pix(b.x+j,b.y,j<4 and 8 or 7)end end end
if G.armasDisparadas.disparandoLaser then local sx,sy=j.x+bx+8,j.y+by+8 line(sx,sy,sx+G.laser.longitud,sy,2)end
for i=#A.disparosLanzallamas,1,-1 do local l=A.disparosLanzallamas[i]l.x,l.y=l.x+l.dx,l.y+l.dy circ(l.x,l.y,5,2)end end
if a=="colisiones"then local d=select(1,...)or false local function V(t,x1,y1,x2,y2,rx,ry,rw,rh)local function P(px,py,rx,ry,rw,rh)
return px>=rx and px<=rx+rw and py>=ry and py<=ry+rh end local function L(x1,y1,x2,y2,x3,y3,x4,y4)local function O(a,b,c)
return(b.y-a.y)*(c.x-b.x)-(b.x-a.x)*(c.y-b.y)end local o1=O({x=x1,y=y1},{x=x2,y=y2},{x=x3,y=y3})local o2=O({x=x1,y=y1},{x=x2,y=y2},{x=x4,y=y4})
local o3=O({x=x3,y=y3},{x=x4,y=y4},{x=x1,y=y1})local o4=O({x=x3,y=y3},{x=x4,y=y4},{x=x2,y=y2})return(o1*o2<0)and(o3*o4<0)end
if t=="puntoRectangulo"then return P(x1,y1,rx,ry,rw,rh)elseif t=="lineaRectangulo"then if P(x1,y1,rx,ry,rw,rh)or P(x2,y2,rx,ry,rw,rh)then return 1 end
for _,b in ipairs{{x1=rx,y1=ry,x2=rx+rw,y2=ry},{x1=rx+rw,y1=ry,x2=rx+rw,y2=ry+rh},{x1=rx,y1=ry+rh,x2=rx+rw,y2=ry+rh},
{x1=rx,y1=ry,x2=rx,y2=ry+rh}}do if L(x1,y1,x2,y2,b.x1,b.y1,b.x2,b.y2)then return 1 end end elseif t=="lineaLinea"then return L(x1,y1,x2,y2,rx,ry,x1,y1)end end
local function U(p,a,f,e)for i=#p,1,-1 do local o=p[i]for j=#todoJuego.cochesEnemigos,1,-1 do local n=todoJuego.cochesEnemigos[j]if f(o,n)then
local x,y=n.x-(a and c.posicion.x or 0),n.y-(a and c.posicion.y or 0)gestionarEfectosYExplosiones("crear_efecto",n.x+n.width/2,n.y+n.height/2,"sangre")
gestionarEfectosYExplosiones("crear_explosion",n.x+n.width/2,n.y+n.height/2,{r=2,d=25})if e then e(n)end table.remove(p,i)table.remove(todoJuego.cochesEnemigos,j)break end end end end
U(G.ataques.disparos,0,function(b,n)return V("puntoRectangulo",b.x,b.y,nil,nil,n.x,n.y,8,8)end)U(G.ataques.balasMinigun,1,function(b,n)
return V("puntoRectangulo",b.x+c.posicion.x,b.y+c.posicion.y,nil,nil,n.x,n.y,8,8)end)U(G.ataques.rayosElectrorifle,1,function(r,n)
return V("lineaRectangulo",r.x_inicio+c.posicion.x,r.y_inicio+c.posicion.y,r.x_fin+c.posicion.x,r.y_fin+c.posicion.y,n.x,n.y,16,16)end)
U(G.ataques.disparosLanzallamas,1,function(l,n)return V("puntoRectangulo",l.x+c.posicion.x,l.y+c.posicion.y,nil,nil,n.x,n.y,16,16)end)
if G.armasDisparadas.disparandoLaser then local x,y=j.x-c.posicion.x+8,j.y-c.posicion.y+8 local xf,yf=x+G.laser.longitud,y
for j=#todoJuego.cochesEnemigos,1,-1 do local n=todoJuego.cochesEnemigos[j]local nx,ny=n.x-c.posicion.x,n.y-c.posicion.y
if V("lineaRectangulo",x,y,xf,yf,nx,ny,16,16)then gestionarEfectosYExplosiones("crear_efecto",nx,ny,"sangre")
gestionarEfectosYExplosiones("crear_explosion",nx,ny,{r=2,d=25})table.remove(todoJuego.cochesEnemigos,j)end end end
for i=#G.ataques.cortesKatana,1,-1 do local k=G.ataques.cortesKatana[i]local xf=k.x_inicio+math.cos(k.angulo)*G.katana.longitudCorte
local yf=k.y_inicio+math.sin(k.angulo)*G.katana.longitudCorte for j=#todoJuego.cochesEnemigos,1,-1 do local n=todoJuego.cochesEnemigos[j]
local nx,ny=n.x-c.posicion.x,n.y-c.posicion.y if V("lineaRectangulo",k.x_inicio,k.y_inicio,xf,yf,nx,ny,16,16)then
gestionarEfectosYExplosiones("crear_efecto",nx,ny,"sangre")gestionarEfectosYExplosiones("crear_explosion",nx,ny,{r=2,d=25})
table.remove(todoJuego.cochesEnemigos,j)table.remove(G.ataques.cortesKatana,i)break end end end
U(G.ataques.golpes,0,function(g,n)return V("puntoRectangulo",g.x,g.y,nil,nil,n.x,n.y,8,8)end)
U(G.ataques.granadas,0,function(g,n)return V("puntoRectangulo",g.x,g.y,nil,nil,n.x,n.y,8,8)end)if d then local c,o=c.posicion,{8,11,13,10,12}
for _,n in ipairs(todoJuego.cochesEnemigos)do rectb(n.x-c.x,n.y-c.y,16,16,o[1])end for _,b in ipairs(G.ataques.disparos)do circ(b.x-c.x,b.y-c.y,2,o[2])end
for _,b in ipairs(G.ataques.balasMinigun)do circ(b.x,b.y,1,o[2])end for _,r in ipairs(G.ataques.rayosElectrorifle)do
line(r.x_inicio,r.y_inicio,r.x_fin,r.y_fin,o[4])circ(r.x_inicio,r.y_inicio,2,o[5])circ(r.x_fin,r.y_fin,2,o[5])end
for _,l in ipairs(G.ataques.disparosLanzallamas)do circ(l.x,l.y,3,o[4])end if G.armasDisparadas.disparandoLaser then
local x,y=j.x-c.x+8,j.y-c.y+8 line(x,y,x+G.laser.longitud,y,o[5])circ(x,y,3,o[5])end for _,k in ipairs(G.ataques.cortesKatana)do
local xf,yf=k.x_inicio+math.cos(k.angulo)*G.katana.longitudCorte,k.y_inicio+math.sin(k.angulo)*G.katana.longitudCorte
line(k.x_inicio,k.y_inicio,xf,yf,o[4])ellib((k.x_inicio+xf)/2,(k.y_inicio+yf)/2,math.sqrt((xf-k.x_inicio)^2+(yf-k.y_inicio)^2),10,o[3])end
for _,g in ipairs(G.ataques.golpes)do circ(g.x-c.x,g.y-c.y,6,o[3])end for _,g in ipairs(G.ataques.granadas)do
circ(g.x-c.x,g.y-c.y,4,o[2])if g.y>136 then circ(g.x-c.x,g.y-c.y,20,o[5])end end print("HITBOXES ACTIVADOS",160,80,45)
print("Rojo: Enemigos",160,50,o[1])print("Cian: Balas",160,60,o[2])print("Verde: Rayos",160,70,o[4])
print("Amarillo: Especial",160,80,o[5])print("Rosa: Areas",160,90,o[3])end end if a=="frases"then _G.n=_G.n or 0 _G.f=_G.f or""_G.co=_G.co or 0
_G.co=_G.co+0.2 _G.n=_G.n+1 _G.fr=_G.fr or{f={"Bang!","Pum!","Disparo certero!","Toma esto!","Headshot!"},
a={"Ratatata!","Rafaga letal!","A full metal!","Disparando!","Ataque sostenido!"},b={"BOOM!","Kaboom!","Explosion!","Impacto directo!","Al blanco!"},
e={"Pum Pum!","Doble impacto!","A quemarropa!","Dispersion mortal!","Plomo!"},g={"Granada fuera!","Frag out!","Explosion en 3... 2... 1!","Cuidado abajo!","Boom!"},
go={"Golpe certero!","Uppercut!","Directo al higado!","Combo!","Knockout!"},el={"Zzzap!","Electrocutando!","Carga maxima!","Cortocircuito!","Descarga!"},
la={"Pew Pew!","Laser activado!","Haz de energia!","Zzzap laser!","Precision absoluta!"},k={"Slash!","Corte rapido!","Iai jutsu!","Filocorto!","Tajo mortal!"},
l={"Fwooosh!","Quemando!","Incinera!","Llama purificadora!","Calor intenso!"},m={"Brrrrrrt!","A toda mecha!","Supresion de fuego!","Tormenta de plomo!","Aniquilacion!"}}
local w={[1]={c=G.municion.pistola>0,f=_G.fr.f},[2]={c=G.municion.ak47>0,f=_G.fr.a},[3]={c=G.municion.bazooka>0,f=_G.fr.b},
[4]={c=G.municion.escopeta>0,f=_G.fr.e},[5]={c=G.municion.granadas>0,f=_G.fr.g},[6]={c=1,f=_G.fr.go},[7]={c=G.municion.electrorifle>0,f=_G.fr.el},
[8]={c=G.municion.laser>0,f=_G.fr.la},[9]={c=1,f=_G.fr.k},[10]={c=G.municion.lanzallamas>0,f=_G.fr.l},[11]={c=G.municion.minigun>0,f=_G.fr.m}}
if btnp(5)and w[G.armaActual]and w[G.armaActual].c then _G.f=w[G.armaActual].f[math.random(#w[G.armaActual].f)]_G.n=0 end
if _G.f~=""and _G.n<120 then local w=#_G.f*6-2 local x,y=40-1,40-1 local w,h=w+2,8+2 rect(x,y,x+w-40,y+h-40,0)
local function R(i)return(math.floor(i)%15)+1 end for i=0,3 do local c=R(_G.co+i*4)for x=x-i,x+w+i do pix(x,y-i,R(c+(x-x)/4))pix(x,y+h+i,R(c+(x-x)/4))end
for y=y-i,y+h+i do pix(x-i,y,R(c+(y-y)/4))pix(x+w+i,y,R(c+(y-y)/4))end end for i=1,#_G.f do print(_G.f:sub(i,i),40+(i-1)*6,40,R(_G.co+i))end
elseif _G.n>=120 then _G.f=""end end end

--gestionar entidades 

function g()local e,c,t,f,m=t.estadoJugador,t.estadoJugador.camara,t.ciudadJuego,t.efectosVisuales,t.gestionMisionStuntman
local x,y,o=c.posicion.x,c.posicion.y,100-c.posicion.x
local n={globo={n=not g,d=g or{x=-100,y=-50,s=1,e="derecha"},a=function(s)
local d=s.d if d.e=="derecha"then d.x=math.min(d.x+d.s,750)if d.x==750 then d.e="abajo"end
elseif d.e=="abajo"then d.y=math.min(d.y+d.s,550)if d.y==550 then d.e="izquierda"end
elseif d.e=="izquierda"then d.x=math.max(d.x-d.s,-200)if d.x==-200 then d.e="arriba"end
elseif d.e=="arriba"then d.y=math.max(d.y-d.s,-50)if d.y==-50 then d.e="derecha"end end
g=d end,b=function(s)local x,y=s.d.x+o,s.d.y-c.posicion.y
s(495,x,y,0,3)s(511,x+4,y+24,0,2)s(259,x+7,y+27,1)local x,y=x+11,y+26
for _=0,8 do local a,b=x+math.random(-2,2),y+math.random(-3,-1)local c=({2,3,4})[math.random(3)]pix(a,b,c)pix(a+1,b+1,c)end end},
peces={n=not p,d=p or{{x=20,y=-20,sx=0.6,f=0,v=0,mx=20,Mx=643},{x=750,y=8,sy=0.5,f=0,v=1,my=8,My=559},
{x=0,y=579,sx=0.4,f=0,v=0,mx=0,Mx=632},{x=-200,y=18,sy=0.4,f=0,v=1,my=18,My=240}},a=function(s)
for _,f in ipairs(s.d)do f.x,f.y=f.x+(f.sx or 0),f.y+(f.sy or 0)if f.v then if f.y>=f.My or f.y<=f.my then f.sy=-f.sy end
else if f.x>=f.Mx or f.x<=f.mx then f.sx,f.f=-f.sx,f.x>=f.Mx end end end p=s.d end,b=function(s)
for _,f in ipairs(s.d)do s(452,f.x+o,f.y-c.posicion.y,0,1,f.f)end end},
aviones={n=not(a and a2),d={a1=a or{x=-20,y=-30,s=1.5,w=16,m="#VivaLaMonogamia",f=0},
a2=a2 or{x=850,y=580,s=-1.5,w=16,m="oitallefonceT",f=1}},i=function(s)
for _,a in pairs(s.d)do a.c={}for i=1,#a.m do a.c[i]={c=a.m:sub(i,i),o=(i-1)*9,y=-5,a=15}end end
a,a2=s.d.a1,s.d.a2 end,a=function(s)for _,a in pairs(s.d)do a.x=a.x+a.s
if a.f then if a.x<=-(#a.m*6+32*8)then a.x=850 end else if a.x>=850 then a.x=-100 end end end
a,a2=s.d.a1,s.d.a2 end,b=function(s)for _,a in pairs(s.d)do local x,y=a.x+o,a.y-c.posicion.y
if a.f then s(378,x,y,0,2,1)s(377,x+a.w,y,0,2,1)local m=a.m:reverse()r(x+32,y+5,#m*6,5,0)p(m,x+32,y+5,4)
else s(377,x,y,0,2)s(378,x+a.w,y,0,2)r(x-90,y+5,90,5,0)p(a.m,x-90,y+5,4)end end end},
lancha={n=not l,d=l or{x=50,y=-30,s=1,e="izquierda",p=2},a=function(s)
local d=s.d local x,y,fx,fy=0,0,0,0 if d.e=="abajo"then d.y=math.min(d.y+d.s,550)x,y,fx,fy=-10,2,8,16
if d.y==550 then d.e,d.p="derecha",0 end elseif d.e=="derecha"then d.x=math.min(d.x+d.s,750)x,fx,fy=-5,-4,8
if d.x==750 then d.e,d.p="arriba",3 end elseif d.e=="arriba"then d.y=math.max(d.y-d.s,-50)x,y,fx,fy=-10,10,8,-4
if d.y==-50 then d.e,d.p="izquierda",2 end elseif d.e=="izquierda"then d.x=math.max(d.x-d.s,-250)x,fx,fy=5,20,8
if d.x==-250 then d.e,d.p="abajo",1 end end d.x,d.y,d.fx,d.fy=x,y,fx,fy
if time()%0.05<0.03 then table.insert(f.p,{x=d.x+fx,y=d.y+fy,dx=(math.random()-0.5)*0.5,dy=(math.random()-0.2)*0.5,v=30,c=12})end
l=d end,b=function(s)local p=f.p for i=#p,1,-1 do local p=p[i]p.x,p.y=p.x+p.dx,p.y+p.dy p.dy,p.v=p.dy+0.01,p.v-1
if p.v>0 then pix(p.x+o,p.y-c.posicion.y,p.c)else table.remove(p,i)end end
local d=s.d local x,y=d.x+o,d.y-c.posicion.y s(440,x,y,0,2,0,d.p,2,1)s(263,x+15+d.x,y+2+d.y,1)end},
tren={n=not t.trenEstado,c={y=164,s=0.6,p={390,391,391,391},l=540,L=650,h=15,H=0.15,v=240,e=1,r=45,w=10},
i=function(s)t.trenEstado=t.trenEstado or{x=540,d=1,a=0,t=0,p={}}end,a=function(s)
local t,c=t.trenEstado,s.c t.x=t.x+c.s*t.d if t.x>c.L then t.d=-1 elseif t.x<c.l then t.d=1 end
t.a=math.sin(time()*2)*0.5 t.t=t.t+1 if t.d==1 and t.t%4==0 then for i=1,2 do
table.insert(t.p,{x=t.x-15+math.random(-3,3),y=c.y-5+math.random(-4,4),v=c.v*(0.8+math.random()*0.4),
z=0.5+math.random(),a=10+math.random(4),dx=-0.2+math.random()*0.4,dy=-0.4-math.random()*0.3})end end end,
b=function(s)local t,c=t.trenEstado,s.c for i=#t.p,1,-1 do local p=t.p p.v,p.a=p.v-1,p.a-0.04 p.x,p.y=p.x+p.dx,p.y+p.dy
local x,y=p.x-c.posicion.x,p.y-c.posicion.y if p.v<=0 or p.a<=0 or x<-20 or x>148 or y<-20 or y>148 then
table.remove(t.p,i)elseif e.jugador.e~="Tren"then local a=math.min(15,math.floor(p.a))local o=c.h+(p.v%3)circ(x,y,p.z*c.e,a)end end
if e.jugador.e~="Tren"then for i,s in ipairs(c.p)do local o=(i-1)*-c.w s(s,t.x+o-c.posicion.x,c.y+t.a-c.posicion.y,0)end end end,
i=function(s)local c=s.c local x,y=e.jugador.x-t.trenEstado.x,e.jugador.y-c.y local d=math.sqrt(x^2+y^2)
if d<c.r then r(40,40,70,10,0)p("Tren",40,40,7)if btn(5)then m.b.j=1 e.jugador.e="Tren"end end end}}
for k,v in pairs(n)do if v.n and v.i then v:i()v.n=0 end if v.a then v:a()end if v.b then v:b()end
if k=="tren"and v.i then v:i()end end end

--gestionar vehiculos
function g(t)local M,T=1920,240 local function d()local o=t.estadoJugador.camara.offset
local v={{"Avión",377,-150-o.x+100,305-o.y+48,2,1,2,1},{"Jet de Combate",427,-150-o.x+100,346-o.y+48,4,1,2,1},
{"Monster Casta",350,410-o.x+100,460-o.y+48,2,1,2,1},{"Lancha Kurro",440,172-o.x+100,324-o.y+48,2,1,2,1},
{"Globo",{495,511},-100-o.x+100,-96-o.y+48,4,25,3,2}}for _,e in ipairs(v)do
if t.estadoJugador.jugador.vehiculo~=e[1]then if e[1]=="Globo"then s(e[2][1],e[3],e[4],0,e[8],0,0)
s(e[2][2],e[3]+e[5],e[4]+e[6],0,e[7],0,0)else s(e[2],e[3],e[4],0,e[7],0,0,e[5],e[6])end end
local x,y=e[3]+t.estadoJugador.camara.posicion.x,e[4]+t.estadoJugador.camara.posicion.y
local a,b=t.estadoJugador.jugador.x-x,t.estadoJugador.jugador.y-y local d=math.sqrt(a*a+b*b)
if d<25 then r(40,40,70,10,0)p(e[1],40,40,7)if btn(5)then t.gestionMisionStuntman.booleanos.jugadorEstaEnVehiculo=1
t.estadoJugador.jugador.vehiculo=e[1]end end end s(259,-5-o.x+100,-5-o.y+48,3)end
local function T()for i,c in ipairs(t.ciudadJuego.trafico)do local a,b=c.x-t.estadoJugador.jugador.x,c.y-t.estadoJugador.jugador.y
local d=a*a+b*b if d<144 then r(c.x-t.estadoJugador.camara.offset.x+100,c.y-t.estadoJugador.camara.offset.y+38,90,10,0)
p(c.nombre or"Vehículo",c.x-t.estadoJugador.camara.offset.x+100,c.y-t.estadoJugador.camara.offset.y+38,4)
if btnp(5)then t.gestionMisionStuntman.booleanos.jugadorEstaEnVehiculo=1
t.estadoJugador.jugador.vehiculo=c.nombre end end local x,y=math.floor(c.x/8)%T,math.floor(c.y/8)
if not c.calle then for _,k in ipairs(t.ciudadJuego.calles)do local X1,X2=k.x1%T,k.x2%T
if y>=k.y1 and y<=k.y2 then if X1<=X2 then if x>=X1 and x<=X2 then c.calle,c.orientacion=k,k.orientacion break end
else if x>=X1 or x<=X2 then c.calle,c.orientacion=k,k.orientacion break end end end end end
if c.calle then if c.orientacion=="horizontal"then c.x=c.x+c.direccion*c.velocidad
if c.x<0 then c.x=M-1 elseif c.x>=M then c.x=0 end else c.y=c.y+c.direccion*c.velocidad
c.y=math.max(0,math.min(119*8,c.y))end end x,y=math.floor(c.x/8)%T,math.floor(c.y/8)
local I for _,k in ipairs(t.ciudadJuego.calles)do if c.calle and k~=c.calle and k.orientacion~=c.orientacion then
if c.orientacion=="horizontal"and k.orientacion=="vertical"then local d=math.abs(x-(k.x1%T))
if(d<=1 or d>=T-1)and y>=k.y1 and y<=k.y2 then I=k break end elseif c.orientacion=="vertical"and k.orientacion=="horizontal"then
local X1,X2=k.x1%T,k.x2%T if y>=k.y1 and y<=k.y2 then if X1<=X2 then if x>=X1 and x<=X2 then I=k break end
else if x>=X1 or x<=X2 then I=k break end end end end end end if I and math.random(100)==50 then
c.calle,c.orientacion=I,I.orientacion if c.orientacion=="vertical"then c.x=I.x1*8 c.direccion=math.random(0,1)==0 and-1 or 1
else c.y=I.y1*8 c.direccion=math.random(0,1)==0 and-1 or 1 end end local L=0 if c.calle then
if c.orientacion=="horizontal"then if c.calle.x1>c.calle.x2 then L=(c.direccion>0 and x==c.calle.x2)or(c.direccion<0 and x==c.calle.x1)
else L=(c.direccion>0 and x>=c.calle.x2)or(c.direccion<0 and x<=c.calle.x1)end else
L=(c.direccion>0 and y>=c.calle.y2)or(c.direccion<0 and y<=c.calle.y1)end end if L then local P={}
for _,k in ipairs(t.ciudadJuego.calles)do if k~=c.calle and k.orientacion~=c.orientacion then
if c.orientacion=="horizontal"and k.orientacion=="vertical"then local d=math.abs(x-(k.x1%T))
if(d<=1 or d>=T-1)and y>=k.y1 and y<=k.y2 then table.insert(P,k)end elseif c.orientacion=="vertical"and k.orientacion=="horizontal"then
local X1,X2=k.x1%T,k.x2%T if y>=k.y1 and y<=k.y2 then if X1<=X2 then if x>=X1 and x<=X2 then table.insert(P,k)end
else if x>=X1 or x<=X2 then table.insert(P,k)end end end end end end if x==0 or x==T-1 then c.x,c.calle=(T-1-x)*8
elseif#P>0 then local k=P[math.random(1,#P)]c.calle,c.orientacion=k,k.orientacion if c.orientacion=="vertical"then
c.x,c.direccion=k.x1*8,math.random(0,1)==0 and-1 or 1 else c.y,c.direccion=k.y1*8,math.random(0,1)==0 and-1 or 1 end
else c.direccion=-c.direccion end end local X,Y=(c.x-t.estadoJugador.camara.offset.x+100)%M,c.y-t.estadoJugador.camara.offset.y+48
if X>=-16 and X<=256 and Y>=-16 and Y<=256 then local r=(c.orientacion=="horizontal")and((c.direccion>0)and 0 or 2)or((c.direccion>0)and 1 or 3)
if c.sprites then for j,s in ipairs(c.sprites)do local o,O=0,0 if r==0 then o=(j-1)*8 elseif r==2 then o=-(j-1)*8
elseif r==1 then O=(j-1)*8 else O=-(j-1)*8 end s(s,X+o,Y+O,0,1,0,r)end else s(c.sprite,X,Y,0,1,0,r)end end end end
if t=="trafico"then T()elseif t=="especiales"then d()end end

--gestionar ubicacion

function g(m,x,y)local M,T=1920,8 local function d()local t=math.floor
local X,Y=t(t.j.x/T),t(t.j.y/T)t.c.m=0 for _,c in ipairs(t.c.c)do local C,n=4,0
if c.o=="horizontal"then if Y>=c.y1 and Y<=c.y2 then if c.x1<=c.x2 then if X>=c.x1 and X<=c.x2 then n=1 end
else if X>=c.x1 or X<=c.x2 then n=1 end end end else if X>=c.x1 and X<=c.x2 then if Y>=c.y1 and Y<=c.y2 then n=1 end end end
if n==1 then t.j.c,C=c.n,9 end if t.c.m then local s=(c.x1*T-t.c.p.x)%M local S=((c.x2+1)*T-t.c.p.x)%M
local a,b=c.y1*T-t.c.p.y+48,(c.y2+1)*T-t.c.p.y+48 local w,h=S-s,b-a if c.o=="horizontal"then if c.x1<=c.x2 then
r(s,a,w,h,C)if n==1 and w>=#c.n*4 then p(c.n,s+w/2-#c.n*2,a+h/2-3,7)end else local W=M-s
r(s,a,W,h,C)r(0,a,S,h,C)if n==1 then if W>S and W>=#c.n*4 then p(c.n,s+W/2-#c.n*2,a+h/2-3,7)
elseif S>=#c.n*4 then p(c.n,S/2-#c.n*2,a+h/2-3,7)end end end else r(s,a,w,h,C)if n==1 and h>=8 then
for i=1,#c.n do p(c.n:sub(i,i),s+w/2-2,a+(i-1)*6+4,7)end end end end end end
local function z()local n="zona desconocida"for i=1,#t.c.z do local z=t.c.z[i]
if x>=z.xI*T and x<z.xF*T and y>=z.yI*T and y<z.yF*T then n=z.n break end end return n end
if m=="calles"then d()elseif m=="zona"then return z(x or t.j.x,y or t.j.y)end end

--dibujar elementos del mundo

function d(x,y)local j,c,t,e,m,s=t.estadoJugador,t.estadoJugador.camara,t.ciudadJuego,t.efectosVisuales,t.menuPrincipal.estados,t.clima.interruptores
for i,n in ipairs(t.n)do n.oX,n.oY=n.oX+n.sX,n.oY+n.sY if math.abs(n.oX)>9 then n.sX,n.oX=-n.sX,n.oX+n.sX*2 end
if math.abs(n.oY)>9 then n.sY,n.oY=-n.sY,n.oY+n.sY*2 end local X,Y=n.x+n.oX-c.p.x,n.y+n.oY-c.p.y
s(n.s,X,Y,0)local d=math.sqrt((n.x+n.oX-j.j.x)^2+(n.y+n.oY-j.j.y)^2)if d<t.c.r then local x,y=X,Y-15
r(x-1,y-1,#n.n*4+2,10,10)p(n.n,x,y,7)end end local C={o={i=t.c.o,p=e.pC,r="r",o=function()j.j.c=j.j.c+1 end,p={c=30,v=1.5,V=2.5,l=30,L=40,g=.05,C=function()return math.random(0,15)end,P=function()return math.random(2)==1 end}},
m={i=t.c.m,p=e.pM,r="re",o=function()j.j.d=j.j.d+1 end,p={c=25,v=1.5,V=2.5,l=25,L=40,g=.02,C=function()return({3,4,5})[math.random(3)]end,P=function()return 1 end}}}
for T,D in pairs(C)do for i,I in pairs(D.i)do if not I[D.r]then s(I.t,I.x-c.p.x,I.y-c.p.y,0)if x and y and math.abs(x-I.x)<8 and math.abs(y-I.y)<8 then
I[D.r]=1 D.o()local p=D.p for j=1,p.c do local a=math.random()*2*math.pi local v=p.v+math.random()*(p.V-p.v)
local dX,dY=math.cos(a)*v,math.sin(a)*v table.insert(D.p,{x=I.x,y=I.y,dX=dX,dY=dY,v=p.l+math.random(p.L-p.l),c=p.C(),P=p.P()})end end end end
for i=#D.p,1,-1 do local p=D.p p.x,p.y=p.x+p.dX,p.y+p.dY p.dY,p.v=p.dY+D.p.g,p.v-1 if p.v%2==0 or p.P then local x,y=p.x-c.p.x,p.y-c.p.y
pix(x,y,p.c)pix(x+1,y,p.c)pix(x,y+1,p.c)pix(x+1,y+1,p.c)end if p.v<=0 then table.remove(D.p,i)end end end
if not a then a=1 local l1,l2={},{} for x=1751,1815,3 do table.insert(l1,{x=x,y=303,c=math.random(2,15)})
table.insert(l2,{x=x,y=328,c=math.random(2,15)})end A={l1=l1,l2=l2,s=.1}end
local function u(l)for i,L in ipairs(l)do L.c=(L.c+A.s)%15 if L.c<2 then L.c=2 end end end
local function D(l)for i,L in ipairs(l)do circ(L.x-c.p.x,L.y-c.p.y,1,math.floor(L.c))pix(L.x-c.p.x,L.y-c.p.y,15)end end
u(A.l1)u(A.l2)D(A.l1)D(A.l2)s(193,130-c.p.x,164-c.p.y,0)s(193,1870-c.p.x,504-c.p.y,0)local X,Y=100-c.o.x,48-c.o.y
local I={{189,604,20,not m.m,function()m.m=1 j.j.x,j.j.y=1050,1050 end,"Iniciar Mision de Stuntman? boton 4"},
{305,220,12,1,function()J=not J end,J and"bajarse del jetpack? boton 4"or"subirse a jetpack? boton 4"},
{383,60,140,not m.t,function()m.t=1 end,"Usar telescopio? boton 4",not J},
{318,212,148,1,function()m.D=1 end,"Leer Diario? boton 4",not m.D},
{99,380,452,not m.r,function()m.r=1 end,"Activar Radios? boton 4"},
{210,172,148,not s.l,function()s.l=1 end,"Activar lluvia? boton 4"},
{212,428,268,not s.n,function()s.n=1 end,"Iniciar nieve? boton 4"},
{213,604,116,not s.h,function()s.h=1 end,"Iniciar hojas? boton 4"},
{209,396,68,not s.R,function()s.R=1 end,"Activar relampagos? boton 4"},
{214,420,404,not s.v,function()s.v=1 end,"Iniciar rafagas de viento? boton 4"},
{317,380,316,not m.j,function()m.j=1 end,"Iniciar juego de baile? boton 4"},
{221,356,132,not m.p,function()m.p=1 end,"Iniciar Pinball? boton 4"}}
for i=1,#I do local I=I[i]if I[4]then s(I[1],I[2]+X,I[3]+Y,0)end
if j.j.x==I[2]and j.j.y==I[3]and(I[7]==nil or I[7])then r(40,40,140,10,0)p(I[6],40,40,10)if btnp(4)then I[5]()end end end
if not S then T={c=130,s={130,131,132},t=0,i={180,30,180}}P={c=113,s={113,114,115},t=0,b=10,B=0}S=1 end
local t,p=T,P t.t,p.t=t.t+1,p.t+1 if t.c==t.s[3]then p.c,p.B=t.s[1],0 if t.t>=t.i[3]then t.c,t.t=t.s[2],0 end
elseif t.c==t.s[2]then p.c,p.B=t.s[2],1 if t.t>=t.i[2]then t.c,t.t=t.s[1],0 end else
if t.t<t.i[1]-60 then p.c,p.B=p.s[3],0 else p.B=1 if p.t%p.b==0 then p.c=(p.c==p.s[3])and p.s[2]or p.s[3]end end
if t.t>=t.i[1]then t.c,t.t,p.B=t.s[3],0,0 end end local x,y=96-c.o.x+100,95-c.o.y+48 s(t.c,x,y,0,2)end

--dibujar jugador

function d(a,...)if t.gestionMisionStuntman.booleanos.controlesBloqueados then return end
local j,c,v,e,V,s=t.estadoJugador.jugador,t.estadoJugador.camara,t.estadoJugador.vehiculo,t.gestionMisionStuntman.booleanos.jugadorEstaEnVehiculo,j.velocidad,t.estadoJugador.mochilaJetpack.sparks
local function S(A,x,y,X,Y,C)if A=="a"then s[#s+1]={x=x,y=y,dX=X,dY=Y,l=30,c=C}elseif A=="u"then for i=#s,1,-1 do local s=s[i]s.x,s.y,s.l=s.x+s.dX,s.y+s.dY,s.l-1 if s.l<=0 then table.remove(s,i)end end
elseif A=="d"then for _,s in ipairs(s)do pix(s.x-c.p.x,s.y-c.p.y,s.c)end end end
if a=="j"then S("u")S("d")j.e="Jetpack"local x,y=j.x-c.p.x+1,j.y-c.p.y+0.2
r(x,y+2,4,5,7)r(x-3,y+4,2,4,2)r(x+5,y+4,2,4,2)line(x+2,y,x+2,y+2,6)local b=btn(0)or btn(1)or btn(2)or btn(3)local x,X,y=j.x+2,j.x+6,j.y+12
local d,D,C=-0.5+r()*0.3,-0.5+r()*0.3,r(2)+2 S("a",x,y,d,D,C)S("a",X,y,d,D,C)return end
local function g(a)if a=="c"then return j.x>=v.x-8 and j.x<=v.x+8 and j.y>=v.y-8 and j.y<=v.y+8
elseif a=="s"then if e and btnp(5)then e=0 t.gestionMisionStuntman.booleanos.jugadorPreparaBomba=1 j.x,j.y=v.x+10,v.y return 1 end return 0
elseif a=="e"then if not e and btnp(5)and g("c")then e=1 sfx(7,150,5,0,1)return 1 end return 0 end end
if a=="c"or a=="s"or a=="e"then return g(a)end
if not a or a=="e"then local m={[0]=function()j.y=j.y-V c.o.y=c.o.y-8 v.u="a"if e then v.y=v.y-V end end,
[1]=function()j.y=j.y+V c.o.y=c.o.y+8 v.u="b"if e then v.y=v.y+V end end,
[2]=function()j.x=j.x-V c.o.x=c.o.x-8 v.u="i"if e then v.x=v.x-V end end,
[3]=function()j.x=j.x+V c.o.x=c.o.x+8 v.u="d"if e then v.x=v.x+V end end}for i=0,3 do if btn(i)then m[i]()end end
v.v=(btn(4)and not t.gestionMisionStuntman.booleanos.nitroBloqueado)and 5 or 3 t.gestionMisionStuntman.booleanos.nitroActivado=v.v==5 end
local x,y=j.x-c.p.x,j.y-c.p.y local r=({d=0,i=2,a=3,b=1})[v.u]or 0
if a=="e"then local t,p=time()//100,v.u local function h(o,O,D,d)for i=0,2 do local o=(t+i*10)%24 if o<12 then local a=14-(o//3)if a>=0 then
circ(x+o+((D and i%2)or 0)-(not D and o//2 or 0),y+O+((d and i%2)or 0)+(D and o//2 or 0),1,14)end end end end
if p=="i"then s(362,x,y,0)if e then circ(x,y+1,1,4)circ(x,y+4,1,4)circ(x+5,y+1,1,2)circ(x+5,y+4,1,2)h(6,2,0,1)end
elseif p=="a"then s(362,x,y,0,1,0,1)if e then circ(x+2,y,1,4)circ(x+5,y,1,4)circ(x+2,y+5,1,2)circ(x+5,y+5,1,2)h(3,5,1,1)end
elseif p=="d"then s(362,x,y,0,1,0,2)if e then circ(x+7,y+2,1,4)circ(x+7,y+5,1,4)circ(x+2,y+2,1,2)circ(x+2,y+5,1,2)h(2,3,0,1)end
elseif p=="b"then s(362,x,y,0,1,0,3)if e then circ(x+2,y+6,1,4)circ(x+5,y+6,1,4)circ(x+2,y+1,1,2)circ(x+5,y+1,1,2)h(3,1,1,0)end end
if not e then s(257,x,y,0)end if t.gestionMisionStuntman.booleanos.nitroActivado then local c=8+(time()%3)local x,y=x+4,y+3
if btn(3)then for i=0,2 do line(x-i,y,x-10-i,y,c)end elseif btn(2)then for i=0,2 do line(x+8+i,y,x+18+i,y,c)end
elseif btn(0)then for i=0,2 do line(x,y+8+i,x,y+18+i,c)end elseif btn(1)then for i=0,2 do line(x,y-i,x,y-10-i,c)end end end else
if not e then s(257,x,y,0)return end local G={Globo=1,Avion=1,["Jet de Combate"]=1,["Lancha Kurro"]=1,Tren=1,["Monster Casta"]=1}
if G[j.e]then S=nil end local E={["Limusina Diamante"]={s=332,i=335,w=4,h=1},["Stacchotta 69"]={s=348,i=349,w=2,h=1},
["Rally ElWacho"]={s=328,i=329,w=2,h=1},["Turbo Diarrea"]={s=330,i=331,w=2,h=1},["Formula Negativo"]={s=344,i=345,w=2,h=1},
["4X4 420"]={s=385,i=386,w=2,h=1},["Monster Casta"]={s=350,i=351,w=2,h=1},Bondi={s=381,i=382,w=2,h=1},AntiMoto={s=346,i=347,w=2,h=1}}
if type(S)=="number"then v.i=S local s=(j.e=="Policia"or j.e=="Ambulancia")and(S+math.random(0,1))or S s(s,x,y,0,1,0,r)return
elseif E[j.e]then local v=E[j.e]v.i=v.i s(v.s,x,y,0,v.i==351 and 2 or 1,0,r,v.w,v.h)return end local e={Globo=function()v.i=495 s(495,x-10,y-20,0,3)s(511,x-6,y+5,0,2)s(257,x-2,y+10)end,
Avion=function()v.i=378 local s=r==0 and 377 or r==1 and 377 or r==2 and 377 or 377 s(s,x,y,0,2,r==0 and 3 or r==1 and 0 or r==2 and 1 or 1,
r==0 and 2 or r==1 and 1 or r==2 and 0 or 3,2,1)end,["Jet de Combate"]=function()v.i=428 s(427,x,y,0,2,r==0 and 3 or r==1 and 0 or r==2 and 1 or 1,
r==0 and 2 or r==1 and 1 or r==2 and 0 or 3,4,1)end,["Lancha Kurro"]=function()v.i=441 s(440,x,y,0,2,0,r,2,1)local x,y=r==0 and x+8 or r==2 and x+15 or x+4,
r==0 and y+2 or r==3 and y+14 or y+8 s(257,x,y,1)end}if e[j.e]then e[j.e]()end end end

--gestionar enemigos

function e(m,x,y)local g,j=t.gestionMisionStuntman,t.estadoJugador
if m=="s"then if x=="c"then g.n.t.t=g.n.t.t+1 if g.n.t.t>=30 then table.insert(g.c,{x=1600,y=r(920,980),s=r(3,5),l=0})g.n.t.t=0 end
elseif x=="d"then for _,c in ipairs(g.c)do for i=1,3 do table.insert(g.l,{x=c.x+r(-4,4),y=c.y+r(-2,2),v=r(6,12),c=r(2,4),t=r(1,3)})end
s(363,c.x-j.c.p.x,c.y-j.c.p.y,0)c.x,c.l=c.x-c.s,c.l+1 end for i=#g.l,1,-1 do local l=g.l[i]for x=-l.t,l.t do for y=-l.t,l.t do
pix(l.x+x-j.c.p.x,l.y+y-j.c.p.y,l.c)end end l.y,l.x,l.v=l.y-r(0,2),l.x+r(-1,1),l.v-1 if l.v<5 then l.c=3 end if l.v<=0 then table.remove(g.l,i)end end
for _,c in ipairs(g.c)do if j.v and c.x<j.v.x+8 and c.x+16>j.v.x and c.y<j.v.y+8 and c.y+16>j.v.y then return 1 end end end else
if r(1,100)>95 then table.insert(t.c,{x=r(0,200),y=r(0,100),w=8,h=8})end for i=#t.c,1,-1 do local c=t.c[i]c.x=c.x-0.5 if c.x<-c.w then table.remove(t.c,i)end end
for i,c in ipairs(t.c)do s(362,c.x-j.c.p.x,c.y-j.c.p.y,0)end end return 0 end

--gestionar estado juego stuntman

function g(m,...)local function c(p)t.dialogosStuntman.estadoMision=p.."completado"
t.gestionMisionStuntman.numericos.estadoJuego.interruptorParteMisionStuntman=p<10 and p+1 or"cuentaatras"..p+1
t.gestionMisionStuntman.numericos.temporizadores.cuentaAtrasStuntman=p+1==7 and 120 or 300
t.gestionMisionStuntman.numericos.progreso.puntuacionStuntman=t.gestionMisionStuntman.numericos.progreso.puntuacionStuntman+t.gestionMisionStuntman.puntosPorFase[p]
t.gestionMisionStuntman.booleanos.mostrarObjetivoCompletado=1 end
t=todoJuego
if m=="completePhase"then c(...)elseif m=="gameover"then t.dialogosStuntman.estadoMision,t.gestionMisionStuntman.numericos.estadoJuego.interruptorParteMisionStuntman="gameover","gameover"
t.gestionMisionStuntman.numericos.estadoJuego.faseActualEnGameOver=string.find(t.dialogosStuntman.estadoMision,"objetivo")and tonumber(t.dialogosStuntman.estadoMision:match"objetivo(%d+)")or 1
elseif m=="reiniciar:misión"then t.estadoJugador.jugador.x,t.estadoJugador.jugador.y=1086,1055
t.gestionMisionStuntman.booleanos={nitroActivado=0,jugadorEstaEnVehiculo=0,mostrarObjetivoCompletado=0}
t.gestionMisionStuntman.numericos={estadoJuego={interruptorParteMisionStuntman=0,indiceDialogoStuntman=1},temporizadores={cuentaAtrasStuntman=0,temporizadorExplosionRapida=120},progreso={puntuacionStuntman=0,objetivoTexto="",tiempoMostrarObjetivo=0}}
elseif m=="reiniciar:fase"then local f=...or t.gestionMisionStuntman.numericos.estadoJuego.faseActualEnGameOver
t.dialogosStuntman.estadoMision="objetivo"..f.."Incompleto"
t.gestionMisionStuntman.numericos.estadoJuego.interruptorParteMisionStuntman="cuentaatras"..f
t.gestionMisionStuntman.numericos.temporizadores.cuentaAtrasStuntman=f==7 and 120 or 300
local C={[1]={jugadorEstaEnVehiculo=0,posCoche={1086,1055}},[2]={contadorCajasDerribadas=0,posCoche={1149,1048}},[3]={contadorCheckpoint=0,transicionCheckpoint=0,nitroBloqueado=0,posCoche={1149,1048}},[4]={cajaMetalica={health=3},pistolaObtenida=0,yaSumoPuntosDialogoOculto=0,posCoche={1270,1025}},[5]={saltoConExito=0,yaSumoPuntosDialogoOculto=0,posCoche={1266,1060}},[6]={coordenadaDialogoCochesEnLlamasX=1500,posCoche={1392,979},resetEnemyCars=1},[7]={posCoche={1392,979},resetPersecutionCar=1},[8]={puenteDestruido=0,aroSaltadoSinQuemarse=0,quemadoPorAro=0,posCoche={1377,898}},[9]={contadorCheckpoint=0,transicionCheckpoint=0,dialogoTrenX=1300,posCoche={1399,819}},[10]={contadorCheckpoint=0,transicionCheckpoint=0,faseBomba=0,jugadorPreparaBomba=0,explosionExitosa=0,posCoche={1389,716}}}
if C[f]then for k,v in pairs(C[f])do if k=="posCoche"then t.estadoJugador.vehiculo.x,t.estadoJugador.vehiculo.y=v[1],v[2]else _G[k]=v end end end
if f>1 then c(f-1)end elseif m=="mordidoPorTiburon"then local x,y=...line(x-15,y-10,x,y,12)
if t.gestionMisionStuntman.numericos.varias.radioSangre<10 then t.gestionMisionStuntman.numericos.varias.radioSangre=t.gestionMisionStuntman.numericos.varias.radioSangre+.5
t.gestionMisionStuntman.numericos.temporizadores.frameCount=t.gestionMisionStuntman.numericos.temporizadores.frameCount+1 end
circ(x,y,t.gestionMisionStuntman.numericos.varias.radioSangre,2)if t.gestionMisionStuntman.numericos.temporizadores.frameCount>=20 then t.gestionMisionStuntman.numericos.varias.radioSangre=0
t.gestionMisionStuntman.numericos.temporizadores.frameCount=0 end end end

--gestionar pantalla stuntman

function g(m,x,y,f,t)local a,b,c,d,e=btn,todoJuego.gestionMisionStuntman,todoJuego.estadoJugador,time,math
local g,h,i,j,k=b,c.camara.posicion,b.numericos.progreso,e//50,{"Sube al coche (Boton C)","Destruye todas las cajas","Pasa por el checkpoint de nitro","Destruye la caja metalica","Salta la rampa a maxima velocidad","Esquiva los coches enemigos (60s)","Persigue y alcanza al coche objetivo","Salta por el aro en llamas","Pasa por el checkpoint del tren","Activa la bomba y escapa a tiempo"}local function l()for n=0,15 do rect(n*16,0,16,136,(d()//100+n)%15+1)end
local o="GAME OVER"for n=1,#o do print(o:sub(n,n),70+n*10,40,(j+n)%15+1,0,2)end
rect(25,65,195,45,0)rect(0,0,170,20,0)rect(20,25,160,10,0)rect(10,120,160,20,0)print("PUNTUACION: "..i.puntuacionStuntman,60,70,d()//30%6+8)print("Dialogos Ocultos: "..i.dialogosOcultosEncontrados,25,80,3)print("Objetos chocados: "..i.objetosChocados.."/14",25,100,3)print("Tiempo: "..(i.tiempoTotalStuntman//60)..":"..string.format("%02d",i.tiempoTotalStuntman%60),20,25,4)print("Boton 5 (B) : Reiniciar Fase "..b.numericos.estadoJuego.faseActualEnGameOver..".",10,120,4)print("Boton 4 (A) : Reiniciar Mision.",10,128,4)s(457,0,0,0)s(258,10,90,0)local p={{b.booleanos.gameOverFases[1],"Hasta mi abuelita lo haria mejor!",1,"Subir a Coche."},{b.booleanos.gameOverFases[2],"Usted tiene CajaFobia.",2,"Atropellar Cajas."},{b.booleanos.gameOverFases[3],"Sos una tortuga con nitro.",3,"Llegar a Checkpoint."},{b.booleanos.gameOverFases[4],"Hasta con alguien sin vida perdes.",4,"Disparar a Caja Metalica."},{b.booleanos.gameOverFases[5],"Sos un RampaFobico.",5,"Saltar sobre la Rampa."},{b.booleanos.gameOverFases[6],"Estas frito wachito.",6,"Esquivar coches."},{b.booleanos.gameOverFases[7],"Perdi mi Chorinesa!",7,"Perseguir coche."},{b.booleanos.gameOverFases[8],"Un aro es mejor que vos?",8,"Saltar Aro sin llamas."},{b.booleanos.gameOverFases[9],"Chucu chucu",9,"Esquivar trenes."},{b.booleanos.gameOverFases[10],"Apocalipsis Pixelero!",10,"Activar bomba."},{b.booleanos.controlesBloqueadosTiburon,"Te comio un TIBURON xOx"}}local q="Presiona (A) para reintentar"for _,r in ipairs(p)do if r[1]then q=r[2]if r[3]then print("ESCENA "..r[3],10,0,12)print(r[4],10,10,4)end break end end
if d()%200<150 then rect(120-#q*2-30,90,#q*5,10,0)print(q,95-#q*2,90,4)end
local s=d()//100%15+1
rectb(20,20,200,96,s)rectb(22,22,196,92,s)end
local function t()if not b.booleanos.bonus then i.puntuacionStuntman=i.puntuacionStuntman+5000 b.booleanos.bonus=1 end
for u=0,136,8 do rect(0,u,240,8,0)end
rect(0,20,130,10,0)s(303,0,40)local v=string.format("%d:%02d",i.tiempoTotalStuntman//60,i.tiempoTotalStuntman%60)local w="MISION COMPLETADA!"for n=1,#w do print(w:sub(n,n),40+n*10,30,(j+n)%15+1,0,2)end
print("PUNTUACION FINAL: "..i.puntuacionStuntman,60,60,d()//30%10+7)rect(20,80,200,10,0)print("Terminado en "..v.." segundos.",20,43,2)if i.tiempoTotalStuntman<1500 then w="TIEMPO RECORD : MENOS DE 25 SEGUNDOS"for n=1,#w do print(w:sub(n,n),10+n*6,50,(j+n)%15+1)end else print("Tiempo Recomendado : 25 segundos o menos.",10,50,4)end w="MUY BIEN WACHO,SOS LA PUTA HOSTIA JODER"for n=1,#w do print(w:sub(n,n),20+n*5,80,(j+n*2)%15+1)end local x={{text="Dialogos Ocultos: "..i.dialogosOcultosEncontrados,y=99},{text="Objetos chocados: "..i.objetosChocados.."/14",y=114}}for _,y in ipairs(x)do print(y.text,26,y.y+1,0)print(y.text,25,y.y,3)end if d()%1000<800 then print("Presiona (A) para volver al menu",40,10,d()//100%6+8)end s(258,5,80,0,1,0,0,1,1)end
local z=nil
local function A()local B=120 return function()if B>0 then local C,D,E,F=10,70,8,{2,3,4,5,6,7,8,9,10,11,12}local G=(B//5)%#F+1 local H=F[G]rectb(C+14,D+3,92,12,H)rect(C+15,D+4,90,10,0)circb(C+E,D+E,E+1,H)circ(C+E,D+E,E,0)print("S#",C+3,D+4,H)print(b.numericos.mensajeTemporal.texto,C+20,D+4,H)B=B-1 end end end
if m=="gameover"then l()elseif m=="completado"then t()elseif m=="logro"then z=z or A()z()elseif m=="temporal"then if b.numericos.mensajeTemporal.tiempo>0 then local I,J=c.jugador.x-h.x+10,c.jugador.y-h.y-9 rect(I-2,J-2,#b.numericos.mensajeTemporal.texto*4+4,8,0)print(b.numericos.mensajeTemporal.texto,I,J,6)b.numericos.mensajeTemporal.tiempo=b.numericos.mensajeTemporal.tiempo-0.1 end elseif m=="inactividad"then b.inactivitySystem=b.inactivitySystem or{timer=0,threshold=240,message="Dale, juga al juego Boludo!",active=0}local K=b.inactivitySystem local L=function()for M=0,7 do if a(M)then return 1 end end return b.booleanos.jugadorEstaEnVehiculo and(c.vehiculo.velocidad>0 or a(4)or a(5))end K.timer=L()and 0 or K.timer+1 K.active=K.timer>=K.threshold if K.active then local N,O=c.jugador.x-h.x-#K.message*2,c.jugador.y-h.y-10 rect(N-2,O-2,#K.message*6+4,10,0)print(K.message,N,O+d.sin(d()/10)*2,5)end elseif m=="objetivo"and f then local P=k[f]or"Completa la mision"local Q,R=c.jugador.x-h.x,c.jugador.y-h.y-16 rect(Q-2,R-2,#P*4+4,8,0)print(P,Q,R,12)elseif t then local S,T,U=30,3,0 local V=d.min(#t,S)*4+4 rect(x-2,y-2,V,8,U)print(t,x,y,T)end end
mostrarLogro=g("logro")

--gestionar decorado stuntman

function g(e,a,p)if not t then t={pajaros={activos={},maximo=2,ultimaGeneracion=0},avion={x=1e3,y=947,speed=1.5,width=16,message="#TengaMuchoSEXO",chars={}},peces={lista={{x=1155,y=30,speed_x=.8,speed_y=0,flip=0,v=0},{x=1355,y=30,speed_x=-.6,speed_y=0,flip=1,v=0},{x=1443,y=842,speed_x=0,speed_y=.5,flip=0,v=1},{x=1475,y=930,speed_x=0,speed_y=-.4,flip=0,v=1},{x=1737,y=18,speed_x=0,speed_y=-.4,flip=0,v=1},{x=1737,y=240,speed_x=0,speed_y=-.4,flip=0,v=1}}},charcos={lista={},agregarCharco=function(x,y)table.insert(t.charcos.lista,{x=x,y=y,time=0,size=m.random(5,10)})end},trenes={lista=o.gestionMisionStuntman.mision.trenes or{},velocidadBase=1}}for i=1,#t.avion.message do t.avion.chars[i]={char=t.avion.message:sub(i,i),offset=(i-1)*9,y_offset=-5,alpha=15}end end
local c,g=o.estadoJugador.camara.posicion,o.gestionMisionStuntman
if not e or e=="pajaros"then if not e or a=="actualizar"then for i=#t.pajaros.activos,1,-1 do local b=t.pajaros.activos[i]b.x=b.x+b.speed*b.dir if(b.dir==-1 and b.x<-16)or(b.dir==1 and b.x>240)then table.remove(t.pajaros.activos,i)end end
if m.random()>.98 and#t.pajaros.activos<t.pajaros.maximo then local d=m.random(0,1)==0 and-1 or 1 table.insert(t.pajaros.activos,{x=d==-1 and 240 or-16,y=m.random(10,80),dir=d,speed=1})end end
if not e or a=="dibujar"then for _,b in ipairs(t.pajaros.activos)do s(449,b.x,b.y,0)end end end
if not e or e=="avion"then if not e or a=="actualizar"then t.avion.x=t.avion.x+t.avion.speed if t.avion.x>=1310 then t.avion.x=1e3 end end
if not e or a=="dibujar"then local b,d=t.avion.x-c.x,t.avion.y-c.y s(377,b,d,0,2)s(378,b+t.avion.width,d,0,2)rect(b-90,d+5,90,5,0)print(t.avion.message,b-90,d+5,4)end end
if not e or e=="peces"then if not e or a=="actualizar"then for _,b in ipairs(t.peces.lista)do b.x,b.y=b.x+b.speed_x,b.y+b.speed_y if b.v then if b.y>=930 or b.y<=842 then b.speed_y=-b.speed_y end else if b.x>=1355 or b.x<=1155 then b.speed_x,b.flip=-b.speed_x,b.x>=1355 end end end end
if not e or a=="dibujar"then for _,b in ipairs(t.peces.lista)do s(452,b.x-c.x,b.y-c.y,0,1,b.flip,0,1,1)end end end
if not e or e=="charcos"then if not e or a=="actualizar"then for _,b in ipairs(t.charcos.lista)do b.time=b.time+.07 end end
if not e or a=="dibujar"then for _,b in ipairs(t.charcos.lista)do local d,e,f=b.x-c.x,b.y-c.y,m.sin(b.time)*3 circ(d,e,b.size+f,11)circ(d,e,b.size+f-3,10)local h,i,j local k=b.size*1.5 if g.booleanos.jugadorEstaEnVehiculo then h=o.estadoJugador.vehiculo.x-b.x i=o.estadoJugador.vehiculo.y-b.y j=1 else h=o.estadoJugador.jugador.x-b.x i=o.estadoJugador.jugador.y-b.y j=0 end if m.abs(h)<k and m.abs(i)<k then local l=d+h*.7 local m=e+i*.7+3 if j==1 then local n=0 if o.estadoJugador.vehiculo.ultimaPosicion=="arriba"then n=1 elseif o.estadoJugador.vehiculo.ultimaPosicion=="derecha"then n=2 elseif o.estadoJugador.vehiculo.ultimaPosicion=="abajo"then n=3 end s(362,l+m.random(-1,1),m+m.random(-1,1),0,1,0,n,1,1)else s(257,l+m.random(-1,1),m+m.random(-1,1)-1,0,1,0,0,1,1)end end end end
if a=="agregarCharco"and p then t.charcos.agregarCharco(p.x,p.y)end end
if not e or e=="trenes"then if not e or a=="mover"or a=="actualizar"then for _,b in ipairs(t.trenes.lista)do b.x=b.x+b.speed*t.trenes.velocidadBase if b.x>1430 then b.x=1339 end for d=1,#b.vagones do b.vagones[d].x=b.x-d*9 b.vagones[d].y=b.y end end elseif a=="dibujar"then for _,b in ipairs(t.trenes.lista)do s(390,b.x-c.x,b.y-c.y,0)for _,d in ipairs(b.vagones)do s(391,d.x-c.x,d.y-c.y,0)end end elseif a=="colision"and p then for _,b in ipairs(t.trenes.lista)do if p.x<b.x+8 and p.x+8>b.x and p.y<b.y+8 and p.y+8>b.y then return 1,b end for _,d in ipairs(b.vagones)do if p.x<d.x+8 and p.x+8>d.x and p.y<d.y+8 and p.y+8>d.y then return 1,b end end end return else if a=="configurar"and p then if p.velocidad then t.trenes.velocidadBase=p.velocidad end if p.trenes then t.trenes.lista=p.trenes end end end
if e and a and not(e=="pajaros"or e=="avion"or e=="peces"or e=="charcos"or e=="trenes")then print("Acción no reconocida para gestionarDecoradoStuntman()",10,10,8)return end end

--gestionar elementos mision stuntman

function g()local a,b,c,d,e,f=math,todoJuego,btnp,table.insert,table.remove,math.abs
local g={"Morite caja maligna!","eat STACCHOTTA!","TOMA!","No sos rival para mi!","Recibi justicia metalica!","BOOM!"}
local function h(i,j,k,l,m,n,o)for p=1,l do d(b.efectosVisuales.particles,{x=i,y=j,dx=a.random(-m,m),dy=a.random(-m,m),timer=a.random(n[1],n[2]),color=k,gravity=o})end end
local function q(r,s,t,u)return f(s-r.x)<=u and f(t-r.y)<=u end
for v,w in ipairs(b.gestionMisionStuntman.mision.cajasNormales)do if w.active then
s(433,w.x-b.estadoJugador.camara.posicion.x,w.y-b.estadoJugador.camara.posicion.y,0)if q(w,b.estadoJugador.vehiculo.x,b.estadoJugador.vehiculo.y,8)then
sfx(6,30,20,1,2)b.gestionMisionStuntman.numericos.progreso.contadorCajasDerribadas=b.gestionMisionStuntman.numericos.progreso.contadorCajasDerribadas+1
w.active=0 h(w.x,w.y,10,12,2,{15,30})end end end
for x,y in pairs(b.gestionMisionStuntman.mision.conos)do if y.active then
s(436,y.x-b.estadoJugador.camara.posicion.x,y.y-b.estadoJugador.camara.posicion.y,0)if q(y,b.estadoJugador.vehiculo.x,b.estadoJugador.vehiculo.y,8)then
sfx(6,40,20,1,2)local z=b.gestionMisionStuntman.numericos.progreso z.objetosChocados=z.objetosChocados+1
b.gestionMisionStuntman.numericos.mensajeTemporal.texto="+1 punto"b.gestionMisionStuntman.numericos.mensajeTemporal.tiempo=180
z.puntuacionStuntman=z.puntuacionStuntman+1 y.active=0 h(y.x,y.y,10,10+a.random(0,2),2,{30,60},1)end end end
for A,B in ipairs(b.gestionMisionStuntman.mision.vidrios)do if B.active then
s(438,B.x-b.estadoJugador.camara.posicion.x,B.y-b.estadoJugador.camara.posicion.y,0)if q(B,b.estadoJugador.vehiculo.x,b.estadoJugador.vehiculo.y,8)then
sfx(6,40,20,1,2)local C=b.gestionMisionStuntman.numericos.progreso C.objetosChocados=C.objetosChocados+1
b.gestionMisionStuntman.numericos.mensajeTemporal.texto="+1 punto"b.gestionMisionStuntman.numericos.mensajeTemporal.tiempo=3
C.puntuacionStuntman=C.puntuacionStuntman+1 B.active=0 h(B.x,B.y,10,12,2,{15,30})end end end
if b.gestionMisionStuntman.mision.cajaMetalica.active then
s(434,b.gestionMisionStuntman.mision.cajaMetalica.x-b.estadoJugador.camara.posicion.x,b.gestionMisionStuntman.mision.cajaMetalica.y-b.estadoJugador.camara.posicion.y,0)end
for D,E in pairs(b.gestionMisionStuntman.mision.galeriatiro)do if E.active then
s(481,E.x-b.estadoJugador.camara.posicion.x,E.y-b.estadoJugador.camara.posicion.y,0)end end
if F and F>0 then F=F-1 else G=0 end
if c(5)then d(b.gestionMisionStuntman.balasCoche,{x=b.estadoJugador.vehiculo.x+8,y=b.estadoJugador.vehiculo.y+4,active=1,dx=b.gestionMisionStuntman.numericos.disparos.velocidadDisparoDesdeVehiculo,dy=0})
G,F=g[a.random(#g)],30 end
if G then local H,I=b.estadoJugador.vehiculo.x-b.estadoJugador.camara.posicion.x,b.estadoJugador.vehiculo.y-b.estadoJugador.camara.posicion.y-20
rect(H,I,#G*5.5,10,0)print(G,H,I,3)end
for J=#b.gestionMisionStuntman.balasCoche,1,-1 do local K=b.gestionMisionStuntman.balasCoche[J]if K.active then
rect(K.x-b.estadoJugador.camara.posicion.x,K.y-b.estadoJugador.camara.posicion.y,L,L,8)K.x,K.y=K.x+K.dx,K.y+K.dy
local M=0 for N,O in pairs(b.gestionMisionStuntman.mision.galeriatiro)do if O.active and q(O,K.x,K.y,8)then
sfx(8,30,30,1,2)O.active=0 b.gestionMisionStuntman.numericos.progreso.puntuacionStuntman=b.gestionMisionStuntman.numericos.progreso.puntuacionStuntman+10
b.gestionMisionStuntman.numericos.mensajeTemporal.texto="+10 puntos"b.gestionMisionStuntman.numericos.mensajeTemporal.tiempo=3
h(O.x,O.y,10,8,3,{20,40})e(b.gestionMisionStuntman.balasCoche,J)M=1 break end end
if M==0 and b.gestionMisionStuntman.mision.cajaMetalica.active and q(b.gestionMisionStuntman.mision.cajaMetalica,K.x,K.y,8)then
sfx(8,30,30,1,2)b.gestionMisionStuntman.mision.cajaMetalica.health=b.gestionMisionStuntman.mision.cajaMetalica.health-1
h(b.gestionMisionStuntman.mision.cajaMetalica.x,b.gestionMisionStuntman.mision.cajaMetalica.y,8,8,2,{20,40})e(b.gestionMisionStuntman.balasCoche,J)
if b.gestionMisionStuntman.mision.cajaMetalica.health<=0 then b.gestionMisionStuntman.mision.cajaMetalica.active=0
h(b.gestionMisionStuntman.mision.cajaMetalica.x,b.gestionMisionStuntman.mision.cajaMetalica.y,20,9,4,{30,60})end end end end
for P=#b.efectosVisuales.particles,1,-1 do local Q=b.efectosVisuales.particles[P]Q.x,Q.y=Q.x+Q.dx,Q.y+Q.dy
if Q.gravity then Q.dy=Q.dy+.02 end
local R,S=Q.x-b.estadoJugador.camara.posicion.x,Q.y-b.estadoJugador.camara.posicion.y
if R>=0 and R<=240 and S>=0 and S<=136 then if Q.color>=10 and Q.color<=12 then circ(R,S,1,Q.color)else pix(R,S,Q.color)end end
Q.timer=Q.timer-1 if Q.timer<=0 then e(b.efectosVisuales.particles,P)end end end

--gestionar efectos y explosiones

function g(a,...)local b,c,d,e,f=math,table.insert,table.remove,math.random,math.pi*2
local h={sangre={20,2,2,4,1,4,20,40},explosion={15,8,1,3,1,3,15,30},electrico={10,11,1,2,1,5,10,20}}if a=="explosiones"or a=="checkBoxes"then for i=#j.explosiones,1,-1 do local k=j.explosiones[i]for l=#k.particulas,1,-1 do local m=k.particulas[l]rect(m.x,m.y,m.size,m.size,m.color)m.x=m.x+m.dx m.y=m.y+m.dy m.timer=m.timer-1 if m.timer<=0 then d(k.particulas,l)end end
circ(k.x,k.y,10,10)circ(k.x,k.y,7,9)circ(k.x,k.y,4,8)k.timer=k.timer-1 if k.timer<=0 then d(j.explosiones,i)end end if a=="checkBoxes"then for n,o in ipairs(p.mision.cajasNormales)do if o.active then return 0 end end return 1 end elseif a=="explosion_rapida"then local q,r=...if p.numericos.temporizadores.temporizadorExplosionRapida>0 then p.numericos.temporizadores.temporizadorExplosionRapida=p.numericos.temporizadores.temporizadorExplosionRapida-1
for s=1,20 do local t,u=b.rad(e(0,360)),e(5,15)local v,w,x=q+b.cos(t)*u,r+b.sin(t)*u,e(2,4)pix(v,w,x)end
for s=1,10 do local y,z=q+e(-5,5),r+e(-5,5)circ(y,z,e(2,6),e(2,4))end for s=1,5 do local A,B=q+e(-3,3),r+e(-3,3)circb(A,B,e(3,7),2)end end elseif a=="crear_efecto"then local C,D,E=...local F=h[E or"sangre"]or h.sangre
for s=1,F[1]do local G=e()*f local H=e(F[5],F[6])local I=e(F[3],F[4])c(j.particulasEfectos,{x=C,y=D,dx=b.cos(G)*H,dy=b.sin(G)*H,vida=e(F[7],F[8]),tamano=I,color=F[2],tipo=E})end elseif a=="crear_explosion"then local J,K,L=...c(j.explosionesActivas,{x=J,y=K,tiempo=0,radioInicial=L.radioInicial or 3,duracion=L.duracion or 15,colorNucleo=L.colorNucleo or 8,colorAnillo=L.colorAnillo or 9})g("crear_efecto",J,K,"explosion")elseif a=="actualizar_efectos"then for s=#j.particulasEfectos,1,-1 do local M=j.particulasEfectos[s]if M.vida>0 then circ(M.x,M.y,M.tamano,M.color)M.x,M.y,M.vida=M.x+M.dx,M.y+M.dy,M.vida-1 else d(j.particulasEfectos,s)end end
for s=#j.explosionesActivas,1,-1 do local N=j.explosionesActivas[s]local O,P=N.x-l.offset.x+100,N.y-l.offset.y+48 local Q=N.tiempo/N.duracion local R=N.radioInicial*(1+Q*3)circ(O,P,R*.6,N.colorNucleo+(N.tiempo%2))circ(O,P,R,N.colorAnillo)N.tiempo=N.tiempo+1 if N.tiempo>N.duracion then d(j.explosionesActivas,s)end end end end

--gestionar checkpoint stuntman

function g(t,a)local b,c=t and d.checkpointSystem.configs[t],d.checkpointSystem.animation
local function e(f,g,h)for i=1,20 do local j,k,l=math.random()*math.pi*2,.5+math.random()*1.5,45+math.random(30)
m(d.checkpointSystem.particles2,{x=f,y=g,vx=math.cos(j)*k,vy=math.sin(j)*k-1,life=l,maxLife=l,color=(h or 8)+math.random(0,3),size=1+math.random(2)})end end
local function n()if not d.booleanos.seguirCheckpoint then d.numericos.progreso.contadorCheckpoint=d.numericos.progreso.contadorCheckpoint+1
elseif d.numericos.progreso.contadorCheckpoint>=20 then d.numericos.progreso.contadorCheckpoint=0 d.booleanos.seguirCheckpoint=1 end end
local function o()local p=d.checkpointSystem.particles2 for q=#p,1,-1 do local r=p[q]if not r or not r.x or not r.y then n(p,q)
else r.x,r.y=r.x+(r.vx or 0),r.y+(r.vy or 0)r.vy,r.life=(r.vy or 0)+.05,(r.life or 0)-1
if r.life>0 then local s,t=r.x-(k.camara.posicion.x or 0),r.y-(k.camara.posicion.y or 0)if s and t then circ(s,t,r.size or 1,r.color or 8)end else n(p,q)end end end end
if a=="checkpoint"then n()return elseif a=="particulas"then o()return end
if a=="verificar"then if not b then return end d.booleanos.interruptorCheckpoint=1
if not b.reached then local u,v=math.abs(k.vehiculo.x-b.x),math.abs(k.vehiculo.y-b.y)if u+v<50 then b.reached=1 e(b.x,b.y,b.color)n()return 1 end end return
elseif a=="dibujar"then if not b then return end local w,x=b.x-k.camara.posicion.x,b.y-k.camara.posicion.y
if not b.reached then if c.growing then c.radiusPulse.current=c.radiusPulse.current+c.radiusPulse.speed if c.radiusPulse.current>=c.radiusPulse.max then c.growing=0 end
else c.radiusPulse.current=c.radiusPulse.current-c.radiusPulse.speed if c.radiusPulse.current<=c.radiusPulse.min then c.growing=1 end end
circb(w,x,c.radiusPulse.current+2,b.color+1)circ(w,x,c.radiusPulse.current,b.color)circ(w,x,2,b.color+3)else
if c.timer<30 then local y=c.timer%10 circb(w,x,8+y,b.color+2)circ(w,x,4,b.color+1)c.timer=c.timer+1 end end o()end end

--todo mision stuntman

function g()local a,b,c,d,e,f=todoJuego.gestionMisionStuntman,todoJuego.gestionMisionStuntman.numericos.estadoJuego,todoJuego.gestionMisionStuntman.numericos.progreso,todoJuego.gestionMisionStuntman.numericos.temporizadores,todoJuego.estadoJugador,todoJuego.estadoJugador.camara.posicion
local function h()if not a.mision.aroParaSaltar.particulas then a.mision.aroParaSaltar.particulas={}end
if i=="actualizar"then a.mision.aroParaSaltar.timer=a.mision.aroParaSaltar.timer+1
if a.mision.aroParaSaltar.timer>=120 then a.mision.aroParaSaltar.state=a.mision.aroParaSaltar.state=="normal"and"fire"or"normal"a.mision.aroParaSaltar.timer=0
if a.mision.aroParaSaltar.state=="normal"then a.mision.aroParaSaltar.particulas={}end end
if a.mision.aroParaSaltar.state=="fire"and a.mision.aroParaSaltar.timer%5==0 then for j=1,2 do m(a.mision.aroParaSaltar.particulas,{x=a.mision.aroParaSaltar.x-8+e(0,16),y=a.mision.aroParaSaltar.y-8+e(0,16),dx=(e()-0.5)*0.5,dy=-e()*1.5,vida=30+e(20),tam=1+e(2)})end end
for k,p in ipairs(a.mision.aroParaSaltar.particulas)do p.x,p.y,p.vida,p.dy=p.x+p.dx,p.y+p.dy,p.vida-1,p.dy-0.02 if p.vida<=0 then n(a.mision.aroParaSaltar.particulas,k)end end
elseif i=="verificar_colision"and a.booleanos.cocheEstaSaltando then local l=e.vehiculo.x+8>=a.mision.aroParaSaltar.x-8 and e.vehiculo.x<=a.mision.aroParaSaltar.x+8
local m=e.vehiculo.y+8>=a.mision.aroParaSaltar.y-8 and e.vehiculo.y<=a.mision.aroParaSaltar.y+8 if l and m then a.booleanos.aroSaltadoSinQuemarse=1
if a.mision.aroParaSaltar.state=="fire"then for k,p in ipairs(a.mision.aroParaSaltar.particulas)do local o=math.abs(e.vehiculo.x+8-p.x)local p=math.abs(e.vehiculo.y+8-p.y)if o<8 and p<8 then a.booleanos.quemadoPorAro=1 break end end else a.booleanos.aroSaltadoSinQuemarse=1 end end end end
local function q(r,s)if not t then t={duracionSalto=50,saltoInicioX=0,saltoInicioY=0,deltaX=0,deltaY=0,direccionSalto=0,particulasSalto={}}end
local function u()if r.aterrizajeX and r.aterrizajeY then local v,w=r.aterrizajeX-f.x,r.aterrizajeY-f.y circb(v,w,10,12)circ(v,w,8,13)end end
local function x()if not a.booleanos.cocheEstaSaltando then local y=e.vehiculo.x+8>=r.x and e.vehiculo.x<=r.x+r.ancho local z=e.vehiculo.y+8>=r.y and e.vehiculo.y<=r.y+r.alto
if y and z then sfx(8,60,20,1,2)a.booleanos.cocheEstaSaltando=1 d.temporizadorSalto=0 t.saltoInicioX,t.saltoInicioY=e.vehiculo.x,e.vehiculo.y
t.deltaX=(r.aterrizajeX-e.vehiculo.x)/t.duracionSalto t.deltaY=(r.aterrizajeY-e.vehiculo.y)/t.duracionSalto t.direccionSalto=r.direccion a.booleanos.controlesBloqueados=1 return 1 end end return 0 end
local function A()local B,C=r.x-f.x,r.y-f.y local D=time()/100 local E=5 if r.direccion=="arriba"then for F=1,E do local G=math.sin(D+F)*3 line(B+r.ancho/2-5+G,C-F*3,B+r.ancho/2+5+G,C-F*3,12)pix(B+r.ancho/2+G,C-F*3-2,12)end
line(B+r.ancho/2,C-15,B+r.ancho/2-5,C-10,12)line(B+r.ancho/2,C-15,B+r.ancho/2+5,C-10,12)end end
local function H()local I,J=e.vehiculo.x-f.x+8,e.vehiculo.y-f.y+8 local K=time()/50 if#t.particulasSalto<20 then m(t.particulasSalto,{x=I,y=J,vida=30,offset=e()*2-1})end
for L,p in ipairs(t.particulasSalto)do if t.direccionSalto=="arriba"then p.y=p.y+2+math.sin(K+L)*1 p.x=p.x+p.offset end p.vida=p.vida-1 local M,N=10+(L%5),p.vida/30 circ(p.x,p.y,1+N,M)if p.vida<=0 then n(t.particulasSalto,L)end end end
local function O()if a.booleanos.cocheEstaSaltando then rect(r.x-f.x,r.y-f.y-40,35,10,0)print("YAHOOO",r.x-f.x,r.y-f.y-40,4)d.temporizadorSalto=d.temporizadorSalto+1
e.vehiculo.x,e.vehiculo.y=e.vehiculo.x+t.deltaX,e.vehiculo.y+t.deltaY H()if d.temporizadorSalto>=t.duracionSalto then a.booleanos.cocheEstaSaltando=0 a.booleanos.controlesBloqueados=0
e.vehiculo.x,e.vehiculo.y=r.aterrizajeX-8,r.aterrizajeY-8 a.booleanos.saltoConExito=1 end end end
if s=="dibujar"then u()if not a.booleanos.cocheEstaSaltando then local P=math.sqrt((e.vehiculo.x-r.x)^2+(e.vehiculo.y-r.y)^2)if P<40 then A()local Q,R=r.aterrizajeX-f.x,r.aterrizajeY-f.y
local S,T=e.vehiculo.x+8-f.x,e.vehiculo.y+8-f.y line(S,T,Q,R,13)end elseif s=="actualizar"then x()O()elseif s=="limpiar"then t.particulasSalto={}end end
local function U(V)if V=="rampas"then spr(435,a.mision.rampas[1].x-f.x,a.mision.rampas[1].y-f.y,0)spr(435,a.mision.rampas[2].x-f.x,a.mision.rampas[2].y-f.y,0)
elseif V=="aro"then local W,X=a.mision.aroParaSaltar.x-f.x-8,a.mision.aroParaSaltar.y-f.y-8 local Y=a.mision.aroParaSaltar.state=="normal"and 12 or 8 circb(W,X,8,Y)
if a.mision.aroParaSaltar.state=="fire"then for k,p in ipairs(a.mision.aroParaSaltar.particulas)do local Z,_=p.x-f.x,p.y-f.y local a0=2 if p.vida<15 then a0=3 end circ(Z,_,p.tam,a0)pix(Z,_,4)end
local a1=time()/100 for k=1,8 do local a2=math.sin(a1+k)*2 circb(W,X,8+k/2+a2,2+(k%2))end end
elseif V=="circulo_victoria"then circ(a.mision.circuloVictoria.x-f.x,a.mision.circuloVictoria.y-f.y,a.mision.circuloVictoria.radius,13)end end
local function a3(a4)if a4=="mensaje"then rect(0,60,240,10,0)print("BOMBA EXPLOTARA EN 2 SEGUNDOS,SALI DE AHI",0,60,6)elseif a4=="iniciarBomba"then
local a5,a6,a7=a,e.jugador,f local a8,a9=a5.numericos.varias.radioExplosionBombaStuntman,a5.checkpointSystem.configs.bomba
if a8<40 then a5.numericos.varias.radioExplosionBombaStuntman=a8+1 circ(a9.x-a7.x,a9.y-a7.y,a8,8+(a8%2))else a5.booleanos.explosionExitosa=1 end
local aa=math.sqrt((a6.x-a9.x)^2+(a6.y-a9.y)^2)if aa<a8 then a5.booleanos.jugadorAtrapadoPorExplosion=1 gestionarEstadoJuegoStuntman("gameover")
elseif a5.booleanos.explosionExitosa and not a5.booleanos.jugadorAtrapadoPorExplosion then todoJuego.dialogosStuntman.estadoMision="10completado"a5.booleanos.mostrarObjetivoCompletado=1 end end end
local function ab(ac,ad,ae)local af={espaciado=8,fondo=0,colores={1,2,3,5,6,7,8,9,10,14,15}}local ag,ah={},{}for ai in ac:gmatch("%S+")do ah[#ah+1]=ai end
local aj=""for _,ai in ipairs(ah)do local ak=aj..(aj==""and""or" ")..ai if print(ak,0,-100,0,1,1,0)<=ae then aj=ak else
if aj==""then for al in ai:gmatch(".")do if print(aj..al,0,-100,0,1,1,0)<=ae then aj=aj..al else ag[#ag+1],aj=aj,al end end else ag[#ag+1],aj=aj,ai end end end
if aj~=""then ag[#ag+1]=aj end for am,an in ipairs(ag)do local ao=ad+(am-1)*af.espaciado rect(an-3,ao-2,print(an,0,-100,0,1,1,0)+6,10,af.fondo)
for ap=1,#an do local aq=an+(ap-1)*6 local ar=af.colores[((time()//100)+am+ap)%#af.colores+1]for as=-1,1 do for at=-1,1 do if at~=0 or as~=0 then print(an:sub(ap,ap),aq+at,ao+as,0)end end end
print(an:sub(ap,ap),aq,ao,ar)end end end
if not a.booleanos.puenteDestruido then for au=831,855,8 do for av=1388,1396,8 do spr(17,av-f.x,au-f.y,0)end end end
d.temporizadorExplosionRapida=d.temporizadorExplosionRapida-1 for aw,ax in ipairs({"actualizar","dibujar"})do gestionarDecoradoStuntman(0,ax)end
if d.cuentaAtrasStuntman>0 and todoJuego.dialogosStuntman.estadoMision~="gameover"and b.interruptorParteMisionStuntman~=0 then d.cuentaAtrasStuntman=d.cuentaAtrasStuntman-1 end
spr(258,a.numericos.personajes.silvestreStacchotta.x-f.x,a.numericos.personajes.silvestreStacchotta.y-f.y,0)spr(303,0,5,0)spr(319,180,0,0)
rect(145,20,100,6,0)rect(0,0,240,20,0)dibujarJugador("esParaMisionStuntman")print("Flechas : Moverse",145,20,3)print("PUNTOS: "..c.puntuacionStuntman,160,9,4)
for ay,az in ipairs({"rampas","aro"})do U(az)end for ba,bb in ipairs({{"charcos","agregarCharco",{x=100,y=50}},{"trenes","mover"},{"trenes","dibujar"})})do gestionarDecoradoStuntman(bb[1],bb[2],bb[3])end
gestionarElementosMisionStuntman()verificarLimitesMapaConCamara("verificar_limites",1)todoClimatologia()
if a.booleanos.colision then spr(137,40,50,0)rectb(49,49,131,11,3)rect(50,50,130,10,4)print("A donde vas, wachin?",50,50,0)a.booleanos.colision=0 end
if a.booleanos.nitroActivado then rect(e.jugador.x-f.x-10,e.jugador.y-f.y-20,70,10,0)print("OH YEAHHHHH!",e.jugador.x-f.x-10,e.jugador.y-f.y-20,3)end
gestionarPantallaStuntman("inactividad",300,300)gestionarPantallaStuntman("temporal")
if not a.booleanos.cocheEstaSaltando and e.vehiculo.x>1319 and e.vehiculo.x<1342 and e.vehiculo.y>1017 and e.vehiculo.y<1087 then
a.booleanos.controlesBloqueadosTiburon=1 gestionarEstadoJuegoStuntman("mordidoPorTiburon",e.vehiculo.x-f.x,e.vehiculo.y-f.y)c.contadorTiburon=c.contadorTiburon+1
print("MORDIDO POR TIBURON",40,40,2)if c.contadorTiburon==25 then gestionarEstadoJuegoStuntman("gameover")e.vehiculo.x,e.vehiculo.y=1086,1055 c.contadorTiburon=0 end end
if todoJuego.dialogosStuntman.estadoMision~="gameover"and todoJuego.dialogosStuntman.estadoMision~="10completado"and b.interruptorParteMisionStuntman~=0 then local bc=0
for bd=1,10 do if b.interruptorParteMisionStuntman=="cuentaatras"..bd then bc=1 break end end if bc==1 then c.tiempoTotalStuntman=c.tiempoTotalStuntman+1 end end
print(string.format("%d:%02d",c.tiempoTotalStuntman//60,c.tiempoTotalStuntman%60),10,5,12,-1,2)
if c.objetivoTexto~=""and not a.booleanos.mostrarObjetivoCompletado and not a.booleanos.noMostrarObjetivoAun then ab("OBJETIVO "..b.lafase..": "..c.objetivoTexto,0,120,200)end
if a.booleanos.mostrarObjetivoCompletado then c.tiempoMostrarObjetivo=c.tiempoMostrarObjetivo+1 rect(0,120,140,10,0)print("OBJETIVO COMPLETADO! +"..a.puntosPorFase[be or 1],0,120,3)
if c.tiempoMostrarObjetivo>15 then a.booleanos.mostrarObjetivoCompletado=0 c.tiempoMostrarObjetivo=0 end end
if b.interruptorParteMisionStuntman==0 then ab(todoJuego.dialogosStuntman.descripcionMision,0,0,200)rect(0,90,240,40,0)
print("Inicio Rapido Fase: "..b.selectorFase,5,120,8)local bf={"Subir a coche","Atropellar cajas","Nitro / Checkpoint","Disparar a caja","Saltar en rampa","Esquivar coches","Perseguir coche","Saltar aro","Esquivar trenes","Escapar de Bomba"}
print(bf[b.selectorFase]or"",125,120,4)for _,bg in ipairs({{"BOTON 4: Fase Anterior",5,91,10},{"BOTON 5: Fase 1",135,101,4},{"BOTON 6: Fase Siguiente",5,101,10},{"BOTON 7: Empezar",5,111,10}}})do print(bg[1],bg[2],bg[3],bg[4])end
if btnp(4)then b.selectorFase=(b.selectorFase-2)%10+1 end if btnp(6)then b.selectorFase=b.selectorFase%10+1 end if btn(7)then
b.interruptorParteMisionStuntman="cuentaatras"..b.selectorFase local bh={[4]={1270,1025},[5]={1266,1060},[6]={1392,979},[7]={1392,979},[8]={1377,898},[9]={1399,819},[10]={1389,716}}
if bh[b.selectorFase]then e.vehiculo.x,e.vehiculo.y=bh[b.selectorFase][1],bh[b.selectorFase][2]end a.booleanos.jugadorEstaEnVehiculo=1 gestionarEstadoJuegoStuntman("completePhase",b.selectorFase-1)end
if btnp(5)then b.interruptorParteMisionStuntman,b.indiceDialogoStuntman,bi=1,1,1 c.objetivoTexto=gestionarPantallaStuntman("objetivo",0,0,1)end return end
local function bj(bk)a.booleanos.controlesBloqueados=1 local bl=tonumber(b.interruptorParteMisionStuntman)if bl and bl>=1 and bl<=10 then
local bm=bk and"alternativo"or"normal"local bn=todoJuego.dialogosStuntman.misionStuntman.partes[bl][bm]if bn and b.indiceDialogoStuntman<=#bn then
ab(bn[b.indiceDialogoStuntman],0,0,200)if a.booleanos.mostrarDialogosDesarrollo then a.booleanos.noMostrarObjetivoAun=1 ab("Comentarios de Desarrollo",0,90,200)
ab(todoJuego.dialogosStuntman.desarrollo[todoJuego.dialogosStuntman.dialogoDesarrolloRandom],0,100,200)end spr(258,200,0)if btnp(4)then a.booleanos.mostrarDialogosDesarrollo=0
for bo=1,10 do _G["todoJuego.gestionMisionStuntman.booleanos.gameOverFase"..bo]=0 end b.indiceDialogoStuntman=b.indiceDialogoStuntman+1 sfx(3,200,10,0,1)
if b.indiceDialogoStuntman>#bn then local bp=(bl==7)and 120 or 300 d.cuentaAtrasStuntman=bp b.interruptorParteMisionStuntman="cuentaatras"..bl b.indiceDialogoStuntman=1
c.objetivoTexto=gestionarPantallaStuntman("objetivo",0,0,bl)end end return end end end
if a.booleanos.dialogoAlternativo then bj(1)else bj(0)end if a.booleanos.controlesBloqueadosTiburon==0 then a.booleanos.controlesBloqueados=0 end
local bq=string.format("%d:%02d",d.cuentaAtrasStuntman//60,d.cuentaAtrasStuntman%60)if type(b.interruptorParteMisionStuntman)=="string"and b.interruptorParteMisionStuntman:find("cuentaatras")then
a.booleanos.dialogoAlternativo=0 br=1 local bs=tonumber(b.interruptorParteMisionStuntman:match("%d+"))or 0 print(bq,190,2,4)if a.booleanos.controlesBloqueadosTiburon then a.booleanos.controlesBloqueadosTiburon=0 end
spr(457,70,2,1)print("ESCENA "..bs,80,2,12)if todoJuego.dialogosStuntman.estadoMision~="gameover"then br=0 todoJuego.dialogosStuntman.estadoMision="objetivo"..bs.."Incompleto"end
local bt=math.sqrt((e.vehiculo.x-a.numericos.personajes.silvestreStacchotta.x)^2+(e.vehiculo.y-a.numericos.personajes.silvestreStacchotta.y)^2)
if bt<=20 or math.sqrt((e.jugador.x-a.numericos.personajes.silvestreStacchotta.x)^2+(e.jugador.y-a.numericos.personajes.silvestreStacchotta.y)^2)<=20 then
gestionarPantallaStuntman(0,a.numericos.personajes.silvestreStacchotta.x-f.x-70,a.numericos.personajes.silvestreStacchotta.y-f.y+20,0,"Silvestre Stacchotta")end
local bu={[1]=function()rect(0,20,100,6,0)print("B: Subir a vehiculo",0,20,3)if btn(5)and dibujarJugador("cochecerca")then sfx(7,150,5,0,1)
gestionarEstadoJuegoStuntman("completePhase",1)a.booleanos.jugadorEstaEnVehiculo=1 d.temporizadorExplosionRapida=120 a.numericos.mensajeTemporal.tiempo=5 end end,[2]=function()
rect(105,30,140,10,0)print("Cajas derribadas: "..c.contadorCajasDerribadas.." / 10",105,30,3)gestionarEfectosYExplosiones("explosion_rapida",1243-f.x,1050-f.y)
if not a.booleanos.mostrarDialogosDesarrollo then spr(302,1219-f.x,991-f.y,0)if math.sqrt((e.jugador.x-1219)^2+(e.jugador.y-991)^2)<=20 then rect(30,30,190,10,0)
print("Activar dialogos de desarrollador?",30,30,4)gestionarQTEyPersecucionStuntman("qte","update")local bv=gestionarQTEyPersecucionStuntman("qte","status")
if btnp(4)and bv and not bv.active and not bv.success and not bv.failed then gestionarQTEyPersecucionStuntman("qte","start")end end end
gestionarQTEyPersecucionStuntman("qte","draw")if gestionarEfectosYExplosiones("checkBoxes")then gestionarEstadoJuegoStuntman("completePhase",2)d.temporizadorExplosionRapida=120 end end,[3]=function()
a.booleanos.nitroBloqueado=0 rect(0,20,45,6,0)print("A: Nitro",0,20,3)gestionarCheckpointStuntman("stuntmanCheck","dibujar")
if a.booleanos.transicionCheckpoint then gestionarCheckpointStuntman(0,"checkpoint")end if gestionarCheckpointStuntman("stuntmanCheck","verificar")then a.booleanos.transicionCheckpoint=1 end
if c.contadorCheckpoint==20 and a.booleanos.transicionCheckpoint then gestionarEstadoJuegoStuntman("completePhase",3)d.temporizadorExplosionRapida=120
a.numericos.mensajeTemporal.tiempo=3 a.booleanos.nitroBloqueado=1 end end,[4]=function()a.booleanos.transicionCheckpoint=0 rect(0,20,100,6,0)
print("B: Disparar pistola",0,20,3)spr(290,220,0)if not a.booleanos.pistolaObtenida then a.numericos.mensajeTemporal.texto="Obtenida pistola"a.booleanos.pistolaObtenida=1 end
if math.sqrt((e.vehiculo.x-a.numericos.personajes.silvestreStacchotta.x)^2+(e.vehiculo.y-a.numericos.personajes.silvestreStacchotta.y)^2)<=20 then
gestionarPantallaStuntman(0,a.numericos.personajes.silvestreStacchotta.x-f.x-70,a.numericos.personajes.silvestreStacchotta.y-f.y-20,0,todoJuego.dialogosStuntman.misionStuntman.ocultos.fase4)
if not a.booleanos.yaSumoPuntosDialogoOculto then c.dialogosOcultosEncontrados=c.dialogosOcultosEncontrados+1 c.puntuacionStuntman=c.puntuacionStuntman+10 a.numericos.mensajeTemporal.tiempo=1
a.numericos.mensajeTemporal.texto="+10 puntos dialogo oculto"a.booleanos.yaSumoPuntosDialogoOculto=1 end end gestionarEfectosYExplosiones("dibujarExplosion",1177-f.x,1053-f.y)
if a.mision.cajaMetalica.health==0 then gestionarEfectosYExplosiones("dibujarExplosion",a.mision.cajaMetalica.x-f.x,a.mision.cajaMetalica.y-f.y)gestionarEstadoJuegoStuntman("completePhase",4)
d.temporizadorExplosionRapida=120 a.booleanos.yaSumoPuntosDialogoOculto=0 end end,[5]=function()a.booleanos.transicionCheckpoint=0
if math.sqrt((e.vehiculo.x-a.numericos.personajes.silvestreStacchotta.x)^2+(e.vehiculo.y-a.numericos.personajes.silvestreStacchotta.y)^2)<=20 then
gestionarPantallaStuntman(0,a.numericos.personajes.silvestreStacchotta.x-f.x-70,a.numericos.personajes.silvestreStacchotta.y-f.y-20,0,todoJuego.dialogosStuntman.misionStuntman.ocultos.fase5)
if not a.booleanos.yaSumoPuntosDialogoOculto then c.dialogosOcultosEncontrados=c.dialogosOcultosEncontrados+1 c.puntuacionStuntman=c.puntuacionStuntman+10 a.numericos.mensajeTemporal.tiempo=1
a.numericos.mensajeTemporal.texto="+10 puntos dialogo oculto"a.booleanos.yaSumoPuntosDialogoOculto=1 end end gestionarRampas(a.mision.rampas[1],"dibujar")gestionarRampas(a.mision.rampas[1],"actualizar")
if a.booleanos.saltoConExito then gestionarEfectosYExplosiones("dibujarExplosion",1330-f.x,1062-f.y)gestionarEstadoJuegoStuntman("completePhase",5)d.temporizadorExplosionRapida=120 end end,[6]=function()
rect(a.numericos.dialogos.cochesEnLlamas.x-f.x,a.numericos.dialogos.cochesEnLlamas.y-f.y,180,10,0)print("Vivan las Armas Nucleares JAJAJA",a.numericos.dialogos.cochesEnLlamas.x-f.x,a.numericos.dialogos.cochesEnLlamas.y-f.y,5)
if a.numericos.dialogos.cochesEnLlamas.x>=1250 then a.numericos.dialogos.cochesEnLlamas.x=a.numericos.dialogos.cochesEnLlamas.x-3 else a.numericos.dialogos.cochesEnLlamas.x=1500 end
gestionarEfectosYExplosiones("dibujarExplosion",1342-f.x,950-f.y)gestionarEnemigos("stuntman","crear")gestionarEnemigos("stuntman","dibujar")
if not gestionarEnemigos("stuntman","dibujar")and d.cuentaAtrasStuntman==0 then gestionarEstadoJuegoStuntman("completePhase",6)d.temporizadorExplosionRapida=120
elseif gestionarEnemigos("stuntman","dibujar")then gestionarEstadoJuegoStuntman("gameover")a.booleanos.gameOverFase6=1 end end,[7]=function()
gestionarQTEyPersecucionStuntman("persecucion","dibujar")gestionarQTEyPersecucionStuntman("persecucion","dibujar_rango")local bw=gestionarQTEyPersecucionStuntman("persecucion","actualizar")
rect(a.mision.cocheAPerseguir.x-f.x,a.mision.cocheAPerseguir.y-f.y-30,120,10,0)print("No me sigais,gilipollas",a.mision.cocheAPerseguir.x-f.x,a.mision.cocheAPerseguir.y-f.y-30,5)
if bw==0 then gestionarEstadoJuegoStuntman("completePhase",7)d.temporizadorExplosionRapida=120 elseif bw==1 then gestionarEstadoJuegoStuntman("gameover")a.booleanos.gameOverFase7=1 end end,[8]=function()
gestionarEfectosYExplosiones("dibujarExplosion",1396-f.x,837-f.y)a.booleanos.puenteDestruido=1 gestionarRampas(a.mision.rampas[2],"dibujar")gestionarRampas(a.mision.rampas[2],"actualizar")
h("actualizar")h("verificar_colision")if a.booleanos.quemadoPorAro then gestionarEstadoJuegoStuntman("gameover")a.booleanos.gameOverFase8=1 elseif a.booleanos.aroSaltadoSinQuemarse then
gestionarEstadoJuegoStuntman("completePhase",8)d.temporizadorExplosionRapida=120 end end,[9]=function()a.booleanos.controlesBloqueados=0 U("circulo_victoria")
gestionarCheckpointStuntman("tren","dibujar")gestionarCheckpointStuntman(0,"particulas")rect(a.numericos.dialogos.tren.x-f.x,a.numericos.dialogos.tren.y-f.y,180,10,0)
print("Aca viene el tren de la alegria",a.numericos.dialogos.tren.x-f.x,a.numericos.dialogos.tren.y-f.y,5)if a.numericos.dialogos.tren.x<=1500 then a.numericos.dialogos.tren.x=a.numericos.dialogos.tren.x+3
else a.numericos.dialogos.tren.x=1300 end if gestionarCheckpointStuntman("tren","verificar")then a.booleanos.transicionCheckpoint=1 end
if c.contadorCheckpoint==20 and a.booleanos.transicionCheckpoint then gestionarEstadoJuegoStuntman("completePhase",9)d.temporizadorExplosionRapida=120 a.booleanos.transicionCheckpoint=0 end
if gestionarDecoradoStuntman("trenes","colision",{x=e.jugador.x,y=e.jugador.y})then gestionarEstadoJuegoStuntman("gameover")a.booleanos.gameOverFase9=1 end end,[10]=function()
gestionarEfectosYExplosiones("dibujarExplosion",1384-f.x,719-f.y)if a.booleanos.jugadorEstaEnVehiculo then rect(0,20,100,6,0)print("B: Bajar de vehiculo",0,20,3)end
if a.booleanos.jugadorPreparaBomba then dibujarJugador("esParaMisionStuntman")end if a.booleanos.transicionCheckpoint then gestionarCheckpointStuntman(0,"checkpoint")end
gestionarCheckpointStuntman("bomba","dibujar")if gestionarCheckpointStuntman("bomba","verificar")then a.booleanos.transicionCheckpoint=1 a3("iniciarBomba")end
if c.contadorCheckpoint==20 and a.booleanos.transicionCheckpoint then a.booleanos.faseBomba=1 end if a.booleanos.faseBomba then
if a.booleanos.jugadorEstaEnVehiculo then rect(e.vehiculo.x-f.x-80,e.vehiculo.y-f.y-20,180,10,0)print("Preparar Explosion ( Boton B ) ?",e.vehiculo.x-f.x-80,e.vehiculo.y-f.y-20,3)
if btnp(5)then dibujarJugador("salir")a.booleanos.jugadorPreparaBomba=1 end end if not a.booleanos.jugadorEstaEnVehiculo then a3("mensaje")a3("iniciarBomba")end end end}
if bu[bs]then bu[bs]()end if d.cuentaAtrasStuntman<=0 and todoJuego.dialogosStuntman.estadoMision~="gameover"then
if todoJuego.dialogosStuntman.estadoMision:find("Incompleto")then local bx=tonumber(b.interruptorParteMisionStuntman:match("%d+"))or 1 b.faseActualEnGameOver=bx
gestionarEstadoJuegoStuntman("gameover")a.booleanos.dialogoAlternativo=1 local by={[1]={1086,1055},[2]={1149,1048},[3]={1149,1048},[4]={1270,1025},[5]={1266,1060},
[6]={1392,979},[7]={1392,979},[8]={1377,898},[9]={1399,819},[10]={1389,716}}if by[bs]then e.vehiculo.x,e.vehiculo.y=by[bs][1],by[bs][2]end
_G["todoJuego.gestionMisionStuntman.booleanos.gameOverFase"..bs]=1 b.faseActualEnGameOver=bs elseif bs<10 then b.interruptorParteMisionStuntman="cuentaatras"..(bs+1)
d.cuentaAtrasStuntman=(bs+1==7)and 120 or 300 end end end if todoJuego.dialogosStuntman.estadoMision=="gameover"then gestionarPantallaStuntman("gameover")
todoJuego.dialogosStuntman.dialogoDesarrolloRandom=e(1,#todoJuego.dialogosStuntman.desarrollo)if btnp(4)then gestionarEstadoJuegoStuntman("reiniciar:misión")end return end
if todoJuego.dialogosStuntman.estadoMision=="10completado"then gestionarPantallaStuntman("completado")if btnp(4)then reiniciar("misión")end end end

--manejar juego principal con menus

function m(t)if t==nil then cls(0)a.booleanos.controlesBloqueados=0
verificarLimitesMapaConCamara("verificar_limites",0)verificarLimitesMapaConCamara("inicializar")
todoClimatologia()dibujarJugador()dibujarElementosDelMundo(b.jugador.x,b.jugador.y)
gestionarEntidades()gestionarEfectosYExplosiones("actualizar_efectos")gestionarEnemigos(b.camara.posicion.x,b.camara.posicion.y)
gestionarUbicacion("calles",b.jugador.x,b.jugador.y,b.camara.posicion.x,b.camara.posicion.y)
if c.estados.misionStuntman==0 or c.estados.pinball==0 then gestionarVehiculos("trafico")gestionarVehiculos("especiales")end
if c.estados.misionStuntman==1 then todoMisionStuntman()end
if c.estados.radios==1 then manejarModulos("radio")end
if d==1 then dibujarJugador("jetpack")end
gestionarArmas()gestionarArmas("frases")gestionarArmas("colisiones",0)
gestionarDecoradoStuntman("pajaros","actualizar")gestionarDecoradoStuntman("pajaros","dibujar")
return"juego_principal"else cls(0)local e=time()if t=="intro"or t=="creditos"then
local f=t=="intro"and g or h local i=t=="intro"and f.temporizador or j.temporizadorGeneral
local function k(l,m,n)local o=t=="intro"and-15 or-20 if l then for p=1,#l do
pix(m+(p-1)*6+o,n,(i//5+p)%16)print(l:sub(p,p),m+(p-1)*6+o,n,(i//5+p)%16)end else for _,q in ipairs(f.estrellas)do pix(q.x,q.y,(i//5+q.x+q.y)%16)end end end
k()if t=="intro"then k(f.mensajes[f.indiceMensaje],40,60)if f.indiceMensaje==4 then k("Pulsar cualquier boton",60,80)end
f.temporizador=f.temporizador+1 if f.temporizador%300==0 then f.indiceMensaje=f.indiceMensaje%#f.mensajes+1 end
if btn(0)or btn(1)or btn(2)or btn(3)then f.indiceMensaje,f.temporizador=1,0 return"salir_intro"end else
for p,r in ipairs(f.mensaje)do k(r,20,f.posicionY+(p-1)*12)end f.posicionY=f.posicionY-0.5 if f.posicionY+#f.mensaje*12<0 then f.posicionY=136 return"reiniciar_creditos"end end
elseif t=="demo"then local s,u,v=math.random,math.max,math.min local w=x or{dialogos={"Silvestre Stacchotta : Hola, soy el famoso Actor Estadounidense Silvestre Stacchotta y me mude a Argentina",
"Silvestre Stacchotta : para protagonizar mi nueva pelicula Mambo.","Silvestre Stacchotta : Vine a divertirme mucho y quiero hacer muchas cosas chanchas, jajaja!"},dialogoActual=1,temporizador=0,posX=40,posY=40,direccionX=1,direccionY=1,velocidad=0.5,
cambioDireccion=60,mostrarTextoDemo=1,tiempoParpadeo=0,duracionParpadeo=180,ultimoCambioDialogo=0}x=w
local function y(z,A,B,C)local D,E=todoJuego.baile.coloresArcoiris,e//30 for p=1,#z do local F=z:sub(p,p)local G=A+(p-1)*6*C
local H=D[(E+p)%#D+1]for I=-1,1 do for J=-1,1 do if I~=0 or J~=0 then print(F,G+I,B+J,H,0,C)end end end print(F,G,B,3,0,C)end end
w.temporizador,w.tiempoParpadeo=w.temporizador+1,w.tiempoParpadeo+1 if w.temporizador%w.cambioDireccion==0 then w.direccionX,w.direccionY=s(-1,1),s(-1,1)end
w.posX,w.posY=u(20,v(220,w.posX+w.direccionX*w.velocidad)),u(20,v(120,w.posY+w.direccionY*w.velocidad))map(0,0,30,17,0,0)spr(258,w.posX,w.posY,0)
if w.dialogoActual<=#w.dialogos then y(w.dialogos[w.dialogoActual],0,0,1)if w.temporizador-w.ultimoCambioDialogo>=180 then w.dialogoActual=w.dialogoActual%#w.dialogos+1 w.ultimoCambioDialogo=w.temporizador end end
if w.tiempoParpadeo>=w.duracionParpadeo then w.mostrarTextoDemo,w.tiempoParpadeo=not w.mostrarTextoDemo,0 end if w.mostrarTextoDemo then y("DEMO",100,60,4)end
print("Presiona (A) para volver al menú",60,140,7)if btnp(4)then x=0 return"salir_demo"end return"continuar_demo"else print("Tipo de pantalla no reconocido",10,10,8)return"error"end end end

--todo minijuego pinball

function P()local p,b,c,g,a,o,f,t=todoJuego.pinball,p.bola,p.config,p.colores,p.paletas,p.objetos,p.frases,time()if not b.lanzada and btnp(4)then b.lanzada,p.resorte.animando,p.resorte.timer=true,true,0 b.principal.vx,b.principal.vy,c.puntuacion=-2,-4.5,c.puntuacion+1 sfx(1,"E-4",2,0,15,1)end if c.puntuacion>=500 and not b.adicionales[1].activa then b.adicionales[1]={x=r(50,190),y=r(30,100),vx=r(-2,2),vy=r(-3,-1),r=4,a=true}sfx(2,"D-5",1,0,15,1)end if c.puntuacion>=1e3 and not b.adicionales[2].activa then b.adicionales[2]={x=r(50,190),y=r(30,100),vx=r(-2,2),vy=r(-3,-1),r=4,a=true}sfx(2,"D-5",1,0,15,1)end local B={b.principal}for _,A in ipairs(b.adicionales)do if A.a then ins(B,A)end end for _,k in ipairs(B)do local m=k==b.principal if(m and b.lanzada)or(not m)then k.x=k.x+k.vx k.y=k.y+k.vy k.vy=k.vy+(m and 0.1 or 0.085)end if k.x-k.r<0 then k.x=k.r k.vx=-k.vx*0.9 if m then g.paredes.izquierda=6 g.tC=g.dC c.puntuacion=c.puntuacion+2 end sfx(3,"C-2",1,0,15,1)elseif k.x+k.r>214 then k.x=214-k.r k.vx=-k.vx*0.9 if m then g.paredes.derecha=6 g.tC=g.dC c.puntuacion=c.puntuacion+2 end sfx(3,"C-2",1,0,15,1)end if k.y-k.r<0 then k.y=k.r k.vy=-k.vy*0.8 if m then g.paredes.arriba=6 g.tC=g.dC c.puntuacion=c.puntuacion+3 end sfx(3,"C-3",1,0,15,1)end if k.y+k.r>130 then local h=k.x>o.agujero.x-15 and k.x<o.agujero.x+o.agujero.w+15 if h then if k.y+k.r>135 then if m then b.lanzada=false c.intentos=c.intentos+1 c.combos=0 else k.a=false end sfx(2,"D-4",2,0,15,1)else k.vy=k.vy+0.15 end else k.y=130-k.r k.vy=-abs(k.vy)*0.7 sfx(3,"C-4",1,0,15,1)end end end if not b.lanzada then b.principal.x,b.principal.y,b.principal.vx,b.principal.vy=200,120,0,0 end if btn(2)then a.izquierda.a=min(0,a.izquierda.a+0.1)a.superiorIzquierda.a=min(0,a.superiorIzquierda.a+0.1)else a.izquierda.a=max(-pi/2,a.izquierda.a-0.1)a.superiorIzquierda.a=max(-pi/2,a.superiorIzquierda.a-0.1)end if btn(3)then a.derecha.a=max(-pi,a.derecha.a-0.1)a.superiorDerecha.a=max(-pi,a.superiorDerecha.a-0.1)else a.derecha.a=min(-pi/2,a.derecha.a+0.1)a.superiorDerecha.a=min(-pi/2,a.superiorDerecha.a+0.1)end local function C(k,p,s)local x2=p.x+p.l*cos(p.a)local y2=p.y-p.l*sin(p.a)if((k.x-x2)^2+(k.y-y2)^2)^.5<k.r+3 then p.c=6 local nX,nY=-sin(p.a),cos(p.a)local dP=k.vx*nX+k.vy*nY local f=m and 1.8 or 2 k.vx=k.vx-f*dP*nX k.vy=k.vy-f*dP*nY c.puntuacion=c.puntuacion+(s and 3 or 2)*(m and 2 or 1)if m then c.colisiones,c.combos=c.colisiones+1,c.combos+1 end sfx(1,"E-5",2,0,15,1)end end for _,k in ipairs(B)do C(k,a.izquierda)C(k,a.derecha)C(k,a.superiorIzquierda,1)C(k,a.superiorDerecha,1)end for i,d in ipairs(o.diamantes)do if not d.v then d.t=d.t+1 if d.t>=c.tR then d.v,d.t=true,0 end end if d.v then spr(311,d.x,d.y,0)if abs(b.principal.x-(d.x+4))<8 and abs(b.principal.y-(d.y+4))<8 then d.v=false c.puntuacion=c.puntuacion+10 print("+10",60,100,3)sfx(0,"C-5",3,0,15,0)end end end for i,m in ipairs(p.meteoritos)do m.y=m.y+m.vY if m.y>136 then m.y,m.x,m.vY=r(-50,-10),r(0,240),r(1,3)m.c=r(1,3)end pix(m.x,m.y,m.c==1 and 8 or m.c==2 and 9 or 10)end if not _R then _R={s=true,t=0,d=90,rD=240,n={1,2,3},v={5,5,5},w=false}end if _R.s then for i=1,3 do _R.n[i]=_R.n[i]+_R.v[i]if _R.n[i]>9 then _R.n[i]=1 end end _R.t=_R.t+1 if _R.t>_R.d then for i=1,3 do if _R.v[i]>0.1 then _R.v[i]=_R.v[i]*0.95 else _R.v[i]=0 _R.s=false if _R.n[1]==_R.n[2]and _R.n[2]==_R.n[3]then _R.w=true c.puntuacion=c.puntuacion+100 end end end end else _R.t=_R.t+1 if _R.t>_R.rD then _R.s,_R.t,_R.w=true,0,false for i=1,3 do _R.v[i],_R.n[i]=5,r(1,9)end end end for i=1,3 do rect(38,15,30,10,4)end for i=1,3 do print(flr(_R.n[i]),30+i*10,20,0)end if _R.w and not _R.s then print("+100",70,90,11)end local l={[2]=300,[3]=800,[4]=1300,[5]=1800,[6]=3e3,[7]=5500,[8]=9e3,[9]=15e3}for n=2,9 do if c.puntuacion>l[n]and c.nivel<n then c.nivel,c.puntuacion,c.pS=n,c.puntuacion+1,l[n+1]or 1/0 end end if c.colision==#f.aC.l[f.aC.i]then c.colision=0 print("+10",10,90,5)c.puntuacion=c.puntuacion+10 f.aC.i=f.aC.i+1 if f.aC.i==8 then f.aC.i=1 end end local R,vC={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},40 rect(0,0,1,136,g.paredes.izquierda)rect(214,0,1,136,g.paredes.derecha)rect(0,0,214,1,g.paredes.arriba)rect(0,135,214,1,g.paredes.abajo)local h,F,P=o.agujero,{2,3,4},{{1,0,1,0,1},{0,1,0,1,0},{1,0,1,0,1},{0,1,0,1,0}}rect(h.x,h.y,h.w,h.h,2)for i=0,h.w-1 do for j=0,h.h-1 do local pI=(i+flr(t/5))%#P+1 local r=(j+flr(t/7))%#P[1]+1 if P[pI][r]==1 then pix(h.x+i,h.y+j,F[(i+j+flr(t/3))%#F+1])end end pix(h.x+i,h.y,3)end local r=p.resorte local y=r.a and(r.y-(10-min(r.t,10))or r.y for i=0,10,2 do line(190,y-i,205,y-i,i%4==0 and 11 or 8)end local function D(x,y,r,o,m)if m and b.lanzada and(b.principal.vx~=0 or b.principal.vy~=0)then for i=1,3 do local f=i*0.2 local X,Y=x-b.principal.vx*f*10,y-b.principal.vy*f*10 X,Y=max(r,min(214-r,X)),max(r,min(135-r,Y))circ(X,Y,r*(1-i*0.2)+0.5,13)circ(X,Y,r*(1-i*0.2),5+i)end end local c=R[(flr(t/vC)+(o or 0))%#R+1]for A=0,360,15 do local X,Y=x+cos(rad(A))*r,y+sin(rad(A))*r pix(X,Y,c)end circ(x,y,r-1,8)pix(x+1,y-1,15)end local function L(p)local c=R[flr(t/vC)%#R+1]local x2,y2=p.x+p.l*cos(p.a),p.y-p.l*sin(p.a)circ(p.x,p.y,3,c)line(p.x,p.y,x2,y2,c)tri(x2,y2,x2+3*cos(p.a+rad(90)),y2-3*sin(p.a+rad(90)),x2+3*cos(p.a-rad(90)),y2-3*sin(p.a-rad(90)),c)end if not b.lanzada then b.principal.x,b.principal.y=197,y-10-b.principal.r end D(b.principal.x,b.principal.y,b.principal.r,nil,1)for i,k in ipairs(b.adicionales)do if k.a then D(k.x,k.y,k.r,i*10)print("MultiBola!",150,50,9)end end L(a.izquierda)L(a.superiorIzquierda)L(a.derecha)L(a.superiorDerecha)if r.a then r.t=r.t+1 if r.t>=10 then r.a,r.t=false,0 end end local A=p.a.o local function U()A.t=A.t+1 if c.puntuacion<2e3 and A.T~="m"then A.T,A.C,A.t="m",p.a.p.m,0 elseif c.puntuacion>=2e3 and c.puntuacion<5e3 and A.T~="r"then A.T,A.C,A.t="r",p.a.p.r,0 elseif c.puntuacion>=5e3 and A.T~="p"then A.T,A.C,A.t="p",p.a.p.p,0 end end U()spr(o.sI.s,o.sI.x,o.sI.y,0)if o.sI.mF then if t-o.sI.uF<270 then print(o.sI.f,o.sI.x-#o.sI.f*2,o.sI.y-10,3)else o.sI.mF=false end end spr(o.sR.id,o.sR.x,o.sR.y,0)for i,s in ipairs(o.sA)do spr(s.id,s.x,s.y,0)end local x,y=160,20 local T={{"Intentos: "..c.intentos,0},{"Combos: "..c.combos,10},{"Nivel: "..c.nivel,20},{c.puntuacion,-13,10,2}}for _,d in ipairs(T)do local t,oX,oY,s=d[1],d[3]or 0,d[2]or 0,d[4]or 1 for i=-1,1 do for j=-1,1 do local c=R[flr(t/90)%#R+1]print(t,x+oX+i,y+oY+j,c,-1,s)end end print(t,x+oX,y+oY,0,-1,s)end if f.r.f==""then f.r.f=f.r.l[1]end f.r.t=f.r.t+1 f.r.oC=f.r.t//3 f.r.pX=f.r.pX-f.r.v local aF=#f.r.f*6 if f.r.pX+aF<f.r.lI then f.r.i=f.r.i%#f.r.l+1 f.r.f=f.r.l[f.r.i]f.r.pX=f.r.lD end local iR=flr(max(0,(f.r.lI-f.r.pX)/6)local fR=ceil(min(#f.r.f,(f.r.lD-f.r.pX)/6)for i=flr(iR)+1,fR do if i>0 and i<=#f.r.f then local c=f.r.f:sub(i,i)print(c,f.r.pX+(i-1)*6,5,f.r.c[(i+f.r.oC)%#f.r.c+1])end end if f.aC and#f.aC.l[f.aC.i]>0 then print(f.aC.l[f.aC.i]:sub(1,c.colision or#f.aC.l[f.aC.i]),10,60,11)end if g.tC>0 then g.tC=g.tC-1 if g.tC==0 then a.izquierda.c,a.derecha.c,a.superiorIzquierda.c,a.superiorDerecha.c=1,1,1,1 end end end

--todo minijuego baile

function B()
b=todoJuego.baile
v,f,p=b.variablesNumericas,b.flechas,b.posicionesFlechas
function r(t,x,y,e,n)
e=e or 1
n=n==nil or n
T=time()//50
for i=1,#t do
l=t:sub(i,i)
c=b.coloresArcoiris[(T+i)%#b.coloresArcoiris+1]
X=x+(i-1)*6*e
for dx=-1,1 do for dy=-1,1 do if dx~=0 or dy~=0 then print(l,X+dx,y+dy,c,false,e) end end end
print(l,X,y,n and 0 or c,false,e)end end
if not b.juegoActivo then
cls(0)print("Juego Terminado",80,60,12)print("Puntos finales: "..v.puntuacion,60,80,11)print("Presiona A para reiniciar.",50,100,7)
if btn(4)then
v.puntuacion=0 v.combos=0 v.fallos=0 v.temporizadorFlechas=0 v.tiempoGeneracionFlechas=30
v.tiempoFraseCombo=0 v.tiempoFeedbackFlechas=0 v.indiceFrase=0
b.flechas={} b.juegoActivo=true end return end
v.indiceFrase=v.indiceFrase+1
if v.indiceFrase>=v.cambioFraseIntervalo then
v.indiceFrase=v.indiceFrase+1
if v.indiceFrase>#b.frasesCancion then v.indiceFrase=1 end
v.indiceFrase=0 end
v.temporizadorFlechas=v.temporizadorFlechas+1
if v.temporizadorFlechas>=v.tiempoGeneracionFlechas then
v.temporizadorFlechas=0
t=math.random(4)
table.insert(f,{tipo=t,x=p[t],y=136,activa=true,acertada=false,tiempo_acertada=0})
v.tiempoGeneracionFlechas=math.random(30,90)
end
for i=#f,1,-1 do
fl=f[i]
if fl.activa then
fl.y=fl.y-1
if fl.y<0 then
fl.activa=false
if fl.y>-15 then v.fallos=v.fallos+1 v.combos=0 end
table.remove(f,i)
else s(496+fl.tipo,f[i].x,fl.y,0,2)
end elseif fl.acertada then
fl.tiempo_acertada=fl.tiempo_acertada-1
if fl.tiempo_acertada<=0 then table.remove(f,i)
else s(504+fl.tipo,fl.x,fl.y,0,2)end end end
if btnp(0)or btnp(1)or btnp(2)or btnp(3)then
for i,fl in ipairs(f)do
if fl.activa and fl.y>=16 and fl.y<=32 then
t=(btnp(2)and fl.tipo==1)or(btnp(0)and fl.tipo==2)or(btnp(1)and fl.tipo==3)or(btnp(3)and fl.tipo==4)
if t then
fl.activa=false fl.acertada=true fl.tiempo_acertada=15
v.puntuacion=v.puntuacion+10+v.combos*2 v.combos=v.combos+1
if v.combos>0 then
b.fraseComboVisible=b.frasesCombo[1+(v.combos%#b.frasesCombo)]
v.tiempoFraseCombo=60 end end end end end
if #b.estrellas==0 then
for i=1,v.numeroEstrellas do
table.insert(b.estrellas,{x=math.random(0,240),y=math.random(0,136),velocidad=math.random(1,3)})
end end
for _,e in ipairs(b.estrellas)do
pix(e.x,e.y,7)e.y=e.y+e.velocidad
if e.y>136 then e.y,e.x=0,math.random(0,240)end end
for i=1,9 do
x,y=20*i,70+math.sin(time()/200+i)*10
s(255+i,x,y,0,1)end
r("Puntos:"..v.puntuacion,180,10,1,true)
r("Combo:"..v.combos,180,20,1,true)
r("Fallos:"..v.fallos,180,30,1,true)
r("Artista : DiosGPT",10,90,1,true)
r("Cancion : Romance IA - Marciano",10,100,1,true)
r("(Album xxIAxx : 2025)",10,109,1,true)
if v.tiempoFraseCombo>0 then
r("NUEVO COMBO!",145,40,1,true)
r(b.fraseComboVisible,145,50,1,true)end
f=b.frasesCancion[v.indiceFrase]
if f then print(f,10,117,1,false)end
v.tiempoFeedbackFlechas=(btnp(0)or btnp(1)or btnp(2)or btnp(3))and 20 or math.max(0,v.tiempoFeedbackFlechas-1)
for i=1,4 do
s(((v.tiempoFeedbackFlechas>0 and ((i==1 and btn(2))or(i==2 and btn(0))or(i==3 and btn(1))or(i==4 and btn(3))))and 500 or 496)+i,p[i],16,0,2)
end end

--todo climatologia

function C()
local c=todoJuego.clima
local i,r=c.interruptores,math.random
local m=function(a,b,c)return a>b and(b>c and b or math.max(a,c))or(a>c and a or math.min(b,c))end
local w={
l={max=100,init=function()return{x=r(0,240),y=r(-240,0),s=r(2,4),a=2,h=6,c=9}end,
u=function(g)g.y=g.y+g.s return g.y<=136 end,
d=function(g)rect(g.x,g.y,g.a,g.h,g.c)end},
h={max=20,init=function()return{x=r(0,240),y=r(-20,0),sx=r(-1,1),sy=r(1,3),sw=r()*6.28,s=r(213,214)}end,
u=function(h)h.x=h.x+h.sx+math.sin(h.sw)*0.5 h.y=h.y+h.sy h.sw=h.sw+0.1
if h.y>136 or h.x<0 or h.x>240 then h.y,h.x=r(-20,-1),r(0,240)end return true end,
d=function(h)spr(h.s,h.x,h.y,0)end},
n={max=50,init=function()return{x=r(0,240),y=r(-240,0),sy=r(1,2),sw=r(-1,1),s=212}end,
u=function(n)n.x=n.x+n.sw n.y=n.y+n.sy if n.y>136 then n.y,n.x=r(-20,-1),r(0,240)end n.x=m(0,n.x,240) return true end,
d=function(n)spr(n.s,n.x,n.y,0)end},
v={max=15,init=function()return{x=r(0,240),y=r(0,136),a=r(5,10),f=r(10,20),p=r(0,360)}end,
u=function(v)v.x=v.x-c.velocidadViento v.p=v.p+4
if v.x+240<0 then v.x,v.y,v.a,v.f,v.p=240,r(0,136),r(5,10),r(10,20),r(0,360)end return true end,
d=function(v)for i=0,v.a do pix(v.x+i,v.y+math.sin(v.p+i*v.f/240)*5,7)end end},
r={u=function()
if c.relampagosActivados then c.temporizadorRelampago=c.temporizadorRelampago-1
if c.temporizadorRelampago<=0 then c.relampagosActivados=false end
elseif r(0,200)==0 then c.relampagosActivados,c.temporizadorRelampago=true,c.duracionFlashRelampago end end,
d=function()
if c.relampagosActivados then rect(0,0,240,136,15)
for _=1,r(1,3)do
local x=r(20,220)
for i=1,r(5,10)do
local dx,dy=r(-5,5),r(5,20)
line(x,math.min(136,i*10),x+dx,math.min(136,i*10+dy),4)
x=x+dx end end end end}
}
local function H(e)
if not c[e] then c[e]={}for _=1,w[e].max do table.insert(c[e],w[e].init())end end
local p={} for _,x in ipairs(c[e])do if w[e].u(x)then table.insert(p,x)end end
while #p<w[e].max do table.insert(p,w[e].init())end c[e]=p
for _,x in ipairs(p)do w[e].d(x)end end
if i.lluvia then H("l")end if i.hojas then H("h")end
if i.nieve then H("n")end if i.vientos then H("v")end
if i.relampagos then w.r.u()w.r.d()end end

--manejar modulos

function manejarModulos(m,...)
local function dM(t,mw)local l={}for s in t:gmatch("[^\n]+")do local i=1 while i<=#s do local e=math.min(i+mw-1,#s)local sp=s:sub(i,e):find("%s[^%s]*$")if sp then e=i+sp-1 end table.insert(l,s:sub(i,e))i=e+1 end end return l end
local function dTCB(t,x,y,c,f)if f then rect(x-2,y-2,#t*6+4,10,f)end for dx=-1,1 do for dy=-1,1 do if dx~=0 or dy~=0 then print(t,x+dx,y+dy,15)end end end p(t,x,y,c or 5)end
local function dE(x,y,c)pix(x,y,c)pix(x-1,y,c)pix(x+1,y,c)pix(x,y-1,c)pix(x,y+1,c)end

if m=="teclado"then
local k=...or"pc"teclado=teclado or{modo=k,debounce=0,estado="inactivo"}
if teclado.modo~=k or teclado.estado=="inactivo"then teclado.modo,teclado.estado,teclado.debounce=k,"activo",0
if k=="pc"then teclado.pc={teclas={{"Q","W","E","R","T"},{"Y","U","I","O","P"},{"A","S","D","F","G"},{"H","J","K","L","Z"},{"X","C","V","B","N"},{"M","Enter","Borrar"}},cursor={1,1},texto="",claveCorrecta="inglish",claveCorrectaIngresada=false,dim={40,10,5,5,0,40}}
else teclado.num={teclas={"1","2","3","4","5","6","7","8","9","0","Borrar","Enter"},seleccion=1,claveCorrecta="1234",claveIngresada="",mensaje="",coloresArcoiris={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15},colorOffset=0,dim={30,30,5,10,10}}end end
if teclado.debounce>0 then teclado.debounce=teclado.debounce-1 return true end
local t=teclado[teclado.modo]
if teclado.modo=="pc"then for y,r in ipairs(t.teclas)do for x,k in ipairs(r)do local px,py=t.dim[5]+(x-1)*(t.dim[1]+t.dim[3]),t.dim[6]+(y-1)*(t.dim[2]+t.dim[4])rect(px,py,t.dim[1],t.dim[2],5)if x==t.cursor[1]and y==t.cursor[2]then rectb(px-1,py-1,t.dim[1]+2,t.dim[2]+2,7)end p(k,px+(#k==1 and 5 or 3),py+2,7)end end
if btnp(0)then t.cursor[2]=(t.cursor[2]-2)%#t.teclas+1 elseif btnp(1)then t.cursor[2]=t.cursor[2]%#t.teclas+1 elseif btnp(2)then t.cursor[1]=(t.cursor[1]-2)%#t.teclas[t.cursor[2]]+1 elseif btnp(3)then t.cursor[1]=t.cursor[1]%#t.teclas[t.cursor[2]]+1 end
if btnp(5)then local k=t.teclas[t.cursor[2]][t.cursor[1]]if k=="Enter"then t.claveCorrectaIngresada=t.texto:lower()==t.claveCorrecta t.texto=t.claveCorrectaIngresada and t.texto or""elseif k=="Borrar"then t.texto=t.texto:sub(1,-2)else t.texto=t.texto..k end teclado.debounce=10 end
dTCB("Escribe: "..t.texto,10,10,7)if t.claveCorrectaIngresada then cls(0)dTCB("Clave correcta!",60,68,11)end
else
local x,y=t.dim[4],t.dim[5]for i,k in ipairs(t.teclas)do rect(x,y,t.dim[1],t.dim[2],7)if i==t.seleccion then rectb(x-2,y-2,t.dim[1]+4,t.dim[2]+4,8)end p(k,x+7,y+7,0)x=x+t.dim[1]+t.dim[3]if i%3==0 then x,y=t.dim[4],y+t.dim[2]+t.dim[3]end end
if btnp(0)then t.seleccion=math.max(1,t.seleccion-3)elseif btnp(1)then t.seleccion=math.min(#t.teclas,t.seleccion+3)elseif btnp(2)then t.seleccion=math.max(1,t.seleccion-1)elseif btnp(3)then t.seleccion=math.min(#t.teclas,t.seleccion+1)end
if btnp(5)then local k=t.teclas[t.seleccion]if k=="Borrar"then t.claveIngresada=t.claveIngresada:sub(1,-2)elseif k=="Enter"then t.mensaje=t.claveIngresada==t.claveCorrecta and"Solucionado. Que clave mas mala."or"Intenta de nuevo maquinola."t.claveIngresada=t.claveIngresada==t.claveCorrecta and t.claveIngresada or""else t.claveIngresada=t.claveIngresada..k end teclado.debounce=10 end
if t.mensaje~=""then for i=1,#t.mensaje do local ci=(i+t.colorOffset)%#t.coloresArcoiris+1 p(t.mensaje:sub(i,i),50+(i-1)*6,150,t.coloresArcoiris[ci])end t.colorOffset=t.colorOffset+1 else dTCB("Código: "..t.claveIngresada,50,150,7)end
end return true
elseif m=="app"then local e=todoJuego.estadoCelular.celular local a=e.appDiosGPT or{}if not e.appDiosGPT then e.appDiosGPT={abierta=false,opcionSeleccionada=1,paginaActual=1,mensajeRespuesta=""}a=e.appDiosGPT end
local function dC()rect(e.x,e.y,e.ancho,e.alto,8)rect(e.x+5,e.y+15,e.ancho-10,e.alto-30,0)rectb(e.x,e.y,e.ancho,e.alto,0)rectb(e.x+5,e.y+15,e.ancho-10,e.alto-30,8)local t=time()local h=("%02d:%02d"):format(math.floor(t/3600)%24,math.floor((t%3600)/60))dTCB(h,e.x+5,e.y+5,10)dTCB("DiosGPT",e.x+13,e.y+55,10)end
if btnp(5)then e.mostrarMenu=not e.mostrarMenu end if not e.mostrarMenu then dTCB("B - Abrir Celular",0,120,2)return end dC()dTCB("B - Cerrar Celular",0,120,2)
if btnp(6)then a.abierta=not a.abierta if a.abierta then a.opcionSeleccionada=1 a.paginaActual=1 end end if not a.abierta then dTCB("X - Abrir App de DiosGPT",0,130,9)return end
cls(14)dTCB("Flechas - Elegir opción",15,20,4)
if btnp(0)then a.opcionSeleccionada=math.max(1,a.opcionSeleccionada-1)elseif btnp(1)then a.opcionSeleccionada=math.min(10,a.opcionSeleccionada+1)elseif btnp(2)then a.paginaActual,a.opcionSeleccionada=1,1 elseif btnp(3)then a.paginaActual,a.opcionSeleccionada=2,6 end
local p1={"001 - Para usar DiosGPT, solo presiona el boton 6 para obtener ayuda.","002 - Con los botones de direccion puedes moverte.","003 - DiosGPT es un asistente virtual que responde preguntas y brinda ayuda.","004 - DiosGPT te ayuda con tareas, preguntas y aclaraciones sobre diversos temas.","005 - Puedes ayudar a DiosGPT dando feedback sobre sus respuestas y mejorando su conocimiento."}
local p2={[6]="006 - Esta es la opcion 006.",[7]="007 - Esta es la opcion 007.",[8]="008 - Esta es la opcion 008.",[9]="009 - Esta es la opcion 009.",[10]="010 - Esta es la opcion 010."}
a.mensajeRespuesta=(a.paginaActual==1 and p1[a.opcionSeleccionada])or p2[a.opcionSeleccionada]or""dTCB(a.mensajeRespuesta,20,100,12) return true
end end

function TIC()
cls(0)local m,j,c=todoJuego.menuPrincipal,todoJuego.estadoJugador.jugador,todoJuego.configuracionGeneral
local e,s,o=m.estados,m.selector,m.opciones
local col=s.colores
local function a()for k,v in pairs(_G)do if k:find("^iniciar")and v then return true end end end
local g={states={menuPrincipal=not a(),juegoPrincipal=e.juegoPrincipal,pinball=e.pinball,misionStuntman=e.misionStuntman,baile=e.juegoBaile,telescopio=e.telescopio,diarios=e.Diarios,creditos=e.Creditos,intro=e.intro,demo=e.demo},
handleStates=function(self)
if self.states.menuPrincipal then self:dm()self:hm()end
if self.states.juegoPrincipal then manejarJuegoPrincipalConMenus()
elseif self.states.baile then cls(0)todoMinijuegoBaile()
elseif self.states.pinball then cls(0)todoMinijuegoPinball()
elseif self.states.misionStuntman then todoMisionStuntman()
elseif self.states.diarios then manejarModulos("diario","dibujar")manejarModulos("diario","scroll")
elseif self.states.telescopio then manejarModulos("diario","dibujar")manejarModulos("diario","scroll")
if btnp(5)then e.telescopio=false c.x,c.y=60,140 end
elseif self.states.creditos then manejarJuegoPrincipalConMenus("creditos")
elseif self.states.intro then manejarJuegoPrincipalConMenus("intro")
elseif self.states.demo then manejarJuegoPrincipalConMenus("demo")end end,
dm=function(self)
p("> ELIGE UN MODO <",60,20,15)
for i=1,#o do local y=20+i*10 local d=i==s.seleccion
p(d and("> "..o[i].." <")or o[i],d and 40 or 50,y,col[i])end
p("Flechas: Mover | (A): Seleccionar",0,0,7)p("(X): Intro | (Y): Demo | (B): Creditos",0,10,7)end,
hm=function(self)
if s.debounce>0 then s.debounce=s.debounce-1 return end
if btnp(0)then sfx(3,200,10,0,1)s.seleccion=s.seleccion>1 and s.seleccion-1 or #o s.debounce=10
elseif btnp(1)then sfx(3,200,10,0,1)s.seleccion=s.seleccion<#o and s.seleccion+1 or 1 s.debounce=10 end
if btnp(4)then sfx(3,200,10,0,1)self:r()
local a={[1]=function()e.juegoPrincipal=true end,[2]=function()e.pinball=true end,[3]=function()e.misionStuntman=true e.juegoPrincipal=true end,[4]=function()e.juegoBaile=true end,[6]=function()e.telescopio=true end,[9]=function()e.Diarios=true end}
if a[s.seleccion]then a[s.seleccion]()end s.debounce=20 end
if btnp(5)then self:r()e.intro=true s.debounce=20
elseif btnp(6)then self:r()e.demo=true s.debounce=20
elseif btnp(7)then self:r()e.Creditos=true s.debounce=20 end end,
r=function(self)for k in pairs(_G)do if k:find("^iniciar")then _G[k]=false end end end,
d=function(self)
rect(200,110,30,110,0)
for _,p in ipairs{{c.x,120,6,"X: "},{c.y,125,6,"Y: "},{c.x/8,110,5,"Xc:"},{c.y/8,115,5,"Yc:"}}do print(p[4]..p[1],200,p[2],p[3])end end}
g:handleStates()g:d()c.temporizadorGeneral=c.temporizadorGeneral+1 end