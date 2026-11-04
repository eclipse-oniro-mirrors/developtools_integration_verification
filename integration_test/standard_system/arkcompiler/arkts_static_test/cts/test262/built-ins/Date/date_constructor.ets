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

// arktsid: date_constructor
// description: new Date() and new Date(milliseconds) constructors; getTime returns epoch milliseconds
// Migrated from test262: built-ins/Date constructor tests

function main(): void {
    // new Date() creates Date for current time (getTime returns a valid number)
    let d1 = new Date();
    let t1: long = d1.getTime();
    arktest.assertEQ(t1 > 0, true);

    // new Date(0) creates epoch date
    let d2 = new Date(0);
    arktest.assertEQ(d2.getTime(), 0);

    // new Date with positive milliseconds
    let d3 = new Date(86400000); // 1 day in ms
    arktest.assertEQ(d3.getTime(), 86400000);
}
