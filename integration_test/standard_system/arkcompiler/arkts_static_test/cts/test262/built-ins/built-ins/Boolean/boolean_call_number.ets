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

// arktsid: boolean_call_number
// description: Boolean() called with various number values returns correct boolean
// Migrated from test262: built-ins/Boolean/S15.6.1.1_A1_T2.js

function main(): void {
    // Boolean(0) returns false
    arktest.assertEQ(typeof Boolean(0), 'boolean');
    arktest.assertEQ(Boolean(0), false);

    // Boolean(-1) returns true (non-zero number)
    arktest.assertEQ(typeof Boolean(-1), 'boolean');
    arktest.assertEQ(Boolean(-1), true);

    // Boolean(-Infinity) returns true (non-zero)
    arktest.assertEQ(typeof Boolean(-Infinity), 'boolean');
    arktest.assertEQ(Boolean(-Infinity), true);

    // Boolean(NaN) returns false (NaN treated as falsy)
    arktest.assertEQ(typeof Boolean(NaN), 'boolean');
    arktest.assertEQ(Boolean(NaN), false);
}