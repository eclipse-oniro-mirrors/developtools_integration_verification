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

// arktsid: concatenation_string_identity
// description: ToString conversion from string value is the input argument (no conversion)

function main(): void {
    // CHECK#1: "abc" + "" is the input string, no conversion
    let x1: string = 'abc';
    arktest.assertEQ(x1 + '', x1);

    // CHECK#2: typeof of a string is "string", unaffected by "" concatenation
    let x2: string = 'abc';
    arktest.assertEQ(typeof x2 + '', 'string');
}
