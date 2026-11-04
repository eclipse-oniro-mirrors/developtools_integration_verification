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

// arktsid: reduce_single_string_element_no_init
// description: Array.prototype.reduce - initialValue is not present (single-element string array)
// Conversion notes:
//  - Single-element string array with no initialValue: the callback is never
//    invoked and the sole element is returned.

function main(): void {
    let str: string = 'initialValue is not present';
    let arr: string[] = [str];
    let result: string = arr.reduce((prev: string, cur: string, idx: int, a: string[]): string => {
        return '';
    });
    arktest.assertEQ(result, str, '[str].reduce(function () {})');
}