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
  beforeAll,
  afterAll,
  beforeEach
} from "../../../hypium/index";
import performance from './Performance.util';


const BASE_COUNT = 50000;
const MIX_COUNT = 100;
const UNIT_TIME = 1000000;

function recordPerformance(caseName: string, className: string, apiName: string, signature: string, dTime: long): void {
  recordPerformanceWithCount(caseName, className, apiName, signature, dTime, BASE_COUNT);
}

function recordPerformanceWithCount(caseName: string, className: string, apiName: string, signature: string, dTime: long, count: int): void {
  let arkTsAveragedTime = dTime.toDouble() * UNIT_TIME / count;
  console.info('arkTsPerformanceTest arkTsAveragedTime ' + caseName + ': ' + arkTsAveragedTime + 'ns');
  performance.apiWithClassAndKeywordTxt('std.core', className, apiName, signature, arkTsAveragedTime);
}

function getTestConstructor(): reflect.Constructor {
  return new reflect.Constructor();
}

function getAnotherTestConstructor(): reflect.Constructor {
  return new reflect.Constructor();
}

function createTestArgs(): reflect.FixedArray<Any> {
  return new reflect.FixedArray<Any>(1);
}

export default function ReflectConstructorPerfTest(): void {
  describe('ReflectConstructorPerfTest', () => {
    let testConstructor: reflect.Constructor = getTestConstructor();
    let anotherConstructor: reflect.Constructor = getAnotherTestConstructor();
    let testArgs: reflect.FixedArray<Any> = createTestArgs();

    beforeEach(() => {
      let ret = GC.startGC(GC.Cause.FULL, true);
      GC.waitForFinishGC(ret);
      let ret1 = GC.startGC(GC.Cause.FULL, true);
      GC.waitForFinishGC(ret1);

      testConstructor = getTestConstructor();
      anotherConstructor = getAnotherTestConstructor();
      testArgs = createTestArgs();
    });

    afterAll(() => {
      performance.save('apiPerformance.txt');
    });

    it('PerformanceTest_Constructor_equals_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = false;
      let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          res = testConstructor.equals(anotherConstructor);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Constructor_equals_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Constructor', 'equals',
          'equals(other: Constructor): boolean', arkTsAveragedTime);
      });

    it('PerformanceTest_Constructor_createInstance_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let result: Any = null;
        let Stime = new Date().getTime();

        for (let i = 0; i < MIX_COUNT; i++) {
          result = testConstructor.createInstance(testArgs);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / MIX_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Constructor_createInstance_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Constructor', 'createInstance',
          'createInstance(args?: FixedArray<Any>): Any', arkTsAveragedTime);
      });
  });
}
