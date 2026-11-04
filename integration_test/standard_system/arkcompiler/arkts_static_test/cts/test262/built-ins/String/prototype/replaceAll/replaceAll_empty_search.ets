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

// arktsid: replaceAll_empty_search
// description: String.prototype.replaceAll with empty search inserts replacement between code units
// Conversion notes: test262 B|direct, 1:1 migration.

function main(): void {
    let result1: String = 'aac c  \nx'.replaceAll('', '_');
    arktest.assertEQ(result1, '_a_a_c_ _c_ _ _\n_x_', 'insert between every unit');
    let result2: String = 'a'.replaceAll('', '_');
    arktest.assertEQ(result2, '_a_', 'single char');
}