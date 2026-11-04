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

// arktsid: hex-escape-followed-by-character
// description: Hexadecimal escapes consume exactly two hexadecimal digits

function main(): void {
    let escaped: string[] = [ '\x01F', '\x02E', '\x03D', '\x04C', '\x05B', '\x06A', '\x079', '\x088', '\x097', '\x0A6',
        '\x0B5', '\x0C4', '\x0D3', '\x0E2', '\x0F1'];
    let expected: string[] = [ '\x01' + 'F', '\x02' + 'E', '\x03' + 'D', '\x04' + 'C', '\x05' + 'B', '\x06' + 'A',
        '\x07' + '9', '\x08' + '8', '\x09' + '7', '\x0A' + '6', '\x0B' + '5', '\x0C' + '4', '\x0D' + '3', '\x0E' + '2',
        '\x0F' + '1'];
    for (let index: int = 0; index < escaped.length; index++) {
        arktest.assertEQ(escaped[index], expected[index], 'hexadecimal escape followed by character');
    }
}