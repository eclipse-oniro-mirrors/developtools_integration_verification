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
} from "@ohos/hypium";
import performance from './Performance.util';
import { systemDateTime } from '@kit.BasicServicesKit';

declare class ArkTools {
  static forceFullGC(): void;
}

export default function TypedArraysPerfTest11(): void {
  describe('TypedArraysPerfTest11', () => {
    const BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_Int8Array_toLocaleString_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: string = '';
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.toLocaleString();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array toLocaleString: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'toLocaleString', 'toLocaleString(): string', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Int8Array_toString_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let result: string = '';
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.toString();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array toString: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'toString', 'toString(): string', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Int8Array_sort_empty_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arrays: Int8Array[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        arrays.push(new Int8Array([5, 3, 1, 4, 2]));
      }
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        arrays[i].sort();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = arrays[BASE_COUNT - 1];
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array sort_empty: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'sort', 'sort(): this', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Int8Array_sort_cmp_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arrays: Int8Array[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        arrays.push(new Int8Array([5, 3, 1, 4, 2]));
      }
      let cmp = (a: number, b: number): number => {
        return a - b;
      };
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        arrays[i].sort(cmp);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = arrays[BASE_COUNT - 1];
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Int8Array sort_cmp: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int8Array', 'sort', 'sort((number, number): => number): this', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Int32Array_toLocaleString_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let result: string = '';
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.toLocaleString();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Int32Array toLocaleString: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int32Array', 'toLocaleString', 'toLocaleString(): string', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Int32Array_sort_cmp_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arrays: Int32Array[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        arrays.push(new Int32Array([5, 3, 1, 4, 2]));
      }
      let cmp = (a: number, b: number): number => {
        return a - b;
      };
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        arrays[i].sort(cmp);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = arrays[BASE_COUNT - 1];
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Int32Array sort_cmp: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Int32Array', 'sort', 'sort((number, number): => number): this', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BigInt64Array_toLocaleString_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: BigInt64Array = new BigInt64Array([BigInt(1), BigInt(2), BigInt(3), BigInt(4), BigInt(5)]);
      let res: string = '';
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = arr.toLocaleString();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest BigInt64Array toLocaleString: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt64Array', 'toLocaleString', 'toLocaleString(): string', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_BigInt64Array_sort_cmp_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: BigInt64Array = new BigInt64Array([BigInt(5), BigInt(3), BigInt(1), BigInt(4), BigInt(2)]);
      let cmp = (a: bigint, b: bigint): number => {
        if (a > b) return 1;
        if (a < b) return -1;
        return 0;
      };
      let res: BigInt64Array = arr.sort(cmp);
      let arrays: BigInt64Array[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        arrays.push(new BigInt64Array([BigInt(5), BigInt(3), BigInt(1), BigInt(4), BigInt(2)]));
      }
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        arrays[i].sort(cmp);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = arrays[BASE_COUNT - 1];
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest BigInt64Array sort_cmp: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'BigInt64Array', 'sort', 'sort((bigint, bigint): => number): this', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Float32Array_toLocaleString_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      let result: string = '';
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.toLocaleString();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Float32Array toLocaleString: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'toLocaleString', 'toLocaleString(): string', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Float32Array_sort_cmp_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arrays: Float32Array[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        arrays.push(new Float32Array([5.0, 3.0, 1.0, 4.0, 2.0]));
      }
      let cmp = (a: number, b: number): number => {
        return a - b;
      };
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        arrays[i].sort(cmp);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = arrays[BASE_COUNT - 1];
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Float32Array sort_cmp: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float32Array', 'sort', 'sort((number, number): => number): this', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Float64Array_toLocaleString_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arr: Float64Array = new Float64Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      let result: string = '';
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        result = arr.toLocaleString();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array toLocaleString: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'toLocaleString', 'toLocaleString(): string', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Float64Array_sort_cmp_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let arrays: Float64Array[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        arrays.push(new Float64Array([5.0, 3.0, 1.0, 4.0, 2.0]));
      }
      let cmp = (a: number, b: number): number => {
        return a - b;
      };
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        arrays[i].sort(cmp);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = arrays[BASE_COUNT - 1];
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest Float64Array sort_cmp: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Float64Array', 'sort', 'sort((number, number): => number): this', arkTsAveragedTime);
      done();
    })
  })
}