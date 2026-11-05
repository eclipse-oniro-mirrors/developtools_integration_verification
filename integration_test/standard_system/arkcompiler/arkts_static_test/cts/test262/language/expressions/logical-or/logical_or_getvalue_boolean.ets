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

// arktsid: logical_or_getvalue_boolean
// description: Operator x || y uses GetValue (boolean operands)
// Conversion notes: kept the pure-boolean CHECK#1/2; dropped CHECK#3-6
// (new Boolean(...) wrapper — object identity, no ArkTS equivalent) and
// CHECK#7/8 (number-typed operands — ArkTS || requires boolean operands, no
// truthiness coercion).

function main(): void {
    // CHECK#1: (true || false) === true
    arktest.assertTrue(true || false);
    // CHECK#2: (false || true) === true
    arktest.assertTrue(false || true);
}
