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

function promiseExecutorResolveOne(resolve: Function, reject: Function): void {
  resolve(1);
}

function promiseThenReturnTwo(v: number): Promise<number> {
  return Promise.resolve(2);
}

function promiseThenAddOne(v: number): Promise<number> {
  return Promise.resolve(v + 1);
}

function promiseThenReturnMinusOne(v: number): Promise<number> {
  return Promise.resolve(-1);
}

function promiseCatchReturnZero(e: Error): number {
  return 0;
}

function promiseCatchErrorReturnZero(e: Error): number {
  return 0;
}

function promiseFinallyReturnZero(): number {
  return 0;
}

export default function PromisePerfTest(): void {
  describe('PromisePerfTest', () => {

    const BASE_COUNT = 1000;
    const BASE_COUNT_PROMISE_MIX = 100;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_Promise_Constructor_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let result: Promise<number> | undefined = undefined;
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT_PROMISE_MIX; i++) {
          result = new Promise<number>(promiseExecutorResolveOne);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT_PROMISE_MIX;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Promise_Constructor_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Promise',
          'constructor',
          'constructor(callback: (resolve: (value: T|PromiseLike<T>) => void, reject: (error: Error) => void) => void)',
          arkTsAveragedTime
        );
      done();
      });

    it('PerformanceTest_Promise_Then_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let source: Promise<number> = Promise.resolve<number>(1);
        let result: Promise<number> | undefined = undefined;
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT_PROMISE_MIX; i++) {
          result = source.then(promiseThenReturnTwo);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT_PROMISE_MIX;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Promise_Then_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Promise',
          'then',
          'then<U = T>(onFulfilled: () => U|PromiseLike<U>): Promise<Awaited<U>>',
          arkTsAveragedTime
        );
      done();
      });

    it('PerformanceTest_Promise_Then_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let source: Promise<number> = Promise.resolve<number>(1);
        let result: Promise<number> | undefined = undefined;
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT_PROMISE_MIX; i++) {
          result = source.then(undefined);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT_PROMISE_MIX;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Promise_Then_0300: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Promise',
          'then',
          'then(_onFulfilled?: undefined): Promise<Awaited<T>>',
          arkTsAveragedTime
        );
      done();
      });

    it('PerformanceTest_Promise_Then_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let source: Promise<number> = Promise.resolve<number>(1);
        let result: Promise<number> | undefined = undefined;
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT_PROMISE_MIX; i++) {
          result = source.then(promiseThenAddOne, promiseThenReturnMinusOne);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT_PROMISE_MIX;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Promise_Then_0400: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Promise',
          'then',
          'then<U = T, E = never>(onFulfilled: (value: T) => U|PromiseLike<U>, onRejected?: (error: Error) => E|PromiseLike<E>): Promise<Awaited<U|E>>',
          arkTsAveragedTime
        );
      done();
      });

    it('PerformanceTest_Promise_Catch_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let source: Promise<number> = Promise.reject<number>(new Error('arkts'));
        let result: Promise<number> | undefined = undefined;
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT_PROMISE_MIX; i++) {
          result = source.catch(promiseCatchReturnZero);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT_PROMISE_MIX;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Promise_Catch_0300: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Promise',
          'catch',
          'catch<U = never>(onRejected: () => U|PromiseLike<U>): Promise<Awaited<T|U>>',
          arkTsAveragedTime
        );
      done();
      });

    it('PerformanceTest_Promise_Finally_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let source: Promise<number> = Promise.resolve<number>(1);
        let result: Promise<number> | undefined = undefined;
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT_PROMISE_MIX; i++) {
          result = source.finally(promiseFinallyReturnZero);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT_PROMISE_MIX;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Promise_Finally_0500: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Promise',
          'finally',
          'finally<U = T>(onFinally?: () => U|PromiseLike<U>): Promise<Awaited<T>>',
          arkTsAveragedTime
        );
      done();
      });

    it('PerformanceTest_Promise_Resolve_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let result: Promise<void> | undefined = undefined;
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT_PROMISE_MIX; i++) {
          result = Promise.resolve();
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT_PROMISE_MIX;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Promise_Resolve_0600: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Promise',
          'resolve',
          'static resolve(): Promise<void>',
          arkTsAveragedTime
        );
      done();
      });

    it('PerformanceTest_Promise_Resolve_0700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let result: Promise<number> | undefined = undefined;
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT_PROMISE_MIX; i++) {
          result = Promise.resolve<number>(1);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT_PROMISE_MIX;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Promise_Resolve_0700: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Promise',
          'resolve',
          'static resolve<U>(value: U|PromiseLike<U>): Promise<Awaited<U>>',
          arkTsAveragedTime
        );
      done();
      });

    it('PerformanceTest_Promise_Reject_0800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let result: Promise<void> | undefined = undefined;
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT_PROMISE_MIX; i++) {
          result = Promise.reject();
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT_PROMISE_MIX;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Promise_Reject_0800: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Promise',
          'reject',
          'static reject(): Promise<void>',
          arkTsAveragedTime
        );
      done();
      });

    it('PerformanceTest_Promise_Reject_0900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let error: Error = new Error('arkts');
        let result: Promise<number> | undefined = undefined;
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT_PROMISE_MIX; i++) {
          result = Promise.reject<number>(error);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT_PROMISE_MIX;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Promise_Reject_0900: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Promise',
          'reject',
          'static reject<U = never>(error: Error): Promise<Awaited<U>>',
          arkTsAveragedTime
        );
      done();
      });

    it('PerformanceTest_Promise_All_1000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let promises: Promise<number>[] = [];
        promises.push(Promise.resolve<number>(1));
        promises.push(Promise.resolve<number>(2));
        let result: Promise<number[]> | undefined = undefined;
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT_PROMISE_MIX; i++) {
          result = Promise.all<number>(promises);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT_PROMISE_MIX;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Promise_All_1000: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Promise',
          'all',
          'static all<U>(promises: Iterable<U|PromiseLike<U>>): Promise<Array<Awaited<U>>>',
          arkTsAveragedTime
        );
      done();
      });

    it('PerformanceTest_Promise_AllSettled_1100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let promises: Promise<number>[] = [];
        promises.push(Promise.resolve<number>(1));
        promises.push(Promise.resolve<number>(2));
        let result: Promise<PromiseSettledResult<number>[]> | undefined = undefined;
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT_PROMISE_MIX; i++) {
          result = Promise.allSettled<number>(promises);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT_PROMISE_MIX;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Promise_AllSettled_1100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Promise',
          'allSettled',
          'static allSettled<U>(promises: Iterable<U|PromiseLike<U>>): Promise<PromiseSettledResult<Awaited<U>>[]>',
          arkTsAveragedTime
        );
      done();
      });

    it('PerformanceTest_Promise_Any_1200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let promises: Promise<number>[] = [];
        promises.push(Promise.resolve<number>(1));
        promises.push(Promise.resolve<number>(2));
        let result: Promise<number> | undefined = undefined;
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT_PROMISE_MIX; i++) {
          result = Promise.any<number>(promises);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT_PROMISE_MIX;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Promise_Any_1200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Promise',
          'any',
          'static any<U>(promises: Iterable<U|PromiseLike<U>>): Promise<Awaited<U>>',
          arkTsAveragedTime
        );
      done();
      });

    it('PerformanceTest_Promise_Race_1300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
        let promises: Promise<number>[] = [];
        promises.push(Promise.resolve<number>(1));
        promises.push(Promise.resolve<number>(2));
        let result: Promise<number> | undefined = undefined;
        let Stime: number = systemDateTime.getTime(true);

        for (let i: number = 0; i < BASE_COUNT_PROMISE_MIX; i++) {
          result = Promise.race<number>(promises);
        }

        let Dtime: number = systemDateTime.getTime(true) - Stime;
        let arkTsAveragedTime = Dtime / BASE_COUNT_PROMISE_MIX;
        let res1 = result;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Promise_Race_1300: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Promise',
          'race',
          'static race<U>(promises: Iterable<U|PromiseLike<U>>): Promise<Awaited<U>>',
          arkTsAveragedTime
        );
      done();
      });

  });
}