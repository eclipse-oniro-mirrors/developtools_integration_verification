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

export default function IntlPerfTest(): void {
  describe('IntlPerfTest', () => {

    const BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

it('PerformanceTest_Intl_NumberFormat_supportedLocalesOf_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let res: string[] = [];
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Intl.NumberFormat.supportedLocalesOf(['zh-CN', 'en-US']);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Intl_NumberFormat_supportedLocalesOf_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.NumberFormat', 'supportedLocalesOf',
        'supportedLocalesOf(locales: string | string[], options?: NumberFormatOptions): string[]', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Intl_ListFormat_supportedLocalesOf_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let res: string[] = [];
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Intl.ListFormat.supportedLocalesOf(['zh-CN', 'en-US']);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Intl_ListFormat_supportedLocalesOf_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.ListFormat', 'supportedLocalesOf',
        'supportedLocalesOf(locales: string | string[], options?): string[]', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Intl_RelativeTimeFormat_formatToParts_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let formatter: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat('zh-CN');
      let res: Intl.RelativeTimeFormatPart[] = [];
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = formatter.formatToParts(-1, 'day');
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Intl_RelativeTimeFormat_formatToParts_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.RelativeTimeFormat', 'formatToParts',
        'formatToParts(value: number, unit: RelativeTimeFormatUnit): RelativeTimeFormatPart[]', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Intl_RelativeTimeFormat_resolvedOptions_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let formatter: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat('zh-CN');
      let res: Intl.ResolvedRelativeTimeFormatOptions = formatter.resolvedOptions();
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = formatter.resolvedOptions();
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Intl_RelativeTimeFormat_resolvedOptions_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.RelativeTimeFormat', 'resolvedOptions',
        'resolvedOptions(): ResolvedRelativeTimeFormatOptions', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Intl_RelativeTimeFormat_supportedLocalesOf_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let res: string[] = [];
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Intl.RelativeTimeFormat.supportedLocalesOf(['zh-CN', 'en-US']);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Intl_RelativeTimeFormat_supportedLocalesOf_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.RelativeTimeFormat', 'supportedLocalesOf',
        'supportedLocalesOf(locales: string | string[], options?: RelativeTimeFormatOptions): string[]', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Intl_Locale_maximize_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let locale: Intl.Locale = new Intl.Locale('zh');
      let res: Intl.Locale = locale;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = locale.maximize();
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Intl_Locale_maximize_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.Locale', 'maximize',
        'maximize(): Locale', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Intl_Locale_minimize_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let locale: Intl.Locale = new Intl.Locale('zh-CN');
      let res: Intl.Locale = locale;
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = locale.minimize();
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Intl_Locale_minimize_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.Locale', 'minimize',
        'minimize(): Locale', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Intl_DisplayNames_resolvedOptions_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let displayNames: Intl.DisplayNames = new Intl.DisplayNames('zh-CN', { type: 'language' });
      let res: Intl.ResolvedDisplayNamesOptions = displayNames.resolvedOptions();
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = displayNames.resolvedOptions();
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Intl_DisplayNames_resolvedOptions_0800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.DisplayNames', 'resolvedOptions',
        'resolvedOptions(): ResolvedDisplayNamesOptions', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Intl_DisplayNames_supportedLocalesOf_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let res: string[] = [];
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Intl.DisplayNames.supportedLocalesOf('zh-CN');
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Intl_DisplayNames_supportedLocalesOf_0900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.DisplayNames', 'supportedLocalesOf',
        'supportedLocalesOf(locales: string | Locale | FixedArray<string | Locale>): string[]', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Intl_PluralRules_resolvedOptions_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let pluralRules: Intl.PluralRules = new Intl.PluralRules('zh-CN');
      let res: Intl.ResolvedPluralRulesOptions = pluralRules.resolvedOptions();
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = pluralRules.resolvedOptions();
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Intl_PluralRules_resolvedOptions_1000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.PluralRules', 'resolvedOptions',
        'resolvedOptions(): ResolvedPluralRulesOptions', arkTsAveragedTime);
      done();
    })

    it('PerformanceTest_Intl_PluralRules_supportedLocalesOf_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: Function) => {
      let res: string[] = [];
      let Stime: number = systemDateTime.getTime(true);
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Intl.PluralRules.supportedLocalesOf(['zh-CN', 'en-US']);
      }
      let Dtime: number = systemDateTime.getTime(true) - Stime;
      let res1 = res;
      let arkTsAveragedTime: number = Dtime / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Intl_PluralRules_supportedLocalesOf_1100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.PluralRules', 'supportedLocalesOf',
        'supportedLocalesOf(locales: string | FixedArray<string>, options?): string[]', arkTsAveragedTime);
      done();
    })

    })
}