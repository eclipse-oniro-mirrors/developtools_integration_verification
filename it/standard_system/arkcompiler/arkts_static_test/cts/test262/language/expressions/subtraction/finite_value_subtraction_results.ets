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

// arktsid: finite_value_subtraction_results
// description: Subtracting zero and finite values preserves the expected result

function main(): void {
    arktest.assertEQ(1.0 - -0.0, 1.0);
    arktest.assertEQ(1.0 - 0.0, 1.0);
    arktest.assertEQ(-0.0 - 1.0, -1.0);
    arktest.assertEQ(0.0 - 1.0, -1.0);
    arktest.assertEQ(Number.MAX_VALUE - -0.0, Number.MAX_VALUE);
    arktest.assertEQ(Number.MAX_VALUE - 0.0, Number.MAX_VALUE);
    arktest.assertEQ(-0.0 - Number.MIN_VALUE, -Number.MIN_VALUE);
    arktest.assertEQ(0.0 - Number.MIN_VALUE, -Number.MIN_VALUE);
}
