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

// arktsid: isfinite_valid_numbers
// description: isFinite returns true for valid finite numbers including ±0, ±1, powers of 2, and exponents
// Migrated from test262: built-ins/isFinite/return-true-for-valid-finite-numbers.js

function main(): void {
    arktest.assertEQ(isFinite(0), true);
    arktest.assertEQ(isFinite(-0), true);

    // Math.pow(2, 53) - use double to avoid int overflow
    let p53: double = Math.pow(2.0, 53.0);
    arktest.assertEQ(isFinite(p53), true);
    arktest.assertEQ(isFinite(-p53), true);

    arktest.assertEQ(isFinite(1), true);
    arktest.assertEQ(isFinite(-1), true);

    let d1: double = 0.000001;
    arktest.assertEQ(isFinite(d1), true);
    arktest.assertEQ(isFinite(-d1), true);

    let d2: double = 1e42;
    arktest.assertEQ(isFinite(d2), true);
    arktest.assertEQ(isFinite(-d2), true);
}
