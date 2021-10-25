/*****************************************************************************
* 2k C8 ROM for Super Serial Card
******************************************************************************/
   // RAMB16_S9: Virtex-II/II-Pro, Spartan-3/3E 2k x 8 + 1 Parity bit Single-Port RAM
   // Xilinx HDL Language Template version 7.1i

   RAMB16_S9 #(
      .INIT(9'h000),  // Value of output RAM registers at startup
      .SRVAL(9'h000), // Ouput value upon SSR assertion
      .WRITE_MODE("READ_FIRST"), // WRITE_FIRST, READ_FIRST or NO_CHANGE

      // The following INIT_xx declarations specify the initial contents of the RAM
      .INIT_00(256'h4A2B85C082B906B89D06389D05B89D04389D03B89D04B89D00A94816A9C99B20),
      .INIT_01(256'h2C04B89D80A902B003A94A3DD001A90EB04A07B04AC081B9B848FE296804904A),
      .INIT_02(256'h04F0A803294A4A2BA56005B89D07F8AEC89B200A7003B89D204920292BA5FF58),
      .INIT_03(256'h0250A029482BA507389D6805389D09A94895296826A406389DC9A6B9487F2968),
      .INIT_04(256'hAA20C99B2060C088B9C08A990B090A0A0A00A902500C2968CD8120CDA1208029),
      .INIT_05(256'hF06027A5AA68A868CA1E2060F690CC2C2005B0CAFF206005B8BE07F8AC7F29C8),
      .INIT_06(256'h04B8BD0890E0C927A50EF0C02903B8BD1A90CC3E2024D006B85E051006B8BD29),
      .INIT_07(256'hB0CB1A20C8D04CC9D120DAF00828CC1120DC90CAFF20CBD0D0F02804B89D4009),
      .INIT_08(256'h8524651806B83DF0090AD010C904F008C942F024A516D0C0290738BD4827A5B7),
      .INIT_09(256'hFF582CEA0C7008FF582C278588A91F100A0738BD0890A0A929F024C506B8BD24),
      .INIT_0A(256'h8D4968C9B520CB682048278508B868C9684CCB6B20C9B520C9EF4C07F8AEB850),
      .INIT_0B(256'h0738BDA47028DA908DA906B8FD1808F00638BD0D1004B8BD248506B89D05D00A),
      .INIT_0C(256'h268407F88EC8B84C2484A827690390F8C90638FD3800A0980E300A06B8BC1630),
      .INIT_0D(256'h09D0EE4904F00A084927A5C8A34CCB6320C99B202785845048296005B89D00A9),
      .INIT_0E(256'hD094C027A404B8BD16F008290738BD6006B8FEFBB0C0C96006B89D031006B8DE),
      .INIT_0F(256'hB100A00F7005B89D00A926850A0A0A0A8A6004B89D7F2905D092C006D0800904),
      .INIT_10(256'hB8BD60EF90FCBA203C9100A0C088B9FB90CAD22060F290FCBA20CC022027853C),
      .INIT_11(256'hA502D028D1DFA924A410D04F2507A9278528B124A4CDE2207FA94802A9311004),
      .INIT_12(256'hC9D120CC11200C90CAFF206027858DA968CC1120093004B8BD4FE64FE6289127),
      .INIT_13(256'hD09BC934B020F001C027A5A86822100A0738BDBE70C690CC3E20CA2B4CCCA320),
      .INIT_14(256'hC9E2F09BC9CA2B4CCB682048982785200904B0DBC90890C1C9CA2B4C4898C806),
      .INIT_15(256'hFBDFDCDB9F9C9BC9F000A0DED09BC9E2F000A02785CA09B9A806B0BBC90A90B0),
      .INIT_16(256'h296835854A4A202948C089B926A46007F8AEF6D001E938FDD0CACAA2FFFEFDFC),
      .INIT_17(256'h206010C97029C089B926A46005B89D200905F0350535A502B00729049008C90F),
      .INIT_18(256'h4AC081B926A4601860389803D020290738BDA809D08AC98009C088B91590CAD2),
      .INIT_19(256'h290738BD603804B8FE05D00538DD7F2927A56038CDFC2005F0072904B8BD36B0),
      .INIT_1A(256'hD091C9C8AA20601806B89D0490684A4A0738BD480EF093C91090CAFF2015F008),
      .INIT_1B(256'h109067C90438BD4827A54B904A4E904AC081B926A4CC9E20F1B0CB1A206018F9),
      .INIT_1C(256'h49C8AA20CC0220278580091F2904B8BD19B018D07F299B4948686BC922B06CC9),
      .INIT_1D(256'hEA4CCC022004389D03F0302903B8BD0AD00A8D492785680438DE04389DEDD086),
      .INIT_1E(256'hFEB9A80DF0032925D01AC04A4A06F014C04A4A0CF018C003B8BDA80ACC0220CB),
      .INIT_1F(256'h0160CB6B4C27858AA907906A0738BD0DD01AC90A27A5F8D088CAC42020A9A8CB),
      .INIT_20(256'hC927A50CD095C968289127A524A44860BFFF9927A5A8890998FBD0CAF5204008),
      .INIT_21(256'h4EE66038C0108D0410C000AD09F004290738BD18602785CCDB59CCDF2006B020),
      .INIT_22(256'h93B90AA035B04AC081B926A43DD00538DD7F29CC1120F390B8CC2C204FE602D0),
      .INIT_23(256'hCCA3202785E1F088C9FB10CC3420CE7B2001A9F11088A868CCA32048982785CC),
      .INIT_24(256'h38BD8DC1D0D0CCC5A0D3D3C3BA6038FF582C27858DA9E8D0072904B8BDCB1A20),
      .INIT_25(256'h0690E0C98009CCDF206048AFA9488A06F0382904B8BD0DF002290738BD131007),
      .INIT_26(256'hBDC0E00000C000000020E00020F090CCD759F5B0DBC9F990C1C9FDF64CCCD359),
      .INIT_27(256'hD39049F3E75AACC752B84751A68743A64754C067426027A5A803292A2A2A03B8),
      .INIT_28(256'h449AF6507CF6420020E34D40435340835408E35801E34C04E346804345DF904B),
      .INIT_29(256'hD005A0CFA910D007A03FA900605653E8904E34D6543AF64340F64C46F6469BF6),
      .INIT_2A(256'h03B89D2A05FCD0882A6A1803290438BD2A8503B83D01A0FCA904D003A0F3A90A),
      .INIT_2B(256'hD00F296006389D00A904B89D2A05C72904B8BD0FF026C50A2A850A0A0A072960),
      .INIT_2C(256'h0A0A0A0A8860C08B992A052B25C08BB92B85E0A92A8510094A4A4A4AC081B907),
      .INIT_2D(256'h04B87E1804B81E07F8AEFE8920FE9320C0899910B03804B81EE7D01FA92A850A),
      .INIT_2E(256'h05D007381D80A906389D28A960C08A9968CAC420E9A9C08A990C0948C08AB960),
      .INIT_2F(256'h2927A5A86005387E3805381EEED03FA906389D0E9028C96007389D07383DFEA9),
      .INIT_30(256'h0438BD48CDA96001F007C0CE792012D00DC96DD004A96001F003C009D020C97F),
      .INIT_31(256'h04B8DE06D00538DD8989A78A896137A76035A548CE30B948CEA935856026A448),
      .INIT_32(256'h00A0CE794C05389D06B020C927D002A904389D0F2909B03AC90D9030C9CC024C),
      .INIT_33(256'h07F8AE2A8500A936D02EA015F004389DFAD08804387D0AA00DB00AC930494DF0),
      .INIT_34(256'h383DFF4905D007381D11D045C009F044C00438BDA86004B89D2A05F82904B8BD),
      .INIT_35(256'hEBB9C8F2D0C8C8C805F035C5F4F0CCEBB9F5D005B89D20A9D3D006A907389D07),
      .INIT_36(256'h482AA5DC500230E01004B02A244A4A0738BDEBD010290738BD07D020292A85CC),
      .INIT_37(256'hC2600438BD26A448CCEBB948CDA96004389DCCEBB907D0102968C8CE7B200729),
      .INIT_38(256'h5820CFFF8D78084898488A358627859A97948E31010650B81890380C70FF582C),
      .INIT_39(256'h05D01F29C08AB905385E05381E295028A826850A0A0A0AAA07F88D0100BDBAFF),
      .INIT_3A(256'h290738BD388505A9F9D039E4089018368505F036C507A90BD037E4C80520EFA9),
      .INIT_3B(256'h9DBF296807F8AE278502009D200927A535A60E100A4804B8BDC8BF4C03900802),
      .INIT_3C(256'h08B0C99B204AC9AA4CC89B4C6000A2C80020C8FC4CC8B54CCB632006F02804B8),
      .INIT_3D(256'h36850638BD07F8AEFA10CA4836B503A260AA05B8BDCAD22003901806F0CAF520),
      .INIT_3E(256'h0A0AAA07F88D68278568FDED2080094827A5488A3785C0094A4A4A382904B8BD),
      .INIT_3F(256'h08C5CCD0D0C16007F8AEF89004E0E836956800A206389D36A5CFFF8D26850A0A),
 
      // The next set of INITP_xx are for the parity bits
      .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000)
   ) RAMB16_S9_C8S (
      .DO(DOA_C8S),      // 8-bit Data Output
      .DOP(DOP_C8S),    // 1-bit parity Output
      .ADDR(ADDRESS[10:0]),  // 11-bit Address Input
      .CLK(PH_2),    // Clock
      .DI(DATA_OUT),      // 8-bit Data Input
      .DIP(1'b0),    // 1-bit parity Input
      .EN(ENA_C8S),      // RAM Enable Input
      .SSR(1'b0),    // Synchronous Set/Reset Input
      .WE(ROM_RW)       // Write Enable Input
   );

   // End of RAMB16_S9_inst instantiation
