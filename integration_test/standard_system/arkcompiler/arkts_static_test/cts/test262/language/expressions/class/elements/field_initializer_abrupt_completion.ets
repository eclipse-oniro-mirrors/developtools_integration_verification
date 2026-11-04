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

// arktsid: field_initializer_abrupt_completion
// description: An abrupt completion evaluating a field initializer interrupts instance construction

let sideEffect: int = 0;

function fn1(): int {
    sideEffect += 1;
    return 0;
}

function fn2(): int {
    throw new Error('field init failure');
}

class C {
    public x: int = fn1();
    public y: int = fn2();
    public z: int = fn1();
}

function main(): void {
    let threw: boolean = false;
    try {
        let c: C = new C();
    } catch (e) {
        threw = true;
    }
    arktest.assertTrue(threw, 'constructor should throw');
    arktest.assertEQ(sideEffect, 1, 'only the first field initializer runs');
}
