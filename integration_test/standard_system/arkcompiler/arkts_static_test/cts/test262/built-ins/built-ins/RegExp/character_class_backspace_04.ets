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
// arktsid: character_class_backspace_04
// description: Inside a CharacterClass, \b means the backspace character - negated class [^\[\b\]] matches "abcdef"
// fully

function main(): void {
    let r: RegExp = new RegExp('[^\\[\\b\\]]+');
    let executed: RegExpExecArray | null = r.exec('abcdef');
    if (executed != null) {
        arktest.assertEQ(executed.length, 1, 'length');
        arktest.assertEQ(executed.index, 0, 'index');
        arktest.assertEQ(executed.input, 'abcdef', 'input');
        arktest.assertEQ(executed[0], 'abcdef', 'm[0]');
    } else {
        arktest.assertTrue(false, 'exec should return a match');
    }
}