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
// arktsid: unicode_character_class_backspace_escape
// description: \b escape inside CharacterClass is valid in Unicode patterns (unlike \B)

function main(): void {
    let r1: RegExp = new RegExp('[\\b]', 'u');
    arktest.assertTrue(r1.test(''));

    let r2: RegExp = new RegExp('[\\b-A]', 'u');
    arktest.assertTrue(r2.test('A'));
}