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

// arktsid: findlastindex_returns_index_when_predicate_true
// description: Return index if predicate returns true (searching from last)

function main(): void {
    let arr: string[] = ['Shoes', 'Car', 'Bike'];

    let called: int = 0;
    let r1: int = arr.findLastIndex((val: string): boolean => {
        called++;
        return true;
    });
    arktest.assertEQ(r1, 2, 'findLastIndex returns last index when predicate always true');
    arktest.assertEQ(called, 1, 'predicate called once');

    called = 0;
    let r2: int = arr.findLastIndex((val: string): boolean => {
        called++;
        return val === 'Shoes';
    });
    arktest.assertEQ(called, 3, 'predicate called three times');
    arktest.assertEQ(r2, 0, 'findLastIndex returns 0 for \'Shoes\'');
}