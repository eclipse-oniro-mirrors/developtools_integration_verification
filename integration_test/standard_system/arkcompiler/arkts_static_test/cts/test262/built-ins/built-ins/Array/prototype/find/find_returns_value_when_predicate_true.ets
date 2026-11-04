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

// arktsid: find_returns_value_when_predicate_true
// description: Return found value if predicate returns true

function main(): void {
    let arr: string[] = ['Shoes', 'Car', 'Bike'];

    let called: int = 0;
    let r1: string | undefined = arr.find((val: string): boolean => {
        called++;
        return true;
    });
    arktest.assertEQ(r1, 'Shoes', 'find returns first element when predicate always true');
    arktest.assertEQ(called, 1, 'predicate called once');

    called = 0;
    let r2: string | undefined = arr.find((val: string): boolean => {
        called++;
        return val === 'Bike';
    });
    arktest.assertEQ(called, 3, 'predicate called three times');
    arktest.assertEQ(r2, 'Bike', 'find returns \'Bike\'');
}