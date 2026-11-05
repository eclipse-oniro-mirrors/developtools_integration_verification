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

// arktsid: date_gettime_valid
// description: Date.getTime returns the time value
// Conversion notes: test262 B|direct, 1:1 migration. Timestamp constructor
//   paired with UTC getter for timezone stability.

function main(): void {
    let ts: long = 1467817200000;
    let d = new Date(ts);
    arktest.assertEQ(d.getTime(), ts, 'getTime');
}