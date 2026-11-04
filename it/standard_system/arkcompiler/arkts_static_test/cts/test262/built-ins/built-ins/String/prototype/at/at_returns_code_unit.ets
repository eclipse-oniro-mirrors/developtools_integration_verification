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

// arktsid: at_returns_code_unit
// description: String.prototype.at returns the code unit at the given index
// Conversion notes: test262 B|direct, 1:1 migration.

function main(): void {
    let s: String = '12\uD80034';
    arktest.assertEQ(s.at(0), '1', 's.at(0)');
    arktest.assertEQ(s.at(1), '2', 's.at(1)');
    arktest.assertEQ(s.at(2), '\uD800', 's.at(2) returns lone surrogate');
    arktest.assertEQ(s.at(3), '3', 's.at(3)');
    arktest.assertEQ(s.at(4), '4', 's.at(4)');
}