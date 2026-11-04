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
  describe, it, TestType, Size, Level, beforeEach, afterAll, expect
} from "@ohos/hypium";
import performance from './Performance.util';
import { uri } from '@kit.ArkTS';
import { systemDateTime } from "@kit.BasicServicesKit";

declare class ArkTools {
  static forceFullGC(): void;
}

export default function UriPerfTest(): void {
  describe('UriPerfTest', () => {
    const BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('UriPerfTest_URI_constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res = new uri.URI('https://username:password@host:8080');
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new uri.URI('https://username:password@host:8080');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info(
          'arkTsUriPerfTest arkTsAveragedTime UriPerfTest_URI_constructor_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('@kit.ArkTS', 'uri', 'constructor',
          'constructor(uri: string);', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UriPerfTest_string_toString_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let uriObj = new uri.URI('https://username:password@host:8080/directory/file?ab=pppppp#qwer da');
        let res = uriObj.toString();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = uriObj.toString();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info(
          'arkTsUriPerfTest arkTsAveragedTime UriPerfTest_string_toString_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('@kit.ArkTS', 'uri', 'toString',
          'toString(): string;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UriPerfTest_boolean_equalsTo_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let uriInstance = new uri.URI('https://username:password@host:8080/directory/file?query=pppppp#qwer=da');
        let uriInstance1 = new uri.URI('https://username:password@host:8080/directory/file?query=pppppp#qwer=da');
        let res = false;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = uriInstance.equalsTo(uriInstance1);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsUriPerfTest arkTsAveragedTime UriPerfTest_boolean_equalsTo_0300: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('@kit.ArkTS', 'uri', 'equalsTo',
          'equalsTo(other: URI): boolean;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UriPerfTest_boolean_checkIsAbsolute_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let uriInstance = new uri.URI('https://username:password@www.qwer.com:8080?query=pppppp');
        let res = false;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = uriInstance.checkIsAbsolute();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info(
          'arkTsUriPerfTest arkTsAveragedTime UriPerfTest_boolean_checkIsAbsolute_0400: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('@kit.ArkTS', 'uri', 'checkIsAbsolute',
          'checkIsAbsolute(): boolean;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UriPerfTest_URI_normalize_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let uriInstance =
          new uri.URI('https://username:password@www.qwer.com:8080/path/path1/../path2/./path3?query=pppppp');
        let res = uriInstance.normalize();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = uriInstance.normalize();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsUriPerfTest arkTsAveragedTime UriPerfTest_URI_normalize_0500: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('@kit.ArkTS', 'uri', 'normalize',
          'normalize(): URI;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UriPerfTest_boolean_checkRelative_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let uriInstance = new uri.URI("https://username:password@www.qwer.com:8080?query=p");
        let res = true;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = uriInstance.checkRelative();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info(
          'arkTsUriPerfTest arkTsAveragedTime UriPerfTest_boolean_checkRelative_0600: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('@kit.ArkTS', 'uri', 'checkRelative',
          'checkRelative(): boolean;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UriPerfTest_boolean_checkOpaque_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let uriInstance = new uri.URI("http://www.test.com/images/pic.jpg");
        let res = true;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = uriInstance.checkOpaque();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info(
          'arkTsUriPerfTest arkTsAveragedTime UriPerfTest_boolean_checkOpaque_0700: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('@kit.ArkTS', 'uri', 'checkOpaque',
          'checkOpaque(): boolean;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UriPerfTest_boolean_checkHierarchical_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let uriInstance = new uri.URI("http://www.test.com/images/pic.jpg");
        let res = false;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = uriInstance.checkHierarchical();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info(
          'arkTsUriPerfTest arkTsAveragedTime UriPerfTest_boolean_checkHierarchical_0800: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('@kit.ArkTS', 'uri', 'checkHierarchical',
          'checkHierarchical(): boolean;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UriPerfTest_string_getQueryValue_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let uriInstance = new uri.URI("https://www.com?param1=value1&param2=value2");
        let res = uriInstance.getQueryValue("param1");
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = uriInstance.getQueryValue("param1");
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info(
          'arkTsUriPerfTest arkTsAveragedTime UriPerfTest_string_getQueryValue_0900: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('@kit.ArkTS', 'uri', 'getQueryValue',
          'getQueryValue(key: string): string;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UriPerfTest_URI_addQueryValue_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let uris: uri.URI[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          uris.push(new uri.URI("https://www.test.com"));
        }
        let res = uris[0].addQueryValue("param1", "hello world");
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = uris[i].addQueryValue("param1", "hello world");
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info(
          'arkTsUriPerfTest arkTsAveragedTime UriPerfTest_URI_addQueryValue_1000: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('@kit.ArkTS', 'uri', 'addQueryValue',
          'addQueryValue(key: string, value: string): URI;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UriPerfTest_URI_addSegment_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let uris: uri.URI[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          uris.push(new uri.URI("http://www.test.com"));
        }
        let res = uris[0].addSegment("my image.jpg");
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = uris[i].addSegment("my image.jpg");
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsUriPerfTest arkTsAveragedTime UriPerfTest_URI_addSegment_1100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('@kit.ArkTS', 'uri', 'addSegment',
          'addSegment(pathSegment: string): URI;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UriPerfTest_URI_addEncodedSegment_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let uris: uri.URI[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          uris.push(new uri.URI("http://www.test.com"));
        }
        let res = uris[0].addEncodedSegment("my%20image.jpg");
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = uris[i].addEncodedSegment("my%20image.jpg");
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info(
          'arkTsUriPerfTest arkTsAveragedTime UriPerfTest_URI_addEncodedSegment_1200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('@kit.ArkTS', 'uri', 'addEncodedSegment',
          'addEncodedSegment(pathSegment: string): URI;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UriPerfTest_string[]_getQueryNames_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let uriInstance = new uri.URI("https://www.test.com?param1=value1&param2=value2");
        let res = uriInstance.getQueryNames();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = uriInstance.getQueryNames();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info(
          'arkTsUriPerfTest arkTsAveragedTime UriPerfTest_string[]_getQueryNames_1300: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('@kit.ArkTS', 'uri', 'getQueryNames',
          'getQueryNames(): string[];', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UriPerfTest_string[]_getQueryValues_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let uriInstance = new uri.URI("https://www.test.com/search?query=name&query=my");
        let res = uriInstance.getQueryValues("query");
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = uriInstance.getQueryValues("query");
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info(
          'arkTsUriPerfTest arkTsAveragedTime UriPerfTest_string[]_getQueryValues_1400: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('@kit.ArkTS', 'uri', 'getQueryValues',
          'getQueryValues(key: string): string[];', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UriPerfTest_boolean_getBooleanQueryValue_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let uriInstance = new uri.URI("https://www.test.com/search?active=true");
        let res = false;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = uriInstance.getBooleanQueryValue("active", false);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsUriPerfTest arkTsAveragedTime UriPerfTest_boolean_getBooleanQueryValue_1600: ' +
          arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('@kit.ArkTS', 'uri', 'getBooleanQueryValue',
          'getBooleanQueryValue(key: string, defaultValue: boolean): boolean;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UriPerfTest_URI_clearQuery_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let uris: uri.URI[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          uris.push(new uri.URI("https://www.test.com?param1=value1"));
        }
        let res = uris[0].clearQuery();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = uris[i].clearQuery();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsUriPerfTest arkTsAveragedTime UriPerfTest_URI_clearQuery_1700: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('@kit.ArkTS', 'uri', 'clearQuery',
          'clearQuery(): URI;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UriPerfTest_string_getLastSegment_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let uriInstance = new uri.URI("content://com.test.provider/files/image.jpg");
        let res = uriInstance.getLastSegment();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = uriInstance.getLastSegment();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info(
          'arkTsUriPerfTest arkTsAveragedTime UriPerfTest_string_getLastSegment_1800: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('@kit.ArkTS', 'uri', 'getLastSegment',
          'getLastSegment(): string;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UriPerfTest_string[]_getSegment_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let uriInstance = new uri.URI("http://www.test.com/path/to/image.jpg");
        let res = uriInstance.getSegment();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = uriInstance.getSegment();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info(
          'arkTsUriPerfTest arkTsAveragedTime UriPerfTest_string[]_getSegment_1900: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('@kit.ArkTS', 'uri', 'getSegment',
          'getSegment(): string[];', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UriPerfTest_URI_createFromParts_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res = uri.URI.createFromParts("mailto", "no body", "top");
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = uri.URI.createFromParts("mailto", "no body", "top");
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info(
          'arkTsUriPerfTest arkTsAveragedTime UriPerfTest_URI_createFromParts_2000: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('@kit.ArkTS', 'uri', 'createFromParts',
          'createFromParts(scheme: string, ssp: string, fragment: string): URI;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UriPerfTest_boolean_equals_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let uriInstance = new uri.URI('https://username:password@host:8080/directory/file?query=pppppp#qwer=da');
        let uriInstance1 = new uri.URI('https://username:password@host:8080/directory/file?query=pppppp#qwer=da');
        let res = false
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = uriInstance.equals(uriInstance1);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsUriPerfTest arkTsAveragedTime UriPerfTest_boolean_equals_2100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('@kit.ArkTS', 'uri', 'equals',
          'equals(other: URI): boolean;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('UriPerfTest_string_scheme_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let uriInstance = new uri.URI('https://username:password@host:8080/directory/file?foo=1&bar=2#fragment');
      let res = uriInstance.scheme;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = uriInstance.scheme;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUriPerfTest arkTsAveragedTime UriPerfTest_string_scheme_2200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('@kit.ArkTS', 'uri', 'scheme', 'get scheme: string;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UriPerfTest_string_userInfo_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let uriInstance = new uri.URI('https://username:password@host:8080/directory/file?foo=1&bar=2#fragment');
      let res = uriInstance.userInfo;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = uriInstance.userInfo;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUriPerfTest arkTsAveragedTime UriPerfTest_string_userInfo_2300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('@kit.ArkTS', 'uri', 'userInfo', 'get userInfo: string;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UriPerfTest_string_host_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let uriInstance = new uri.URI('https://username:password@host:8080/directory/file?foo=1&bar=2#fragment');
      let res = uriInstance.host;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = uriInstance.host;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUriPerfTest arkTsAveragedTime UriPerfTest_string_host_2400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('@kit.ArkTS', 'uri', 'host', 'get host: string;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UriPerfTest_string_port_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let uriInstance = new uri.URI('https://username:password@host:8080/directory/file?foo=1&bar=2#fragment');
      let res = uriInstance.port;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = uriInstance.port;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUriPerfTest arkTsAveragedTime UriPerfTest_string_port_2500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('@kit.ArkTS', 'uri', 'port', 'get port: string;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UriPerfTest_string_path_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let uriInstance = new uri.URI('https://username:password@host:8080/directory/file?foo=1&bar=2#fragment');
      let res = uriInstance.path;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = uriInstance.path;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUriPerfTest arkTsAveragedTime UriPerfTest_string_path_2600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('@kit.ArkTS', 'uri', 'path', 'get path: string;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UriPerfTest_string_query_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let uriInstance = new uri.URI('https://username:password@host:8080/directory/file?foo=1&bar=2#fragment');
      let res = uriInstance.query;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = uriInstance.query;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUriPerfTest arkTsAveragedTime UriPerfTest_string_query_2700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('@kit.ArkTS', 'uri', 'query', 'get query: string;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UriPerfTest_string_fragment_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let uriInstance = new uri.URI('https://username:password@host:8080/directory/file?foo=1&bar=2#fragment');
      let res = uriInstance.fragment;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = uriInstance.fragment;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUriPerfTest arkTsAveragedTime UriPerfTest_string_fragment_2800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('@kit.ArkTS', 'uri', 'fragment', 'get fragment: string;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UriPerfTest_string_authority_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let uriInstance = new uri.URI('https://username:password@host:8080/directory/file?foo=1&bar=2#fragment');
      let res = uriInstance.authority;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = uriInstance.authority;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUriPerfTest arkTsAveragedTime UriPerfTest_string_authority_2900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('@kit.ArkTS', 'uri', 'authority', 'get authority: string;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UriPerfTest_string_ssp_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let uriInstance = new uri.URI('https://username:password@host:8080/directory/file?foo=1&bar=2#fragment');
      let res = uriInstance.ssp;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = uriInstance.ssp;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUriPerfTest arkTsAveragedTime UriPerfTest_string_ssp_3000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('@kit.ArkTS', 'uri', 'ssp', 'get ssp: string;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UriPerfTest_string_encodedProperties_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let uriInstance = new uri.URI('https://username:my+name@host:8080/directory/my+file?foo=1&bar=2#fragment');
      let res = uriInstance.encodedUserInfo;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = uriInstance.encodedUserInfo;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUriPerfTest arkTsAveragedTime UriPerfTest_string_encodedUserInfo_3100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('@kit.ArkTS', 'uri', 'encodedUserInfo', 'get encodedUserInfo: string;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UriPerfTest_string_encodedPath_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let uriInstance = new uri.URI('https://username:my+name@host:8080/directory/my+file?foo=1&bar=2#fragment');
      let res = uriInstance.encodedPath;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = uriInstance.encodedPath;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUriPerfTest arkTsAveragedTime UriPerfTest_string_encodedPath_3200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('@kit.ArkTS', 'uri', 'encodedPath', 'get encodedPath: string;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UriPerfTest_string_encodedQuery_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let uriInstance = new uri.URI('https://username:my+name@host:8080/directory/my+file?foo=1&bar=2#fragment');
      let res = uriInstance.encodedQuery;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = uriInstance.encodedQuery;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUriPerfTest arkTsAveragedTime UriPerfTest_string_encodedQuery_3300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('@kit.ArkTS', 'uri', 'encodedQuery', 'get encodedQuery: string;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UriPerfTest_string_encodedFragment_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let uriInstance = new uri.URI('https://username:my+name@host:8080/directory/my+file?foo=1&bar=2#fragment');
      let res = uriInstance.encodedFragment;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = uriInstance.encodedFragment;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUriPerfTest arkTsAveragedTime UriPerfTest_string_encodedFragment_3400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('@kit.ArkTS', 'uri', 'encodedFragment', 'get encodedFragment: string;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UriPerfTest_string_encodedAuthority_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let uriInstance = new uri.URI('https://username:my+name@host:8080/directory/my+file?foo=1&bar=2#fragment');
      let res = uriInstance.encodedAuthority;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = uriInstance.encodedAuthority;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUriPerfTest arkTsAveragedTime UriPerfTest_string_encodedAuthority_3500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('@kit.ArkTS', 'uri', 'encodedAuthority', 'get encodedAuthority: string;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('UriPerfTest_string_encodedSSP_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let uriInstance = new uri.URI('https://username:my+name@host:8080/directory/my+file?foo=1&bar=2#fragment');
      let res = uriInstance.encodedSSP;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = uriInstance.encodedSSP;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsUriPerfTest arkTsAveragedTime UriPerfTest_string_encodedSSP_3600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('@kit.ArkTS', 'uri', 'encodedSSP', 'get encodedSSP: string;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })
  })
}