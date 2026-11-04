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

// arktsid: logical_and_getvalue_boolean
// description: Operator x && y uses GetValue (boolean operands)
// Conversion notes: kept the pure-boolean CHECK#1/2/3/5; dropped CHECK#4/6
// (new Boolean(...) wrapper — object identity, no ArkTS equivalent) and
// CHECK#7/8 (number-typed operands 1.1 && true / 0 && true — ArkTS && requires
// boolean operands, no truthiness coercion).

function main(): void {
    // CHECK#1: (false && true) === false
    arktest.assertFalse(false && true);
    // CHECK#2: (true && false) === false
    arktest.assertFalse(true && false);
    // CHECK#3: var x = false; (x && true) === false
    let x: boolean = false;
    arktest.assertFalse(x && true);
    // CHECK#5: var x = false; var y = true; (x && y) === false
    let x5: boolean = false;
    let y5: boolean = true;
    arktest.assertFalse(x5 && y5);
}
