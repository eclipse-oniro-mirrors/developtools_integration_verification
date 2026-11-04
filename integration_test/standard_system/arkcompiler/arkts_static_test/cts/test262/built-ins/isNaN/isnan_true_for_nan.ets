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

// arktsid: isnan_true_for_nan
// description: isNaN returns true only for NaN
// Migrated from test262: built-ins/isNaN/return-true-nan.js

function main(): void {
    // isNaN(NaN) returns true
    arktest.assertEQ(isNaN(NaN), true);
    arktest.assertEQ(isNaN(Number.NaN), true);

    // Additional NaN representations
    let nan1: double = 0.0 / 0.0;
    arktest.assertEQ(isNaN(nan1), true);

    let nan2: double = Infinity - Infinity;
    arktest.assertEQ(isNaN(nan2), true);
}
