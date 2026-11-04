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

// arktsid: non_existent_property_value_script_negated
// description: Non-existent property values must not be supported in Unicode property escapes.
// Conversion notes:
//  - RegExp pattern validation happens at runtime in the constructor's native parse();
//    \P{Script=FooBarBazInvalid} is a negated Unicode property escape with an invalid Script value.

function main(): void {
    let caught: boolean = false;
    try {
        let r = new RegExp('\\P{Script=FooBarBazInvalid}', 'u');
    } catch (e) {
        caught = true;
    }
    arktest.assertTrue(caught, 'RegExp(\\P{Script=FooBarBazInvalid}, u) should throw SyntaxError');
}