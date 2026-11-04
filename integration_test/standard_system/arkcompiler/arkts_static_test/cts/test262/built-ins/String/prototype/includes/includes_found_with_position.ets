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

// arktsid: includes_found_with_position
// description: String.prototype.includes returns true when search string found with position
// Conversion notes: test262 B|direct, 1:1 migration.

function main(): void {
    let str: String = 'The future is cool!';
    arktest.assertTrue(str.includes('The future', 0), 'includes at 0');
    arktest.assertTrue(str.includes(' is ', 1), 'includes middle with position');
    arktest.assertTrue(str.includes('cool!', 10), 'includes near end with position');
}