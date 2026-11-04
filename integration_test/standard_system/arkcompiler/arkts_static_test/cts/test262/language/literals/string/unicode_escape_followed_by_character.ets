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

// arktsid: unicode-escape-followed-by-character
// description: Unicode escapes consume exactly four hexadecimal digits

function main(): void {
    let escaped: string[] = [ '\u0001F', '\u0002E', '\u0003D', '\u0004C', '\u0005B', '\u0006A', '\u00079', '\u00088',
        '\u00097', '\u000A6', '\u000B5', '\u000C4', '\u000D3', '\u000E2', '\u000F1'];
    let expected: string[] = [ '\u0001' + 'F', '\u0002' + 'E', '\u0003' + 'D', '\u0004' + 'C', '\u0005' + 'B',
        '\u0006' + 'A', '\u0007' + '9', '\u0008' + '8', '\u0009' + '7', '\u000A' + '6', '\u000B' + '5', '\u000C' + '4',
        '\u000D' + '3', '\u000E' + '2', '\u000F' + '1'];
    for (let index: int = 0; index < escaped.length; index++) {
        arktest.assertEQ(escaped[index], expected[index], 'Unicode escape followed by character');
    }
}