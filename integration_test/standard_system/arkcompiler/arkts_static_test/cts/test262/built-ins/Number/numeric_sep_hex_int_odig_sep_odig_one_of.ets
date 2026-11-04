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
// arktsid: number_numeric_sep_hex_int_odig_sep_odig_one_of
// description: NumericLiteralSeparator is not valid on string conversions for ToNumber operations

function main(): void {
    arktest.assertTrue(isNaN(Number('0x0_0')), '0x0_0');
    arktest.assertTrue(isNaN(Number('0x1_1')), '0x1_1');
    arktest.assertTrue(isNaN(Number('0x2_2')), '0x2_2');
    arktest.assertTrue(isNaN(Number('0x3_3')), '0x3_3');
    arktest.assertTrue(isNaN(Number('0x4_4')), '0x4_4');
    arktest.assertTrue(isNaN(Number('0x5_5')), '0x5_5');
    arktest.assertTrue(isNaN(Number('0x6_6')), '0x6_6');
    arktest.assertTrue(isNaN(Number('0x7_7')), '0x7_7');
    arktest.assertTrue(isNaN(Number('0x8_8')), '0x8_8');
    arktest.assertTrue(isNaN(Number('0x9_9')), '0x9_9');
    arktest.assertTrue(isNaN(Number('0xa_a')), '0xa_a');
    arktest.assertTrue(isNaN(Number('0xb_b')), '0xb_b');
    arktest.assertTrue(isNaN(Number('0xc_c')), '0xc_c');
    arktest.assertTrue(isNaN(Number('0xd_d')), '0xd_d');
    arktest.assertTrue(isNaN(Number('0xe_e')), '0xe_e');
    arktest.assertTrue(isNaN(Number('0xf_f')), '0xf_f');
    arktest.assertTrue(isNaN(Number('0xA_A')), '0xA_A');
    arktest.assertTrue(isNaN(Number('0xB_B')), '0xB_B');
    arktest.assertTrue(isNaN(Number('0xC_C')), '0xC_C');
    arktest.assertTrue(isNaN(Number('0xD_D')), '0xD_D');
    arktest.assertTrue(isNaN(Number('0xE_E')), '0xE_E');
    arktest.assertTrue(isNaN(Number('0xF_F')), '0xF_F');
}