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

// arktsid: conditional_boolean_ternary
// description: The conditional operator (?:) with boolean operands returns the selected branch

function main(): void {
    // ToBoolean(true) is true -> return y (false)
    arktest.assertEQ(true ? false : true, false);
    // ToBoolean(false) is false -> return z (true)
    arktest.assertEQ(false ? false : true, true);
}
