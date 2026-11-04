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

// arktsid: values_iteration_mutable
// description: New items in the array are accessible via the values() iterator until
//   the iterator is "done"; items added after the iterator is done are not visited.
// Conversion notes:
//  - Mirrors keys_iteration_mutable.ets / entries_iteration_mutable.ets: array.values()
//    returns IterableIterator<string>; next() returns IteratorResult<string> with .done
//    and .value. The ArkTS values iterator reads the live array on every next() and
//    stays done once exhausted.

function main(): void {
    let array: string[] = [];
    let iterator: IterableIterator<string> = array.values();
    let result: IteratorResult<string>;

    array.push('a');

    result = iterator.next();
    arktest.assertEQ(result.done, false, 'First result done flag');
    arktest.assertEQ(result.value, 'a', 'First result value');

    result = iterator.next();
    arktest.assertEQ(result.done, true, 'Exhausted result done flag');
    arktest.assertTrue(result.value === undefined, 'Exhausted result value');

    array.push('b');

    result = iterator.next();
    arktest.assertEQ(result.done, true, 'Exhausted result done flag (after push)');
    arktest.assertTrue(result.value === undefined, 'Exhausted result value (after push)');
}