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

// arktsid: regexp_class_chars
// description: RegularExpressionClassChars may include the forward slash character

function main(): void {
    let r1: RegExp = new RegExp('[/]');
    arktest.assertTrue(r1.test('/'));
    arktest.assertFalse(r1.test('x'));

    let r2: RegExp = new RegExp('[//]');
    arktest.assertTrue(r2.test('/'));
    arktest.assertFalse(r2.test('x'));
}