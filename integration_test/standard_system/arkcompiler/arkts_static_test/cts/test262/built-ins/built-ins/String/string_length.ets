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

// arktsid: string_length
// description: String length counts UTF-16 code units
// Conversion notes: test262 uses verifyProperty (descriptors not supported in ArkTS)
//   plus length assertions. Only the length assertions are migrated.

function main(): void {
    let empty: string = '';
    arktest.assertEQ(empty.length, 0, 'empty string length');

    let space: string = ' ';
    arktest.assertEQ(space.length, 1, 'whitespace length');

    let esc: string = '  ';
    arktest.assertEQ(esc.length, 3, 'backspace escape length');

    // Surrogate pair 𝌆 counts as 2 UTF-16 code units
    let surrogate: string = '𝌆';
    arktest.assertEQ(surrogate.length, 2, 'surrogate pair length');
}