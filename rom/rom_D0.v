/*****************************************************************************
* 2k C1 Internal ROM for APPLE 2E Initialized ALL 0XFF
******************************************************************************/
  sprom #(
  	.init_file		("rom/roms/D0.hex"),
  	.numwords_a		(2048),
  	.widthad_a		(11)
  ) RAMB16_S9_D0 (
  	.address			(ADDRESS[10:0]),
  	.clock				(PH_2),
  	.q						(DOA_D0)
  );