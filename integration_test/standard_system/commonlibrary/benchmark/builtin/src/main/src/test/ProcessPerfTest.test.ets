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

const CHILD_COMMAND: string = '/system/bin/sh -c "echo arkts"';
const CHILD_ERROR_COMMAND: string = '/system/bin/sh -c "echo arkts_error 1>&2"';
const CHILD_SLEEP_COMMAND: string = '/system/bin/sh -c "sleep 1"';
const PROCESS_BASE_COUNT: int = 20;

function buildOptions(): StdProcess.ConditionType {
  let options = new StdProcess.ConditionType();
  options.timeout = 1000;
  options.killSignal = 'SIGTERM';
  options.maxBuffer = 4096;
  return options;
}

function createChildList(command: string, count: int): StdProcess.ChildProcess[] {
  let childList: StdProcess.ChildProcess[] = new Array<StdProcess.ChildProcess>();
  for (let i = 0; i < count; i++) {
    childList.push(StdProcess.runCmd(command, buildOptions()));
  }
  return childList;
}

const uncaughtListener: StdProcess.UncaughtErrorListener = (error: Object): void => {
};

export default function ProcessPerfTest(): void {
  describe('ProcessPerfTest', () => {
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

    it('PerformanceTest_ProcessManager_Constructor_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let result: StdProcess.ProcessManager = new StdProcess.ProcessManager();
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = new StdProcess.ProcessManager();
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ProcessManager_Constructor_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'ProcessManager',
          'constructor',
          'constructor()',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_ProcessManager_IsAppUid_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let manager: StdProcess.ProcessManager = new StdProcess.ProcessManager();
        let uidValue: int = StdProcess.uid();
        let result: boolean = manager.isAppUid(uidValue);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT_BIG; i++) {
          result = manager.isAppUid(uidValue);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_BIG;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ProcessManager_IsAppUid_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'ProcessManager',
          'isAppUid',
          'isAppUid(uid: int): boolean',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_ProcessManager_GetUidForName_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let manager: StdProcess.ProcessManager = new StdProcess.ProcessManager();
        let result: int = manager.getUidForName('root');
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = manager.getUidForName('root');
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ProcessManager_GetUidForName_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'ProcessManager',
          'getUidForName',
          'getUidForName(v: string): int',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_ProcessManager_GetThreadPriority_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let manager: StdProcess.ProcessManager = new StdProcess.ProcessManager();
        let tidValue: int = StdProcess.tid();
        let result: int = manager.getThreadPriority(tidValue);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = manager.getThreadPriority(tidValue);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ProcessManager_GetThreadPriority_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'ProcessManager',
          'getThreadPriority',
          'getThreadPriority(v: int): int',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_ProcessManager_GetSystemConfig_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let manager: StdProcess.ProcessManager = new StdProcess.ProcessManager();
        let result: long = manager.getSystemConfig(0);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = manager.getSystemConfig(0);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ProcessManager_GetSystemConfig_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'ProcessManager',
          'getSystemConfig',
          'getSystemConfig(name: int): long',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_ProcessManager_GetEnvironmentVar_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let manager: StdProcess.ProcessManager = new StdProcess.ProcessManager();
        let result: string = manager.getEnvironmentVar('PATH');
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = manager.getEnvironmentVar('PATH');
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ProcessManager_GetEnvironmentVar_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'ProcessManager',
          'getEnvironmentVar',
          'getEnvironmentVar(name: string): string',
          arkTsAveragedTime
        );
      });

    /*
     * 注释原因：
     * ProcessManager.exit(code: int) 会直接结束当前测试进程，
     * 执行后会中断整套性能用例，导致后续 case 无法继续执行，
     * 同时也可能影响性能结果文件的完整生成。
     * 因此这里保留测试代码，但先注释掉，避免影响整套用例执行。
     */
    /*
    it('PerformanceTest_ProcessManager_Exit_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let manager: StdProcess.ProcessManager = new StdProcess.ProcessManager();
        let Stime = new Date().getTime();

        for (let i = 0; i < 1; i++) {
          manager.exit(0);
        }

        let Dtime = new Date().getTime() - Stime;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ProcessManager_Exit_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'ProcessManager',
          'exit',
          'exit(code: int): void',
          arkTsAveragedTime
        );
      });
    */

    //并发格式不规范
    it('PerformanceTest_ProcessManager_Kill_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let manager: StdProcess.ProcessManager = new StdProcess.ProcessManager();
        let warmupChild: StdProcess.ChildProcess = StdProcess.runCmd(CHILD_SLEEP_COMMAND, buildOptions());
        let result: boolean = manager.kill(15, warmupChild.pid);
        warmupChild.wait();
        warmupChild.close();

        let childList: StdProcess.ChildProcess[] = createChildList(CHILD_SLEEP_COMMAND, PROCESS_BASE_COUNT);
        let Stime = new Date().getTime();

        for (let i = 0; i < PROCESS_BASE_COUNT; i++) {
          result = manager.kill(15, childList[i].pid);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / PROCESS_BASE_COUNT;

        for (let i = 0; i < PROCESS_BASE_COUNT; i++) {
          childList[i].wait();
          childList[i].close();
        }

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ProcessManager_Kill_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'ProcessManager',
          'kill',
          'kill(signal: int, pid: int): boolean',
          arkTsAveragedTime
        );
      });

    //并发格式不规范
    it('PerformanceTest_ChildProcess_Wait_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let warmupChild: StdProcess.ChildProcess = StdProcess.runCmd(CHILD_COMMAND, buildOptions());
        let result: Any = warmupChild.wait();
        warmupChild.close();

        let childList: StdProcess.ChildProcess[] = createChildList(CHILD_COMMAND, PROCESS_BASE_COUNT);
        let Stime = new Date().getTime();

        for (let i = 0; i < PROCESS_BASE_COUNT; i++) {
          result = childList[i].wait();
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / PROCESS_BASE_COUNT;

        for (let i = 0; i < PROCESS_BASE_COUNT; i++) {
          childList[i].close();
        }

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ChildProcess_Wait_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'ChildProcess',
          'wait',
          'wait(): Promise<int>',
          arkTsAveragedTime
        );
      });

    //并发格式不规范
    it('PerformanceTest_ChildProcess_GetOutput_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let warmupChild: StdProcess.ChildProcess = StdProcess.runCmd(CHILD_COMMAND, buildOptions());
        warmupChild.wait();
        let result: Any = warmupChild.getOutput();
        warmupChild.close();

        let childList: StdProcess.ChildProcess[] = createChildList(CHILD_COMMAND, PROCESS_BASE_COUNT);

        for (let i = 0; i < PROCESS_BASE_COUNT; i++) {
          result = childList[i].wait();
        }

        let Stime = new Date().getTime();

        for (let i = 0; i < PROCESS_BASE_COUNT; i++) {
          result = childList[i].getOutput();
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / PROCESS_BASE_COUNT;

        for (let i = 0; i < PROCESS_BASE_COUNT; i++) {
          childList[i].close();
        }

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ChildProcess_GetOutput_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'ChildProcess',
          'getOutput',
          'getOutput(): Promise<Uint8Array>',
          arkTsAveragedTime
        );
      });

    //并发格式不规范
    it('PerformanceTest_ChildProcess_GetErrorOutput_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let warmupChild: StdProcess.ChildProcess = StdProcess.runCmd(CHILD_ERROR_COMMAND, buildOptions());
        warmupChild.wait();
        let result: Any = warmupChild.getErrorOutput();
        warmupChild.close();

        let childList: StdProcess.ChildProcess[] = createChildList(CHILD_ERROR_COMMAND, PROCESS_BASE_COUNT);

        for (let i = 0; i < PROCESS_BASE_COUNT; i++) {
          result = childList[i].wait();
        }

        let Stime = new Date().getTime();

        for (let i = 0; i < PROCESS_BASE_COUNT; i++) {
          result = childList[i].getErrorOutput();
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / PROCESS_BASE_COUNT;

        for (let i = 0; i < PROCESS_BASE_COUNT; i++) {
          childList[i].close();
        }

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ChildProcess_GetErrorOutput_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'ChildProcess',
          'getErrorOutput',
          'getErrorOutput(): Promise<Uint8Array>',
          arkTsAveragedTime
        );
      });

    //并发格式不规范
    it('PerformanceTest_ChildProcess_Close_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let childList: StdProcess.ChildProcess[] = createChildList(CHILD_COMMAND, PROCESS_BASE_COUNT);
        let result: Any = undefined;

        for (let i = 0; i < PROCESS_BASE_COUNT; i++) {
          result = childList[i].wait();
        }

        let Stime = new Date().getTime();

        for (let i = 0; i < PROCESS_BASE_COUNT; i++) {
          childList[i].close();
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = childList[0];
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / PROCESS_BASE_COUNT;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ChildProcess_Close_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'ChildProcess',
          'close',
          'close(): void',
          arkTsAveragedTime
        );
      });

    //并发格式不规范
    it('PerformanceTest_ChildProcess_Kill_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let warmupChild: StdProcess.ChildProcess = StdProcess.runCmd(CHILD_SLEEP_COMMAND, buildOptions());
        warmupChild.kill('SIGTERM');
        warmupChild.wait();
        warmupChild.close();

        let childList: StdProcess.ChildProcess[] = createChildList(CHILD_SLEEP_COMMAND, PROCESS_BASE_COUNT);
        let Stime = new Date().getTime();

        for (let i = 0; i < PROCESS_BASE_COUNT; i++) {
          childList[i].kill('SIGTERM');
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = childList[0];
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / PROCESS_BASE_COUNT;

        for (let i = 0; i < PROCESS_BASE_COUNT; i++) {
          childList[i].wait();
          childList[i].close();
        }

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ChildProcess_Kill_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'ChildProcess',
          'kill',
          'kill(signal: int | string): void',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_StdProcess_Egid_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let result: int = StdProcess.egid();
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT_BIG; i++) {
          result = StdProcess.egid();
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_BIG;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_StdProcess_Egid_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'StdProcess',
          'egid',
          'egid(): int',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_StdProcess_Euid_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let result: int = StdProcess.euid();
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT_BIG; i++) {
          result = StdProcess.euid();
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_BIG;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_StdProcess_Euid_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'StdProcess',
          'euid',
          'euid(): int',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_StdProcess_Gid_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let result: int = StdProcess.gid();
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT_BIG; i++) {
          result = StdProcess.gid();
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_BIG;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_StdProcess_Gid_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'StdProcess',
          'gid',
          'gid(): int',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_StdProcess_Uid_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let result: int = StdProcess.uid();
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT_BIG; i++) {
          result = StdProcess.uid();
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_BIG;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_StdProcess_Uid_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'StdProcess',
          'uid',
          'uid(): int',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_StdProcess_Groups_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let result: Any = StdProcess.groups();
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = StdProcess.groups();
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_StdProcess_Groups_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'StdProcess',
          'groups',
          'groups(): int[]',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_StdProcess_Pid_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let result: int = StdProcess.pid();
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT_BIG; i++) {
          result = StdProcess.pid();
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_BIG;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_StdProcess_Pid_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'StdProcess',
          'pid',
          'pid(): int',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_StdProcess_Ppid_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let result: int = StdProcess.ppid();
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT_BIG; i++) {
          result = StdProcess.ppid();
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_BIG;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_StdProcess_Ppid_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'StdProcess',
          'ppid',
          'ppid(): int',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_StdProcess_Tid_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let result: int = StdProcess.tid();
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT_BIG; i++) {
          result = StdProcess.tid();
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_BIG;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_StdProcess_Tid_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'StdProcess',
          'tid',
          'tid(): int',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_StdProcess_IsIsolatedProcess_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let result: boolean = StdProcess.isIsolatedProcess();
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT_BIG; i++) {
          result = StdProcess.isIsolatedProcess();
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_BIG;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_StdProcess_IsIsolatedProcess_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'StdProcess',
          'isIsolatedProcess',
          'isIsolatedProcess(): boolean',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_StdProcess_Is64Bit_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let result: boolean = StdProcess.is64Bit();
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT_BIG; i++) {
          result = StdProcess.is64Bit();
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_BIG;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_StdProcess_Is64Bit_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'StdProcess',
          'is64Bit',
          'is64Bit(): boolean',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_StdProcess_GetStartRealtime_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let result: long = StdProcess.getStartRealtime();
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT_BIG; i++) {
          result = StdProcess.getStartRealtime();
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_BIG;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_StdProcess_GetStartRealtime_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'StdProcess',
          'getStartRealtime',
          'getStartRealtime(): long',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_StdProcess_GetPastCpuTime_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let result: long = StdProcess.getPastCpuTime();
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT_BIG; i++) {
          result = StdProcess.getPastCpuTime();
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_BIG;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_StdProcess_GetPastCpuTime_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'StdProcess',
          'getPastCpuTime',
          'getPastCpuTime(): long',
          arkTsAveragedTime
        );
      });

    //并发格式不规范
    it('PerformanceTest_StdProcess_RunCmd_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let options: StdProcess.ConditionType = buildOptions();

        let warmupChild: StdProcess.ChildProcess = StdProcess.runCmd(CHILD_COMMAND, options);
        warmupChild.wait();
        warmupChild.close();

        let childList: StdProcess.ChildProcess[] = new Array<StdProcess.ChildProcess>();
        let Stime = new Date().getTime();

        for (let i = 0; i < PROCESS_BASE_COUNT; i++) {
          childList.push(StdProcess.runCmd(CHILD_COMMAND, options));
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = childList[PROCESS_BASE_COUNT - 1];
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / PROCESS_BASE_COUNT;

        for (let i = 0; i < PROCESS_BASE_COUNT; i++) {
          childList[i].wait();
          childList[i].close();
        }

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_StdProcess_RunCmd_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'StdProcess',
          'runCmd',
          'runCmd(command: string, options?: ConditionType): ChildProcess',
          arkTsAveragedTime
        );
      });

    /*
     * 注释原因：
     * StdProcess.abort() 会直接中止当前测试进程，
     * 执行后会导致整套性能用例立即退出，后续 case 无法继续执行，
     * 同时也可能影响性能结果文件的完整生成。
     * 因此这里保留测试代码，但先注释掉，避免影响整套用例执行。
     */
    /*
    it('PerformanceTest_StdProcess_Abort_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let Stime = new Date().getTime();

        for (let i = 0; i < 1; i++) {
          StdProcess.abort();
        }

        let Dtime = new Date().getTime() - Stime;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_StdProcess_Abort_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'StdProcess',
          'abort',
          'abort(): void',
          arkTsAveragedTime
        );
      });
    */

    it('PerformanceTest_StdProcess_On_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let res = StdProcess.on("uncaughtError", uncaughtListener);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          res = StdProcess.on("uncaughtError", uncaughtListener);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        // StdProcess.off("uncaughtError");
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_StdProcess_On_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'StdProcess',
          'on',
          'on(type: "unhandledPromiseRejection" | "uncaughtError", listener: EventListener): void',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_StdProcess_Off_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        StdProcess.on("uncaughtError", uncaughtListener);
        let result: boolean = StdProcess.off("uncaughtError");
        StdProcess.on("uncaughtError", uncaughtListener);
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = StdProcess.off("uncaughtError");
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_StdProcess_Off_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'StdProcess',
          'off',
          'off(type: "unhandledPromiseRejection" | "uncaughtError", listener?: RejectedObjectListener): boolean',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_StdProcess_Cwd_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let result: string = StdProcess.cwd();
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = StdProcess.cwd();
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_StdProcess_Cwd_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'StdProcess',
          'cwd',
          'cwd(): string',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_StdProcess_Chdir_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let currentPath: string = StdProcess.cwd();
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          StdProcess.chdir(currentPath);
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = currentPath;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_StdProcess_Chdir_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'StdProcess',
          'chdir',
          'chdir(path: string): void',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_StdProcess_Uptime_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let result: long = StdProcess.uptime();
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT_BIG; i++) {
          result = StdProcess.uptime();
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_BIG;

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_StdProcess_Uptime_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'StdProcess',
          'uptime',
          'uptime(): long',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_ChildProcess_Pid_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let warmupChild: StdProcess.ChildProcess = StdProcess.runCmd(CHILD_COMMAND, buildOptions());
        warmupChild.wait();
        warmupChild.close();

        let child: StdProcess.ChildProcess = StdProcess.runCmd(CHILD_COMMAND, buildOptions());
        child.wait();
        let result: int = child.pid;
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = child.pid;
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;

        child.close();

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ChildProcess_Pid_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'ChildProcess',
          'pid',
          'readonly pid: int',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_ChildProcess_Ppid_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let warmupChild: StdProcess.ChildProcess = StdProcess.runCmd(CHILD_COMMAND, buildOptions());
        warmupChild.wait();
        warmupChild.close();

        let child: StdProcess.ChildProcess = StdProcess.runCmd(CHILD_COMMAND, buildOptions());
        child.wait();
        let result: int = child.ppid;
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = child.ppid;
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;

        child.close();

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ChildProcess_Ppid_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'ChildProcess',
          'ppid',
          'readonly ppid: int',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_ChildProcess_ExitCode_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let warmupChild: StdProcess.ChildProcess = StdProcess.runCmd(CHILD_COMMAND, buildOptions());
        warmupChild.wait();
        warmupChild.close();

        let child: StdProcess.ChildProcess = StdProcess.runCmd(CHILD_COMMAND, buildOptions());
        child.wait();
        let result: int = child.exitCode;
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = child.exitCode;
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;

        child.close();

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ChildProcess_ExitCode_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'ChildProcess',
          'exitCode',
          'readonly exitCode: int',
          arkTsAveragedTime
        );
      });

    it('PerformanceTest_ChildProcess_Killed_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let warmupChild: StdProcess.ChildProcess = StdProcess.runCmd(CHILD_COMMAND, buildOptions());
        warmupChild.wait();
        warmupChild.close();

        let child: StdProcess.ChildProcess = StdProcess.runCmd(CHILD_SLEEP_COMMAND, buildOptions());
        child.kill('SIGTERM');
        child.wait();
        let result: boolean = child.killed;
        let Stime = new Date().getTime();

        for (let i = 0; i < BASE_COUNT; i++) {
          result = child.killed;
        }

        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;

        child.close();

        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ChildProcess_Killed_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt(
          'std.core',
          'ChildProcess',
          'killed',
          'readonly killed: boolean',
          arkTsAveragedTime
        );
      });
  })
}