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

// arktsid: isnan_false_for_numbers
// description: isNaN returns false for all non-NaN numbers including ±0, ±Infinity, integers, and floats
// Migrated from test262: built-ins/isNaN/return-false-not-nan-numbers.js

function main(): void {
    arktest.assertEQ(isNaN(0), false);
    arktest.assertEQ(isNaN(-0), false);

    let p53: double = Math.pow(2.0, 53.0);
    arktest.assertEQ(isNaN(p53), false);
    arktest.assertEQ(isNaN(-p53), false);

    arktest.assertEQ(isNaN(1), false);
    arktest.assertEQ(isNaN(-1), false);

    let d1: double = 0.000001;
    arktest.assertEQ(isNaN(d1), false);
    arktest.assertEQ(isNaN(-d1), false);

    let d2: double = 1e42;
    arktest.assertEQ(isNaN(d2), false);
    arktest.assertEQ(isNaN(-d2), false);

    arktest.assertEQ(isNaN(Infinity), false);
    arktest.assertEQ(isNaN(-Infinity), false);
}
