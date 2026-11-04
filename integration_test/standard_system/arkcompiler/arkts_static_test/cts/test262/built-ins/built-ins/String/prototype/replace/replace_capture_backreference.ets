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

// arktsid: replace_capture_backreference
// description: String.prototype.replace with /^(a+)\1*,\1+$/ and $1 as replaceValue substitutes the first capture group
// Conversion notes: test262 B|direct, 1:1 migration. RegExp literal /^(a+)\1*,\1+$/ converted to new
// RegExp("^(a+)\\1*,\\1+$").

function main(): void {
    let str: string = 'aaaaaaaaaa,aaaaaaaaaaaaaaa';
    let re: RegExp = new RegExp('^(a+)\\1*,\\1+$');
    let repl: string = '$1';
    arktest.assertEQ(str.replace(re, repl), 'aaaaa',
        '$1 substitutes the first capture group aaaaa');
}