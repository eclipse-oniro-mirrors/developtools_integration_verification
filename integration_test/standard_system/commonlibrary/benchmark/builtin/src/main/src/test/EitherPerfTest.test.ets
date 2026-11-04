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
  TestType,
  Size,
  Level,
  beforeEach,
  afterAll
} from "../../../hypium/index";
import performance from './Performance.util';

export default function EitherPerfTest(): void {
  describe('EitherPerfTest', () => {
    // 毫秒 * 1000 = 微秒 毫秒 * 1000000 = 纳秒
    const BASE_COUNT = 50000;
    // url.URLParams.get --url.URLParams.has --util.getHash --util.Types.isMap --uri.uri.checkIsAbsolute --util.Types.isArrayBuffer
    const BASE_COUNT_BIG = 500000;
    const UNIT_TIME = 1000000;

    beforeEach(() => {
      let ret = GC.startGC(GC.Cause.FULL, true);
      GC.waitForFinishGC(ret);
      let ret1 = GC.startGC(GC.Cause.FULL, true);
      GC.waitForFinishGC(ret1);
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    // Left.$_invoke(data: L) 测试
    it('PerformanceTest_Left_Static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Left<int, int> = Left.$_invoke<int, int>(1);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Left.$_invoke<int, int>(i);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Left_Static_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Left', '$_invoke',
        'static $_invoke<L, R>(data: L): Left<L, R>', arkTsAveragedTime);
    })

    // Right.$_invoke(data: R) 测试
    it('PerformanceTest_Right_Static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Right<int, int> = Right.$_invoke<int, int>(1);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Right.$_invoke<int, int>(i);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Right_Static_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Right', '$_invoke',
        'static $_invoke<L, R>(data: R): Right<L, R>', arkTsAveragedTime);
    })

    // Either.isLeft() 测试
    it('PerformanceTest_Either_Method_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let leftVal: Either<int, int> = Left.$_invoke<int, int>(1);
      let res: boolean = leftVal.isLeft();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = leftVal.isLeft();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Either_Method_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Either', 'isLeft',
        'final isLeft(): boolean', arkTsAveragedTime);
    })

    // Either.isRight() 测试
    it('PerformanceTest_Either_Method_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rightVal: Either<int, int> = Right.$_invoke<int, int>(1);
      let res: boolean = rightVal.isRight();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = rightVal.isRight();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Either_Method_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Either', 'isRight',
        'final isRight(): boolean', arkTsAveragedTime);
    })

    // Either.left getter 测试
    it('PerformanceTest_Either_Getter_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let leftVal: Either<int, int> = Left.$_invoke<int, int>(42);
      let res: int = leftVal.left;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = leftVal.left;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Either_Getter_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Either', 'left',
        'final get left(): L', arkTsAveragedTime);
    })

    // Either.right getter 测试
    it('PerformanceTest_Either_Getter_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rightVal: Either<int, int> = Right.$_invoke<int, int>(42);
      let res: int = rightVal.right;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = rightVal.right;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Either_Getter_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Either', 'right',
        'final get right(): R', arkTsAveragedTime);
    })

  })
}
