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

// arktsid: static_string_type
// description: Variables initialized from string literals have string type

function main(): void {
    let str: string = 'abcdfg';
    let str2: string = 'qwerty';
    let escaped: string = '\u0042\u0043\u0044\u0045\u0046\u0047\u0048';
    let escapedDouble: string = '\u0042\u0043\u0044\u0045\u0046\u0047\u0048';
    arktest.assertEQ(str, 'abcdfg', 'ASCII string');
    arktest.assertEQ(str2, 'qwerty', 'single-quoted source equivalent');
    arktest.assertEQ(escaped, 'BCDEFGH', 'Unicode escape string');
    arktest.assertEQ(escapedDouble, 'BCDEFGH', 'Unicode escape string in double quotes');
}
