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
  beforeEach,
  afterAll
} from "../../../hypium/index";
import performance from './Performance.util';


class GCTestObj {
  value: int = 42
}

export default function GCPerfTest(): void {
  describe('GCPerfTest', () => {
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

    it('PerformanceTest_GC_GetFreeHeapSize_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: long = GC.getFreeHeapSize();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = GC.getFreeHeapSize();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_GC_GetFreeHeapSize_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'GC', 'getFreeHeapSize',
        'getFreeHeapSize(): long', arkTsAveragedTime);
    })

    it('PerformanceTest_GC_GetUsedHeapSize_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: long = GC.getUsedHeapSize();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = GC.getUsedHeapSize();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_GC_GetUsedHeapSize_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'GC', 'getUsedHeapSize',
        'getUsedHeapSize(): long', arkTsAveragedTime);
    })

    it('PerformanceTest_GC_GetReservedHeapSize_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: long = GC.getReservedHeapSize();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = GC.getReservedHeapSize();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_GC_GetReservedHeapSize_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'GC', 'getReservedHeapSize',
        'getReservedHeapSize(): long', arkTsAveragedTime);
    })

    it('PerformanceTest_GC_GetObjectSize_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let obj = new GCTestObj();
      let res: long = GC.getObjectSize(obj);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = GC.getObjectSize(obj);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_GC_GetObjectSize_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'GC', 'getObjectSize',
        'getObjectSize(obj: Object): long', arkTsAveragedTime);
    })

    it('PerformanceTest_GC_GetObjectAddress_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let obj = new GCTestObj();
      let res: long = GC.getObjectAddress(obj);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = GC.getObjectAddress(obj);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_GC_GetObjectAddress_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'GC', 'getObjectAddress',
        'getObjectAddress(obj: Object): long', arkTsAveragedTime);
    })

    it('PerformanceTest_GC_PinObject_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let obj = new GCTestObj();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        GC.pinObject(obj);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = obj;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_GC_PinObject_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'GC', 'pinObject',
        'pinObject(obj: Object): void', arkTsAveragedTime);
    })

    //并发格式不规范
    // it('PerformanceTest_GC_UnpinObject_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let objArray = new Array<GCTestObj>();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     let obj = new GCTestObj();
    //     GC.pinObject(obj);
    //     objArray.push(obj);
    //   }
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     GC.unpinObject(objArray[i]);
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = objArray[0];
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_GC_UnpinObject_0700: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.core', 'GC', 'unpinObject',
    //     'unpinObject(obj: Object): void', arkTsAveragedTime);
    // })

    // it('PerformanceTest_GC_AllocatePinnedIntArray_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let arr: ValueArray<int> | undefined = undefined;
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     arr = GC.allocatePinnedIntArray(1024);
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = arr;
    //   if (arr !== undefined) {
    //     GC.unpinObject(arr);
    //   }
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_GC_AllocatePinnedIntArray_0800: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.core', 'GC', 'allocatePinnedIntArray',
    //     'allocatePinnedIntArray(length: long): FixedArray<int>', arkTsAveragedTime);
    // })

    it('PerformanceTest_GC_GetObjectSpaceType_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let obj = new GCTestObj();
      let res: GC.ObjectSpaceType = GC.getObjectSpaceType(obj);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = GC.getObjectSpaceType(obj);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_GC_GetObjectSpaceType_0900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'GC', 'getObjectSpaceType',
        'getObjectSpaceType(obj: Object): ObjectSpaceType', arkTsAveragedTime);
    })

    it('PerformanceTest_GC_IsScheduledGCTriggered_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: boolean = GC.isScheduledGCTriggered();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = GC.isScheduledGCTriggered();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_GC_IsScheduledGCTriggered_1000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'GC', 'isScheduledGCTriggered',
        'isScheduledGCTriggered(): boolean', arkTsAveragedTime);
    })

    // it('PerformanceTest_GC_WaitForFinishGC_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let gcId = GC.startGC(GC.Cause.YOUNG);
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //       GC.waitForFinishGC(gcId);
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = gcId;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_GC_WaitForFinishGC_1100: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.core', 'GC', 'waitForFinishGC',
    //     'waitForFinishGC(gcId: long): void', arkTsAveragedTime);
    // })

    // scheduleGcAfterNthAlloc 在当前 VM 上不支持（unsupported GC trigger），暂时注释
    // it('PerformanceTest_GC_ScheduleGcAfterNthAlloc_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     GC.scheduleGcAfterNthAlloc(1000, GC.Cause.YOUNG);
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = GC.Cause.YOUNG;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_GC_ScheduleGcAfterNthAlloc_1200: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.core', 'GC', 'scheduleGcAfterNthAlloc',
    //     'scheduleGcAfterNthAlloc(counter: int, cause: Cause): void', arkTsAveragedTime);
    // })

    // postponeGCStart 与 postponeGCEnd 必须每轮迭代成对调用，无法独立在循环体中测试单个 API
    // it('PerformanceTest_GC_PostponeGCStart_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     GC.postponeGCStart();
    //     GC.postponeGCEnd();
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = GC.Cause.YOUNG;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_GC_PostponeGCStart_1300: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.core', 'GC', 'postponeGCStart',
    //     'postponeGCStart(): void', arkTsAveragedTime);
    // })

    // 与 1300 循环体相同 — 两 API 不可分离，各自上报不同 API 名称以覆盖两个 API 的性能记录
    // it('PerformanceTest_GC_PostponeGCEnd_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     GC.postponeGCStart();
    //     GC.postponeGCEnd();
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = GC.Cause.YOUNG;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_GC_PostponeGCEnd_1400: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.core', 'GC', 'postponeGCEnd',
    //     'postponeGCEnd(): void', arkTsAveragedTime);
    // })

    // it('PerformanceTest_GC_AllocatePinnedBooleanArray_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let arr: ValueArray<boolean> | undefined = undefined;
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     arr = GC.allocatePinnedBooleanArray(1024);
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = arr;
    //   if (arr !== undefined) {
    //     GC.unpinObject(arr);
    //   }
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_GC_AllocatePinnedBooleanArray_1500: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.core', 'GC', 'allocatePinnedBooleanArray',
    //     'allocatePinnedBooleanArray(length: long): ValueArray<boolean>', arkTsAveragedTime);
    // })

    // it('PerformanceTest_GC_AllocatePinnedByteArray_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let arr: ValueArray<byte> | undefined = undefined;
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     arr = GC.allocatePinnedByteArray(1024);
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = arr;
    //   if (arr !== undefined) {
    //     GC.unpinObject(arr);
    //   }
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_GC_AllocatePinnedByteArray_1600: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.core', 'GC', 'allocatePinnedByteArray',
    //     'allocatePinnedByteArray(length: long): ValueArray<byte>', arkTsAveragedTime);
    // })

    // it('PerformanceTest_GC_AllocatePinnedCharArray_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let arr: ValueArray<char> | undefined = undefined;
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     arr = GC.allocatePinnedCharArray(1024);
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = arr;
    //   if (arr !== undefined) {
    //     GC.unpinObject(arr);
    //   }
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_GC_AllocatePinnedCharArray_1700: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.core', 'GC', 'allocatePinnedCharArray',
    //     'allocatePinnedCharArray(length: long): ValueArray<char>', arkTsAveragedTime);
    // })

    // it('PerformanceTest_GC_AllocatePinnedShortArray_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let arr: ValueArray<short> | undefined = undefined;
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     arr = GC.allocatePinnedShortArray(1024);
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = arr;
    //   if (arr !== undefined) {
    //     GC.unpinObject(arr);
    //   }
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_GC_AllocatePinnedShortArray_1800: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.core', 'GC', 'allocatePinnedShortArray',
    //     'allocatePinnedShortArray(length: long): ValueArray<short>', arkTsAveragedTime);
    // })

    // it('PerformanceTest_GC_AllocatePinnedLongArray_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let arr: ValueArray<long> | undefined = undefined;
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     arr = GC.allocatePinnedLongArray(1024);
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = arr;
    //   if (arr !== undefined) {
    //     GC.unpinObject(arr);
    //   }
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_GC_AllocatePinnedLongArray_1900: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.core', 'GC', 'allocatePinnedLongArray',
    //     'allocatePinnedLongArray(length: long): ValueArray<long>', arkTsAveragedTime);
    // })

    // it('PerformanceTest_GC_AllocatePinnedFloatArray_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let arr: ValueArray<float> | undefined = undefined;
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     arr = GC.allocatePinnedFloatArray(1024);
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = arr;
    //   if (arr !== undefined) {
    //     GC.unpinObject(arr);
    //   }
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_GC_AllocatePinnedFloatArray_2000: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.core', 'GC', 'allocatePinnedFloatArray',
    //     'allocatePinnedFloatArray(length: long): ValueArray<float>', arkTsAveragedTime);
    // })

    // it('PerformanceTest_GC_AllocatePinnedDoubleArray_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let arr: ValueArray<double> | undefined = undefined;
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     arr = GC.allocatePinnedDoubleArray(1024);
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = arr;
    //   if (arr !== undefined) {
    //     GC.unpinObject(arr);
    //   }
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_GC_AllocatePinnedDoubleArray_2100: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.core', 'GC', 'allocatePinnedDoubleArray',
    //     'allocatePinnedDoubleArray(length: long): ValueArray<double>', arkTsAveragedTime);
    // })

    // ========== startGC(cause: Cause, inPlaceMode: boolean = GC.NOT_IN_PLACE_MODE): long ==========
    it('PerformanceTest_GC_StartGC_woCallback_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: long = GC.startGC(GC.Cause.YOUNG);
      let prev: long = res;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        GC.waitForFinishGC(prev);
        res = GC.startGC(GC.Cause.YOUNG);
        prev = res;
      }
      GC.waitForFinishGC(prev);
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_GC_StartGC_woCallback_2200: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'GC', 'startGC',
        'startGC(cause: Cause, inPlaceMode: boolean = GC.NOT_IN_PLACE_MODE): long', arkTsAveragedTime);
    })

    // ========== startGC(cause: Cause, callback: () => void, inPlaceMode: boolean = GC.NOT_IN_PLACE_MODE): long ==========
    it('PerformanceTest_GC_StartGC_wCallback_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let callback: () => void = () => {};
      let res: long = GC.startGC(GC.Cause.YOUNG, callback);
      let prev: long = res;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        GC.waitForFinishGC(prev);
        res = GC.startGC(GC.Cause.YOUNG, callback);
        prev = res;
      }
      GC.waitForFinishGC(prev);
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_GC_StartGC_wCallback_2300: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'GC', 'startGC',
        'startGC(cause: Cause, callback: () => void, inPlaceMode: boolean = GC.NOT_IN_PLACE_MODE): long',
        arkTsAveragedTime);
    })

    // ========== registerNativeAllocation(size: long): void ==========
    // it('PerformanceTest_GC_RegisterNativeAllocation_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     GC.registerNativeAllocation(1024);
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = GC.Cause.YOUNG;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_GC_RegisterNativeAllocation_2400: '
    //     + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.core', 'GC', 'registerNativeAllocation',
    //     'registerNativeAllocation(size: long): void', arkTsAveragedTime);
    // })

    // ========== registerNativeFree(size: long): void ==========
    // it('PerformanceTest_GC_RegisterNativeFree_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     GC.registerNativeFree(1024);
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = GC.Cause.YOUNG;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_GC_RegisterNativeFree_2500: '
    //     + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.core', 'GC', 'registerNativeFree',
    //     'registerNativeFree(size: long): void', arkTsAveragedTime);
    // })

  })
}
