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

interface InterfaceX {
  methodX(): int;
}

interface InterfaceY {
  methodY(): string;
}

interface InterfaceZ extends InterfaceX, InterfaceY {
  methodZ(): boolean;
}

// UnionData 类型定义
type UnionData = int | string | boolean;

class ImplementingInterface implements InterfaceZ {
  public methodX(): int { return 1; }
  public methodY(): string { return "test"; }
  public methodZ(): boolean { return true; }
}

export default function TypePerfTest12(): void {
  describe('TypePerfTest12', () => {
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

    // ==================== InterfaceType isAbstract 测试 ====================
    // 注：InterfaceType.isAbstract() API 不存在，注释
    /*
    it('PerformanceTest_InterfaceType_isAbstract_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<InterfaceZ>();
      if (cls === undefined) {
        return;
      }
      let td = cls.getDescriptor();
      let linker = cls.getLinker();
      let interfaceType = Type.resolve(td, linker);
      if (!(interfaceType instanceof InterfaceType)) {
        return;
      }
      let result: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = interfaceType.isAbstract();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InterfaceType_isAbstract_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'InterfaceType', 'isAbstract',
        'isAbstract(): boolean', arkTsAveragedTime);
    });
    */

    // ==================== InterfaceType isFinal 测试 ====================
    // 注：InterfaceType.isFinal() API 不存在，注释
    /*
    it('PerformanceTest_InterfaceType_isFinal_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<InterfaceZ>();
      if (cls === undefined) {
        return;
      }
      let td = cls.getDescriptor();
      let linker = cls.getLinker();
      let interfaceType = Type.resolve(td, linker);
      if (!(interfaceType instanceof InterfaceType)) {
        return;
      }
      let result: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = interfaceType.isFinal();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InterfaceType_isFinal_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'InterfaceType', 'isFinal',
        'isFinal(): boolean', arkTsAveragedTime);
    });
    */

    // ==================== InterfaceType getClass 测试 ====================

    it('PerformanceTest_InterfaceType_getClass_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<InterfaceZ>();
      if (cls === undefined) {
        return;
      }
      let td = cls.getDescriptor();
      let linker = cls.getLinker();
      let interfaceType = Type.resolve(td, linker);
      if (!(interfaceType instanceof InterfaceType)) {
        return;
      }
      let result: Class | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = interfaceType.getClass();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InterfaceType_getClass_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'InterfaceType', 'getClass',
        'getClass(): Class', arkTsAveragedTime);
    });

    // ==================== InterfaceType getTypeDesc 测试 ====================

    it('PerformanceTest_InterfaceType_getTypeDesc_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<InterfaceZ>();
      if (cls === undefined) {
        return;
      }
      let td = cls.getDescriptor();
      let linker = cls.getLinker();
      let interfaceType = Type.resolve(td, linker);
      if (!(interfaceType instanceof InterfaceType)) {
        return;
      }
      let result: TypeDescriptor | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = interfaceType.getTypeDesc();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InterfaceType_getTypeDesc_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'InterfaceType', 'getTypeDesc',
        'getTypeDesc(): TypeDescriptor', arkTsAveragedTime);
    });

    // ==================== InterfaceType getName 测试 ====================

    it('PerformanceTest_InterfaceType_getName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<InterfaceZ>();
      if (cls === undefined) {
        return;
      }
      let td = cls.getDescriptor();
      let linker = cls.getLinker();
      let interfaceType = Type.resolve(td, linker);
      if (!(interfaceType instanceof InterfaceType)) {
        return;
      }
      let result: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = interfaceType.getName();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InterfaceType_getName_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'InterfaceType', 'getName',
        'getName(): string', arkTsAveragedTime);
    });

    // ==================== InterfaceType hasName 测试 ====================

    it('PerformanceTest_InterfaceType_hasName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<InterfaceZ>();
      if (cls === undefined) {
        return;
      }
      let td = cls.getDescriptor();
      let linker = cls.getLinker();
      let interfaceType = Type.resolve(td, linker);
      if (!(interfaceType instanceof InterfaceType)) {
        return;
      }
      let result: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = interfaceType.hasName();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InterfaceType_hasName_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'InterfaceType', 'hasName',
        'hasName(): boolean', arkTsAveragedTime);
    });

    // ==================== InterfaceType isPrimitive 测试 ====================

    it('PerformanceTest_InterfaceType_isPrimitive_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<InterfaceZ>();
      if (cls === undefined) {
        return;
      }
      let td = cls.getDescriptor();
      let linker = cls.getLinker();
      let interfaceType = Type.resolve(td, linker);
      if (!(interfaceType instanceof InterfaceType)) {
        return;
      }
      let result: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = interfaceType.isPrimitive();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InterfaceType_isPrimitive_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'InterfaceType', 'isPrimitive',
        'isPrimitive(): boolean', arkTsAveragedTime);
    });

    // ==================== InterfaceType isReference 测试 ====================

    it('PerformanceTest_InterfaceType_isReference_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<InterfaceZ>();
      if (cls === undefined) {
        return;
      }
      let td = cls.getDescriptor();
      let linker = cls.getLinker();
      let interfaceType = Type.resolve(td, linker);
      if (!(interfaceType instanceof InterfaceType)) {
        return;
      }
      let result: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = interfaceType.isReference();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InterfaceType_isReference_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'InterfaceType', 'isReference',
        'isReference(): boolean', arkTsAveragedTime);
    });

    // ==================== InterfaceType assignableFrom 测试 ====================

    it('PerformanceTest_InterfaceType_assignableFrom_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<InterfaceZ>();
      if (cls === undefined) {
        return;
      }
      let td = cls.getDescriptor();
      let linker = cls.getLinker();
      let interfaceType = Type.resolve(td, linker);
      if (!(interfaceType instanceof InterfaceType)) {
        return;
      }
      let implClass = Class.from<ImplementingInterface>();
      if (implClass === undefined) {
        return;
      }
      let implType = Type.of(implClass);
      let result: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = interfaceType.assignableFrom(implType);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InterfaceType_assignableFrom_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'InterfaceType', 'assignableFrom',
        'assignableFrom(other: Type): boolean', arkTsAveragedTime);
    });

    // ==================== InterfaceType equals 测试 ====================

    it('PerformanceTest_InterfaceType_equals_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<InterfaceZ>();
      if (cls === undefined) {
        return;
      }
      let td = cls.getDescriptor();
      let linker = cls.getLinker();
      let interfaceType = Type.resolve(td, linker);
      if (!(interfaceType instanceof InterfaceType)) {
        return;
      }
      let interfaceType2 = Type.of(cls);
      let result: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = interfaceType.equals(interfaceType2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InterfaceType_equals_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'InterfaceType', 'equals',
        'equals(other: Type): boolean', arkTsAveragedTime);
    });

    // ==================== InterfaceType toString 测试 ====================

    it('PerformanceTest_InterfaceType_toString_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<InterfaceZ>();
      if (cls === undefined) {
        return;
      }
      let td = cls.getDescriptor();
      let linker = cls.getLinker();
      let interfaceType = Type.resolve(td, linker);
      if (!(interfaceType instanceof InterfaceType)) {
        return;
      }
      let result: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = interfaceType.toString();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InterfaceType_toString_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'InterfaceType', 'toString',
        'toString(): string', arkTsAveragedTime);
    });

    // ==================== InterfaceType getLiteral 测试 ====================

    it('PerformanceTest_InterfaceType_getLiteral_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<InterfaceZ>();
      if (cls === undefined) {
        return;
      }
      let td = cls.getDescriptor();
      let linker = cls.getLinker();
      let interfaceType = Type.resolve(td, linker);
      if (!(interfaceType instanceof InterfaceType)) {
        return;
      }
      let result: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = interfaceType.getLiteral();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InterfaceType_getLiteral_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'InterfaceType', 'getLiteral',
        'getLiteral(): string', arkTsAveragedTime);
    });

    // ==================== LambdaType convertObject 测试 ====================

    it('PerformanceTest_LambdaType_convertObject_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lambda = (x: int): int => x + 1;
      let lambdaType = Type.of(lambda);
      let result: Any = lambda;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = (lambdaType as LambdaType).convertObject(lambda);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LambdaType_convertObject_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'LambdaType', 'convertObject',
        'convertObject(obj: Any): Any', arkTsAveragedTime);
    });

    // ==================== LambdaType getReturnType 测试 ====================
    // 注：LambdaType.getReturnType() API 不存在，注释
    /*
    it('PerformanceTest_LambdaType_getReturnType_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lambda = (x: int): int => x + 1;
      let lambdaType = Type.of(lambda);
      let result: Type | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = (lambdaType as LambdaType).getReturnType();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LambdaType_getReturnType_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'LambdaType', 'getReturnType',
        'getReturnType(): Type', arkTsAveragedTime);
    });
    */

    // ==================== LambdaType getParameter 测试 ====================
    // 注：LambdaType.getParameter() 返回类型不匹配，注释
    /*
    it('PerformanceTest_LambdaType_getParameter_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lambda = (x: int, y: string): boolean => true;
      let lambdaType = Type.of(lambda);
      let result: Type | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = (lambdaType as LambdaType).getParameter(0);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LambdaType_getParameter_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'LambdaType', 'getParameter',
        'getParameter(index: long): Type', arkTsAveragedTime);
    });
    */

    // ==================== LambdaType isNative 测试 ====================
    // 注：LambdaType.isNative() API 不存在，注释
    /*
    it('PerformanceTest_LambdaType_isNative_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lambda = (x: int): int => x + 1;
      let lambdaType = Type.of(lambda);
      let result: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = (lambdaType as LambdaType).isNative();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LambdaType_isNative_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'LambdaType', 'isNative',
        'isNative(): boolean', arkTsAveragedTime);
    });
    */

    // ==================== LambdaType isAsync 测试 ====================
    // 注：LambdaType.isAsync() API 不存在，注释
    /*
    it('PerformanceTest_LambdaType_isAsync_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let lambda = (x: int): int => x + 1;
      let lambdaType = Type.of(lambda);
      let result: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = (lambdaType as LambdaType).isAsync();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_LambdaType_isAsync_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'LambdaType', 'isAsync',
        'isAsync(): boolean', arkTsAveragedTime);
    });
    */

    // ==================== UnionType getLiteral 测试 ====================
    // 注：UnionType.getLiteral() API 不存在，注释
    /*
    it('PerformanceTest_UnionType_getLiteral_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: UnionData = 1;
      let unionType = Type.of(value);
      let result: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = (unionType as UnionType).getLiteral();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UnionType_getLiteral_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'UnionType', 'getLiteral',
        'getLiteral(): string', arkTsAveragedTime);
    });
    */

    // ==================== UnionType hasName 测试 ====================
    // 注：UnionType.hasName() API 不存在，注释
    /*
    it('PerformanceTest_UnionType_hasName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: UnionData = 1;
      let unionType = Type.of(value);
      let result: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = (unionType as UnionType).hasName();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UnionType_hasName_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'UnionType', 'hasName',
        'hasName(): boolean', arkTsAveragedTime);
    });
    */

    // ==================== UnionType getName 测试 ====================
    // 注：UnionType.getName() API 不存在，注释
    /*
    it('PerformanceTest_UnionType_getName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: UnionData = 1;
      let unionType = Type.of(value);
      let result: string = "";
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = (unionType as UnionType).getName();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_UnionType_getName_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'UnionType', 'getName',
        'getName(): string', arkTsAveragedTime);
    });
    */
  });
}
