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

interface TestInterface {
  name: string;
  value: int;
}

function getLiteralObj(): TestInterface {
  return { name: "test", value: 42 };
}

async function asyncFunc(): Promise<number> {
  return 42;
}

class BaseClass {
  public baseField: int = 1;
  public baseValue: string = "base";
  public get baseGetter(): int {
    return this.baseField;
  }
  public baseMethod(): string {
    return this.baseValue;
  }
}

class ChildClass extends BaseClass {
  public childField: int = 2;
  public childValue: string = "child";
  public get childGetter(): int {
    return this.childField;
  }
  public childMethod(): string {
    return this.childValue;
  }
}

export default function ReflectPerfTest(): void {
  describe('ReflectPerfTest', () => {
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

    // ========== isLiteralInitializedInterface(target: Object): boolean ==========
    it('PerformanceTest_Reflect_isLiteralInitializedInterface_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let obj = getLiteralObj();
      let result = reflect.isLiteralInitializedInterface(obj);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = reflect.isLiteralInitializedInterface(obj);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Reflect_isLiteralInitializedInterface_0100: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core.reflect', 'reflect', 'isLiteralInitializedInterface',
        'isLiteralInitializedInterface(target: Object): boolean', arkTsAveragedTime);
    })

    // ========== isFuncObjAsync(target: Function): boolean ==========
    it('PerformanceTest_Reflect_isFuncObjAsync_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = reflect.isFuncObjAsync(asyncFunc);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = reflect.isFuncObjAsync(asyncFunc);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Reflect_isFuncObjAsync_0200: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core.reflect', 'reflect', 'isFuncObjAsync',
        'isFuncObjAsync(target: Function): boolean', arkTsAveragedTime);
    })

    // ========== getInstanceGettersRecursive(targetClass: Class): Array<InstanceMethod> ==========
    it('PerformanceTest_Reflect_getInstanceGettersRecursive_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<ChildClass>();
      let result = reflect.getInstanceGettersRecursive(cls);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = reflect.getInstanceGettersRecursive(cls);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Reflect_getInstanceGettersRecursive_0300: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core.reflect', 'reflect', 'getInstanceGettersRecursive',
        'getInstanceGettersRecursive(targetClass: Class): Array<InstanceMethod>', arkTsAveragedTime);
    })

    // ========== getInstanceFieldsRecursive(targetClass: Class): Array<InstanceField> ==========
    it('PerformanceTest_Reflect_getInstanceFieldsRecursive_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<ChildClass>();
      let result = reflect.getInstanceFieldsRecursive(cls);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = reflect.getInstanceFieldsRecursive(cls);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Reflect_getInstanceFieldsRecursive_0400: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core.reflect', 'reflect', 'getInstanceFieldsRecursive',
        'getInstanceFieldsRecursive(targetClass: Class): Array<InstanceField>', arkTsAveragedTime);
    })

    // ========== getInstanceFieldsRecursiveByName(targetClass: Class, name: string): InstanceField | undefined ==========
    it('PerformanceTest_Reflect_getInstanceFieldsRecursiveByName_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<ChildClass>();
      let result = reflect.getInstanceFieldsRecursiveByName(cls, "childField");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = reflect.getInstanceFieldsRecursiveByName(cls, "childField");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Reflect_getInstanceFieldsRecursiveByName_0500: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core.reflect', 'reflect', 'getInstanceFieldsRecursiveByName',
        'getInstanceFieldsRecursiveByName(targetClass: Class, name: string): InstanceField | undefined', arkTsAveragedTime);
    })

    // ========== getInstanceMethodsRecursiveByName(targetClass: Class, name: string): InstanceMethod | undefined ==========
    it('PerformanceTest_Reflect_getInstanceMethodsRecursiveByName_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cls = Class.from<ChildClass>();
      let result = reflect.getInstanceMethodsRecursiveByName(cls, "childMethod");
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        result = reflect.getInstanceMethodsRecursiveByName(cls, "childMethod");
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = result;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Reflect_getInstanceMethodsRecursiveByName_0600: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core.reflect', 'reflect', 'getInstanceMethodsRecursiveByName',
        'getInstanceMethodsRecursiveByName(targetClass: Class, name: string): InstanceMethod | undefined', arkTsAveragedTime);
    })

  })
}
