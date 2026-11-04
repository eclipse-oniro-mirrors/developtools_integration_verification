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

function promiseExecutorResolveOne(
  resolve: (value: int | PromiseLike<int>) => void,
  reject: (error: Error) => void
): void {
  resolve(1);
}

function promiseThenReturnTwo(): int {
  return 2;
}

function promiseThenAddOne(value: int): int {
  return value + 1;
}

function promiseThenReturnMinusOne(error: Error): int {
  return -1;
}

function promiseCatchReturnZero(): int {
  return 0;
}

function promiseCatchErrorReturnZero(error: Error): int {
  return 0;
}

function promiseFinallyReturnZero(): int {
  return 0;
}

export default function PromisePerfTest(): void {
  describe('PromisePerfTest', () => {
    const BASE_COUNT_PROMISE = 5000;
    const UNIT_TIME = 1000000;
    const BASE_COUNT_PROMISE_MIX = 200;

    beforeEach(() => {
      let ret = GC.startGC(GC.Cause.FULL, true);
      GC.waitForFinishGC(ret);
      let ret1 = GC.startGC(GC.Cause.FULL, true);
      GC.waitForFinishGC(ret1);
    });

    afterAll(() => {
      performance.save('apiPerformance.txt');
    });

    it('PerformanceTest_PromiseFulfilledResult_Constructor_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let result: PromiseFulfilledResult<int> | undefined = undefined;
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT_PROMISE; i++) {
          result = new PromiseFulfilledResult<int>();
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_PROMISE;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_PromiseFulfilledResult_Constructor_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'PromiseFulfilledResult',
          'constructor',
          'constructor()',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_PromiseFulfilledResult_Constructor_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let result: PromiseFulfilledResult<int> | undefined = undefined;
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT_PROMISE; i++) {
          result = new PromiseFulfilledResult<int>(1);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_PROMISE;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_PromiseFulfilledResult_Constructor_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'PromiseFulfilledResult',
          'constructor',
          'constructor(value: T)',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_PromiseRejectedResult_Constructor_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let result: PromiseRejectedResult | undefined = undefined;
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT_PROMISE; i++) {
          result = new PromiseRejectedResult();
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_PROMISE;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_PromiseRejectedResult_Constructor_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'PromiseRejectedResult',
          'constructor',
          'constructor()',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_PromiseRejectedResult_Constructor_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let error: Error = new Error('arkts');
        let result: PromiseRejectedResult | undefined = undefined;
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT_PROMISE; i++) {
          result = new PromiseRejectedResult(error);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_PROMISE;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_PromiseRejectedResult_Constructor_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'PromiseRejectedResult',
          'constructor',
          'constructor(reason: Error)',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Promise_Constructor_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let result: Promise<int> | undefined = undefined;
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT_PROMISE_MIX; i++) {
          result = new Promise<int>(promiseExecutorResolveOne);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_PROMISE_MIX;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Promise_Constructor_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Promise',
          'constructor',
          'constructor(callback: (resolve: (value: T|PromiseLike<T>) => void, reject: (error: Error) => void) => void)',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Promise_Then_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let source: Promise<int> = Promise.resolve<int>(1);
        let result: Promise<int> | undefined = undefined;
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT_PROMISE_MIX; i++) {
          result = source.then(promiseThenReturnTwo);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_PROMISE_MIX;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Promise_Then_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Promise',
          'then',
          'then<U = T>(onFulfilled: () => U|PromiseLike<U>): Promise<Awaited<U>>',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Promise_Then_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let source: Promise<int> = Promise.resolve<int>(1);
        let result: Promise<int> | undefined = undefined;
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT_PROMISE_MIX; i++) {
          result = source.then(undefined);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_PROMISE_MIX;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Promise_Then_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Promise',
          'then',
          'then(_onFulfilled?: undefined): Promise<Awaited<T>>',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Promise_Then_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let source: Promise<int> = Promise.resolve<int>(1);
        let result: Promise<int> | undefined = undefined;
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT_PROMISE_MIX; i++) {
          result = source.then(promiseThenAddOne, promiseThenReturnMinusOne);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_PROMISE_MIX;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Promise_Then_0300: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Promise',
          'then',
          'then<U = T, E = never>(onFulfilled: (value: T) => U|PromiseLike<U>, onRejected?: (error: Error) => E|PromiseLike<E>): Promise<Awaited<U|E>>',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Promise_Catch_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let source: Promise<int> = Promise.reject<int>(new Error('arkts'));
        let result: Promise<int> | undefined = undefined;
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT_PROMISE_MIX; i++) {
          result = source.catch(promiseCatchReturnZero);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_PROMISE_MIX;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Promise_Catch_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Promise',
          'catch',
          'catch<U = never>(onRejected: () => U|PromiseLike<U>): Promise<Awaited<T|U>>',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Promise_Catch_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let source: Promise<int> = Promise.reject<int>(new Error('arkts'));
        let result: Promise<int> | undefined = undefined;
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT_PROMISE_MIX; i++) {
          result = source.catch(promiseCatchErrorReturnZero);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_PROMISE_MIX;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Promise_Catch_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Promise',
          'catch',
          'catch<U = never>(onRejected?: (error: Error) => U|PromiseLike<U>): Promise<Awaited<T|U>>',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Promise_Finally_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let source: Promise<int> = Promise.resolve<int>(1);
        let result: Promise<int> | undefined = undefined;
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT_PROMISE_MIX; i++) {
          result = source.finally(promiseFinallyReturnZero);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_PROMISE_MIX;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Promise_Finally_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Promise',
          'finally',
          'finally<U = T>(onFinally?: () => U|PromiseLike<U>): Promise<Awaited<T>>',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Promise_Resolve_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let result: Promise<void> | undefined = undefined;
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT_PROMISE_MIX; i++) {
          result = Promise.resolve();
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_PROMISE_MIX;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Promise_Resolve_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Promise',
          'resolve',
          'static resolve(): Promise<void>',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Promise_Resolve_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let result: Promise<int> | undefined = undefined;
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT_PROMISE_MIX; i++) {
          result = Promise.resolve<int>(1);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_PROMISE_MIX;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Promise_Resolve_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Promise',
          'resolve',
          'static resolve<U>(value: U|PromiseLike<U>): Promise<Awaited<U>>',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Promise_Reject_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let result: Promise<void> | undefined = undefined;
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT_PROMISE_MIX; i++) {
          result = Promise.reject();
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_PROMISE_MIX;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Promise_Reject_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Promise',
          'reject',
          'static reject(): Promise<void>',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Promise_Reject_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let error: Error = new Error('arkts');
        let result: Promise<int> | undefined = undefined;
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT_PROMISE_MIX; i++) {
          result = Promise.reject<int>(error);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_PROMISE_MIX;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Promise_Reject_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Promise',
          'reject',
          'static reject<U = never>(error: Error): Promise<Awaited<U>>',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Promise_All_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let promises: FixedArray<Promise<int> | undefined> = new FixedArray<Promise<int> | undefined>(2, undefined);
        promises[0] = Promise.resolve<int>(1);
        promises[1] = Promise.resolve<int>(2);
        let result: Promise<Array<int>> | undefined = undefined;
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT_PROMISE_MIX; i++) {
          result = Promise.all<int>(promises);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_PROMISE_MIX;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Promise_All_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Promise',
          'all',
          'static all<U>(promises: FixedArray<U|PromiseLike<U>|undefined>): Promise<Array<Awaited<U>>>',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Promise_All_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let promises: Array<Promise<int>> = new Array<Promise<int>>();
        promises.push(Promise.resolve<int>(1));
        promises.push(Promise.resolve<int>(2));
        let result: Promise<Array<int>> | undefined = undefined;
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT_PROMISE_MIX; i++) {
          result = Promise.all<int>(promises);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_PROMISE_MIX;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Promise_All_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Promise',
          'all',
          'static all<U>(promises: Iterable<U|PromiseLike<U>>): Promise<Array<Awaited<U>>>',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Promise_AllSettled_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let promises: FixedArray<Promise<int> | undefined> = new FixedArray<Promise<int> | undefined>(2, undefined);
        promises[0] = Promise.resolve<int>(1);
        promises[1] = Promise.resolve<int>(2);
        let result: Promise<PromiseSettledResult<int>[]> | undefined = undefined;
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT_PROMISE_MIX; i++) {
          result = Promise.allSettled<int>(promises);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_PROMISE_MIX;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Promise_AllSettled_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Promise',
          'allSettled',
          'static allSettled<U>(promises: FixedArray<U|PromiseLike<U>|undefined>): Promise<PromiseSettledResult<Awaited<U>>[]>',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Promise_AllSettled_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let promises: Array<Promise<int>> = new Array<Promise<int>>();
        promises.push(Promise.resolve<int>(1));
        promises.push(Promise.resolve<int>(2));
        let result: Promise<PromiseSettledResult<int>[]> | undefined = undefined;
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT_PROMISE_MIX; i++) {
          result = Promise.allSettled<int>(promises);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_PROMISE_MIX;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Promise_AllSettled_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Promise',
          'allSettled',
          'static allSettled<U>(promises: Iterable<U|PromiseLike<U>>): Promise<PromiseSettledResult<Awaited<U>>[]>',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Promise_Any_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let promises: FixedArray<Promise<int> | undefined> = new FixedArray<Promise<int> | undefined>(2, undefined);
        promises[0] = Promise.resolve<int>(1);
        promises[1] = Promise.resolve<int>(2);
        let result: Promise<int> | undefined = undefined;
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT_PROMISE_MIX; i++) {
          result = Promise.any<int>(promises);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_PROMISE_MIX;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Promise_Any_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Promise',
          'any',
          'static any<U>(promises: FixedArray<U|PromiseLike<U>|undefined>): Promise<Awaited<U>>',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Promise_Any_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let promises: Array<Promise<int>> = new Array<Promise<int>>();
        promises.push(Promise.resolve<int>(1));
        promises.push(Promise.resolve<int>(2));
        let result: Promise<int> | undefined = undefined;
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT_PROMISE_MIX; i++) {
          result = Promise.any<int>(promises);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_PROMISE_MIX;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Promise_Any_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Promise',
          'any',
          'static any<U>(promises: Iterable<U|PromiseLike<U>>): Promise<Awaited<U>>',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Promise_Race_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let promises: FixedArray<Promise<int> | undefined> = new FixedArray<Promise<int> | undefined>(2, undefined);
        promises[0] = Promise.resolve<int>(1);
        promises[1] = Promise.resolve<int>(2);
        let result: Promise<int> | undefined = undefined;
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT_PROMISE_MIX; i++) {
          result = Promise.race<int>(promises);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_PROMISE_MIX;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Promise_Race_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Promise',
          'race',
          'static race<U>(promises: FixedArray<U|PromiseLike<U>|undefined>): Promise<Awaited<U>>',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Promise_Race_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let promises: Array<Promise<int>> = new Array<Promise<int>>();
        promises.push(Promise.resolve<int>(1));
        promises.push(Promise.resolve<int>(2));
        let result: Promise<int> | undefined = undefined;
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT_PROMISE_MIX; i++) {
          result = Promise.race<int>(promises);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_PROMISE_MIX;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Promise_Race_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Promise',
          'race',
          'static race<U>(promises: Iterable<U|PromiseLike<U>>): Promise<Awaited<U>>',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Promise_AwaitResolution_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let promise: Promise<int> = Promise.resolve<int>(1);
        let result: int = 0;
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT_PROMISE_MIX; i++) {
          result = promise.awaitResolution();
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_PROMISE_MIX;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Promise_AwaitResolution_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Promise',
          'awaitResolution',
          'awaitResolution(): T',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_Promise_AwaitSync_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let promise: Promise<int> = Promise.resolve<int>(1);
        let result: int = 0;
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT_PROMISE_MIX; i++) {
          result = promise.awaitSync();
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_PROMISE_MIX;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Promise_AwaitSync_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'Promise',
          'awaitSync',
          'awaitSync(): T',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_PromiseWithResolvers_Constructor_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let result: PromiseWithResolvers<int> | undefined = undefined;
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT_PROMISE_MIX; i++) {
          result = new PromiseWithResolvers<int>();
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_PROMISE_MIX;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_PromiseWithResolvers_Constructor_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'PromiseWithResolvers',
          'constructor',
          'constructor()',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_PromiseWithResolvers_promise_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let withResolvers: PromiseWithResolvers<int> = new PromiseWithResolvers<int>();
        let result: Promise<int> | undefined = undefined;
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT_PROMISE_MIX; i++) {
          result = withResolvers.promise;
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_PROMISE_MIX;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_PromiseWithResolvers_promise_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'PromiseWithResolvers',
          'promise',
          'readonly promise: Promise<T>',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_PromiseWithResolvers_resolve_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let withResolvers: PromiseWithResolvers<int> = new PromiseWithResolvers<int>();
        let resolveFn: (value: int | PromiseLike<int>) => void = withResolvers.resolve;
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT_PROMISE_MIX; i++) {
          resolveFn(1);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = resolveFn;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_PROMISE_MIX;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_PromiseWithResolvers_resolve_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'PromiseWithResolvers',
          'resolve',
          'readonly resolve: (value: T | PromiseLike<T>) => void',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_PromiseWithResolvers_reject_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let withResolvers: PromiseWithResolvers<int> = new PromiseWithResolvers<int>();
        let rejectFn: (error: Error) => void = withResolvers.reject;
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT_PROMISE_MIX; i++) {
          rejectFn(new Error('test'));
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = rejectFn;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_PROMISE_MIX;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_PromiseWithResolvers_reject_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'PromiseWithResolvers',
          'reject',
          'readonly reject: (error: Error) => void',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_PromiseStatus_fulfilled_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let result: string = '';
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT_PROMISE; i++) {
          result = PromiseStatus.fulfilled;
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_PROMISE;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_PromiseStatus_fulfilled_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'PromiseStatus',
          'fulfilled',
          'static readonly fulfilled: string',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_PromiseStatus_rejected_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let result: string = '';
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT_PROMISE; i++) {
          result = PromiseStatus.rejected;
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_PROMISE;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_PromiseStatus_rejected_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'PromiseStatus',
          'rejected',
          'static readonly rejected: string',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_PromiseFulfilledResult_status_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let resultObj: PromiseFulfilledResult<int> = new PromiseFulfilledResult<int>(1);
        let result: string = '';
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT_PROMISE; i++) {
          result = resultObj.status;
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_PROMISE;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_PromiseFulfilledResult_status_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'PromiseFulfilledResult',
          'status',
          'status: string',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_PromiseFulfilledResult_value_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let resultObj: PromiseFulfilledResult<int> = new PromiseFulfilledResult<int>(1);
        let result: int = 0;
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT_PROMISE; i++) {
          result = resultObj.value;
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_PROMISE;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_PromiseFulfilledResult_value_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'PromiseFulfilledResult',
          'value',
          'value: T',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_PromiseRejectedResult_status_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let resultObj: PromiseRejectedResult = new PromiseRejectedResult(new Error('test'));
        let result: string = '';
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT_PROMISE; i++) {
          result = resultObj.status;
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_PROMISE;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_PromiseRejectedResult_status_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'PromiseRejectedResult',
          'status',
          'status: string',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_PromiseRejectedResult_reason_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let error: Error = new Error('test');
        let resultObj: PromiseRejectedResult = new PromiseRejectedResult(error);
        let result: Error | undefined = undefined;
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT_PROMISE; i++) {
          result = resultObj.reason;
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_PROMISE;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_PromiseRejectedResult_reason_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'PromiseRejectedResult',
          'reason',
          'reason: Error',
          arkTsAveragedTime
        );
      });
  });
}