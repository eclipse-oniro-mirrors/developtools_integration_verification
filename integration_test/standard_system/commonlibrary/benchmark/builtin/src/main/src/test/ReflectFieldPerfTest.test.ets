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

class TestClass {
  public instanceField: int = 42;
  public readonly readonlyField: int = 100;
}

function getField(name: string): reflect.InstanceField | undefined {
  let cls = Class.from<TestClass>();
  return cls.getInstanceField(name);
}

export default function ReflectFieldPerfTest(): void {
  describe('ReflectFieldPerfTest', () => {
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

    // Test isReadonly method (writable field)
    it('PerformanceTest_ReflectField_isReadonly_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let field = getField("instanceField");
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = field!.isReadonly();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReflectField_isReadonly_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core.reflect', 'Field', 'isReadonly',
        'isReadonly(): boolean', arkTsAveragedTime);
    })

    // Test isPublic method
    it('PerformanceTest_ReflectField_isPublic_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let field = getField("instanceField");
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = field!.isPublic();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReflectField_isPublic_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core.reflect', 'Field', 'isPublic',
        'isPublic(): boolean', arkTsAveragedTime);
    })

    // Test isPrivate method
    it('PerformanceTest_ReflectField_isPrivate_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let field = getField("instanceField");
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = field!.isPrivate();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReflectField_isPrivate_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core.reflect', 'Field', 'isPrivate',
        'isPrivate(): boolean', arkTsAveragedTime);
    })

    // Test isProtected method
    it('PerformanceTest_ReflectField_isProtected_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let field = getField("instanceField");
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = field!.isProtected();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReflectField_isProtected_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core.reflect', 'Field', 'isProtected',
        'isProtected(): boolean', arkTsAveragedTime);
    })

    // Test getType method
    it('PerformanceTest_ReflectField_getType_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let field = getField("instanceField");
      let res: Class = field!.getType();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = field!.getType();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReflectField_getType_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core.reflect', 'Field', 'getType',
        'getType(): Class', arkTsAveragedTime);
    })

    // Test getOwner method
    it('PerformanceTest_ReflectField_getOwner_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let field = getField("instanceField");
      let res: Class = field!.getOwner();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = field!.getOwner();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReflectField_getOwner_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core.reflect', 'Field', 'getOwner',
        'getOwner(): Class', arkTsAveragedTime);
    })

    // Test getName method
    it('PerformanceTest_ReflectField_getName_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let field = getField("instanceField");
      let res: string = field!.getName();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = field!.getName();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReflectField_getName_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core.reflect', 'Field', 'getName',
        'getName(): string', arkTsAveragedTime);
    })

  })
}
