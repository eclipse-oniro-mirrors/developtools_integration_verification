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

// arktsid: hex-escape-control-code-units
// description: Hexadecimal escapes represent control code units

function main(): void {
    let escaped: string[] = [ '\x00', '\x01', '\x02', '\x03', '\x04', '\x05', '\x06', '\x07', '\x08', '\x09', '\x0A',
        '\x0B', '\x0C', '\x0D', '\x0E', '\x0F'];
    let expected: string[] = [ '\x00', '\x01', '\x02', '\x03', '\x04', '\x05', '\x06', '\x07', '\x08', '\x09', '\x0A',
        '\x0B', '\x0C', '\x0D', '\x0E', '\x0F'];
    for (let index: int = 0; index < escaped.length; index++) {
        arktest.assertEQ(escaped[index], expected[index], 'hexadecimal control escape');
    }
}