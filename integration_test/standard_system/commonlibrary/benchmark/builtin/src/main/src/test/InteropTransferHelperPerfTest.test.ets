/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
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

export default function InteropTransferHelperPerfTest(): void {
  describe('InteropTransferHelperPerfTest', () => {
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


    // Note: *ToStatic tests require dynamic type input which cannot be created in pure ArkTS
    // environment. Commented out to prevent runtime crashes.

    /*
    it('PerformanceTest_InteropTransferHelper_TransferArrayBufferToStatic_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mockData = new ArrayBuffer(8) as Object;
      let res: Any = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = InteropTransferHelper.transferArrayBufferToStatic(mockData);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InteropTransferHelper_TransferArrayBufferToStatic_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'InteropTransferHelper', 'transferArrayBufferToStatic',
        'transferArrayBufferToStatic(dynamicObject: Any): Object', arkTsAveragedTime);
    })
    */

    it('PerformanceTest_InteropTransferHelper_TransferArrayBufferToDynamic_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mockData = new ArrayBuffer(8) as Object;
      let res: Any = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = InteropTransferHelper.transferArrayBufferToDynamic(mockData);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InteropTransferHelper_TransferArrayBufferToDynamic_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'InteropTransferHelper', 'transferArrayBufferToDynamic',
        'transferArrayBufferToDynamic(staticObject: Object): Any', arkTsAveragedTime);
    })

    /*
    it('PerformanceTest_InteropTransferHelper_TransferInt8ArrayToStatic_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mockData = new Int8Array(8) as Object;
      let res: Any = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = InteropTransferHelper.transferInt8ArrayToStatic(mockData);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InteropTransferHelper_TransferInt8ArrayToStatic_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'InteropTransferHelper', 'transferInt8ArrayToStatic',
        'transferInt8ArrayToStatic(dynamicObject: Any): Object', arkTsAveragedTime);
    })
    */

    it('PerformanceTest_InteropTransferHelper_TransferInt8ArrayToDynamic_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mockData = new Int8Array(8) as Object;
      let res: Any = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = InteropTransferHelper.transferInt8ArrayToDynamic(mockData);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InteropTransferHelper_TransferInt8ArrayToDynamic_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'InteropTransferHelper', 'transferInt8ArrayToDynamic',
        'transferInt8ArrayToDynamic(staticObject: Object): Any', arkTsAveragedTime);
    })

    /*
    it('PerformanceTest_InteropTransferHelper_TransferUint8ArrayToStatic_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mockData = new Uint8Array(8) as Object;
      let res: Any = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = InteropTransferHelper.transferUint8ArrayToStatic(mockData);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InteropTransferHelper_TransferUint8ArrayToStatic_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'InteropTransferHelper', 'transferUint8ArrayToStatic',
        'transferUint8ArrayToStatic(dynamicObject: Any): Object', arkTsAveragedTime);
    })
    */

    it('PerformanceTest_InteropTransferHelper_TransferUint8ArrayToDynamic_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mockData = new Uint8Array(8) as Object;
      let res: Any = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = InteropTransferHelper.transferUint8ArrayToDynamic(mockData);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InteropTransferHelper_TransferUint8ArrayToDynamic_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'InteropTransferHelper', 'transferUint8ArrayToDynamic',
        'transferUint8ArrayToDynamic(staticObject: Object): Any', arkTsAveragedTime);
    })


    /*
    it('PerformanceTest_InteropTransferHelper_TransferUint8ClampedArrayToStatic_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mockData = new Uint8ClampedArray(8) as Object;
      let res: Any = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = InteropTransferHelper.transferUint8ClampedArrayToStatic(mockData);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InteropTransferHelper_TransferUint8ClampedArrayToStatic_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'InteropTransferHelper', 'transferUint8ClampedArrayToStatic',
        'transferUint8ClampedArrayToStatic(dynamicObject: Any): Object', arkTsAveragedTime);
    })
    */

    it('PerformanceTest_InteropTransferHelper_TransferUint8ClampedArrayToDynamic_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mockData = new Uint8ClampedArray(8) as Object;
      let res: Any = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = InteropTransferHelper.transferUint8ClampedArrayToDynamic(mockData);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InteropTransferHelper_TransferUint8ClampedArrayToDynamic_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'InteropTransferHelper', 'transferUint8ClampedArrayToDynamic',
        'transferUint8ClampedArrayToDynamic(staticObject: Object): Any', arkTsAveragedTime);
    })

    /*
    it('PerformanceTest_InteropTransferHelper_TransferInt16ArrayToStatic_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mockData = new Int16Array(8) as Object;
      let res: Any = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = InteropTransferHelper.transferInt16ArrayToStatic(mockData);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InteropTransferHelper_TransferInt16ArrayToStatic_0900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'InteropTransferHelper', 'transferInt16ArrayToStatic',
        'transferInt16ArrayToStatic(dynamicObject: Any): Object', arkTsAveragedTime);
    })
    */

    it('PerformanceTest_InteropTransferHelper_TransferInt16ArrayToDynamic_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mockData = new Int16Array(8) as Object;
      let res: Any = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = InteropTransferHelper.transferInt16ArrayToDynamic(mockData);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InteropTransferHelper_TransferInt16ArrayToDynamic_1000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'InteropTransferHelper', 'transferInt16ArrayToDynamic',
        'transferInt16ArrayToDynamic(staticObject: Object): Any', arkTsAveragedTime);
    })


    /*
    it('PerformanceTest_InteropTransferHelper_TransferUint16ArrayToStatic_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mockData = new Uint16Array(8) as Object;
      let res: Any = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = InteropTransferHelper.transferUint16ArrayToStatic(mockData);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InteropTransferHelper_TransferUint16ArrayToStatic_1100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'InteropTransferHelper', 'transferUint16ArrayToStatic',
        'transferUint16ArrayToStatic(dynamicObject: Any): Object', arkTsAveragedTime);
    })
    */

    it('PerformanceTest_InteropTransferHelper_TransferUint16ArrayToDynamic_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mockData = new Uint16Array(8) as Object;
      let res: Any = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = InteropTransferHelper.transferUint16ArrayToDynamic(mockData);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InteropTransferHelper_TransferUint16ArrayToDynamic_1200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'InteropTransferHelper', 'transferUint16ArrayToDynamic',
        'transferUint16ArrayToDynamic(staticObject: Object): Any', arkTsAveragedTime);
    })


    /*
    it('PerformanceTest_InteropTransferHelper_TransferInt32ArrayToStatic_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mockData = new Int32Array(8) as Object;
      let res: Any = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = InteropTransferHelper.transferInt32ArrayToStatic(mockData);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InteropTransferHelper_TransferInt32ArrayToStatic_1300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'InteropTransferHelper', 'transferInt32ArrayToStatic',
        'transferInt32ArrayToStatic(dynamicObject: Any): Object', arkTsAveragedTime);
    })
    */

    it('PerformanceTest_InteropTransferHelper_TransferInt32ArrayToDynamic_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mockData = new Int32Array(8) as Object;
      let res: Any = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = InteropTransferHelper.transferInt32ArrayToDynamic(mockData);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InteropTransferHelper_TransferInt32ArrayToDynamic_1400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'InteropTransferHelper', 'transferInt32ArrayToDynamic',
        'transferInt32ArrayToDynamic(staticObject: Object): Any', arkTsAveragedTime);
    })


    /*
    it('PerformanceTest_InteropTransferHelper_TransferUint32ArrayToStatic_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mockData = new Uint32Array(8) as Object;
      let res: Any = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = InteropTransferHelper.transferUint32ArrayToStatic(mockData);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InteropTransferHelper_TransferUint32ArrayToStatic_1500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'InteropTransferHelper', 'transferUint32ArrayToStatic',
        'transferUint32ArrayToStatic(dynamicObject: Any): Object', arkTsAveragedTime);
    })
    */

    it('PerformanceTest_InteropTransferHelper_TransferUint32ArrayToDynamic_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mockData = new Uint32Array(8) as Object;
      let res: Any = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = InteropTransferHelper.transferUint32ArrayToDynamic(mockData);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InteropTransferHelper_TransferUint32ArrayToDynamic_1600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'InteropTransferHelper', 'transferUint32ArrayToDynamic',
        'transferUint32ArrayToDynamic(staticObject: Object): Any', arkTsAveragedTime);
    })


    /*
    it('PerformanceTest_InteropTransferHelper_TransferFloat32ArrayToStatic_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mockData = new Float32Array(8) as Object;
      let res: Any = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = InteropTransferHelper.transferFloat32ArrayToStatic(mockData);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InteropTransferHelper_TransferFloat32ArrayToStatic_1700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'InteropTransferHelper', 'transferFloat32ArrayToStatic',
        'transferFloat32ArrayToStatic(dynamicObject: Any): Object', arkTsAveragedTime);
    })
    */

    it('PerformanceTest_InteropTransferHelper_TransferFloat32ArrayToDynamic_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mockData = new Float32Array(8) as Object;
      let res: Any = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = InteropTransferHelper.transferFloat32ArrayToDynamic(mockData);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InteropTransferHelper_TransferFloat32ArrayToDynamic_1800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'InteropTransferHelper', 'transferFloat32ArrayToDynamic',
        'transferFloat32ArrayToDynamic(staticObject: Object): Any', arkTsAveragedTime);
    })

    /*
    it('PerformanceTest_InteropTransferHelper_TransferFloat64ArrayToStatic_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mockData = new Float64Array(8) as Object;
      let res: Any = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = InteropTransferHelper.transferFloat64ArrayToStatic(mockData);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InteropTransferHelper_TransferFloat64ArrayToStatic_1900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'InteropTransferHelper', 'transferFloat64ArrayToStatic',
        'transferFloat64ArrayToStatic(dynamicObject: Any): Object', arkTsAveragedTime);
    })
    */

    it('PerformanceTest_InteropTransferHelper_TransferFloat64ArrayToDynamic_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mockData = new Float64Array(8) as Object;
      let res: Any = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = InteropTransferHelper.transferFloat64ArrayToDynamic(mockData);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InteropTransferHelper_TransferFloat64ArrayToDynamic_2000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'InteropTransferHelper', 'transferFloat64ArrayToDynamic',
        'transferFloat64ArrayToDynamic(staticObject: Object): Any', arkTsAveragedTime);
    })


    /*
    it('PerformanceTest_InteropTransferHelper_TransferBigInt64ArrayToStatic_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mockData = new BigInt64Array(8) as Object;
      let res: Any = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = InteropTransferHelper.transferBigInt64ArrayToStatic(mockData);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InteropTransferHelper_TransferBigInt64ArrayToStatic_2100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'InteropTransferHelper', 'transferBigInt64ArrayToStatic',
        'transferBigInt64ArrayToStatic(dynamicObject: Any): Object', arkTsAveragedTime);
    })
    */

    it('PerformanceTest_InteropTransferHelper_TransferBigInt64ArrayToDynamic_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mockData = new BigInt64Array(8) as Object;
      let res: Any = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = InteropTransferHelper.transferBigInt64ArrayToDynamic(mockData);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InteropTransferHelper_TransferBigInt64ArrayToDynamic_2200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'InteropTransferHelper', 'transferBigInt64ArrayToDynamic',
        'transferBigInt64ArrayToDynamic(staticObject: Object): Any', arkTsAveragedTime);
    })


    /*
    it('PerformanceTest_InteropTransferHelper_TransferBigUint64ArrayToStatic_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mockData = new BigUint64Array(8) as Object;
      let res: Any = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = InteropTransferHelper.transferBigUint64ArrayToStatic(mockData);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InteropTransferHelper_TransferBigUint64ArrayToStatic_2300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'InteropTransferHelper', 'transferBigUint64ArrayToStatic',
        'transferBigUint64ArrayToStatic(dynamicObject: Any): Object', arkTsAveragedTime);
    })
    */

    it('PerformanceTest_InteropTransferHelper_TransferBigUint64ArrayToDynamic_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mockData = new BigUint64Array(8) as Object;
      let res: Any = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = InteropTransferHelper.transferBigUint64ArrayToDynamic(mockData);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InteropTransferHelper_TransferBigUint64ArrayToDynamic_2400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'InteropTransferHelper', 'transferBigUint64ArrayToDynamic',
        'transferBigUint64ArrayToDynamic(staticObject: Object): Any', arkTsAveragedTime);
    })


    /*
    it('PerformanceTest_InteropTransferHelper_TransferDataViewToStatic_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mockData = new DataView(new ArrayBuffer(8)) as Object;
      let res: Any = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = InteropTransferHelper.transferDataViewToStatic(mockData);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InteropTransferHelper_TransferDataViewToStatic_2500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'InteropTransferHelper', 'transferDataViewToStatic',
        'transferDataViewToStatic(dynamicObject: Any): Object', arkTsAveragedTime);
    })
    */

    it('PerformanceTest_InteropTransferHelper_TransferDataViewToDynamic_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mockData = new DataView(new ArrayBuffer(8)) as Object;
      let res: Any = null;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = InteropTransferHelper.transferDataViewToDynamic(mockData);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InteropTransferHelper_TransferDataViewToDynamic_2600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.interop.js', 'InteropTransferHelper', 'transferDataViewToDynamic',
        'transferDataViewToDynamic(staticObject: Object): Any', arkTsAveragedTime);
    })

  })
}
