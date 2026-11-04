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
// arktsid: assertion_begin_07
// description: Execute /^..^e/.test("ab\ncde") and check results
// Conversion notes:
//  - ^ has no m flag, so it cannot match mid-string; test() returns false

function main(): void {
    let r: RegExp = new RegExp('^..^e');
    let result: boolean = r.test('ab\ncde');
    arktest.assertFalse(result);
}