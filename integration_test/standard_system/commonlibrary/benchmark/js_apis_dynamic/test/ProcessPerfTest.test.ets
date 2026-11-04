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
import { process } from '@kit.ArkTS';
import { systemDateTime } from '@kit.BasicServicesKit';
import performance from './Performance.util';

declare class ArkTools {
  static forceFullGC(): void;
}

export default function ProcessPerfTest(): void {
  describe('ProcessPerfTest', () => {
    const BASE_COUNT = 50000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    // ==================== 1. uid ====================

    it('PerformanceTest_Process_Uid_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: number = process.uid;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = process.uid;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Process_Uid_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'process', 'uid',
          'get uid: number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 2. pid ====================

    it('PerformanceTest_Process_Pid_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: number = process.pid;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = process.pid;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Process_Pid_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'process', 'pid',
          'get pid: number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 3. tid ====================

    it('PerformanceTest_Process_Tid_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: number = process.tid;
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = process.tid;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Process_Tid_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'process', 'tid',
          'get tid: number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 4. isIsolatedProcess ====================

    it('PerformanceTest_Process_IsIsolatedProcess_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: boolean = process.isIsolatedProcess();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = process.isIsolatedProcess();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Process_IsIsolatedProcess_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'process', 'isIsolatedProcess',
          'isIsolatedProcess(): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 5. is64Bit ====================

    it('PerformanceTest_Process_Is64Bit_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: boolean = process.is64Bit();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = process.is64Bit();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Process_Is64Bit_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'process', 'is64Bit',
          'is64Bit(): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 6. getStartRealtime ====================

    it('PerformanceTest_Process_GetStartRealtime_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: number = process.getStartRealtime();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = process.getStartRealtime();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Process_GetStartRealtime_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'process', 'getStartRealtime',
          'getStartRealtime(): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 7. getPastCpuTime ====================

    it('PerformanceTest_Process_GetPastCpuTime_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: number = process.getPastCpuTime();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = process.getPastCpuTime();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Process_GetPastCpuTime_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'process', 'getPastCpuTime',
          'getPastCpuTime(): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 8. uptime ====================

    it('PerformanceTest_Process_Uptime_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: number = process.uptime();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = process.uptime();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Process_Uptime_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'process', 'uptime',
          'uptime(): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 9. ProcessManager constructor ====================

    it('PerformanceTest_ProcessManager_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res: process.ProcessManager = new process.ProcessManager();
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new process.ProcessManager();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ProcessManager_Constructor_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ProcessManager', 'constructor',
          'constructor()', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 10. ProcessManager.isAppUid ====================

    it('PerformanceTest_ProcessManager_IsAppUid_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let pro = new process.ProcessManager();
        let uid = process.uid;
        let res: boolean = pro.isAppUid(uid);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = pro.isAppUid(uid);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ProcessManager_IsAppUid_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ProcessManager', 'isAppUid',
          'isAppUid(v: number): boolean', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 11. ProcessManager.getUidForName ====================

    it('PerformanceTest_ProcessManager_GetUidForName_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let pro = new process.ProcessManager();
        let res: number = pro.getUidForName("root");
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = pro.getUidForName("root");
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ProcessManager_GetUidForName_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ProcessManager', 'getUidForName',
          'getUidForName(v: string): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 12. ProcessManager.getThreadPriority ====================

    it('PerformanceTest_ProcessManager_GetThreadPriority_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let pro = new process.ProcessManager();
        let tid = process.tid;
        let res: number = pro.getThreadPriority(tid);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = pro.getThreadPriority(tid);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ProcessManager_GetThreadPriority_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ProcessManager', 'getThreadPriority',
          'getThreadPriority(v: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 13. ProcessManager.getSystemConfig ====================

    it('PerformanceTest_ProcessManager_GetSystemConfig_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let pro = new process.ProcessManager();
        // _SC_ARG_MAX = 0
        let res: number = pro.getSystemConfig(0);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = pro.getSystemConfig(0);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ProcessManager_GetSystemConfig_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ProcessManager', 'getSystemConfig',
          'getSystemConfig(name: number): number', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 14. ProcessManager.getEnvironmentVar ====================

    it('PerformanceTest_ProcessManager_GetEnvironmentVar_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let pro = new process.ProcessManager();
        // PATH must exist in the runtime environment
        let res: string = pro.getEnvironmentVar("PATH");
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = pro.getEnvironmentVar("PATH");
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ProcessManager_GetEnvironmentVar_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ProcessManager', 'getEnvironmentVar',
          'getEnvironmentVar(name: string): string', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

  })
}
