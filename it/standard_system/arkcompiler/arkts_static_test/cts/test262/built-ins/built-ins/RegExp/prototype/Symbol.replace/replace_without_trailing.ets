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

// arktsid: replace_without_trailing
// description: Return value when replacement pattern matches final code point

function main(): void {
    arktest.assertEQ(new RegExp('abcd').replace('abcd', 'X'), 'X', 'full match');
    arktest.assertEQ(new RegExp('bcd').replace('abcd', 'X'), 'aX', 'suffix match bcd');
    arktest.assertEQ(new RegExp('cd').replace('abcd', 'X'), 'abX', 'suffix match cd');
    arktest.assertEQ(new RegExp('d').replace('abcd', 'X'), 'abcX', 'suffix match d');
}