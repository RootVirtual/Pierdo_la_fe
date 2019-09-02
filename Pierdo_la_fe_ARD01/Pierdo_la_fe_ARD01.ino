
int trama_longitud = 64; //Número que tendrá la trama
int inicio_de_trama = 255; //Número de control de inicio de trama
int trama_array[64]; //Tamaño del array
int nuevo_byte; //byte leido
int indice_lectura = 0; //celdas del array

int celda_de_led=7; //Celda del array que enciende el led

void setup() {
  Serial.begin(9600); //Velocidad de transmisión

  pinMode(12, OUTPUT); //pin del led a encender
  
  while (!Serial) {
    ; // Espera la conexión del puerto
  }
}

void loop() {

  while(Serial.available()==0){ //Mientras no conecta, espera.
    /* esperar */
  }

  nuevo_byte = Serial.read(); //Lee el byte 
  if (nuevo_byte == inicio_de_trama) { //Si el byte es el de control
    indice_lectura = 0; //pone el contador a 0
    if(trama_array[celda_de_led]==1){  //Si la celda del led es 1,
      digitalWrite(12, HIGH);          //enciendo el led
    }else{
      digitalWrite(12, LOW);           //Si no, apaga el led.
    }
  }else{
    //Si no es el byte de control, va almacenando los bytes en el array
    if (indice_lectura < trama_longitud) {
      trama_array[indice_lectura] = nuevo_byte;
      indice_lectura++;
    }else{
      /* Error de la muerte, nunca deberia de pasar */
    }
  }

}
