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
// arktsid: character_class_backspace_02
// description: Inside a CharacterClass, \b means the backspace character

function main(): void {
    let executed = new RegExp('c[\\b]{3}d').exec('abc\b\b\bdef');
    arktest.assertEQ(executed!.length, 1);
    arktest.assertEQ(executed!.index, 2);
    arktest.assertEQ(executed!.input, 'abc\b\b\bdef');
    arktest.assertEQ(executed![0], 'c\b\b\bd');
}