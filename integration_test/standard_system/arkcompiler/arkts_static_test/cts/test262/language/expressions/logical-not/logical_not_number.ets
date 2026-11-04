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

// arktsid: logical_not_number
// description: Operator !x returns !ToBoolean(x) (number primitive)
// Conversion notes: kept CHECK#1/3/5/7 (number primitives); dropped CHECK#2/4/6
// (new Number(...) wrapper — no ArkTS equivalent). Infinity maps to
// Double.POSITIVE_INFINITY.

function main(): void {
    // CHECK#1: !0.1 === false
    arktest.assertEQ(!0.1, false);
    // CHECK#3: !NaN === true
    arktest.assertEQ(!Double.NaN, true);
    // CHECK#5: !0 === true
    arktest.assertEQ(!0, true);
    // CHECK#7: !Infinity === false
    arktest.assertEQ(!Double.POSITIVE_INFINITY, false);
}
