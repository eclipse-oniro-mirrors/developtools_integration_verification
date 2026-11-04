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

// arktsid: replace_regexp
// description: String.prototype.replace replaces first match when searchValue is a RegExp
// Conversion notes: test262 replaces with numeric replaceValue 1, which ToString-coerces
//   to "1"; ArkTS replace requires a String replaceValue, so "1" is passed directly.

function main(): void {
    let reg: RegExp = new RegExp('77');
    let result: String = 'ABBABABAB77BBAA'.replace(reg, '1');
    arktest.assertEQ(result, 'ABBABABAB1BBAA', 'replace regexp 77 with 1');
}