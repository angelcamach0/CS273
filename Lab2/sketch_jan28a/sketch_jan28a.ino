
//
// Declare the things that exist in our assembly code
//
/*
extern "C" { 
  byte x1;
  byte x2;
  byte x3;
  void addition();
}
*/

extern byte x1, x2, x3;
extern "C" void addition(void);

//
// function to read a 2-digit decimal value from user
//
byte read2DigitValue()
{
  byte inch; int val;
  Serial.println("Enter a 2-digit decimal value:");
  while (!Serial.available()) delay(100); //waits for user input
  inch = Serial.read();
  if (inch <= '9' && inch >= '0'){
    val = (inch - '0') * 16;
    }
  if (inch >= 'A' && inch <= 'F' ){
    val = ((inch - '0' ) - 7 ) * 16;
    }
  if (inch >= 'a' && inch <= 'f'){
    val = ((inch - '0' ) - 39 ) * 16;
    }
  //val = (inch - '0') * 10; // to turn it into a decimal integer with two digits
  while (!Serial.available()) delay(100);
  inch = Serial.read();

  if (inch <= '9' && inch   >= '0'){
    val += (inch - '0') * 1;
    }
  if (inch >= 'A' && inch <= 'F' ){
    val += ((inch - '0' ) - 7 ) * 1;
    }
  if (inch >= 'a' && inch <= 'f'){
    val += ((inch - '0' ) - 39 ) * 1;
    }
    
  //val += (inch - '0');
  Serial.print("The value entered in DEC ");
  Serial.println(val,DEC);
  Serial.print("The value entered in HEX ");
  Serial.println(val,HEX);

  return (byte) val;
}

//
// Arduino-required setup function (called once)
//
void setup()
{
  pinMode(13, OUTPUT);
  digitalWrite(13, LOW);
  //
  // Initialize serial communications
  //
  Serial.begin(9600);// 9600 kylobytes per second starts serial konsole
  //
  // Read three values from user, store in global vars
  //
  x1 = read2DigitValue();
  x2 = read2DigitValue();
  x3 = read2DigitValue();
  //
  // Call our assembly code
  //
  addition();
  //
  // print out value of x2 variable
  Serial.println("After addition()");
  Serial.print("The value is ");
  Serial.println((int) x3,DEC);
}

//
// Arduino-required loop function (called infinitely)
//
void loop()
{
  delay(20000); // 20,000 millisecs == 20 seconds
  Serial.println("*");
}
