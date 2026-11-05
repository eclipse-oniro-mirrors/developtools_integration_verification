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

// arktsid: date_utc_overflow_make_time
// description: Values specified to MakeTime exceed their time boundaries
// Conversion notes:
//  - Date.UTC hour/minute/second/ms arguments roll over via ecmaMakeTime, matching JS MakeTime wrap-around

function main(): void {
    arktest.assertEQ(Date.UTC(2016, 6, 5, -1), 1467673200000, 'hour: -1');
    arktest.assertEQ(Date.UTC(2016, 6, 5, 24), 1467763200000, 'hour: 24');
    arktest.assertEQ(Date.UTC(2016, 6, 5, 0, -1), 1467676740000, 'minute: -1');
    arktest.assertEQ(Date.UTC(2016, 6, 5, 0, 60), 1467680400000, 'minute: 60');
    arktest.assertEQ(Date.UTC(2016, 6, 5, 0, 0, -1), 1467676799000, 'second: -1');
    arktest.assertEQ(Date.UTC(2016, 6, 5, 0, 0, 60), 1467676860000, 'second: 60');
    arktest.assertEQ(Date.UTC(2016, 6, 5, 0, 0, 0, -1), 1467676799999, 'millisecond: -1');
    arktest.assertEQ(Date.UTC(2016, 6, 5, 0, 0, 0, 1000), 1467676801000, 'millisecond: 1000');
}