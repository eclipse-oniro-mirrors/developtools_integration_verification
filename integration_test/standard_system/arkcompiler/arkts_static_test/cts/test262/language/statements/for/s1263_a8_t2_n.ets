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

/*---
desc: Checking if execution of "for(index=0; {index++;index<100;}; index*2;) {  arr.add(""+index);}" fails
tags: [compile-only, negative]
expected_out_1: [
    "Semantic error ESE0062: need to specify target type for class composite",
    "Syntax error ESY0228: Unexpected token, expected '('.",
    "Syntax error ESY0230: Expected '{', got ';'.",
    "Syntax error ESY0194: Parameter declaration should have an explicit type annotation.",
    "Syntax error ESY0229: Unexpected token, expected ',' or ')'.",
    "Syntax error ESY0112: Unexpected token, expected an identifier.",
    "Syntax error ESY0016: Unexpected token.",
    "Syntax error ESY0224: Identifier expected, got 'number literal'.",
    "Syntax error ESY0315: Number, string or computed value property name '100' is not allowed, use classes to access
    data by property names that are identifiers",
    "Syntax error ESY0228: Unexpected token, expected '>'.",
    "Syntax error ESY0230: Expected '{', got 'number literal'.",
    "Syntax error ESY0209: Illegal break statement.",
    "Syntax error ESY0230: Expected ')', got 'end of stream'.",
    "Syntax error ESY0230: Expected ';', got 'end of stream'.",
    "Syntax error ESY0230: Expected '}', got 'end of stream'.",
    "Syntax error ESY0227: Unexpected token 'end of stream'.",
]
---*/

function main(): void {
    let index: int = 0;
    for (index = 0; {
        index++; index < 100; }; index * 2;) {
        break;
    }
}
