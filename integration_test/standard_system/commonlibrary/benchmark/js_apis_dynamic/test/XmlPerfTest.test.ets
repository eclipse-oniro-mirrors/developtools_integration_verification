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
import { xml } from '@kit.ArkTS';
import { util } from '@kit.ArkTS';
import { systemDateTime } from '@kit.BasicServicesKit';

let savedParseInfo: xml.ParseInfo | null = null;
function func(key: xml.EventType, value: xml.ParseInfo) {
  savedParseInfo = value;
  return true;
}
function func1(key: xml.EventType, value: xml.ParseInfo) {
  if (key == xml.EventType.CDSECT) {
  }
  return true;
}
function func2(name: string, value: string) {
  return true;
}

declare class ArkTools {
  static forceFullGC(): void;
}

export default function XmlPerfTest(): void {
  describe('XmlPerfTest', () => {
    const BASE_COUNT = 1000;

    beforeEach(() => {
      ArkTools.forceFullGC();
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    })

    it('XmlPerfTest_XmlSerializer_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        const bufferSize = 2048;
        const arrayBuffer = new ArrayBuffer(bufferSize);
        let res = new xml.XmlSerializer(arrayBuffer, 'utf-8');
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new xml.XmlSerializer(arrayBuffer, 'utf-8');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsXmlPerfTest arkTsAveragedTime XmlPerfTest_XmlSerializer_Constructor_0100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('kit.ArkTS', 'XmlSerializer', 'constructor',
          'constructor(buffer: ArrayBuffer, encoding?: string): XmlSerializer', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('XmlPerfTest_void_setAttributes_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let serializers: xml.XmlSerializer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          let s = new xml.XmlSerializer(new ArrayBuffer(2048), 'utf-8');
          s.startElement("note");
          serializers.push(s);
        }
        let res: void = serializers[0].setAttributes("importance", "high");
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = serializers[i].setAttributes("importance", "high");
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsXmlPerfTest arkTsAveragedTime XmlPerfTest_void_setAttributes_0200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'XmlSerializer', 'setAttributes',
          'setAttributes(name: string, value: string): void;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('XmlPerfTest_void_addEmptyElement_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let serializers: xml.XmlSerializer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          serializers.push(new xml.XmlSerializer(new ArrayBuffer(2048), 'utf-8'));
        }
        let res: void = serializers[0].addEmptyElement("d");
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = serializers[i].addEmptyElement("d");
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsXmlPerfTest arkTsAveragedTime XmlPerfTest_void_addEmptyElement_0300: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'XmlSerializer', 'addEmptyElement',
          'addEmptyElement(name: string): void;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('XmlPerfTest_void_setDeclaration_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let serializers: xml.XmlSerializer[] = [];
        for (let j = 0; j < BASE_COUNT + 1; j++) {
          serializers.push(new xml.XmlSerializer(new ArrayBuffer(2048), 'utf-8'));
        }
        let res: void = serializers[BASE_COUNT].setDeclaration();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = serializers[i].setDeclaration();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsXmlPerfTest arkTsAveragedTime XmlPerfTest_void_setDeclaration_0400: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'XmlSerializer', 'setDeclaration',
          'setDeclaration(): void;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('XmlPerfTest_void_startElement_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let serializers: xml.XmlSerializer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          serializers.push(new xml.XmlSerializer(new ArrayBuffer(2048), 'utf-8'));
        }
        let res: void = serializers[0].startElement("note");
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = serializers[i].startElement("note");
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsXmlPerfTest arkTsAveragedTime XmlPerfTest_void_startElement_0500: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'XmlSerializer', 'startElement',
          'startElement(name: string): void;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('XmlPerfTest_void_endElement_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let serializers: xml.XmlSerializer[] = [];
        for (let j = 0; j < BASE_COUNT + 1; j++) {
          let s = new xml.XmlSerializer(new ArrayBuffer(2048), 'utf-8');
          s.startElement("n");
          serializers.push(s);
        }
        let res: void = serializers[BASE_COUNT].endElement();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = serializers[i].endElement();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsXmlPerfTest arkTsAveragedTime XmlPerfTest_void_endElement_0600: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'XmlSerializer', 'endElement',
          'endElement(): void;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('XmlPerfTest_void_setNamespace_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let serializers: xml.XmlSerializer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          serializers.push(new xml.XmlSerializer(new ArrayBuffer(2048), 'utf-8'));
        }
        let res: void = serializers[0].setNamespace("h", "http://www.w3.org/TR/html4/");
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = serializers[i].setNamespace("h", "http://www.w3.org/TR/html4/");
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsXmlPerfTest arkTsAveragedTime XmlPerfTest_void_setNamespace_0700: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'XmlSerializer', 'setNamespace',
          'setNamespace(prefix: string, namespace: string): void;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('XmlPerfTest_void_setComment_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let serializers: xml.XmlSerializer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          serializers.push(new xml.XmlSerializer(new ArrayBuffer(2048), 'utf-8'));
        }
        let res: void = serializers[0].setComment("Hello, World!");
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = serializers[i].setComment("Hello, World!");
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsXmlPerfTest arkTsAveragedTime XmlPerfTest_void_setComment_0800: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'XmlSerializer', 'setComment',
          'setComment(text: string): void;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('XmlPerfTest_void_setCDATA_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let serializers: xml.XmlSerializer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          serializers.push(new xml.XmlSerializer(new ArrayBuffer(2048), 'utf-8'));
        }
        let res: void = serializers[0].setCDATA('root SYSTEM');
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = serializers[i].setCDATA('root SYSTEM');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsXmlPerfTest arkTsAveragedTime XmlPerfTest_void_setCDATA_0900: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'XmlSerializer', 'setCDATA',
          'setCDATA(text: string): void;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('XmlPerfTest_void_setText_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let serializers: xml.XmlSerializer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          let s = new xml.XmlSerializer(new ArrayBuffer(2048), 'utf-8');
          s.startElement("note");
          serializers.push(s);
        }
        let res: void = serializers[0].setText("Happy");
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = serializers[i].setText("Happy");
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsXmlPerfTest arkTsAveragedTime XmlPerfTest_void_setText_1000: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'XmlSerializer', 'setText',
          'setText(text: string): void;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('XmlPerfTest_void_setDocType_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let serializers: xml.XmlSerializer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          serializers.push(new xml.XmlSerializer(new ArrayBuffer(2048), 'utf-8'));
        }
        let res: void = serializers[0].setDocType('root SYSTEM "http://www.test.org/test.dtd"');
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = serializers[i].setDocType('root SYSTEM "http://www.test.org/test.dtd"');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsXmlPerfTest arkTsAveragedTime XmlPerfTest_void_setDocType_1100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'XmlSerializer', 'setDocType',
          'setDocType(text: string): void;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('XmlPerfTest_XmlDynamicSerializer_Constructor_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res = new xml.XmlDynamicSerializer('utf-8');
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new xml.XmlDynamicSerializer('utf-8');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsXmlPerfTest arkTsAveragedTime XmlPerfTest_XmlDynamicSerializer' +
          '_Constructor_1200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'XmlDynamicSerializer', 'Constructor',
          'constructor(encoding?: string);', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('XmlPerfTest_ArrayBuffer_getOutput_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let serializer = new xml.XmlDynamicSerializer('utf-8');
        serializer.startElement("note");
        serializer.setText("Happy");
        serializer.endElement();
        let res: ArrayBuffer = serializer.getOutput();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = serializer.getOutput();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsXmlPerfTest arkTsAveragedTime XmlPerfTest_ArrayBuffer_getOutput_1300: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'XmlDynamicSerializer', 'getOutput',
          'getOutput(): ArrayBuffer;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('XmlPerfTest_void_setAttributes_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let serializers: xml.XmlDynamicSerializer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          let s = new xml.XmlDynamicSerializer('utf-8');
          s.startElement("note");
          serializers.push(s);
        }
        let res: void = serializers[0].setAttributes("importance", "high");
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = serializers[i].setAttributes("importance", "high");
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsXmlPerfTest arkTsAveragedTime XmlPerfTest_void_setAttributes_1400: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'XmlDynamicSerializer', 'setAttributes',
          'setAttributes(name: string, value: string): void;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('XmlPerfTest_void_addEmptyElement_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let serializers: xml.XmlDynamicSerializer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          serializers.push(new xml.XmlDynamicSerializer('utf-8'));
        }
        let res: void = serializers[0].addEmptyElement("d");
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = serializers[i].addEmptyElement("testElem");
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsXmlPerfTest arkTsAveragedTime XmlPerfTest_void_addEmptyElement_1500: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'XmlDynamicSerializer', 'addEmptyElement',
          'addEmptyElement(name: string): void;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('XmlPerfTest_void_setDeclaration_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let serializers: xml.XmlDynamicSerializer[] = [];
        for (let j = 0; j < BASE_COUNT + 1; j++) {
          serializers.push(new xml.XmlDynamicSerializer('utf-8'));
        }
        let res: void = serializers[BASE_COUNT].setDeclaration();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = serializers[i].setDeclaration();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsXmlPerfTest arkTsAveragedTime XmlPerfTest_void_setDeclaration_1600: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'XmlDynamicSerializer', 'setDeclaration',
          'setDeclaration(): void;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('XmlPerfTest_void_startElement_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let serializers: xml.XmlDynamicSerializer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          serializers.push(new xml.XmlDynamicSerializer('utf-8'));
        }
        let res: void = serializers[0].startElement("note");
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = serializers[i].startElement("note");
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsXmlPerfTest arkTsAveragedTime XmlPerfTest_void_startElement_1700: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'XmlDynamicSerializer', 'startElement',
          'startElement(name: string): void;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('XmlPerfTest_void_endElement_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let serializers: xml.XmlDynamicSerializer[] = [];
        for (let j = 0; j < BASE_COUNT + 1; j++) {
          let s = new xml.XmlDynamicSerializer('utf-8');
          s.startElement("n");
          serializers.push(s);
        }
        let res: void = serializers[BASE_COUNT].endElement();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = serializers[i].endElement();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsXmlPerfTest arkTsAveragedTime XmlPerfTest_void_endElement_1800: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'XmlDynamicSerializer', 'endElement',
          'endElement(): void;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('XmlPerfTest_void_setNamespace_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let serializers: xml.XmlDynamicSerializer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          serializers.push(new xml.XmlDynamicSerializer('utf-8'));
        }
        let res: void = serializers[0].setNamespace("h", "http://www.w3.org/TR/html4/");
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = serializers[i].setNamespace("h", "http://www.w3.org/TR/html4/");
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsXmlPerfTest arkTsAveragedTime XmlPerfTest_void_setNamespace_1900: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'XmlDynamicSerializer', 'setNamespace',
          'setNamespace(prefix: string, namespace: string): void;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('XmlPerfTest_void_setComment_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let serializers: xml.XmlDynamicSerializer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          serializers.push(new xml.XmlDynamicSerializer('utf-8'));
        }
        let res: void = serializers[0].setComment("Hello, World!");
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = serializers[i].setComment("Hello, World!");
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsXmlPerfTest arkTsAveragedTime XmlPerfTest_void_setComment_2000: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'XmlDynamicSerializer', 'setComment',
          'setComment(text: string): void;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('XmlPerfTest_void_setCdata_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let serializers: xml.XmlDynamicSerializer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          serializers.push(new xml.XmlDynamicSerializer('utf-8'));
        }
        let res: void = serializers[0].setCdata('root SYSTEM');
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = serializers[i].setCdata('root SYSTEM');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsXmlPerfTest arkTsAveragedTime XmlPerfTest_void_setCdata_2100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'XmlDynamicSerializer', 'setCdata',
          'setCdata(text: string): void;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('XmlPerfTest_void_setText_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let serializers: xml.XmlDynamicSerializer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          let s = new xml.XmlDynamicSerializer('utf-8');
          s.startElement("note");
          serializers.push(s);
        }
        let res: void = serializers[0].setText("Happy");
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = serializers[i].setText("Happy");
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsXmlPerfTest arkTsAveragedTime XmlPerfTest_void_setText_2200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'XmlDynamicSerializer', 'setText',
          'setText(text: string): void;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('XmlPerfTest_void_setDocType_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let serializers: xml.XmlDynamicSerializer[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          serializers.push(new xml.XmlDynamicSerializer('utf-8'));
        }
        let res: void = serializers[0].setDocType('root SYSTEM "http://www.test.org/test.dtd"');
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = serializers[i].setDocType('root SYSTEM "http://www.test.org/test.dtd"');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsXmlPerfTest arkTsAveragedTime XmlPerfTest_void_setDocType_2300: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'XmlDynamicSerializer', 'setDocType',
          'setDocType(text: string): void;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('XmlPerfTest_XmlPullParser_Constructor_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let strXml = '<title>Happy</title>';
        let textEncoder = new util.TextEncoder();
        let uint8Array = textEncoder.encodeInto(strXml);
        let arrayBuffer = uint8Array.buffer as ArrayBuffer;
        let res = new xml.XmlPullParser(arrayBuffer, 'UTF-8');
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = new xml.XmlPullParser(arrayBuffer, 'UTF-8');
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsXmlPerfTest arkTsAveragedTime XmlPerfTest_XmlPullParser_Constructor_2400: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'XmlPullParser', 'Constructor',
          'constructor(buffer: ArrayBuffer | DataView, encoding?: string);', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('XmlPerfTest_void_parseXml_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let strxml =
          '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '    <title><![CDATA[测试\n测试]]></title>' +
            '</note>';
        let textEncoder = new util.TextEncoder();
        let uint8 = textEncoder.encodeInto(strxml);
        let options: xml.ParseOptions = {supportDoctype:true, ignoreNameSpace:true, tokenValueCallbackFunction:func1}
        let parsers: xml.XmlPullParser[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          parsers.push(new xml.XmlPullParser(uint8.buffer as object as ArrayBuffer));
        }
        let res: void = parsers[0].parseXml(options);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = parsers[i].parseXml(options);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsXmlPerfTest arkTsAveragedTime XmlPerfTest_void_parseXml_2500: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'XmlPullParser', 'parseXml',
          'parseXml(option: ParseOptions): void;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('XmlPerfTest_void_parse_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let strXml =
          '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '<company>John &amp; Hans</company>' +
            '<title>Happy</title>' +
            '</note>';
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(strXml);

        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: true,
          tagValueCallbackFunction: func2
        };

        let parsers: xml.XmlPullParser[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          parsers.push(new xml.XmlPullParser(arrbuffer.buffer as ArrayBuffer, 'UTF-8'));
        }
        let res: void = parsers[0].parse(options);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = parsers[i].parse(options);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsXmlPerfTest arkTsAveragedTime XmlPerfTest_void_parse_2600: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'XmlPullParser', 'parse',
          'parse(option: ParseOptions): void;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('XmlPerfTest_void_parseXmlWithAttrTagCb_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let xmlStr =
          '<?xml version="1.0" encoding="utf-8"?>' +
            '<column name="Giana"><value integer="1"/></column>' +
            '<column name="category"><value Boolean="true"/></column>' +
            '<column name="day"><orange Boolean="3"/></column>';
        let textEncoder = new util.TextEncoder();
        let arrBuffer = textEncoder.encodeInto(xmlStr);

        let attrWithTag = (tagName: string, key: string, value: string): boolean => {
          return true;
        }

        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: true,
          attributeWithTagCallbackFunction: attrWithTag
        };

        let parsers: xml.XmlPullParser[] = [];
        for (let j = 0; j < BASE_COUNT; j++) {
          parsers.push(new xml.XmlPullParser(arrBuffer.buffer as ArrayBuffer, 'UTF-8'));
        }
        let res: void = parsers[0].parseXml(options);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = parsers[i].parseXml(options);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsXmlPerfTest arkTsAveragedTime XmlPerfTest_void_' +
          'parseXmlWithAttrTagCb_2700: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'ParseOptions', 'attributeWithTagCallbackFunction',
          'attributeWithTagCallbackFunction?: (tagName: string, key: string, value: string) => boolean;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('XmlPerfTest_number_getColumnNumber_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let strXml = '<?xml version="1.0" encoding="utf-8"?><note>Happy</note>';
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as ArrayBuffer);

        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: true,
          tokenValueCallbackFunction: func
        };
        savedParseInfo = null;
        that.parseXml(options);

        let res = savedParseInfo!.getColumnNumber();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = savedParseInfo!.getColumnNumber();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsXmlPerfTest arkTsAveragedTime XmlPerfTest_number_getColumnNumber_2800: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'ParseInfo', 'getColumnNumber',
          'getColumnNumber(): number;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('XmlPerfTest_number_getDepth_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let strXml =
          '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high">' +
            '<title>Happy</title>' +
            '</note>';
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as ArrayBuffer);

        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: true,
          tokenValueCallbackFunction: func
        };
        savedParseInfo = null;
        that.parseXml(options);

        let res = savedParseInfo!.getDepth();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = savedParseInfo!.getDepth();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsXmlPerfTest arkTsAveragedTime XmlPerfTest_number_getDepth_2900: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'ParseInfo', 'getDepth',
          'getDepth(): number;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('XmlPerfTest_number_getLineNumber_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let strXml = '<?xml version="1.0" encoding="utf-8"?><note>Work</note>';
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as ArrayBuffer);

        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: true,
          tokenValueCallbackFunction: func
        };
        savedParseInfo = null;
        that.parseXml(options);

        let res = savedParseInfo!.getLineNumber();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = savedParseInfo!.getLineNumber();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsXmlPerfTest arkTsAveragedTime XmlPerfTest_number_getLineNumber_3000: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'ParseInfo', 'getLineNumber',
          'getLineNumber(): number;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('XmlPerfTest_string_getName_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let strXml = '<?xml version="1.0" encoding="utf-8"?><note>Happy</note>';
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as ArrayBuffer);

        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: true,
          tokenValueCallbackFunction: func
        };
        savedParseInfo = null;
        that.parseXml(options);

        let res = savedParseInfo!.getName();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = savedParseInfo!.getName();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsXmlPerfTest arkTsAveragedTime XmlPerfTest_string_getName_3100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'ParseInfo', 'getName',
          'getName(): string;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('XmlPerfTest_string_getNamespace_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let strXml =
          '<?xml version="1.0" encoding="utf-8"?>' +
            '<note xmlns:h="http://www.w3.org">' +
            '<h:title>Happy</h:title>' +
            '</note>';
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as ArrayBuffer);

        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: false,
          tokenValueCallbackFunction: func
        };
        savedParseInfo = null;
        that.parseXml(options);

        let res: string = savedParseInfo!.getNamespace();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = savedParseInfo!.getNamespace();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsXmlPerfTest arkTsAveragedTime XmlPerfTest_string_getNamespace_3200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'ParseInfo', 'getNamespace',
          'getNamespace(): string;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('XmlPerfTest_string_getPrefix_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let strXml =
          '<?xml version="1.0" encoding="utf-8"?>' +
            '<note xmlns:h="http://www.w3.org/TR/html4">' +
            '<h:title>Happy</h:title>' +
            '</note>';
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as ArrayBuffer);

        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: false,
          tokenValueCallbackFunction: func
        };
        savedParseInfo = null;
        that.parseXml(options);

        let res: string = savedParseInfo!.getPrefix();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = savedParseInfo!.getPrefix();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsXmlPerfTest arkTsAveragedTime XmlPerfTest_string_getPrefix_3300: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'ParseInfo', 'getPrefix',
          'getPrefix(): string;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('XmlPerfTest_string_getText_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let strXml = '<?xml version="1.0" encoding="utf-8"?><note>Happy</note>';
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as ArrayBuffer);

        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: true,
          tokenValueCallbackFunction: func
        };
        savedParseInfo = null;
        that.parseXml(options);

        let res: string = savedParseInfo!.getText();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = savedParseInfo!.getText();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsXmlPerfTest arkTsAveragedTime XmlPerfTest_string_getText_3400: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'ParseInfo', 'getText',
          'getText(): string;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('XmlPerfTest_boolean_isEmptyElementTag_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let strXml =
          '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '<title/>' +
            '</note>';
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as ArrayBuffer);

        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: true,
          tokenValueCallbackFunction: func
        };
        savedParseInfo = null;
        that.parseXml(options);

        let res: boolean = false;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = savedParseInfo!.isEmptyElementTag();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsXmlPerfTest arkTsAveragedTime XmlPerfTest_boolean_isEmptyElementTag_3500: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'ParseInfo', 'isEmptyElementTag',
          'isEmptyElementTag(): boolean;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('XmlPerfTest_boolean_isWhitespace_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let strXml =
          '<?xml version="1.0" encoding="utf-8"?>' +
            '<note importance="high" logged="true">' +
            '<title> </title>' +
            '</note>';
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as ArrayBuffer);

        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: true,
          tokenValueCallbackFunction: func
        };
        savedParseInfo = null;
        that.parseXml(options);

        let res: boolean = false;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = savedParseInfo!.isWhitespace();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsXmlPerfTest arkTsAveragedTime XmlPerfTest_boolean_isWhitespace_3600: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'ParseInfo', 'isWhitespace',
          'isWhitespace(): boolean;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('XmlPerfTest_number_getAttributeCount_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let strXml = '<?xml version="1.0" encoding="utf-8"?><note importance="high" logged="true"/>';
        let textEncoder = new util.TextEncoder();
        let arrbuffer = textEncoder.encodeInto(strXml);
        let that = new xml.XmlPullParser(arrbuffer.buffer as ArrayBuffer);

        let options: xml.ParseOptions = {
          supportDoctype: true,
          ignoreNameSpace: true,
          tokenValueCallbackFunction: func
        };
        savedParseInfo = null;
        that.parseXml(options);

        let res: number = savedParseInfo!.getAttributeCount();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = savedParseInfo!.getAttributeCount();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsXmlPerfTest arkTsAveragedTime XmlPerfTest_number_getAttributeCount_3700: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'ParseInfo', 'getAttributeCount',
          'getAttributeCount(): number;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('XmlPerfTest_EventType_AccessEnum_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let res = xml.EventType.START_DOCUMENT;
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = xml.EventType.START_DOCUMENT;
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsXmlPerfTest arkTsAveragedTime XmlPerfTest_EventType_AccessEnum_3800: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'EventType', 'AccessEnum',
          'START_DOCUMENT = 0;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('XmlPerfTest_void_startDocument_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let handler: xml.XmlSAXHandler = {
          startDocument: () => {},
          endDocument: () => {},
          startElement: (elementName: string, namespaceURI: string | undefined, qName: string | undefined,
            attributes: Map<string, string>) => {},
          endElement: (elementName: string, namespaceURI: string | undefined, qName: string | undefined) => {},
          characters: (content: string) => {}
        };
        let res: void = handler.startDocument();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = handler.startDocument();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsXmlPerfTest arkTsAveragedTime XmlPerfTest_void_startDocument_3900: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'XmlSAXHandler', 'startDocument',
          'startDocument(): void;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('XmlPerfTest_void_endDocument_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let handler: xml.XmlSAXHandler = {
          startDocument: () => {},
          endDocument: () => {},
          startElement: (elementName: string, namespaceURI: string | undefined, qName: string | undefined,
            attributes: Map<string, string>) => {},
          endElement: (elementName: string, namespaceURI: string | undefined, qName: string | undefined) => {},
          characters: (content: string) => {}
        };
        let res: void = handler.endDocument();
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = handler.endDocument();
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsXmlPerfTest arkTsAveragedTime XmlPerfTest_void_endDocument_4000: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'XmlSAXHandler', 'endDocument',
          'endDocument(): void;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('XmlPerfTest_void_startElement_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let handler: xml.XmlSAXHandler = {
          startDocument: () => {},
          endDocument: () => {},
          startElement: (elementName: string, namespaceURI: string | undefined, qName: string | undefined,
            attributes: Map<string, string>) => {},
          endElement: (elementName: string, namespaceURI: string | undefined, qName: string | undefined) => {},
          characters: (content: string) => {}
        };
        const elementName = "child";
        const namespaceURI = "http://example.com/ns2";
        const qName = "ns2:child";
        const attributes = new Map<string, string>();
        attributes.set("attr1", "value1");
        attributes.set("attr2", "value2");

        let res: void = handler.startElement(elementName, namespaceURI, qName, attributes);
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = handler.startElement(elementName, namespaceURI, qName, attributes);
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsXmlPerfTest arkTsAveragedTime XmlPerfTest_void_startElement_4100: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'XmlSAXHandler', 'startElement',
          'startElement(elementName: string, namespaceURI: string | undefined, qName: string | undefined, ' +
            'attributes: Map<string, string>): void;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('XmlPerfTest_void_endElement_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let handler: xml.XmlSAXHandler = {
          startDocument: () => {},
          endDocument: () => {},
          startElement: (elementName: string, namespaceURI: string | undefined, qName: string | undefined,
            attributes: Map<string, string>) => {},
          endElement: (elementName: string, namespaceURI: string | undefined, qName: string | undefined) => {},
          characters: (content: string) => {}
        };
        let res: void = handler.endElement("child", "http://example.com/ns2", "ns2:child");
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = handler.endElement("child", "http://example.com/ns2", "ns2:child");
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsXmlPerfTest arkTsAveragedTime XmlPerfTest_void_endElement_4200: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'XmlSAXHandler', 'endElement',
          'endElement(elementName: string, namespaceURI: string | undefined, qName: string | undefined): void;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })

    it('XmlPerfTest_void_characters_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      (done: Function) => {
        let handler: xml.XmlSAXHandler = {
          startDocument: () => {},
          endDocument: () => {},
          startElement: (elementName: string, namespaceURI: string | undefined, qName: string | undefined,
            attributes: Map<string, string>) => {},
          endElement: (elementName: string, namespaceURI: string | undefined, qName: string | undefined) => {},
          characters: (content: string) => {}
        };
        let res: void = handler.characters("Text content");
        let Stime = systemDateTime.getTime(true);
        for (let i = 0; i < BASE_COUNT; i++) {
          res = handler.characters("Text content");
        }
        let Dtime = systemDateTime.getTime(true) - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime / BASE_COUNT;
        console.info('arkTsXmlPerfTest arkTsAveragedTime XmlPerfTest_void_characters_4300: '
          + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('ohos.util', 'XmlSAXHandler', 'characters',
          'characters(content: string): void;', arkTsAveragedTime);
        setTimeout(() => { done(); }, 10);
      })
  })
}