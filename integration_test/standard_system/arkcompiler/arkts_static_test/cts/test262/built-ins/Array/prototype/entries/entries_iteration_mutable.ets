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

// arktsid: entries_iteration_mutable
// description: New items in the array are accessible via entries() iteration until the iterator is done
// Conversion notes:
//  - Source checked result.value.length === 2 (JS entry value is a 2-element array); ArkTS entries()
//    yields an [int, T] tuple whose length is asserted as 2.
//  - IteratorResult.value is nullable; cast to [int, string] before indexing (same pattern as
//    MapIteratorPrototype/next_iteration.ets).

function main(): void {
    let array: string[] = [];
    let it: IterableIterator<[int, string]> = array.entries();
    array.push('a');
    let r1: IteratorResult<[int, string]> = it.next();
    arktest.assertTrue(r1.done === false, 'First result done flag');
    let e1: [int, string] = r1.value as [int, string];
    arktest.assertEQ(e1[0], 0, 'First entry key');
    arktest.assertEQ(e1[1], 'a', 'First entry value');
    arktest.assertEQ(e1.length, 2, 'First entry value length');
    let r2: IteratorResult<[int, string]> = it.next();
    arktest.assertTrue(r2.done === true, 'Exhausted done flag');
    arktest.assertTrue(r2.value === undefined, 'Exhausted result value');
    array.push('b');
    let r3: IteratorResult<[int, string]> = it.next();
    arktest.assertTrue(r3.done === true, 'Done flag after push');
    arktest.assertTrue(r3.value === undefined, 'Value after push');
}