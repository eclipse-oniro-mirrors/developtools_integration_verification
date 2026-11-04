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
import { uri, util, url, xml, buffer, transfer } from '@kit.ArkTS';

export default function IntlPerfTest() : void {
  describe('IntlPerfTest', () => {
    // 毫秒 * 1000 = 微秒 毫秒 * 1000000 = 纳秒
    const BASE_COUNT = 50000;
    // const BASE_COUNT = 500;
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


    it('PerformanceTest_Intl_Collator_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Intl.Collator = new Intl.Collator('zh-CN');
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Intl.Collator('zh-CN');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Intl_Collator_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.Collator', 'constructor',
        'constructor(locales?: string | string[], options?: CollatorOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_Intl_Collator_compare_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let collator: Intl.Collator = new Intl.Collator('zh-CN');
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = collator.compare('apple', 'banana');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Intl_Collator_compare_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.Collator', 'compare',
        'compare(x: string, y: string): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Intl_Collator_resolvedOptions_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let collator: Intl.Collator = new Intl.Collator('zh-CN');
      let res: Intl.ResolvedCollatorOptions = collator.resolvedOptions();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = collator.resolvedOptions();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Intl_Collator_resolvedOptions_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.Collator', 'resolvedOptions',
        'resolvedOptions(): ResolvedCollatorOptions', arkTsAveragedTime);
    })

    it('PerformanceTest_Intl_Collator_supportedLocalesOf_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: string[] = [];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Intl.Collator.supportedLocalesOf(['zh-CN', 'en-US']);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Intl_Collator_supportedLocalesOf_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.Collator', 'supportedLocalesOf',
        'supportedLocalesOf(locales: string | string[], options?: CollatorOptions): string[]', arkTsAveragedTime);
    })


    it('PerformanceTest_Intl_DateTimeFormat_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Intl.DateTimeFormat = new Intl.DateTimeFormat('zh-CN');
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Intl.DateTimeFormat('zh-CN');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Intl_DateTimeFormat_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.DateTimeFormat', 'constructor',
        'constructor(locales?: string | string[], options?: DateTimeFormatOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_Intl_DateTimeFormat_format_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let formatter: Intl.DateTimeFormat = new Intl.DateTimeFormat('zh-CN');
      let date: Date = new Date();
      let res: string = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = formatter.format(date);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Intl_DateTimeFormat_format_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.DateTimeFormat', 'format',
        'format(date?: Date | number): string', arkTsAveragedTime);
    })

    it('PerformanceTest_Intl_DateTimeFormat_formatToParts_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let formatter: Intl.DateTimeFormat = new Intl.DateTimeFormat('zh-CN');
      let date: Date = new Date();
      let res: Intl.DateTimeFormatPart[] = [];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = formatter.formatToParts(date);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Intl_DateTimeFormat_formatToParts_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.DateTimeFormat', 'formatToParts',
        'formatToParts(date?: Date | number): DateTimeFormatPart[]', arkTsAveragedTime);
    })

    it('PerformanceTest_Intl_DateTimeFormat_resolvedOptions_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let formatter: Intl.DateTimeFormat = new Intl.DateTimeFormat('zh-CN');
      let res: Intl.ResolvedDateTimeFormatOptions = formatter.resolvedOptions();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = formatter.resolvedOptions();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Intl_DateTimeFormat_resolvedOptions_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.DateTimeFormat', 'resolvedOptions',
        'resolvedOptions(): ResolvedDateTimeFormatOptions', arkTsAveragedTime);
    })

    it('PerformanceTest_Intl_DateTimeFormat_supportedLocalesOf_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: string[] = [];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Intl.DateTimeFormat.supportedLocalesOf(['zh-CN', 'en-US']);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Intl_DateTimeFormat_supportedLocalesOf_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.DateTimeFormat', 'supportedLocalesOf',
        'supportedLocalesOf(locales: string | Locale | ReadonlyArray<string | Locale>, options?: DateTimeFormatOptions): string[]', arkTsAveragedTime);
    })


    it('PerformanceTest_Intl_NumberFormat_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Intl.NumberFormat = new Intl.NumberFormat('zh-CN');
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Intl.NumberFormat('zh-CN');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Intl_NumberFormat_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.NumberFormat', 'constructor',
        'constructor(locales?: string | string[], options?: NumberFormatOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_Intl_NumberFormat_format_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let formatter: Intl.NumberFormat = new Intl.NumberFormat('zh-CN');
      let res: string = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = formatter.format(1234567.89);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Intl_NumberFormat_format_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.NumberFormat', 'format',
        'format(number: number): string', arkTsAveragedTime);
    })

    it('PerformanceTest_Intl_NumberFormat_resolvedOptions_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let formatter: Intl.NumberFormat = new Intl.NumberFormat('zh-CN');
      let res: Intl.ResolvedNumberFormatOptions = formatter.resolvedOptions();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = formatter.resolvedOptions();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Intl_NumberFormat_resolvedOptions_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.NumberFormat', 'resolvedOptions',
        'resolvedOptions(): ResolvedNumberFormatOptions', arkTsAveragedTime);
    })


    it('PerformanceTest_Intl_ListFormat_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Intl.ListFormat = new Intl.ListFormat('zh-CN');
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Intl.ListFormat('zh-CN');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Intl_ListFormat_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.ListFormat', 'constructor',
        'constructor(locales?: string | string[], options?: ListFormatOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_Intl_ListFormat_format_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let formatter: Intl.ListFormat = new Intl.ListFormat('zh-CN');
      let items: string[] = ['苹果', '香蕉', '橙子'];
      let res: string = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = formatter.format(items);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Intl_ListFormat_format_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.ListFormat', 'format',
        'format(items: string[]): string', arkTsAveragedTime);
    })


    it('PerformanceTest_Intl_RelativeTimeFormat_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat('zh-CN');
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Intl.RelativeTimeFormat('zh-CN');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Intl_RelativeTimeFormat_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.RelativeTimeFormat', 'constructor',
        'constructor(locales?: string | string[], options?: RelativeTimeFormatOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_Intl_RelativeTimeFormat_format_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let formatter: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat('zh-CN');
      let res: string = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = formatter.format(-1, 'day');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Intl_RelativeTimeFormat_format_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.RelativeTimeFormat', 'format',
        'format(value: number, unit: RelativeTimeFormatUnit): string', arkTsAveragedTime);
    })


    it('PerformanceTest_Intl_Locale_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Intl.Locale = new Intl.Locale('zh-CN');
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Intl.Locale('zh-CN');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Intl_Locale_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.Locale', 'constructor',
        'constructor(tag: string, options?: LocaleOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_Intl_Locale_toString_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let locale: Intl.Locale = new Intl.Locale('zh-CN');
      let res: string = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = locale.toString();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Intl_Locale_toString_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.Locale', 'toString',
        'toString(): string', arkTsAveragedTime);
    })


    it('PerformanceTest_Intl_DisplayNames_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Intl.DisplayNames = new Intl.DisplayNames('zh-CN', { type: 'language' });
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Intl.DisplayNames('zh-CN', { type: 'language' });
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Intl_DisplayNames_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.DisplayNames', 'constructor',
        'constructor(locales?: BCP47LanguageTag | BCP47LanguageTag[], options?: DisplayNamesOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_Intl_DisplayNames_of_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let displayNames: Intl.DisplayNames = new Intl.DisplayNames('zh-CN', { type: 'language' });
      let res: string | undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = displayNames.of('en-US');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Intl_DisplayNames_of_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.DisplayNames', 'of',
        'of(code: string): string | undefined', arkTsAveragedTime);
    })


    it('PerformanceTest_Intl_PluralRules_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Intl.PluralRules = new Intl.PluralRules('zh-CN');
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Intl.PluralRules('zh-CN');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Intl_PluralRules_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.PluralRules', 'constructor',
        'constructor(locales?: string | string[], options?: PluralRulesOptions)', arkTsAveragedTime);
    })

    it('PerformanceTest_Intl_PluralRules_select_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pluralRules: Intl.PluralRules = new Intl.PluralRules('zh-CN');
      let res: Intl.LDMLPluralRule = 'other';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = pluralRules.select(1);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Intl_PluralRules_select_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.PluralRules', 'select',
        'select(n: number): LDMLPluralRule', arkTsAveragedTime);
    })


    it('PerformanceTest_Intl_DateTimeFormat_formatRange_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let formatter: Intl.DateTimeFormat = new Intl.DateTimeFormat('zh-CN');
      let date1: Date = new Date(2024, 0, 1);
      let date2: Date = new Date(2024, 11, 31);
      let res: string = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = formatter.formatRange(date1, date2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Intl_DateTimeFormat_formatRange_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.DateTimeFormat', 'formatRange',
        'formatRange(startDate: Date | number, endDate: Date | number): string', arkTsAveragedTime);
    })

    it('PerformanceTest_Intl_DateTimeFormat_formatRangeToParts_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let formatter: Intl.DateTimeFormat = new Intl.DateTimeFormat('zh-CN');
      let date1: Date = new Date(2024, 0, 1);
      let date2: Date = new Date(2024, 11, 31);
      let res: Intl.DateTimeRangeFormatPart[] = [];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = formatter.formatRangeToParts(date1, date2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Intl_DateTimeFormat_formatRangeToParts_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.DateTimeFormat', 'formatRangeToParts',
        'formatRangeToParts(startDate: Date | number, endDate: Date | number): DateTimeRangeFormatPart[]', arkTsAveragedTime);
    })


    it('PerformanceTest_Intl_NumberFormat_formatToParts_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let formatter: Intl.NumberFormat = new Intl.NumberFormat('zh-CN');
      let res: Intl.NumberFormatPart[] = [];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = formatter.formatToParts(1234567.89);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Intl_NumberFormat_formatToParts_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.NumberFormat', 'formatToParts',
        'formatToParts(value: number | bigint): NumberFormatPart[]', arkTsAveragedTime);
    })

    it('PerformanceTest_Intl_NumberFormat_formatRange_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let formatter: Intl.NumberFormat = new Intl.NumberFormat('zh-CN');
      let res: string = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = formatter.formatRange(100000, 999999);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Intl_NumberFormat_formatRange_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.NumberFormat', 'formatRange',
        'formatRange(start: number | bigint, end: number | bigint): string', arkTsAveragedTime);
    })

    it('PerformanceTest_Intl_NumberFormat_formatRangeToParts_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let formatter: Intl.NumberFormat = new Intl.NumberFormat('zh-CN');
      let res: Intl.NumberRangeFormatPart[] = [];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = formatter.formatRangeToParts(100000, 999999);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Intl_NumberFormat_formatRangeToParts_0600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.NumberFormat', 'formatRangeToParts',
        'formatRangeToParts(start: number | bigint, end: number | bigint): NumberRangeFormatPart[]', arkTsAveragedTime);
    })

    it('PerformanceTest_Intl_NumberFormat_supportedLocalesOf_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: string[] = [];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Intl.NumberFormat.supportedLocalesOf(['zh-CN', 'en-US']);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Intl_NumberFormat_supportedLocalesOf_0700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.NumberFormat', 'supportedLocalesOf',
        'supportedLocalesOf(locales: string | string[], options?: NumberFormatOptions): string[]', arkTsAveragedTime);
    })


    it('PerformanceTest_Intl_ListFormat_formatToParts_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let formatter: Intl.ListFormat = new Intl.ListFormat('zh-CN');
      let items: string[] = ['苹果', '香蕉', '橙子'];
      let res: Array<Intl.FormatToPartsResult> = [];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = formatter.formatToParts(items);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Intl_ListFormat_formatToParts_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.ListFormat', 'formatToParts',
        'formatToParts(list: Iterable<string>): FormatToPartsResult[]', arkTsAveragedTime);
    })

    it('PerformanceTest_Intl_ListFormat_supportedLocalesOf_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: string[] = [];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Intl.ListFormat.supportedLocalesOf(['zh-CN', 'en-US']);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Intl_ListFormat_supportedLocalesOf_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.ListFormat', 'supportedLocalesOf',
        'supportedLocalesOf(locales: string | string[], options?): string[]', arkTsAveragedTime);
    })


    it('PerformanceTest_Intl_RelativeTimeFormat_formatToParts_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let formatter: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat('zh-CN');
      let res: Intl.RelativeTimeFormatPart[] = [];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = formatter.formatToParts(-1, 'day');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Intl_RelativeTimeFormat_formatToParts_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.RelativeTimeFormat', 'formatToParts',
        'formatToParts(value: number, unit: RelativeTimeFormatUnit): RelativeTimeFormatPart[]', arkTsAveragedTime);
    })

    it('PerformanceTest_Intl_RelativeTimeFormat_resolvedOptions_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let formatter: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat('zh-CN');
      let res: Intl.ResolvedRelativeTimeFormatOptions = formatter.resolvedOptions();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = formatter.resolvedOptions();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Intl_RelativeTimeFormat_resolvedOptions_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.RelativeTimeFormat', 'resolvedOptions',
        'resolvedOptions(): ResolvedRelativeTimeFormatOptions', arkTsAveragedTime);
    })

    it('PerformanceTest_Intl_RelativeTimeFormat_supportedLocalesOf_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: string[] = [];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Intl.RelativeTimeFormat.supportedLocalesOf(['zh-CN', 'en-US']);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Intl_RelativeTimeFormat_supportedLocalesOf_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.RelativeTimeFormat', 'supportedLocalesOf',
        'supportedLocalesOf(locales: string | string[], options?: RelativeTimeFormatOptions): string[]', arkTsAveragedTime);
    })


    it('PerformanceTest_Intl_Locale_maximize_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let locale: Intl.Locale = new Intl.Locale('zh');
      let res: Intl.Locale = locale;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = locale.maximize();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Intl_Locale_maximize_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.Locale', 'maximize',
        'maximize(): Locale', arkTsAveragedTime);
    })

    it('PerformanceTest_Intl_Locale_minimize_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let locale: Intl.Locale = new Intl.Locale('zh-CN');
      let res: Intl.Locale = locale;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = locale.minimize();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Intl_Locale_minimize_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.Locale', 'minimize',
        'minimize(): Locale', arkTsAveragedTime);
    })


    it('PerformanceTest_Intl_DisplayNames_resolvedOptions_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let displayNames: Intl.DisplayNames = new Intl.DisplayNames('zh-CN', { type: 'language' });
      let res: Intl.ResolvedDisplayNamesOptions = displayNames.resolvedOptions();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = displayNames.resolvedOptions();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Intl_DisplayNames_resolvedOptions_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.DisplayNames', 'resolvedOptions',
        'resolvedOptions(): ResolvedDisplayNamesOptions', arkTsAveragedTime);
    })

    it('PerformanceTest_Intl_DisplayNames_supportedLocalesOf_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: string[] = [];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Intl.DisplayNames.supportedLocalesOf('zh-CN');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Intl_DisplayNames_supportedLocalesOf_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.DisplayNames', 'supportedLocalesOf',
        'supportedLocalesOf(locales: string | Locale | FixedArray<string | Locale>): string[]', arkTsAveragedTime);
    })


    it('PerformanceTest_Intl_PluralRules_resolvedOptions_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pluralRules: Intl.PluralRules = new Intl.PluralRules('zh-CN');
      let res: Intl.ResolvedPluralRulesOptions = pluralRules.resolvedOptions();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = pluralRules.resolvedOptions();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Intl_PluralRules_resolvedOptions_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.PluralRules', 'resolvedOptions',
        'resolvedOptions(): ResolvedPluralRulesOptions', arkTsAveragedTime);
    })

    it('PerformanceTest_Intl_PluralRules_supportedLocalesOf_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: string[] = [];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Intl.PluralRules.supportedLocalesOf(['zh-CN', 'en-US']);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Intl_PluralRules_supportedLocalesOf_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.PluralRules', 'supportedLocalesOf',
        'supportedLocalesOf(locales: string | FixedArray<string>, options?): string[]', arkTsAveragedTime);
    })


    it('PerformanceTest_Intl_Segmenter_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: Intl.Segmenter = new Intl.Segmenter('zh-CN', { granularity: 'word' });
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new Intl.Segmenter('zh-CN', { granularity: 'word' });
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Intl_Segmenter_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.Segmenter', 'constructor',
        'constructor(locales?: BCP47LanguageTag | BCP47LanguageTag[], options?: SegmenterOptions)', arkTsAveragedTime);
    })

    // it('PerformanceTest_Intl_Segmenter_segment_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let segmenter: Intl.Segmenter = new Intl.Segmenter('zh-CN', { granularity: 'word' });
    //   let text: string = 'Hello World 你好世界';
    //   let res: Intl.Segments = segmenter.segment(text);
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     res = segmenter.segment(text);
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = res;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Intl_Segmenter_segment_0200: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.core', 'Intl.Segmenter', 'segment',
    //     'segment(doc: string): Segments', arkTsAveragedTime);
    // })

    it('PerformanceTest_Intl_Segmenter_resolvedOptions_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let segmenter: Intl.Segmenter = new Intl.Segmenter('zh-CN', { granularity: 'word' });
      let res: Intl.ResolvedSegmenterOptions = segmenter.resolvedOptions();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = segmenter.resolvedOptions();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Intl_Segmenter_resolvedOptions_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.Segmenter', 'resolvedOptions',
        'resolvedOptions(): ResolvedSegmenterOptions', arkTsAveragedTime);
    })

    it('PerformanceTest_Intl_Segmenter_supportedLocalesOf_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: string[] = [];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Intl.Segmenter.supportedLocalesOf(['zh-CN', 'en-US']);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Intl_Segmenter_supportedLocalesOf_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.Segmenter', 'supportedLocalesOf',
        'supportedLocalesOf(locales: BCP47LanguageTag | BCP47LanguageTag[], options?): BCP47LanguageTag[]', arkTsAveragedTime);
    })

    it('PerformanceTest_Intl_intlLookUpLocale_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: string = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Intl.intlLookUpLocale(['zh-CN', 'en-US']);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Intl_intlLookUpLocale_0100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl', 'intlLookUpLocale',
        'intlLookUpLocale(locale: BCP47LanguageTag | BCP47LanguageTag[]): string', arkTsAveragedTime);
    })

    it('PerformanceTest_Intl_intlBestFitLocale_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: string = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Intl.intlBestFitLocale(['zh-CN', 'en-US']);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Intl_intlBestFitLocale_0200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl', 'intlBestFitLocale',
        'intlBestFitLocale(locale: BCP47LanguageTag | BCP47LanguageTag[]): string', arkTsAveragedTime);
    })

    it('PerformanceTest_Intl_intlLookUpLocales_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: string[] = [];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Intl.intlLookUpLocales(['zh-CN', 'en-US', 'ja-JP']);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Intl_intlLookUpLocales_0300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl', 'intlLookUpLocales',
        'intlLookUpLocales(locale: BCP47LanguageTag | BCP47LanguageTag[]): string[]', arkTsAveragedTime);
    })

    it('PerformanceTest_Intl_intlBestFitLocales_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: string[] = [];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Intl.intlBestFitLocales(['zh-CN', 'en-US', 'ja-JP']);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Intl_intlBestFitLocales_0400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl', 'intlBestFitLocales',
        'intlBestFitLocales(locale: BCP47LanguageTag | BCP47LanguageTag[]): string[]', arkTsAveragedTime);
    })

    it('PerformanceTest_Intl_intlLocalesToLanguageTags_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: string[] = [];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Intl.intlLocalesToLanguageTags(['zh-CN', 'en-US']);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Intl_intlLocalesToLanguageTags_0500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl', 'intlLocalesToLanguageTags',
        'intlLocalesToLanguageTags(locales: string | Locale | ReadonlyArray<string | Locale> | undefined): string[]', arkTsAveragedTime);
    })

    // it('PerformanceTest_Intl_Segments_next_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let segmenter: Intl.Segmenter = new Intl.Segmenter('zh-CN', { granularity: 'word' });
    //   let segments: Intl.Segments = segmenter.segment('Hello World 你好世界');
    //   let res: Intl.SegmentData | undefined;
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     res = segments.next().value;
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = res;
    //   console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Intl_Segments_next_0600: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.core', 'Intl.Segments', 'next',
    //     'next(): IteratorResult<SegmentData>', arkTsAveragedTime);
    // })

  })
}
