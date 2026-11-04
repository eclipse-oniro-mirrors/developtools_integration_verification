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

// arktsid: indexof_string_match
// description: Array.prototype.indexOf - both array element and search element are String, and they have exactly the
// same sequence of characters

function main(): void {
    let x: string[] = ['', 'ab', 'bca', 'abc'];
    arktest.assertEQ(x.indexOf('abc'), 3, "['', 'ab', 'bca', 'abc'].indexOf('abc')");
}