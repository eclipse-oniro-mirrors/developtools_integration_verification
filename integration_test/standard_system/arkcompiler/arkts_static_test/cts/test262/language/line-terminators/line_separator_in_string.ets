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

// arktsid: line_separator_in_string
// description: U+2028 is preserved in a string value

function main(): void {
    let prop: string = '66\u2028123';
    arktest.assertEQ(prop, '66\u2028123', 'prop');
    arktest.assertEQ(prop[2], '\u2028', 'prop[2]');
    arktest.assertEQ(prop.length, 6, 'prop.length');
}

