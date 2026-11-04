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

// arktsid: conditional_coalesce_ternary
// description: ?? expression used as the conditional operator's condition
// Conversion notes: JS truthiness-coerces the ?? result in the condition; ArkTS
// requires a boolean condition, so only ?? results that are boolean migrate.
// Dropped the 0 / 1 / '' / Symbol() / {} left-operand cases: their ?? result is
// int / string / symbol / object, which is not a valid ArkTS boolean condition.

function main(): void {
    let x: int = 0;
    x = undefined ?? true ? 0 : 42;
    arktest.assertEQ(x, 0);
    x = null ?? true ? 0 : 42;
    arktest.assertEQ(x, 0);
    x = undefined ?? false ? 0 : 42;
    arktest.assertEQ(x, 42);
    x = null ?? false ? 0 : 42;
    arktest.assertEQ(x, 42);
    let f: boolean | null = false;
    x = f ?? true ? 0 : 42;
    arktest.assertEQ(x, 42);
    let t1: boolean | null = true;
    x = t1 ?? false ? 0 : 42;
    arktest.assertEQ(x, 0);
    let t2: boolean | null = true;
    x = t2 ?? true ? 0 : 42;
    arktest.assertEQ(x, 0);
}
