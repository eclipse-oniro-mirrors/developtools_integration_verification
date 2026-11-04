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

// arktsid: unicode-escape-control-code-units
// description: Unicode escapes represent control code units

function main(): void {
    let escaped: string[] = [ '\u0000', '\u0001', '\u0002', '\u0003', '\u0004', '\u0005', '\u0006', '\u0007', '\u0008',
        '\u0009', '\u000A', '\u000B', '\u000C', '\u000D', '\u000E', '\u000F'];
    let expected: string[] = [ '\u0000', '\u0001', '\u0002', '\u0003', '\u0004', '\u0005', '\u0006', '\u0007', '\u0008',
        '\u0009', '\u000A', '\u000B', '\u000C', '\u000D', '\u000E', '\u000F'];
    for (let index: int = 0; index < escaped.length; index++) {
        arktest.assertEQ(escaped[index], expected[index], 'Unicode control escape');
    }
}