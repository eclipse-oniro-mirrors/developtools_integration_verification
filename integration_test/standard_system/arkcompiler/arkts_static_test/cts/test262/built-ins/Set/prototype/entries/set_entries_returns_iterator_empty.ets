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

// arktsid: set_entries_returns_iterator_empty
// description: Set.prototype.entries() on an empty set returns an iterator whose first next() yields done:true

function main(): void {
    let set = new Set<int>();
    let iterator = set.entries();
    let result = iterator.next();

    arktest.assertTrue(result.done === true, 'The value of `result.done` is `true`');
    arktest.assertTrue(result.value === undefined, 'The value of `result.value` is `undefined`');
}