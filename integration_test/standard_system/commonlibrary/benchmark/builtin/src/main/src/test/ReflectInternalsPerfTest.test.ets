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

export default function ReflectInternalsPerfTest():void {
  describe('ReflectInternalsPerfTest', () => {
    // 毫秒 * 1000 = 微秒 毫秒 * 1000000 = 纳秒
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

    it('PerformanceTest_ReflectInternals_Types_identity_cast_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr = [1, 2, 3];
      let result = reflect.internals.Types.identity_cast(arr);
      let Stime = new Date().getTime();

      for (let i = 0; i < BASE_COUNT; i++) {
        result = reflect.internals.Types.identity_cast(arr);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReflectInternals_Types_identity_cast_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core.reflect.internals', 'Types', 'identity_cast',
        'identity_cast<T>(array: ArrayLike<T>): ArrayLike<T>', arkTsAveragedTime);
    });

    it('PerformanceTest_ReflectInternals_Types_isNumericType_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let type = Class.from<Int>();
      let result = reflect.internals.Types.isNumericType(type);
      let Stime = new Date().getTime();

      for (let i = 0; i < BASE_COUNT; i++) {
        result = reflect.internals.Types.isNumericType(type);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReflectInternals_Types_isNumericType_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core.reflect.internals', 'Types', 'isNumericType',
        'isNumericType(type: Class): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_ReflectInternals_Types_asFixedArray_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let obj: object = new FixedArray<Object>(1, new Object());
      let result = reflect.internals.Types.asFixedArray<number>(obj);
      let Stime = new Date().getTime();

      for (let i = 0; i < BASE_COUNT; i++) {
        result = reflect.internals.Types.asFixedArray<number>(obj);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReflectInternals_Types_asFixedArray_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core.reflect.internals', 'Types', 'asFixedArray',
        'asFixedArray<E>(obj: object): FixedArray<E>', arkTsAveragedTime);
    });

    it('PerformanceTest_ReflectInternals_Types_isAssignableFrom_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let t1 = Class.from<Int>();
      let t2 = Class.from<Long>();
      let result = reflect.internals.Types.isAssignableFrom(t1, t2);
      let Stime = new Date().getTime();

      for (let i = 0; i < BASE_COUNT; i++) {
        result = reflect.internals.Types.isAssignableFrom(t1, t2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReflectInternals_Types_isAssignableFrom_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core.reflect.internals', 'Types', 'isAssignableFrom',
        'isAssignableFrom(lhsType: Class, rhsType: Class): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_ReflectInternals_Types_isDoubleType_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let type = Class.from<Double>();
      let result = reflect.internals.Types.isDoubleType(type);
      let Stime = new Date().getTime();

      for (let i = 0; i < BASE_COUNT; i++) {
        result = reflect.internals.Types.isDoubleType(type);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReflectInternals_Types_isDoubleType_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core.reflect.internals', 'Types', 'isDoubleType',
        'isDoubleType(type: Class): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_ReflectInternals_Types_isBooleanType_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let type = Class.from<Boolean>();
      let result = reflect.internals.Types.isBooleanType(type);
      let Stime = new Date().getTime();

      for (let i = 0; i < BASE_COUNT; i++) {
        result = reflect.internals.Types.isBooleanType(type);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReflectInternals_Types_isBooleanType_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core.reflect.internals', 'Types', 'isBooleanType',
        'isBooleanType(type: Class): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_ReflectInternals_Types_isIntType_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let type = Class.from<Int>();
      let result = reflect.internals.Types.isIntType(type);
      let Stime = new Date().getTime();

      for (let i = 0; i < BASE_COUNT; i++) {
        result = reflect.internals.Types.isIntType(type);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReflectInternals_Types_isIntType_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core.reflect.internals', 'Types', 'isIntType',
        'isIntType(type: Class): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_ReflectInternals_Types_isLongType_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let type = Class.from<Long>();
      let result = reflect.internals.Types.isLongType(type);
      let Stime = new Date().getTime();

      for (let i = 0; i < BASE_COUNT; i++) {
        result = reflect.internals.Types.isLongType(type);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReflectInternals_Types_isLongType_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core.reflect.internals', 'Types', 'isLongType',
        'isLongType(type: Class): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_ReflectInternals_Types_isByteType_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let type = Class.from<Byte>();
      let result = reflect.internals.Types.isByteType(type);
      let Stime = new Date().getTime();

      for (let i = 0; i < BASE_COUNT; i++) {
        result = reflect.internals.Types.isByteType(type);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReflectInternals_Types_isByteType_0900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core.reflect.internals', 'Types', 'isByteType',
        'isByteType(type: Class): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_ReflectInternals_Types_isShortType_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let type = Class.from<Short>();
      let result = reflect.internals.Types.isShortType(type);
      let Stime = new Date().getTime();

      for (let i = 0; i < BASE_COUNT; i++) {
        result = reflect.internals.Types.isShortType(type);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReflectInternals_Types_isShortType_1000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core.reflect.internals', 'Types', 'isShortType',
        'isShortType(type: Class): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_ReflectInternals_Types_isFloatType_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let type = Class.from<Float>();
      let result = reflect.internals.Types.isFloatType(type);
      let Stime = new Date().getTime();

      for (let i = 0; i < BASE_COUNT; i++) {
        result = reflect.internals.Types.isFloatType(type);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReflectInternals_Types_isFloatType_1100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core.reflect.internals', 'Types', 'isFloatType',
        'isFloatType(type: Class): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_ReflectInternals_Types_isCharType_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let type = Class.from<Char>();
      let result = reflect.internals.Types.isCharType(type);
      let Stime = new Date().getTime();

      for (let i = 0; i < BASE_COUNT; i++) {
        result = reflect.internals.Types.isCharType(type);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReflectInternals_Types_isCharType_1200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core.reflect.internals', 'Types', 'isCharType',
        'isCharType(type: Class): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_ReflectInternals_Types_isPrimitiveType_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let type = Class.from<Int>();
      let result = reflect.internals.Types.isPrimitiveType(type);
      let Stime = new Date().getTime();

      for (let i = 0; i < BASE_COUNT; i++) {
        result = reflect.internals.Types.isPrimitiveType(type);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReflectInternals_Types_isPrimitiveType_1300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core.reflect.internals', 'Types', 'isPrimitiveType',
        'isPrimitiveType(type: Class): boolean', arkTsAveragedTime);
    });

    it('PerformanceTest_ReflectInternals_createFixedArray_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let type = Class.from<Int>();
      let result = reflect.internals.createFixedArray(type, 10);
      let Stime = new Date().getTime();

      for (let i = 0; i < BASE_COUNT; i++) {
        result = reflect.internals.createFixedArray(type, 10);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ReflectInternals_createFixedArray_1400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core.reflect.internals', 'reflect.internals', 'createFixedArray',
        'createFixedArray(component: Class, length: int): Object', arkTsAveragedTime);
    });

  })
}
