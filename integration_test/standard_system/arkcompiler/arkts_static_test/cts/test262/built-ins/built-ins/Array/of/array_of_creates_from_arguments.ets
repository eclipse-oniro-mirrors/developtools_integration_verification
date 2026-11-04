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

// arktsid: array_of_creates_from_arguments
// description: Array.of method creates a new Array with a variable number of arguments

function main(): void {
    let a1: string[] = Array.of<string>('Mike', 'Rick', 'Leo');
    arktest.assertEQ(a1.length, 3, 'a1.length');
    arktest.assertEQ(a1[0], 'Mike', 'a1[0]');
    arktest.assertEQ(a1[1], 'Rick', 'a1[1]');
    arktest.assertEQ(a1[2], 'Leo', 'a1[2]');

    let a2: int[] = Array.of(1, 2, 3);
    arktest.assertEQ(a2.length, 3, 'a2.length');
    arktest.assertEQ(a2[0], 1, 'a2[0]');
    arktest.assertEQ(a2[1], 2, 'a2[1]');
    arktest.assertEQ(a2[2], 3, 'a2[2]');

    let a3: string[] = Array.of<string>();
    arktest.assertEQ(a3.length, 0, 'Array.of() length');
}