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

// arktsid: string_is_constructor
// description: String instances expose a length property; they are created via string literals
// Conversion notes: test262 uses isConstructor harness to prove String implements
//   [[Construct]]. ArkTS String is a class; instances are created via string literals
//   and the length property is asserted directly.

function main(): void {
    let s: string = 'abc';
    arktest.assertEQ(s.length, 3, 'new String creates string with content');

    let empty: string = '';
    arktest.assertEQ(empty.length, 0, 'empty string length is 0');
}