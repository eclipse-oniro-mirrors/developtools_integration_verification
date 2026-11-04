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
// arktsid: set_has_false_string
// description: Set.prototype.has returns false when the string value is not present

function main(): void {
    let s = new Set<string>();
    arktest.assertTrue(s.has('') === false, 'has(\'\') returns false on empty set');
    s.add('a');
    arktest.assertTrue(s.has('z') === false, 'has(\'z\') returns false when only \'a\' present');
}