#include "lowpass.h"
#include "storage.h"

#include <Wire.h>
#include <MPU6050_light.h>
MPU6050 mpu(Wire); 

PS2X ps2x;
Encoder myEncR(ENCRA,ENCRB);
Encoder myEncL(ENCLA,ENCLB);
long oldPositionR  = 0;
long oldPositionL  = 0;

long prevT = 0;
long prevT2 = 0;

float vtR = 20;
float vtL = 20;
float eintegralR = 0;
float eintegralL = 0;
float e_prevR = 0;
float e_prevL = 0;
float uL , uR ,pwrL, pwrR;

float vLFilt = 0;
float vLPrev = 0;
float vRFilt = 0;
float vRPrev = 0;

int error = 0; 
byte type = 0;
byte vibrate = 0;
bool ein_condition = false;
bool straight = false;

float z0;
float inputz;
float inputz_old = 0;
float imuFilt = 0;
float imuPrev = 0;
float dwheel = 0;
ros::NodeHandle nh;
geometry_msgs::Twist msg;
std_msgs::Float32 encL_msg;
std_msgs::Float32 encR_msg;
std_msgs::Float32 rpmL_msg;
std_msgs::Float32 rpmR_msg;
std_msgs::Float32 rpmRB_nolp_msg;
std_msgs::Float32 rpmRB_lp_msg;
std_msgs::Float32 angle_msg;
std_msgs::Float32 setpoint_msg;
std_msgs::Float32 setpointa_msg;
ros::Publisher EncL("Enc_L", &encL_msg);
ros::Publisher EncR("Enc_R", &encR_msg);
ros::Publisher RpmL("Rpm_L", &rpmL_msg);
ros::Publisher RpmR("Rpm_R", &rpmR_msg);
ros::Publisher RpmRB_nolp("Rpm_RB_nolp", &rpmRB_nolp_msg);
ros::Publisher RpmRB_lp("Rpm_RB_lp", &rpmRB_lp_msg);
ros::Publisher AngleRB("Angle_RB", &angle_msg);
ros::Publisher setpoint("setpoint", &setpoint_msg);
ros::Publisher setpoint_angle("setpoint_angle", &setpointa_msg);

void setup() {
  Wire.begin();
  byte status = mpu.begin();
  while (status != 0) { } // stop everything if could not connect to MPU6050
  mpu.upsideDownMounting = true; // uncomment this line if the MPU6050 is mounted upside-down
  mpu.calcOffsets(true , true); // gyro and accelero
  Serial.println("Done!\n");
  calibration(100);
  
  Serial.begin(57600);
  nh.initNode();
  nh.advertise(EncL);
  nh.advertise(EncR);
  nh.advertise(RpmR);
  nh.advertise(RpmL);
  nh.advertise(RpmRB_lp);
  nh.advertise(RpmRB_nolp);
  nh.advertise(setpoint);
  nh.advertise(setpoint_angle);
  nh.advertise(AngleRB);
  pinMode(PWMR,OUTPUT);
  pinMode(INR1,OUTPUT);
  pinMode(INR2,OUTPUT);
  pinMode(PWML,OUTPUT);
  pinMode(INL1,OUTPUT);
  pinMode(INL2,OUTPUT);
  digitalWrite(INR1,0);
  digitalWrite(INR2,0);
  digitalWrite(INL1,0);
  digitalWrite(INL2,0);
  error = ps2x.config_gamepad(13,11,10,12, true, true);  
  type = ps2x.readType(); 
   switch(type) {
     case 0:
       break;
     case 1:
       break;
     case 2:
       break;
   }


}

void loop() {
  long currT = micros(); 
  float deltaT = ((float)((currT-prevT)/1.0e6));
  prevT = currT;
  long newPositionR = myEncR.read();
  long newPositionL= myEncL.read();
  float vR = abs(newPositionR - oldPositionR) / deltaT / 1440.0*60.0;
  float vL = abs(newPositionL - oldPositionL) / deltaT / 1440.0*60.0;
  if (newPositionL != oldPositionL) {
    oldPositionL = newPositionL;
    encL_msg.data = newPositionL;
  }
  if (newPositionR != oldPositionR) {
    oldPositionR = newPositionR;
    encR_msg.data = newPositionR;
  }
  

  vRFilt = 0.854*vRFilt + 0.0728*vR + 0.0728*vRPrev;
  vRPrev = vR;
  vLFilt = 0.854*vLFilt + 0.0728*vL + 0.0728*vLPrev;
  vLPrev = vL;
  float yL = lpL.filt(vLFilt);
  float yR = lpR.filt(vRFilt);
  
  if(type != 2 && currT - prevT2 >= 50000){
    prevT2 = currT;
    ps2x.read_gamepad(false, vibrate);
    vibrate = ps2x.Analog(PSAB_BLUE);
    forward();
    backward();
    turn_left();
    turn_right();
    stop_motor();
//    one_meter(100 , newPositionL, newPositionR);


  }
  float kp = 2; //2
  float ki = 10; //10
  float kd = 0.062; //0.062
  
  float eL = vtL-vLFilt;
  float edifL = (eL - e_prevL)/deltaT;
  e_prevL = eL;
  if(vL > 1) {
    if(ein_condition == false){
      eintegralL -= eL*deltaT;
    }
    else if(ein_condition == true){
      eintegralL += eL*deltaT;
    }
  }
  float eR = vtR-vRFilt;
  float edifR = (eR - e_prevR)/deltaT;
  e_prevR = eR;  
  if(vR > 1) { 
    if(ein_condition == false){
      eintegralR -= eR*deltaT;
    }
    else if(ein_condition == true){
      eintegralR += eR*deltaT;
    }
  }
  
  if(ein_condition && straight){
    mpu.update();

    imuFilt = 0.854 * imuFilt + 0.0728 * mpu.getAngleZ() + 0.0728 * imuPrev;
    imuPrev = mpu.getAngleZ();
    inputz = - z0 + imuFilt;
  }
  else inputz = 0;

  uL = kp*eL + ki*eintegralL + kd*edifL - (inputz*4);
  uR = kp*eR + ki*eintegralR + kd*edifR + (inputz*4);
  pwrL = (int) fabs(uL);
  pwrR = (int) fabs(uR);
  if(pwrL > 255) pwrL = 255;
  else if(pwrL < 0) pwrL = 0;
  if(pwrR > 255) pwrR = 255;
  else if(pwrR < 0) pwrR = 0;
  analogWrite(PWML,pwrL); 
  analogWrite(PWMR,pwrR); 
  float robot_angle = mpu.getGyroZ()*PI/180;
 
  rpmL_msg.data = yL;
  rpmR_msg.data = yR;
  rpmRB_lp_msg.data = ((yL+yR)*0.15*PI/120);
  rpmRB_nolp_msg.data = ((vL+vR)*0.15*PI/120);
  setpointa_msg.data = 0;
  setpoint_msg.data = vtR*0.15*PI/60;
  angle_msg.data = robot_angle;
  AngleRB.publish(&angle_msg );
  EncL.publish(&encL_msg );
  EncR.publish(&encR_msg );
  RpmR.publish(&rpmR_msg);
  RpmL.publish(&rpmL_msg);
  RpmRB_lp.publish(&rpmRB_lp_msg );
  RpmRB_nolp.publish(&rpmRB_nolp_msg );
  setpoint.publish(&setpoint_msg );
  setpoint_angle.publish(&setpointa_msg);
  nh.spinOnce();
  delay(10);

 
}
void forward(){
  if(ps2x.Button(PSB_PAD_UP)) {
//    Serial.println("up");
        calibration(10);
        ein_condition = true;
        straight = true;
//        vtL = 29.8;
//        vtR = 30;
        vtL = 39.8;
        vtR = 40;
        analogWrite(PWML , 25);
        analogWrite(PWMR , 25);
        digitalWrite(INR2 , 0);
        digitalWrite(INR1 , 1);
        digitalWrite(INL2 , 1);
        digitalWrite(INL1 , 0);
        
      }
}
void backward(){
  if(ps2x.Button(PSB_PAD_DOWN)) {
        ein_condition = true;
        straight = true;
        vtL = 24.9;
        vtR = 25;
        analogWrite(PWML , 30);
        analogWrite(PWMR , 30);
        digitalWrite(INR2 , 1);
        digitalWrite(INR1 , 0);
        digitalWrite(INL2 , 0);
        digitalWrite(INL1 , 1);   

      }
}
void turn_right(){
  if(ps2x.Button(PSB_PAD_RIGHT)) { 
        ein_condition = true;
        straight = false;
//        vtL = 24.9;
//        vtR = 25;
        vtL = 29.8;
        vtR = 30;
        analogWrite(PWML , 30);
        analogWrite(PWMR , 30);
        digitalWrite(INR2 , 0);
        digitalWrite(INR1 , 1);
        digitalWrite(INL2 , 0);
        digitalWrite(INL1 , 1);

      }
}
void turn_left(){
  if(ps2x.Button(PSB_PAD_LEFT)) { 
        ein_condition = true;
        straight = false;
        vtL = 24.9;
        vtR = 25;
        
        analogWrite(PWML , 30);
        analogWrite(PWMR , 30);
        digitalWrite(INR2 , 1);
        digitalWrite(INR1 , 0);
        digitalWrite(INL2 , 1);
        digitalWrite(INL1 , 0);
      }
}
void stop_motor(){
  if(ps2x.Button(PSB_GREEN)){
        ein_condition = false;
        straight = false;
        calibration(5);
        digitalWrite(INR2 , 0);
        digitalWrite(INR1 , 0);
        digitalWrite(INL2 , 0);
        digitalWrite(INL1 , 0);   
    }
}

void one_meter(int d , long encl , long encr){
    float rb_distance = ((encl*PI*15/1440) + (encr*PI*15/1440))/2;
    if( rb_distance >= d){
        ein_condition = false;
        straight = false;
        digitalWrite(INR2 , 0);
        digitalWrite(INR1 , 0);
        digitalWrite(INL2 , 0);
        digitalWrite(INL1 , 0);     
    }
}

void calibration(unsigned short times)
{
  times = 100;
  for (int i = 0; i < times; i++)
  {
    z0 += mpu.getAngleZ();
  }
  z0 /= times;
}
