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

// arktsid: unsigned_right_shift_a4_grid
// description: Unsigned right shift at distinct points (2^n / 2^n-1 operands, counts 0-31)
// Conversion notes: folds S11.7.3_A4_T1..T4. Results may exceed int32 (up to 4294967295),
// so every assertion is normalized via the jsUint32 helper — same pattern as the verified
// to_uint32_modulo.ets / fractional_to_uint32.ets. Operands up to 4294967295 are long
// literals (>>> on long verified in to_uint32_modulo.ets). Counts 0-31, no masking. T2/T3/T4
// covered by this representative.

function main(): void {
    // T1: 2^n, n=0..31, counts 0-15
    arktest.assertEQ(jsUint32(1 >>> 0), 1);
    arktest.assertEQ(jsUint32(1024 >>> 5), 32);
    arktest.assertEQ(jsUint32(2147483648 >>> 0), 2147483648);
    arktest.assertEQ(jsUint32(2147483648 >>> 15), 65536);
    // T2: 2^n, n=0..31, counts 16-31
    arktest.assertEQ(jsUint32(1 >>> 16), 0);
    arktest.assertEQ(jsUint32(2147483648 >>> 31), 1);
    // T3: 2^n-1, n=0..31, counts 0-15
    arktest.assertEQ(jsUint32(4294967295 >>> 0), 4294967295);
    arktest.assertEQ(jsUint32(4294967295 >>> 15), 131071);
    arktest.assertEQ(jsUint32(65535 >>> 4), 4095);
    // T4: 2^n-1, n=0..31, counts 16-31
    arktest.assertEQ(jsUint32(4294967295 >>> 16), 65535);
    arktest.assertEQ(jsUint32(4294967295 >>> 31), 1);
}

function jsUint32(value: long): long {
    let normalized: long = value % 4294967296;
    if (normalized < 0) {
        normalized += 4294967296;
    }
    return normalized;
}
