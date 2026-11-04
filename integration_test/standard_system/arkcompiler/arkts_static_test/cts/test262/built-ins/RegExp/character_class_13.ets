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
// arktsid: character_class_13
// description: CharacterClass [a-z][^1-9][a-z] matches "def" in "a1b  b2c  c3d  def  f4g"

function main(): void {
    let r: RegExp = new RegExp('[a-z][^1-9][a-z]');
    let m = r.exec('a1b  b2c  c3d  def  f4g');

    arktest.assertEQ(m!.length, 1, 'length');
    arktest.assertEQ(m!.index, 15, 'index');
    arktest.assertEQ(m!.input, 'a1b  b2c  c3d  def  f4g', 'input');
    arktest.assertEQ(m![0], 'def', 'element');
}