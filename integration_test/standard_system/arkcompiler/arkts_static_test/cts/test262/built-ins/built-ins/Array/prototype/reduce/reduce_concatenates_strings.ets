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

// arktsid: reduce_concatenates_strings
// description: Array.prototype.reduce reduces the array in ascending order of indices

function main(): void {
    let src: string[] = ['1', '2', '3', '4', '5'];
    let r: string = src.reduce((prevVal: string, curVal: string): string => { return prevVal + curVal; });
    arktest.assertEQ(r, '12345', 'reduce concatenates strings');
}