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

// arktsid: try_use_variable1_n_n_n_variable2_construction
// description: Additive and prefix increment expressions across line breaks

function main(): void {
    let x: int = 0;
    let y: int = 0;
    let z: int =
        x + ++
            y;
    arktest.assertEQ(z, 1);
    arktest.assertEQ(y, 1);

    z =
        x + ++
            y;
    arktest.assertEQ(z, 2);
    arktest.assertEQ(y, 2);

    z =
        x + ++
            y;
    arktest.assertEQ(z, 3);
    arktest.assertEQ(y, 3);
}
