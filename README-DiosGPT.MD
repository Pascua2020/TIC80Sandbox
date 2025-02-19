# 🎭 DiosGPT

![gifinterfaz](./Imagenes/diosgpt.gif)

Tutorial Interactivo.

![interfaz](./Imagenes/DiosGPT.jpg)

## 🎭 Variables / Atributos

```
-- Variables para controlar la app y las opciones

1
mostrar_celular = false

2
cel_x = 180

3
cel_y = 40

4
cel_ancho = 60

5
cel_alto = 120

6
icono_x = cel_x + 30

7
icono_y = cel_y + 40

8
icono_tamano = 10

9
colores=2

10
color_triangulo = 10  
-- Inicialmente en un color

11
mensaje_respuesta = ""

12
mensaje_inicial = "En qué puedo ayudarte wachin?"

13
mensaje_final = "¿Algo más para ayudarte, lince de las praderas de Kursk?"

14
mostrar_menu = false

15
opcion_seleccionada = 1  
-- Por defecto, la opción 001 estará seleccionada

16
pagina_actual = 1  
-- Página 1 muestra de 001 a 005, Página 2 muestra de 006 a 010

17
app_abierta = false
```

## 🎭 Funciones

#### 🔑-1  dibujar_triangulo(x,y,color)

Función para dibujar el triángulo (icono de DiosGPT).

#### 🔑-2  mostrar_hora(x,y)

Función para mostrar la hora.

#### 🔑-3  dividir_mensaje(texto,x,y,color)

Función para dividir mensajes largos en líneas.

#### 🔑-4  mostrar_menu_opciones()

Función para mostrar el menú de opciones.

#### 🔑-5  manejar_seleccion_opcion()

Función para manejar la selección de opción.

#### 🔑-6  abrir_app_diosgpt()

Función para manejar la apertura de la app DiosGPT.

#### 🔑-7  mostrar_mensaje_inicial_b()

Función para mostrar el mensaje "B - Abrir Celular".

#### 🔑-8  mostrar_mensajes_celular()

Función para mostrar mensajes dentro del celular.

#### 🔑-9  actualizar_color_triangulo()

Función para actualizar el color del triángulo a cada segundo (arcoíris).

#### 🔑-10  TIC()

Bucle principal.