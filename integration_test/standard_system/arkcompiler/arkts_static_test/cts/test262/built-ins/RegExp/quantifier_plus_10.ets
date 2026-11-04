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
// arktsid: quantifier_plus_10
// description: Execute /o+/.test("abcdefg") and check results - QuantifierPrefix + does not match absent 'o'

function main(): void {
    let r: RegExp = new RegExp('o+');
    let executed: boolean = r.test('abcdefg');
    arktest.assertFalse(executed, 'The value of !executed is expected to be true');
}