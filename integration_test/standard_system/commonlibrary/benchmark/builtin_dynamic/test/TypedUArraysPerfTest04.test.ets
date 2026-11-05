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
  TestType,
  Size,
  Level,
  beforeEach,
  afterAll,
  expect
} from "@ohos/hypium";
import performance from './Performance.util';
import { systemDateTime } from '@kit.BasicServicesKit';

declare class ArkTools {
  static forceFullGC(): void;
}

export default function TypedUArraysPerfTest04(): void {
  describe('TypedUArraysPerfTest04', () => {
    const BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    });

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_Uint8ClampedArray_toLocaleString_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
        let res: string = arr.toLocaleString();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.toLocaleString();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint8ClampedArray toLocaleString: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'toLocaleString', 'toLocaleString(Intl.LocalesArgument, object): string', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8ClampedArray_valueOf_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3, 4, 5]);
        let res: Uint8ClampedArray = arr.valueOf();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.valueOf();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint8ClampedArray valueOf: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8ClampedArray', 'valueOf', 'valueOf(): Uint8ClampedArray', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8Array_toLocaleString_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
        let res: string = arr.toLocaleString();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.toLocaleString();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint8Array toLocaleString: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'toLocaleString', 'toLocaleString(Intl.LocalesArgument, object): string', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint8Array_valueOf_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
        let res: Uint8Array = arr.valueOf();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.valueOf();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint8Array valueOf: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint8Array', 'valueOf', 'valueOf(): Uint8Array', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint16Array_toLocaleString_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
        let res: string = arr.toLocaleString();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.toLocaleString();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array toLocaleString: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'toLocaleString', 'toLocaleString(Intl.LocalesArgument, object): string', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint16Array_valueOf_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
        let res: Uint16Array = arr.valueOf();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.valueOf();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint16Array valueOf: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint16Array', 'valueOf', 'valueOf(): Uint16Array', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint32Array_toLocaleString_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
        let res: string = arr.toLocaleString();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.toLocaleString();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array toLocaleString: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'toLocaleString', 'toLocaleString(Intl.LocalesArgument, object): string', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_Uint32Array_valueOf_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: Uint32Array = new Uint32Array([1, 2, 3, 4, 5]);
        let res: Uint32Array = arr.valueOf();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.valueOf();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest Uint32Array valueOf: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'Uint32Array', 'valueOf', 'valueOf(): Uint32Array', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_BigUint64Array_toLocaleString_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: BigUint64Array = new BigUint64Array([BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(5)]);
        let res: string = arr.toLocaleString();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.toLocaleString();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest BigUint64Array toLocaleString: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'toLocaleString', 'toLocaleString(Intl.LocalesArgument, object): string', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_BigUint64Array_valueOf_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let arr: BigUint64Array = new BigUint64Array([BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(5)]);
        let res: BigUint64Array = arr.valueOf();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = arr.valueOf();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest BigUint64Array valueOf: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.core', 'BigUint64Array', 'valueOf', 'valueOf(): BigUint64Array', arkTsAveragedTime);
      done();
      })
  })
}