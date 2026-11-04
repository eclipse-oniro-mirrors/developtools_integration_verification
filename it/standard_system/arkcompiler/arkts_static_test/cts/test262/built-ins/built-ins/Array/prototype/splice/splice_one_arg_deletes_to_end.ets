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

// arktsid: splice_one_arg_deletes_to_end
// description: Array.prototype.splice deletes length-start elements when called with one argument

function main(): void {
    let array: string[] = ['first', 'second', 'third'];
    let result: string[] = array.splice(1);
    arktest.assertEQ(array.length, 1, 'array length updated');
    arktest.assertEQ(array[0], 'first', 'array[0] unchanged');
    arktest.assertEQ(result.length, 2, 'result array length correct');
    arktest.assertEQ(result[0], 'second', 'result[0] correct');
    arktest.assertEQ(result[1], 'third', 'result[1] correct');
}