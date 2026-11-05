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
// description: Array iterator .next() visits each element in insertion order and sets done when exhausted
// Conversion notes: array[Symbol.iterator]() replaced with array.values() (Array's default iterator).

function main(): void {
    let array: string[] = ['a', 'b', 'c'];
    let it: IterableIterator<string> = array.values();
    let r1: IteratorResult<string> = it.next();
    arktest.assertTrue(r1.value === 'a');
    arktest.assertTrue(r1.done === false);
    let r2: IteratorResult<string> = it.next();
    arktest.assertTrue(r2.value === 'b');
    arktest.assertTrue(r2.done === false);
    let r3: IteratorResult<string> = it.next();
    arktest.assertTrue(r3.value === 'c');
    arktest.assertTrue(r3.done === false);
    let r4: IteratorResult<string> = it.next();
    arktest.assertTrue(r4.value === undefined);
    arktest.assertTrue(r4.done === true);
}
