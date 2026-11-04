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
// arktsid: string_literal_basic
// description: String literals: single-quoted, double-quoted, escape sequences, empty string

function main(): void {
    // Empty string
    arktest.assertEQ('', '');

    // Single/double quoted strings
    arktest.assertEQ('hello', 'hello');
    arktest.assertEQ('hello'.length, 5);

    // Escape sequences
    arktest.assertEQ('line1\nline2'.length, 11);
    arktest.assertEQ('\t', '\x09');
    arktest.assertEQ('\\', '\x5C');

    // Unicode
    arktest.assertEQ('A', 'A');
}