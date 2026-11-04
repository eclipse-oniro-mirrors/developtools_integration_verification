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

// arktsid: keys_iteration_mutable
// description: New items added to the array are accessible via the keys() iterator until the iterator is "done"
// Conversion notes:
// - `array.keys()` returns IterableIterator<int>; `iterator.next()` returns IteratorResult<int> with `.done` and
// `.value` fields.
// - The ArkTS keys iterator mirrors the JS Array Iterator semantics: it reads the live array length on every next() and
// stays done once exhausted.

function main(): void {
    let array: string[] = [];
    let iterator: IterableIterator<int> = array.keys();
    let result: IteratorResult<int>;

    array.push('a');

    result = iterator.next();
    arktest.assertEQ(result.done, false, 'First result done flag');
    arktest.assertEQ(result.value, 0, 'First result value');

    result = iterator.next();
    arktest.assertEQ(result.done, true, 'Exhausted result done flag');
    arktest.assertTrue(result.value === undefined, 'Exhausted result value');

    array.push('b');

    result = iterator.next();
    arktest.assertEQ(result.done, true, 'Exhausted result done flag (after push)');
    arktest.assertTrue(result.value === undefined, 'Exhausted result value (after push)');
}