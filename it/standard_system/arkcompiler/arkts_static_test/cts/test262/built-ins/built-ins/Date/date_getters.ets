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

// arktsid: date_getters
// description: Date getters (getFullYear, getMonth, getDate, getHours, getMinutes, getSeconds) on Date constructed with
// local time

function main(): void {
    // Jan 1, 2020 12:30:45 local time
    let d = new Date(2020, 0, 1, 12, 30, 45);

    arktest.assertEQ(d.getFullYear(), 2020);
    // getMonth returns 0-11 (0=January)
    arktest.assertEQ(d.getMonth(), 0);
    arktest.assertEQ(d.getDate(), 1);
    arktest.assertEQ(d.getHours(), 12);
    arktest.assertEQ(d.getMinutes(), 30);
    arktest.assertEQ(d.getSeconds(), 45);
}