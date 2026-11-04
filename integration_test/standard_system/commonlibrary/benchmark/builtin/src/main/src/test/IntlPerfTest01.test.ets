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

export default function IntlPerfTest01(): void {
  describe('IntlPerfTest01', () => {
    const BASE_COUNT = 50000;
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

    it('PerformanceTest_Intl_NumberFormat_format_long_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let formatter: Intl.NumberFormat = new Intl.NumberFormat('zh-CN');
      let res: string = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = formatter.format(1234567890 as long);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Intl.NumberFormat format_long: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.NumberFormat', 'format',
        'format(value: long): string', arkTsAveragedTime);
    })

    it('PerformanceTest_Intl_NumberFormat_format_bigint_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let formatter: Intl.NumberFormat = new Intl.NumberFormat('zh-CN');
      let res: string = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = formatter.format(12345678901234567890n);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Intl.NumberFormat format_bigint: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.NumberFormat', 'format',
        'format(value: bigint): string', arkTsAveragedTime);
    })

    it('PerformanceTest_Intl_NumberFormat_format_number_bigint_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let formatter: Intl.NumberFormat = new Intl.NumberFormat('zh-CN');
      let res: string = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = formatter.format(1234567.89 as number | bigint);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Intl.NumberFormat format_number_bigint: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.NumberFormat', 'format',
        'format(value: number | bigint): string', arkTsAveragedTime);
    })

    it('PerformanceTest_Intl_NumberFormat_formatToParts_bigint_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let formatter: Intl.NumberFormat = new Intl.NumberFormat('zh-CN');
      let res: Intl.NumberFormatPart[] = [];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = formatter.formatToParts(1234567890n);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Intl.NumberFormat formatToParts_bigint: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.NumberFormat', 'formatToParts',
        'formatToParts(value: bigint): NumberFormatPart[]', arkTsAveragedTime);
    })

    // ==================== Intl.PluralRules select重载测试 ====================

    it('PerformanceTest_Intl_PluralRules_select_number_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pluralRules: Intl.PluralRules = new Intl.PluralRules('zh-CN');
      let res: Intl.LDMLPluralRule = 'other';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = pluralRules.select(2.5);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Intl.PluralRules select_number: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.PluralRules', 'select',
        'select(value: number): LDMLPluralRule', arkTsAveragedTime);
    })

    // ==================== Intl.Locale 属性访问测试 ====================

    it('PerformanceTest_Intl_Locale_language_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let locale: Intl.Locale = new Intl.Locale('zh-CN');
      let res: string | undefined = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = locale.language;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Intl.Locale language: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.Locale', 'language',
        'language: string | undefined', arkTsAveragedTime);
    })

    it('PerformanceTest_Intl_Locale_region_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let locale: Intl.Locale = new Intl.Locale('zh-CN');
      let res: string | undefined = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = locale.region;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Intl.Locale region: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.Locale', 'region',
        'region: string | undefined', arkTsAveragedTime);
    })

    it('PerformanceTest_Intl_Locale_script_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let locale: Intl.Locale = new Intl.Locale('zh-Hans-CN');
      let res: string | undefined = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = locale.script;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Intl.Locale script: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.Locale', 'script',
        'script: string | undefined', arkTsAveragedTime);
    })

    it('PerformanceTest_Intl_Locale_calendar_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let locale: Intl.Locale = new Intl.Locale('zh-CN-u-ca-gregory');
      let res: string | undefined = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = locale.calendar;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Intl.Locale calendar: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.Locale', 'calendar',
        'calendar: string | undefined', arkTsAveragedTime);
    })

    it('PerformanceTest_Intl_Locale_numberingSystem_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let locale: Intl.Locale = new Intl.Locale('zh-CN-u-nu-hanidec');
      let res: string | undefined = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = locale.numberingSystem;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Intl.Locale numberingSystem: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.Locale', 'numberingSystem',
        'numberingSystem: string | undefined', arkTsAveragedTime);
    })

    it('PerformanceTest_Intl_Locale_hourCycle_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let locale: Intl.Locale = new Intl.Locale('zh-CN-u-hc-h23');
      let res: string | undefined = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = locale.hourCycle;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Intl.Locale hourCycle: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.Locale', 'hourCycle',
        'hourCycle: string | undefined', arkTsAveragedTime);
    })

    it('PerformanceTest_Intl_Locale_numeric_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let locale: Intl.Locale = new Intl.Locale('zh-CN-u-kn-true');
      let res: boolean | undefined = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = locale.numeric;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Intl.Locale numeric: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.Locale', 'numeric',
        'numeric: boolean | undefined', arkTsAveragedTime);
    })

    it('PerformanceTest_Intl_Locale_collation_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let locale: Intl.Locale = new Intl.Locale('zh-CN-u-co-pinyin');
      let res: string | undefined = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = locale.collation;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Intl.Locale collation: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.Locale', 'collation',
        'collation: string | undefined', arkTsAveragedTime);
    })

    it('PerformanceTest_Intl_Locale_caseFirst_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let locale: Intl.Locale = new Intl.Locale('zh-CN-u-kf-upper');
      let res: string | undefined = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = locale.caseFirst;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Intl.Locale caseFirst: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.Locale', 'caseFirst',
        'caseFirst: string | undefined', arkTsAveragedTime);
    })

    it('PerformanceTest_Intl_Locale_baseName_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let locale: Intl.Locale = new Intl.Locale('zh-Hans-CN');
      let res: string | undefined = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = locale.baseName;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Intl.Locale baseName: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.Locale', 'baseName',
        'baseName: string | undefined', arkTsAveragedTime);
    })

    // ==================== Intl.Segmenter segment测试 ====================

    it('PerformanceTest_Intl_Segmenter_segment_grapheme_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let segmenter: Intl.Segmenter = new Intl.Segmenter('zh-CN', { granularity: 'grapheme' });
      let text: string = 'Hello World 你好世界';
      let res = segmenter.segment(text);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = segmenter.segment(text);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Intl.Segmenter segment_grapheme: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.Segmenter', 'segment',
        'segment(doc: string): Segments (grapheme)', arkTsAveragedTime);
    })

    it('PerformanceTest_Intl_Segmenter_segment_word_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let segmenter: Intl.Segmenter = new Intl.Segmenter('zh-CN', { granularity: 'word' });
      let text: string = 'Hello World 你好世界';
      let res = segmenter.segment(text);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = segmenter.segment(text);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Intl.Segmenter segment_word: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.Segmenter', 'segment',
        'segment(doc: string): Segments (word)', arkTsAveragedTime);
    })

    it('PerformanceTest_Intl_Segmenter_segment_sentence_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let segmenter: Intl.Segmenter = new Intl.Segmenter('zh-CN', { granularity: 'sentence' });
      let text: string = 'Hello World. 你好世界。 How are you?';
      let res = segmenter.segment(text);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = segmenter.segment(text);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Intl.Segmenter segment_sentence: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.Segmenter', 'segment',
        'segment(doc: string): Segments (sentence)', arkTsAveragedTime);
    })

    // ==================== Intl.Segments 迭代器测试 ====================

    // it('PerformanceTest_Intl_Segments_iterator_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let segmenter: Intl.Segmenter = new Intl.Segmenter('zh-CN', { granularity: 'word' });
    //   let segments: Intl.Segments = segmenter.segment('Hello World 你好世界');
    //   let res: Intl.SegmentData | undefined;
    //   let Stime = new Date().getTime();
    //   for (let i = 0; i < BASE_COUNT; i++) {
    //     res = segments.$_iterator().next().value;
    //   }
    //   let Dtime = new Date().getTime() - Stime;
    //   let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //   let res1 = res;
    //   console.info('arkTsPerformanceTest Intl.Segments $_iterator: ' + arkTsAveragedTime + 'ns');
    //   performance.apiWithClassAndKeywordTxt('std.core', 'Intl.Segments', '$_iterator',
    //     '$_iterator(): IterableIterator<SegmentData>', arkTsAveragedTime);
    // })

    it('PerformanceTest_Intl_Segments_SegmentData_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let segmenter: Intl.Segmenter = new Intl.Segmenter('zh-CN', { granularity: 'word' });
      let segments: Intl.Segments = segmenter.segment('Hello World 你好');
      let iter = segments.$_iterator();
      let result = iter.next();
      let segmentData = result.value!;
      let res = segmentData.segment.length;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = segmentData.segment.length;
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Intl.Segments SegmentData access: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.SegmentData', 'access',
        'SegmentData properties access', arkTsAveragedTime);
    })

    // ==================== Intl.NumberFormat formatRange重载测试 ====================

    it('PerformanceTest_Intl_NumberFormat_formatRange_bigint_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let formatter: Intl.NumberFormat = new Intl.NumberFormat('zh-CN');
      let res: string = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = formatter.formatRange(100000n, 999999n);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Intl.NumberFormat formatRange bigint: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.NumberFormat', 'formatRange',
        'formatRange(start: bigint, end: bigint): string', arkTsAveragedTime);
    })

    it('PerformanceTest_Intl_NumberFormat_formatRangeToParts_bigint_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let formatter: Intl.NumberFormat = new Intl.NumberFormat('zh-CN');
      let res: Intl.NumberRangeFormatPart[] = [];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = formatter.formatRangeToParts(100000n, 999999n);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Intl.NumberFormat formatRangeToParts bigint: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.NumberFormat', 'formatRangeToParts',
        'formatRangeToParts(start: bigint, end: bigint): NumberRangeFormatPart[]', arkTsAveragedTime);
    })

    // 以下用例与 IntlPerfTest.test.ets 重复，注释排除
    // ==================== Intl.ListFormat 重载测试 ====================
    /*
    it('PerformanceTest_Intl_ListFormat_format_iterable_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let formatter: Intl.ListFormat = new Intl.ListFormat('zh-CN', { type: 'conjunction' });
      let items: Array<string> = new Array<string>();
      items.push('苹果');
      items.push('香蕉');
      items.push('橙子');
      let res: string = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = formatter.format(items);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Intl.ListFormat format Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.ListFormat', 'format',
        'format(list: Array<string>): string', arkTsAveragedTime);
    })

    it('PerformanceTest_Intl_ListFormat_formatToParts_iterable_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let formatter: Intl.ListFormat = new Intl.ListFormat('zh-CN', { type: 'disjunction' });
      let items: Array<string> = new Array<string>();
      items.push('苹果');
      items.push('香蕉');
      items.push('橙子');
      let res: Array<Intl.FormatToPartsResult> = [];
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = formatter.formatToParts(items);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Intl.ListFormat formatToParts Array: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.ListFormat', 'formatToParts',
        'formatToParts(list: Array<string>): FormatToPartsResult[]', arkTsAveragedTime);
    })
    */

    // 以下用例与 IntlPerfTest.test.ets 重复，注释排除
    // ==================== Intl.RelativeTimeFormat 重载测试 ====================
    /*
    it('PerformanceTest_Intl_RelativeTimeFormat_format_negative_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let formatter: Intl.RelativeTimeFormat = new Intl.RelativeTimeFormat('zh-CN');
      let res: string = '';
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = formatter.format(-5, 'day');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Intl.RelativeTimeFormat format negative: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.RelativeTimeFormat', 'format',
        'format(value: number, unit: string): string', arkTsAveragedTime);
    })
    */

    // ==================== Intl.DisplayNames 类型测试 ====================

    it('PerformanceTest_Intl_DisplayNames_of_region_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let displayNames: Intl.DisplayNames = new Intl.DisplayNames('zh-CN', { type: 'region' });
      let res: string | undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = displayNames.of('US');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Intl.DisplayNames of region: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.DisplayNames', 'of',
        'of(code: string): string | undefined (type: region)', arkTsAveragedTime);
    })

    it('PerformanceTest_Intl_DisplayNames_of_script_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let displayNames: Intl.DisplayNames = new Intl.DisplayNames('zh-CN', { type: 'script' });
      let res: string | undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = displayNames.of('Hans');
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest Intl.DisplayNames of script: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.core', 'Intl.DisplayNames', 'of',
        'of(code: string): string | undefined (type: script)', arkTsAveragedTime);
    })

  })
}

