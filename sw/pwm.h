/**
AUTHORS:
       _ ______ _____            __  __ _____ ______  __      ________ _   _  _____ 
      | |  ____|  __ \     /\   |  \/  |_   _|  ____| \ \    / /  ____| \ | |/ ____|
      | | |__  | |__) |   /  \  | \  / | | | | |__     \ \  / /| |__  |  \| | (___  
  _   | |  __| |  _  /   / /\ \ | |\/| | | | |  __|     \ \/ / |  __| | . ` |\___ \ 
 | |__| | |____| | \ \  / ____ \| |  | |_| |_| |____     \  /  | |____| |\  |____) |
  \____/|______|_|  \_\/_/    \_\_|  |_|_____|______|     \/   |______|_| \_|_____/ 

           _____          __  __    _____ _    _ _   _ _____  ______ _____  __  __          _   _ 
     /\   |  __ \   /\   |  \/  |  / ____| |  | | \ | |  __ \|  ____|  __ \|  \/  |   /\   | \ | |
    /  \  | |  | | /  \  | \  / | | (___ | |  | |  \| | |  | | |__  | |__) | \  / |  /  \  |  \| |
   / /\ \ | |  | |/ /\ \ | |\/| |  \___ \| |  | | . ` | |  | |  __| |  _  /| |\/| | / /\ \ | . ` |
  / ____ \| |__| / ____ \| |  | |  ____) | |__| | |\  | |__| | |____| | \ \| |  | |/ ____ \| |\  |
 /_/    \_\_____/_/    \_\_|  |_| |_____/ \____/|_| \_|_____/|______|_|  \_\_|  |_/_/    \_\_| \_|
*/


#ifndef LED_PWM_H
#define LED_PWM_H

#define LED_PWM_REGISTER_ADDRESS 0x10000000

#define PWM_DEBUG_INIT 			1
#define PWM_DEBUG_ENABLE		2
#define PWM_DEBUG_RESET			4
#define PWM_DEBUG_PRESCALLER	8
#define PWM_DEBUG_COLOR			16

typedef struct __attribute__((__packed__)) LED_STRUCT
{
	uint8_t red;
	uint8_t green;
	uint8_t blue;
}Led;

struct __attribute__((__packed__)) PWM_REG_STRUCT;

typedef struct PWM_STRUCT
{
	volatile struct PWM_REG_STRUCT * PwmRegister;
	struct PWM_DEBUG_STRUCT
	{
		init 		 	: 1;
		enable 			: 1;
		reset 			: 1;
		prescaller 		: 1;
		color 		    : 1;
	}DebugFlags;
}Pwm;

void PwmInitalize(Pwm* pwm, void* pwm_address, uint8_t debug_flags);
void PwmStart(Pwm* pwm, uint32_t top, uint8_t prescaller);
void PwmSetLed(Pwm* pwm, uint8_t led_number, Led* led_color);
void PwmSetLedColor(Pwm* pwm, uint8_t led_number, uint8_t red, uint8_t green, uint8_t blue);

void PwmReset(Pwm* pwm);
void PwmEnable(Pwm* pwm);
void PwmDisable(Pwm* pwm);
void PwmSetPrescaller(Pwm* pwm, uint8_t prescaller);
void PwmSetTop(Pwm* pwm, uint32_t top);
#endif