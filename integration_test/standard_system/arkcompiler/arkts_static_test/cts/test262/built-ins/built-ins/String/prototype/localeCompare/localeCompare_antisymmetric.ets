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

// arktsid: localeCompare_antisymmetric
// description: String.prototype.localeCompare is antisymmetric, str1.localeCompare(str2) == -str2.localeCompare(str1)
// Conversion notes: test262 B|direct, 1:1 migration.

function main(): void {
    let str1: String = 'h';
    let str2: String = 'H';
    arktest.assertEQ(str1.localeCompare(str2), -str2.localeCompare(str1),
        'localeCompare(a, b) is the negation of localeCompare(b, a)');
}