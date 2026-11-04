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

// arktsid: function_dflt_param_trailing_comma
// description: a trailing comma combines with a default parameter initializer
// Conversion notes: covers the rule that a trailing comma after the last formal is allowed alongside a default
// parameter; the default applies to a missing argument.

let callCount: int = 0;

function f(a: int, b: int = 39,): void {
    arktest.assertEQ(42, a);
    arktest.assertEQ(39, b);
    callCount = callCount + 1;
}

function main(): void {
    f(42);
    arktest.assertEQ(1, callCount);
}