/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
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

// arktsid: numeric_separator_hex_repeated_digits
// description: Hexadecimal repeated digit separator cases

function main(): void {


    arktest.assertEQ(0x0_0, 0x00);
    arktest.assertEQ(0x1_1, 0x11);
    arktest.assertEQ(0x2_2, 0x22);
    arktest.assertEQ(0x3_3, 0x33);
    arktest.assertEQ(0x4_4, 0x44);
    arktest.assertEQ(0x5_5, 0x55);
    arktest.assertEQ(0x6_6, 0x66);
    arktest.assertEQ(0x7_7, 0x77);
    arktest.assertEQ(0x8_8, 0x88);
    arktest.assertEQ(0x9_9, 0x99);
    arktest.assertEQ(0xa_a, 0xaa);
    arktest.assertEQ(0xb_b, 0xbb);
    arktest.assertEQ(0xc_c, 0xcc);
    arktest.assertEQ(0xd_d, 0xdd);
    arktest.assertEQ(0xe_e, 0xee);
    arktest.assertEQ(0xf_f, 0xff);
    arktest.assertEQ(0xA_A, 0xAA);
    arktest.assertEQ(0xB_B, 0xBB);
    arktest.assertEQ(0xC_C, 0xCC);
    arktest.assertEQ(0xD_D, 0xDD);
    arktest.assertEQ(0xE_E, 0xEE);
    arktest.assertEQ(0xF_F, 0xFF);

}