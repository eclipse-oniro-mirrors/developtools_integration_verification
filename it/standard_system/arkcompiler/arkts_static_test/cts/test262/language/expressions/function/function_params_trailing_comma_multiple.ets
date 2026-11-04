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

// arktsid: function_params_trailing_comma_multiple
// description: a trailing comma in the parameter list does not increase the parameter count (multiple parameters)
// Conversion notes: covers the rule that a trailing comma after the last formal parameter is allowed and binds exactly
// the declared parameters; the ArkTS .length property of function objects is not exposed, so only the call behavior is
// asserted.

let callCount: int = 0;

function f(a: int, b: int,): void {
    arktest.assertEQ(42, a);
    arktest.assertEQ(39, b);
    callCount = callCount + 1;
}

function main(): void {
    f(42, 39);
    arktest.assertEQ(1, callCount);
}