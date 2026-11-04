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

// arktsid: function_return_line_terminator_in_nested_call
// description: Line terminators preserve a nested property call and its result

class AsIBoxT5 {
    public a: () => int;

    constructor(value: int) {
        this.a = (): int => {
            return value + 1;
        };
    }
}

function main(): void {
    let x: int =
        1 + (((t: int): AsIBoxT5 => {
            return new AsIBoxT5(t);
        })(2 + 3)).
        a();
    arktest.assertEQ(x, 7);
}
