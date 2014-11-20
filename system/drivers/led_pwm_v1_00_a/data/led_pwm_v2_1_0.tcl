##############################################################################
## Filename:          /home/vens/classes/Fall2014/cpre488/labs/final/Final/system/drivers/led_pwm_v1_00_a/data/led_pwm_v2_1_0.tcl
## Description:       Microprocess Driver Command (tcl)
## Date:              Wed Nov 19 18:26:21 2014 (by Create and Import Peripheral Wizard)
##############################################################################

#uses "xillib.tcl"

proc generate {drv_handle} {
  xdefine_include_file $drv_handle "xparameters.h" "led_pwm" "NUM_INSTANCES" "DEVICE_ID" "C_BASEADDR" "C_HIGHADDR" 
}
