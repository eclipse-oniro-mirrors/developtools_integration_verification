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
import { uri } from '@kit.ArkTS';

export default function UriPerfTest(): void {
  describe('UriTest', (): void => {
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

    it('UriPerfTest_string_checkIsAbsolute_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let testUri = new uri.URI("https://username:password@host:8080/directory/file?foo=1&bar=2#fragment");
      let res = testUri.checkIsAbsolute();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testUri.checkIsAbsolute();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsUriPerfTest arkTsAveragedTime UriPerfTest_string_checkIsAbsolute_0100: ' + arkTsAveragedTime
        + 'ns');
      performance.apiWithClassAndKeywordTxt('std.uri', 'uri', 'checkIsAbsolute',
        'checkIsAbsolute(): boolean', arkTsAveragedTime);
    });

    it('UriPerfTest_string_normalize_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let testUri = new uri.URI("https://username:password@host:8080/directory/../file?foo=1&bar=2#fragment");
      let res = testUri.normalize();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testUri.normalize();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsUriPerfTest arkTsAveragedTime UriPerfTest_string_normalize_0200: ' + arkTsAveragedTime
        + 'ns');
      performance.apiWithClassAndKeywordTxt('std.uri', 'uri', 'normalize',
        'normalize(): URI', arkTsAveragedTime);
    });

    it('UriPerfTest_boolean_equalsTo_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let testUri = new uri.URI("https://username:password@host:8080/directory/file?foo=1&bar=2#fragment");
      let otherUri = new uri.URI("https://username:password@host:8080/directory/file?foo=1&bar=2#fragment");
      let res = testUri.equalsTo(otherUri);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testUri.equalsTo(otherUri);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsUriPerfTest arkTsAveragedTime UriPerfTest_boolean_equalsTo_0300: ' + arkTsAveragedTime
        + 'ns');
      performance.apiWithClassAndKeywordTxt('std.uri', 'uri', 'equalsTo',
        'equalsTo(other: URI): boolean', arkTsAveragedTime);
    });

    it('UriPerfTest_Object_getScheme_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let testUri = new uri.URI("https://username:password@host:8080/directory/file?foo=1&bar=2#fragment");
      let res = testUri.scheme;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testUri.scheme;
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsUriPerfTest arkTsAveragedTime UriPerfTest_Object_getScheme_0400: ' + arkTsAveragedTime
        + 'ns');
      performance.apiWithClassAndKeywordTxt('std.uri', 'uri', 'scheme',
        'scheme: string', arkTsAveragedTime);
    });

    it('UriPerfTest_Object_getHost_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let testUri = new uri.URI("https://username:password@host:8080/directory/file?foo=1&bar=2#fragment");
      let res = testUri.host;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testUri.host;
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsUriPerfTest arkTsAveragedTime UriPerfTest_Object_getHost_0500: ' + arkTsAveragedTime
        + 'ns');
      performance.apiWithClassAndKeywordTxt('std.uri', 'uri', 'host',
        'host: string', arkTsAveragedTime);
    });

    it('UriPerfTest_string_getPort_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let testUri = new uri.URI("https://username:password@host:8080/directory/file?foo=1&bar=2#fragment");
      let res = testUri.port;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testUri.port;
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsUriPerfTest arkTsAveragedTime UriPerfTest_string_getPort_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.uri', 'uri', 'port',
        'port: string', arkTsAveragedTime);
    });

    it('UriPerfTest_string_getPath_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let testUri = new uri.URI("https://username:password@host:8080/directory/file?foo=1&bar=2#fragment");
      let res = testUri.path;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testUri.path;
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsUriPerfTest arkTsAveragedTime UriPerfTest_string_getPath_0700: ' + arkTsAveragedTime
        + 'ns');
      performance.apiWithClassAndKeywordTxt('std.uri', 'uri', 'path',
        'path: string', arkTsAveragedTime);
    });

    it('UriPerfTest_string_getQuery_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let testUri = new uri.URI("https://username:password@host:8080/directory/file?foo=1&bar=2#fragment");
      let res = testUri.query;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testUri.query;
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsUriPerfTest arkTsAveragedTime UriPerfTest_string_getQuery_0800: ' + arkTsAveragedTime
        + 'ns');
      performance.apiWithClassAndKeywordTxt('std.uri', 'uri', 'query',
        'query: string', arkTsAveragedTime);
    });

    it('UriPerfTest_string_getFragment_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let testUri = new uri.URI("https://username:password@host:8080/directory/file?foo=1&bar=2#fragment");
      let res = testUri.fragment;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testUri.fragment;
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsUriPerfTest arkTsAveragedTime UriPerfTest_string_getFragment_0900: ' + arkTsAveragedTime
        + 'ns');
      performance.apiWithClassAndKeywordTxt('std.uri', 'uri', 'fragment',
        'fragment: string', arkTsAveragedTime);
    });

    it('UriPerfTest_string_getAuthority_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let testUri = new uri.URI("https://username:password@host:8080/directory/file?foo=1&bar=2#fragment");
      let res = testUri.authority;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testUri.authority;
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsUriPerfTest arkTsAveragedTime UriPerfTest_string_getAuthority_1000: ' + arkTsAveragedTime
        + 'ns');
      performance.apiWithClassAndKeywordTxt('std.uri', 'uri', 'authority',
        'authority: string', arkTsAveragedTime);
    });

    it('UriPerfTest_string_getUserInfo_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let testUri = new uri.URI("https://username:password@host:8080/directory/file?foo=1&bar=2#fragment");
      let res = testUri.userInfo;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testUri.userInfo;
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsUriPerfTest arkTsAveragedTime UriPerfTest_string_getUserInfo_1100: ' + arkTsAveragedTime
        + 'ns');
      performance.apiWithClassAndKeywordTxt('std.uri', 'uri', 'userInfo',
        'userInfo: string', arkTsAveragedTime);
    });

    it('UriPerfTest_string_getSSP_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let testUri = new uri.URI("https://username:password@host:8080/directory/file?foo=1&bar=2#fragment");
      let res = testUri.ssp;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testUri.ssp;
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsUriPerfTest arkTsAveragedTime UriPerfTest_string_getSSP_1200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.uri', 'uri', 'ssp',
        'ssp: string', arkTsAveragedTime);
    });

    it('UriPerfTest_string_getEncodedUserInfo_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let testUri = new uri.URI("https://username:my+name@host:8080/directory/my+file?foo=1&bar=2#fragment");
      let res = testUri.encodedUserInfo;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = testUri.encodedUserInfo;
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsUriPerfTest arkTsAveragedTime UriPerfTest_string_getEncodedUserInfo_1300: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.uri', 'uri', 'encodedUserInfo',
        'encodedUserInfo: string', arkTsAveragedTime);
    });
  });
}
