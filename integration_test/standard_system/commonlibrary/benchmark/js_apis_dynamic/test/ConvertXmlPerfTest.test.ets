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
import { convertxml } from '@kit.ArkTS';
import { systemDateTime } from '@kit.BasicServicesKit';
import performance from './Performance.util';

declare class ArkTools {
  static forceFullGC(): void;
}

export default function ConvertXmlPerfTest(): void {
  describe('ConvertXmlPerfTest', () => {
    const BASE_COUNT = 50000;
    const xml =
      '<?xml version="1.0" encoding="utf-8"?>' +
      '<note importance="high" logged="true">' +
      '<title>Happy</title>' +
      '<todo>Work</todo>' +
      '</note>';
    const options: convertxml.ConvertOptions = {
      trim: false,
      declarationKey: "_declaration",
      instructionKey: "_instruction",
      attributesKey: "_attributes",
      textKey: "_text",
      cdataKey: "_cdata",
      doctypeKey: "_doctype",
      commentKey: "_comment",
      parentKey: "_parent",
      typeKey: "_type",
      nameKey: "_name",
      elementsKey: "_elements"
    };

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    // ==================== 1. fastConvertToJSObject ====================

    it('PerformanceTest_ConvertXML_FastConvertToJSObject_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let conv = new convertxml.ConvertXML();
        let res: Object = conv.fastConvertToJSObject(xml, options);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = conv.fastConvertToJSObject(xml, options);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConvertXML_FastConvertToJSObject_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ConvertXML', 'fastConvertToJSObject',
          'fastConvertToJSObject(xml: string, options?: ConvertOptions): Object', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    // ==================== 2. largeConvertToJSObject ====================

    it('PerformanceTest_ConvertXML_LargeConvertToJSObject_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let conv = new convertxml.ConvertXML();
        let res: Object = conv.largeConvertToJSObject(xml, options);
        let arkTsAveragedTime: number = 0;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = conv.largeConvertToJSObject(xml, options);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_ConvertXML_LargeConvertToJSObject_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'ConvertXML', 'largeConvertToJSObject',
          'largeConvertToJSObject(xml: string, options?: ConvertOptions): Object', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

  })
}
