function gestionarArmas(modo, ...)
    local gestionArmas, estadoJugador, menu, configGeneral =
    todoJuego.gestionArmas,todoJuego.estadoJugador,todoJuego.menuPrincipal.estados,todoJuego.configuracionGeneral
    local jugador,camara = estadoJugador.jugador,estadoJugador.camara
    local bloque=0
    if camara.offset.x>=0 and camara.offset.x<=1920 then bloque=0 end
    if camara.offset.x>=1920 then bloque=1920 end
    if camara.offset.x<=0 then bloque=-1920 end
    local ataques,bx,by,t = gestionArmas.ataques,100 - camara.offset.x, 48 - camara.offset.y,configGeneral.temporizadorGeneral

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
    if btnp(4) then local config = armasConfig[gestionArmas.armaActual]
        if config and not config.infinita then gestionArmas.municion[config.municion] = config.recarga end
    end
   -- if btnp(5) then gestionArmas.armasDisparadas.disparandoLaser = false end

    if modo ~= "colisiones" and modo ~= "frases" then -- === DIBUJAR HUD ===
        local function botonColor(boton) return btn(boton) and 3 or 4 end
        r(0, 116, 90, 20, 0);r(0, 0, 85, 35, 0);r(140, 0, 100, 35, 0)
        rectb(0,116,90,20,2)
        rectb(0,0,85,35,2)
        rectb(140,0,100,35,2)
        if menu.radios then r(90, 130, 88, 10, 0) rectb(89, 129, 89, 7, 2) p("B - Cambiar Radio", 91, 130, 4) end
        -- Iconos del HUD
        local iconos = { {estadoJugador.vehiculo.icono, 142,2},{95, 141, 10},{143, 141, 16},{306, 2, 8},{58, 2, 15},{465, 2, 25},{310, 141, 22},{311, 146, 22}}
        for _, icono in ipairs(iconos) do s(icono[1], icono[2], icono[3]) end
        jugador.zona = gestionarUbicacion("zona", jugador.x, jugador.y) -- Información del jugador
        for _,p in ipairs{{"P$: "..jugador.dinero,12,25,4},{jugador.vida,12,17,4},{jugador.vehiculo,153,2,4},{jugador.zona,153,10,4},
        {jugador.calle,153,16,4},{jugador.coleccionables.."/ 20",153,23,4},{"Y - Cambiar arma",3,117,botonColor(6)},
        {"B - Disparar",3,123,botonColor(5)},{"A - Recargar",3,129,botonColor(4)}} do print(p[1],p[2],p[3],p[4]) end
        local configArma = armasConfig[gestionArmas.armaActual] -- Información del arma actual
        if configArma then s(configArma.sprite, 2, 1)
            p(configArma.nombre, 12, 3, 4) p(configArma.infinita and "Infinita" or gestionArmas.municion[configArma.municion], 12, 10, 4)
        end
        rectb(85,0,56,12,4)
        r(86,1,54,10,0)
        print("Puntos:"..enemigosEliminados,87,2,2)
        rectb(85,12,56,11,4)
        r(86,13,54,9,0) 
        print("KM :"..kilometrosRecorridos,87,14,4)
    end
    if modo ~= "colisiones" and modo ~= "frases" then -- === GESTIÓN DE ATAQUES ===
        local armaActual = gestionArmas.armaActual
        if armaActual then -- Configuración de ataques
            local disparosSimples = { pistola = {dx = 3, dy = 0},ak47 = {dx = 6, dy = 0},bazooka = {dx = 2, dy = 0} }
            -- Acciones especiales por arma ( 4 : escopeta,5 : granada,6 : golpe,7 : electrorifle,8 : laser,9: katana,10 : lanzallamas,11 : minigun)
            local accionEspecial = {
                [4] = function() local x, y = jugador.x + 8, jugador.y
                    for _, d in ipairs({{dx=2, dy=0}, {dx=2, dy=-1}, {dx=2, dy=1}}) do
                        table.insert(ataques.disparos, {x=x, y=y, dx=d.dx, dy=d.dy, tipo="escopeta"}) end
                    gestionArmas.municion.escopeta = gestionArmas.municion.escopeta - 1 end,
                [5] = function() table.insert(ataques.granadas, { x = jugador.x + 8,y = jugador.y,dx = 2, dy = -2, tiempo = 0 })
                    gestionArmas.municion.granadas = gestionArmas.municion.granadas - 1 end,
                [6] = function() table.insert(ataques.golpes, { x = jugador.x + 8,y = jugador.y,tiempo = t }) end,
                [7] = function()
                    gestionArmas.armasDisparadas.disparandoElectrorifle = true
                    local offsetX,offsetY = jugador.x - camara.posicion.x + 8,jugador.y - camara.posicion.y + 8
                    table.insert(ataques.rayosElectrorifle, {x_inicio = offsetX,y_inicio = offsetY,x_fin = offsetX + 24,
                        y_fin = offsetY + math.random(-16, 16),vida = math.random(20, 30)})
                    gestionArmas.municion.electrorifle = gestionArmas.municion.electrorifle - 1 end,
                [8] = function() -- Láser
                     if ( gestionArmas.municion.laser > 0 ) then 
                    gestionArmas.armasDisparadas.disparandoLaser = true
                    gestionArmas.laser.longitud = math.min(gestionArmas.laser.longitud + 4, 200)
                    gestionArmas.municion.laser = gestionArmas.municion.laser - 1
                    local laserEnd = jugador.x + gestionArmas.laser.longitud
                    for _, enemigo in ipairs(todoJuego.cochesEnemigos) do
                        if not enemigo.colisionado and
                           laserEnd >= enemigo.x and laserEnd <= enemigo.x + 16 and
                           jugador.y + 8 >= enemigo.y and jugador.y + 8 <= enemigo.y + 16 then
                             if ( gestionArmas.municion.laser > 0 ) then 
                            enemigo.colisionado = true end
                            if gestionArmas.armasDisparadas.disparandoLaser == false then 
                                enemigo.colisionado = false end
                        end
                    end
                end end,
                [9] = function() gestionArmas.katana.tiempoUltimoCorte = t
                    table.insert(ataques.cortesKatana, {
                        x_inicio = (jugador.x - camara.offset.x +100+ 8)%1920,y_inicio = ( jugador.y - camara.offset.y +48+ 8)%1080,
                        angulo = math.pi/4,tiempo_restante = gestionArmas.katana.duracionCorte,giro = gestionArmas.katana.velocidadGiro
                    }) end,

                [10] = function() -- Lanzallamas
                    gestionArmas.armasDisparadas.disparandoLanzallamas = true
                    local baseX,baseY = jugador.x - camara.offset.x + 100 + 2,jugador.y - camara.offset.y + 48
                    for _ = 1, 5 do
                        table.insert(ataques.disparosLanzallamas, { x = baseX,y = baseY + math.random(-4, 4),dx = math.random(2, 4),
                            dy = math.random(-1, 1),vida = math.random(30, 50),color = math.random(2, 4)})
                    end
                    gestionArmas.municion.lanzallamas = gestionArmas.municion.lanzallamas - 1 end,
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
                end }
            -- Verificar condiciones de ataque
            local config, municion, puedeAtacar = 
            armasConfig[armaActual], 
            armasConfig[armaActual].municion and gestionArmas.municion[armasConfig[armaActual].municion], 
            false
            if config.tipo == "disparo" and municion then puedeAtacar = btnp(5) and municion > 0
            elseif config.tipo == "continuo" and municion then puedeAtacar = btn(5) and municion > 0
            if not btn(5) then gestionArmas.armasDisparadas.disparandoLaser = false 
             gestionArmas.laser.longitud = 0
            end
            if btn(5) and gestionArmas.laser.municion==0 then 
              gestionArmas.armasDisparadas.disparandoLaser = false 
             gestionArmas.laser.longitud = 0
            end
         --   if gestionArmas.laser.municion==0 then 
         --     gestionArmas.armasDisparadas.disparandoLaser = false 
         --     gestionArmas.laser.longitud = 0
         --   end
            elseif armaActual == 6 then puedeAtacar = btnp(5) and #ataques.golpes == 0
            elseif armaActual == 9 then 
                puedeAtacar = btn(5) and (t - gestionArmas.katana.tiempoUltimoCorte >= gestionArmas.katana.tiempoEntreCortes)
            end
            if puedeAtacar then -- Ejecutar ataque si es posible
                if disparosSimples[config.municion] then
                    local d = disparosSimples[config.municion]
                    table.insert(ataques.disparos, {x = jugador.x + 8,y = jugador.y,dx = d.dx, dy = d.dy,tipo = config.municion })
                    gestionArmas.municion[config.municion] = municion - 1
                elseif accionEspecial[armaActual] then accionEspecial[armaActual]() end
            end
        end
        --print(ataques.cortesKatana.x_inicio,40,40,6)
        -- === MOVIMIENTO Y DIBUJO DE PROYECTILES ===
        
        for i = #ataques.golpes, 1, -1 do -- Golpes
            local g = ataques.golpes[i]
     
            if t - g.tiempo > gestionArmas.tiempoDisparo.tiempoGolpeVisible then table.remove(ataques.golpes, i)
            else g.x, g.y = jugador.x + 8+bloque, jugador.y
                 s(289, (g.x + bx)%1920, (g.y + by)%1080, 0)
               
        end
        
        end
        
        for i = #ataques.rayosElectrorifle, 1, -1 do -- Rayos electrorifle
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
        for i = #ataques.disparos, 1, -1 do -- Disparos normales
            local d = ataques.disparos[i]
            d.x, d.y = d.x + d.dx+bloque, d.y + d.dy
            local sx, sy = (d.x + bx)%1920, (d.y + by)%1080
            if d.tipo == "pistola" then circ(sx, sy, 2, 7) circ(sx, sy, 1, 6)
            elseif d.tipo == "ak47" then line(sx - 3, sy, sx + 3, sy, 8) line(sx - 2, sy, sx + 2, sy, 7)
            elseif d.tipo == "bazooka" then r(sx - 4, sy - 2, 8, 4, 9) r(sx - 5, sy - 1, 1, 2, 8)
            elseif d.tipo == "escopeta" then for j = 1, 5 do circ(sx + math.random(-3, 3), sy + math.random(-3, 3), 1, 10) end
            end
        end
        for i = #ataques.granadas, 1, -1 do -- Granadas
            local g = ataques.granadas[i]
            g.x, g.y, g.dy = g.x + g.dx+bloque, g.y + g.dy, g.dy + 0.1
            if g.y > 136 then table.remove(ataques.granadas, i) 
            else
                local sx, sy = (g.x - camara.posicion.x)%1920, (g.y - camara.posicion.y)%1080
                circ(sx, sy, 4, 6)
                if g.tiempo % 10 < 5 then circ(sx + 2, sy - 2, 1, 2) end
            end
        end
        for i = #ataques.balasMinigun, 1, -1 do -- Minigun
            local b = ataques.balasMinigun[i]
            b.x, b.y, b.vida = (b.x + b.dx+bloque)%1920, (b.y + b.dy)%1080, b.vida - 1
            if b.vida <= 0 then table.remove(ataques.balasMinigun, i) 
            else for j = 0, 8 do pix(b.x + j, b.y, j < 4 and 8 or 7) end
            end
        end
       -- print(gestionArmas.armasDisparadas.disparandoLaser,50,60,9)
        if gestionArmas.armasDisparadas.disparandoLaser and ( gestionArmas.municion.laser > 0 ) then -- Láser
            local sx, sy = (jugador.x + bx + 8)%1920, (jugador.y + by + 8)%1080
            line(sx, sy, sx + gestionArmas.laser.longitud, sy, 2)

             line(sx, sy-1, sx +  gestionArmas.laser.longitud, sy-1, 8)
             line(sx, sy+1, sx +  gestionArmas.laser.longitud, sy+1, 8)
        -- Láser principal
       -- line(x_inicio, y_inicio, x_inicio + longitudLaser, y_inicio, 2)
        -- Destello
            circ(sx, sy, 2, 7)
            circ(sx + gestionArmas.laser.longitud, sy, 1, 7)
            --line(sx, sy+2, sx + gestionArmas.laser.longitud, sy+2, 3)
            --line(sx, sy-2, sx + gestionArmas.laser.longitud, sy-2, 3)
            --line(x1, y1, x2, y2, colorEspecial)
     --   circ(sx+1, sy+1, 3, 2)
       -- circ(sx+2, sy+2, 3, 3)
        end
        for i = #ataques.disparosLanzallamas, 1, -1 do -- Lanzallamas
            local l = ataques.disparosLanzallamas[i]
            l.x, l.y = (l.x + l.dx)%1920, (l.y + l.dy)%1080
            local color = math.random(2, 4)
            circ(l.x, l.y, math.random(1,2),color)

             
        --circ(l.x, llama.y, math.random(1, 2), color)
        if math.random(1, 10) > 5 then
          -- pix(l.x + math.random(-1, 1), l.y + math.random(-1, 1), color)
        end
        end
    end
    if modo == "colisiones" then -- === MODO COLISIONES ===
        local modoDebug = select(1, ...) or false
        local function verificarColision(tipo, x1, y1, x2, y2, rx, ry, rw, rh) -- Función interna para verificar colisiones
            local function puntoDentroRectangulo(px, py, rx, ry, rw, rh) return px >= rx and px <= rx + rw and py >= ry and py <= ry + rh
            end
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
        local function verificar(proyectiles, ajustarCamara, funcionColision, efectoEspecial) -- verificar colisiones de armas
            for i = #proyectiles, 1, -1 do
                local proyectil = proyectiles[i]     
                for j = #todoJuego.cochesEnemigos, 1, -1 do
                    local enemigo = todoJuego.cochesEnemigos[j]
                    if funcionColision(proyectil, enemigo) then
                        local enemigo_x = enemigo.x - todoJuego.estadoJugador.camara.offset.x+100
                        local enemigo_y = enemigo.y - todoJuego.estadoJugador.camara.offset.y+48
                        -- Efectos visuales
                        --print(enemigo_x,160,50,12)
                        gestionarEfectosYExplosiones("crear_efecto", enemigo_x, enemigo_y, "sangre")
                       -- gestionarEfectosYExplosiones("crear_explosion", enemigo_x , enemigo_y , {radioInicial = 3, duracion = 25})
                        if efectoEspecial then efectoEspecial(enemigo) end -- Efecto especial si existe
                        table.remove(proyectiles, i);table.remove(todoJuego.cochesEnemigos, j) enemigosEliminados=enemigosEliminados+1 break
                    end
                end
            end
        end
        verificar(todoJuego.gestionArmas.ataques.disparos, false, function(bala, enemigo) -- Balas normales
            return verificarColision("puntoRectangulo", bala.x, bala.y, nil, nil, enemigo.x, enemigo.y, 8, 8) end)
        verificar(todoJuego.gestionArmas.ataques.balasMinigun, true, function(bala, enemigo) -- Minigun
            local balaX,balaY = bala.x + todoJuego.estadoJugador.camara.posicion.x,bala.y + todoJuego.estadoJugador.camara.posicion.y
            return verificarColision("puntoRectangulo", balaX, balaY, nil, nil, enemigo.x, enemigo.y, 8, 8) end)
        verificar(todoJuego.gestionArmas.ataques.rayosElectrorifle, true, function(rayo, enemigo) -- Electrorifle
            local x1 = rayo.x_inicio + todoJuego.estadoJugador.camara.posicion.x
            local y1 = rayo.y_inicio + todoJuego.estadoJugador.camara.posicion.y
            local x2 = rayo.x_fin + todoJuego.estadoJugador.camara.posicion.x
            local y2 = rayo.y_fin + todoJuego.estadoJugador.camara.posicion.y
            return verificarColision("lineaRectangulo", x1, y1, x2, y2, enemigo.x, enemigo.y, 16, 16) end)
        verificar(todoJuego.gestionArmas.ataques.disparosLanzallamas, true, function(llama, enemigo) -- Lanzallamas
            local llama_x,llama_y = llama.x + todoJuego.estadoJugador.camara.posicion.x,llama.y + todoJuego.estadoJugador.camara.posicion.y
            return verificarColision("puntoRectangulo", llama_x, llama_y, nil, nil, enemigo.x, enemigo.y, 16, 16) end)        
        if todoJuego.gestionArmas.armasDisparadas.disparandoLaser then -- Láser
            local x_inicio = todoJuego.estadoJugador.jugador.x - todoJuego.estadoJugador.camara.offset.x+100 + 8
            local y_inicio = todoJuego.estadoJugador.jugador.y - todoJuego.estadoJugador.camara.offset.y+48 + 8
            local x_fin,y_fin = x_inicio + todoJuego.gestionArmas.laser.longitud,y_inicio
            for j = #todoJuego.cochesEnemigos, 1, -1 do
                local enemigo = todoJuego.cochesEnemigos[j]
                local enemigo_x = enemigo.x - todoJuego.estadoJugador.camara.offset.x+100
                local enemigo_y = enemigo.y - todoJuego.estadoJugador.camara.offset.y+48
                if verificarColision("lineaRectangulo", x_inicio, y_inicio, x_fin, y_fin, enemigo_x, enemigo_y, 16, 16) then
                    gestionarEfectosYExplosiones("crear_efecto", enemigo_x, enemigo_y, "sangre")
                 --   gestionarEfectosYExplosiones("crear_explosion", enemigo_x, enemigo_y, {radioInicial = 2, duracion = 25})
                    table.remove(todoJuego.cochesEnemigos, j) 
                    enemigosEliminados=enemigosEliminados+1 end
            end
        end
        for i = #todoJuego.gestionArmas.ataques.cortesKatana, 1, -1 do -- Katana
            local corte = todoJuego.gestionArmas.ataques.cortesKatana[i]
            local x_fin = corte.x_inicio + math.cos(corte.angulo) * todoJuego.gestionArmas.katana.longitudCorte
            local y_fin = corte.y_inicio + math.sin(corte.angulo) * todoJuego.gestionArmas.katana.longitudCorte

            line(corte.x_inicio, corte.y_inicio, x_fin, y_fin, 2)
                
            for j = #todoJuego.cochesEnemigos, 1, -1 do
                local enemigo = todoJuego.cochesEnemigos[j]
                local enemigo_x = enemigo.x - todoJuego.estadoJugador.camara.offset.x+100
                local enemigo_y = enemigo.y - todoJuego.estadoJugador.camara.offset.y+48
                if verificarColision("lineaRectangulo", corte.x_inicio, corte.y_inicio, x_fin, y_fin, enemigo_x, enemigo_y, 16, 16) then
                    gestionarEfectosYExplosiones("crear_efecto", enemigo_x, enemigo_y, "sangre")
                --    gestionarEfectosYExplosiones("crear_explosion", enemigo_x, enemigo_y, {radioInicial = 2, duracion = 25})
                    table.remove(todoJuego.cochesEnemigos, j); enemigosEliminados=enemigosEliminados+1  table.remove(todoJuego.gestionArmas.ataques.cortesKatana, i) break
                end
            end
             corte.angulo = corte.angulo + corte.giro
                corte.tiempo_restante = corte.tiempo_restante - 1
                if corte.tiempo_restante <= 0 then
                    table.remove(todoJuego.gestionArmas.ataques.cortesKatana, i)
                end
        end
        verificar(todoJuego.gestionArmas.ataques.golpes, false, function(golpe, enemigo) -- Golpes
            return verificarColision("puntoRectangulo", golpe.x, golpe.y, nil, nil, enemigo.x, enemigo.y, 8, 8) end)
        verificar(todoJuego.gestionArmas.ataques.granadas, false, function(granada, enemigo) -- Granadas
            return verificarColision("puntoRectangulo", granada.x, granada.y, nil, nil, enemigo.x, enemigo.y, 8, 8) end)
        if modoDebug then -- Dibujar hitboxes si modoDebug es true
            local c,colors = todoJuego.estadoJugador.camara.posicion,{ enemigo = 8, bala = 11, area = 13, linea = 10, especial = 12 }
            for _, e in ipairs(todoJuego.cochesEnemigos) do rectb(e.x - c.x, e.y - c.y, 16, 16, colors.enemigo) end -- 1. Enemigos
            for _, b in ipairs(todoJuego.gestionArmas.ataques.disparos) do circ(b.x - c.x, b.y - c.y, 2, colors.bala) end -- 2. Balas normales
            for _, b in ipairs(todoJuego.gestionArmas.ataques.balasMinigun) do circ(b.x, b.y, 1, colors.bala) end -- 3. Minigun
            for _, r in ipairs(todoJuego.gestionArmas.ataques.rayosElectrorifle) do -- 4. Electrorifle
                line(r.x_inicio, r.y_inicio, r.x_fin, r.y_fin, colors.linea)
                circ(r.x_inicio, r.y_inicio, 2, colors.especial) circ(r.x_fin, r.y_fin, 2, colors.especial)
            end
            for _, l in ipairs(todoJuego.gestionArmas.ataques.disparosLanzallamas) do circ(l.x, l.y, 3, colors.linea) end -- 5. Lanzallamas
            if todoJuego.gestionArmas.armasDisparadas.disparandoLaser then -- 6. Láser
                local x1,y1 = todoJuego.estadoJugador.jugador.x - c.x + 8,todoJuego.estadoJugador.jugador.y - c.y + 8
                line(x1, y1, x1 + todoJuego.gestionArmas.laser.longitud, y1, colors.especial) circ(x1, y1, 3, colors.especial)
            end
            for _, k in ipairs(todoJuego.gestionArmas.ataques.cortesKatana) do -- 7. Katana
                local x2 = k.x_inicio + math.cos(k.angulo) * todoJuego.gestionArmas.katana.longitudCorte
                local y2 = k.y_inicio + math.sin(k.angulo) * todoJuego.gestionArmas.katana.longitudCorte
                line(k.x_inicio, k.y_inicio, x2, y2, colors.linea)
                ellib((k.x_inicio + x2)/2, (k.y_inicio + y2)/2, math.sqrt((x2 - k.x_inicio)^2 + (y2 - k.y_inicio)^2), 10, colors.area)
            end
            for _, g in ipairs(todoJuego.gestionArmas.ataques.golpes) do circ(g.x - c.x, g.y - c.y, 6, colors.area) end -- 8. Golpes
            for _, gr in ipairs(todoJuego.gestionArmas.ataques.granadas) do circ(gr.x - c.x, gr.y - c.y, 4, colors.bala) -- 9. Granadas
                if gr.y > 136 then circ(gr.x - c.x, gr.y - c.y, 20, colors.especial) end
            end
            -- Debug info
            print("HITBOXES ACTIVADOS", 160, 80, 45);print("Rojo: Enemigos", 160, 50, colors.enemigo)
            print("Cian: Balas", 160, 60, colors.bala);print("Verde: Rayos", 160, 70, colors.linea)
            print("Amarillo: Especial", 160, 80, colors.especial);print("Rosa: Areas", 160, 90, colors.area)
        end
    end
    if modo == "frases" then -- === MODO FRASES ===
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
        if _G.fraseAleatoria ~= "" and _G.nuevoContador < 120 then -- Mostrar frase
            local textWidth = #_G.fraseAleatoria * 6 - 2
            local padding = 1
            local rectX, rectY = 40 - padding, 40 - padding
            local rectW, rectH = textWidth + padding * 2, 8 + padding * 2
            r(rectX, rectY, rectX + rectW-40, rectY + rectH-40, 0) -- Dibujar fondo
            local function rainbowColor(idx) return (math.floor(idx) % 15) + 1 end
            for i = 0, 3 do -- Dibujar borde optimizado
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