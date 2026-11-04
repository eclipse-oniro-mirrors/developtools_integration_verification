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
// arktsid: at_returns_item
// description: String.prototype.at returns the item value at the specified positive index

function main(): void {
    let s = '12345';

    arktest.assertEQ(s.at(0), '1');
    arktest.assertEQ(s.at(1), '2');
    arktest.assertEQ(s.at(2), '3');
    arktest.assertEQ(s.at(3), '4');
    arktest.assertEQ(s.at(4), '5');
}