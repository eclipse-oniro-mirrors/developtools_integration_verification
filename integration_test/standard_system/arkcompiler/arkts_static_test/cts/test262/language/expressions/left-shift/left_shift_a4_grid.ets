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

// arktsid: left_shift_a4_grid
// description: Left shift operator at distinct points (-2^n / 2^n-1 operands, counts 0-31)
// Conversion notes: folds S11.7.1_A4_T1..T4 (all int32-range integer literals, counts 0-31,
// no shift-count masking involved). int32 wrap on overflow (e.g. -2147483648 << 1 === 0,
// 2147483647 << 1 === -2, 65535 << 16 === -65536) assumes ArkTS int << wraps like JS ToInt32
// — assumption to be confirmed in batch run. T2/T3/T4 covered by this representative.

function main(): void {
    // T1: -2^n, n=0..31, counts 0-15
    arktest.assertEQ(-1 << 0, -1);
    arktest.assertEQ(-8 << 2, -32);
    arktest.assertEQ(-1 << 15, -32768);
    arktest.assertEQ(-2147483648 << 1, 0);
    // T2: -2^n, n=0..31, counts 16-31
    arktest.assertEQ(-32768 << 16, -2147483648);
    arktest.assertEQ(-1 << 31, -2147483648);
    arktest.assertEQ(-2 << 31, 0);
    // T3: 2^n-1, n=0..31, counts 0-15
    arktest.assertEQ(3 << 0, 3);
    arktest.assertEQ(65535 << 4, 1048560);
    arktest.assertEQ(2147483647 << 1, -2);
    // T4: 2^n-1, n=0..31, counts 16-31
    arktest.assertEQ(1 << 16, 65536);
    arktest.assertEQ(65535 << 16, -65536);
    arktest.assertEQ(1 << 31, -2147483648);
}
