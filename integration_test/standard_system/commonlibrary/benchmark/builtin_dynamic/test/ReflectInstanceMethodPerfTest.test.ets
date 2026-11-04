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

class InstanceMethod {
  private name: string;
  private isFinalFlag: boolean;
  private isAsyncFlag: boolean;
  private isAbstractFlag: boolean;
  private isGetterFlag: boolean;
  private isSetterFlag: boolean;

  constructor(name: string, isFinalFlag: boolean, isAsyncFlag: boolean, isAbstractFlag: boolean,
    isGetterFlag: boolean, isSetterFlag: boolean) {
    this.name = name;
    this.isFinalFlag = isFinalFlag;
    this.isAsyncFlag = isAsyncFlag;
    this.isAbstractFlag = isAbstractFlag;
    this.isGetterFlag = isGetterFlag;
    this.isSetterFlag = isSetterFlag;
  }

  isFinal(): boolean {
    return this.isFinalFlag;
  }

  isAsync(): boolean {
    return this.isAsyncFlag;
  }

  isAbstract(): boolean {
    return this.isAbstractFlag;
  }

  isGetter(): boolean {
    return this.isGetterFlag;
  }

  isSetter(): boolean {
    return this.isSetterFlag;
  }

  equals(other: InstanceMethod): boolean {
    return this.name === other.name;
  }

  invoke(thisObj: Object): Object {
    return 42;
  }
}

let instanceMethod: InstanceMethod = new InstanceMethod("getInstanceValue", true, false, false, true, false);
let instanceMethod1: InstanceMethod = new InstanceMethod("getInstanceValue", true, false, false, true, false);
let instanceMethod2: InstanceMethod = new InstanceMethod("getInstanceValue", true, false, false, true, false);
let setterMethod: InstanceMethod = new InstanceMethod("setInstanceValue", false, false, false, false, true);

export default function ReflectInstanceMethodPerfTest(): void {
  describe('ReflectInstanceMethodPerfTest', () => {
    const BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_InstanceMethod_isFinal_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function): void => {
        let res: boolean = false;
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          res = instanceMethod.isFinal();
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime: number = Dtime  / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime '
          + 'PerformanceTest_InstanceMethod_isFinal_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core.reflect', 'InstanceMethod', 'isFinal',
          'isFinal(): boolean', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_InstanceMethod_isAsync_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function): void => {
        let res: boolean = false;
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          res = instanceMethod.isAsync();
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime: number = Dtime  / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime '
          + 'PerformanceTest_InstanceMethod_isAsync_0200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core.reflect', 'InstanceMethod', 'isAsync',
          'isAsync(): boolean', arkTsAveragedTime);
        expect(res1).assertFalse();
        done();
      })

    it('PerformanceTest_InstanceMethod_isAbstract_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function): void => {
        let res: boolean = false;
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          res = instanceMethod.isAbstract();
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime: number = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime '
          + 'PerformanceTest_InstanceMethod_isAbstract_0300: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core.reflect', 'InstanceMethod', 'isAbstract',
          'isAbstract(): boolean', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_InstanceMethod_isGetter_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function): void => {
        let res: boolean = false;
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          res = instanceMethod.isGetter();
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime: number = Dtime  / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime '
          + 'PerformanceTest_InstanceMethod_isGetter_0400: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core.reflect', 'InstanceMethod', 'isGetter',
          'isGetter(): boolean', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_InstanceMethod_isSetter_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function): void => {
        let res: boolean = false;
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          res = setterMethod.isSetter();
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime: number = Dtime  / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime '
          + 'PerformanceTest_InstanceMethod_isSetter_0500: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core.reflect', 'InstanceMethod', 'isSetter',
          'isSetter(): boolean', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_InstanceMethod_equals_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function): void => {
        let res: boolean = false;
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          res = instanceMethod1.equals(instanceMethod2);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime: number = Dtime  / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime '
          + 'PerformanceTest_InstanceMethod_equals_0600: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core.reflect', 'InstanceMethod', 'equals',
          'equals(other: InstanceMethod): boolean', arkTsAveragedTime);
      done();
      })

    it('PerformanceTest_InstanceMethod_invoke_0700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function): void => {
        let thisObj: Object = new Object();
        let res: Object = instanceMethod.invoke(thisObj);
        let Stime: number = systemDateTime.getTime(true);
        for (let i: number = 0; i < BASE_COUNT; i++) {
          res = instanceMethod.invoke(thisObj);
        }
        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime: number = Dtime  / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime '
          + 'PerformanceTest_InstanceMethod_invoke_0700: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core.reflect', 'InstanceMethod', 'invoke',
          'invoke(thisObj: Object): Object', arkTsAveragedTime);
        expect(res1).assertEqual(42);
        done();
      })

  })
}