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
// arktsid: assertion_word_boundary_10
// description: Assertion \b (word boundary) matches the standalone word "robot"

function main(): void {
    let r: RegExp = new RegExp('\\brobot\\b');
    arktest.assertTrue(r.test('pilot\nsoviet robot\topenoffice'), '\\brobot\\b matches standalone \'robot\'');
}