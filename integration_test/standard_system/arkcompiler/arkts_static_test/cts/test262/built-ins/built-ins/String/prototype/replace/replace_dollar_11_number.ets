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

// arktsid: replace_dollar_11_number
// description: String.prototype.replace with /(uid=)(\d+)/ and "$11" + 15: two-digit $11 index exceeding capture count
// falls back to $1 plus literal 1
// Conversion notes: test262 B|direct, 1:1 migration. RegExp literal /(uid=)(\d+)/ converted to new
// RegExp("(uid=)(\\d+)").

function main(): void {
    let str: string = 'uid=31';
    let re: RegExp = new RegExp('(uid=)(\\d+)');
    arktest.assertEQ(str.replace(re, '$11' + 15), 'uid=115',
        '$11 with only 2 captures falls back to $1 plus literal 1');
}