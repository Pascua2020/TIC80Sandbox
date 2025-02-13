Pinball

![pinball](./Imagenes/pinball.gif)

Elementos:

#### ✨️-Resorte

Es el que dispara la bola.

![pinball-1](./Imagenes/pinball-1.jpg)

#### ✨️-Bola

Rebota en el escenario.

![pinball-2](./Imagenes/pinball-2.jpg)

#### ✨️-Palancas

Hay 2 de cada lado,con el botón de dirección se mueven ambas del mismo lado ( = izquierdo o derecho ).

![pinball-3](./Imagenes/pinball-3.jpg)


#### ✨️-Muros

Para evitar que la bola se salga de la pantalla.Al tocar un muro este se enciende.

![pinball-4](./Imagenes/pinball-4.jpg)

#### ✨️-Agujero ( Game Over )

Por donde cae la bola y se pierde una vida.

![pinball-5](./Imagenes/pinball-5.jpg)

#### ✨️-Combos,Puntos y Niveles

Al rebotar múltiples veces la bola se generan combos.
Al subir de niveles se multiplican los puntos recibidos.

![pinball-6](./Imagenes/pinball-6.jpg)

Puntos necesarios para subir de Nivel :
```
NV2=300
NV3=800
NV4=1300
NV5=1800
NV6=3000
NV7=5500
NV8=9000
NV9=15000
```
#### ✨️-Frase a Completar ( Hashtags )

Se van completando con cada Rebote.
Al completarse el jugador gana puntos y se empieza a completar otra frase.

![pinball-7](./Imagenes/pinball-7.jpg)

```
"Tecnofeudalismo",
"Cuchi Cuchi Cuchi",
"No seas gilipollas",
"Viva el britpop",
"Party Hard",
"Usa condon,no seas pelotudo",
"Soy la hostia tio"
```

#### ✨️-Rap

Se reproduce mientras el jugador está jugando.

![pinball-8](./Imagenes/pinball-8.jpg)
``` 
"1- Rap del pinball en Buenos Aires",
"2- Pinball por aqui, pinball por alla!",
"3- Que vuele el pinball, rebote y gire",
"4- Pinball, pinball, siempre para adelante!"
```

Funciones:

🔑-1  update_ball()



🔑-2  update_paddles()



🔑-3  draw_paddle( paddle )



🔑-4  create_animated_circles()



🔑-5  update_circles()



🔑-6  draw_spring()



🔑-7  wall_collision()



🔑-8  draw_paddle_collision(paddle)



🔑-9  frase()



🔑-10  imprimir_frase(frase,num_caracteres)



🔑-11  TIC()


