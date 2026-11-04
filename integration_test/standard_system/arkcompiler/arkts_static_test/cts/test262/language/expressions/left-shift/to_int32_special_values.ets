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

// arktsid: to_int32_special_values
// description: ToInt32 of NaN/+0/-0 via <<0 yields +0
// Conversion notes: kept the conformant subset of S9.5_A1_T1.js (verified on
// es2panda 2026-08-17, commit 73c269 — probe_left_s95_a1.ets): Double.NaN << 0,
// 0.0 << 0, -0.0 << 0 all PASS (=+0). DIVERGENCE (also verified): ±Infinity
// saturate via double→long (Long.MAX/MIN_VALUE) instead of JS ToInt32 → +0, so
// those two checks were dropped — same divergence as bitwise_not_special_values.ets.
// Number("abc") check dropped (no ArkTS equivalent of the global Number()).

function main(): void {
    // CHECK#1: (NaN << 0) === +0
    arktest.assertPositiveZero(Double.NaN << 0);
    // CHECK#3: (0 << 0) === +0
    arktest.assertEQ(0.0 << 0, 0);
    // CHECK#4: (-0 << 0) === +0
    arktest.assertPositiveZero(-0.0 << 0);
}
