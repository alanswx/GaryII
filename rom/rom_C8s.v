/*****************************************************************************
* 2k C1 Internal ROM for APPLE 2E Initialized ALL 0XFF
******************************************************************************/
  sprom #(
  	.init_file		("rom/roms/C8s.hex"),
  	.numwords_a		(2048),
  	.widthad_a		(11)
  ) RAMB16_S9_C8S (
  	.address			(ADDRESS[10:0]),
  	.clock				(PH_2),
  	.q						(DOA_C8S)
  );
