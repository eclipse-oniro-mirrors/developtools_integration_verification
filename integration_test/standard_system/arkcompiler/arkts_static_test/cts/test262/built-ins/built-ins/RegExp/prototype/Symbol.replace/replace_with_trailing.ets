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

// arktsid: replace_with_trailing
// description: Return value when replacement pattern does not match final code point

function main(): void {
    arktest.assertEQ(new RegExp('abc').replace('abcd', 'X'), 'Xd', '/abc/ -> \'Xd\'');
    arktest.assertEQ(new RegExp('bc').replace('abcd', 'X'), 'aXd', '/bc/ -> \'aXd\'');
    arktest.assertEQ(new RegExp('c').replace('abcd', 'X'), 'abXd', '/c/ -> \'abXd\'');

    arktest.assertEQ(new RegExp('ab').replace('abcd', 'X'), 'Xcd', '/ab/ -> \'Xcd\'');
    arktest.assertEQ(new RegExp('b').replace('abcd', 'X'), 'aXcd', '/b/ -> \'aXcd\'');

    arktest.assertEQ(new RegExp('a').replace('abcd', 'X'), 'Xbcd', '/a/ -> \'Xbcd\'');
}