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
import { url } from '@kit.ArkTS';
import { systemDateTime } from '@kit.BasicServicesKit';

declare class ArkTools {
  static forceFullGC(): void;
}

export default function URLParamsTest(): void {
  describe('URLParamsTest', () => {
    const BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('URLParamsPerfTest_String_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let res = new url.URLParams([['user1', 'abc1'], ['query2', 'first2'], ['query3', 'second3']]);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new url.URLParams([['user1', 'abc1'], ['query2', 'first2'], ['query3', 'second3']]);
      }
       let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsURLParamsPerfTest arkTsAveragedTime URLParamsPerfTest_String_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.url', 'URLParams', 'Constructor',
        'constructor(init?: string[][] | Record<string, string> | string | URLParams);', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('URLParamsPerfTest_Void_Append_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let paramsObjects: url.URLParams[] = [];
      for (let i = 0; i < BASE_COUNT; i++) {
        paramsObjects.push(new url.URLParams('fod=1&bard=2'));
      }
      let res = paramsObjects[0].append('fod', '3');
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = paramsObjects[i].append('fod', '3');
      }
       let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsURLParamsPerfTest arkTsAveragedTime URLParamsPerfTest_Void_Append_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.url', 'URLParams', 'append',
        'append(name: string, value: string): void;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('URLParamsPerfTest_Void_Delete_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let paramsObjects: url.URLParams[] = [];
      for (let i = 0; i < BASE_COUNT; i++) {
        paramsObjects.push(new url.URLParams('fod=1&bard=2'));
      }
      let res: boolean = paramsObjects[0].has('fod');
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        paramsObjects[i].delete('fod');
      }
       let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsURLParamsPerfTest arkTsAveragedTime URLParamsPerfTest_Void_Delete_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.url', 'URLParams', 'delete',
        'delete(name: string): void;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('URLParamsPerfTest_String_GetAll_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let urlObject = url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
      let params = new url.URLParams(urlObject.search.slice(1));
      params.append('fod', '3');
      let res = params.getAll('fod');
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = params.getAll('fod');
      }
       let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsURLParamsPerfTest arkTsAveragedTime URLParamsPerfTest_String_GetAll_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.url', 'URLParams', 'getAll',
        'getAll(name: string): string[];', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('URLParamsPerfTest_IterableIterator_Entries_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let searchParamsObject = new url.URLParams("keyName1=valueName1&keyName2=valueName2");
      let res = searchParamsObject.entries();
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = searchParamsObject.entries();
      }
       let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsURLParamsPerfTest arkTsAveragedTime URLParamsPerfTest_IterableIterator_Entries_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.url', 'URLParams', 'entries',
        'entries(): IterableIterator<[string, string]>;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('URLParamsPerfTest_Void_ForEach_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      const myURLObject = url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
      let callback = (value: string, name: string, searchParams: url.URLParams): void => {};
      let res: void = myURLObject.params.forEach(callback);
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = myURLObject.params.forEach(callback);
      }
       let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsURLParamsPerfTest arkTsAveragedTime URLParamsPerfTest_Void_ForEach_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.url', 'URLParams', 'forEach',
        'forEach(callbackFn: (value: string, key: string, searchParams: URLParams) => void, thisArg?: Object): void;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('URLParamsPerfTest_String_Get_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let paramsObject = new url.URLParams('name=Jonathan&age=18');
      let name = paramsObject.get("name");
      let age = paramsObject.get("age");
      let getObj = paramsObject.get("abc");
      let res = name;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = paramsObject.get("name");
      }
       let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsURLParamsPerfTest arkTsAveragedTime URLParamsPerfTest_String_Get_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.url', 'URLParams', 'get',
        'get(name: string): string | null;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('URLParamsPerfTest_Boolean_Has_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let urlObject = url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
      let paramsObject = new url.URLParams(urlObject.search.slice(1));
      let res = paramsObject.has('bard');
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = paramsObject.has('bard');
      }
       let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsURLParamsPerfTest arkTsAveragedTime URLParamsPerfTest_Boolean_Has_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.url', 'URLParams', 'has',
        'has(name: string): boolean;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('URLParamsPerfTest_Void_Set_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let paramsObjects: url.URLParams[] = [];
      for (let i = 0; i < BASE_COUNT; i++) {
        paramsObjects.push(new url.URLParams('fod=1&bard=2'));
      }
      let res = paramsObjects[0].set('baz', '3');
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = paramsObjects[i].set('baz', '3');
      }
       let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsURLParamsPerfTest arkTsAveragedTime URLParamsPerfTest_Void_Set_0900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.url', 'URLParams', 'set',
        'set(name: string, value: string): void;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('URLParamsPerfTest_Void_Sort_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let paramsObjects: url.URLParams[] = [];
      for (let i = 0; i < BASE_COUNT; i++) {
        paramsObjects.push(new url.URLParams("c=3&a=9&b=4&d=2"));
      }
      let res = paramsObjects[0].sort();
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = paramsObjects[i].sort();
      }
       let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsURLParamsPerfTest arkTsAveragedTime URLParamsPerfTest_Void_Sort_1000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.url', 'URLParams', 'sort',
        'sort(): void;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('URLParamsPerfTest_IterableIterator<string>_Keys_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let searchParamsObject = new url.URLParams("key1=value1&key2=value2");
      let res = searchParamsObject.keys();
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = searchParamsObject.keys();
      }
       let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsURLParamsPerfTest arkTsAveragedTime URLParamsPerfTest_IterableIterator<string>_Keys_1100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.url', 'URLParams', 'keys',
        'keys(): IterableIterator<string>;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('URLParamsPerfTest_IterableIterator<string>_Values_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let searchParams = new url.URLParams("key1=value1&key2=value2");
      let res = searchParams.values();
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = searchParams.values();
      }
       let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsURLParamsPerfTest arkTsAveragedTime URLParamsPerfTest_IterableIterator<string>_Values_1200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.url', 'URLParams', 'values',
        'values(): IterableIterator<string>;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('URLParamsPerfTest_IterableIterator<[string, string]>_SymbolIterator_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      const paramsObject = new url.URLParams('fod=bay&edg=bap');
      let res = paramsObject[Symbol.iterator]();
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = paramsObject[Symbol.iterator]();
      }
       let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsURLParamsPerfTest arkTsAveragedTime URLParamsPerfTest_IterableIterator<[string, string]>_SymbolIterator_1300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.url', 'URLParams', '[Symbol.iterator]',
        '[Symbol.iterator](): IterableIterator<[string, string]>;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('URLParamsPerfTest_String_ToString_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let urlObject = url.URL.parseURL('https://developer.exampleUrl/?fod=1&bard=2');
      let params = new url.URLParams(urlObject.search.slice(1));
      params.append('fod', '3');
      let res = params.toString();
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = params.toString();
      }
       let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsURLParamsPerfTest arkTsAveragedTime URLParamsPerfTest_String_ToString_1400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.url', 'URLParams', 'toString',
        'toString(): string;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('URLPerfTest_URL_Constructor_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let mm = 'https://username:password@host:8080';
      let a = new url.URL("/", mm);
      let b = new url.URL(mm);
      let c = new url.URL('/path/path1', b);
      let res = a;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new url.URL("/", mm);
      }
       let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsURLPerfTest arkTsAveragedTime URLPerfTest_URL_Constructor_1500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.url', 'URL', 'constructor',
        'constructor(url: string, base?: string | URL);', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('URLPerfTest_URL_Constructor_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let a = new url.URL();
      let res = a;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new url.URL();
      }
       let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsURLPerfTest arkTsAveragedTime URLPerfTest_URL_Constructor_1600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.url', 'URL', 'constructor',
        'constructor();', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('URLPerfTest_URL_ParseURL_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let mm = 'https://username:password@host:8080/test/test1/test3';
      let urlObject = url.URL.parseURL(mm);
      let res = urlObject;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = url.URL.parseURL(mm);
      }
       let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsURLPerfTest arkTsAveragedTime URLPerfTest_URL_ParseURL_1700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.url', 'URL', 'parseURL',
        'static parseURL(url: string, base?: string | URL): URL;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('URLPerfTest_String_ToString_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      const urlObject = url.URL.parseURL('https://username:password@host:8080/directory/file?query=pppppp#qwer=da');
      let res = urlObject.toString();
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = urlObject.toString();
      }
       let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsURLPerfTest arkTsAveragedTime URLPerfTest_String_ToString_1800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.url', 'URL', 'toString',
        'toString(): string;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('URLPerfTest_String_ToJSON_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      const urlObject = url.URL.parseURL('https://username:password@host:8080/directory/file?query=pppppp#qwer=da');
      let res = urlObject.toJSON();
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = urlObject.toJSON();
      }
       let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsURLPerfTest arkTsAveragedTime URLPerfTest_String_ToJSON_1900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.url', 'URL', 'toJSON',
        'toJSON(): string;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('URLSearchParamsPerfTest_URLSearchParams_Constructor_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      let objectParams = new url.URLSearchParams([['user1', 'abc1'], ['query2', 'first2'], ['query3', 'second3']]);
      let objectParams1 = new url.URLSearchParams({"fod" : '1' , "bard" : '2'});
      let objectParams2 = new url.URLSearchParams('?fod=1&bard=2');
      let urlObject = new url.URL('https://developer.mozilla.org/?fod=1&bard=2');
      let params = new url.URLSearchParams(urlObject.search);

      let res = objectParams;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new url.URLSearchParams([['user1', 'abc1'], ['query2', 'first2'], ['query3', 'second3']]);
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsURLSearchParamsPerfTest arkTsAveragedTime URLSearchParamsPerfTest_URLSearchParams_Constructor_2000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.url', 'URLSearchParams', 'constructor',
        'constructor(init?: string[][] | Record<string, string> | string | URLSearchParams);', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('URLPerfTest_string_URLProperties_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      const urlObject = url.URL.parseURL('https://username:password@host:8080/directory/file?query=pppppp#qwer=da');
      let res = urlObject.href;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = urlObject.href;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsURLPerfTest arkTsAveragedTime URLPerfTest_string_href_3400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.url', 'URL', 'href', 'get href(): string;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('URLPerfTest_string_URLHost_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      const urlObject = url.URL.parseURL('https://username:password@host:8080/directory/file?query=pppppp#qwer=da');
      let res = urlObject.host;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = urlObject.host;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsURLPerfTest arkTsAveragedTime URLPerfTest_string_host_3500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.url', 'URL', 'host', 'get host(): string;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('URLPerfTest_string_URLHostname_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      const urlObject = url.URL.parseURL('https://username:password@host:8080/directory/file?query=pppppp#qwer=da');
      let res = urlObject.hostname;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = urlObject.hostname;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsURLPerfTest arkTsAveragedTime URLPerfTest_string_hostname_3600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.url', 'URL', 'hostname', 'get hostname(): string;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('URLPerfTest_string_URLPathname_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      const urlObject = url.URL.parseURL('https://username:password@host:8080/directory/file?query=pppppp#qwer=da');
      let res = urlObject.pathname;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = urlObject.pathname;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsURLPerfTest arkTsAveragedTime URLPerfTest_string_pathname_3700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.url', 'URL', 'pathname', 'get pathname(): string;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('URLPerfTest_string_URLProtocol_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      const urlObject = url.URL.parseURL('https://username:password@host:8080/directory/file?query=pppppp#qwer=da');
      let res = urlObject.protocol;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = urlObject.protocol;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsURLPerfTest arkTsAveragedTime URLPerfTest_string_protocol_3800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.url', 'URL', 'protocol', 'get protocol(): string;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('URLPerfTest_string_URLSearch_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      const urlObject = url.URL.parseURL('https://username:password@host:8080/directory/file?query=pppppp#qwer=da');
      let res = urlObject.search;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = urlObject.search;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsURLPerfTest arkTsAveragedTime URLPerfTest_string_search_3900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.url', 'URL', 'search', 'get search(): string;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('URLPerfTest_string_URLHash_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      const urlObject = url.URL.parseURL('https://username:password@host:8080/directory/file?query=pppppp#qwer=da');
      let res = urlObject.hash;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = urlObject.hash;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsURLPerfTest arkTsAveragedTime URLPerfTest_string_hash_4000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.url', 'URL', 'hash', 'get hash(): string;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('URLPerfTest_URLParams_params_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      const urlObject = url.URL.parseURL('https://username:password@host:8080/directory/file?query=pppppp#qwer=da');
      let res = urlObject.params;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = urlObject.params;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsURLPerfTest arkTsAveragedTime URLPerfTest_URLParams_params_4100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.url', 'URL', 'params', 'get params(): URLParams;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('URLParamsPerfTest_IterableIterator_entries_4150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      const paramsObject = new url.URLParams('fod=bay&edg=bap');
      let res = paramsObject.entries();
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = paramsObject.entries();
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsURLParamsPerfTest arkTsAveragedTime URLParamsPerfTest_IterableIterator_entries_4150: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.url', 'URLParams', 'entries', 'entries(): IterableIterator<[string, string]>;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('URLPerfTest_string_URLUserName_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      const urlObject = url.URL.parseURL('https://username:password@host:8080/directory/file?query=pppppp#qwer=da');
      let res = urlObject.username;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = urlObject.username;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsURLPerfTest arkTsAveragedTime URLPerfTest_string_username_4200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.url', 'URL', 'username', 'get username(): string;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('URLPerfTest_string_URLPassword_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      const urlObject = url.URL.parseURL('https://username:password@host:8080/directory/file?query=pppppp#qwer=da');
      let res = urlObject.password;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = urlObject.password;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsURLPerfTest arkTsAveragedTime URLPerfTest_string_password_4300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.url', 'URL', 'password', 'get password(): string;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('URLPerfTest_string_URLPort_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      const urlObject = url.URL.parseURL('https://username:password@host:8080/directory/file?query=pppppp#qwer=da');
      let res = urlObject.port;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = urlObject.port;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsURLPerfTest arkTsAveragedTime URLPerfTest_string_port_4400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.url', 'URL', 'port', 'get port(): string;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })

    it('URLPerfTest_string_URLOrigin_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void) => {
      const urlObject = url.URL.parseURL('https://username:password@host:8080/directory/file?query=pppppp#qwer=da');
      let res = urlObject.origin;
      let Stime = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = urlObject.origin;
      }
      let Dtime = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime / BASE_COUNT;
      console.info('arkTsURLPerfTest arkTsAveragedTime URLPerfTest_string_origin_4500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.url', 'URL', 'origin', 'get origin(): string;', arkTsAveragedTime);
      setTimeout(() => { done(); }, 10);
    })
  })
}