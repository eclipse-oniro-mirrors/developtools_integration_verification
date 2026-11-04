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

// arktsid: multiplication_underflow_signed_zero
// description: If the magnitude is too small to represent, the result is a zero of the appropriate sign.

function main(): void {
  let pos: double = Number.MIN_VALUE * 0.1;
  arktest.assertEQ(pos, 0.0);
  arktest.assertTrue(1.0 / pos > 0.0);
  let neg: double = -0.1 * Number.MIN_VALUE;
  arktest.assertEQ(neg, 0.0);
  arktest.assertTrue(1.0 / neg < 0.0);
}
