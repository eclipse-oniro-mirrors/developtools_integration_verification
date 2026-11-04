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

function main(): void {
  const date: Date = new Date('Wed Feb 15 2023 00:00:00 GMT+0100');
  const localeString: string = date.toLocaleString('en-US');

  arktest.assertEQ(-1, localeString.search('\u202f'));
  arktest.assertTrue(new RegExp(':\\d\\d:\\d\\d [AP]M$').test(localeString));

  const formatter: Intl.DateTimeFormat = new Intl.DateTimeFormat('en', { timeStyle: 'long' });
  formatter.format(date);

  arktest.assertEQ(-1, localeString.search('\u202f'));
  arktest.assertTrue(new RegExp(':\\d\\d:\\d\\d [AP]M$').test(localeString));
}
