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

// arktsid: catch_parameter_shadowing_function_parameter_name
// description: A catch parameter shadows a function parameter

function verifyCatch(a: int): void {
    try {
        throw new Error('stuff1');
    } catch (a) {
        arktest.assertEQ(a.message, 'stuff1');
        a = new Error('2');
        arktest.assertEQ(a.message, '2');
    }
}

function main(): void {
    verifyCatch(1);
}
