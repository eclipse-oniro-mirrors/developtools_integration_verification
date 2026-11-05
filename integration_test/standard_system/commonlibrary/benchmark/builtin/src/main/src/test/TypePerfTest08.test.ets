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
  TestType,
  Size,
  Level,
  beforeEach,
  afterAll
} from "../../../hypium/index";
import performance from './Performance.util';

type TupleData = [int, string, boolean];

export default function TypePerfTest08(): void {
  describe('TypePerfTest08', () => {
    const BASE_COUNT = 50000;
    const UNIT_TIME = 1000000;

    beforeEach(() => {
      let ret = GC.startGC(GC.Cause.FULL, true);
      GC.waitForFinishGC(ret);
      let ret1 = GC.startGC(GC.Cause.FULL, true);
      GC.waitForFinishGC(ret1);
    });

    afterAll(() => {
      performance.save('apiPerformance.txt');
    });

    // ==================== TupleType isPrimitive 测试 ====================

    it('PerformanceTest_TupleType_isPrimitive_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let tupleData: TupleData = [1, "test", true];
      let obj: Object = tupleData as Object;
      let tupleType = Type.of(obj);
      let result: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = tupleType.isPrimitive();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TupleType_isPrimitive_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'TupleType', 'isPrimitive',
        'isPrimitive(): boolean', arkTsAveragedTime);
    });

    // ==================== TupleType isReference 测试 ====================

    it('PerformanceTest_TupleType_isReference_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let tupleData: TupleData = [1, "test", true];
      let obj: Object = tupleData as Object;
      let tupleType = Type.of(obj);
      let result: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = tupleType.isReference();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TupleType_isReference_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'TupleType', 'isReference',
        'isReference(): boolean', arkTsAveragedTime);
    });

    // ==================== TupleType hasName 测试 ====================

    it('PerformanceTest_TupleType_hasName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let tupleData: TupleData = [1, "test", true];
      let obj: Object = tupleData as Object;
      let tupleType = Type.of(obj);
      let result: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = tupleType.hasName();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TupleType_hasName_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'TupleType', 'hasName',
        'hasName(): boolean', arkTsAveragedTime);
    });

    // ==================== TupleType getName 测试 ====================

    it('PerformanceTest_TupleType_getName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let tupleData: TupleData = [1, "test", true];
      let obj: Object = tupleData as Object;
      let tupleType = Type.of(obj);
      let result: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = tupleType.getName();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TupleType_getName_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'TupleType', 'getName',
        'getName(): string', arkTsAveragedTime);
    });

    // ==================== TupleType getLiteral 测试 ====================

    it('PerformanceTest_TupleType_getLiteral_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let tupleData: TupleData = [1, "test", true];
      let obj: Object = tupleData as Object;
      let tupleType = Type.of(obj);
      let result: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = tupleType.getLiteral();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TupleType_getLiteral_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'TupleType', 'getLiteral',
        'getLiteral(): string', arkTsAveragedTime);
    });

    // ==================== TupleType equals 测试 ====================

    it('PerformanceTest_TupleType_equals_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let tupleData1: TupleData = [1, "test", true];
      let tupleData2: TupleData = [2, "test2", false];
      let obj1: Object = tupleData1 as Object;
      let obj2: Object = tupleData2 as Object;
      let tupleType1 = Type.of(obj1);
      let tupleType2 = Type.of(obj2);
      let result: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = tupleType1.equals(tupleType2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TupleType_equals_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'TupleType', 'equals',
        'equals(other: Type): boolean', arkTsAveragedTime);
    });

    // ==================== TupleType getTypeDesc 测试 ====================

    it('PerformanceTest_TupleType_getTypeDesc_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let tupleData: TupleData = [1, "test", true];
      let obj: Object = tupleData as Object;
      let tupleType = Type.of(obj);
      let result: TypeDescriptor | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = tupleType.getTypeDesc();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TupleType_getTypeDesc_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'TupleType', 'getTypeDesc',
        'getTypeDesc(): TypeDescriptor', arkTsAveragedTime);
    });

    // ==================== TupleType getClass 测试 ====================

    it('PerformanceTest_TupleType_getClass_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let tupleData: TupleData = [1, "test", true];
      let obj: Object = tupleData as Object;
      let tupleType = Type.of(obj);
      let result: Class | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = tupleType.getClass();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TupleType_getClass_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'TupleType', 'getClass',
        'getClass(): Class', arkTsAveragedTime);
    });

    // ==================== TupleType assignableFrom 测试 ====================

    it('PerformanceTest_TupleType_assignableFrom_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let tupleData1: TupleData = [1, "test", true];
      let tupleData2: TupleData = [2, "test2", false];
      let obj1: Object = tupleData1 as Object;
      let obj2: Object = tupleData2 as Object;
      let tupleType1 = Type.of(obj1);
      let tupleType2 = Type.of(obj2);
      let result: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = tupleType1.assignableFrom(tupleType2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TupleType_assignableFrom_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'TupleType', 'assignableFrom',
        'assignableFrom(other: Type): boolean', arkTsAveragedTime);
    });

    // ==================== TupleType toString 测试 ====================

    it('PerformanceTest_TupleType_toString_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let tupleData: TupleData = [1, "test", true];
      let obj: Object = tupleData as Object;
      let tupleType = Type.of(obj);
      let result: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = tupleType.toString();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_TupleType_toString_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'TupleType', 'toString',
        'toString(): string', arkTsAveragedTime);
    });
  });
}
