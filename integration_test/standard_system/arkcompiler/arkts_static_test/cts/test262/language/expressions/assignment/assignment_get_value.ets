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

// arktsid: assignment_get_value
// description: Assignment reads the right-hand value and stores it in the target

class NumberBox {
    public prop: double;

    constructor(value: double) {
        this.prop = value;
    }
}

function main(): void {
    let x: double = 1.0;
    let y: double = 1.0;
    x = y;
    arktest.assertEQ(x, 1.0);
    let objectx: NumberBox = new NumberBox(0.0);
    let objecty: NumberBox = new NumberBox(1.1);
    objectx.prop = objecty.prop;
    arktest.assertEQ(objectx.prop, objecty.prop);
    arktest.assertTrue(objectx != objecty);
}