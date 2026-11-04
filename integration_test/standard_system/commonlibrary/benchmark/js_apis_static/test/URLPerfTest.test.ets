'use static'
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
} from "../../../hypium/index";
import performance from './Performance.util';
import { url } from '@kit.ArkTS';

export default function URLPerfTest(): void {
  describe('URLPerfTest', (): void => {
    const BASE_COUNT = 1000;

    beforeEach((): void => {
      let ret = GC.startGC(GC.Cause.FULL, true);
      GC.waitForFinishGC(ret);
      let ret1 = GC.startGC(GC.Cause.FULL, true);
      GC.waitForFinishGC(ret1);
    });

    afterAll((): void => {
      performance.save('apiPerformance.txt');
    });

    it('URLPerfTest_string_get_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let params = new url.URLParams('?foo=1&bar=2&baz=3');
      let res = params.get('foo');
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = params.get('bar');
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsURLPerfTest arkTsAveragedTime URLPerfTest_string_get_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.url', 'URLParams', 'get',
        'get(name: string): string | null', arkTsAveragedTime);
    });

    it('URLPerfTest_string_has_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let params = new url.URLParams('?foo=1&bar=2&baz=3');
      let res = params.has('foo');
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = params.has('bar');
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsURLTest arkTsAveragedTime URLPerfTest_string_has_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.url', 'URLParams', 'has',
        'has(name: string): boolean', arkTsAveragedTime);
    });

    it('URLPerfTest_void_append_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let params = new url.URLParams('?fod=1&bard=2');
      params.append('fod', '3');
      let res = params;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        params.append('fod', '3');
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsURLPerfTest arkTsAveragedTime URLPerfTest_void_append_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.url', 'URLParams', 'append',
        'append(name: string, value: string): void', arkTsAveragedTime);
    });

    it('URLPerfTest_void_delete_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let paramsSet: url.URLParams[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        paramsSet.push(new url.URLParams('?fod=1&bard=2'));
      }
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        paramsSet[i].delete('fod');
      }
      let Dtime = Chrono.nanoNow() - Stime;
      const res1 = paramsSet[0];
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsURLPerfTest arkTsAveragedTime URLPerfTest_void_delete_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.url', 'URLParams', 'delete',
        'delete(name: string): void', arkTsAveragedTime);
    });

    it('URLPerfTest_string[]_getAll_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let params = new url.URLParams('?fod=1&bard=2');
      params.append('fod', '3');
      let res = params.getAll('fod');
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = params.getAll('fod');
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsURLPerfTest arkTsAveragedTime URLPerfTest_string[]_getAll_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.url', 'URLParams', 'getAll',
        'getAll(name: string): string[]', arkTsAveragedTime);
    });

    it('URLPerfTest_void_forEach_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let params = new url.URLParams('?fod=1&bard=2');
      let callback = (value: string, key: string, searchParams: url.URLParams): void => {};
      let res: void = params.forEach(callback);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = params.forEach(callback);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsURLPerfTest arkTsAveragedTime URLPerfTest_void_forEach_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.url', 'URLParams', 'forEach',
        'forEach(callbackFn: (value: string, key: string, searchParams: URLParams) => void, thisArg?: Object): void', arkTsAveragedTime);
    });
  });
}
