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

import { describe, it, TestType, Size, Level, beforeEach, afterAll } from "@ohos/hypium";
import performance from './Performance.util';
import { systemDateTime } from '@kit.BasicServicesKit';

declare class ArkTools {
  static forceFullGC(): void;
}

class TestClass {
  public testValue: number = 0;

  public static staticMethod(): number {
    return 42;
  }

  public static staticMethodWithArgs(a: number, b: number): number {
    return a + b;
  }

  public static async staticAsyncMethod(): Promise<number> {
    return 100;
  }

  public static get staticGetter(): number {
    return 1;
  }

  public static set staticSetter(value: number) {
  }
}

class StaticMethod {
  private name: string;
  private isAsyncFlag: boolean;

  constructor(name: string, isAsyncFlag: boolean) {
    this.name = name;
    this.isAsyncFlag = isAsyncFlag;
  }

  isAsync(): boolean {
    return this.isAsyncFlag;
  }

  equals(other: StaticMethod): boolean {
    return this.name === other.name;
  }

  getName(): string {
    return this.name;
  }
}

let staticMethod: StaticMethod = new StaticMethod("staticMethod", false);
let staticAsyncMethodObj: StaticMethod = new StaticMethod("staticAsyncMethod", true);
let staticMethod1: StaticMethod = new StaticMethod("staticMethod", false);
let staticMethod2: StaticMethod = new StaticMethod("staticMethod", false);

export default function ReflectStaticMethodPerfTest(): void {
  describe('ReflectStaticMethodPerfTest', () => {
    const BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_StaticMethod_isAsync_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let res: boolean = false;
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        res = staticAsyncMethodObj.isAsync();
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: boolean = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_StaticMethod_isAsync_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core.reflect', 'StaticMethod', 'isAsync',
        'isAsync(): boolean', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_StaticMethod_equals_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let res: boolean = false;
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        res = staticMethod1.equals(staticMethod2);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: boolean = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_StaticMethod_equals_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core.reflect', 'StaticMethod', 'equals',
        'equals(other: StaticMethod): boolean', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_StaticMethod_getName_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let res: string = "";
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        res = staticMethod.getName();
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: string = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_StaticMethod_getName_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core.reflect', 'StaticMethod', 'getName',
        'getName(): string', arkTsAveragedTime);
      done();
    })

  })
}