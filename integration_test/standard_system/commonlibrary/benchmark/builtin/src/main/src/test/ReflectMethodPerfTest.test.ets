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
  public simpleMethod(): int {
    return this.instanceField;
  }
  public methodWithParams(a: int, b: string, c: boolean): string {
    return b + a.toString();
  }
}

function getInstanceMethod(name: string): reflect.InstanceMethod | undefined {
  let cls = Class.from<TestClass>();
  return cls.getInstanceMethod(name);
}

export default function ReflectMethodPerfTest(): void {
  describe('ReflectMethodPerfTest', () => {
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

    // ========== isNative(): boolean ==========
    it('PerformanceTest_ReflectMethod_isNative_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let method = getInstanceMethod("simpleMethod");
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = method!.isNative();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReflectMethod_isNative_0100: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core.reflect', 'Method', 'isNative',
        'isNative(): boolean', arkTsAveragedTime);
    })

    // ========== isPublic(): boolean ==========
    it('PerformanceTest_ReflectMethod_isPublic_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let method = getInstanceMethod("simpleMethod");
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = method!.isPublic();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReflectMethod_isPublic_0200: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core.reflect', 'Method', 'isPublic',
        'isPublic(): boolean', arkTsAveragedTime);
    })

    // ========== isPrivate(): boolean ==========
    it('PerformanceTest_ReflectMethod_isPrivate_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let method = getInstanceMethod("simpleMethod");
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = method!.isPrivate();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReflectMethod_isPrivate_0300: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core.reflect', 'Method', 'isPrivate',
        'isPrivate(): boolean', arkTsAveragedTime);
    })

    // ========== isProtected(): boolean ==========
    it('PerformanceTest_ReflectMethod_isProtected_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let method = getInstanceMethod("simpleMethod");
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = method!.isProtected();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReflectMethod_isProtected_0400: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core.reflect', 'Method', 'isProtected',
        'isProtected(): boolean', arkTsAveragedTime);
    })

    // ========== getName(): string ==========
    it('PerformanceTest_ReflectMethod_getName_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let method = getInstanceMethod("simpleMethod");
      let res: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = method!.getName();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReflectMethod_getName_0500: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core.reflect', 'Method', 'getName',
        'getName(): string', arkTsAveragedTime);
    })

    // ========== getOwner(): Class ==========
    it('PerformanceTest_ReflectMethod_getOwner_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let method = getInstanceMethod("simpleMethod");
      let res: Class = method!.getOwner();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = method!.getOwner();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReflectMethod_getOwner_0600: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core.reflect', 'Method', 'getOwner',
        'getOwner(): Class', arkTsAveragedTime);
    })

    // ========== getReturnType(): Class ==========
    it('PerformanceTest_ReflectMethod_getReturnType_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let method = getInstanceMethod("simpleMethod");
      let res: Class = method!.getReturnType();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = method!.getReturnType();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReflectMethod_getReturnType_0700: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core.reflect', 'Method', 'getReturnType',
        'getReturnType(): Class', arkTsAveragedTime);
    })

    // ========== getParameterTypes(): FixedArray<Class> ==========
    it('PerformanceTest_ReflectMethod_getParameterTypes_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let method = getInstanceMethod("methodWithParams");
      let res: FixedArray<Class> = method!.getParameterTypes();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = method!.getParameterTypes();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReflectMethod_getParameterTypes_0800: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core.reflect', 'Method', 'getParameterTypes',
        'getParameterTypes(): FixedArray<Class>', arkTsAveragedTime);
    })

    // ========== getParameterType(idx: int): Class | undefined ==========
    it('PerformanceTest_ReflectMethod_getParameterType_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let method = getInstanceMethod("methodWithParams");
      let res: Class | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = method!.getParameterType(0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReflectMethod_getParameterType_0900: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core.reflect', 'Method', 'getParameterType',
        'getParameterType(idx: int): Class | undefined', arkTsAveragedTime);
    })

    // ========== getParametersNum(): int ==========
    it('PerformanceTest_ReflectMethod_getParametersNum_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let method = getInstanceMethod("methodWithParams");
      let res: int = -1;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = method!.getParametersNum();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReflectMethod_getParametersNum_1000: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core.reflect', 'Method', 'getParametersNum',
        'getParametersNum(): int', arkTsAveragedTime);
    })

  })
}
