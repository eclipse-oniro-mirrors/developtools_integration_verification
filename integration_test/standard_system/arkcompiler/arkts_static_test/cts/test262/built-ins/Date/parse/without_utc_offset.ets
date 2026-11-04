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

// arktsid: without_utc_offset
// description: Offsetless date-time strings are local time, offsetless date-only strings are UTC time
// Conversion notes: Date.parse/getTimezoneOffset return long. Offsetless
//   date-time parses as local time and date-only as UTC, matching JS, so the
//   assertion is self-consistent in any timezone.

function main(): void {
    const timezoneOffsetMS: long = new Date(0).getTimezoneOffset() * 60000;
    arktest.assertEQ(Date.parse('1970-01-01T00:00:00'), timezoneOffsetMS, 'offsetless date-time is local time');
    arktest.assertEQ(Date.parse('1970-01-01'), 0, 'offsetless date-only is UTC time');
}