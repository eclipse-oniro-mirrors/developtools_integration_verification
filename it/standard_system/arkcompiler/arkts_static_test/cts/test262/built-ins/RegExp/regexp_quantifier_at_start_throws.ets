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

// arktsid: regexp_quantifier_at_start_throws
// description: RegExp throws SyntaxError for a leading quantifier like **a, ++a, or ?a
// Conversion notes: test262 B|throws, parameterization merge from 6 source files. ArkTS validates RegExp at runtime via
// native parse() in constructor.

function main(): void {
    let caught0: boolean = false;
    try {
        let r0 = new RegExp('**a');
    } catch (e) {
        caught0 = true;
    }
    arktest.assertTrue(caught0, 'RegExp should throw SyntaxError');

    let caught1: boolean = false;
    try {
        let r1 = new RegExp('++a');
    } catch (e) {
        caught1 = true;
    }
    arktest.assertTrue(caught1, 'RegExp should throw SyntaxError');

    let caught2: boolean = false;
    try {
        let r2 = new RegExp('??a');
    } catch (e) {
        caught2 = true;
    }
    arktest.assertTrue(caught2, 'RegExp should throw SyntaxError');

    let caught3: boolean = false;
    try {
        let r3 = new RegExp('?a');
    } catch (e) {
        caught3 = true;
    }
    arktest.assertTrue(caught3, 'RegExp should throw SyntaxError');

    let caught4: boolean = false;
    try {
        let r4 = new RegExp('*a');
    } catch (e) {
        caught4 = true;
    }
    arktest.assertTrue(caught4, 'RegExp should throw SyntaxError');

    let caught5: boolean = false;
    try {
        let r5 = new RegExp('+a');
    } catch (e) {
        caught5 = true;
    }
    arktest.assertTrue(caught5, 'RegExp should throw SyntaxError');
}