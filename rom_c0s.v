/*****************************************************************************
* 2k C1 Slot ROM for APPLE 2E Initialized ALL 0XFF
******************************************************************************/
   // RAMB16_S9: Virtex-II/II-Pro, Spartan-3/3E 2k x 8 + 1 Parity bit Single-Port RAM
   // Xilinx HDL Language Template version 7.1i

   RAMB16_S9 #(
      .INIT(9'h000),  // Value of output RAM registers at startup
      .SRVAL(9'h000), // Ouput value upon SSR assertion
      .WRITE_MODE("READ_FIRST"), // WRITE_FIRST, READ_FIRST or NO_CHANGE

      // The following INIT_xx declarations specify the initial contents of the RAM
      .INIT_00(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
      .INIT_01(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
      .INIT_02(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
      .INIT_03(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
      .INIT_04(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
      .INIT_05(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
      .INIT_06(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
      .INIT_07(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
		// C100
      .INIT_08(256'h9DE4B0C4B62000A2C4C120C4C120C4C12000A9C4C120FEA9C0F28D80A9488A48),
      .INIT_09(256'h000000000000000000000000000000006068AA68C0F28D00A9F3D00FE0E8C0C0),
      .INIT_0A(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
      .INIT_0B(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
      .INIT_0C(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
      .INIT_0D(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
      .INIT_0E(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
      .INIT_0F(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
		// C200		Super Serial Card
      .INIT_10(256'h5820CFFF8D78084898488A358627859A97948E31010650B81890380C70FF582C),
      .INIT_11(256'h05D01F29C08AB905385E05381E295028A826850A0A0A0AAA07F88D0100BDBAFF),
      .INIT_12(256'h290738BD388505A9F9D039E4089018368505F036C507A90BD037E4C80520EFA9),
      .INIT_13(256'h9DBF296807F8AE278502009D200927A535A60E100A4804B8BDC8BF4C03900802),
      .INIT_14(256'h08B0C99B204AC9AA4CC89B4C6000A2C80020C8FC4CC8B54CCB632006F02804B8),
      .INIT_15(256'h36850638BD07F8AEFA10CA4836B503A260AA05B8BDCAD22003901806F0CAF520),
      .INIT_16(256'h0A0AAA07F88D68278568FDED2080094827A5488A3785C0094A4A4A382904B8BD),
      .INIT_17(256'h08C5CCD0D0C16007F8AEF89004E0E836956800A206389D36A5CFFF8D26850A0A),
		// C300
      .INIT_18(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
      .INIT_19(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
      .INIT_1A(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
      .INIT_1B(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
      .INIT_1C(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
      .INIT_1D(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
      .INIT_1E(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
      .INIT_1F(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
		// C400		Thunder Clock compatable reads hardware
       .INIT_20(256'h020E8D020B8D02088D02058D02028DACA9486000D00390180570FF582C287808),
       .INIT_21(256'hC0C7AD02048D8009C0C6AD02038DB0A902018D8009C0C5AD02008D8009C0C4AD),
       .INIT_22(256'hC0CBAD020A8D8009C0CAAD02098D8009C0C9AD02078D8009C0C8AD02068D8009),
       .INIT_23(256'h8D8DA902108D8009C0CEAD020F8D8009C0CDAD020D8D8009C0CCAD020C8D8009),
       .INIT_24(256'h04FFCD0DB0C4B62012D046C516B0C4B6201BD042C51FB0C4B62060680EA20211),
       .INIT_25(256'h18C0F1ADF1904AC0F0AD603802D0FFC9C0F2AD6001A96000A903B0C4B62008D0),
       .INIT_26(256'h2044B145E6F8D0C8C4C12044B1047F8C00A060C0F18D68F9904A4AC0F0AD4860),
       .INIT_27(256'h000000000000006000A918C7324C03F0C48620C4C120047FAD45C6F8D0C8C4C1),
		// C500
      .INIT_28(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
      .INIT_29(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
      .INIT_2A(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
      .INIT_2B(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
      .INIT_2C(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
      .INIT_2D(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
      .INIT_2E(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
      .INIT_2F(256'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF),
		// C600
      .INIT_30(256'h10E8C803569D98FBD04A08B07E29FF493C0510F03C240A8A3C8603A200A020A2),
      .INIT_31(256'hC080BD50A0C089BDC08ABDC08CBDC08EBDAA2B850A0A0A0A0100BDBAFF5820E5),
      .INIT_32(256'h8CBD0818278508A941853D852685EB1088FCA82056A9C081BDAA2B050A032998),
      .INIT_33(256'hF0AD49DF902809F096C9FB10C08CBDEAF3D0AAC9FB10C08CBDF7D0D549FB10C0),
      .INIT_34(256'h40A5BED03DC528ECD0883C25FB10C08CBD3C852AFB10C08CBD408503A0D9D025),
      .INIT_35(256'h10C08CBC3C84EED0030099883CA402D659FB10C08CBC3C8456A0B7B0B8D041C5),
      .INIT_36(256'h005E26B1FB30CA56A200A087D002D659FB10C08CBCEFD0C826913CA402D659FB),
      .INIT_37(256'h000000000008014CDB902BA60800CD3DA53DE627E6EED0C826912A03005E2A03),
		// C700 Dual 16 Meg drives
//      .INIT_38(256'hB0C72620458508A944854785468500A9438570A9428501A93CE003E000E020E0),
//      .INIT_39(256'h4705802943A5C0F1ADC0F08D15A96028A93804F070C9702943A508014C70A2E7),
//      .INIT_3A(256'hA5047F8D00A960187FA0FFA200A9602BA938C75A4C03B003C90BF042A504FF8D),
//      .INIT_3B(256'h03F001C942A5047F8C00A0C4AF20047FADC4AF2004FFADC4AF2046A5C4AF2042),
//      .INIT_3C(256'h00601800A9C4A520F8D0C84491C4A52045E6F8D0C84491C4A520C48620C4BC4C),
//      .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
//      .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
//      .INIT_3F(256'h2697000000000000000000000000006000000000000000000000000000000000),
		// C700 Single 32 Meg drives
//      .INIT_38(256'hB0C72620458508A944854785468500A9438570A9428501A93CE003E000E020E0),
//      .INIT_39(256'hF042A504FF8D47A5C0F1ADC0F08D15A96028A93804F070C943A508014C70A2E7),
//      .INIT_3A(256'h46A5C4AF2042A5047F8D00A96018FFA0FFA200A9602BA938C7544C03B003C90B),
//      .INIT_3B(256'hC48620C4BC4C03F001C942A5047F8C00A0C4AF20047FADC4AF2004FFADC4AF20),
//      .INIT_3C(256'h00000000000000601800A9C4A520F8D0C84491C4A52045E6F8D0C84491C4A520),
//      .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
//      .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
//      .INIT_3F(256'h2687000000000000000000000000006000000000000000000000000000000000),
       .INIT_38(256'hB0C72620458508A944854785468500A9438570A9428501A93CE003E000E020E0),
       .INIT_39(256'h4705802943A5C0F1ADC0F08D15A96028A93804F070C9702943A508014C70A2E7),
       .INIT_3A(256'hA9C0F28D80A960187FA0FFA200A9602BA938C75A4C03B003C90BF042A504FF8D),
       .INIT_3B(256'hA5047F8C00A0C4C120047FADC4C12004FFADC4C12046A5C4C12042A5047F8D00),
       .INIT_3C(256'hD0C8449111B0C4B62045E6F6D0C84491A2B0C4B620C48620C4CE4C03F001C942),
       .INIT_3D(256'h0000000000000000000000000000C7324C44C66018C0F28D00A98CB0C4B620F6),
       .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
       .INIT_3F(256'h2697000000000000000000000000000000000000000000000000000000000000),
      // The next set of INITP_xx are for the parity bits
      .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000)
   ) RAM16_S9_C0S (
      .DO(DOA_C0S),      // 8-bit Data Output
      .DOP(DOP_C0S),    // 1-bit parity Output
      .ADDR(ADDRESS[10:0]),  // 11-bit Address Input
      .CLK(PH_2),    // Clock
      .DI(DATA_OUT),      // 8-bit Data Input
      .DIP(1'b0),    // 1-bit parity Input
      .EN(ENA_C0S),      // RAM Enable Input
      .SSR(1'b0),    // Synchronous Set/Reset Input
      .WE(ROM_RW)       // Write Enable Input
   );

   // End of RAMB16_S9_inst instantiation
