/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// arktsid: right_shift_a4_grid
// description: Right shift operator at distinct points (-2^n / 2^n-1 operands, counts 0-31)
// Conversion notes: folds S11.7.2_A4_T1..T4. Arithmetic shift sign-extends negatives
// (e.g. -1 >> 16 === -1, -2 >> 31 === -1); results always fit int32, so no wrap assumption.
// No shift-count masking (counts 0-31). T2/T3/T4 covered by this representative.

function main(): void {
    // T1: -2^n, n=0..31, counts 0-15
    arktest.assertEQ(-1 >> 0, -1);
    arktest.assertEQ(-8 >> 2, -2);
    arktest.assertEQ(-32768 >> 4, -2048);
    arktest.assertEQ(-2147483648 >> 1, -1073741824);
    // T2: -2^n, n=0..31, counts 16-31
    arktest.assertEQ(-1 >> 16, -1);
    arktest.assertEQ(-2147483648 >> 16, -32768);
    arktest.assertEQ(-2 >> 31, -1);
    // T3: 2^n-1, n=0..31, counts 0-15
    arktest.assertEQ(3 >> 1, 1);
    arktest.assertEQ(65535 >> 4, 4095);
    arktest.assertEQ(2147483647 >> 15, 65535);
    // T4: 2^n-1, n=0..31, counts 16-31
    arktest.assertEQ(65535 >> 16, 0);
    arktest.assertEQ(2147483647 >> 16, 32767);
    arktest.assertEQ(65535 >> 31, 0);
}
