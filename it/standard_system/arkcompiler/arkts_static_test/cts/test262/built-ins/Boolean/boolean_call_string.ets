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

// arktsid: boolean_call_string
// description: Boolean() called with various string values returns correct boolean (empty=false, nonempty=true)
// Migrated from test262: built-ins/Boolean/S15.6.1.1_A1_T3.js

function main(): void {
    // Boolean("0") - non-empty string -> true
    arktest.assertEQ(typeof Boolean('0'), 'boolean');
    arktest.assertEQ(Boolean('0'), true);

    // Boolean("-1") - non-empty string -> true
    arktest.assertEQ(typeof Boolean('-1'), 'boolean');
    arktest.assertEQ(Boolean('-1'), true);

    // Boolean("1") - non-empty string -> true
    arktest.assertEQ(typeof Boolean('1'), 'boolean');
    arktest.assertEQ(Boolean('1'), true);

    // Boolean("false") - non-empty string -> true
    arktest.assertEQ(typeof Boolean('false'), 'boolean');
    arktest.assertEQ(Boolean('false'), true);

    // Boolean("true") - non-empty string -> true
    arktest.assertEQ(typeof Boolean('true'), 'boolean');
    arktest.assertEQ(Boolean('true'), true);
}