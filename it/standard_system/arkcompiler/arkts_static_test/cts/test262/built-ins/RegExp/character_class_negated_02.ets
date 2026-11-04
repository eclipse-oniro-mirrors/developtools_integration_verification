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
// arktsid: character_class_negated_02
// description: CharacterClass :: [ ^ ClassRanges ] empty negated class matches any character including tab

function main(): void {
    let str: String = '   a\t\n';
    let r: RegExp = new RegExp('a[^]');
    let result: RegExpExecArray | null = r.exec(str);
    if (result == null) {
        arktest.assertTrue(false, 'exec should return a match');
        return;
    }
    arktest.assertEQ(result.length, 1, 'length');
    arktest.assertEQ(result.index, 3, 'index');
    arktest.assertEQ(result.input, '   a\t\n', 'input');
    arktest.assertEQ(result[0], 'a\t', 'element 0');
}