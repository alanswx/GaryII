/*****************************************************************************
* AppleFPGA APPLE ][e core.
*
*
* Ver 1.5
* October 17 2008
*
******************************************************************************
*
* CPU section copyrighted by Daniel Wallner
*
******************************************************************************
*
* Apple ][e compatible system on a chip
*
* Version : 1.5
*
* Copyright (c) 2006 Gary Becker (gary_l_becker@yahoo.com)
*
* All rights reserved
*
* Redistribution and use in source and synthezised forms, with or without
* modification, are permitted provided that the following conditions are met:
*
* Redistributions of source code must retain the above copyright notice,
* this list of conditions and the following disclaimer.
*
* Redistributions in synthesized form must reproduce the above copyright
* notice, this list of conditions and the following disclaimer in the
* documentation and/or other materials provided with the distribution.
*
* Neither the name of the author nor the names of other contributors may
* be used to endorse or promote products derived from this software without
* specific prior written permission.
*
* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
* AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
* THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
* PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE
* LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
* CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
* SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
* INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
* CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
* ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
* POSSIBILITY OF SUCH DAMAGE.
*
* Please report bugs to the author, but before you do so, please
* make sure that this is not a derivative work and that
* you have the latest version of this file.
*
* The latest version of this file can be found at:
*      http://tech.groups.yahoo.com/group/applefpga
*
* File history :
*
*  0.9 		First release (ALPHA)
*  0.95		Second release (BETA)
*  1.0		Full release
*  1.5		Full version
*				Added Super Serial Card in slot 2
*				Modified timing to allow 25 MHz
*				Modified SVD hardware / firmware to run at 115K baud
*				Modified joystick to work with newer type interface
*
******************************************************************************/

module APPLE_VIDEO(
CLK,
ADDRESS,
DATA,
CLK_MOD,
RED0,
RED1,
GREEN0,
GREEN1,
BLUE0,
BLUE1,
HSYNC,
VSYNC,
CLOCK_MUX,
TEXT,
MIXED,
TEXT_80,
SECONDARY,
ALT_CHAR,
HI_RES,
DHRES,
TEXT_COLOR,
V_BLANKING,
H_BLANKING,
CLK_1HZ);

input 				CLK;				// 25 MHZ needed for 80 character text and DHGR
output	[15:0]	ADDRESS;
input		[15:0]	DATA;				//We will real both banks even if we do not need to
output				CLK_MOD;
output				RED0;
output				RED1;
output				GREEN0;
output				GREEN1;
output				BLUE0;
output				BLUE1;
output				HSYNC;
output				VSYNC;
input		[7:0]		CLOCK_MUX;
input					TEXT;				// Text only mode
input					MIXED;			// Mixed Text and Graphics if TEXT == 0
input					TEXT_80;			// Text in 80 column mode
input					HI_RES;			// Graphics in DHGR
input					SECONDARY;		// Secondary page
input					ALT_CHAR;
input					DHRES;
input		[2:0]		TEXT_COLOR;
output				V_BLANKING;
output				H_BLANKING;
input					CLK_1HZ;

reg		[3:0]		PIXEL_COUNT;
reg		[5:0]		H_ADD;
reg		[9:0]		V_ADD;
reg		[6:0]		RAM_ADD;
reg					ALT;
reg					H_BLANKING;
reg					H_BLANKINGX;
reg					V_BLANKING;
reg					HSYNC;
reg					VSYNC;
reg		[15:0]	VIDEO_MEMORY;
reg		[17:0]	PIXELS;
reg		[17:0]	CHAR_PIXELS;
reg					MM_POS;
reg					CLOCK;
reg					RED_VEC;
reg					GREEN_VEC;
reg					BLUE_VEC;
reg					RED_H_VEC;
reg					GREEN_H_VEC;
reg					BLUE_H_VEC;
reg					ROM_CLK;
reg		[7:0]		CHAR_BUFFER;
reg		[7:0]		CHAR_BUFFERX;
reg					CLK_MOD;
reg		[1:0]		PIXEL_HISTORY;
wire		[1:0]		MODE;
wire		[1:0]		DHGR;
wire		[9:0]		TENBIT_ADDRESS;
wire		[10:0]	CHAR_ADD;
wire		[7:0]		CHAR_DATA;
wire					DOPB_CG;

`include "chargen.v"

/*******************************************************
* Generate Address
* text address
*				Skip V_ADD[0] because we want two lines exactly the same
*				Skip V_ADD[3:1] for text, use for HGR
********************************************************/
assign	TENBIT_ADDRESS =	({V_ADD[6:4],RAM_ADD[6:0]});

assign	ADDRESS =
// HIRES not mixed upper section
		({TEXT,HI_RES,MIXED,MM_POS,CLOCK}== 5'b01000)	?	{1'b0,   SECONDARY, ~SECONDARY, V_ADD[3:1],TENBIT_ADDRESS}:
// HIRES not mixed lower section
		({TEXT,HI_RES,MIXED,MM_POS,CLOCK}== 5'b01010)	?	{1'b0,   SECONDARY, ~SECONDARY, V_ADD[3:1],TENBIT_ADDRESS}:
// HIRES mixed upper section
		({TEXT,HI_RES,MIXED,MM_POS,CLOCK}== 5'b01100)	?	{1'b0,   SECONDARY, ~SECONDARY, V_ADD[3:1],TENBIT_ADDRESS}:
// Text
																			{4'b0000,SECONDARY, ~SECONDARY,            TENBIT_ADDRESS};

/********************************************************
* Set video mode
*********************************************************/
assign MODE =	(CLOCK | (TEXT  | (MIXED & MM_POS)))					?	2'b00:			// Text
			 		(HI_RES & ~DHRES)												?	2'b10:			// HIRES
					(DHRES)															?	2'b11:			// DHRES
																							2'b01;			// LOWRES

/*******************************************************
* Read Video Memory
********************************************************/
always @ (negedge CLK_MOD)
	if(CLOCK)
		VIDEO_MEMORY <= {8'hA0,CLOCK_MUX};
	else
		VIDEO_MEMORY <= DATA;

parameter [16:0]
	COLOR_16_RED		= 16'b1010101000000010,	//  0100000001010101;
	COLOR_16_GREEN		= 16'b1111000010000000,	//  0000000100001111;
	COLOR_16_BLUE		= 16'b1100100011000100,	//  0010001100010011;
	COLOR_H_RED			= 16'b0001010110101000,	//  0001010110101000;
	COLOR_H_GREEN		= 16'b0000111001110000,	//  0000111001110000;
	COLOR_H_BLUE		= 16'b0001010000101000;	//  0001010000101000;

/*******************************************************
*	Read Character Generator ROM
*  On posedge read the main memory character
*  On the negedge read the AUX memory character
*   (even if we do not use it)
*	Then finally setup the pixel array depending on
*   text video screen
********************************************************/
assign CHAR_ADD = ( ALT & !CLOCK & !ALT_CHAR &  VIDEO_MEMORY[15] & VIDEO_MEMORY[14])	?	{1'b1,1'b0,VIDEO_MEMORY[13:8],V_ADD[3:1]}:	// Lower Case
						(!ALT & !CLOCK & !ALT_CHAR &  VIDEO_MEMORY[7]  & VIDEO_MEMORY[6])		?	{1'b1,1'b0,VIDEO_MEMORY[5:0], V_ADD[3:1]}:	// Lower Case
						( ALT & !CLOCK &  ALT_CHAR &  VIDEO_MEMORY[15] & VIDEO_MEMORY[14])	?	{1'b1,1'b0,VIDEO_MEMORY[13:8],V_ADD[3:1]}:	// Lower Case
						(!ALT & !CLOCK &  ALT_CHAR &  VIDEO_MEMORY[7]  & VIDEO_MEMORY[6])		?	{1'b1,1'b0,VIDEO_MEMORY[5:0],V_ADD[3:1]}:		// Lower Case
						( ALT & !CLOCK &  ALT_CHAR & !VIDEO_MEMORY[15] & VIDEO_MEMORY[14])	?	{1'b0,1'b1,VIDEO_MEMORY[13:8],V_ADD[3:1]}:	// Mouse
						(!ALT & !CLOCK &  ALT_CHAR & !VIDEO_MEMORY[7]  & VIDEO_MEMORY[6])		?	{1'b0,1'b1,VIDEO_MEMORY[5:0],V_ADD[3:1]}:		// Mouse
						( ALT )																					?	{1'b0,1'b0,VIDEO_MEMORY[13:8],V_ADD[3:1]}:	// Normal
																														{1'b0,1'b0,VIDEO_MEMORY[5:0], V_ADD[3:1]};	// Normal

always @ (negedge ROM_CLK)
begin
	if(ALT)
		CHAR_BUFFERX <=	CHAR_DATA;
	else
		CHAR_BUFFER  <=	CHAR_DATA;
end


assign DHGR = {(PIXEL_COUNT[3]|(PIXEL_COUNT[2]&PIXEL_COUNT[1])), (PIXEL_COUNT[2]^PIXEL_COUNT[1])};

always @ (negedge CLK)
begin
	if(PIXEL_COUNT == 4'd0)
	begin
		H_BLANKING <= H_BLANKINGX;
	end
	case (MODE)
	2'b00:				// Text Mode
	begin
		if(ALT)
		begin
			RED_VEC		<= TEXT_COLOR[0] & ((!(ALT_CHAR & PIXELS[14] & !PIXELS[16]) & !PIXELS[16] & !(PIXELS[14] &  CLK_1HZ)) ^  PIXELS[PIXEL_COUNT]);	//Blink or Invert only
			RED_H_VEC	<= 1'b0;
			GREEN_VEC	<= TEXT_COLOR[1] & ((!(ALT_CHAR & PIXELS[14] & !PIXELS[16]) & !PIXELS[16] & !(PIXELS[14] &  CLK_1HZ)) ^  PIXELS[PIXEL_COUNT]);	//Blink or Invert only
			GREEN_H_VEC	<= 1'b0;
			BLUE_VEC		<= TEXT_COLOR[2] & ((!(ALT_CHAR & PIXELS[14] & !PIXELS[16]) & !PIXELS[16] & !(PIXELS[14] &  CLK_1HZ)) ^  PIXELS[PIXEL_COUNT]);	//Blink or Invert only
			BLUE_H_VEC	<= 1'b0;
		end
		else
		begin
			RED_VEC		<= TEXT_COLOR[0] & ((!(ALT_CHAR & PIXELS[15] & !PIXELS[17]) & !PIXELS[17] & !(PIXELS[15] &  CLK_1HZ)) ^  PIXELS[PIXEL_COUNT]);	//Blink or Invert only
			RED_H_VEC	<= 1'b0;
			GREEN_VEC	<= TEXT_COLOR[1] & ((!(ALT_CHAR & PIXELS[15] & !PIXELS[17]) & !PIXELS[17] & !(PIXELS[15] &  CLK_1HZ)) ^  PIXELS[PIXEL_COUNT]);	//Blink or Invert only
			GREEN_H_VEC	<= 1'b0;
			BLUE_VEC		<= TEXT_COLOR[2] & ((!(ALT_CHAR & PIXELS[15] & !PIXELS[17]) & !PIXELS[17] & !(PIXELS[15] &  CLK_1HZ)) ^  PIXELS[PIXEL_COUNT]);	//Blink or Invert only
			BLUE_H_VEC	<= 1'b0;
		end
	end
	2'b01:				// LORES Graphics
	begin
		if(~V_ADD[3])
		begin
			RED_VEC		<= COLOR_16_RED[PIXELS[3:0]];
			RED_H_VEC	<= COLOR_H_RED[PIXELS[3:0]];
			GREEN_VEC	<= COLOR_16_GREEN[PIXELS[3:0]];
			GREEN_H_VEC	<= COLOR_H_GREEN[PIXELS[3:0]];
			BLUE_VEC		<= COLOR_16_BLUE[PIXELS[3:0]];
			BLUE_H_VEC	<= COLOR_H_BLUE[PIXELS[3:0]];
		end
		else
		begin
			RED_VEC		<= COLOR_16_RED[PIXELS[7:4]];
			RED_H_VEC	<= COLOR_H_RED[PIXELS[7:4]];
			GREEN_VEC	<= COLOR_16_GREEN[PIXELS[7:4]];
			GREEN_H_VEC	<= COLOR_H_GREEN[PIXELS[7:4]];
			BLUE_VEC		<= COLOR_16_BLUE[PIXELS[7:4]];
			BLUE_H_VEC	<= COLOR_H_BLUE[PIXELS[7:4]];
		end
	end
	2'b10:			// Hi Res Graphics
	begin
		if(H_BLANKING)
		begin
			RED_VEC <= 1'b0;
			GREEN_VEC <= 1'b0;
			BLUE_VEC <= 1'b0;
			RED_H_VEC <= 1'b0;
			GREEN_H_VEC <= 1'b0;
			BLUE_H_VEC <= 1'b0;
			PIXEL_HISTORY <= 2'b00;
		end
		else
		begin
			PIXEL_HISTORY[0] <= PIXELS[PIXEL_COUNT];
			PIXEL_HISTORY[1] <= PIXEL_HISTORY[0];
			if(~PIXELS[14])
			begin
// bit 7 = 0 ==odd bits are purple and even bits are green
				if(!PIXEL_COUNT[1]^H_ADD[0])
				begin
					if(PIXEL_COUNT[3:1] == 3'b110)
					begin
//																									(PIXEL_FUTURE)
						RED_VEC		<= (PIXELS[PIXEL_COUNT] & (PIXEL_HISTORY[1] | VIDEO_MEMORY[0]))
											| (PIXEL_HISTORY[1] & VIDEO_MEMORY[0]);	// | COLOR);
						RED_H_VEC	<=	1'b0;
						GREEN_VEC	<= PIXELS[PIXEL_COUNT];
						GREEN_H_VEC	<=	1'b0;
						BLUE_VEC		<= (PIXELS[PIXEL_COUNT] & (PIXEL_HISTORY[1] | VIDEO_MEMORY[0]))
											| (PIXEL_HISTORY[1] & VIDEO_MEMORY[0]);	// | COLOR);
						BLUE_H_VEC	<=	1'b0;
					end
					else
					begin
						RED_VEC		<= (PIXELS[PIXEL_COUNT] & (PIXEL_HISTORY[1] | PIXELS[PIXEL_COUNT + 2]))
											| (PIXEL_HISTORY[1] & PIXELS[PIXEL_COUNT + 2]);	// | COLOR);
						RED_H_VEC	<=	1'b0;
						GREEN_VEC	<= PIXELS[PIXEL_COUNT];
						GREEN_H_VEC	<=	1'b0;
						BLUE_VEC		<= (PIXELS[PIXEL_COUNT] & (PIXEL_HISTORY[1] | PIXELS[PIXEL_COUNT + 2]))
											| (PIXEL_HISTORY[1] & PIXELS[PIXEL_COUNT + 2]);	// | COLOR);
						BLUE_H_VEC	<=	1'b0;
					end
				end
				else
				begin
					if(PIXEL_COUNT[3:1] == 3'b110)
					begin
						RED_VEC		<= PIXELS[PIXEL_COUNT];
						RED_H_VEC	<=	1'b0;
						GREEN_VEC	<= (PIXELS[PIXEL_COUNT] & (PIXEL_HISTORY[1] | VIDEO_MEMORY[0]))
											| (PIXEL_HISTORY[1] & VIDEO_MEMORY[0]);	// | COLOR);
						GREEN_H_VEC	<=	1'b0;
						BLUE_VEC		<= PIXELS[PIXEL_COUNT];
						BLUE_H_VEC	<=	1'b0;
					end
					else
					begin
						RED_VEC		<= PIXELS[PIXEL_COUNT];
						RED_H_VEC	<=	1'b0;
						GREEN_VEC	<= (PIXELS[PIXEL_COUNT] & (PIXEL_HISTORY[1] | PIXELS[PIXEL_COUNT + 2]))
											| (PIXEL_HISTORY[1] & PIXELS[PIXEL_COUNT + 2]);	// | COLOR);
						GREEN_H_VEC	<=	1'b0;
						BLUE_VEC		<= PIXELS[PIXEL_COUNT];
						BLUE_H_VEC	<=	1'b0;
					end
				end
			end
			else
			begin
// bit 7 = 1 ==odd bits are blue and even bits are orange
				if(!PIXEL_COUNT[1]^H_ADD[0])
				begin
					if(PIXEL_COUNT[3:1] == 3'b110)
					begin
						RED_VEC		<= PIXELS[PIXEL_COUNT];
						RED_H_VEC	<=	1'b0;
						GREEN_VEC	<= PIXELS[PIXEL_COUNT] & (PIXEL_HISTORY[1] | VIDEO_MEMORY[0]);
						GREEN_H_VEC	<=	PIXELS[PIXEL_COUNT] | (PIXEL_HISTORY[1] & VIDEO_MEMORY[0]);
						BLUE_VEC		<= (PIXELS[PIXEL_COUNT] & (PIXEL_HISTORY[1] | VIDEO_MEMORY[0]))
											| (PIXEL_HISTORY[1] & VIDEO_MEMORY[0]);	// | COLOR);
						BLUE_H_VEC	<=	1'b0;
					end
					else
					begin
						RED_VEC		<= PIXELS[PIXEL_COUNT];
						RED_H_VEC	<=	1'b0;
						GREEN_VEC	<= PIXELS[PIXEL_COUNT] & (PIXEL_HISTORY[1] | PIXELS[PIXEL_COUNT + 2]);
						GREEN_H_VEC	<=	PIXELS[PIXEL_COUNT] | (PIXEL_HISTORY[1] & PIXELS[PIXEL_COUNT + 2]);
						BLUE_VEC		<= (PIXELS[PIXEL_COUNT] & (PIXEL_HISTORY[1] | PIXELS[PIXEL_COUNT + 2]))
											| (PIXEL_HISTORY[1] & PIXELS[PIXEL_COUNT + 2]);	// | COLOR);
						BLUE_H_VEC	<=	1'b0;
					end
				end
				else
				begin
					if(PIXEL_COUNT[3:1] == 3'b110)
					begin
						RED_VEC		<= (PIXELS[PIXEL_COUNT] & (PIXEL_HISTORY[1] | VIDEO_MEMORY[0]))
											| (PIXEL_HISTORY[1] & VIDEO_MEMORY[0]);
						RED_H_VEC	<=	1'b0;
						GREEN_VEC	<= PIXELS[PIXEL_COUNT] & (PIXEL_HISTORY[1] | VIDEO_MEMORY[0]);
						GREEN_H_VEC	<=	PIXELS[PIXEL_COUNT] | (PIXEL_HISTORY[1] & VIDEO_MEMORY[0]);
						BLUE_VEC		<= PIXELS[PIXEL_COUNT];	// | COLOR);
						BLUE_H_VEC	<=	1'b0;
					end
					else
					begin
						RED_VEC		<= (PIXELS[PIXEL_COUNT] & (PIXEL_HISTORY[1] | PIXELS[PIXEL_COUNT + 2]))
											| (PIXEL_HISTORY[1] & PIXELS[PIXEL_COUNT + 2]);
						RED_H_VEC	<=	1'b0;
						GREEN_VEC	<= PIXELS[PIXEL_COUNT] & (PIXEL_HISTORY[1] | PIXELS[PIXEL_COUNT + 2]);
						GREEN_H_VEC	<=	PIXELS[PIXEL_COUNT] | (PIXEL_HISTORY[1] & PIXELS[PIXEL_COUNT + 2]);
						BLUE_VEC		<= PIXELS[PIXEL_COUNT];	// | COLOR);
						BLUE_H_VEC	<=	1'b0;
					end
				end
			end
		end
	end
	2'b11:				//DHGR
	begin
		if(H_ADD[0])
		begin
//			COLOR			<= {1'b0, PIXELS[13:12]};
			case (PIXEL_COUNT[3:2])
			2'b00:
			begin
				RED_VEC		<= COLOR_16_RED  [PIXELS[3:0]];
				RED_H_VEC	<=	COLOR_H_RED   [PIXELS[3:0]];
				GREEN_VEC	<= COLOR_16_GREEN[PIXELS[3:0]];
				GREEN_H_VEC	<=	COLOR_H_GREEN [PIXELS[3:0]];
				BLUE_VEC		<= COLOR_16_BLUE [PIXELS[3:0]];
				BLUE_H_VEC	<=	COLOR_H_BLUE  [PIXELS[3:0]];
			end
			2'b01:
			begin
				RED_VEC		<= COLOR_16_RED	[PIXELS[7:4]];
				RED_H_VEC	<=	COLOR_H_RED		[PIXELS[7:4]];
				GREEN_VEC	<= COLOR_16_GREEN	[PIXELS[7:4]];
				GREEN_H_VEC	<=	COLOR_H_GREEN	[PIXELS[7:4]];
				BLUE_VEC		<= COLOR_16_BLUE	[PIXELS[7:4]];
				BLUE_H_VEC	<=	COLOR_H_BLUE	[PIXELS[7:4]];
			end
			2'b10:
			begin
				RED_VEC		<= COLOR_16_RED  [PIXELS[11:8]];
				RED_H_VEC	<=	COLOR_H_RED   [PIXELS[11:8]];
				GREEN_VEC	<= COLOR_16_GREEN[PIXELS[11:8]];
				GREEN_H_VEC	<=	COLOR_H_GREEN [PIXELS[11:8]];
				BLUE_VEC		<= COLOR_16_BLUE [PIXELS[11:8]];
				BLUE_H_VEC	<=	COLOR_H_BLUE  [PIXELS[11:8]];
			end
			2'b11:
			begin
				RED_VEC		<= COLOR_16_RED  [{VIDEO_MEMORY[9:8],PIXELS[13:12]}];
				RED_H_VEC	<= COLOR_H_RED   [{VIDEO_MEMORY[9:8],PIXELS[13:12]}];
				GREEN_VEC	<= COLOR_16_GREEN[{VIDEO_MEMORY[9:8],PIXELS[13:12]}];
				GREEN_H_VEC	<=	COLOR_H_GREEN [{VIDEO_MEMORY[9:8],PIXELS[13:12]}];
				BLUE_VEC		<= COLOR_16_BLUE [{VIDEO_MEMORY[9:8],PIXELS[13:12]}];
				BLUE_H_VEC	<=	COLOR_H_BLUE  [{VIDEO_MEMORY[9:8],PIXELS[13:12]}];
			end
			endcase
		end
		else
		begin
			case (DHGR)
			2'b00:
			begin
				RED_VEC		<= COLOR_16_RED  [PIXELS[3:0]];
				RED_H_VEC	<=	COLOR_H_RED   [PIXELS[3:0]];
				GREEN_VEC	<= COLOR_16_GREEN[PIXELS[3:0]];
				GREEN_H_VEC	<=	COLOR_H_GREEN [PIXELS[3:0]];
				BLUE_VEC		<= COLOR_16_BLUE [PIXELS[3:0]];
				BLUE_H_VEC	<=	COLOR_H_BLUE  [PIXELS[3:0]];
			end
			2'b01:
			begin
				RED_VEC		<= COLOR_16_RED	[PIXELS[7:4]];
				RED_H_VEC	<=	COLOR_H_RED		[PIXELS[7:4]];
				GREEN_VEC	<= COLOR_16_GREEN	[PIXELS[7:4]];
				GREEN_H_VEC	<=	COLOR_H_GREEN	[PIXELS[7:4]];
				BLUE_VEC		<= COLOR_16_BLUE	[PIXELS[7:4]];
				BLUE_H_VEC	<=	COLOR_H_BLUE	[PIXELS[7:4]];
			end
			2'b10:
			begin
				RED_VEC		<= COLOR_16_RED  [PIXELS[11:8]];
				RED_H_VEC	<=	COLOR_H_RED   [PIXELS[11:8]];
				GREEN_VEC	<= COLOR_16_GREEN[PIXELS[11:8]];
				GREEN_H_VEC	<=	COLOR_H_GREEN [PIXELS[11:8]];
				BLUE_VEC		<= COLOR_16_BLUE [PIXELS[11:8]];
				BLUE_H_VEC	<=	COLOR_H_BLUE  [PIXELS[11:8]];
			end
			2'b11:
			begin
				RED_VEC		<= COLOR_16_RED  [PIXELS[15:12]];
				RED_H_VEC	<= COLOR_H_RED   [PIXELS[15:12]];
				GREEN_VEC	<= COLOR_16_GREEN[PIXELS[15:12]];
				GREEN_H_VEC	<=	COLOR_H_GREEN [PIXELS[15:12]];
				BLUE_VEC		<= COLOR_16_BLUE [PIXELS[15:12]];
				BLUE_H_VEC	<=	COLOR_H_BLUE  [PIXELS[15:12]];
			end
			endcase
		end
	end
	endcase
end

/*******************************************************
* Get memory and character
********************************************************/
//level level	color	color_h
//0		0		0 		0
//1		.33
//			0.5	0		1
//2		.67
//3		1		1		x
// swap the 0 and 1 to raise the .5 output from .33 to .67
assign RED1	=	  RED_VEC                  & ~H_BLANKING & ~V_BLANKING;
assign RED0 =   (RED_VEC   | RED_H_VEC)   & ~H_BLANKING & ~V_BLANKING;

assign GREEN1 =  GREEN_VEC                & ~H_BLANKING & ~V_BLANKING;
assign GREEN0 = (GREEN_VEC | GREEN_H_VEC) & ~H_BLANKING & ~V_BLANKING;

assign BLUE1 =	  BLUE_VEC                 & ~H_BLANKING & ~V_BLANKING;
assign BLUE0 =	 (BLUE_VEC  | BLUE_H_VEC)  & ~H_BLANKING & ~V_BLANKING;

//assign BLUE	=	(BLUE_VEC  | (BLUE_H_VEC & CLK)) & ~H_BLANKING & ~V_BLANKING;

/*	0		Black				0		0		0
	1		Magenta			255	0		0
	2		Dark Blue		0		0		255
	3		Light Purple	128	0		128
	4		Dark Green		0		128	0
	5		Grey				128	128	128
	6		Medium Blue		0		128	255
	7		Light Blue		128	255	255
	8		Brown				128	0		0
	9		Orange			255	128	0
	A		Grey				128	128	128
	B		Pink				255	128	255
	C		Green				128	255	128
	D		Yellow			255	255	0
	E		Blue / Green	0		255	255
	F		White				255	255	255
*/

/*******************************************************
* Horizontal Character
********************************************************/
always @ (posedge CLK)
begin
	case (PIXEL_COUNT)
	4'd00:
	begin
		PIXEL_COUNT <= 4'd01;
		CLK_MOD <= 1'b0;
		ALT  <= 1'b1;
		ROM_CLK <= 1'b0;
	end
	4'd02:
	begin
		PIXEL_COUNT <= 4'd03;
		CLK_MOD <= 1'b0;
		ALT  <= 1'b1;
		ROM_CLK <= 1'b1;
		end
//	4'd02:
//	begin
//		PIXEL_COUNT <= 4'd03;
//		CLK_MOD <= 1'b0;
//		ALT  <= 1'b1;
//		ROM_CLK <= 1'b0;
//		end
	4'd03:
	begin
		PIXEL_COUNT <= 4'd04;
		CLK_MOD <= 1'b0;
		ALT  <= 1'b1;
		ROM_CLK <= 1'b1;
	end
	4'd04:
	begin
		PIXEL_COUNT <= 4'd05;
		CLK_MOD <= 1'b0;
		ALT  <= 1'b1;
		ROM_CLK <= 1'b0;
	end
	4'd05:
	begin
		PIXEL_COUNT <= 4'd06;
		CLK_MOD <= 1'b0;
		ALT  <= 1'b1;
		ROM_CLK <= 1'b0;
	end
	4'd06:
	begin
		PIXEL_COUNT <= 4'd07;
		CLK_MOD <= 1'b0;
		ALT  <= 1'b0;
		ROM_CLK <= 1'b0;
	end		
	4'd09:
	begin
		PIXEL_COUNT <= 4'd10;
		CLK_MOD <= 1'b0;
		ALT  <= 1'b0;
		ROM_CLK <= 1'b1;
	end		
	4'd10:
	begin
		PIXEL_COUNT <= 4'd11;
		CLK_MOD <= 1'b0;
		ALT  <= 1'b0;
		ROM_CLK <= 1'b0;
	end		
	4'd12:
	begin
		PIXEL_COUNT <= 4'd13;
		case (MODE)
		2'b00:									// Text
		begin
			if(~TEXT_80 | CLOCK)
				CHAR_PIXELS <=	{{2{VIDEO_MEMORY[7] |  CLOCK}},	{2{VIDEO_MEMORY[6] & !CLOCK}},
									{2{CHAR_BUFFER[1]}},				{2{CHAR_BUFFER[2]}},
									{2{CHAR_BUFFER[3]}},				{2{CHAR_BUFFER[4]}},
									{2{CHAR_BUFFER[5]}},				{2{CHAR_BUFFER[6]}},
									{2{CHAR_BUFFER[7]}}};
			else
				CHAR_PIXELS <=	{VIDEO_MEMORY[7],VIDEO_MEMORY[15],	VIDEO_MEMORY[6],	VIDEO_MEMORY[14],
									CHAR_BUFFER[1],	CHAR_BUFFER[2],	CHAR_BUFFER[3],	CHAR_BUFFER[4],
									CHAR_BUFFER[5],	CHAR_BUFFER[6],	CHAR_BUFFER[7],	CHAR_BUFFERX[1],
									CHAR_BUFFERX[2],	CHAR_BUFFERX[3],	CHAR_BUFFERX[4],	CHAR_BUFFERX[5],
									CHAR_BUFFERX[6],	CHAR_BUFFERX[7]};
		end
		2'b01:									// LORES
		begin			
			CHAR_PIXELS <=	{2'b00,
								VIDEO_MEMORY[15],	VIDEO_MEMORY[14],	VIDEO_MEMORY[13],	VIDEO_MEMORY[12],
								VIDEO_MEMORY[11],	VIDEO_MEMORY[10],	VIDEO_MEMORY[9],	VIDEO_MEMORY[8],
								VIDEO_MEMORY[7],		VIDEO_MEMORY[6],	VIDEO_MEMORY[5],	VIDEO_MEMORY[4],
								VIDEO_MEMORY[3],		VIDEO_MEMORY[2],	VIDEO_MEMORY[1],	VIDEO_MEMORY[0]};
		end
		2'b11:									// DHRES
		begin
			if(!H_ADD[0])
				CHAR_PIXELS <=	{2'b00,
									2'b00,                            VIDEO_MEMORY[6],	VIDEO_MEMORY[5],
									VIDEO_MEMORY[4],	VIDEO_MEMORY[3], VIDEO_MEMORY[2],	VIDEO_MEMORY[1], 
									VIDEO_MEMORY[0],	VIDEO_MEMORY[14],VIDEO_MEMORY[13],	VIDEO_MEMORY[12], 
									VIDEO_MEMORY[11],VIDEO_MEMORY[10],VIDEO_MEMORY[9],	VIDEO_MEMORY[8]};
			else
				CHAR_PIXELS <=	{2'b00,
									VIDEO_MEMORY[6],	VIDEO_MEMORY[5],	VIDEO_MEMORY[4],	VIDEO_MEMORY[3],
									VIDEO_MEMORY[2],	VIDEO_MEMORY[1],	VIDEO_MEMORY[0],	VIDEO_MEMORY[14],
									VIDEO_MEMORY[13],VIDEO_MEMORY[12],	VIDEO_MEMORY[11],	VIDEO_MEMORY[10],
									VIDEO_MEMORY[9],	VIDEO_MEMORY[8],	CHAR_PIXELS[13],	CHAR_PIXELS[12]};
		end										// HIRES
		2'b10:
		begin
			CHAR_PIXELS <=	{2'b00,
								VIDEO_MEMORY[7],	VIDEO_MEMORY[7],	VIDEO_MEMORY[6],	VIDEO_MEMORY[6],
								VIDEO_MEMORY[5],	VIDEO_MEMORY[5],	VIDEO_MEMORY[4],	VIDEO_MEMORY[4],
								VIDEO_MEMORY[3],	VIDEO_MEMORY[3],	VIDEO_MEMORY[2],	VIDEO_MEMORY[2],
								VIDEO_MEMORY[1],	VIDEO_MEMORY[1],	VIDEO_MEMORY[0],	VIDEO_MEMORY[0]};
		end
		endcase
	end
	4'd13:
	begin
		PIXEL_COUNT <= 4'd00;
		CLK_MOD <= 1'b1;
		ALT  <= 1'b1;
		ROM_CLK <= 1'b0;
		PIXELS <= CHAR_PIXELS;
	end
	default:
	begin
		PIXEL_COUNT <= PIXEL_COUNT + 1;
	end
	endcase
end

/*******************************************************
* Horizontal
********************************************************/
always @ (posedge CLK_MOD)
begin
	if(H_ADD==6'd56)
		RAM_ADD <= {V_ADD[8],V_ADD[7],V_ADD[8],V_ADD[7],3'B000};
	else
		RAM_ADD <= RAM_ADD + 1;

	case (H_ADD)
	6'd00:
	begin
		H_BLANKINGX <= 1'b0;					// Turn off blanking
		HSYNC <= 1'b1;							// Not H Sync
		H_ADD  <= 6'd01;						// Next step
	end
	6'd40:										// First non-Pixel
	begin
		H_BLANKINGX <= 1'b1;					// Turn on blanking
		HSYNC <= 1'b1;							// Not H Sync
		H_ADD  <= 6'd41;
	end
	6'd44:										// Start HSync
	begin
		H_BLANKINGX <= 1'b1;
		HSYNC <= 1'b0;							// Start H Sync
		H_ADD  <= 6'd45;
	end
	6'd51:										// End HSync
	begin
		H_BLANKINGX <= 1'b1;
		HSYNC <= 1'b1;							// End H Sync
		H_ADD  <= 6'd52;
	end
	6'd56:										//  End Frame
	begin
		H_BLANKINGX <= 1'b1;
		HSYNC <= 1'b1;
		H_ADD  <= 6'd0;
	end
	default:
		H_ADD <= H_ADD + 1;
	endcase
end

/*******************************************************
* Verticle
********************************************************/
always @(negedge HSYNC)
	case(V_ADD)
		10'd000:
		begin
			V_BLANKING <= 1'b0;					// Turn off blanking
			CLOCK <= 1'b0;
			VSYNC <= 1'b1;						// No V Sync
			V_ADD  <= 10'd001;
			MM_POS <= 1'b0;						// Mixed mode position is not text
		end
		10'd320:
		begin
			V_BLANKING <= 1'b0;					// Turn off blanking
			CLOCK <= 1'b0;
			VSYNC <= 1'b1;						// No V Sync
			V_ADD  <= 10'd321;
			MM_POS <= 1'b1;						// Mixed mode position is text
		end
		10'd383:
		begin
			V_BLANKING <= 1'b1;					// Turn on blanking
			CLOCK <= 1'b0;
			VSYNC <= 1'b1;						// No V Sync
			V_ADD  <= 10'd384;
			MM_POS <= 1'b0;						// Mixed mode position is not text
		end
		10'd399:
		begin
			V_BLANKING <= 1'b0;					// Turn off blanking
			CLOCK <= 1'b1;
			VSYNC <= 1'b1;						// No V Sync
			V_ADD  <= 10'd400;
			MM_POS <= 1'b0;						// Mixed mode position is not text
		end
		10'd415:
		begin
			V_BLANKING <= 1'b1;					// Turn on blanking
			CLOCK <= 1'b0;
			VSYNC <= 1'b1;						// No V Sync
			V_ADD  <= 10'd416;
			MM_POS <= 1'b0;						// Mixed mode position is not text
		end
		10'd461:
		begin
			V_BLANKING <= 1'b1;					// Turn on blanking
			CLOCK <= 1'b0;
			VSYNC <= 1'b0;						// V Sync
			V_ADD  <= 10'd462;
			MM_POS <= 1'b0;						// Mixed mode position is not text
		end
		10'd463:
		begin
			V_BLANKING <= 1'b1;					// Turn on blanking
			CLOCK <= 1'b0;
			VSYNC <= 1'b1;						// No V Sync
			V_ADD  <= 10'd464;
			MM_POS <= 1'b0;						// Mixed mode position is not text
		end
		10'd520:
		begin
			V_BLANKING <= 1'b0;					// Turn off blanking
			CLOCK <= 1'b0;
			VSYNC <= 1'b1;						// No V Sync
			V_ADD  <= 10'd000;
			MM_POS <= 1'b0;						// Mixed mode position is not text
		end
		default:
			V_ADD <= V_ADD + 1;
	endcase
endmodule
