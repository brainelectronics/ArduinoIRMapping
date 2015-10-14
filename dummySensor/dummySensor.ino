uint8_t x = 0;
uint8_t y = 0;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  delay(1000);
  for(y=0; y<=180; y=y+10)
  {
    for(x=0; x<=180; x=x+10)
    {
      Serial.print("y");
      Serial.print(y);
      Serial.print(",x");
      Serial.print(x);
      Serial.print(":");
      Serial.println(random(0, 255));
      delay(50);
    }
  }
}
