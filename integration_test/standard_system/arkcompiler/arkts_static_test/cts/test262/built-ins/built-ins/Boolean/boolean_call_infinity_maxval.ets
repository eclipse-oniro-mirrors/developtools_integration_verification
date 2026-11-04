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

// arktsid: boolean_call_infinity_maxval
// description: Boolean() with Infinity, MAX_VALUE, MIN_VALUE, and non-zero numbers returns true
// Migrated from test262: built-ins/Boolean/S9.2_A4_T3.js

function main(): void {
    arktest.assertEQ(Boolean(Number.POSITIVE_INFINITY), true);
    arktest.assertEQ(Boolean(Number.NEGATIVE_INFINITY), true);
    arktest.assertEQ(Boolean(Number.MAX_VALUE), true);
    arktest.assertEQ(Boolean(Number.MIN_VALUE), true);
    arktest.assertEQ(Boolean(13), true);
    arktest.assertEQ(Boolean(-13), true);
    // Use double literals for floating point values
    let d1: double = 1.3;
    arktest.assertEQ(Boolean(d1), true);
    let d2: double = -1.3;
    arktest.assertEQ(Boolean(d2), true);
}
