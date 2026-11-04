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

class DateParts {
  public year: string;
  public month: string;
  public day: string;
  public hour: string;
  public minute: string;
  public second: string;

  constructor(year: string, month: string, day: string, hour: string, minute: string, second: string) {
    this.year = year;
    this.month = month;
    this.day = day;
    this.hour = hour;
    this.minute = minute;
    this.second = second;
  }
}

function main(): void {
  const dates: DateParts[] = [
    new DateParts('2021', '10', '22', '10', '12', '32'),
    new DateParts('2021', '8', '3', '9', '9', '6')
  ];

  for (let date of dates) {
    const year: string = date.year;
    const month: string = date.month;
    const day: string = date.day;
    const hour: string = date.hour;
    const minute: string = date.minute;
    const second: string = date.second;
    const original: string = `${year}-${month}-${day} ${hour}:${minute}:${second}Z`;

    for (let i: int = 1; i < 10; i++) {
      const candidate: string = `${'0'.repeat(i) + year}-${month}-${day} ${hour}:${minute}:${second}Z`;
      arktest.assertTrue(new Date(original).getTime() == new Date(candidate).getTime());
    }

    for (let i: int = 1; i < 10; i++) {
      const candidate: string = `${year}-${'0'.repeat(i) + month}-${day} ${hour}:${minute}:${second}Z`;
      arktest.assertTrue(new Date(original).getTime() == new Date(candidate).getTime());
    }

    for (let i: int = 1; i < 10; i++) {
      const candidate: string = `${year}-${month}-${'0'.repeat(i) + day} ${hour}:${minute}:${second}Z`;
      arktest.assertTrue(new Date(original).getTime() == new Date(candidate).getTime());
    }

    for (let i: int = 1; i < 10; i++) {
      const candidate: string = `${year}-${month}-${day} ${'0'.repeat(i) + hour}:${minute}:${second}Z`;
      arktest.assertTrue(new Date(original).getTime() == new Date(candidate).getTime());
    }

    for (let i: int = 1; i < 10; i++) {
      const candidate: string = `${year}-${month}-${day} ${hour}:${'0'.repeat(i) + minute}:${second}Z`;
      arktest.assertTrue(new Date(original).getTime() == new Date(candidate).getTime());
    }

    for (let i: int = 1; i < 10; i++) {
      const candidate: string = `${year}-${month}-${day} ${hour}:${minute}:${'0'.repeat(i) + second}Z`;
      arktest.assertTrue(new Date(original).getTime() == new Date(candidate).getTime());
    }

    arktest.assertTrue(new Date(original).getTime() == Date.parse(original));
  }
}
