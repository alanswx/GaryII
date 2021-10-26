/*****************************************************************************
* 2k Character Generator ROM for APPLE 2E Initialized with GLB Apple set
******************************************************************************/
  sprom #(
  	.init_file		("rom/roms/chargen.hex"),
  	.numwords_a		(2048),
  	.widthad_a		(11)
  ) RAMB16_S9_CG (
  	.address			(CHAR_ADD),
  	.clock				(ROM_CLK),
  	.q						(CHAR_DATA)
  );
