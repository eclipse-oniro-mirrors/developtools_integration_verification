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
// arktsid: json_stringify_escape_ascii
// description: JSON.stringify escapes ASCII characters in string values (quote, backslash, control chars)
// Conversion notes: representative subset of the escape table — quote, backslash, tab, newline, NUL, backspace.

function main(): void {
    arktest.assertEQ(JSON.stringify('"'), '"\\""', 'quote escaped');
    arktest.assertEQ(JSON.stringify('\\'), '"\\\\"', 'backslash escaped');
    arktest.assertEQ(JSON.stringify('\t'), '"\\t"', 'tab escaped');
    arktest.assertEQ(JSON.stringify('\n'), '"\\n"', 'newline escaped');
    arktest.assertEQ(JSON.stringify('\x00'), '"\\u0000"', 'NUL escaped as \\u0000');
    arktest.assertEQ(JSON.stringify('\x08'), '"\\b"', 'backspace escaped as \\b');
}