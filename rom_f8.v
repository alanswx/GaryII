/*****************************************************************************
* 2k F8 ROM for APPLE 2E Initialized with LPC loader code
******************************************************************************/
   // RAMB16_S9: Virtex-II/II-Pro, Spartan-3/3E 2k x 8 + 1 Parity bit Single-Port RAM
   // Xilinx HDL Language Template version 7.1i

   RAMB16_S9 #(
      .INIT(9'h000),  // Value of output RAM registers at startup
      .SRVAL(9'h000), // Ouput value upon SSR assertion
      .WRITE_MODE("READ_FIRST"), // WRITE_FIRST, READ_FIRST or NO_CHANGE

      // The following INIT_xx declarations specify the initial contents of the RAM
//F8
      .INIT_00(256'h11B02CC4F8002060269126512E25304526B12E85E06902900FA928F84720084A),
      .INIT_01(256'h308500A927A02D8427A002D02FA060F5902DC568F80020480169F690F80E20C8),
      .INIT_02(256'hA560268526050A0A26857F6902901829682785040903294A4860F61088F82820),
      .INIT_03(256'h294A4A4A4A04902826B1F84720084A60308530050A0A0A0A30850F2903691830),
      .INIT_04(256'hF962BDAA4A87290CF0A2C910B06A09904AA83AA1F94820FD96203BA43AA6600F),
      .INIT_05(256'h904A0BF08AE003A098AA8F29982F8503292E85F9A6BDAA00A980A004D0F87920),
      .INIT_06(256'h2FC4F94A2001A2FDDA203AB148F88220FFFFFF60F2D088C8FAD08820094A4A08),
      .INIT_07(256'hD0882A2C262D0605A000A92D85FA00B92C85F9C0B9A868F29004C003A2F190C8),
//F9
      .INIT_08(256'hB9BDFDED20F9B3BD0E902E061CF003E006A22FA4F94820ECD0CAFDED20BF69F8),
      .INIT_09(256'hC801D0E8AAF95620F2903AB1E8C92EA5FDDA20E7308860E7D0CAFDED2003F0F9),
      .INIT_0A(256'h01903A65880110AA3BA42FA53860F8D0CAFDED20A0A903A2FDDA4C8AFDDA2098),
      .INIT_0B(256'h800D3B5420049004800D335420049004800D335422039004800D3054200460C8),
      .INIT_0C(256'h800D334422019004800D33442201A944C80D334422110044C80D334422009004),
      .INIT_0D(256'h00A4A4D800D9A4A8A3ACA9AC9D854A8692914D590000828121009A8731269004),
      .INIT_0E(256'hA1195324231B53242319A869AE192900A11D8B9D231D8A9DA11B8B5D231C8A1C),
      .INIT_0F(256'hA02369A511341384532969A59C6D9C15007C0029ADA8AEAE242469A55B5B1A00),
//FA
      .INIT_10(256'h8AA4F2724ACCF4746E28B4748408B40094E8446854C8445488946226485A62D8),
      .INIT_11(256'hC8A244444826CAC4C888727226261A1A002200B232B2684472747474A2A2AA00),
      .INIT_12(256'h4CFADA20F8822003F06C3B85683A8568FF4C202803FE6C03300A0A0A48684585),
      .INIT_13(256'h102CCFFFADEAFBB42005A0C05AADC058ADFE8920FE9320FB2F20FE8420D8FF65),
      .INIT_14(256'h03F28C03A008D003F3CDE0A90FD003F2AD17D003F4CDA54903F3ADFF3A20D8C0),
      .INIT_15(256'h01A501C607A001850086C8A9F7D0CA03EF9DFAFCBD05A2FB602003F26CE0004C),
      .INIT_16(256'h00A9408545A9FD8E20EAEA00006CF5108888ECD0FB01D900B107F88DD7F0C0C9),
      .INIT_17(256'h00FA5960E830E8FDDA204AB5FDED20BDA9FDED20FA1EBDFDED20A0A9FBA24185),
//FB
      .INIT_18(256'h70ADD3D0D9D8C1FFFFFFC3FFC1C2C4DBDDA0E5ECF0F0C13CFF03FF00FF2045E0),
      .INIT_19(256'h0BF000A9C051ADC054ADC056AD488500A96088F8D0C80410C064BDEAEA00A0C0),
      .INIT_1A(256'hFC224C258517A9238518A95FD008A0208500A9228514A9F83620C053ADC050AD),
      .INIT_1B(256'h10C000AC18D08DC96003F48DA54903F3AD60F7D088040E99FB08B908A0FC5820),
      .INIT_1C(256'h20FA48B9A8FC2C4C38FBFD4CC0102C03F083C0FB10C000ACC0102C0FD093C013),
      .INIT_1D(256'hC1004CC0078D08C0152C780806E8D0E6F0CCC9EA90C9C9EEB0CEC9FD2120FB97),
      .INIT_1E(256'h2040A912D087C960288528050A0A28857F6902901829682985040903294A48EA),
      .INIT_1F(256'hB0A0C96066B021C524A524E6289124A460F5D088C030ADFCA8200CA9C0A0FCA8),
//FC
      .INIT_20(256'h0BB025C522A524C6248521A5E81024C6C9D088C95AF08AC95AF08DC9EC10A8EF),
      .INIT_21(256'h5C90FD69DEF02C90FD69DAF0C090FD6928F0C0496028852065FBC12025A525C6),
      .INIT_22(256'hCBC3C9D216D001A0C5CCD0D0C1A0ACB2B8ADB1B8B9B1A0A9C3A82CF000A0E9D0),
      .INIT_23(256'h9008C01C2C680AC018AD48FBB44C02A025C6B69023C525A525E6248500A9C1A0),
      .INIT_24(256'h8438B018EAEA60C0552C0310059028C0078D03107858C0068DC0152CC0548D03),
      .INIT_25(256'h3DA53EC53CA543E602D042E660F6D001E968FCD001E94838CAD0C8CD9003A01F),
      .INIT_26(256'h0590FDD088C8C8FCDB2021A0F5B0FE69F9D0FCDB204BA0603DE602D03CE63FE5),
      .INIT_27(256'h60AD88FCFD2060F5D0CA3AA02A68FCFA204808A260CA2CA0C020ACFDD08832A0),
//FD
      .INIT_28(256'hFBB44C06A000386C68289140093F294828B124A46080C02F852F45F8102F45C0),
      .INIT_29(256'h4832A560F3F09BC9FD0C20FBA520FD2120606028C0068DFBB44C07A0FD0C20EA),
      .INIT_2A(256'hE8FF3A200390F8E00AF098C91DF088C90200BD328568FDED200200BDEAEAFFA9),
      .INIT_2B(256'hE0C928B102D095C9FD3520CAF3F08A01A2FDED2033A5FD8E20FDED20DCA913D0),
      .INIT_2C(256'hADA900A0F94020FD8E203CA63DA45BD08DA9FC9C20B2D08DC902009DFF290290),
      .INIT_2D(256'hFDDA203CB1FDED20A0A9FD922003D007293CA53F853DA53E8507093CA5FDED4C),
      .INIT_2E(256'h204A4A4A4A4868FDED20BDA9483C65FF4902903EA54A4AEA904A60E890FCBA20),
      .INIT_2F(256'h6035A468FB782048358432250290A0C900366C06690290BAC9B0090F2968FDE5),
//FE
      .INIT_30(256'h60318501FFB934A46041E602D040E640913EA53185BBD0BAC916D0CA9FF034C6),
      .INIT_31(256'hB1FD92201CF042D13CB160F790FCB42042913CB160F710CA449542953EB501A2),
      .INIT_32(256'h752060D990FCB420FDED20A9A9FDDA2042B1FDED20A8A9FDED20A0A9FDDA203C),
      .INIT_33(256'h60F910CA3A953CB507F08A60EFD001E938683B843A85F95320F8D0204814A9FE),
      .INIT_34(256'hF00F293EA5F0A036A23E8500A908D01BA038A23E8500A9603284FFA002D03FA0),
      .INIT_35(256'h4C003A6CFF3F20FE7520E0034CE0004CD1EA6001950094FDA902F000A0C00906),
      .INIT_36(256'hBA20FEED203CA1483C4100A227A0FCC92040A903F84CEEE1F9F2C260EA60FAD7),
      .INIT_37(256'hFCFA206CD06868FE002060FAD0FCD6200A10A24DF0FEED2022A0EE90681DA0FC),
//FF
      .INIT_38(256'h202E852E453C81FCEC203BA0FCFD20F9B0FCFD2024A0FCFA202E85FCC92016A9),
      .INIT_39(256'hA5FDED4C87A9FDED20FDED20D2A9FDED20C5A90DF02EC5FCEC20F09035A0FCBA),
//FF5X              F E D C B A 9 8 7 6 5 4 3 2 1 0 FF4X
      .INIT_3A(256'h20FB2F20FE842060D84986BA48856808478446864585602847A446A645A54848),
      .INIT_3B(256'hFFCCD9E8308817A03484FFA720FFC720FD67203385AAA9FF3A20D8FE8920FE93),
      .INIT_3C(256'h3D953FB506D031A5F810CA3F263E260A0A0A0A0A03A2FF734C34A4FFBE20F8D0),
      .INIT_3D(256'hFEA960CDB0FAC98869D3900AC9B049C80200B93F863E8600A206D0F3F0E84195),
      .INIT_3E(256'h93EB00F00502079506A4A6BBA9B2C4EFB2BEB2BC60318400A031A548FFE3B948),
      .INIT_3F(256'hFA40FA6203FB03F51717FCB5CC5D7F831F2B1717AF96C48C35C1BEC9B299C6A7),

      // The next set of INITP_xx are for the parity bits
      .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
      .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000)
   ) RAMB16_S9_F8 (
      .DO(DOA_F8),      // 8-bit Data Output
      .DOP(DOP_F8),    // 1-bit parity Output
      .ADDR(ADDRESS[10:0]),  // 11-bit Address Input
      .CLK(PH_2),    // Clock
      .DI(DATA_OUT),      // 8-bit Data Input
      .DIP(1'b0),    // 1-bit parity Input
      .EN(ENA_F8),      // RAM Enable Input
      .SSR(1'b0),    // Synchronous Set/Reset Input
      .WE(ROM_RW)       // Write Enable Input
   );

   // End of RAMB16_S9_inst instantiation