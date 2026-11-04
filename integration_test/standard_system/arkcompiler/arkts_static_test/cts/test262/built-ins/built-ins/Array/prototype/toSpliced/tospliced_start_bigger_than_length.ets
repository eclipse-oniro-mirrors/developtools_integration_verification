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

// arktsid: tospliced_start_bigger_than_length
// description: toSpliced clamps start to the array length

function main(): void {
    let result: int[] = [0, 1, 2, 3, 4].toSpliced(10, 1, 5, 6);
    arktest.assertEQ(result.length, 7, 'result length');
    arktest.assertEQ(result[0], 0, 'result[0]');
    arktest.assertEQ(result[1], 1, 'result[1]');
    arktest.assertEQ(result[2], 2, 'result[2]');
    arktest.assertEQ(result[3], 3, 'result[3]');
    arktest.assertEQ(result[4], 4, 'result[4]');
    arktest.assertEQ(result[5], 5, 'result[5]');
    arktest.assertEQ(result[6], 6, 'result[6]');
}