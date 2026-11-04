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

// arktsid: line_terminators_between_operators_divide
// description: Line terminators may occur between the operands and the `/` operator

function main(): void {
    let y: int = 12;
    let z: int = 2;
    // line feed between tokens
    let
    x =
    y /
    z
    ;
    arktest.assertEQ(x, 6, 'line feed between operator tokens');
    // line separator (U+2028) between tokens
    let x2 = 12 / 2;
    arktest.assertEQ(x2, 6, 'line separator between operator tokens');
    // paragraph separator (U+2029) between tokens
    let x3 = 12 / 2;
    arktest.assertEQ(x3, 6, 'paragraph separator between operator tokens');
}
