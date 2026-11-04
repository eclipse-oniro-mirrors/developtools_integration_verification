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
// arktsid: next_iteration
// description: Map iterator .next() yields [key, value] pairs in insertion order and sets done when exhausted
// Conversion notes: map[Symbol.iterator]() replaced with map.entries() (Map's default iterator); each pair cast to
// [number, number] before indexing since IteratorResult.value is nullable.

function main(): void {
    let m: Map<number, number> = new Map<number, number>();
    m.set(1, 11);
    m.set(2, 22);
    m.set(3, 33);
    let it: IterableIterator<[number, number]> = m.entries();
    let r1: IteratorResult<[number, number]> = it.next();
    let p1: [number, number] = r1.value as [number, number];
    arktest.assertTrue(p1[0] === 1);
    arktest.assertTrue(p1[1] === 11);
    arktest.assertTrue(r1.done === false);
    let r2: IteratorResult<[number, number]> = it.next();
    let p2: [number, number] = r2.value as [number, number];
    arktest.assertTrue(p2[0] === 2);
    arktest.assertTrue(p2[1] === 22);
    arktest.assertTrue(r2.done === false);
    let r3: IteratorResult<[number, number]> = it.next();
    let p3: [number, number] = r3.value as [number, number];
    arktest.assertTrue(p3[0] === 3);
    arktest.assertTrue(p3[1] === 33);
    arktest.assertTrue(r3.done === false);
    let r4: IteratorResult<[number, number]> = it.next();
    arktest.assertTrue(r4.done === true);
    let r5: IteratorResult<[number, number]> = it.next();
    arktest.assertTrue(r5.done === true);
}