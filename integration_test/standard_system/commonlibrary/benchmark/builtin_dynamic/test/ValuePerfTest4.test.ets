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
  beforeAll,
  afterAll,
  beforeEach,
  afterEach,
  expect
} from "@ohos/hypium";
import performance from './Performance.util';
import { systemDateTime } from '@kit.BasicServicesKit';

declare class ArkTools {
  static forceFullGC(): void;
}

declare class FloatValue extends Number {
  constructor(typ: FloatType, data: number);
  getType(): Type;
  getData(): Object;
  getValueData(): number;
  toPrint(depth: number): string;
  toString(): string;
}

declare class FloatValueImpl extends FloatValue {}

declare enum FloatType {
  VAL
}

declare class LongValue extends Number {
  constructor(typ: LongType, data: bigint);
  getType(): Type;
  getData(): Object;
  getValueData(): bigint;
  toPrint(depth: number): string;
  toString(): string;
}

declare class LongValueImpl extends LongValue {}

declare enum LongType {
  VAL
}

declare class Type {}

declare function toFloatValue(data: number): number;
declare function createFloatValueObj(): FloatValue;
declare function toLongValue(data: bigint): bigint;
declare function createLongValueObj(): LongValue;

export default function ValuePerfTest4(): void {
  describe('ValuePerfTest4', () => {

    const BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

it('PerformanceTest_FloatValue_constructor_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let data: number = toFloatValue(3.14);
        let result: FloatValue = new FloatValueImpl(FloatType.VAL, data);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = new FloatValueImpl(FloatType.VAL, data);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime ' +
          'PerformanceTest_FloatValue_constructor_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'FloatValue',
          'constructor',
          'constructor(typ: FloatType, data: number)',
          arkTsAveragedTime
        );
      done();
      });

    it('PerformanceTest_FloatValue_getType_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let value: FloatValue = createFloatValueObj();
        let result: Type = value.getType();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.getType();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime ' +
          'PerformanceTest_FloatValue_getType_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'FloatValue',
          'getType',
          'getType(): Type',
          arkTsAveragedTime
        );
      done();
      });

    it('PerformanceTest_FloatValue_getData_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let value: FloatValue = createFloatValueObj();
        let result: Object = value.getData();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.getData();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime ' +
          'PerformanceTest_FloatValue_getData_0300: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'FloatValue',
          'getData',
          'getData(): Object',
          arkTsAveragedTime
        );
      done();
      });

    it('PerformanceTest_FloatValue_getValueData_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let value: FloatValue = createFloatValueObj();
        let result: number = value.getValueData();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.getValueData();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime ' +
          'PerformanceTest_FloatValue_getValueData_0400: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'FloatValue',
          'getValueData',
          'getValueData(): number',
          arkTsAveragedTime
        );
      done();
      });

    it('PerformanceTest_FloatValue_toPrint_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let value: FloatValue = createFloatValueObj();
        let result: string = value.toPrint(1);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.toPrint(1);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime ' +
          'PerformanceTest_FloatValue_toPrint_0500: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'FloatValue',
          'toPrint',
          'toPrint(depth: number): string',
          arkTsAveragedTime
        );
      done();
      });

    it('PerformanceTest_FloatValue_toString_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let value: FloatValue = createFloatValueObj();
        let result: string = value.toString();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.toString();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime ' +
          'PerformanceTest_FloatValue_toString_0600: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'FloatValue',
          'toString',
          'toString(): string',
          arkTsAveragedTime
        );
      done();
      });

    it('PerformanceTest_LongValue_constructor_0700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let data: bigint = toLongValue(7n);
        let result: LongValue = new LongValueImpl(LongType.VAL, data);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = new LongValueImpl(LongType.VAL, data);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime ' +
          'PerformanceTest_LongValue_constructor_0700: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'LongValue',
          'constructor',
          'constructor(typ: LongType, data: bigint)',
          arkTsAveragedTime
        );
      done();
      });

    it('PerformanceTest_LongValue_getType_0800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let value: LongValue = createLongValueObj();
        let result: Type = value.getType();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.getType();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime ' +
          'PerformanceTest_LongValue_getType_0800: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'LongValue',
          'getType',
          'getType(): Type',
          arkTsAveragedTime
        );
      done();
      });

    it('PerformanceTest_LongValue_getData_0900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let value: LongValue = createLongValueObj();
        let result: Object = value.getData();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.getData();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime ' +
          'PerformanceTest_LongValue_getData_0900: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'LongValue',
          'getData',
          'getData(): Object',
          arkTsAveragedTime
        );
      done();
      });

    it('PerformanceTest_LongValue_getValueData_1000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let value: LongValue = createLongValueObj();
        let result: bigint = value.getValueData();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.getValueData();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime ' +
          'PerformanceTest_LongValue_getValueData_1000: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'LongValue',
          'getValueData',
          'getValueData(): bigint',
          arkTsAveragedTime
        );
      done();
      });

    it('PerformanceTest_LongValue_toPrint_1100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let value: LongValue = createLongValueObj();
        let result: string = value.toPrint(1);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.toPrint(1);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime ' +
          'PerformanceTest_LongValue_toPrint_1100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'LongValue',
          'toPrint',
          'toPrint(depth: number): string',
          arkTsAveragedTime
        );
      done();
      });

    it('PerformanceTest_LongValue_toString_1200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let value: LongValue = createLongValueObj();
        let result: string = value.toString();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          result = value.toString();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime ' +
          'PerformanceTest_LongValue_toString_1200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'LongValue',
          'toString',
          'toString(): string',
          arkTsAveragedTime
        );
      done();
      });
  });
}