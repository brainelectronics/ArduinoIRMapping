uint8_t irSense = A0;

void setup()
{
  Serial.begin(9600);
  pinMode(irSense, INPUT);
  delay(1000);
}

void readSensor()
{
  float irSensorVoltage = analogRead(irSense) * (5.0 / 1023.0); // read ADC
  float distanceInCM = 306.439 + irSensorVoltage * (-512.611 + irSensorVoltage * ( 382.268 + irSensorVoltage * (-129.893 + irSensorVoltage * 16.2537))); // convert to distance[cm]
  Serial.println(distanceInCM, 0); // print the distance to the monitor
}

void loop()
{
  readSensor();
  delay(50);
}
