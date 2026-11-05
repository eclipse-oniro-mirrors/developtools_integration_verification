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

// arktsid: parameter_name_shadowing_parameter_name_let_const_and_var
// description: Nested function parameters shadow outer bindings

function verifyParameters(a: int): void {
    let b: int = 1;
    let c: int = 1;
    const d: int = 1;
    let inner = (a: int, b: int, c: int, d: int): void => {
        a = 2;
        b = 2;
        c = 2;
        d = 2;
        arktest.assertEQ(a, 2);
        arktest.assertEQ(b, 2);
        arktest.assertEQ(c, 2);
        arktest.assertEQ(d, 2);
    };
    inner(1, 1, 1, 1);
    arktest.assertEQ(a, 1);
    arktest.assertEQ(b, 1);
    arktest.assertEQ(c, 1);
    arktest.assertEQ(d, 1);
}

function main(): void {
    verifyParameters(1);
}
