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

// arktsid: rest-index
// description: Rest parameters contain arguments after the fixed parameters

function countRest0(...args: int[]): int {
    return args.length;
}

function countRest1(first: int, ...args: int[]): int {
    return args.length;
}

function countRest2(first: int, second: int, ...args: int[]): int {
    return args.length;
}

function countRest3(first: int, second: int, third: int, ...args: int[]): int {
    return args.length;
}

function countRest4(first: int, second: int, third: int, fourth: int, ...args: int[]): int {
    return args.length;
}

function countRest5(first: int, second: int, third: int, fourth: int, fifth: int, ...args: int[]): int {
    return args.length;
}

function main(): void {
    arktest.assertEQ(countRest0(1, 2, 3, 4, 5), 5, 'five rest arguments');
    arktest.assertEQ(countRest1(1, 2, 3, 4, 5), 4, 'four rest arguments');
    arktest.assertEQ(countRest2(1, 2, 3, 4, 5), 3, 'three rest arguments');
    arktest.assertEQ(countRest3(1, 2, 3, 4, 5), 2, 'two rest arguments');
    arktest.assertEQ(countRest4(1, 2, 3, 4, 5), 1, 'one rest argument');
    arktest.assertEQ(countRest5(1, 2, 3, 4, 5), 0, 'no rest arguments');
}
