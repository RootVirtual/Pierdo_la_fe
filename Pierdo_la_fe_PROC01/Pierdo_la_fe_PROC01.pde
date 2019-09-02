//Librería Serial
import processing.serial.*;

Serial myPort; //Variable para el puerto

int trama_longitud = 64; //Número que tendrá la trama
int inicio_de_trama = 255; //Número de control de inicio de trama
int[] trama_array; //Array para trama

int celda_de_led=7; //Celda del array que leerá Arduino para encender el led
int led=0; //Variable para encender por teclado el led

void setup() 
{
  size(400, 400);
  
  trama_array = new int[trama_longitud]; //Tamaño del array
  
  String portName = Serial.list()[1]; //Puerto de Arduino
  myPort = new Serial(this, portName,9600); //Conexión con puerto de Arduino
  delay(5000); //Delay necesario de la muerte para conectar con Arduino Mega
  
  randomSeed(int(random(0,200))); //Para cambiar el random cada vez
  
  
}

void draw() {
  
  myPort.write(255); //Envía número de control de inicio de trama
  
  //manda 64 bytes en random de 0 a 254
  for(int g=0;g<trama_longitud;g++){
    trama_array[g]=int(random(0,255));
    if(g==celda_de_led){   //Para la celda del led,
      trama_array[g]=led;  //manda 0 o 1 según tecla 'v' o 'b'
    }
    myPort.write(trama_array[g]); //Va enviando la trama
    print(trama_array[g]); //Imprimimos en consola la trama
  }  
  println(); //Hacemos salto de línea para ver la trama
  //delay(100); //Delay de comprobación
}

//Si pulsamos B manda 0, apaga el led.
//Si pulsamos V manda 1, enciende el led.
void keyPressed() {
  if (key == 'b' || key == 'B') {
      led=0;
    }
  if (key == 'v' || key == 'V') {
    led=1;
  }
}
