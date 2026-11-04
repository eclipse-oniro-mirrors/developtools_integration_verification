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

class NumberIterator implements Iterator<number> {
  private current: number = 0;
  private max: number = 100;

  constructor(max: number) {
    this.max = max;
  }

  next(): IteratorResult<number> {
    if (this.current >= this.max) {
      return new IteratorResult<number>();
    }
    return new IteratorResult<number>(this.current++);
  }

  reset(): void {
    this.current = 0;
  }
}

class NumberCollection implements Iterable<number> {
  private items: number[] = [1, 2, 3, 4, 5];

  $_iterator(): Iterator<number> {
    return new NumberIterator(this.items.length);
  }

  add(item: number): void {
    this.items.push(item);
  }
}

class NumberIterableIterator implements IterableIterator<number> {
  private current: number = 0;
  private max: number = 100;

  constructor(max: number) {
    this.max = max;
  }

  next(): IteratorResult<number> {
    if (this.current >= this.max) {
      return new IteratorResult<number>();
    }
    return new IteratorResult<number>(this.current++);
  }

  $_iterator(): IterableIterator<number> {
    return this;
  }
}
export default function IteratorPerfTest(): void {
  describe('IteratorPerfTest', () => {
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

    it('PerformanceTest_Iterator_IteratorResult_Constructor_NoArg_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: IteratorResult<number> = new IteratorResult<number>();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new IteratorResult<number>();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Iterator_IteratorResult_Constructor_NoArg_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'IteratorResult', 'constructor',
        'constructor(): IteratorResult<T>', arkTsAveragedTime);
    })

    it('PerformanceTest_Iterator_IteratorResult_Constructor_WithValue_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: IteratorResult<number> = new IteratorResult<number>(42);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new IteratorResult<number>(i);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Iterator_IteratorResult_Constructor_WithValue_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'IteratorResult', 'constructor',
        'constructor(value: T): IteratorResult<T>', arkTsAveragedTime);
    })

    it('PerformanceTest_Iterator_IteratorResult_Constructor_DoneAndValue_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: IteratorResult<number> = new IteratorResult<number>(false, 42);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new IteratorResult<number>(false, i);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Iterator_IteratorResult_Constructor_DoneAndValue_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'IteratorResult', 'constructor',
        'constructor(done: boolean, value: T | undefined): IteratorResult<T>', arkTsAveragedTime);
    })

    // it('PerformanceTest_Iterator_Next_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let iter = new NumberIterator(BASE_COUNT);
    //   let res: IteratorResult<number> = iter.next();
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     res = iter.next();
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = res;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Iterator_Next_0400: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.core', 'Iterator', 'next',
    //     'next(): IteratorResult<T>', arkTsAveragedTime);
    // })

    it('PerformanceTest_Iterator_Iterable_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let collection = new NumberCollection();
      let res: Iterator<number> = collection.$_iterator();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = collection.$_iterator();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Iterator_Iterable_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Iterable', '$_iterator',
        '$_iterator(): Iterator<T>', arkTsAveragedTime);
    })

    it('PerformanceTest_Iterator_Reset_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let iter = new NumberIterator(10);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        iter.reset();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = iter;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Iterator_Reset_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Iterator', 'reset',
        'reset(): void', arkTsAveragedTime);
    })

    it('PerformanceTest_Iterator_IteratorResult_Done_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = new IteratorResult<number>(false, 42);
      let res: boolean = result.done;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = result.done;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Iterator_IteratorResult_Done_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'IteratorResult', 'done',
        'done: boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_Iterator_IteratorResult_Value_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = new IteratorResult<number>(false, 42);
      let res: number | undefined = result.value;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = result.value;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Iterator_IteratorResult_Value_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'IteratorResult', 'value',
        'readonly value: T | undefined', arkTsAveragedTime);
    })

    it('PerformanceTest_Iterator_IterableIterator_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let iter: IterableIterator<number> = new NumberIterableIterator(BASE_COUNT);
      let res: Iterator<number> = iter.$_iterator();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = iter.$_iterator();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Iterator_IterableIterator_0900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'IterableIterator', '$_iterator',
        '$_iterator(): IterableIterator<T>', arkTsAveragedTime);
    })

    // it('PerformanceTest_Iterator_IteratorForEach_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let count: number = 0;
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     let iter: Iterator<number> = new NumberIterator(BASE_COUNT);
    //     iteratorForEach(iter, (v: number) => { count += v; });
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = count;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Iterator_IteratorForEach_1000: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.core', 'iteratorForEach', 'function',
    //     'iteratorForEach<V>(x: Iterator<V>, fn: (x: V) => void): void', arkTsAveragedTime);
    // })

  })
}
