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
// arktsid: decimal_escape_01
// description: DecimalEscape :: DecimalIntegerLiteral [lookahead not in DecimalDigit], DecimalIntegerLiteral is not 0

function main(): void {
    let r: RegExp = new RegExp('((((((((((A))))))))))\\1\\2\\3\\4\\5\\6\\7\\8\\9\\10');
    let arr: RegExpExecArray | null = r.exec('AAAAAAAAAAA');
    if (arr != null) {
        arktest.assertEQ(arr[0], 'AAAAAAAAAAA', 'full match');
        for (let i = 1; i <= 10; i++) {
            arktest.assertEQ(arr[i], 'A', 'group ' + i);
        }
    } else {
        arktest.assertTrue(false, 'exec should return a match');
    }
}