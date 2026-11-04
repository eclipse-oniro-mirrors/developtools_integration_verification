/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  describe,
  it,
  expect,
  TestType,
  Size,
  Level,
  beforeEach,
  afterAll
} from "../../../hypium/index";
import performance from './Performance.util';

// 实现 Comparable 接口的测试类
class Person implements Comparable<Person> {
  age: int;

  constructor(age: int) {
    this.age = age;
  }

  compareTo(other: Person): int {
    return this.age - other.age;
  }
}

class Student extends Person {
  grade: int;

  constructor(age: int, grade: int) {
    super(age);
    this.grade = grade;
  }

  compareTo(other: Student): int {
    // 先按年龄比较，再按年级比较
    let ageDiff = this.age - other.age;
    if (ageDiff != 0) {
      return ageDiff;
    }
    return this.grade - other.grade;
  }
}

export default function ComparablePerfTest(): void {
  describe('ComparablePerfTest', () => {
    // 毫秒 * 1000 = 微秒 毫秒 * 1000000 = 纳秒
    const BASE_COUNT = 50000;
    // url.URLParams.get --url.URLParams.has --util.getHash --util.Types.isMap --uri.uri.checkIsAbsolute --util.Types.isArrayBuffer
    const BASE_COUNT_BIG = 500000;
    const UNIT_TIME = 1000000;
    // buffer.from
    const BASE_COUNT_MIX = 100;

    beforeEach(() => {
      let ret = GC.startGC(GC.Cause.FULL, true);
      GC.waitForFinishGC(ret);
      let ret1 = GC.startGC(GC.Cause.FULL, true);
      GC.waitForFinishGC(ret1);
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    // ========== compareTo 测试 - 基本比较 (小于) ==========
    it('PerformanceTest_Comparable_CompareTo_LessThan_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let p1 = new Person(20);
      let p2 = new Person(30);
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = p1.compareTo(p2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Comparable_CompareTo_LessThan_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Comparable', 'compareTo',
        'compareTo(to: T): int (less than)', arkTsAveragedTime);
    })

    // ========== compareTo 测试 - 等于 ==========
    // it('PerformanceTest_Comparable_CompareTo_Equal_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let p1 = new Person(25);
    //   let p2 = new Person(25);
    //   let res: int = 0;
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     res = p1.compareTo(p2);
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = res;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Comparable_CompareTo_Equal_0200: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.core', 'Comparable', 'compareTo',
    //     'compareTo(to: T): int (equal)', arkTsAveragedTime);
    // })

    // ========== compareTo 测试 - 大于 ==========
    // it('PerformanceTest_Comparable_CompareTo_GreaterThan_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let p1 = new Person(40);
    //   let p2 = new Person(30);
    //   let res: int = 0;
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     res = p1.compareTo(p2);
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = res;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Comparable_CompareTo_GreaterThan_0300: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.core', 'Comparable', 'compareTo',
    //     'compareTo(to: T): int (greater than)', arkTsAveragedTime);
    // })

    // ========== compareTo 测试 - 子类继承比较 ==========
    // it('PerformanceTest_Comparable_CompareTo_SubClass_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let s1 = new Student(20, 3);
    //   let s2 = new Student(20, 5);
    //   let res: int = 0;
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     res = s1.compareTo(s2);
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = res;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Comparable_CompareTo_SubClass_0400: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.core', 'Comparable', 'compareTo',
    //     'compareTo(to: T): int (subclass)', arkTsAveragedTime);
    // })

  })
}
