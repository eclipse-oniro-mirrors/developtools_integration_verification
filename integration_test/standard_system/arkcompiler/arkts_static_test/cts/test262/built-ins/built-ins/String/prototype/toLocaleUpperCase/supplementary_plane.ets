/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
// arktsid: string_supplementary_plane
// description: String.prototype.toLocaleUpperCase() iterates over code points

function main(): void {
    arktest.assertEQ('\uD801\uDC28'.toLocaleUpperCase(), '\uD801\uDC00', 'DESERET SMALL LETTER LONG I');
    arktest.assertEQ('\uD801\uDC29'.toLocaleUpperCase(), '\uD801\uDC01', 'DESERET SMALL LETTER LONG E');
    arktest.assertEQ('\uD801\uDC2A'.toLocaleUpperCase(), '\uD801\uDC02', 'DESERET SMALL LETTER LONG A');
    arktest.assertEQ('\uD801\uDC2B'.toLocaleUpperCase(), '\uD801\uDC03', 'DESERET SMALL LETTER LONG AH');
    arktest.assertEQ('\uD801\uDC2C'.toLocaleUpperCase(), '\uD801\uDC04', 'DESERET SMALL LETTER LONG O');
    arktest.assertEQ('\uD801\uDC2D'.toLocaleUpperCase(), '\uD801\uDC05', 'DESERET SMALL LETTER LONG OO');
    arktest.assertEQ('\uD801\uDC2E'.toLocaleUpperCase(), '\uD801\uDC06', 'DESERET SMALL LETTER SHORT I');
    arktest.assertEQ('\uD801\uDC2F'.toLocaleUpperCase(), '\uD801\uDC07', 'DESERET SMALL LETTER SHORT E');
    arktest.assertEQ('\uD801\uDC30'.toLocaleUpperCase(), '\uD801\uDC08', 'DESERET SMALL LETTER SHORT A');
    arktest.assertEQ('\uD801\uDC31'.toLocaleUpperCase(), '\uD801\uDC09', 'DESERET SMALL LETTER SHORT AH');
    arktest.assertEQ('\uD801\uDC32'.toLocaleUpperCase(), '\uD801\uDC0A', 'DESERET SMALL LETTER SHORT O');
    arktest.assertEQ('\uD801\uDC33'.toLocaleUpperCase(), '\uD801\uDC0B', 'DESERET SMALL LETTER SHORT OO');
    arktest.assertEQ('\uD801\uDC34'.toLocaleUpperCase(), '\uD801\uDC0C', 'DESERET SMALL LETTER AY');
    arktest.assertEQ('\uD801\uDC35'.toLocaleUpperCase(), '\uD801\uDC0D', 'DESERET SMALL LETTER OW');
    arktest.assertEQ('\uD801\uDC36'.toLocaleUpperCase(), '\uD801\uDC0E', 'DESERET SMALL LETTER WU');
    arktest.assertEQ('\uD801\uDC37'.toLocaleUpperCase(), '\uD801\uDC0F', 'DESERET SMALL LETTER YEE');
    arktest.assertEQ('\uD801\uDC38'.toLocaleUpperCase(), '\uD801\uDC10', 'DESERET SMALL LETTER H');
    arktest.assertEQ('\uD801\uDC39'.toLocaleUpperCase(), '\uD801\uDC11', 'DESERET SMALL LETTER PEE');
    arktest.assertEQ('\uD801\uDC3A'.toLocaleUpperCase(), '\uD801\uDC12', 'DESERET SMALL LETTER BEE');
    arktest.assertEQ('\uD801\uDC3B'.toLocaleUpperCase(), '\uD801\uDC13', 'DESERET SMALL LETTER TEE');
    arktest.assertEQ('\uD801\uDC3C'.toLocaleUpperCase(), '\uD801\uDC14', 'DESERET SMALL LETTER DEE');
    arktest.assertEQ('\uD801\uDC3D'.toLocaleUpperCase(), '\uD801\uDC15', 'DESERET SMALL LETTER CHEE');
    arktest.assertEQ('\uD801\uDC3E'.toLocaleUpperCase(), '\uD801\uDC16', 'DESERET SMALL LETTER JEE');
    arktest.assertEQ('\uD801\uDC3F'.toLocaleUpperCase(), '\uD801\uDC17', 'DESERET SMALL LETTER KAY');
    arktest.assertEQ('\uD801\uDC40'.toLocaleUpperCase(), '\uD801\uDC18', 'DESERET SMALL LETTER GAY');
    arktest.assertEQ('\uD801\uDC41'.toLocaleUpperCase(), '\uD801\uDC19', 'DESERET SMALL LETTER EF');
    arktest.assertEQ('\uD801\uDC42'.toLocaleUpperCase(), '\uD801\uDC1A', 'DESERET SMALL LETTER VEE');
    arktest.assertEQ('\uD801\uDC43'.toLocaleUpperCase(), '\uD801\uDC1B', 'DESERET SMALL LETTER ETH');
    arktest.assertEQ('\uD801\uDC44'.toLocaleUpperCase(), '\uD801\uDC1C', 'DESERET SMALL LETTER THEE');
    arktest.assertEQ('\uD801\uDC45'.toLocaleUpperCase(), '\uD801\uDC1D', 'DESERET SMALL LETTER ES');
    arktest.assertEQ('\uD801\uDC46'.toLocaleUpperCase(), '\uD801\uDC1E', 'DESERET SMALL LETTER ZEE');
    arktest.assertEQ('\uD801\uDC47'.toLocaleUpperCase(), '\uD801\uDC1F', 'DESERET SMALL LETTER ESH');
    arktest.assertEQ('\uD801\uDC48'.toLocaleUpperCase(), '\uD801\uDC20', 'DESERET SMALL LETTER ZHEE');
    arktest.assertEQ('\uD801\uDC49'.toLocaleUpperCase(), '\uD801\uDC21', 'DESERET SMALL LETTER ER');
    arktest.assertEQ('\uD801\uDC4A'.toLocaleUpperCase(), '\uD801\uDC22', 'DESERET SMALL LETTER EL');
    arktest.assertEQ('\uD801\uDC4B'.toLocaleUpperCase(), '\uD801\uDC23', 'DESERET SMALL LETTER EM');
    arktest.assertEQ('\uD801\uDC4C'.toLocaleUpperCase(), '\uD801\uDC24', 'DESERET SMALL LETTER EN');
    arktest.assertEQ('\uD801\uDC4D'.toLocaleUpperCase(), '\uD801\uDC25', 'DESERET SMALL LETTER ENG');
    arktest.assertEQ('\uD801\uDC4E'.toLocaleUpperCase(), '\uD801\uDC26', 'DESERET SMALL LETTER OI');
    arktest.assertEQ('\uD801\uDC4F'.toLocaleUpperCase(), '\uD801\uDC27', 'DESERET SMALL LETTER EW');
}