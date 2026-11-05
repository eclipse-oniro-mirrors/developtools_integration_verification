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

// arktsid: decodeuri_reserved_uppercase
// description: decodeURI preserves reserved URI characters in uppercase hex
// Conversion notes: test262 B|direct, 1:1 migration.

function main(): void {
    arktest.assertEQ(decodeURI('%3B'), '%3B', 'semicolon');
    arktest.assertEQ(decodeURI('%2F'), '%2F', 'slash');
    arktest.assertEQ(decodeURI('%3F'), '%3F', 'question');
    arktest.assertEQ(decodeURI('%3A'), '%3A', 'colon');
    arktest.assertEQ(decodeURI('%40'), '%40', 'at');
    arktest.assertEQ(decodeURI('%26'), '%26', 'amp');
    arktest.assertEQ(decodeURI('%3D'), '%3D', 'equals');
    arktest.assertEQ(decodeURI('%2B'), '%2B', 'plus');
    arktest.assertEQ(decodeURI('%24'), '%24', 'dollar');
    arktest.assertEQ(decodeURI('%2C'), '%2C', 'comma');
    arktest.assertEQ(decodeURI('%23'), '%23', 'hash');
}