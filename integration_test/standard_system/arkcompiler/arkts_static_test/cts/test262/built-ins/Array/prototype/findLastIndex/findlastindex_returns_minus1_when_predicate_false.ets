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

// arktsid: findlastindex_returns_minus1_when_predicate_false
// description: Return -1 if predicate always returns false

function main(): void {
    let arr: string[] = ['Shoes', 'Car', 'Bike'];

    let called: int = 0;
    let r: int = arr.findLastIndex((val: string): boolean => {
        called++;
        return false;
    });
    arktest.assertEQ(called, 3, 'predicate called three times');
    arktest.assertEQ(r, -1, 'findLastIndex returns -1 when predicate always false');
}