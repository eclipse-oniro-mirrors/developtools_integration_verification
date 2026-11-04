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
export default function JSRuntimePerfTest04(): void {
  describe('JSRuntimePerfTest04', () => {
    const BASE_COUNT = 500000;
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

    // ================================================================
    // 1. JSRuntime - invoke (1) - _17400
    // ================================================================

    it('PerformanceTest_JSRuntime_invoke_17400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let obj = JSRuntime.createObject();
      JSRuntime.setPropertyDouble(obj, "value", 42.0);
      let func = JSRuntime.getPropertyObject(obj, "toString");
      let result: Any = JSRuntime.invoke(obj, func);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = JSRuntime.invoke(obj, func);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest JSRuntime invoke: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'invoke',
        'static invoke(recv: Any, func: Any, ...args: FixedArray<Any>): Any', arkTsAveragedTime);
    })

    // ================================================================
    // 2. JSRuntime - invokeDynamicFunction (1) - _17500
    // ================================================================

    it('PerformanceTest_JSRuntime_invokeDynamicFunction_17500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let func = new DynamicFunction();
      let args: FixedArray<Any> = new FixedArray<Any>(0, undefined);
      let result: Any = JSRuntime.invokeDynamicFunction(func, args);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = JSRuntime.invokeDynamicFunction(func, args);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest JSRuntime invokeDynamicFunction: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'invokeDynamicFunction',
        'static native invokeDynamicFunction(func: Object, args: FixedArray<Any>): Any', arkTsAveragedTime);
    })

    // ================================================================
    // 3. JSRuntime - instantiate (1) - _17600
    // ================================================================

    it('PerformanceTest_JSRuntime_instantiate_17600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let global = JSRuntime.getGlobal();
      let objConstructor = JSRuntime.getPropertyObject(global, "Object");
      let result: Any = JSRuntime.instantiate(objConstructor);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = JSRuntime.instantiate(objConstructor);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest JSRuntime instantiate: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'instantiate',
        'static instantiate(callable: Any, ...args: FixedArray<Any>): Any', arkTsAveragedTime);
    })

    // ================================================================
    // 4. JSRuntime - CreateIterator (1) - _17700
    // ================================================================

    it('PerformanceTest_JSRuntime_CreateIterator_17700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = JSRuntime.createArray() as JSValue;
      let result: MimicJSValueIteratableIterator = JSRuntime.CreateIterator(arr);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = JSRuntime.CreateIterator(arr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest JSRuntime CreateIterator: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'JSRuntime', 'CreateIterator',
        'static CreateIterator(val: JSValue): MimicJSValueIteratableIterator', arkTsAveragedTime);
    })

    // ================================================================
    // 5. MimicJSValueIteratableIterator - next (1) - _17800
    // ================================================================

    it('PerformanceTest_MimicJSValueIteratableIterator_next_17800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = JSRuntime.createArray() as JSValue;
      JSRuntime.setElementDouble(arr, 0, 1.0);
      let iterator: MimicJSValueIteratableIterator = JSRuntime.CreateIterator(arr);
      let result: IteratorResult<Any> = iterator.next();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = iterator.next();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest MimicJSValueIteratableIterator next: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'MimicJSValueIteratableIterator', 'next',
        'next(): IteratorResult<Any>', arkTsAveragedTime);
    })
  })
}
