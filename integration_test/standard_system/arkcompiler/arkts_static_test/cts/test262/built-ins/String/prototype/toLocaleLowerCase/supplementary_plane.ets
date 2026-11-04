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
// description: String.prototype.toLocaleLowerCase() iterates over code points

function main(): void {
    arktest.assertEQ('\uD801\uDC00'.toLocaleLowerCase(), '\uD801\uDC28', 'DESERET CAPITAL LETTER LONG I');
    arktest.assertEQ('\uD801\uDC01'.toLocaleLowerCase(), '\uD801\uDC29', 'DESERET CAPITAL LETTER LONG E');
    arktest.assertEQ('\uD801\uDC02'.toLocaleLowerCase(), '\uD801\uDC2A', 'DESERET CAPITAL LETTER LONG A');
    arktest.assertEQ('\uD801\uDC03'.toLocaleLowerCase(), '\uD801\uDC2B', 'DESERET CAPITAL LETTER LONG AH');
    arktest.assertEQ('\uD801\uDC04'.toLocaleLowerCase(), '\uD801\uDC2C', 'DESERET CAPITAL LETTER LONG O');
    arktest.assertEQ('\uD801\uDC05'.toLocaleLowerCase(), '\uD801\uDC2D', 'DESERET CAPITAL LETTER LONG OO');
    arktest.assertEQ('\uD801\uDC06'.toLocaleLowerCase(), '\uD801\uDC2E', 'DESERET CAPITAL LETTER SHORT I');
    arktest.assertEQ('\uD801\uDC07'.toLocaleLowerCase(), '\uD801\uDC2F', 'DESERET CAPITAL LETTER SHORT E');
    arktest.assertEQ('\uD801\uDC08'.toLocaleLowerCase(), '\uD801\uDC30', 'DESERET CAPITAL LETTER SHORT A');
    arktest.assertEQ('\uD801\uDC09'.toLocaleLowerCase(), '\uD801\uDC31', 'DESERET CAPITAL LETTER SHORT AH');
    arktest.assertEQ('\uD801\uDC0A'.toLocaleLowerCase(), '\uD801\uDC32', 'DESERET CAPITAL LETTER SHORT O');
    arktest.assertEQ('\uD801\uDC0B'.toLocaleLowerCase(), '\uD801\uDC33', 'DESERET CAPITAL LETTER SHORT OO');
    arktest.assertEQ('\uD801\uDC0C'.toLocaleLowerCase(), '\uD801\uDC34', 'DESERET CAPITAL LETTER AY');
    arktest.assertEQ('\uD801\uDC0D'.toLocaleLowerCase(), '\uD801\uDC35', 'DESERET CAPITAL LETTER OW');
    arktest.assertEQ('\uD801\uDC0E'.toLocaleLowerCase(), '\uD801\uDC36', 'DESERET CAPITAL LETTER WU');
    arktest.assertEQ('\uD801\uDC0F'.toLocaleLowerCase(), '\uD801\uDC37', 'DESERET CAPITAL LETTER YEE');
    arktest.assertEQ('\uD801\uDC10'.toLocaleLowerCase(), '\uD801\uDC38', 'DESERET CAPITAL LETTER H');
    arktest.assertEQ('\uD801\uDC11'.toLocaleLowerCase(), '\uD801\uDC39', 'DESERET CAPITAL LETTER PEE');
    arktest.assertEQ('\uD801\uDC12'.toLocaleLowerCase(), '\uD801\uDC3A', 'DESERET CAPITAL LETTER BEE');
    arktest.assertEQ('\uD801\uDC13'.toLocaleLowerCase(), '\uD801\uDC3B', 'DESERET CAPITAL LETTER TEE');
    arktest.assertEQ('\uD801\uDC14'.toLocaleLowerCase(), '\uD801\uDC3C', 'DESERET CAPITAL LETTER DEE');
    arktest.assertEQ('\uD801\uDC15'.toLocaleLowerCase(), '\uD801\uDC3D', 'DESERET CAPITAL LETTER CHEE');
    arktest.assertEQ('\uD801\uDC16'.toLocaleLowerCase(), '\uD801\uDC3E', 'DESERET CAPITAL LETTER JEE');
    arktest.assertEQ('\uD801\uDC17'.toLocaleLowerCase(), '\uD801\uDC3F', 'DESERET CAPITAL LETTER KAY');
    arktest.assertEQ('\uD801\uDC18'.toLocaleLowerCase(), '\uD801\uDC40', 'DESERET CAPITAL LETTER GAY');
    arktest.assertEQ('\uD801\uDC19'.toLocaleLowerCase(), '\uD801\uDC41', 'DESERET CAPITAL LETTER EF');
    arktest.assertEQ('\uD801\uDC1A'.toLocaleLowerCase(), '\uD801\uDC42', 'DESERET CAPITAL LETTER VEE');
    arktest.assertEQ('\uD801\uDC1B'.toLocaleLowerCase(), '\uD801\uDC43', 'DESERET CAPITAL LETTER ETH');
    arktest.assertEQ('\uD801\uDC1C'.toLocaleLowerCase(), '\uD801\uDC44', 'DESERET CAPITAL LETTER THEE');
    arktest.assertEQ('\uD801\uDC1D'.toLocaleLowerCase(), '\uD801\uDC45', 'DESERET CAPITAL LETTER ES');
    arktest.assertEQ('\uD801\uDC1E'.toLocaleLowerCase(), '\uD801\uDC46', 'DESERET CAPITAL LETTER ZEE');
    arktest.assertEQ('\uD801\uDC1F'.toLocaleLowerCase(), '\uD801\uDC47', 'DESERET CAPITAL LETTER ESH');
    arktest.assertEQ('\uD801\uDC20'.toLocaleLowerCase(), '\uD801\uDC48', 'DESERET CAPITAL LETTER ZHEE');
    arktest.assertEQ('\uD801\uDC21'.toLocaleLowerCase(), '\uD801\uDC49', 'DESERET CAPITAL LETTER ER');
    arktest.assertEQ('\uD801\uDC22'.toLocaleLowerCase(), '\uD801\uDC4A', 'DESERET CAPITAL LETTER EL');
    arktest.assertEQ('\uD801\uDC23'.toLocaleLowerCase(), '\uD801\uDC4B', 'DESERET CAPITAL LETTER EM');
    arktest.assertEQ('\uD801\uDC24'.toLocaleLowerCase(), '\uD801\uDC4C', 'DESERET CAPITAL LETTER EN');
    arktest.assertEQ('\uD801\uDC25'.toLocaleLowerCase(), '\uD801\uDC4D', 'DESERET CAPITAL LETTER ENG');
    arktest.assertEQ('\uD801\uDC26'.toLocaleLowerCase(), '\uD801\uDC4E', 'DESERET CAPITAL LETTER OI');
    arktest.assertEQ('\uD801\uDC27'.toLocaleLowerCase(), '\uD801\uDC4F', 'DESERET CAPITAL LETTER EW');
}