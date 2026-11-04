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
  beforeAll,
  afterAll,
  beforeEach,
  afterEach
} from "../../../hypium/index";
import performance from './Performance.util';


class TestRuntimeLinker extends RuntimeLinker {
  constructor() {
    super();
  }

  findAndLoadClass(clsName: string, init: boolean): Class | undefined {
    if (clsName === "TestClass") {
      return Class.from<TestClass>();
    }
    return undefined;
  }
}
class TestClass {
  constructor() {
  }
}

export default function RuntimeLinkerPerfTest(): void {
  describe('RuntimeLinkerPerfTest', () => {
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

    // Test RuntimeLinker subclass constructor
    it('PerformanceTest_RuntimeLinker_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: TestRuntimeLinker = new TestRuntimeLinker();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new TestRuntimeLinker();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RuntimeLinker_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'RuntimeLinker', 'constructor',
        'constructor()', arkTsAveragedTime);
    })

    // Test findLoadedClass method
    it('PerformanceTest_RuntimeLinker_findLoadedClass_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let linker = new TestRuntimeLinker();
      let res: Class | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = linker.findLoadedClass("TestClass");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RuntimeLinker_findLoadedClass_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'RuntimeLinker', 'findLoadedClass',
        'findLoadedClass(clsName: string): Class | undefined', arkTsAveragedTime);
    })

    // Test loadClass method
    it('PerformanceTest_RuntimeLinker_loadClass_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let linker = new TestRuntimeLinker();
        let res: Class | undefined = undefined;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++)
            res = linker.loadClass("TestClass", false);
        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RuntimeLinker_loadClass_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'RuntimeLinker', 'loadClass',
        'loadClass(clsName: string, init?: boolean): Class', arkTsAveragedTime);
        } catch (e) {
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RuntimeLinker_loadClass_0100: skip');
        }
    })

    // Test loadClassSafe method (protected, accessed via loadClass which uses it internally)
    // it('PerformanceTest_RuntimeLinker_loadClassSafe_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let linker = new TestRuntimeLinker();
    //   let res: Class | undefined = undefined;
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     res = linker.findLoadedClass("TestClass");
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = res;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RuntimeLinker_loadClassSafe_0100: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.core', 'RuntimeLinker', 'loadClassSafe',
    //     'findLoadedClass(clsName: string): Class | undefined', arkTsAveragedTime);
    // })

    // Test getType method
    it('PerformanceTest_RuntimeLinker_getType_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let linker = new TestRuntimeLinker();
      let res: Type | undefined = undefined;
      let td = new TypeDescriptor('std.core.String');
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = linker.getType(td);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_RuntimeLinker_getType_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'RuntimeLinker', 'getType',
        'getType(td: TypeDescriptor): Type | undefined', arkTsAveragedTime);
    })

  })
}
