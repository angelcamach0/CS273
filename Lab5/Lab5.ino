/*
  Showing number 0-9 on a Common Anode 7-segment LED display
  Displays the numbers 0-9 on the display, with one second inbetween.
    A
   ---
F |   | B
  | G |
   ---
E |   | C
  |   |
   ---
    D
  This example code is in the public domain.
 */
 
// Pin 2-8 is connected to the 7 segments of the display.

/*
 * Angel Camacho
 * Mar 8, 2018
 * a) no input other than manual bit patter of numbers
 * b) outputs to display
 * c) no assumptions
 * 7) we learned that it is extreamly difficult to code every bit pattern and every branch but we also
 *    understand how the assembly file communicates witht he C files and to the arduino. (including each segment
 *    )
 */




int pinA = 2;
int pinB = 3;
int pinC = 4;
int pinD = 5;
int pinE = 6;
int pinF = 7;
int pinG = 8;
int D1 = 9;
int D2 = 10;
int D3 = 11;
int D4 = 12;

// external byte values
extern byte segment;
extern byte digit;
extern "C"{
  void setup_ports();
  void select_segment();
  void display_segment();
  }
void selectseg(){
  select_segment();
  }
void displaySeg(){
  display_segment();
  }
// the setup routine runs once when you press reset:
void setup() {
  setup_ports();           
//  // initialize the digital pins as outputs.
//  pinMode(pinA, OUTPUT);     
//  pinMode(pinB, OUTPUT);     
//  pinMode(pinC, OUTPUT);     
//  pinMode(pinD, OUTPUT);     
//  pinMode(pinE, OUTPUT);     
//  pinMode(pinF, OUTPUT);     
//  pinMode(pinG, OUTPUT);   
//  pinMode(D1, OUTPUT);  
//  pinMode(D2, OUTPUT);  
//  pinMode(D3, OUTPUT);  
//  pinMode(D4, OUTPUT);  
}

// the loop routine runs over and over again forever:
void loop() {
//  digitalWrite(D1, HIGH);
//  digitalWrite(D2, LOW);
//  digitalWrite(D3, LOW);
//  digitalWrite(D4, LOW); 
//  //0
//  digitalWrite(pinA, LOW);   
//  digitalWrite(pinB, LOW);   
//  digitalWrite(pinC, LOW);   
//  digitalWrite(pinD, LOW);   
//  digitalWrite(pinE, LOW);   
//  digitalWrite(pinF, LOW);   
//  digitalWrite(pinG, HIGH);   
//  delay(1000);               // wait for a  5 second
//  
//  digitalWrite(D1, LOW);
//  digitalWrite(D2, HIGH);
//  digitalWrite(D3, LOW);
//  digitalWrite(D4, LOW); 
//  //1
//  digitalWrite(pinA, HIGH);   
//  digitalWrite(pinB, LOW);   
//  digitalWrite(pinC, LOW);   
//  digitalWrite(pinD, HIGH);   
//  digitalWrite(pinE, HIGH);   
//  digitalWrite(pinF, HIGH);   
//  digitalWrite(pinG, HIGH);   
//  delay(1000);               // wait for a 5 second
//  
//  digitalWrite(D1, LOW);
//  digitalWrite(D2, LOW);
//  digitalWrite(D3, HIGH);
//  digitalWrite(D4, LOW); 
//  //2
//  digitalWrite(pinA, LOW);   
//  digitalWrite(pinB, LOW);   
//  digitalWrite(pinC, HIGH);   
//  digitalWrite(pinD, LOW);   
//  digitalWrite(pinE, LOW);   
//  digitalWrite(pinF, HIGH);   
//  digitalWrite(pinG, LOW);     
//  delay(1000);               // wait for a 5 second
//
//  digitalWrite(D1, LOW);
//  digitalWrite(D2, LOW);
//  digitalWrite(D3, LOW);
//  digitalWrite(D4, HIGH); 
//  //3
//  digitalWrite(pinA, LOW);   
//  digitalWrite(pinB, LOW);   
//  digitalWrite(pinC, LOW);   
//  digitalWrite(pinD, LOW);   
//  digitalWrite(pinE, HIGH);   
//  digitalWrite(pinF, HIGH);   
//  digitalWrite(pinG, LOW);     
//  delay(1000);               // wait for a  5 second
//
//  digitalWrite(D1, HIGH);
//  digitalWrite(D2, LOW);
//  digitalWrite(D3, LOW);
//  digitalWrite(D4, LOW); 
//
//  //4
//  digitalWrite(pinA, HIGH);   
//  digitalWrite(pinB, LOW);   
//  digitalWrite(pinC, LOW);   
//  digitalWrite(pinD, HIGH);   
//  digitalWrite(pinE, HIGH);   
//  digitalWrite(pinF, LOW);   
//  digitalWrite(pinG, LOW);     
//  delay(1000);               // wait for a  5 second
//
//  digitalWrite(D1, LOW);
//  digitalWrite(D2, HIGH);
//  digitalWrite(D3, LOW);
//  digitalWrite(D4, LOW); 
//  //5
//  digitalWrite(pinA, LOW);   
//  digitalWrite(pinB, HIGH);   
//  digitalWrite(pinC, LOW);   
//  digitalWrite(pinD, LOW);   
//  digitalWrite(pinE, HIGH);   
//  digitalWrite(pinF, LOW);   
//  digitalWrite(pinG, LOW);     
//  delay(1000);               // wait for a second
//
//  digitalWrite(D1, LOW);
//  digitalWrite(D2, LOW);
//  digitalWrite(D3, HIGH);
//  digitalWrite(D4, LOW);
//  
//  //6
//  digitalWrite(pinA, LOW);   
//  digitalWrite(pinB, HIGH);   
//  digitalWrite(pinC, LOW);   
//  digitalWrite(pinD, LOW);   
//  digitalWrite(pinE, LOW);   
//  digitalWrite(pinF, LOW);   
//  digitalWrite(pinG, LOW);     
//  delay(1000);               // wait for a second
//  digitalWrite(D1, LOW);
//  digitalWrite(D2, LOW);
//  digitalWrite(D3, LOW);
//  digitalWrite(D4, HIGH);
//  
//  //7
//  digitalWrite(pinA, LOW);   
//  digitalWrite(pinB, LOW);   
//  digitalWrite(pinC, LOW);   
//  digitalWrite(pinD, HIGH);   
//  digitalWrite(pinE, HIGH);   
//  digitalWrite(pinF, HIGH);   
//  digitalWrite(pinG, HIGH);     
//  delay(1000);               // wait for a second
//  digitalWrite(D1, HIGH);
//  digitalWrite(D2, LOW);
//  digitalWrite(D3, LOW);
//  digitalWrite(D4, LOW);
//  
//  //8
//  digitalWrite(pinA, LOW);   
//  digitalWrite(pinB, LOW);   
//  digitalWrite(pinC, LOW);   
//  digitalWrite(pinD, LOW);   
//  digitalWrite(pinE, LOW);   
//  digitalWrite(pinF, LOW);   
//  digitalWrite(pinG, LOW);     
//  delay(1000);               // wait for a second
//  digitalWrite(D1, LOW);
//  digitalWrite(D2, HIGH);
//  digitalWrite(D3, LOW);
//  digitalWrite(D4, LOW);
//  
//
//  //9
//  digitalWrite(pinA, LOW);   
//  digitalWrite(pinB, LOW);   
//  digitalWrite(pinC, LOW);   
//  digitalWrite(pinD, HIGH);   
//  digitalWrite(pinE, HIGH);   
//  digitalWrite(pinF, LOW);   
//  digitalWrite(pinG, LOW);     
//  delay(1000);               // wait for a second

//ZERO
  segment = 0;
  selectseg();
  digit = 0;
  displaySeg();  
  delay(1000);               // wait for a second

//ONE
  segment = 1;
  selectseg();
  digit = 1;
  displaySeg(); 
  delay(1000);               // wait for a second

//TWO
  segment = 2;
  selectseg();
  digit = 2;
  displaySeg();   
  delay(1000);               // wait for a second

//THREE
  segment = 3;
  selectseg();
  digit = 3;
  displaySeg();   
  delay(1000);               // wait for a second
  
//FOUR
  segment = 0;
  selectseg();
  digit = 4;
  displaySeg();     
  delay(1000);               // wait for a second
  
//FIVE
  segment = 1;
  selectseg();
  digit = 5;
  displaySeg();   
  delay(1000);               // wait for a second
  
//SIX
  segment = 2;
  selectseg();
  digit = 6;
  displaySeg();      
  delay(1000);               // wait for a second
  
//SEVEN
  segment = 3;
  selectseg();
  digit = 7;
  displaySeg();     
  delay(1000);               // wait for a second
  
//EIGHT
  segment = 0;
  selectseg();
  digit = 8;
  displaySeg();    
  delay(1000);               // wait for a second

//NINE
  segment = 1;
  selectseg();
  digit = 9;
  displaySeg();     
  delay(1000);               // wait for a second
  
  
  
}
