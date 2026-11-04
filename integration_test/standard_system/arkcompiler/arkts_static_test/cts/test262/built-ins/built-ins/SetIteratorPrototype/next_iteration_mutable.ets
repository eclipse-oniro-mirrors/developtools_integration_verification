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
// arktsid: next_iteration_mutable
// description: Set iterator reflects elements added during iteration (live iterator); an exhausted iterator stays done
// Conversion notes: set[Symbol.iterator]() replaced with set.values(); live-iterator behavior (add during iteration)
// verified.

function main(): void {
    let s: Set<number> = new Set<number>();
    s.add(1);
    s.add(2);
    let it: IterableIterator<number> = s.values();
    let r1: IteratorResult<number> = it.next();
    arktest.assertTrue(r1.value === 1);
    arktest.assertTrue(r1.done === false);
    s.add(3);
    let r2: IteratorResult<number> = it.next();
    arktest.assertTrue(r2.value === 2);
    arktest.assertTrue(r2.done === false);
    let r3: IteratorResult<number> = it.next();
    arktest.assertTrue(r3.value === 3);
    arktest.assertTrue(r3.done === false);
    let r4: IteratorResult<number> = it.next();
    arktest.assertTrue(r4.value === undefined);
    arktest.assertTrue(r4.done === true);
    s.add(4);
    let r5: IteratorResult<number> = it.next();
    arktest.assertTrue(r5.value === undefined);
    arktest.assertTrue(r5.done === true);
}