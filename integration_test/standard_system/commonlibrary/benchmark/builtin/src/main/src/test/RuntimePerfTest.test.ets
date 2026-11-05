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

type RejectedObjectListener = StdProcess.RejectedObjectListener;

export default function RuntimePerfTest(): void {
  describe('RuntimePerfTest', () => {
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

    it('PerformanceTest_Runtime_getHashCode_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {

      let obj: Object = {};
      let b: number;

      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        b = Runtime.getHashCode(obj);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = b;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;

      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Runtime_getHashCode_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Runtime', 'getHashCode',
        'getHashCode(o: Object): int', arkTsAveragedTime);

    })

    it('PerformanceTest_Runtime_getHashCodeByValue_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let obj: Object = {};
      let b:number; //let b: void;  let b:

      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        b = Runtime.getHashCodeByValue(obj);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = b;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;

      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Runtime_getHashCodeByValue_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Runtime', 'getHashCodeByValue',
        'getHashCodeByValue(o: Object): long', arkTsAveragedTime);

    })

    it('PerformanceTest_Runtime_isLittleEndianPlatform_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {

      let b:boolean;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        b = Runtime.isLittleEndianPlatform();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = b;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;

      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Runtime_isLittleEndianPlatform_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Runtime', 'isLittleEndianPlatform',
        'isLittleEndianPlatform(): boolean', arkTsAveragedTime);

    })

    /*
    it('PerformanceTest_Runtime___getTypeInfo_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {

      let obj: Object = {};
      let b: Class|undefined;


      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
       b = Runtime.__getTypeInfo(obj);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = b;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;

      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Runtime___getTypeInfo_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Runtime', '__getTypeInfo',
        '__getTypeInfo(o: Any): Class|undefined', arkTsAveragedTime);

    })
    */

    it('PerformanceTest_Runtime_addFrontElementsStub_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {

      let original: FixedArray<Object> = new FixedArray<Object>(2, new Object());
      let front: FixedArray<Object> = new FixedArray<Object>(1, new Object());
      let b: FixedArray<Any> = new FixedArray<Any>(0, undefined);

      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        b = Runtime.addFrontElementsStub(original, front);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = b;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;

      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Runtime_addFrontElementsStub_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Runtime', 'addFrontElementsStub',
        'addFrontElementsStub(original: FixedArray<Any>, front: FixedArray<Any>): FixedArray<Any>', arkTsAveragedTime);

    })

    it('PerformanceTest_Runtime_removeFrontElementsStub_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {

      let original: FixedArray<Object> = new FixedArray<Object>(3, new Object());
      let count: int = 1;
      let b: FixedArray<Any> = new FixedArray<Any>(0, undefined);

      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        b = Runtime.removeFrontElementsStub(original, count);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = b;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;

      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Runtime_removeFrontElementsStub_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Runtime', 'removeFrontElementsStub',
        'removeFrontElementsStub(original: FixedArray<Any>, count: int): FixedArray<Any>', arkTsAveragedTime);

    })

    it('PerformanceTest_Runtime_restArgumentsUnderapplicationStub_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {

      let rest: FixedArray<Object> = new FixedArray<Object>(2, new Object());
      let required: int = 3;
      let b: FixedArray<Any> = new FixedArray<Any>(0, undefined);

      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        b = Runtime.restArgumentsUnderapplicationStub(rest, required);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = b;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;

      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Runtime_restArgumentsUnderapplicationStub_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Runtime', 'restArgumentsUnderapplicationStub',
        'restArgumentsUnderapplicationStub(rest: FixedArray<Any>, required: int): FixedArray<Any>', arkTsAveragedTime);

    })

    it('PerformanceTest_Runtime_lambdaUnsafeCallStub_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {

      let fn: Function = () => {};
      let r: FixedArray<Object> = new FixedArray<Object>(2, new Object());
      let b: Any;


      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        b = Runtime.lambdaUnsafeCallStub(fn, r);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = b;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;

      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Runtime_lambdaUnsafeCallStub_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Runtime', 'lambdaUnsafeCallStub',
        'lambdaUnsafeCallStub(fn: Function, r: FixedArray<Any>): Any', arkTsAveragedTime);

    })

    it('PerformanceTest_Runtime_toStringStub_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: string = 'test';
      let b: String = '';

      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        b = Runtime.toStringStub(a);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = b;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;

      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Runtime_toStringStub_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Runtime', 'toStringStub',
        'toStringStub(a: Any): String', arkTsAveragedTime);

    })

    it('PerformanceTest_Runtime_createNeverError_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let b = Runtime.createNeverError();

      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        b = Runtime.createNeverError();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = b;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;

      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Runtime_createNeverError_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Runtime', 'createNeverError',
        'createNeverError(): Error', arkTsAveragedTime);

    })

  })
}