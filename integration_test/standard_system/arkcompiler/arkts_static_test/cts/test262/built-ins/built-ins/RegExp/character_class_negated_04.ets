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
// arktsid: character_class_negated_04
// description: Execute /[^\b]+/g.exec("easy\u0008to\u0008ride") and check results
// Conversion notes:
//  - inside a character class \b means the backspace char (0x08), not a word boundary, so [^\b]+
//    matches the leading "easy" before the first backspace; input backspaces written as \u0008.

function main(): void {
    let executed: RegExpExecArray | null = new RegExp('[^\\b]+', 'g').exec('easy\u0008to\u0008ride');
    arktest.assertEQ(executed!.length, 1, 'length');
    arktest.assertEQ(executed!.index, 0, 'index');
    arktest.assertEQ(executed!.input, 'easy\u0008to\u0008ride', 'input');
    arktest.assertEQ(executed![0], 'easy', 'element 0');
}