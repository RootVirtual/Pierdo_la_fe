

El programa "Pierdo la fe" viene dado por una cita de LLuis M., cuyas declaraciones acababan en la decisi�n de dedicarse a plantar tomates.

Desde Processing:

Se manda por Serial una trama de x bytes (en este caso 64), con un byte de control de inicio de trama (255).

Una de las celdas es espec�fica, para mandar 0 o 1 para encender y apagar un led de Arduino, controlado por la entrada de teclado:

'V' enciende el led.
'B' apaga el led.


Desde Arduino:

Recibe la trama por Serial, con el control de inicio de trama.

Si la recibe un 0 o 1 en la celda espec�fica, enciende o apaga el led.