/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
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

/* AbcFile 性能测试 - 注释原因：AbcFile 是 @InternalAPI，无法在 entry 模块使用
import performance from './Performance.util';

export default function AbcFilePerfTest(): void {
  describe('AbcFilePerfTest', () => {
    // AbcFile.loadAbcFile --AbcFile.loadFromMemory --AbcFile.loadClass --AbcFile.getFilename
    const BASE_COUNT_MEDIUM = 1000;
    const UNIT_TIME = 1000000;

    let runtimeLinker: RuntimeLinker=new AbcRuntimeLinker(getBootRuntimeLinker(), ['/data/test.abc']);

    beforeEach(() => {
      let ret = GC.startGC(GC.Cause.FULL, true);
      GC.waitForFinishGC(ret);
      let ret1 = GC.startGC(GC.Cause.FULL, true);
      GC.waitForFinishGC(ret1);

    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('PerformanceTest_AbcFile_loadAbcFile_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = AbcFile.loadAbcFile(runtimeLinker, '/data/test.abc');
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT_MEDIUM; i++) {
        res = AbcFile.loadAbcFile(runtimeLinker, ['/data/test.abc']);
      }
      let Dtime = new Date().getTime() - Stime;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_MEDIUM;
      let res1 = res;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AbcFile_loadAbcFile_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'AbcFile', 'loadAbcFile',
        'static loadAbcFile(runtimeLinker: RuntimeLinker, path: string): AbcFile', arkTsAveragedTime);
    })

    it('PerformanceTest_AbcFile_loadFromMemory_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rawData: FixedArray<byte> = [0x41, 0x42, 0x43];
      let res = AbcFile.loadFromMemory(runtimeLinker, rawData);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT_MEDIUM; i++) {
        res = AbcFile.loadFromMemory(runtimeLinker, rawData);
      }
      let Dtime = new Date().getTime() - Stime;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_MEDIUM;
      let res1 = res;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AbcFile_loadFromMemory_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'AbcFile', 'loadFromMemory',
        'static loadFromMemory(runtimeLinker: RuntimeLinker, rawFile: FixedArray<byte>): AbcFile', arkTsAveragedTime);
    })

    it('PerformanceTest_AbcFile_loadClass_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fileInstance = AbcFile.loadAbcFile(runtimeLinker, '/data/test.abc');
      let res: Class | undefined = fileInstance.loadClass(runtimeLinker, 'TestClass', true);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT_MEDIUM; i++) {
        res = fileInstance.loadClass(runtimeLinker, 'TestClass', true);
      }
      let Dtime = new Date().getTime() - Stime;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_MEDIUM;
      let res1 = res;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AbcFile_loadClass_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'AbcFile', 'loadClass',
        'loadClass(runtimeLinker: RuntimeLinker, clsName: string, init: boolean): Class | undefined', arkTsAveragedTime);
    })

    it('PerformanceTest_AbcFile_getFilename_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fileInstance = AbcFile.loadAbcFile(runtimeLinker,'/data/test.abc' );
      let res: string = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT_MEDIUM; i++) {
        res = fileInstance.getFilename();
      }
      let Dtime = new Date().getTime() - Stime;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT_MEDIUM;
      let res1 = res;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_AbcFile_getFilename_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'AbcFile', 'getFilename',
        'getFilename(): string', arkTsAveragedTime);
    })

  })
}
*/
