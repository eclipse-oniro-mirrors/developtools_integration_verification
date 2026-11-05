/*
 * Copyright (c) 2021-2026 Huawei Device Co., Ltd.
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

import {
  describe,
  it,
  TestType,
  Size,
  Level,
  beforeEach,
  afterAll,
  expect
} from "@ohos/hypium";
import performance from './Performance.util';
import { systemDateTime } from '@kit.BasicServicesKit';

declare class ArkTools {
  static forceFullGC(): void;
}

interface Comparable<T> {
  compareTo(other: T): number;
}

class Person implements Comparable<Person> {
  age: number;

  constructor(age: number) {
    this.age = age;
  }

  compareTo(other: Person): number {
    return this.age - other.age;
  }
}

class Student extends Person {
  grade: number;

  constructor(age: number, grade: number) {
    super(age);
    this.grade = grade;
  }

  compareTo(other: Person): number {
    let ageDiff = this.age - other.age;
    if (ageDiff != 0) {
      return ageDiff;
    }
    if (other instanceof Student) {
      return this.grade - other.grade;
    }
    return this.grade;
  }
}

export default function ComparablePerfTest(): void {
  describe('ComparablePerfTest', () => {
    const BASE_COUNT = 1000;

    beforeEach(() => {

    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_Comparable_CompareTo_LessThan_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let p1 = new Person(20);
      let p2 = new Person(30);
      let res: number = 0;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = p1.compareTo(p2);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Comparable_CompareTo_LessThan_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Comparable', 'compareTo',
        'compareTo(to: T): int (less than)', arkTsAveragedTime);
      done();
    })

  })
}