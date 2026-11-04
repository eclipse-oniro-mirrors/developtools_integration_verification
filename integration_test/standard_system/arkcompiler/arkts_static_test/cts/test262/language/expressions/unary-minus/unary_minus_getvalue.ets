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

// arktsid: unary_minus_getvalue
// description: Operator -x uses GetValue
// Conversion notes: kept CHECK#1-5 (numeric primitives + a holder property);
// new Object() maps to a small class with an int property.

class UnaryMinusHolder {
    public prop: int = 1;
}

function main(): void {
    // CHECK#1: -1 === -1
    arktest.assertEQ(-1, -1);
    // CHECK#2: -(-1) === 1
    arktest.assertEQ(-(-1), 1);
    // CHECK#3: var x = -1; -x === 1
    let x: int = -1;
    arktest.assertEQ(-x, 1);
    // CHECK#4: var x = -1; -(-x) === -1
    let x4: int = -1;
    arktest.assertEQ(-(-x4), -1);
    // CHECK#5: object.prop = 1; -object.prop === -1
    let holder = new UnaryMinusHolder();
    arktest.assertEQ(-holder.prop, -1);
}
