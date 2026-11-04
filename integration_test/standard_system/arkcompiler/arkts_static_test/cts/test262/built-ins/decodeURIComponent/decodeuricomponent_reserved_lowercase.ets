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

// arktsid: decodeuricomponent_reserved_lowercase
// description: decodeURIComponent decodes reserved URI characters in lowercase hex
// Conversion notes: test262 B|direct, 1:1 migration.

function main(): void {
    arktest.assertEQ(decodeURIComponent('%3b'), ';', 'semicolon');
    arktest.assertEQ(decodeURIComponent('%2f'), '/', 'slash');
    arktest.assertEQ(decodeURIComponent('%3f'), '?', 'question');
    arktest.assertEQ(decodeURIComponent('%3a'), ':', 'colon');
    arktest.assertEQ(decodeURIComponent('%26'), '&', 'amp');
    arktest.assertEQ(decodeURIComponent('%3d'), '=', 'equals');
    arktest.assertEQ(decodeURIComponent('%2b'), '+', 'plus');
    arktest.assertEQ(decodeURIComponent('%2c'), ',', 'comma');
    arktest.assertEQ(decodeURIComponent('%23'), '#', 'hash');
}