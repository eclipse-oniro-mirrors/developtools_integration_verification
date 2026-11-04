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

// arktsid: date_getutcdate_valid
// description: Date.getUTCDate returns value for valid date
// Conversion notes: test262 B|direct, 1:1 migration. Timestamp constructor
//   paired with UTC getter for timezone stability.

function main(): void {
    arktest.assertEQ(new Date(1467846000000).getUTCDate(), 6, 'getUTCDate case 0');
    arktest.assertEQ(new Date(1467817200000).getUTCDate(), 6, 'getUTCDate case 1');
}