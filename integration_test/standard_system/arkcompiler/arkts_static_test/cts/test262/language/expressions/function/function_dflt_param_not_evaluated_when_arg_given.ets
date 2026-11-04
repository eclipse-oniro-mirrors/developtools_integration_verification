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

// arktsid: function_dflt_param_not_evaluated_when_arg_given
// description: a default parameter initializer is not evaluated when an argument is supplied
// Conversion notes: covers the rule that default initializers run only for missing arguments; explicit arguments win,
// so
// the initializer side effect never runs.

let initCount: int = 0;

function f(a: int = initCount += 1, b: int = initCount += 1): void {
    arktest.assertEQ(5, a);
    arktest.assertEQ(7, b);
}

function main(): void {
    f(5, 7);
    arktest.assertEQ(0, initCount);
}