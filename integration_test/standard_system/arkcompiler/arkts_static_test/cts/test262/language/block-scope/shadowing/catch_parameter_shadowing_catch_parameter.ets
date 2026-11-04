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

// arktsid: catch_parameter_shadowing_catch_parameter
// description: Nested catch parameters shadow independently

function main(): void {
    let c: int = 1;
    try {
        throw new Error('stuff3');
    } catch (c) {
        try {
            throw new Error('stuff4');
        } catch (c) {
            arktest.assertEQ(c.message, 'stuff4');
            c = new Error('3');
            arktest.assertEQ(c.message, '3');
        }
        arktest.assertEQ(c.message, 'stuff3');
    }
    arktest.assertEQ(c, 1);
}
