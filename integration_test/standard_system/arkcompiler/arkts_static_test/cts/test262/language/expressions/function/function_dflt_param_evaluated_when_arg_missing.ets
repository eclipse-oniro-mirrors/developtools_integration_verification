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

// arktsid: function_dflt_param_evaluated_when_arg_missing
// description: a default parameter initializer is used when the argument is missing
// Conversion notes: covers the rule that default initializers apply to missing arguments; a missing trailing argument
// falls back to its initializer.

let initCount: int = 0;

function f(a: int = 10, b: int = initCount += 1): void {
    arktest.assertEQ(10, a);
    arktest.assertEQ(1, b);
}

function main(): void {
    f(10);          // b is missing, so its initializer runs
    arktest.assertEQ(1, initCount);
}