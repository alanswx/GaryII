/*****************************************************************************
* 2k F0 ROM for APPLE 2E Initialized ALL 0XFF
******************************************************************************/
   // RAMB16_S9: Virtex-II/II-Pro, Spartan-3/3E 2k x 8 + 1 Parity bit Single-Port RAM
   // Xilinx HDL Language Template version 7.1i

   RAMB16_S9 #(
      .INIT(9'h000),  // Value of output RAM registers at startup
      .SRVAL(9'h000), // Ouput value upon SSR assertion
      .WRITE_MODE("READ_FIRST"), // WRITE_FIRST, READ_FIRST or NO_CHANGE

      // The following INIT_xx declarations specify the initial contents of the RAM
      .INIT_00(256'h4916A50930A2A5E7A0200D1048A2A5E7A720F0A070A9E7AA20AB8500A9EC2320),
      .INIT_01(256'h8500A9EB2120EF5C4CF0A075A9EED020031068E7BE20F0A070A9EED0201685FF),
      .INIT_02(256'h4C00A08AA9F0622016A5A28500A9EAF92000A093A9EFE72000A08AA2EFF12016),
      .INIT_03(256'hF8FB0728861B2D1AE68405000000007FA2DA0F4983A2DA0F4981F0234C48EA66),
      .INIT_04(256'hA2A5CACEC4D5C8D4C8C1D3A6A2DA0F498328E75DA586E1DF3523870189689987),
      .INIT_05(256'h079081C968EF5C20F0A0CEA9EA6620E9A013A9079081C9489DA5EED020031048),
      .INIT_06(256'h0C7C10B0FC837BF5A6F41E79D3BD83B3760B60EED04C031068E7A720F0A066A9),
      .INIT_07(256'h91CC4C7E3A9944927E7E8830637D7A51EAB77D4C7064147DC1CB53DE7CCA671F),
      .INIT_08(256'h3830E938EFF020C90AB03AC9EA60ADB9E602D0B8E6000000008113AAAAAA7FC7),
      .INIT_09(256'h4CA9F273200584048502840185F1A028A99AFBA27686FFA25852C74F8060D0E9),
      .INIT_0A(256'h858AF286F6D0CAF186B095F10ABD1CA20C840B85E1A099A90A85908503850085),
      .INIT_0B(256'hA05184508508A000A9528655A201FC8D01FD8D01A9DAFB208F8503A9485485A4),
      .INIT_0C(256'h8474857384F02951A550A4ECF050D15091FF4908D050D15091FF4950B151E600),
      .INIT_0D(256'h20D3E32068A467A568E602D067E6679198D68400A06884678608A000A270856F),
      .INIT_0E(256'hF82000506CE75220DD672000016C02840185D4A03CA905840485DBA03AA9D64B),
      .INIT_0F(256'hB030E0E6F820DEC0202CA9F08613B030E0E6F820FE954C8AE6F820FE8B4C8AE6),
      .INIT_10(256'hE6F820DEC020C5A9F0862D852C85F0A508B0F0E4F1EC20E1994C602D862C8605),
      .INIT_11(256'h194CF0A4CAB028C02CA48AF20920F8004CD7B028C0F0A48AF1EC2060E2B030E0),
      .INIT_12(256'h4CA7B018C98ACAE6F820F8644C8AE6F820F8284CF0A5BCB028C0A88AF20920F8),
      .INIT_13(256'h60F386328500A23FA902D0FFA960F26618903860F186E8AAFF498AE6F820FB5B),
      .INIT_14(256'hA56F85738550A5D4104C03B06EE551A56DC550A5E75220DD6720F5D040A27FA9),
      .INIT_15(256'hD6906AE551A569C550A5E0B074E551A573C550A5E75220DD6720607085748551),
      .INIT_16(256'hA5F68575A5D86638F585B9A5F485B8A5DEC020ABA9D66C4C6A8551A5698550A5),
      .INIT_17(256'hA5DD857AA5DC8579A5DB8576A5DA8575A5DF86F8A6DE86D9984CD9A620F78576),
      .INIT_18(256'h7685DBA57585DAA5D7D24CD93E2000B7207685F7A57585F6A5B985F5A5B885F4),
      .INIT_19(256'h1A20DA0C206A86B0A66986AFA6FBB0DEC94CD7D24C9ADFA6B985DDA5B885DCA5),
      .INIT_1A(256'h9CA560C59BA5D61A2051E602D050E6DA0C20DEC0202CA961859CA560859BA5D6),
      .INIT_1B(256'hB09CE56AA59BC569A561E602D060E69CE602D09BE660919BB100A06001B061E5),
      .INIT_1C(256'h20FB394CC054ADFB404CC053ADC056ADD4F24C69846A8688CA01D060A461A6E6),
      .INIT_1D(256'h20F7D920FECD4CF7BC20FECD2051865085CA01B001E99BB188AA9BB103A0F7D9),
      .INIT_1E(256'h40A9C0522CC0552CFEFD4CF7BC20D4104C03B051E59BB1C850C59BB102A0FEFD),
      .INIT_1F(256'h1CA51A8400A01B85E6A51C8500A9C050ADC057ADE685C0532CC0542C20A908D0),
      .INIT_20(256'h26054A4A2685C02948E184E086E28560EED01F291BA51BE6F6D0C8F47E201A91),
      .INIT_21(256'h6923A005F000C08A2785E6051F2927A526660A27260A27260A0A0A2785682685),
      .INIT_22(256'h302526511CA5F411206028B01C85E4A54A983085F4B9BDAAE584FBB007E9C804),
      .INIT_23(256'hC90A1CA5E5843085C0A927A0021088603085C04905B04A30A523106026912651),
      .INIT_24(256'h29D1A518DCB000A0E09028C0C881A9DD3080490A30A5601C857F491CA50610C0),
      .INIT_25(256'h30251C4526B10EF00429D1A518111030257FA9EAE619D0263130257FA925F004),
      .INIT_26(256'hB0260622D0F5B92C27A518303092B06A02C90329D365D1A526912651EAE602D0),
      .INIT_27(256'h6926661F6902B0682685F06902B0B06926A548236912B0381F6905F0F4CD2C1A),
      .INIT_28(256'hF049506926A512F0F5082C18E06918902606F3D0F5B92C046927A518602785FC),
      .INIT_29(256'h8A48E0E5384868E285E185E08500A948D1902666E0690290E6A52685F04902F0),
      .INIT_2A(256'h1898E186E08568D485D08568D585D185D3E500A9480169FF49680AB0D385E1E5),
      .INIT_2B(256'hF465200A05B0E5A41D85D1E5FFA9AAD0E538D366E284D285FE69FF490490E2E5),
      .INIT_2C(256'hD3A562F01DE604D0E82691265130251C4526B1D58500E9D5A5D485D265D4A538),
      .INIT_2D(256'hE1ECF4FAFEFF1CC0A09088848281D950D165D5A5D485D065D4A518F4D320DAB0),
      .INIT_2E(256'h07294A4A27A5E2850A0A0A26052A032927A50A26A5FF18314961788DA1B4C5D4),
      .INIT_2F(256'hE085E1E60290E565188AE185FCD04AE87F2930A5CAAA0AE5650AE5A5E285E205),
      .INIT_30(256'hE5A4D284C8F5BBBCAA0F49D084F5BABCAA0F298AD3854A4A4A4AAA1B841A8660),
      .INIT_31(256'h65D5A518F4B3200490D485D06538D4A5E7A6D586D48680A2D1851AA1EA8600A2),
      .INIT_32(256'h841A8660CAD01AA11BE602D01AE6D4D04A4A4AD1A5E5D0CAF4B4200390D585D2),
      .INIT_33(256'hEA8600A2E5A4D284C8F5BBBCAA0F49D084F5BABCAA0F298AD3854A4A4A4AAA1B),
      .INIT_34(256'h90D585D265D5A518F49C200490D485D06538D4A5E7A6D586D48680A2D1851AA1),
      .INIT_35(256'hA4E75220DD672060CAD01AA11BE602D01AE6D4D04A4A4AD1A5E5D0CAF49D2003),
      .INIT_36(256'h689D8609B0C0E0E6F820DEC0202CA94898488A19B018E01DD0069001C050A651),
      .INIT_37(256'hC1C9FFD5AA807F552A0060E485F6F6BDF6B008E0E6F820F2064C609DA5AA68A8),
      .INIT_38(256'h084CF53A209DA68AA89D84F6B920DEC020E6D0C1C900B720F45720F6B9200DF0),
      .INIT_39(256'hB002F01AC100A28A1B85E9A51A85E8A5E6F82060E786E6F82060F986E6F820F7),
      .INIT_3A(256'hDEC02009D0C5C900B7201A861B85E9651AB1C8AA1A651AB1A8181BE603900AA5),
      .INIT_3B(256'hC83C8450A03F853D8500A9F6614CF72D20F6054CF72D2060F9A5F41120F6B920),
      .INIT_3C(256'h03D002906EC551E53F848801D0E8A874A54850E53E86CAAA73A518FEFD203E84),
      .INIT_3D(256'h659BA518FF024C03A9FCFA203C856F857385E88568E9853D8570857485D4104C),
      .INIT_3E(256'hDFE320148540A9603D8595A53C8594A5E0EF209BB104A03F8551659CA53E8550),
      .INIT_3F(256'h78D2CB602485F7EC4C68DAFB204828E90A9028C98ACAE6F820D8F04C148500A9),

      // The next set of INITP_xx are for the parity bits
      .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000)
   ) RAMB16_S9_F0 (
      .DO(DOA_F0),      // 8-bit Data Output
      .DOP(DOP_F0),    // 1-bit parity Output
      .ADDR(ADDRESS[10:0]),  // 11-bit Address Input
      .CLK(PH_2),    // Clock
      .DI(DATA_OUT),      // 8-bit Data Input
      .DIP(1'b0),    // 1-bit parity Input
      .EN(ENA_F0),      // RAM Enable Input
      .SSR(1'b0),    // Synchronous Set/Reset Input
      .WE(ROM_RW)       // Write Enable Input
   );

   // End of RAMB16_S9_inst instantiation
