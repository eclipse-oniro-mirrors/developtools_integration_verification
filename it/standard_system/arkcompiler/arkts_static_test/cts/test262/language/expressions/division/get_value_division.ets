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

// arktsid: get_value_division
// description: Division reads values from numeric variables and properties

class DivisionBox {
    public prop: int = 1;
}

function main(): void {
    let x: int = 1;
    let y: int = 1;
    let objectX = new DivisionBox();
    let objectY = new DivisionBox();
    arktest.assertEQ(1 / 1, 1, 'literal operands');
    arktest.assertEQ(x / 1, 1, 'left variable operand');
    arktest.assertEQ(1 / y, 1, 'right variable operand');
    arktest.assertEQ(x / y, 1, 'variable operands');
    arktest.assertEQ(objectX.prop / objectY.prop, 1, 'property operands');
}

