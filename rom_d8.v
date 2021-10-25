/*****************************************************************************
* 2k D8 ROM for APPLE 2E Initialized ALL 0XFF
******************************************************************************/
   // RAMB16_S9: Virtex-II/II-Pro, Spartan-3/3E 2k x 8 + 1 Parity bit Single-Port RAM
   // Xilinx HDL Language Template version 7.1i

   RAMB16_S9 #(
      .INIT(9'h000),  // Value of output RAM registers at startup
      .SRVAL(9'h000), // Ouput value upon SSR assertion
      .WRITE_MODE("READ_FIRST"), // WRITE_FIRST, READ_FIRST or NO_CHANGE

      // The following INIT_xx declarations specify the initial contents of the RAM
      .INIT_00(256'h00B120DB5720ED242076A575A6DB5C2023A90FF0E876A61410F224B9E60290B8),
      .INIT_01(256'h4C00B14C48D000B948D001B9A80A14B040C9119080E92DF062F0D7D24CD82820),
      .INIT_02(256'h6001F083C9C000AD607E847D858801B068A401E967A538DEC94CBFF03AC9DA46),
      .INIT_03(256'h7A8479850CF0E876A6B9A4B8A53CD01801B003C9F2E94C0310D824FFA2D55320),
      .INIT_04(256'h124C03D07AA4D2A217D0D43C4CD4314C0390D3A05DA968687884778576A475A5),
      .INIT_05(256'hD8F020518568E5B0A5508567E5AFA538607684758578A477A5B984B88579A5D4),
      .INIT_06(256'hD68552A56A85516568A56985506567A518FEFD20D8F020FECD4CD90120FECD20),
      .INIT_07(256'hD6843F843E8552A93D843C8500A050A9D4F24CD6654C0310D624FEFD20D90120),
      .INIT_08(256'h354CD66C20D6654C03D02876C608603F843E856AA469A53D843C8568A467A560),
      .INIT_09(256'h0C20D7D24CD93E2000B72048B0A94875A54876A548B8A548B9A5D3D62003A9D9),
      .INIT_0A(256'h9BA51E90D61E2068A667A504B0E80790B9A6B86538980BB051C576A5D9A620DA),
      .INIT_0B(256'h124C5AA22C16A20BF0B0C99AD365208585FFA9FDD060B98500E99CA5B88501E9),
      .INIT_0C(256'h0290B885B8651898D9A320B98568B8856876856875853BF042C06868DEC94CD4),
      .INIT_0D(256'hC9C8E4F00EC5E8F0B8B10E860D850DA60EA50E8400A00D8600A22C3AA260B9E6),
      .INIT_0E(256'hF0D9A62005D09DA5DEC020C4A905F0ABC900B720DD7B2060686868E9F0F3D022),
      .INIT_0F(256'hD82A4C6804D0A1C689D0ABC904F0B0C948E6F820D8284CD93E4C03B000B720B7),
      .INIT_10(256'hD4B019C95E8551A50D852FE9F7B05186508600A26068EEF02CC9DA0C2000B120),
      .INIT_11(256'h51E6029050850D6550A551265006518551655EA5508550655E260A5E260A50A5),
      .INIT_12(256'hDD6D202A68DD7B204811A54812A5DEC020D0A986848585DFE320DA124C00B120),
      .INIT_13(256'hC5A0B102A068EB274C608591A1A5C88591A0A500A0E10C20EB722012106818D0),
      .INIT_14(256'hB74CA1A4A0A507B069C5A0A50DD008906AC4A1A40E906FC5A0B18807D0179070),
      .INIT_15(256'h00A0E635208D848C8500A09DA9E5D420AC84AB858DA48CA5E3D520A0B100A0DA),
      .INIT_16(256'h18C3C939F0C0C929F024F000B720DB3D206085918CB1C885918CB1C885918CB1),
      .INIT_17(256'hDB5C200DA9DACF4CE3E720ED3420DD301124DD7B2044F03BC91CF0182CC934F0),
      .INIT_18(256'hC94C03F029C9E6F5200819902485F029106921D0DAFB20059018C924A560FF49),
      .INIT_19(256'hE60020E3E720F2D0DB5720DAD74C00B12006D0CAE8AA059024E58ACA079028DE),
      .INIT_1A(256'hA0C980093FA92C20A9DB444CDB0020F3D00DC9C8DB5C205EB1BBF0CAE800A0AA),
      .INIT_1B(256'h857CA47BA504D0FFA0043012F015A56068FCA820F1A5487F29FDED20F3050290),
      .INIT_1C(256'h60B984B8857AA479A5DB3A20DCA0EFA9F2E94CFEA20510D82468DEC94C768475),
      .INIT_1D(256'h3D20DEC0203BA9DE81200ED022C960DBEB2040A902018D00A902A001A2E30620),
      .INIT_1E(256'h4CDB5A20D8634C10D003C90200ADD52C2001FF8D2CA9E30620DB5A20DBC74CDB),
      .INIT_1F(256'h88848785B9A4B8A586848585DFE32080847F86158500A92C98A97EA47DA6D52C),
      .INIT_20(256'h3008D001A0FFA202008D7F29FD0C200E5015241ED000B720B984B88680A47FA6),
      .INIT_21(256'h850CF00D8500A9B886E8095015243110112400B120B984B886DBDC20DB5A207F),
      .INIT_22(256'hDA7B20E73D20E3ED20C801900069B9A4B8A50E85182CA90D853AA907F022C90D),
      .INIT_23(256'hB8A5DB714C03F02CC907F000B720DA632012A5EC4A206830F00200AD48DC724C),
      .INIT_24(256'hDB864CCCD015A5DBF14CDEBE2033F000B720B984B88588A487A580847F85B9A4),
      .INIT_25(256'hE0D99820AAB8B17C85C8B8B1C87B85B8B1C85FF0B8B1C82AA212D0AAC8D9A320),
      .INIT_26(256'h3F60DB3A4CDCA0DFA907F07FB100A0D8534C031015A680A47FA5DC2B4CDDD083),
      .INIT_27(256'h2003F000A004D0000D5245544E4545523F000D4445524F4E4749204152545845),
      .INIT_28(256'h2001A06086E8E8E8E8E8E88AE8E8E8E89A69F000A204F0D3652086848585DFE3),
      .INIT_29(256'h0FBD17F00109FD38BAEBB42001A0EB2720E7BE2086A485A5A2850109BDBAEAF9),
      .INIT_2A(256'hD02CC900B7209AAA11698AD7D24CB9850111BDB8850112BD76850110BD758501),
      .INIT_2B(256'hC602D0B8A6D4124CA3A2FDB06003B003301124382418DD7B20DCFF2000B120F1),
      .INIT_2C(256'hB003C91790CFE93800B720898500A9DE6020D3D62001A9488A482400A2B8C6B9),
      .INIT_2D(256'h1165779007697BB02CD089A6DD984C00B1208985619089C5894501492A01C913),
      .INIT_2E(256'hAA171087A468DDFD2048DD6A2067B0D0B2D968A85E650A5E85FF69E5974C03D0),
      .INIT_2F(256'hD0B4B9D99048B0D0B2D9D7D089851BA0B8C6B9C602D0B8A62A8A11465FD056F0),
      .INIT_30(256'h48985F85685EE65E8568A8D0B2BEA2A5DEC94CDD864C89A5DE102048D0B3B948),
      .INIT_31(256'h6A2003F064C923F068FFA0005E6C489DA5489EA5489FA548A0A548A1A5EB7220),
      .INIT_32(256'h609DA5AB85A245AA8568A98568A88568A78568A68568A5856816854A688784DD),
      .INIT_33(256'hD022C9E7F0C8C955F0C9C9F4F02EC964B0E07D20EC4A4C03B000B120118500A9),
      .INIT_34(256'hA02C01A003D09DA538D018A010D0C6C9E73D4CE3E720C801900069B9A4B8A50F),
      .INIT_35(256'h2CA92C28A92C29A9DD7B20DEBB20DF0C4C0390D2C9E3544C03D0C2C9E3014C00),
      .INIT_36(256'h05F011A6A184A085DFE320DDD74C686815A0D4124C10A200B14C03D0B8D100A0),
      .INIT_37(256'h8AF1EC2000B120EAF94CE2F24C8AA8A0B1C8AAA0B100A00D1012A660AC8600A2),
      .INIT_38(256'hDD7B20DEBB202090CFE000B120AA480AE9F0D7C9DEB84CE30120A8F87120F0A4),
      .INIT_39(256'hB9A868DEB220DF3F4C488AA868E6F820488A48A0A548A1A5AA68DD6C20DEBE20),
      .INIT_3A(256'h2C00A003D09DA504F0A5A50BD09D05A5A5DD6A4C0090209285CFDDB99185CFDC),
      .INIT_3B(256'h8500A9DFB04CAAEBB22000A0A5A9A685A6257F09AAA513B0DD6D20E3014C01A0),
      .INIT_3C(256'h9001A908F09DE538AAA984A886E60420A9A4A8A59F849E869D85E6002089C611),
      .INIT_3D(256'hA202B0FFA2EFF09ED1A8B10C90180F30A2A607D0CAC8E8FFA0A285FFA99DA604),
      .INIT_3E(256'h00B720DFE820AADEBE20E3014CFB1E20E6FB20EB934C01A902F016252A8AE801),
      .INIT_3F(256'hE0074C1286118600A2DEC94C03B0E07D2000B7208185108600B72000A260F4D0),

      // The next set of INITP_xx are for the parity bits
      .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000)
   ) RAMB16_S9_D8 (
      .DO(DOA_D8),      // 8-bit Data Output
      .DOP(DOP_D8),    // 1-bit parity Output
      .ADDR(ADDRESS[10:0]),  // 11-bit Address Input
      .CLK(PH_2),    // Clock
      .DI(DATA_OUT),      // 8-bit Data Input
      .DIP(1'b0),    // 1-bit parity Input
      .EN(ENA_D8),      // RAM Enable Input
      .SSR(1'b0),    // Synchronous Set/Reset Input
      .WE(ROM_RW)       // Write Enable Input
   );

   // End of RAMB16_S9_inst instantiation
