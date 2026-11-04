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

// arktsid: unicode_digits
// description: Unicode escapes represent decimal digits

function main(): void {
    let unicode: String[] = [
        '\u0030', '\u0031', '\u0032', '\u0033', '\u0034',
        '\u0035', '\u0036', '\u0037', '\u0038', '\u0039'
    ];
    let character: String[] = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    for (let index: int = 0; index <= 9; index++) {
        arktest.assertEQ(unicode[index], character[index], 'decimal digit');
    }
}
