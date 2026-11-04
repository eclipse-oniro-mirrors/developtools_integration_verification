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

// arktsid: returns_single_element_no_initialvalue_string
// description: Array.prototype.reduceRight - 'initialValue' is not present

function main(): void {
    let str: string = 'initialValue is not present';
    let arr: string[] = [str];
    let r: string = arr.reduceRight((prev: string, cur: string): string => { return ''; });
    arktest.assertEQ(r, str, '[str].reduceRight(fn) returns the single element');
}