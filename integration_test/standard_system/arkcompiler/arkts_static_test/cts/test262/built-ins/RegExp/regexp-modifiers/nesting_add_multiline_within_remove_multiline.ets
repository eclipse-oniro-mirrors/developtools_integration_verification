/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
// arktsid: nesting_add_multiline_within_remove_multiline
// description: Can add multiline (`m`) modifier for group nested within a group that removes multiline modifier.

function main(): void {
    let re1 = new RegExp('(?-m:es(?m:$)|js$)', 'm');
    arktest.assertTrue(re1.test('es\ns'));
    arktest.assertTrue(re1.test('js'));
    arktest.assertTrue(!re1.test('js\ns'));
    let re2 = new RegExp('(?-m:es(?m-:$)|js$)', 'm');
    arktest.assertTrue(re2.test('es\ns'));
    arktest.assertTrue(re2.test('js'));
    arktest.assertTrue(!re2.test('js\ns'));
}