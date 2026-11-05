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

// arktsid: function_dflt_param_ref_prior
// description: a default parameter initializer may reference earlier formal parameters
// Conversion notes: covers the rule that default initializers are evaluated left-to-right, so a parameter's initializer
// can read the already-bound earlier parameters.

let callCount: int = 0;

function f(x: int, y: int = x, z: int = y): void {
    arktest.assertEQ(3, x);
    arktest.assertEQ(3, y);
    arktest.assertEQ(3, z);
    callCount = callCount + 1;
}

function main(): void {
    f(3);
    arktest.assertEQ(1, callCount);
}