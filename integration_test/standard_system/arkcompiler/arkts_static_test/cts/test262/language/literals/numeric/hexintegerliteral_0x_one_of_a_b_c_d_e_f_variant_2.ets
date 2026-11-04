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

// arktsid: hexintegerliteral_0x_one_of_a_b_c_d_e_f_variant_2
// description: HexIntegerLiteral :: 0X one of a, b, c, d, e, f

function main(): void {
    arktest.assertEQ(0Xa, 10, '#a: 0Xa === 10');
    arktest.assertEQ(0Xb, 11, '#b: 0Xb === 11');
    arktest.assertEQ(0Xc, 12, '#c: 0Xc === 12');
    arktest.assertEQ(0Xd, 13, '#d: 0Xd === 13');
    arktest.assertEQ(0Xe, 14, '#e: 0Xe === 14');
    arktest.assertEQ(0Xf, 15, '#f: 0Xf === 15');
}
