'use static'
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
  expect,
  TestType,
  Size,
  Level,
  beforeAll,
  afterAll,
  beforeEach,
  afterEach
} from "../../../hypium/index";
import { Stack } from '@kit.ArkTS';
import performance from './Performance.util';

export default function StackPerfTest(): void {
  describe('StackPerfTest', () => {
    const BASE_COUNT = 50000;

    beforeEach(() => {
      let ret = GC.startGC(GC.Cause.FULL, true);
      GC.waitForFinishGC(ret);
      let ret1 = GC.startGC(GC.Cause.FULL, true);
      GC.waitForFinishGC(ret1);
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    // ==================== 1. constructor ====================

    it('PerformanceTest_Stack_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Stack<string> = new Stack<string>();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Stack<string>();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Stack_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Stack', 'constructor',
        'constructor()', arkTsAveragedTime);
    })

    // ==================== 2. length ====================

    it('PerformanceTest_Stack_Length_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let stack: Stack<string> = new Stack<string>();
      stack.push('test');
      let res: int = stack.length;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = stack.length;
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Stack_Length_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Stack', 'length',
        'get length(): int', arkTsAveragedTime);
    })

    // ==================== 3. push ====================

    it('PerformanceTest_Stack_Push_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let stacks: Stack<string>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        stacks.push(new Stack<string>());
      }
      let res: string = '';
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = stacks[i].push('test');
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Stack_Push_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Stack', 'push',
        'push(item: T): T', arkTsAveragedTime);
    })

    // ==================== 4. pop ====================

    it('PerformanceTest_Stack_Pop_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let stacks: Stack<string>[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        let s = new Stack<string>();
        s.push('a');
        stacks.push(s);
      }
      let res: string = '';
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = stacks[i].pop();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Stack_Pop_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Stack', 'pop',
        'pop(): T', arkTsAveragedTime);
    })

    // ==================== 5. peek ====================

    it('PerformanceTest_Stack_Peek_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let stack: Stack<string> = new Stack<string>();
      stack.push('test');
      let res: string = stack.peek();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = stack.peek();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Stack_Peek_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Stack', 'peek',
        'peek(): T', arkTsAveragedTime);
    })

    // ==================== 6. locate ====================

    it('PerformanceTest_Stack_Locate_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let stack: Stack<string> = new Stack<string>();
      stack.push('test');
      let res: int = stack.locate('test');
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = stack.locate('test');
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Stack_Locate_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Stack', 'locate',
        'locate(element: T): int', arkTsAveragedTime);
    })

    // ==================== 7. isEmpty ====================

    it('PerformanceTest_Stack_IsEmpty_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let stack: Stack<string> = new Stack<string>();
      let res: boolean = stack.isEmpty();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = stack.isEmpty();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Stack_IsEmpty_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Stack', 'isEmpty',
        'isEmpty(): boolean', arkTsAveragedTime);
    })

    // ==================== 8. forEach ====================

    it('PerformanceTest_Stack_ForEach_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let stack: Stack<string> = new Stack<string>();
      stack.push('test');
      let callback = (value: string, index: int, s: Stack<string>): void => {
      };
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        stack.forEach(callback);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Stack_ForEach_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Stack', 'forEach',
        'forEach(callbackfn: StackForEachCb<T>): void', arkTsAveragedTime);
    })

    // ==================== 9. $_iterator ====================

    it('PerformanceTest_Stack_Iterator_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let stack: Stack<string> = new Stack<string>();
      stack.push('test');
      let res = stack.$_iterator();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = stack.$_iterator();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Stack_Iterator_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'Stack', '$_iterator',
        '$_iterator(): IterableIterator<T>', arkTsAveragedTime);
    })

  })
}
