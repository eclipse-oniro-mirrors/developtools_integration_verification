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
// description: String.prototype.toLowerCase() iterates over code points

function main(): void {
    arktest.assertEQ('\uD801\uDC00'.toLowerCase(), '\uD801\uDC28', 'DESERET CAPITAL LETTER LONG I');
    arktest.assertEQ('\uD801\uDC01'.toLowerCase(), '\uD801\uDC29', 'DESERET CAPITAL LETTER LONG E');
    arktest.assertEQ('\uD801\uDC02'.toLowerCase(), '\uD801\uDC2A', 'DESERET CAPITAL LETTER LONG A');
    arktest.assertEQ('\uD801\uDC03'.toLowerCase(), '\uD801\uDC2B', 'DESERET CAPITAL LETTER LONG AH');
    arktest.assertEQ('\uD801\uDC04'.toLowerCase(), '\uD801\uDC2C', 'DESERET CAPITAL LETTER LONG O');
    arktest.assertEQ('\uD801\uDC05'.toLowerCase(), '\uD801\uDC2D', 'DESERET CAPITAL LETTER LONG OO');
    arktest.assertEQ('\uD801\uDC06'.toLowerCase(), '\uD801\uDC2E', 'DESERET CAPITAL LETTER SHORT I');
    arktest.assertEQ('\uD801\uDC07'.toLowerCase(), '\uD801\uDC2F', 'DESERET CAPITAL LETTER SHORT E');
    arktest.assertEQ('\uD801\uDC08'.toLowerCase(), '\uD801\uDC30', 'DESERET CAPITAL LETTER SHORT A');
    arktest.assertEQ('\uD801\uDC09'.toLowerCase(), '\uD801\uDC31', 'DESERET CAPITAL LETTER SHORT AH');
    arktest.assertEQ('\uD801\uDC0A'.toLowerCase(), '\uD801\uDC32', 'DESERET CAPITAL LETTER SHORT O');
    arktest.assertEQ('\uD801\uDC0B'.toLowerCase(), '\uD801\uDC33', 'DESERET CAPITAL LETTER SHORT OO');
    arktest.assertEQ('\uD801\uDC0C'.toLowerCase(), '\uD801\uDC34', 'DESERET CAPITAL LETTER AY');
    arktest.assertEQ('\uD801\uDC0D'.toLowerCase(), '\uD801\uDC35', 'DESERET CAPITAL LETTER OW');
    arktest.assertEQ('\uD801\uDC0E'.toLowerCase(), '\uD801\uDC36', 'DESERET CAPITAL LETTER WU');
    arktest.assertEQ('\uD801\uDC0F'.toLowerCase(), '\uD801\uDC37', 'DESERET CAPITAL LETTER YEE');
    arktest.assertEQ('\uD801\uDC10'.toLowerCase(), '\uD801\uDC38', 'DESERET CAPITAL LETTER H');
    arktest.assertEQ('\uD801\uDC11'.toLowerCase(), '\uD801\uDC39', 'DESERET CAPITAL LETTER PEE');
    arktest.assertEQ('\uD801\uDC12'.toLowerCase(), '\uD801\uDC3A', 'DESERET CAPITAL LETTER BEE');
    arktest.assertEQ('\uD801\uDC13'.toLowerCase(), '\uD801\uDC3B', 'DESERET CAPITAL LETTER TEE');
    arktest.assertEQ('\uD801\uDC14'.toLowerCase(), '\uD801\uDC3C', 'DESERET CAPITAL LETTER DEE');
    arktest.assertEQ('\uD801\uDC15'.toLowerCase(), '\uD801\uDC3D', 'DESERET CAPITAL LETTER CHEE');
    arktest.assertEQ('\uD801\uDC16'.toLowerCase(), '\uD801\uDC3E', 'DESERET CAPITAL LETTER JEE');
    arktest.assertEQ('\uD801\uDC17'.toLowerCase(), '\uD801\uDC3F', 'DESERET CAPITAL LETTER KAY');
    arktest.assertEQ('\uD801\uDC18'.toLowerCase(), '\uD801\uDC40', 'DESERET CAPITAL LETTER GAY');
    arktest.assertEQ('\uD801\uDC19'.toLowerCase(), '\uD801\uDC41', 'DESERET CAPITAL LETTER EF');
    arktest.assertEQ('\uD801\uDC1A'.toLowerCase(), '\uD801\uDC42', 'DESERET CAPITAL LETTER VEE');
    arktest.assertEQ('\uD801\uDC1B'.toLowerCase(), '\uD801\uDC43', 'DESERET CAPITAL LETTER ETH');
    arktest.assertEQ('\uD801\uDC1C'.toLowerCase(), '\uD801\uDC44', 'DESERET CAPITAL LETTER THEE');
    arktest.assertEQ('\uD801\uDC1D'.toLowerCase(), '\uD801\uDC45', 'DESERET CAPITAL LETTER ES');
    arktest.assertEQ('\uD801\uDC1E'.toLowerCase(), '\uD801\uDC46', 'DESERET CAPITAL LETTER ZEE');
    arktest.assertEQ('\uD801\uDC1F'.toLowerCase(), '\uD801\uDC47', 'DESERET CAPITAL LETTER ESH');
    arktest.assertEQ('\uD801\uDC20'.toLowerCase(), '\uD801\uDC48', 'DESERET CAPITAL LETTER ZHEE');
    arktest.assertEQ('\uD801\uDC21'.toLowerCase(), '\uD801\uDC49', 'DESERET CAPITAL LETTER ER');
    arktest.assertEQ('\uD801\uDC22'.toLowerCase(), '\uD801\uDC4A', 'DESERET CAPITAL LETTER EL');
    arktest.assertEQ('\uD801\uDC23'.toLowerCase(), '\uD801\uDC4B', 'DESERET CAPITAL LETTER EM');
    arktest.assertEQ('\uD801\uDC24'.toLowerCase(), '\uD801\uDC4C', 'DESERET CAPITAL LETTER EN');
    arktest.assertEQ('\uD801\uDC25'.toLowerCase(), '\uD801\uDC4D', 'DESERET CAPITAL LETTER ENG');
    arktest.assertEQ('\uD801\uDC26'.toLowerCase(), '\uD801\uDC4E', 'DESERET CAPITAL LETTER OI');
    arktest.assertEQ('\uD801\uDC27'.toLowerCase(), '\uD801\uDC4F', 'DESERET CAPITAL LETTER EW');
}