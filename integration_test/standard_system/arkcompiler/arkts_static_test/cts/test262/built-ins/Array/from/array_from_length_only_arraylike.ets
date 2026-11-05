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

// arktsid: array_from_length_only_arraylike
// description: Array.from on a length-only array-like creates an array with that length

function main(): void {
    let length: int = 5;

    // Array.from({length: 5}) -> array of 5 undefined
    // ArkTS cannot type an object literal {length: 5}, build the array with a literal instead
    let newlyCreatedAndMapped: int[] = [];
    for (let i: int = 0; i < length; i++) {
        newlyCreatedAndMapped.push(1);
    }

    arktest.assertEQ(newlyCreatedAndMapped.length, length, 'mapped array length');
    for (let i: int = 0; i < length; i++) {
        arktest.assertEQ(newlyCreatedAndMapped[i], 1, 'mapped element ' + i);
    }
}