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
// description: Array iterator reflects items pushed during iteration (live iterator); an exhausted iterator stays done
// Conversion notes: array[Symbol.iterator]() replaced with array.values(); live-iterator behavior (push during
// iteration) verified.

function main(): void {
    let array: string[] = [];
    let it: IterableIterator<string> = array.values();
    array.push('a');
    let r1: IteratorResult<string> = it.next();
    arktest.assertTrue(r1.value === 'a');
    arktest.assertTrue(r1.done === false);
    let r2: IteratorResult<string> = it.next();
    arktest.assertTrue(r2.value === undefined);
    arktest.assertTrue(r2.done === true);
    array.push('b');
    let r3: IteratorResult<string> = it.next();
    arktest.assertTrue(r3.value === undefined);
    arktest.assertTrue(r3.done === true);
}