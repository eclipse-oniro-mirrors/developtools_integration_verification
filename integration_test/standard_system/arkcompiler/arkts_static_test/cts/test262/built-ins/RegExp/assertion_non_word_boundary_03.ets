/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
// arktsid: assertion_non_word_boundary_03
// description: Execute /\\Bo\\B/i.exec("devils arise\\tfOr\\nrevil") and check the match length, index, input and
// element value

function main(): void {
    let re: RegExp = new RegExp('\\Bo\\B', 'i');
    let m = re.exec('devils arise\tfOr\nrevil');
    arktest.assertEQ(m!.length, 1, 'length');
    arktest.assertEQ(m!.index, 14, 'index');
    arktest.assertEQ(m!.input, 'devils arise\tfOr\nrevil', 'input');
    arktest.assertEQ(m![0], 'O', 'element 0');
}