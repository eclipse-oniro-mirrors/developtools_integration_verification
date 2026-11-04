/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// arktsid: remainder_get_value_from_literals_variables_and_properties
// description: Remainder reads values from literals, variables, and properties

class NumberBox {
    public prop: int;

    constructor(value: int) {
        this.prop = value;
    }
}

function main(): void {
    let x: int = 1;
    let y: int = 2;
    arktest.assertEQ(1 % 2, 1);
    arktest.assertEQ(x % 2, 1);
    arktest.assertEQ(1 % y, 1);
    arktest.assertEQ(x % y, 1);
    let objectx: NumberBox = new NumberBox(1);
    let objecty: NumberBox = new NumberBox(2);
    arktest.assertEQ(objectx.prop % objecty.prop, 1);
}