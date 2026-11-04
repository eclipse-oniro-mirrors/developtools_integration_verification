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

// arktsid: multiplication_number_basic
// description: The multiplication operator x * y uses GetValue on each operand. Check 1*1, x*1, 1*y, x*y and
// member-access operands.

class MultiplicationOperand {
  public prop: int = 1;
}

function main(): void {
  arktest.assertEQ(1 * 1, 1);
  let x: int = 1;
  arktest.assertEQ(x * 1, 1);
  let y: int = 1;
  arktest.assertEQ(1 * y, 1);
  arktest.assertEQ(x * y, 1);
  let objectx = new MultiplicationOperand();
  let objecty = new MultiplicationOperand();
  arktest.assertEQ(objectx.prop * objecty.prop, 1);
}