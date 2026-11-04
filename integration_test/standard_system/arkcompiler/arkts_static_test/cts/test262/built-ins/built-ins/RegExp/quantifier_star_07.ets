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

// arktsid: quantifier_star_07
// description: Execute /["'][^"']*["']/.exec("alice cries out: 'don't'") and check the matched "'don'" at index 17
// Conversion notes:
//  - regex literal rewritten as new RegExp("[\"'][^\"']*[\"']"); input and expected strings use ArkTS
//    escaping (single quotes need no backslash), and exec() is null-checked before asserting
//    .length/.index/.input/[0].

function main(): void {
    let r: RegExp = new RegExp('["\'][^"\']*["\']');
    let result: RegExpExecArray | null = r.exec('alice cries out: \'don\'t\'');
    if (result != null) {
        arktest.assertEQ(result.length, 1, 'length');
        arktest.assertEQ(result.index, 17, 'index');
        arktest.assertEQ(result.input, 'alice cries out: \'don\'t\'', 'input');
        arktest.assertEQ(result[0], '\'don\'', 'element 0');
    } else {
        arktest.assertTrue(false, 'exec should return a match');
    }
}