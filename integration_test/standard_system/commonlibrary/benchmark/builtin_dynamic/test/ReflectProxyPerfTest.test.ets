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

class ProxyLinkerSample {
  getFn: (proxy: object, method: string) => string | number | boolean | object | undefined;
  setFn: (proxy: object, method: string, value: string | number | boolean | object | undefined) => void;
  invokeFn: (proxy: object, method: string, args: (string | number | boolean | object | undefined)[]) => string | number | boolean | object | undefined;

  constructor() {
    this.getFn = (proxy: object, method: string): string | number | boolean | object | undefined => {
      return undefined;
    };
    this.setFn = (proxy: object, method: string, value: string | number | boolean | object | undefined): void => {
    };
    this.invokeFn = (proxy: object, method: string, args: (string | number | boolean | object | undefined)[]): string | number | boolean | object | undefined => {
      return undefined;
    };
  }
}

function createTestInvocationHandler(): ProxyLinkerSample {
  return new ProxyLinkerSample();
}

function createTestInterfaces(): ProxyLinkerSample[] {
  return [];
}

function createTestRuntimeLinker(): ProxyLinkerSample {
  return new ProxyLinkerSample();
}

class ProxyStub {
  private handler: ProxyLinkerSample;

  constructor(handler: ProxyLinkerSample) {
    this.handler = handler;
  }

  getHandler(): ProxyLinkerSample {
    return this.handler;
  }

  static create(linker: ProxyLinkerSample, interfaces: ProxyLinkerSample[], handler: ProxyLinkerSample): ProxyStub {
    return new ProxyStub(handler);
  }

  static isProxyClass(klass: object): boolean {
    return klass instanceof ProxyStub;
  }
}

export default function ReflectProxyPerfTest(): void {
  describe('ReflectProxyPerfTest', () => {
    const BASE_COUNT = 1000;

    let testHandler: ProxyLinkerSample = createTestInvocationHandler();
    let testInterfaces: ProxyLinkerSample[] = createTestInterfaces();
    let testLinker: ProxyLinkerSample = createTestRuntimeLinker();

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_Proxy_constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let result: ProxyStub = new ProxyStub(testHandler);
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        result = new ProxyStub(testHandler);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: ProxyStub = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Proxy_constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ProxyStub', 'constructor',
        'protected constructor(handler: InvocationHandler)', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Proxy_getHandler_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let proxy: ProxyStub = new ProxyStub(testHandler);
      let result: ProxyLinkerSample = proxy.getHandler();
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        result = proxy.getHandler();
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: ProxyLinkerSample = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Proxy_getHandler_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ProxyStub', 'getHandler',
        'public getHandler(): InvocationHandler', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Proxy_create_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let linker: ProxyLinkerSample = testLinker;
      let interfaces: ProxyLinkerSample[] = testInterfaces;
      let handler: ProxyLinkerSample = testHandler;
      let result: ProxyStub = ProxyStub.create(testLinker, testInterfaces, handler);
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        result = ProxyStub.create(testLinker, testInterfaces, handler);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: ProxyStub = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Proxy_create_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ProxyStub', 'create',
        'public static create(linker: RuntimeLinker, interfaces: FixedArray<Class>, handler: InvocationHandler): Proxy', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Proxy_isProxyClass_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let proxyObj: ProxyStub = new ProxyStub(testHandler);
      let testKlass: object = proxyObj;
      let result: boolean = ProxyStub.isProxyClass(testKlass);
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        result = ProxyStub.isProxyClass(testKlass);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: boolean = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Proxy_isProxyClass_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'ProxyStub', 'isProxyClass',
        'public static isProxyClass(klass: Class): boolean', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_InvocationHandler_get_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let proxyObj: ProxyStub = new ProxyStub(testHandler);
      let testClass: ProxyLinkerSample = new ProxyLinkerSample();
      let testMethod: string = 'toString';
      let result: string | number | boolean | object | undefined = undefined;
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        result = testHandler.getFn(proxyObj, testMethod);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: string | number | boolean | object | undefined = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InvocationHandler_get_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'InvocationHandler', 'get',
        'get(proxy: Proxy, method: InstanceMethod): Any', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_InvocationHandler_set_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let proxyObj: ProxyStub = new ProxyStub(testHandler);
      let testClass: ProxyLinkerSample = new ProxyLinkerSample();
      let testMethod: string = 'toString';
      let testValue: string | number | boolean | object | undefined = 'testValue';
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        testHandler.setFn(proxyObj, testMethod, testValue);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InvocationHandler_set_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'InvocationHandler', 'set',
        'set(proxy: Proxy, method: InstanceMethod, value: Any): void', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_InvocationHandler_invoke_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let proxyObj: ProxyStub = new ProxyStub(testHandler);
      let testClass: ProxyLinkerSample = new ProxyLinkerSample();
      let testMethod: string = 'toString';
      let args: (string | number | boolean | object | undefined)[] = [];
      let result: string | number | boolean | object | undefined = undefined;
      let Stime: number = systemDateTime.getTime(true);
      for (let i: number = 0; i < BASE_COUNT; i++) {
        result = testHandler.invokeFn(proxyObj, testMethod, args);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1: string | number | boolean | object | undefined = result;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_InvocationHandler_invoke_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'InvocationHandler', 'invoke',
        'invoke(proxy: Proxy, method: InstanceMethod, args: FixedArray<Any>): Any', arkTsAveragedTime);
      done();
    })

  })
}