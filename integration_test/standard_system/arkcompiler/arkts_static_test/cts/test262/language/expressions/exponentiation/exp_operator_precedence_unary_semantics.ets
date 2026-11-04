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

// arktsid: exp_operator_precedence_unary_semantics
// description: Unary +/- applied to a parenthesized exponentiation; a unary expression is allowed as the right operand
// of ** (numeric subset of exp-operator-precedence-unary-expression-semantics.js)

function main(): void {
    arktest.assertEQ(-(3 ** 2), -9.0);
    arktest.assertEQ(+(3 ** 2), 9.0);
    arktest.assertEQ(~(3 ** 2), -10);
    arktest.assertTrue(!(3 ** 2) === false);
    arktest.assertTrue((2 ** -2) === 0.25);
}