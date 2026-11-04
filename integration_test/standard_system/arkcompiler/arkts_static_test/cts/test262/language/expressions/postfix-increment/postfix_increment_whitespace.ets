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

// arktsid: postfix_increment_whitespace
// description: White space between the operand and ++ is allowed for the postfix increment operator
// Conversion notes: regular space, tab, and a space+tab combination are exercised; exotic Unicode whitespace
// (U+000B/U+000C/U+00A0) cases dropped

function main(): void {
    let x: int = 0;
    arktest.assertEQ(x ++, 0);
    arktest.assertEQ(x, 1);

    x	++;
    arktest.assertEQ(x, 2);

    x 	 ++;
    arktest.assertEQ(x, 3);
}