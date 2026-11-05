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
import performance from './Performance.util';
import { util } from '@kit.ArkTS';

export default function UtilPerfTest02(): void {
  describe('UtilPerfTest02', () => {
    const BASE_COUNT = 1000;
    beforeEach(() => {
      let ret = GC.startGC(GC.Cause.FULL, true);
      GC.waitForFinishGC(ret);
      let ret1 = GC.startGC(GC.Cause.FULL, true);
      GC.waitForFinishGC(ret1);
    });

    afterAll(() => {
      performance.save('apiPerformance.txt');
    });

    it('UtilPerfTest02_boolean_isArrayBufferView_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let type = new util.types();
      let res = type.isArrayBufferView(new Int8Array([]));

      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = type.isArrayBufferView(new Int8Array([]));
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;

      console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isArrayBufferView_0100: ' + arkTsAveragedTime + 'ns');

      performance.apiWithClassAndKeywordTxt('std.util', 'util', 'isArrayBufferView',
        'isArrayBufferView(value: Object): boolean', arkTsAveragedTime);
    });

    it('UtilPerfTest02_boolean_isArrayBuffer_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let type = new util.types();
      let res = type.isArrayBuffer(new ArrayBuffer(0));

      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = type.isArrayBuffer(new ArrayBuffer(0));
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;

      console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isArrayBuffer_0200: ' + arkTsAveragedTime + 'ns');

      performance.apiWithClassAndKeywordTxt('std.util', 'util', 'isArrayBuffer',
        'isArrayBuffer(value: Object): boolean', arkTsAveragedTime);
    });

    it('UtilPerfTest02_boolean_isAsyncFunction_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let type = new util.types();
      let res = type.isAsyncFunction(async () => {});

      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = type.isAsyncFunction(async () => {});
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;

      console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isAsyncFunction_0300: ' + arkTsAveragedTime + 'ns');

      performance.apiWithClassAndKeywordTxt('std.util', 'util', 'isAsyncFunction',
        'isAsyncFunction(value: Object): boolean', arkTsAveragedTime);
    });

    it('UtilPerfTest02_boolean_isDataView_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let type = new util.types();
      const ab = new ArrayBuffer(20);
      let res = type.isDataView(new DataView(ab));

      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = type.isDataView(new DataView(new ArrayBuffer(20)));
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;

      console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isDataView_0400: ' + arkTsAveragedTime + 'ns');

      performance.apiWithClassAndKeywordTxt('std.util', 'util', 'isDataView',
        'isDataView(value: Object): boolean', arkTsAveragedTime);
    });

    it('UtilPerfTest02_boolean_isDate_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let type = new util.types();
      let res = type.isDate(new Date());

      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = type.isDate(new Date());
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;

      console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isDate_0500: ' + arkTsAveragedTime + 'ns');

      performance.apiWithClassAndKeywordTxt('std.util', 'util', 'isDate',
        'isDate(value: Object): boolean', arkTsAveragedTime);
    });

    it('UtilPerfTest02_boolean_isFloat32Array_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let type = new util.types();
      let res = type.isFloat32Array(new Float32Array());

      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = type.isFloat32Array(new Float32Array());
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;

      console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isFloat32Array_0600: ' + arkTsAveragedTime + 'ns');

      performance.apiWithClassAndKeywordTxt('std.util', 'util', 'isFloat32Array',
        'isFloat32Array(value: Object): boolean', arkTsAveragedTime);
    });

    it('UtilPerfTest02_boolean_isFloat64Array_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let type = new util.types();
      let res = type.isFloat64Array(new Float64Array());

      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = type.isFloat64Array(new Float64Array());
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;

      console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isFloat64Array_0700: ' + arkTsAveragedTime + 'ns');

      performance.apiWithClassAndKeywordTxt('std.util', 'util', 'isFloat64Array',
        'isFloat64Array(value: Object): boolean', arkTsAveragedTime);
    });

    it('UtilPerfTest02_boolean_isInt8Array_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let type = new util.types();
      let res = type.isInt8Array(new Int8Array([]));

      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = type.isInt8Array(new Int8Array([]));
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;

      console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isInt8Array_0800: ' + arkTsAveragedTime + 'ns');

      performance.apiWithClassAndKeywordTxt('std.util', 'util', 'isInt8Array',
        'isInt8Array(value: Object): boolean', arkTsAveragedTime);
    });

    it('UtilPerfTest02_boolean_isInt16Array_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let type = new util.types();
      let res = type.isInt16Array(new Int16Array([]));

      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = type.isInt16Array(new Int16Array([]));
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;

      console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isInt16Array_0900: ' + arkTsAveragedTime + 'ns');

      performance.apiWithClassAndKeywordTxt('std.util', 'util', 'isInt16Array',
        'isInt16Array(value: Object): boolean', arkTsAveragedTime);
    });

    it('UtilPerfTest02_boolean_isInt32Array_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let type = new util.types();
      let res = type.isInt32Array(new Int32Array([]));

      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = type.isInt32Array(new Int32Array([]));
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;

      console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isInt32Array_1000: ' + arkTsAveragedTime + 'ns');

      performance.apiWithClassAndKeywordTxt('std.util', 'util', 'isInt32Array',
        'isInt32Array(value: Object): boolean', arkTsAveragedTime);
    });

    it('UtilPerfTest02_boolean_isMap_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let type = new util.types();
      let testMap = new Map<string, number>();
      let res = type.isMap(testMap);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = type.isMap(testMap);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;

      console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isMap_1100: ' + arkTsAveragedTime + 'ns');

      performance.apiWithClassAndKeywordTxt('std.util', 'util', 'isMap',
        'isMap(value: Object): boolean', arkTsAveragedTime);
    });

    it('UtilPerfTest02_boolean_isMapIterator_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let type = new util.types();
      const map: Map<int, int> = new Map<int, int>();
      let iterator = map.keys();
      let res = type.isMapIterator(iterator);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = type.isMapIterator(map.keys());
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;

      console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isMapIterator_1200: ' + arkTsAveragedTime + 'ns');

      performance.apiWithClassAndKeywordTxt('std.util', 'util', 'isMapIterator',
        'isMapIterator(value: Object): boolean', arkTsAveragedTime);
    });

    it('UtilPerfTest02_boolean_isNativeError_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let type = new util.types();
      let res = type.isNativeError(new TypeError());

      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = type.isNativeError(new TypeError());
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;

      console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isNativeError_1300: ' + arkTsAveragedTime + 'ns');

      performance.apiWithClassAndKeywordTxt('std.util', 'util', 'isNativeError',
        'isNativeError(value: Object): boolean', arkTsAveragedTime);
    });

    it('UtilPerfTest02_boolean_isPromise_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let type = new util.types();
      let res = type.isPromise(Promise.resolve(1));

      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = type.isPromise(Promise.resolve(1));
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;

      console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isPromise_1400: ' + arkTsAveragedTime + 'ns');

      performance.apiWithClassAndKeywordTxt('std.util', 'util', 'isPromise',
        'isPromise(value: Object): boolean', arkTsAveragedTime);
    });

    it('UtilPerfTest02_boolean_isRegExp_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let type = new util.types();
      let res = type.isRegExp(new RegExp('abc'));

      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = type.isRegExp(new RegExp('abc'));
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;

      console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isRegExp_1500: ' + arkTsAveragedTime + 'ns');

      performance.apiWithClassAndKeywordTxt('std.util', 'util', 'isRegExp',
        'isRegExp(value: Object): boolean', arkTsAveragedTime);
    });

    it('UtilPerfTest02_boolean_isSet_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let type = new util.types();
      let set: Set<int> = new Set<int>();
      let res = type.isSet(set);

      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = type.isSet(set);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;

      console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isSet_1600: ' + arkTsAveragedTime + 'ns');

      performance.apiWithClassAndKeywordTxt('std.util', 'util', 'isSet',
        'isSet(value: Object): boolean', arkTsAveragedTime);
    });

    it('UtilPerfTest02_boolean_isSetIterator_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let type = new util.types();
      const set: Set<int> = new Set<int>();
      let iterator = set.keys();
      let res = type.isSetIterator(iterator);

      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = type.isSetIterator(set.keys());
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;

      console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isSetIterator_1700: ' + arkTsAveragedTime + 'ns');

      performance.apiWithClassAndKeywordTxt('std.util', 'util', 'isSetIterator',
        'isSetIterator(value: Object): boolean', arkTsAveragedTime);
    });

    it('UtilPerfTest02_boolean_isTypedArray_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let type = new util.types();
      let res = type.isTypedArray(new Float64Array([]));

      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = type.isTypedArray(new Float64Array([]));
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;

      console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isTypedArray_1800: ' + arkTsAveragedTime + 'ns');

      performance.apiWithClassAndKeywordTxt('std.util', 'util', 'isTypedArray',
        'isTypedArray(value: Object): boolean', arkTsAveragedTime);
    });

    it('UtilPerfTest02_boolean_isUint8Array_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let type = new util.types();
      let res = type.isUint8Array(new Uint8Array([]));

      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = type.isUint8Array(new Uint8Array([]));
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;

      console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isUint8Array_1900: ' + arkTsAveragedTime + 'ns');

      performance.apiWithClassAndKeywordTxt('std.util', 'util', 'isUint8Array',
        'isUint8Array(value: Object): boolean', arkTsAveragedTime);
    });

    it('UtilPerfTest02_boolean_isUint8ClampedArray_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let type = new util.types();
      let res = type.isUint8ClampedArray(new Uint8ClampedArray([]));

      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = type.isUint8ClampedArray(new Uint8ClampedArray([]));
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;

      console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isUint8ClampedArray_2000: ' + arkTsAveragedTime + 'ns');

      performance.apiWithClassAndKeywordTxt('std.util', 'util', 'isUint8ClampedArray',
        'isUint8ClampedArray(value: Object): boolean', arkTsAveragedTime);
    });

    it('UtilPerfTest02_boolean_isUint16Array_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let type = new util.types();
      let res = type.isUint16Array(new Uint16Array([]));

      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = type.isUint16Array(new Uint16Array([]));
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;

      console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isUint16Array_2100: ' + arkTsAveragedTime + 'ns');

      performance.apiWithClassAndKeywordTxt('std.util', 'util', 'isUint16Array',
        'isUint16Array(value: Object): boolean', arkTsAveragedTime);
    });

    it('UtilPerfTest02_boolean_isUint32Array_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let type = new util.types();
      let res = type.isUint32Array(new Uint32Array([]));

      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = type.isUint32Array(new Uint32Array([]));
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;

      console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isUint32Array_2200: ' + arkTsAveragedTime + 'ns');

      performance.apiWithClassAndKeywordTxt('std.util', 'util', 'isUint32Array',
        'isUint32Array(value: Object): boolean', arkTsAveragedTime);
    });

    it('UtilPerfTest02_boolean_isWeakMap_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let type = new util.types();
      let value: WeakMap<object, number> = new WeakMap<object, number>();
      let res = type.isWeakMap(value);

      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = type.isWeakMap(value);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;

      console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isWeakMap_2300: ' + arkTsAveragedTime + 'ns');

      performance.apiWithClassAndKeywordTxt('std.util', 'util', 'isWeakMap',
        'isWeakMap(value: Object): boolean', arkTsAveragedTime);
    });

    it('UtilPerfTest02_boolean_isWeakSet_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let type = new util.types();
      let weakSet: WeakSet<object> = new WeakSet<object>();
      let res = type.isWeakSet(weakSet);

      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = type.isWeakSet(weakSet);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;

      console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isWeakSet_2400: ' + arkTsAveragedTime + 'ns');

      performance.apiWithClassAndKeywordTxt('std.util', 'util', 'isWeakSet',
        'isWeakSet(value: Object): boolean', arkTsAveragedTime);
    });

    it('UtilPerfTest02_boolean_isBigInt64Array_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let type = new util.types();
      let res = type.isBigInt64Array(new BigInt64Array([]));

      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = type.isBigInt64Array(new BigInt64Array([]));
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;

      console.info('arkTsUtilPerfTest02 arkTsAveragedTime UtilPerfTest02_boolean_isBigInt64Array_2500: ' + arkTsAveragedTime + 'ns');

      performance.apiWithClassAndKeywordTxt('std.util', 'util', 'isBigInt64Array',
        'isBigInt64Array(value: Object): boolean', arkTsAveragedTime);
    });
  });
}