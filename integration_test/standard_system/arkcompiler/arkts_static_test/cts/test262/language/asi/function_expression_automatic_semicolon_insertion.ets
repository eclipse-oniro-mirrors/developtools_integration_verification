/*
 * Copyright (c) 2026 Hunan OpenValley Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// arktsid: function_expression_automatic_semicolon_insertion
// description: A line terminator after a function expression assignment ends the statement

class AsIBoxT2 {
    public x: int = 0;
}

function main(): void {
    let result = (o: AsIBoxT2): AsIBoxT2 => {
        o.x = 1;
        return o;
    };
    (new AsIBoxT2()).x;
    arktest.assertEQ(result(new AsIBoxT2()).x, 1);
}
