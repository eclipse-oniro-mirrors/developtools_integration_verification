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

// arktsid: decodeuri_reserved_lowercase
// description: decodeURI preserves reserved URI characters in lowercase hex
// Conversion notes: test262 B|direct, 1:1 migration.

function main(): void {
    arktest.assertEQ(decodeURI('%3b'), '%3b', 'semicolon');
    arktest.assertEQ(decodeURI('%2f'), '%2f', 'slash');
    arktest.assertEQ(decodeURI('%3f'), '%3f', 'question');
    arktest.assertEQ(decodeURI('%3a'), '%3a', 'colon');
    arktest.assertEQ(decodeURI('%40'), '%40', 'at');
    arktest.assertEQ(decodeURI('%26'), '%26', 'amp');
    arktest.assertEQ(decodeURI('%3d'), '%3d', 'equals');
    arktest.assertEQ(decodeURI('%2b'), '%2b', 'plus');
    arktest.assertEQ(decodeURI('%24'), '%24', 'dollar');
    arktest.assertEQ(decodeURI('%2c'), '%2c', 'comma');
    arktest.assertEQ(decodeURI('%23'), '%23', 'hash');
}