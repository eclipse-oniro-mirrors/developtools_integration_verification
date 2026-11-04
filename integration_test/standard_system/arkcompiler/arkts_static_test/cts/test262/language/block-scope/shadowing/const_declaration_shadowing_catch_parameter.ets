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

// arktsid: const_declaration_shadowing_catch_parameter
// description: A const declaration shadows a catch parameter in a nested block

function main(): void {
    let outer: int = 1;
    try {
        throw new Error('stuff3');
    } catch (caught) {
        {
            const caught: int = 3;
            arktest.assertEQ(caught, 3);
        }
        arktest.assertEQ(caught.message, 'stuff3');
    }
    arktest.assertEQ(outer, 1);
}
