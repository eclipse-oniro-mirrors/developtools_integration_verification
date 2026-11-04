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

// arktsid: sort_stability_11_elements
// description: >
//   Stability of Array.prototype.sort for an array with 11 elements. The sort is
//   required to be stable (elements that compare equal keep their original
//   order). The length 11 was chosen because an engine used an unstable QuickSort for
//   arrays with more than 10 elements until version 7.0.
// Conversion notes:
//  - Sort comparator (a, b) => b.rating - a.rating is rewritten with explicit
//    int parameter/return types.
//  - The source verifies stability via reduce into a name string
//    ("DGBEFHACIJK"); here the same string is built with a for-loop and checked,
//    plus a loop asserts ratings are in non-increasing (descending) order.

class Item {
    public name: string;
    public rating: int;
    constructor(n: string, r: int) {
        this.name = n;
        this.rating = r;
    }
}

function main(): void {
    let arr: Item[] = [
        new Item('A', 2),
        new Item('B', 3),
        new Item('C', 2),
        new Item('D', 4),
        new Item('E', 3),
        new Item('F', 3),
        new Item('G', 4),
        new Item('H', 3),
        new Item('I', 2),
        new Item('J', 2),
        new Item('K', 2),
    ];

    arktest.assertEQ(arr.length, 11, 'arr.length');

    // Sort by `rating` in descending order (in place).
    arr.sort((a: Item, b: Item): int => {
        return b.rating - a.rating;
    });

    // Stability check: concatenating names must yield "DGBEFHACIJK".
    let reduced: string = '';
    for (let i: int = 0; i < arr.length; i++) {
        reduced += arr[i].name;
    }
    arktest.assertEQ(reduced, 'DGBEFHACIJK', 'stable name order');

    // Ratings must be in non-increasing order.
    for (let i: int = 1; i < arr.length; i++) {
        arktest.assertTrue(arr[i].rating <= arr[i - 1].rating, 'descending rating at index ' + i.toString());
    }
}