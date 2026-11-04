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
  public getInstanceValue(): int { return this.instanceField; }
  public setInstanceValue(v: int): void { this.instanceField = v; }
}

function getInstanceMethod(name: string): reflect.InstanceMethod | undefined {
  let cls = Class.from<TestClass>();
  return cls.getInstanceMethod(name);
}

export default function ReflectInstanceMethodPerfTest(): void {
  describe('ReflectInstanceMethodPerfTest', () => {
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

    // Test isFinal method
    it('PerformanceTest_InstanceMethod_isFinal_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let method = getInstanceMethod("getInstanceValue");
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = method!.isFinal();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InstanceMethod_isFinal_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core.reflect', 'InstanceMethod', 'isFinal',
        'isFinal(): boolean', arkTsAveragedTime);
    })

    // Test isAsync method
    it('PerformanceTest_InstanceMethod_isAsync_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let method = getInstanceMethod("getInstanceValue");
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = method!.isAsync();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InstanceMethod_isAsync_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core.reflect', 'InstanceMethod', 'isAsync',
        'isAsync(): boolean', arkTsAveragedTime);
    })

    // Test isAbstract method
    it('PerformanceTest_InstanceMethod_isAbstract_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let method = getInstanceMethod("getInstanceValue");
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = method!.isAbstract();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InstanceMethod_isAbstract_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core.reflect', 'InstanceMethod', 'isAbstract',
        'isAbstract(): boolean', arkTsAveragedTime);
    })

    // Test isGetter method
    it('PerformanceTest_InstanceMethod_isGetter_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let method = getInstanceMethod("getInstanceValue");
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = method!.isGetter();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InstanceMethod_isGetter_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core.reflect', 'InstanceMethod', 'isGetter',
        'isGetter(): boolean', arkTsAveragedTime);
    })

    // Test isSetter method
    it('PerformanceTest_InstanceMethod_isSetter_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let method = getInstanceMethod("getInstanceValue");
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = method!.isSetter();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InstanceMethod_isSetter_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core.reflect', 'InstanceMethod', 'isSetter',
        'isSetter(): boolean', arkTsAveragedTime);
    })

    // Test equals method
    it('PerformanceTest_InstanceMethod_equals_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let method1 = getInstanceMethod("getInstanceValue");
      let method2 = getInstanceMethod("getInstanceValue");
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = method1!.equals(method2!);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InstanceMethod_equals_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core.reflect', 'InstanceMethod', 'equals',
        'equals(other: InstanceMethod): boolean', arkTsAveragedTime);
    })

    // Test invoke method (no args)
    it('PerformanceTest_InstanceMethod_invoke_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let method = getInstanceMethod("getInstanceValue");
      let obj = new TestClass();
      let res: Any = method!.invoke(obj);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = method!.invoke(obj);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InstanceMethod_invoke_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core.reflect', 'InstanceMethod', 'invoke',
        'invoke(thisObj: Object): Any', arkTsAveragedTime);
    })

    // Test invoke method (with args)
    it('PerformanceTest_InstanceMethod_invoke_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let method = getInstanceMethod("setInstanceValue");
      let obj = new TestClass();
      let args: FixedArray<Any> = [1 as Any];
      let res: Any | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = method!.invoke(obj, args);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InstanceMethod_invoke_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core.reflect', 'InstanceMethod', 'invoke',
        'invoke(thisObj: Object, args: FixedArray<Any>): Any', arkTsAveragedTime);
    })

  })
}
