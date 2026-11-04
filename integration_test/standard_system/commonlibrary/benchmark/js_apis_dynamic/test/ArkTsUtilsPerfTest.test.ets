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
  describe, it, expect, TestType, Size, Level, beforeAll, afterAll, beforeEach, afterEach
} from "@ohos/hypium";
import { ArkTSUtils } from '@kit.ArkTS';
import { systemDateTime } from '@kit.BasicServicesKit';
import performance from './Performance.util';

declare class ArkTools {
  static forceFullGC(): void;
}

export default function ArkTsUtilsPerfTest(): void {
  describe('ArkTsUtilsPerfTest', () => {
    const BASE_COUNT = 500;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    // ==================== 1. ArkTSUtils.isSendable (disabled: runtime crash) ====================
    /*
    it('PerformanceTest_Utils_IsSendable_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let testObj: Object = new Object();
        let res: boolean = ArkTSUtils.isSendable(testObj);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = ArkTSUtils.isSendable(testObj);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Utils_IsSendable_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ArkTSUtils', 'isSendable',
          'isSendable(value: Object | null | undefined): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })
    */

    // ==================== 2. AsyncLock constructor ====================

    it('PerformanceTest_Utils_AsyncLockConstructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: ArkTSUtils.locks.AsyncLock = new ArkTSUtils.locks.AsyncLock();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new ArkTSUtils.locks.AsyncLock();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Utils_AsyncLockConstructor_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'AsyncLock', 'constructor',
          'constructor()', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 3. AsyncLock.request ====================

    it('PerformanceTest_Utils_AsyncLockRequest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request('perfTestLock');
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = ArkTSUtils.locks.AsyncLock.request('perfTestLock');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Utils_AsyncLockRequest_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'AsyncLock', 'request',
          'static request(name: string): AsyncLock', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 4. AsyncLock.query ====================

    it('PerformanceTest_Utils_AsyncLockQuery_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        ArkTSUtils.locks.AsyncLock.request('queryPerfLock');
        let res: ArkTSUtils.locks.AsyncLockState = ArkTSUtils.locks.AsyncLock.query('queryPerfLock');
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = ArkTSUtils.locks.AsyncLock.query('queryPerfLock');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Utils_AsyncLockQuery_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'AsyncLock', 'query',
          'static query(name: string): AsyncLockState', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 5. AsyncLock.queryAll ====================

    it('PerformanceTest_Utils_AsyncLockQueryAll_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        ArkTSUtils.locks.AsyncLock.request('queryAllPerfLock');
        let res: ArkTSUtils.locks.AsyncLockState[] = ArkTSUtils.locks.AsyncLock.queryAll();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = ArkTSUtils.locks.AsyncLock.queryAll();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Utils_AsyncLockQueryAll_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'AsyncLock', 'queryAll',
          'static queryAll(): AsyncLockState[]', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 6. AsyncLock.name (Attribute) ====================

    it('PerformanceTest_Utils_AsyncLockName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let lock: ArkTSUtils.locks.AsyncLock = ArkTSUtils.locks.AsyncLock.request('namePerfLock');
        let res: string = lock.name;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = lock.name;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Utils_AsyncLockName_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'AsyncLock', 'name',
          'readonly name: string', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 7. AsyncLockOptions constructor ====================

    it('PerformanceTest_Utils_AsyncLockOptionsConstructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: ArkTSUtils.locks.AsyncLockOptions<void> = new ArkTSUtils.locks.AsyncLockOptions<void>();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new ArkTSUtils.locks.AsyncLockOptions<void>();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Utils_AsyncLockOptionsConstructor_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'AsyncLockOptions', 'constructor',
          'constructor()', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 8. ConditionVariable constructor ====================

    it('PerformanceTest_Utils_ConditionVariableConstructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: ArkTSUtils.locks.ConditionVariable = new ArkTSUtils.locks.ConditionVariable();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new ArkTSUtils.locks.ConditionVariable();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Utils_ConditionVariableConstructor_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ConditionVariable', 'constructor',
          'constructor()', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 9. ConditionVariable.request ====================

    it('PerformanceTest_Utils_ConditionVariableRequest_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: ArkTSUtils.locks.ConditionVariable = ArkTSUtils.locks.ConditionVariable.request('cvPerfTest');
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = ArkTSUtils.locks.ConditionVariable.request('cvPerfTest');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Utils_ConditionVariableRequest_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ConditionVariable', 'request',
          'static request(name: string): ConditionVariable', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 10. ConditionVariable.notifyAll ====================

    it('PerformanceTest_Utils_ConditionVariableNotifyAll_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let cvs: ArkTSUtils.locks.ConditionVariable[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          cvs.push(new ArkTSUtils.locks.ConditionVariable());
        }
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          cvs[i].notifyAll();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = cvs[0];
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Utils_ConditionVariableNotifyAll_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ConditionVariable', 'notifyAll',
          'notifyAll(): void', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 11. ConditionVariable.notifyOne ====================

    it('PerformanceTest_Utils_ConditionVariableNotifyOne_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let cvs: ArkTSUtils.locks.ConditionVariable[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          cvs.push(new ArkTSUtils.locks.ConditionVariable());
        }
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          cvs[i].notifyOne();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = cvs[0];
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Utils_ConditionVariableNotifyOne_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ConditionVariable', 'notifyOne',
          'notifyOne(): void', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 12. ASON.parse ====================

    it('PerformanceTest_Utils_ASONParse_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let jsonText: string = '{"name":"John","age":30}';
        let res = ArkTSUtils.ASON.parse(jsonText);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = ArkTSUtils.ASON.parse(jsonText);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Utils_ASONParse_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ASON', 'parse',
          'parse(text: string, reviver?: Transformer, options?: ParseOptions): ISendable | null', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 13. ASON.stringify ====================

    it('PerformanceTest_Utils_ASONStringify_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let jsonText: string = '{"name":"John","age":30}';
        let obj = ArkTSUtils.ASON.parse(jsonText);
        let res: string = ArkTSUtils.ASON.stringify(obj);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = ArkTSUtils.ASON.stringify(obj);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Utils_ASONStringify_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ASON', 'stringify',
          'stringify(value: Object | null | undefined): string', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 14. SendableLruCache constructor ====================

    it('PerformanceTest_Utils_SendableLruCacheConstructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: ArkTSUtils.SendableLruCache<number, number> = new ArkTSUtils.SendableLruCache<number, number>();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new ArkTSUtils.SendableLruCache<number, number>();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Utils_SendableLruCacheConstructor_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'SendableLruCache', 'constructor',
          'constructor(capacity?: number)', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 15. SendableLruCache.length (Attribute) ====================

    it('PerformanceTest_Utils_SendableLruCacheLength_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let cache: ArkTSUtils.SendableLruCache<number, number> = new ArkTSUtils.SendableLruCache<number, number>();
        cache.put(1, 10);
        let res: number = cache.length;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = cache.length;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Utils_SendableLruCacheLength_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'SendableLruCache', 'length',
          'readonly length: number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 16. SendableLruCache.updateCapacity ====================

    it('PerformanceTest_Utils_SendableLruCacheUpdateCapacity_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let caches: ArkTSUtils.SendableLruCache<number, number>[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          caches.push(new ArkTSUtils.SendableLruCache<number, number>());
        }
        caches[0].updateCapacity(100);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          caches[i].updateCapacity(100);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = caches[0];
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Utils_SendableLruCacheUpdateCapacity_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'SendableLruCache', 'updateCapacity',
          'updateCapacity(newCapacity: number): void', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 17. SendableLruCache.toString ====================

    it('PerformanceTest_Utils_SendableLruCacheToString_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let cache: ArkTSUtils.SendableLruCache<number, number> = new ArkTSUtils.SendableLruCache<number, number>();
        cache.put(1, 10);
        let res: string = cache.toString();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = cache.toString();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Utils_SendableLruCacheToString_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'SendableLruCache', 'toString',
          'toString(): string', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 18. SendableLruCache.getCapacity ====================

    it('PerformanceTest_Utils_SendableLruCacheGetCapacity_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let cache: ArkTSUtils.SendableLruCache<number, number> = new ArkTSUtils.SendableLruCache<number, number>();
        let res: number = cache.getCapacity();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = cache.getCapacity();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Utils_SendableLruCacheGetCapacity_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'SendableLruCache', 'getCapacity',
          'getCapacity(): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 19. SendableLruCache.clear ====================

    it('PerformanceTest_Utils_SendableLruCacheClear_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let caches: ArkTSUtils.SendableLruCache<number, number>[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          let c = new ArkTSUtils.SendableLruCache<number, number>();
          c.put(1, 10);
          caches.push(c);
        }
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          caches[i].clear();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = caches[0];
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Utils_SendableLruCacheClear_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'SendableLruCache', 'clear',
          'clear(): void', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 20. SendableLruCache.getCreateCount ====================

    it('PerformanceTest_Utils_SendableLruCacheGetCreateCount_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let cache: ArkTSUtils.SendableLruCache<number, number> = new ArkTSUtils.SendableLruCache<number, number>();
        cache.put(1, 10);
        let res: number = cache.getCreateCount();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = cache.getCreateCount();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Utils_SendableLruCacheGetCreateCount_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'SendableLruCache', 'getCreateCount',
          'getCreateCount(): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 21. SendableLruCache.getMissCount ====================

    it('PerformanceTest_Utils_SendableLruCacheGetMissCount_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let cache: ArkTSUtils.SendableLruCache<number, number> = new ArkTSUtils.SendableLruCache<number, number>();
        cache.put(1, 10);
        cache.get(2);
        let res: number = cache.getMissCount();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = cache.getMissCount();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Utils_SendableLruCacheGetMissCount_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'SendableLruCache', 'getMissCount',
          'getMissCount(): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 22. SendableLruCache.getRemoveCount ====================

    it('PerformanceTest_Utils_SendableLruCacheGetRemoveCount_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let cache: ArkTSUtils.SendableLruCache<number, number> = new ArkTSUtils.SendableLruCache<number, number>();
        cache.put(1, 10);
        let res: number = cache.getRemoveCount();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = cache.getRemoveCount();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Utils_SendableLruCacheGetRemoveCount_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'SendableLruCache', 'getRemoveCount',
          'getRemoveCount(): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 23. SendableLruCache.getMatchCount ====================

    it('PerformanceTest_Utils_SendableLruCacheGetMatchCount_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let cache: ArkTSUtils.SendableLruCache<number, number> = new ArkTSUtils.SendableLruCache<number, number>();
        cache.put(1, 10);
        cache.get(1);
        let res: number = cache.getMatchCount();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = cache.getMatchCount();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Utils_SendableLruCacheGetMatchCount_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'SendableLruCache', 'getMatchCount',
          'getMatchCount(): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 24. SendableLruCache.getPutCount ====================

    it('PerformanceTest_Utils_SendableLruCacheGetPutCount_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let cache: ArkTSUtils.SendableLruCache<number, number> = new ArkTSUtils.SendableLruCache<number, number>();
        cache.put(1, 10);
        let res: number = cache.getPutCount();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = cache.getPutCount();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Utils_SendableLruCacheGetPutCount_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'SendableLruCache', 'getPutCount',
          'getPutCount(): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 25. SendableLruCache.isEmpty ====================

    it('PerformanceTest_Utils_SendableLruCacheIsEmpty_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let cache: ArkTSUtils.SendableLruCache<number, number> = new ArkTSUtils.SendableLruCache<number, number>();
        let res: boolean = cache.isEmpty();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = cache.isEmpty();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Utils_SendableLruCacheIsEmpty_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'SendableLruCache', 'isEmpty',
          'isEmpty(): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 26. SendableLruCache.get ====================

    it('PerformanceTest_Utils_SendableLruCacheGet_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let cache: ArkTSUtils.SendableLruCache<number, number> = new ArkTSUtils.SendableLruCache<number, number>();
        cache.put(1, 100);
        let res = cache.get(1);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = cache.get(1);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Utils_SendableLruCacheGet_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'SendableLruCache', 'get',
          'get(key: K): V | undefined', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 27. SendableLruCache.put ====================

    it('PerformanceTest_Utils_SendableLruCachePut_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let caches: ArkTSUtils.SendableLruCache<number, number>[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          caches.push(new ArkTSUtils.SendableLruCache<number, number>(BASE_COUNT + 1));
        }
        let res: number = caches[0].put(0, 0);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = caches[i].put(i, i);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Utils_SendableLruCachePut_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'SendableLruCache', 'put',
          'put(key: K, value: V): V', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 28. SendableLruCache.values ====================

    it('PerformanceTest_Utils_SendableLruCacheValues_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let cache: ArkTSUtils.SendableLruCache<number, number> = new ArkTSUtils.SendableLruCache<number, number>();
        cache.put(1, 10);
        cache.put(2, 20);
        let res: number[] = cache.values();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = cache.values();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Utils_SendableLruCacheValues_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'SendableLruCache', 'values',
          'values(): V[]', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 29. SendableLruCache.keys ====================

    it('PerformanceTest_Utils_SendableLruCacheKeys_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let cache: ArkTSUtils.SendableLruCache<number, number> = new ArkTSUtils.SendableLruCache<number, number>();
        cache.put(1, 10);
        cache.put(2, 20);
        let res: number[] = cache.keys();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = cache.keys();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Utils_SendableLruCacheKeys_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'SendableLruCache', 'keys',
          'keys(): K[]', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 30. SendableLruCache.remove ====================

    it('PerformanceTest_Utils_SendableLruCacheRemove_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let caches: ArkTSUtils.SendableLruCache<number, number>[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          let c = new ArkTSUtils.SendableLruCache<number, number>();
          c.put(1, 10);
          caches.push(c);
        }
        let res = caches[0].remove(1);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = caches[i].remove(1);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Utils_SendableLruCacheRemove_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'SendableLruCache', 'remove',
          'remove(key: K): V | undefined', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 31. SendableLruCache.contains ====================

    it('PerformanceTest_Utils_SendableLruCacheContains_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let cache: ArkTSUtils.SendableLruCache<number, number> = new ArkTSUtils.SendableLruCache<number, number>();
        cache.put(1, 10);
        let res: boolean = cache.contains(1);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = cache.contains(1);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Utils_SendableLruCacheContains_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'SendableLruCache', 'contains',
          'contains(key: K): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 32. SendableLruCache.entries ====================

    it('PerformanceTest_Utils_SendableLruCacheEntries_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let cache: ArkTSUtils.SendableLruCache<number, number> = new ArkTSUtils.SendableLruCache<number, number>();
        cache.put(1, 10);
        cache.put(2, 20);
        let res = cache.entries();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = cache.entries();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Utils_SendableLruCacheEntries_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'SendableLruCache', 'entries',
          'entries(): IterableIterator<[K, V]>', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

  })
}
