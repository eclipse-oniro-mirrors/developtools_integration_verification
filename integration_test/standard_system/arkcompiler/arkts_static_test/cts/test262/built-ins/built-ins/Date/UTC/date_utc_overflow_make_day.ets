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

// arktsid: date_utc_overflow_make_day
// description: Values specified to MakeDay exceed their calendar boundaries
// Conversion notes:
//  - Date.UTC month/day arguments roll over via ecmaMakeDay, matching JS MakeDay wrap-around

function main(): void {
    arktest.assertEQ(Date.UTC(2016, 12), 1483228800000, 'month: 12');
    arktest.assertEQ(Date.UTC(2016, 13), 1485907200000, 'month: 13');
    arktest.assertEQ(Date.UTC(2016, 144), 1830297600000, 'month: 144');

    arktest.assertEQ(Date.UTC(2016, 0, 33), 1454371200000, 'day greater than month');
    arktest.assertEQ(Date.UTC(2016, 2, -27), 1454371200000, 'day negative value');
}