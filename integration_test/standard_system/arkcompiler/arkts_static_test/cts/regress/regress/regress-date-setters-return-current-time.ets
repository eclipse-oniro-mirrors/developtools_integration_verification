/*
 * Copyright (c) 2025 Hunan OpenValley Digital Industry Development Co., Ltd.
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

function checkCurrentTime(date: Date, returnedTime: long): void {
  arktest.assertEQ(date.getTime(), returnedTime);
}

function main(): void {
  const date: Date = new Date(2010, 1, 1);
  checkCurrentTime(date, date.setMilliseconds(10));
  checkCurrentTime(date, date.setSeconds(10));
  checkCurrentTime(date, date.setMinutes(10));
  checkCurrentTime(date, date.setHours(10));
  checkCurrentTime(date, date.setDate(10));
  checkCurrentTime(date, date.setMonth(10));
  checkCurrentTime(date, date.setFullYear(2010));
  checkCurrentTime(date, date.setUTCMilliseconds(10));
  checkCurrentTime(date, date.setUTCSeconds(10));
  checkCurrentTime(date, date.setUTCMinutes(10));
  checkCurrentTime(date, date.setUTCHours(10));
  checkCurrentTime(date, date.setUTCDate(10));
  checkCurrentTime(date, date.setUTCMonth(10));
  checkCurrentTime(date, date.setUTCFullYear(2010));
}
