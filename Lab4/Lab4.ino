# Angel Camacho
# Feb 27, 2020
# Input : hex and binarry
# output : goAggies in morse code and however many times || binnary and turns it to hex

extern byte val;
extern byte width;
extern byte ascii;

extern "C" { 
  void decode_morse();
  void goaggies();
}

//
// function to read a 2-digit decimal value from user
//
byte read2DigitValue()
{
  byte inch; int val;
  Serial.println("Enter a 2-digit decimal value:");
  while (!Serial.available()) delay(100);
  inch = Serial.read();
  val = (inch - '0') * 10;
  while (!Serial.available()) delay(100);
  inch = Serial.read();
  val += (inch - '0');
  Serial.print("The value entered is ");
  Serial.println(val,DEC);
  return (byte) val;
}

void flashGoAggies() 
{
  // Add you code here
  Serial.println("Testting Go Aggies...");
  int howManyTimes = read2DigitValue();
  for(int i = 0; i < howManyTimes; i++){
    goaggies();
    }
  // You will call the GoAggies() function from assembly file GoAggies.S
}

void decodeMorse(const String & string, char message[])
{
  // Write your code below.
  // string contains the input binary string separated by single spaces
  // message contains the decoded English characters and numbers    
  // You will call the assembly function decode_morse()
  int m = 0; 
  int count = 0;
  val = 0; 
  width = 0;
  Serial.println("decoding...");
  for(int i = 0; i <= string.length(); i++){ // this runs untill the end of the string
    if(string[i] != ' ' && string[i] != '\0'){ // if its not a blank space of a null character dont stop
      width++;                                 // i created and incremented a variale width wwithc will be later used to determine ascii value
      val = val * 2 + (string[i] - '0');       // this will take away the zeros and then turn it to binay by multiplying it by 2
      }else{
      decode_morse();
      message[m] = ascii;                      
      val = 0; width = 0; // reset
      m++;
      count++;
    }
  }
  message[m] = '\0';
}



void decodeMorse() 
{
  Serial.println("Input a Morse code string (separate the code for characters by a space):");

  while (!Serial.available()) delay(100);
  String string = Serial.readString();

  Serial.print("The Morse code string is: ");
  Serial.println(string);

  //string = "1000 100 0"; // "01 1000";
  char message[100];

  decodeMorse(string, message);

  if(strlen(message) > 0) {
    Serial.print("The decoded message is: ");
    Serial.println(message);
  } else {
    Serial.print("Failure in decoding the input Morse code\n");
  }  
}

void setup() {
  //
  // Initialize serial communications
  //
  Serial.begin(9600);

  flashGoAggies();

  decodeMorse();
  
}

void loop() {
  // put your main code here, to run repeatedly:
  delay(12345); // 12,345 millisecs ==  12.345seconds
  Serial.println("*");
}
