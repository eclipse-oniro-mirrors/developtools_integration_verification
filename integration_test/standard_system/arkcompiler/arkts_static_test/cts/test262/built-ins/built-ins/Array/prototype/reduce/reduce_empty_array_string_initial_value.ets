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

// arktsid: reduce_empty_array_string_initial_value
// description: Array.prototype.reduce - initialValue is present (empty array, string initialValue)
// Conversion notes:
//  - Empty string array with a string initialValue: callback never invoked,
//    the initialValue is returned.

function main(): void {
    let str: string = 'initialValue is present';
    let arr: string[] = [];
    let result: string = arr.reduce<string>((prev: string, cur: string, idx: int, a: string[]): string => {
        return '';
    }, str);
    arktest.assertEQ(result, str, '[].reduce(function () {}, str)');
}