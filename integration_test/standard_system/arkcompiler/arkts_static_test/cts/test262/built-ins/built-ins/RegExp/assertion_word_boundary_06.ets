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
// arktsid: assertion_word_boundary_06
// description: Assertion :: \b matches a word boundary after a non-'o' character followed by 't'
// Conversion notes:
// - /[^o]t\b/ matches "Ot" at index 3 in "pilOt\nsoviet robot\topenoffice"; \b asserts the boundary between 't'
// and '\n'
// - /[^o]t\b/ matches "Ot" at index 3 in "pilOt\nsoviet robot\topenoffice"; \b asserts the boundary between 't'
// and '\n'

function main(): void {
    let r: RegExp = new RegExp('[^o]t\\b');
    arktest.assertTrue(r.test('pilOt\nsoviet robot\topenoffice'), '[^o]t\\b should match \'Ot\' at the word boundary');
}