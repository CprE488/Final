//----------------------------------------------------------------
//      _____
//     /     \
//    /____   \____
//   / \===\   \==/
//  /___\===\___\/  AVNET
//       \======/
//        \====/
//---------------------------------------------------------------
//
// This design is the property of Avnet.  Publication of this
// design is not authorized without written consent from Avnet.
//
// Please direct any questions to:  technical.support@avnet.com
//
// Disclaimer:
//    Avnet, Inc. makes no warranty for the use of this code or design.
//    This code is provided  "As Is". Avnet, Inc assumes no responsibility for
//    any errors, which may appear in this code, nor does it make a commitment
//    to update the information contained herein. Avnet, Inc specifically
//    disclaims any implied warranties of fitness for a particular purpose.
//                     Copyright(c) 2012 Avnet, Inc.
//                             All rights reserved.
//
//----------------------------------------------------------------
//
// Create Date:         Oct 24, 2012
// Design Name:         FMC-IMAGEON HDMI Video Frame Buffer
// Module Name:         fmc_imageon_hdmi_framebuffer.c
// Project Name:        FMC-IMAGEON HDMI Video Frame Buffer Program
// Target Devices:      Spartan-6, Virtex-6, Kintex-6
// Hardware Boards:     FMC-IMAGEON
// 
//
// Tool versions:       ISE 14.3
//
// Description:         FMC-IMAGEON HDMI Demo Program
//                      This application will configure the FMC-IMAGEON module
//                      for the simple case of an HDMI passthrough:
//                      - HDMI Input
//                         - ADV7611 configured for 16 bit YCbCr 4:2:2 mode
//                           with embedded syncs
//                      - HDMI Output
//                         - ADV7511 configured for 16 bit YCbCr 4:2:2 mode
//                           with embedded syncs
//                      If present, it will also reset the Video Timing Controller
//                      that is used for timing in the AXI4-Stream bridges
//
// Dependencies:
//
// Revision:            Oct 24, 2012: 1.00 Initial version
//                      Nov 01, 2012: 1.02 Update EDID content
//                      Jan 10, 2013: 1.03 Add SSC on video output clock
//                                         for CE compliance
//
//----------------------------------------------------------------

#include <stdio.h>

#include "fmc_imageon_hdmi_framebuffer.h"
#include "video_detector.h"
#include <stdlib.h>


Xuint8 fmc_imageon_hdmii_edid_content[256] =
{
		0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00,
		0x06, 0xD4, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
		0x00, 0x16, 0x01, 0x03, 0x81, 0x46, 0x27, 0x78,
		0x0A, 0x32, 0x30, 0xA1, 0x54, 0x52, 0x9E, 0x26,
		0x0A, 0x49, 0x4B, 0xA3, 0x08, 0x00, 0x81, 0xC0,
		0x81, 0x00, 0x81, 0x0F, 0x81, 0x40, 0x81, 0x80,
		0x95, 0x00, 0xB3, 0x00, 0x01, 0x01, 0x02, 0x3A,
		0x80, 0x18, 0x71, 0x38, 0x2D, 0x40, 0x58, 0x2C,
		0x45, 0x00, 0xC4, 0x8E, 0x21, 0x00, 0x00, 0x1E,
		0xA9, 0x1A, 0x00, 0xA0, 0x50, 0x00, 0x16, 0x30,
		0x30, 0x20, 0x37, 0x00, 0xC4, 0x8E, 0x21, 0x00,
		0x00, 0x1A, 0x00, 0x00, 0x00, 0xFC, 0x00, 0x46,
		0x4D, 0x43, 0x2D, 0x49, 0x4D, 0x41, 0x47, 0x45,
		0x4F, 0x4E, 0x0A, 0x20, 0x00, 0x00, 0x00, 0xFD,
		0x00, 0x38, 0x4B, 0x20, 0x44, 0x11, 0x00, 0x0A,
		0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x01, 0x54,
		0x02, 0x03, 0x1F, 0x71, 0x4B, 0x90, 0x03, 0x04,
		0x05, 0x12, 0x13, 0x14, 0x1F, 0x20, 0x07, 0x16,
		0x26, 0x15, 0x07, 0x50, 0x09, 0x07, 0x01, 0x67,
		0x03, 0x0C, 0x00, 0x10, 0x00, 0x00, 0x1E, 0x01,
		0x1D, 0x00, 0x72, 0x51, 0xD0, 0x1E, 0x20, 0x6E,
		0x28, 0x55, 0x00, 0xC4, 0x8E, 0x21, 0x00, 0x00,
		0x1E, 0x01, 0x1D, 0x80, 0x18, 0x71, 0x1C, 0x16,
		0x20, 0x58, 0x2C, 0x25, 0x00, 0xC4, 0x8E, 0x21,
		0x00, 0x00, 0x9E, 0x8C, 0x0A, 0xD0, 0x8A, 0x20,
		0xE0, 0x2D, 0x10, 0x10, 0x3E, 0x96, 0x00, 0xC4,
		0x8E, 0x21, 0x00, 0x00, 0x18, 0x01, 0x1D, 0x80,
		0x3E, 0x73, 0x38, 0x2D, 0x40, 0x7E, 0x2C, 0x45,
		0x80, 0xC4, 0x8E, 0x21, 0x00, 0x00, 0x1E, 0x1A,
		0x36, 0x80, 0xA0, 0x70, 0x38, 0x1F, 0x40, 0x30,
		0x20, 0x25, 0x00, 0xC4, 0x8E, 0x21, 0x00, 0x00,
		0x1A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01
};

int fmc_imageon_hdmi_framebuffer_init( fmc_imageon_hdmi_framebuffer_t *pDemo ) {
   int ret;
   Xuint32 timeout = 100;
   Xuint32 iterations = 0;

   xil_printf("\n\r");
   xil_printf("------------------------------------------------------\n\r");
   xil_printf("--       FMC-IMAGEON HDMI Video Frame Buffer        --\n\r");
   xil_printf("------------------------------------------------------\n\r");
   xil_printf("\n\r");

   xil_printf( "FMC-IMAGEON Initialization ...\n\r" );

   ret = fmc_iic_xps_init(&(pDemo->fmc_imageon_iic),"FMC-IMAGEON I2C Controller", pDemo->uBaseAddr_IIC_FmcImageon );
   if ( !ret ) {
      xil_printf( "ERROR : Failed to open FMC-IIC driver\n\r" );
      exit(0);
   }

   fmc_imageon_init(&(pDemo->fmc_imageon), "FMC-IMAGEON", &(pDemo->fmc_imageon_iic));
   pDemo->fmc_imageon.bVerbose = pDemo->bVerbose;

   // Configure Video Clock Synthesizer
   fmc_imageon_vclk_init( &(pDemo->fmc_imageon) );
   fmc_imageon_vclk_config( &(pDemo->fmc_imageon), FMC_IMAGEON_VCLK_FREQ_148_500_000);

   // Initialize HDMI Input (including EDID content)
   xil_printf( "HDMI Input Initialization ...\n\r" );
   ret = fmc_imageon_hdmii_init( &(pDemo->fmc_imageon),
                                 1, // hdmiiEnable = 1
                                 1, // editInit = 1
                                 fmc_imageon_hdmii_edid_content
                                 );
   if ( !ret ) {
      xil_printf( "ERROR : Failed to init HDMI Input Interface\n\r" );
      exit(0);
   }


   // Configure Video Clock Synthesizer
   xil_printf( "Video Clock Synthesizer Configuration ...\n\r" );
   fmc_imageon_vclk_config( &(pDemo->fmc_imageon), FMC_IMAGEON_VCLK_FREQ_148_500_000);
   sleep(1);

   xil_printf( "Enabling spread-spectrum clocking (SSC)\n\r" );
   xil_printf( "\ttype=down-spread, amount=-0.75%%\n\r" );
   {
	   Xuint8 num_bytes;
	   int i;
	   Xuint8 iic_cdce913_ssc_on[3][2]=
	   {
	      {0x10, 0x6D}, // SSC = 011 (0.75%)
	      {0x11, 0xB6}, //
	      {0x12, 0xDB}  //
	   };
       fmc_imageon_iic_mux( &(pDemo->fmc_imageon), FMC_IMAGEON_I2C_SELECT_VID_CLK );
       for ( i = 0; i < 3; i++ ) {
           num_bytes = pDemo->fmc_imageon.pIIC->fpIicWrite( pDemo->fmc_imageon.pIIC, FMC_IMAGEON_VID_CLK_ADDR,
       		(0x80 | iic_cdce913_ssc_on[i][0]), &(iic_cdce913_ssc_on[i][1]), 1);
       }
   }

   // Set HDMI output to 1080P60 resolution
   pDemo->hdmio_resolution = VIDEO_RESOLUTION_1080P;
   pDemo->hdmio_width  = 1920;
   pDemo->hdmio_height = 1080;

   //pDemo->hdmio_timing.IsHDMI        = 1; // HDMI Mode
   pDemo->hdmio_timing.IsHDMI        = 0; // DVI Mode
   pDemo->hdmio_timing.IsEncrypted   = 0;
   pDemo->hdmio_timing.IsInterlaced  = 0;
   pDemo->hdmio_timing.ColorDepth    = 8;

   pDemo->hdmio_timing.HActiveVideo  = 1920;
   pDemo->hdmio_timing.HFrontPorch   =   88;
   pDemo->hdmio_timing.HSyncWidth    =   44;
   pDemo->hdmio_timing.HSyncPolarity =    1;
   pDemo->hdmio_timing.HBackPorch    =  148;

   pDemo->hdmio_timing.VActiveVideo  = 1080;
   pDemo->hdmio_timing.VFrontPorch   =    4;
   pDemo->hdmio_timing.VSyncWidth    =    5;
   pDemo->hdmio_timing.VSyncPolarity =    1;
   pDemo->hdmio_timing.VBackPorch    =   36;

   xil_printf( "HDMI Output Initialization ...\n\r" );
   ret = fmc_imageon_hdmio_init( &(pDemo->fmc_imageon),
 	                             1,                      // hdmioEnable = 1
 	                             &(pDemo->hdmio_timing), // pTiming
 	                             0                       // waitHPD = 0
 	                             );
   if ( !ret ) {
      xil_printf( "ERROR : Failed to init HDMI Output Interface\n\r" );
      //exit(0);
   }

   // Clear frame stores
   Xuint32 i;
   Xuint32 storage_size = pDemo->uNumFrames_HdmiFrameBuffer * ((1920*1080)<<1);
   volatile Xuint32 *pStorageMem = (Xuint32 *)pDemo->uBaseAddr_MEM_HdmiFrameBuffer;

   // Frame #1 - Red pixels
   for ( i = 0; i < storage_size / pDemo->uNumFrames_HdmiFrameBuffer; i += 4 ) {
	   *pStorageMem++ = 0x29F0296E;
   }
   // Frame #1 - Green pixels
   for ( i = 0; i < storage_size / pDemo->uNumFrames_HdmiFrameBuffer; i += 4 ) {
      *pStorageMem++ = 0x91229136;
   }
   // Frame #1 - Blue pixels
   for ( i = 0; i < storage_size / pDemo->uNumFrames_HdmiFrameBuffer; i += 4 ) {
      *pStorageMem++ = 0x296E29F0;
   }


   // Initialize Output Side of AXI VDMA
   xil_printf( "Video DMA (Output Side) Initialization ...\n\r" );
   vfb_common_init(
      pDemo->uDeviceId_VDMA_HdmiFrameBuffer, // uDeviceId
      &(pDemo->vdma_hdmi)                    // pAxiVdma
      );
   vfb_tx_init(
      &(pDemo->vdma_hdmi),                   // pAxiVdma
      &(pDemo->vdmacfg_hdmi_read),           // pReadCfg
      pDemo->hdmio_resolution,               // uVideoResolution
      pDemo->hdmio_resolution,               // uStorageResolution
      pDemo->uBaseAddr_MEM_HdmiFrameBuffer,  // uMemAddr
      pDemo->uNumFrames_HdmiFrameBuffer      // uNumFrames
      );

   // Configure VTC on output data path
   xil_printf( "Video Timing Controller (generator) Initialization ...\n\r" );
   vgen_init( &(pDemo->vtc_hdmio_generator), pDemo->uDeviceId_VTC_HdmioGenerator );
   vgen_config( &(pDemo->vtc_hdmio_generator), pDemo->hdmio_resolution, 1 );


   xil_printf( "Waiting for ADV7611 to locked on incoming video ...\n\r" );
   pDemo->hdmii_locked = 0;
   timeout = 100;
   while ( !(pDemo->hdmii_locked) && timeout-- )
   {
      usleep(100000); // wait 100msec ...
      pDemo->hdmii_locked = fmc_imageon_hdmii_get_lock( &(pDemo->fmc_imageon) );
   }
   if ( !(pDemo->hdmii_locked) )
   {
      xil_printf( "\tERROR : ADV7611 has NOT locked on incoming video, aborting !\n\r" );
      return -1;
   }
   xil_printf( "\tADV7611 Video Input LOCKED\n\r" );
   usleep(100000); // wait 100msec for timing to stabilize

   // Get Video Input information
   fmc_imageon_hdmii_get_timing( &(pDemo->fmc_imageon), &(pDemo->hdmii_timing) );
   pDemo->hdmii_width  = pDemo->hdmii_timing.HActiveVideo;
   pDemo->hdmii_height = pDemo->hdmii_timing.VActiveVideo;
   pDemo->hdmii_resolution = vres_detect( pDemo->hdmii_width, pDemo->hdmii_height );

   xil_printf( "ADV7611 Video Input Information\n\r" );
    xil_printf( "\tVideo Input      = %s", pDemo->hdmii_timing.IsHDMI ? "HDMI" : "DVI" );
   xil_printf( "%s", pDemo->hdmii_timing.IsEncrypted ? ", HDCP Encrypted" : "" );
   xil_printf( ", %s\n\r", pDemo->hdmii_timing.IsInterlaced ? "Interlaced" : "Progressive" );
   xil_printf( "\tColor Depth      = %d bits per channel\n\r", pDemo->hdmii_timing.ColorDepth );
   xil_printf( "\tHSYNC Timing     = hav=%04d, hfp=%02d, hsw=%02d(hsp=%d), hbp=%03d\n\r",
      pDemo->hdmii_timing.HActiveVideo,
      pDemo->hdmii_timing.HFrontPorch,
      pDemo->hdmii_timing.HSyncWidth, pDemo->hdmii_timing.HSyncPolarity,
      pDemo->hdmii_timing.HBackPorch
      );
   xil_printf( "\tVSYNC Timing     = vav=%04d, vfp=%02d, vsw=%02d(vsp=%d), vbp=%03d\n\r",
      pDemo->hdmii_timing.VActiveVideo,
      pDemo->hdmii_timing.VFrontPorch,
      pDemo->hdmii_timing.VSyncWidth, pDemo->hdmii_timing.VSyncPolarity,
      pDemo->hdmii_timing.VBackPorch
      );
   xil_printf( "\tVideo Dimensions = %d x %d\n\r", pDemo->hdmii_width, pDemo->hdmii_height );

   if ( (pDemo->hdmii_resolution) == -1 )
   {
      xil_printf( "\tERROR : Invalid resolution, aborting !\n\r" );
      return -1;
   }

   usleep(100000);
   // Reset VTC on input data path
   vdet_init( &(pDemo->vtc_hdmii_detector), pDemo->uDeviceId_VTC_HdmiiDetector );
   vdet_reset( &(pDemo->vtc_hdmii_detector) );


   xil_printf( "Video DMA (Input Side) Initialization ...\n\r" );
   // Initialize Input Side of AXI VDMA
   vfb_rx_init(
      &(pDemo->vdma_hdmi),                   // pAxiVdma
      &(pDemo->vdmacfg_hdmi_write),          // pWriteCfg
      pDemo->hdmio_resolution,               // uVideoResolution
      pDemo->hdmio_resolution,               // uStorageResolution
      pDemo->uBaseAddr_MEM_HdmiFrameBuffer,  // uMemAddr
      pDemo->uNumFrames_HdmiFrameBuffer      // uNumFrames
      );

   xil_printf( "HDMI Output Re-Initialization ...\n\r" );
   ret = fmc_imageon_hdmio_init( &(pDemo->fmc_imageon),
 	                             1,                      // hdmioEnable = 1
 	                             &(pDemo->hdmio_timing), // pTiming
 	                             0                       // waitHPD = 0
 	                             );
   if ( !ret )
   {
      xil_printf( "ERROR : Failed to init HDMI Output Interface\n\r" );
      //exit(0);
   }

   sleep(1);
   // Status of AXI VDMA
   vfb_dump_registers( &(pDemo->vdma_hdmi) );
   if ( vfb_check_errors( &(pDemo->vdma_hdmi), 1/*clear errors, if any*/ ) ) {
      vfb_dump_registers( &(pDemo->vdma_hdmi) );
   }

   xil_printf("\n\r");
   xil_printf( "Done\n\r" );
   xil_printf("\n\r");

   return 0;
}

