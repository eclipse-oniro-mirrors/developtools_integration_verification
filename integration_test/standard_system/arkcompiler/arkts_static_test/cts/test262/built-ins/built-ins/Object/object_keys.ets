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

// arktsid: object_keys
// description: Object.keys returns array of own enumerable string keys

interface Obj {
    a: int;
    b: int;
    c: int;
}

function main(): void {
    let obj: Obj = {a: 1, b: 2, c: 3};
    let keys = Object.keys(obj);

    // Returns 3 keys
    arktest.assertEQ(keys.length, 3);

    // Keys include "a", "b", "c" (order not guaranteed but usually insertion)
    let foundA: boolean = false;
    let foundB: boolean = false;
    let foundC: boolean = false;
    for (let i = 0; i < keys.length; i++) {
        if (keys[i] == 'a') { foundA = true; }
        if (keys[i] == 'b') { foundB = true; }
        if (keys[i] == 'c') { foundC = true; }
    }
    arktest.assertEQ(foundA, true);
    arktest.assertEQ(foundB, true);
    arktest.assertEQ(foundC, true);
}