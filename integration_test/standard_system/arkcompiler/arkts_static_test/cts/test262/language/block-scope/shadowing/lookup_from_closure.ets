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

// arktsid: lookup_from_closure
// description: A nested closure resolves bindings through the enclosing scope

function verify(one: int): void {
    let x: int = one + 1;
    let y: int = one + 2;
    const u: int = one + 4;
    {
        let z: int = one + 3;
        const v: int = one + 5;
        let check = (): void => {
            arktest.assertEQ(one, 1);
            arktest.assertEQ(x, 2);
            arktest.assertEQ(y, 3);
            arktest.assertEQ(z, 4);
            arktest.assertEQ(u, 5);
            arktest.assertEQ(v, 6);
        };
        check();
    }
}

function main(): void {
    verify(1);
}
