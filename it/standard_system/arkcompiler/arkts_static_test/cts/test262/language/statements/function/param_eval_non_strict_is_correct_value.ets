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
// arktsid: param_eval_non_strict_is_correct_value
// description: eval allowed as formal parameter name of a non-strict function declaration

let exprCallCount: number = 0;
let evalValue: object = {};

function foo(eval: object): void {
    arktest.assertTrue(eval == evalValue);
    exprCallCount += 1;
}

function main(): void {
    foo(evalValue);
    arktest.assertEQ(exprCallCount, 1);
}
