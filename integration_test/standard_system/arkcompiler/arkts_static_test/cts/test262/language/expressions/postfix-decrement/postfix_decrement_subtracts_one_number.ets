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

// arktsid: postfix_decrement_subtracts_one_number
// description: The postfix decrement operator on a number value assigns x = ToNumber(x) - 1, i.e. subtracts one

function main(): void {
    let x: double = 1.1;
    x--;
    arktest.assertEQ(x, 1.1 - 1);
}
