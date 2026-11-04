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

// arktsid: multiplication_line_terminator
// description: Line terminator between the operands of the multiplication operator is accepted (x = 18 * 2 * 9 written
// across lines)

function main(): void {
    let x: int = 18 *
        2 *
        9;
    arktest.assertEQ(x, 324);
}