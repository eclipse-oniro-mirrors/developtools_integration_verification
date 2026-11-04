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

// arktsid: evaluation_order_with_assignment
// description: The left remainder operand is evaluated before the right operand

function main(): void {
    let x: double = 0.0;
    arktest.assertEQ((x = 1.0) % x, 0.0);

    x = 1.0;
    arktest.assertEQ(x % (x = 2.0), 1.0);
}
