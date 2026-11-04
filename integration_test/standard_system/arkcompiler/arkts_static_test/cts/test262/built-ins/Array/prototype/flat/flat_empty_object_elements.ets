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

// arktsid: flat_empty_object_elements
// description: Array.prototype.flat with empty object elements
// Conversion notes:
//  - JS empty object literals {} are modeled by an ArkTS class Elem; identity is
//    verified through the unique `n` field instead of reference equality.
//  - Mixed arrays containing both object and nested-array elements are typed as
//    Array<Object> so flat<A>() can flatten one level and pass objects through.

class Elem {
    public n: int;
    constructor(n: int) {
        this.n = n;
    }
}

function main(): void {
    let a: Elem = new Elem(1);
    let b: Elem = new Elem(2);

    // [a].flat() must return [a]
    let r0: Elem[] = [a].flat<Elem>();
    arktest.assertEQ(r0.length, 1, '[a].flat() must return [a] length');
    arktest.assertEQ(r0[0].n, a.n, '[a].flat() must return [a] [0]');

    // [a, [b]].flat() must return [a, b]
    let arr1: Object[] = [a, [b]];
    let r1: Elem[] = arr1.flat<Elem>();
    arktest.assertEQ(r1.length, 2, '[a, [b]].flat() must return [a, b] length');
    arktest.assertEQ(r1[0].n, a.n, '[a, [b]].flat() must return [a, b] [0]');
    arktest.assertEQ(r1[1].n, b.n, '[a, [b]].flat() must return [a, b] [1]');

    // [[a], b].flat() must return [a, b]
    let arr2: Object[] = [[a], b];
    let r2: Elem[] = arr2.flat<Elem>();
    arktest.assertEQ(r2.length, 2, '[[a], b].flat() must return [a, b] length');
    arktest.assertEQ(r2[0].n, a.n, '[[a], b].flat() must return [a, b] [0]');
    arktest.assertEQ(r2[1].n, b.n, '[[a], b].flat() must return [a, b] [1]');

    // [[a], [b]].flat() must return [a, b]
    let arr3: Elem[][] = [[a], [b]];
    let r3: Elem[] = arr3.flat<Elem>();
    arktest.assertEQ(r3.length, 2, '[[a], [b]].flat() must return [a, b] length');
    arktest.assertEQ(r3[0].n, a.n, '[[a], [b]].flat() must return [a, b] [0]');
    arktest.assertEQ(r3[1].n, b.n, '[[a], [b]].flat() must return [a, b] [1]');
}