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
import { xml, util, stream } from '@kit.ArkTS';

class TestReadable extends stream.Readable {
  constructor() {
    super();
  }
  doRead(size: number): void {
  }
}

class TestXmlSAXHandler implements xml.XmlSAXHandler {
  startDocument(): void {}
  endDocument(): void {}
  startElement(elementName: string, namespaceURI?: string, qName?: string, attributes?: Map<string, string>): void {}
  endElement(elementName: string, namespaceURI?: string, qName?: string): void {}
  characters(content: string): void {}
}

export default function XmlSerializerPerfTest(): void {
  describe('XmlSerializerTest', () => {
    const BASE_COUNT = 1000;

    beforeEach(() => {
      let ret = GC.startGC(GC.Cause.FULL, true);
      GC.waitForFinishGC(ret);
      let ret1 = GC.startGC(GC.Cause.FULL, true);
      GC.waitForFinishGC(ret1);
    })

    afterAll(() => {
      performance.save('apiPerformance.txt');
    });

    it('XmlSerializerPerfTest_void_constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arrayBuffer = new ArrayBuffer(2048);
      let res = new xml.XmlSerializer(arrayBuffer, "utf-8");
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new xml.XmlSerializer(arrayBuffer, "utf-8");
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsXmlSerializerPerfTest arkTsAveragedTime XmlSerializerPerfTest_void_constructor_0100: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.xml', 'XmlSerializer', 'constructor',
        'constructor(buffer: ArrayBuffer | DataView, encoding?: string): XmlSerializer', arkTsAveragedTime);
    })

    it('XmlSerializerPerfTest_void_setAttributes_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let serializers: xml.XmlSerializer[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        let s = new xml.XmlSerializer(new ArrayBuffer(2048), "utf-8");
        s.startElement("note");
        serializers.push(s);
      }
      let res: void = serializers[0].setAttributes("importance", "high");
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = serializers[i].setAttributes("importance", "high");
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsXmlSerializerPerfTest arkTsAveragedTime XmlSerializerPerfTest_void_setAttributes_0200: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.xml', 'XmlSerializer', 'setAttributes',
        'setAttributes(name: string, value: string): void', arkTsAveragedTime);
    })

    it('XmlSerializerPerfTest_void_addEmptyElement_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let serializers: xml.XmlSerializer[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        serializers.push(new xml.XmlSerializer(new ArrayBuffer(2048), "utf-8"));
      }
      let res: void = serializers[0].addEmptyElement("d");
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = serializers[i].addEmptyElement("d");
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsXmlSerializerPerfTest arkTsAveragedTime XmlSerializerPerfTest_void_addEmptyElement_0300: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.xml', 'XmlSerializer', 'addEmptyElement',
        'addEmptyElement(name: string): void', arkTsAveragedTime);
    })

    it('XmlSerializerPerfTest_void_setDeclaration_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arrayBuffer = new ArrayBuffer(2048);
      let res = new xml.XmlSerializer(arrayBuffer, "utf-8").setDeclaration()
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new xml.XmlSerializer(arrayBuffer, "utf-8").setDeclaration();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsXmlSerializerPerfTest arkTsAveragedTime XmlSerializerPerfTest_void_setDeclaration_0400: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.xml', 'XmlSerializer', 'setDeclaration',
        'setDeclaration(): void', arkTsAveragedTime);
    });

    it('XmlSerializerPerfTest_void_startElement_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arrayBuffer = new ArrayBuffer(2048);
      let res: void = new xml.XmlSerializer(arrayBuffer, "utf-8").startElement("note");
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new xml.XmlSerializer(arrayBuffer, "utf-8").startElement("note");
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsXmlSerializerPerfTest arkTsAveragedTime XmlSerializerPerfTest_void_startElement_0500: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.xml', 'XmlSerializer', 'startElement',
        'startElement(name: string): void', arkTsAveragedTime);
    })

    it('XmlSerializerPerfTest_void_endElement_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let serializers: xml.XmlSerializer[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        let s = new xml.XmlSerializer(new ArrayBuffer(2048), "utf-8");
        s.startElement("n");
        serializers.push(s);
      }
      let res: void = undefined;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = serializers[i].endElement();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsXmlSerializerPerfTest arkTsAveragedTime XmlSerializerPerfTest_void_endElement_0600: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.xml', 'XmlSerializer', 'endElement',
        'endElement(): void', arkTsAveragedTime);
    })

    it('XmlSerializerPerfTest_void_setNamespace_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let serializers: xml.XmlSerializer[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        serializers.push(new xml.XmlSerializer(new ArrayBuffer(2048), "utf-8"));
      }
      let res: void = serializers[0].setNamespace("h", "http://www.w3.org/TR/html4/");
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = serializers[i].setNamespace("h", "http://www.w3.org/TR/html4/");
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsXmlSerializerPerfTest arkTsAveragedTime XmlSerializerPerfTest_void_setNamespace_0700: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.xml', 'XmlSerializer', 'setNamespace',
        'setNamespace(prefix: string, namespace: string): void', arkTsAveragedTime);
    })

    it('XmlSerializerPerfTest_void_setComment_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let serializers: xml.XmlSerializer[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        serializers.push(new xml.XmlSerializer(new ArrayBuffer(2048), "utf-8"));
      }
      let res: void = serializers[0].setComment("Hello, World!");
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = serializers[i].setComment("Hello, World!");
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsXmlSerializerPerfTest arkTsAveragedTime XmlSerializerPerfTest_void_setComment_0800: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.xml', 'XmlSerializer', 'setComment',
        'setComment(text: string): void', arkTsAveragedTime);
    })

    it('XmlSerializerPerfTest_void_setCDATA_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let serializers: xml.XmlSerializer[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        serializers.push(new xml.XmlSerializer(new ArrayBuffer(2048), "utf-8"));
      }
      let res: void = serializers[0].setCDATA('root SYSTEM');
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = serializers[i].setCDATA('root SYSTEM');
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsXmlSerializerPerfTest arkTsAveragedTime XmlSerializerPerfTest_void_setCDATA_0900: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.xml', 'XmlSerializer', 'setCDATA',
        'setCDATA(text: string): void', arkTsAveragedTime);
    })

    it('XmlSerializerPerfTest_void_setText_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let serializers: xml.XmlSerializer[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        let s = new xml.XmlSerializer(new ArrayBuffer(2048), "utf-8");
        s.startElement("note");
        serializers.push(s);
      }
      let res: void = serializers[0].setText("Happy");
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = serializers[i].setText("Happy");
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsXmlSerializerPerfTest arkTsAveragedTime XmlSerializerPerfTest_void_setText_1000: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.xml', 'XmlSerializer', 'setText',
        'setText(text: string): void', arkTsAveragedTime);
    })

    it('XmlSerializerPerfTest_void_setDocType_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let serializers: xml.XmlSerializer[] = [];
      for (let j = 0; j < BASE_COUNT; j++) {
        serializers.push(new xml.XmlSerializer(new ArrayBuffer(2048), "utf-8"));
      }
      let res = serializers[0].setDocType('root SYSTEM "http://www.test.org/test.dtd"')
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = serializers[i].setDocType('root SYSTEM "http://www.test.org/test.dtd"');
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsXmlSerializerPerfTest arkTsAveragedTime XmlSerializerPerfTest_void_setDocType_1100: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.xml', 'XmlSerializer', 'setDocType',
        'setDocType(text: string): void', arkTsAveragedTime);
    });

    it('XmlDynamicSerializerPerfTest_void_constructor_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: xml.XmlDynamicSerializer = new xml.XmlDynamicSerializer('utf-8');
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new xml.XmlDynamicSerializer('utf-8');
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsXmlDynamicSerializerPerfTest arkTsAveragedTime XmlDynamicSerializerPerfTest_void_constructor' +
        '_1200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.xml', 'XmlDynamicSerializer', 'constructor',
        'constructor(encoding?: string): XmlDynamicSerializer', arkTsAveragedTime);
    })

    it('XmlDynamicSerializerPerfTest_ArrayBuffer_getOutput_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
      let serializer = new xml.XmlDynamicSerializer('utf-8');
      serializer.startElement("note");
      serializer.setText("Happy");
      serializer.endElement();
      let res: ArrayBuffer = serializer.getOutput();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = serializer.getOutput();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsXmlDynamicSerializerPerfTest arkTsAveragedTime XmlDynamicSerializerPerfTest_ArrayBuffer' +
        '_getOutput_1300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.xml', 'XmlDynamicSerializer', 'getOutput',
        'getOutput(): ArrayBuffer', arkTsAveragedTime);
    })

    it('XmlDynamicSerializerPerfTest_void_setAttributes_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
      let Xml1 = new xml.XmlDynamicSerializer();
      Xml1.startElement("note");
      let res: void = Xml1.setAttributes("k", "y");
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = Xml1.setAttributes("k", "y");
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsXmlDynamicSerializerPerfTest arkTsAveragedTime XmlDynamicSerializerPerfTest_void_' +
        'setAttributes_1400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.xml', 'XmlDynamicSerializer', 'setAttributes',
        'setAttributes(name: string, value: string): void', arkTsAveragedTime);
    })

    it('XmlDynamicSerializerPerfTest_void_addEmptyElement_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      () => {
      let Xml1 = new xml.XmlDynamicSerializer('utf-8');
      Xml1.startElement("n")
      let res: void = Xml1.addEmptyElement("d");
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++){
        res = Xml1.addEmptyElement("d");
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsXmlDynamicSerializerPerfTest arkTsAveragedTime XmlDynamicSerializerPerfTest_void_' +
        'addEmptyElement_1500: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.xml', 'XmlDynamicSerializer', 'addEmptyElement',
        'addEmptyElement(name: string): void', arkTsAveragedTime);
    })

    it('XmlDynamicSerializerPerfTest_void_setDeclaration_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let s = new xml.XmlDynamicSerializer();
      let res = s.setDeclaration()
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        s = new xml.XmlDynamicSerializer();
        res = s.setDeclaration()
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsXmlDynamicSerializerPerfTest arkTsAveragedTime XmlDynamicSerializerPerfTest_' +
        'void_setDeclaration_1600: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.xml', 'XmlDynamicSerializer', 'setDeclaration',
        'setDeclaration(): void', arkTsAveragedTime);
    });

    it('XmlDynamicSerializerPerfTest_void_startElement_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = new xml.XmlDynamicSerializer('utf-8').startElement("note")
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new xml.XmlDynamicSerializer('utf-8').startElement("note")
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsXmlDynamicSerializerPerfTest arkTsAveragedTime XmlDynamicSerializerPerfTest_void_' +
        'startElement_1700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.xml', 'XmlDynamicSerializer', 'startElement',
        'startElement(name: string): void', arkTsAveragedTime);
    });

    it('XmlDynamicSerializerPerfTest_void_endElement_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let serializer0 = new xml.XmlDynamicSerializer();
      serializer0.startElement("n")
      let res = serializer0.endElement()
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        let s = new xml.XmlDynamicSerializer();
        s.startElement("n");
        res = s.endElement();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsXmlDynamicSerializerPerfTest arkTsAveragedTime XmlDynamicSerializerPerfTest_void_' +
        'endElement_1800: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.xml', 'XmlDynamicSerializer', 'endElement',
        'endElement(): void', arkTsAveragedTime);
    });

    it('XmlDynamicSerializerPerfTest_void_setNamespace_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let serializer1 = new xml.XmlDynamicSerializer('utf-8');
      let res: void = serializer1.setNamespace("h", "y");
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = serializer1.setNamespace("h", "y");
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsXmlDynamicSerializerPerfTest arkTsAveragedTime XmlDynamicSerializerPerfTest_void_' +
        'setNamespace_1900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.xml', 'XmlDynamicSerializer', 'setNamespace',
        'setNamespace(prefix: string, namespace: string): void', arkTsAveragedTime);
    })

    it('XmlDynamicSerializerPerfTest_void_setComment_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: void = new xml.XmlDynamicSerializer('utf-8').setComment("Hello, World!");
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new xml.XmlDynamicSerializer('utf-8').setComment("Hello, World!");
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsXmlDynamicSerializerPerfTest arkTsAveragedTime XmlDynamicSerializerPerfTest_void_' +
        'setComment_2000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.xml', 'XmlDynamicSerializer', 'setComment',
        'setComment(text: string): void', arkTsAveragedTime);
    })

    it('XmlDynamicSerializerPerfTest_void_setCdata_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: void=new xml.XmlDynamicSerializer('utf-8').setCdata('root SYSTEM');
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new xml.XmlDynamicSerializer('utf-8').setCdata('root SYSTEM');
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsXmlDynamicSerializerPerfTest arkTsAveragedTime XmlDynamicSerializerPerfTest_void_' +
        'setCdata_2100: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.xml', 'XmlDynamicSerializer', 'setCdata',
        'setCdata(text: string): void', arkTsAveragedTime);
    })

    it('XmlDynamicSerializerPerfTest_void_setText_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: void = new xml.XmlDynamicSerializer('utf-8').setText("Happy");;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new xml.XmlDynamicSerializer('utf-8').setText("Happy");
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsXmlDynamicSerializerPerfTest arkTsAveragedTime XmlDynamicSerializerPerfTest_void_' +
        'setText_2200: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.xml', 'XmlDynamicSerializer', 'setText',
        'setText(text: string): void', arkTsAveragedTime);
    })

    it('XmlDynamicSerializerPerfTest_void_setDocType_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: void= new xml.XmlDynamicSerializer('utf-8').setDocType('root SYSTEM "http://www.test.org/test.dtd"');
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new xml.XmlDynamicSerializer('utf-8').setDocType('root SYSTEM "http://www.test.org/test.dtd"');
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsXmlDynamicSerializerPerfTest arkTsAveragedTime XmlDynamicSerializerPerfTest_void_' +
        'setDocType_2300: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.xml', 'XmlDynamicSerializer', 'setDocType',
        'setDocType(text: string): void', arkTsAveragedTime);
    })

    it('XmlPullParserPerfTest_void_constructor_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let strXml = '<title>Happy</title>';
      let textEncoder = new util.TextEncoder();
      let uint8Array = textEncoder.encodeInto(strXml);
      let buffer = uint8Array.buffer as object as ArrayBuffer;
      let res: xml.XmlPullParser= new xml.XmlPullParser(buffer, 'UTF-8');
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new xml.XmlPullParser(buffer, 'UTF-8');
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsXmlPullParserPerfTest arkTsAveragedTime XmlPullParserPerfTest_void_' +
        'constructor_2400: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.xml', 'XmlPullParser', 'constructor',
        'constructor(buffer: ArrayBuffer | DataView, encoding?: string): XmlPullParser', arkTsAveragedTime);
    })

    it('XmlPullParserPerfTest_void_parseXml_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let strXml = '<?xml version="1.0" encoding="utf-8"?>' +
        '<note importance="high" logged="true">' +
        '<company>John &amp; Hans</company>' +
        '<title>Happy</title>' +
        '</note>';
      let textEncoder = new util.TextEncoder();
      let arrbuffer = textEncoder.encodeInto(strXml);
      let that = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'UTF-8');
      let str = '';

      const func = (name: string, value: string): boolean => {
        str = name + value;
        console.info(str);
        return true;
      };
      let options: xml.ParseOptions = { supportDoctype: true, ignoreNameSpace: true, tagValueCallbackFunction: func };

      let res: void=that.parseXml(options);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = that.parseXml(options);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsXmlPullParserPerfTest arkTsAveragedTime XmlPullParserPerfTest_void_parseXml_2500: '
        + arkTsAveragedTime + 'ns');

      performance.apiWithClassAndKeywordTxt('std.xml', 'XmlPullParser', 'parseXml',
        'parseXml(option: ParseOptions): void', arkTsAveragedTime);
    })

    it('ParseOptionsPerfTest_void_tagValueCallback_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let strXml = '<?xml version="1.0" encoding="utf-8"?>' +
        '<note importance="high" logged="true">' +
        '<company>John &amp; Hans</company>' +
        '<title>Happy</title>' +
        '</note>';
      let textEncoder = new util.TextEncoder();
      let arrbuffer = textEncoder.encodeInto(strXml);
      let parser = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'UTF-8');

      let tagCallback = (name: string, value: string): boolean => {
        return true;
      };

      let options: xml.ParseOptions = {
        supportDoctype: true,
        ignoreNameSpace: true,
        tagValueCallbackFunction: tagCallback
      };

      let res: void= parser.parseXml(options);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = parser.parseXml(options);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsParseOptionsPerfTest arkTsAveragedTime ParseOptionsPerfTest_void_tagValueCallback_2600: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.xml', 'ParseOptions', 'tagValueCallbackFunction',
        'tagValueCallbackFunction: (name: string, value: string) => boolean', arkTsAveragedTime);
    })

    it('ParseOptionsPerfTest_void_attributeValueCallback_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let strXml = '<?xml version="1.0" encoding="utf-8"?>' +
        '<note importance="high" logged="true">' +
        '<company>John &amp; Hans</company>' +
        '<title>Happy</title>' +
        '</note>';
      let textEncoder = new util.TextEncoder();
      let arrbuffer = textEncoder.encodeInto(strXml);
      let parser = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer, 'UTF-8');

      let attrCallback = (name: string, value: string): boolean => {
        return true;
      };

      let options: xml.ParseOptions = {
        supportDoctype: true,
        ignoreNameSpace: true,
        attributeValueCallbackFunction: attrCallback
      };

      let res: void= parser.parseXml(options);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = parser.parseXml(options);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsParseOptionsPerfTest arkTsAveragedTime ParseOptionsPerfTest_void_' +
        'attributeValueCallback_2700: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.xml', 'ParseOptions', 'attributeValueCallbackFunction',
        'attributeValueCallbackFunction: (name: string, value: string) => boolean', arkTsAveragedTime);
    })

    it('ParseOptionsPerfTest_void_tokenValueCallback_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let strXml = '<?xml version="1.0" encoding="utf-8"?>' +
        '<note importance="high" logged="true">' +
        '<title><![CDATA[测试]]></title>' +
        '</note>';
      let textEncoder = new util.TextEncoder();
      let uint8 = textEncoder.encodeInto(strXml);
      let parser = new xml.XmlPullParser(uint8.buffer as object as ArrayBuffer);

      let tokenCallback = (eventType: xml.EventType, value: xml.ParseInfo): boolean => {
        return true;
      };

      let options: xml.ParseOptions = {
        supportDoctype: true,
        ignoreNameSpace: true,
        tokenValueCallbackFunction: tokenCallback
      };

      let res: void= parser.parseXml(options);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = parser.parseXml(options);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsParseOptionsPerfTest arkTsAveragedTime ParseOptionsPerfTest_void_tokenValueCallback_2800: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.xml', 'ParseOptions', 'tokenValueCallbackFunction',
        'tokenValueCallbackFunction: (eventType: EventType, value: ParseInfo) => boolean', arkTsAveragedTime);
    })

    it('ParseOptionsPerfTest_void_attributeWithTagCallback_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let xmlStr = '<?xml version="1.0" encoding="utf-8"?>' +
        '<column name="Giana"><value integer="1"/></column>' +
        '<column name="day"><orange Boolean="3"/></column>';
      let textEncoder = new util.TextEncoder();
      let arrBuffer = textEncoder.encodeInto(xmlStr);
      let parser = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer, 'UTF-8');

      let attrWithTagCallback = (tagName: string, key: string, value: string): boolean => {
        return true;
      };

      let options: xml.ParseOptions = {
        supportDoctype: true,
        ignoreNameSpace: true,
        attributeWithTagCallbackFunction: attrWithTagCallback
      };

      let res: void= parser.parseXml(options);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = parser.parseXml(options);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsParseOptionsPerfTest arkTsAveragedTime ParseOptionsPerfTest_void_' +
        'attributeWithTagCallback_2900: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.xml', 'ParseOptions', 'attributeWithTagCallbackFunction',
        'attributeWithTagCallbackFunction: AttributeWithTagCb', arkTsAveragedTime);
    })

    it('AttributeWithTagCbPerfTest_boolean_callback_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let xmlStr = '<?xml version="1.0" encoding="utf-8"?>' +
        '<column name="Giana"><value integer="1"/></column>' +
        '<column name="category"><value Boolean="true"/></column>' +
        '<column name="day"><orange Boolean="3"/></column>';
      let textEncoder = new util.TextEncoder();
      let arrBuffer = textEncoder.encodeInto(xmlStr);
      let parser = new xml.XmlPullParser(arrBuffer.buffer as object as ArrayBuffer, 'UTF-8');

      let attrWithTag = (tagName: string, key: string, value: string): boolean => {
        if (tagName == "orange") {
          console.info('key: ', key, ' value: ', value);
        }
        return true;
      };

      let options: xml.ParseOptions = {
        supportDoctype: true,
        ignoreNameSpace: true,
        attributeWithTagCallbackFunction: attrWithTag
      };

      let res: void= parser.parseXml(options);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = parser.parseXml(options);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsAttributeWithTagCbPerfTest arkTsAveragedTime AttributeWithTagCbPerfTest_' +
        'boolean_callback_3000: ' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.xml', 'AttributeWithTagCb', 'callback',
        '(tagName: string, key: string, value: string) => boolean', arkTsAveragedTime);
    })

    it('ParseInfoPerfTest_number_getColumnNumber_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let strXml = '<?xml version="1.0" encoding="utf-8"?><note>Happy</note>';
      let textEncoder = new util.TextEncoder();
      let arrbuffer = textEncoder.encodeInto(strXml);
      let parser = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer);

      let colNumber: number = 0;
      let parseInfoValue: xml.ParseInfo | undefined;

      const func = (key: xml.EventType, value: xml.ParseInfo): boolean => {
        parseInfoValue = value;
        return true;
      };

      let options: xml.ParseOptions = {
        supportDoctype: true,
        ignoreNameSpace: true,
        tokenValueCallbackFunction: func
      };
      parser.parseXml(options);

      let res: number= parseInfoValue!.getColumnNumber();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = parseInfoValue!.getColumnNumber();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsParseInfoPerfTest arkTsAveragedTime ParseInfoPerfTest_number_getColumnNumber_3100: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.xml', 'ParseInfo', 'getColumnNumber',
        'getColumnNumber(): number', arkTsAveragedTime);
    })

    it('ParseInfoPerfTest_number_getDepth_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let strXml = '<?xml version="1.0" encoding="utf-8"?>' +
        '<note importance="high">' +
        '<title>Happy</title>' +
        '</note>';
      let textEncoder = new util.TextEncoder();
      let arrbuffer = textEncoder.encodeInto(strXml);
      let parser = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer);

      let depthValue: number = 0;
      let parseInfoValue: xml.ParseInfo | undefined;

      const func = (key: xml.EventType, value: xml.ParseInfo): boolean => {
        parseInfoValue = value;
        return true;
      };

      let options: xml.ParseOptions = {
        supportDoctype: true,
        ignoreNameSpace: true,
        tokenValueCallbackFunction: func
      };
      parser.parseXml(options);

      let res: number= parseInfoValue!.getDepth();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = parseInfoValue!.getDepth();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsParseInfoPerfTest arkTsAveragedTime ParseInfoPerfTest_number_getDepth_3200: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.xml', 'ParseInfo', 'getDepth',
        'getDepth(): number', arkTsAveragedTime);
    })

    it('ParseInfoPerfTest_number_getLineNumber_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let strXml = '<?xml version="1.0" encoding="utf-8"?><note>Work</note>';
      let textEncoder = new util.TextEncoder();
      let arrbuffer = textEncoder.encodeInto(strXml);
      let parser = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer);

      let parseInfoValue: xml.ParseInfo | undefined;

      const func = (key: xml.EventType, value: xml.ParseInfo): boolean => {
        parseInfoValue = value;
        return true;
      };

      let options: xml.ParseOptions = {
        supportDoctype: true,
        ignoreNameSpace: true,
        tokenValueCallbackFunction: func
      };
      parser.parseXml(options);

      let res: number= parseInfoValue!.getLineNumber();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = parseInfoValue!.getLineNumber();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsParseInfoPerfTest arkTsAveragedTime ParseInfoPerfTest_number_getLineNumber_3300: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.xml', 'ParseInfo', 'getLineNumber',
        'getLineNumber(): number', arkTsAveragedTime);
    })

    it('ParseInfoPerfTest_string_getName_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let strXml = '<?xml version="1.0" encoding="utf-8"?><note>Happy</note>';
      let textEncoder = new util.TextEncoder();
      let arrbuffer = textEncoder.encodeInto(strXml);
      let parser = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer);

      let parseInfoValue: xml.ParseInfo | undefined;

      const func = (key: xml.EventType, value: xml.ParseInfo): boolean => {
        parseInfoValue = value;
        return true;
      };

      let options: xml.ParseOptions = {
        supportDoctype: true,
        ignoreNameSpace: true,
        tokenValueCallbackFunction: func
      };
      parser.parseXml(options);

      let res: string= parseInfoValue!.getName();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = parseInfoValue!.getName();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsParseInfoPerfTest arkTsAveragedTime ParseInfoPerfTest_string_getName_3400: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.xml', 'ParseInfo', 'getName',
        'getName(): string', arkTsAveragedTime);
    })

    it('ParseInfoPerfTest_string_getNamespace_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let strXml = '<?xml version="1.0" encoding="utf-8"?>' +
        '<note xmlns:h="http://www.w3.org">' +
        '<h:title>Happy</h:title>' +
        '</note>';
      let textEncoder = new util.TextEncoder();
      let arrbuffer = textEncoder.encodeInto(strXml);
      let parser = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer);

      let parseInfoValue: xml.ParseInfo | undefined;

      const func = (key: xml.EventType, value: xml.ParseInfo): boolean => {
        parseInfoValue = value;
        return true;
      };

      let options: xml.ParseOptions = {
        supportDoctype: true,
        ignoreNameSpace: false,
        tokenValueCallbackFunction: func
      };
      parser.parseXml(options);

      let res: string = parseInfoValue!.getNamespace();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = parseInfoValue!.getNamespace();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsParseInfoPerfTest arkTsAveragedTime ParseInfoPerfTest_string_getNamespace_3500: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.xml', 'ParseInfo', 'getNamespace',
        'getNamespace(): string', arkTsAveragedTime);
    })

    it('ParseInfoPerfTest_string_getPrefix_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let strXml = '<?xml version="1.0" encoding="utf-8"?>' +
        '<note xmlns:h="http://www.w3.org/TR/html4">' +
        '<h:title>Happy</h:title>' +
        '</note>';
      let textEncoder = new util.TextEncoder();
      let arrbuffer = textEncoder.encodeInto(strXml);
      let parser = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer);
      let parseInfoValue: xml.ParseInfo | undefined;
      const func = (key: xml.EventType, value: xml.ParseInfo): boolean => {
        parseInfoValue = value;
        return true;
      };
      let options: xml.ParseOptions = {
        supportDoctype: true,
        ignoreNameSpace: false,
        tokenValueCallbackFunction: func
      };
      parser.parseXml(options);
      let res: string = parseInfoValue!.getPrefix();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = parseInfoValue!.getPrefix();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsParseInfoPerfTest arkTsAveragedTime ParseInfoPerfTest_string_getPrefix_3600: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.xml', 'ParseInfo', 'getPrefix',
        'getPrefix(): string', arkTsAveragedTime);
    })

    it('ParseInfoPerfTest_string_getText_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let strXml = '<?xml version="1.0" encoding="utf-8"?><note>Happy</note>';
      let textEncoder = new util.TextEncoder();
      let arrbuffer = textEncoder.encodeInto(strXml);
      let parser = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer);

      let parseInfoValue: xml.ParseInfo | undefined;

      const func = (key: xml.EventType, value: xml.ParseInfo): boolean => {
        parseInfoValue = value;
        return true;
      };

      let options: xml.ParseOptions = {
        supportDoctype: true,
        ignoreNameSpace: true,
        tokenValueCallbackFunction: func
      };
      parser.parseXml(options);

      let res: string= parseInfoValue!.getText();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = parseInfoValue!.getText();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsParseInfoPerfTest arkTsAveragedTime ParseInfoPerfTest_string_getText_3700: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.xml', 'ParseInfo', 'getText',
        'getText(): string', arkTsAveragedTime);
    })

    it('ParseInfoPerfTest_boolean_isEmptyElementTag_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let strXml = '<?xml version="1.0" encoding="utf-8"?>' +
        '<note importance="high" logged="true">' +
        '<title/>' +
        '</note>';
      let textEncoder = new util.TextEncoder();
      let arrbuffer = textEncoder.encodeInto(strXml);
      let parser = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer);

      let parseInfoValue: xml.ParseInfo | undefined;

      const func = (key: xml.EventType, value: xml.ParseInfo): boolean => {
        parseInfoValue = value;
        return true;
      };

      let options: xml.ParseOptions = {
        supportDoctype: true,
        ignoreNameSpace: true,
        tokenValueCallbackFunction: func
      };
      parser.parseXml(options);

      let res: boolean= parseInfoValue!.isEmptyElementTag();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = parseInfoValue!.isEmptyElementTag();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsParseInfoPerfTest arkTsAveragedTime ParseInfoPerfTest_boolean_isEmptyElementTag_3800: ' +
        '' + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.xml', 'ParseInfo', 'isEmptyElementTag',
        'isEmptyElementTag(): boolean', arkTsAveragedTime);
    })

    it('ParseInfoPerfTest_boolean_isWhitespace_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let strXml = '<?xml version="1.0" encoding="utf-8"?>' +
        '<note importance="high" logged="true">' +
        '<title> </title>' +
        '</note>';
      let textEncoder = new util.TextEncoder();
      let arrbuffer = textEncoder.encodeInto(strXml);
      let parser = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer);

      let parseInfoValue: xml.ParseInfo | undefined;

      const func = (key: xml.EventType, value: xml.ParseInfo): boolean => {
        parseInfoValue = value;
        return true;
      };

      let options: xml.ParseOptions = {
        supportDoctype: true,
        ignoreNameSpace: true,
        tokenValueCallbackFunction: func
      };
      parser.parseXml(options);

      let res: boolean= parseInfoValue!.isWhitespace();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = parseInfoValue!.isWhitespace();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsParseInfoPerfTest arkTsAveragedTime ParseInfoPerfTest_boolean_isWhitespace_3900: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.xml', 'ParseInfo', 'isWhitespace',
        'isWhitespace(): boolean', arkTsAveragedTime);
    })

    it('ParseInfoPerfTest_number_getAttributeCount_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let strXml = '<?xml version="1.0" encoding="utf-8"?><note importance="high" logged="true"/>';
      let textEncoder = new util.TextEncoder();
      let arrbuffer = textEncoder.encodeInto(strXml);
      let parser = new xml.XmlPullParser(arrbuffer.buffer as object as ArrayBuffer);

      let parseInfoValue: xml.ParseInfo | undefined;

      const func = (key: xml.EventType, value: xml.ParseInfo): boolean => {
        parseInfoValue = value;
        return true;
      };

      let options: xml.ParseOptions = {
        supportDoctype: true,
        ignoreNameSpace: true,
        tokenValueCallbackFunction: func
      };
      parser.parseXml(options);

      let res: number= parseInfoValue!.getAttributeCount();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = parseInfoValue!.getAttributeCount();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsParseInfoPerfTest arkTsAveragedTime ParseInfoPerfTest_number_getAttributeCount_4000: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.xml', 'ParseInfo', 'getAttributeCount',
        'getAttributeCount(): number', arkTsAveragedTime);
    })

    it('EventTypePerfTest_number_startDocument_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: number = xml.EventType.START_DOCUMENT;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = xml.EventType.START_DOCUMENT;
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsEventTypePerfTest arkTsAveragedTime EventTypePerfTest_number_startDocument_4100: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.xml', 'EventType', 'START_DOCUMENT',
        'START_DOCUMENT: 0', arkTsAveragedTime);
    })

    it('EventTypePerfTest_number_endDocument_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: number= xml.EventType.END_DOCUMENT;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = xml.EventType.END_DOCUMENT;
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsEventTypePerfTest arkTsAveragedTime EventTypePerfTest_number_endDocument_4200: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.xml', 'EventType', 'END_DOCUMENT',
        'END_DOCUMENT: 1', arkTsAveragedTime);
    })

    it('EventTypePerfTest_number_startTag_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: number= xml.EventType.START_TAG;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = xml.EventType.START_TAG;
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsEventTypePerfTest arkTsAveragedTime EventTypePerfTest_number_startTag_4300: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.xml', 'EventType', 'START_TAG',
        'START_TAG: 2', arkTsAveragedTime);
    })

    it('EventTypePerfTest_number_endTag_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: number= xml.EventType.END_TAG;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = xml.EventType.END_TAG;
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsEventTypePerfTest arkTsAveragedTime EventTypePerfTest_number_endTag_4400: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.xml', 'EventType', 'END_TAG',
        'END_TAG: 3', arkTsAveragedTime);
    })

    it('EventTypePerfTest_number_text_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: number= xml.EventType.TEXT;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = xml.EventType.TEXT;
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsEventTypePerfTest arkTsAveragedTime EventTypePerfTest_number_text_4500: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.xml', 'EventType', 'TEXT',
        'TEXT: 4', arkTsAveragedTime);
    })

    it('EventTypePerfTest_number_cdsect_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: number = xml.EventType.CDSECT;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = xml.EventType.CDSECT;
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsEventTypePerfTest arkTsAveragedTime EventTypePerfTest_number_cdsect_4600: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.xml', 'EventType', 'CDSECT',
        'CDSECT: 5', arkTsAveragedTime);
    })

    it('EventTypePerfTest_number_comment_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: number = xml.EventType.COMMENT;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = xml.EventType.COMMENT;
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsEventTypePerfTest arkTsAveragedTime EventTypePerfTest_number_comment_4700: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.xml', 'EventType', 'COMMENT',
        'COMMENT: 6', arkTsAveragedTime);
    })

    it('EventTypePerfTest_number_docdecl_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: number= xml.EventType.DOCDECL;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = xml.EventType.DOCDECL;
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsEventTypePerfTest arkTsAveragedTime EventTypePerfTest_number_docdecl_4800: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.xml', 'EventType', 'DOCDECL',
        'DOCDECL: 7', arkTsAveragedTime);
    })

    it('EventTypePerfTest_number_instruction_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: number= xml.EventType.INSTRUCTION;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = xml.EventType.INSTRUCTION;
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsEventTypePerfTest arkTsAveragedTime EventTypePerfTest_number_instruction_4900: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.xml', 'EventType', 'INSTRUCTION',
        'INSTRUCTION: 8', arkTsAveragedTime);
    })

    it('EventTypePerfTest_number_entityReference_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: number= xml.EventType.ENTITY_REFERENCE;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = xml.EventType.ENTITY_REFERENCE;
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsEventTypePerfTest arkTsAveragedTime EventTypePerfTest_number_entityReference_5000: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.xml', 'EventType', 'ENTITY_REFERENCE',
        'ENTITY_REFERENCE: 9', arkTsAveragedTime);
    })

    it('EventTypePerfTest_number_whitespace_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res: number = xml.EventType.WHITESPACE;
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = xml.EventType.WHITESPACE;
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsEventTypePerfTest arkTsAveragedTime EventTypePerfTest_number_whitespace_5100: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.xml', 'EventType', 'WHITESPACE',
        'WHITESPACE: 10', arkTsAveragedTime);
    })

    it('XmlSAXParserPerfTest_void_constructor_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let readableStream = new TestReadable();
      let res: xml.XmlSAXParser= new xml.XmlSAXParser(readableStream, 'utf-8');
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new xml.XmlSAXParser(readableStream, 'utf-8');
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsXmlSAXParserPerfTest arkTsAveragedTime XmlSAXParserPerfTest_void_constructor_5200: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.xml', 'XmlSAXParser', 'constructor',
        'constructor(inputStream: stream.Readable, encoding?: string): XmlSAXParser', arkTsAveragedTime);
    })

    //it('XmlSAXParserPerfTest_void_parse_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //  let readableStream = new TestReadable();
    //  let saxParser = new xml.XmlSAXParser(readableStream);
    //
    //  let handler: xml.XmlSAXHandler = {
    //    startDocument: () => {
    //    },
    //    endDocument: () => {
    //    },
    //    startElement: (elementName: string, namespaceURI: string | undefined, qName: string | undefined,
    //      attributes: Map<string, string>) => {
    //    },
    //    endElement: (elementName: string, namespaceURI: string | undefined, qName: string | undefined) => {
    //    },
    //    characters: (content: string) => {
    //    }
    //  };
    //
    //  let res: void= saxParser.parse(handler);
    //  let Stime = Chrono.nanoNow();
    //  for (let i = 0; i < BASE_COUNT; i++) {
    //    saxParser = new xml.XmlSAXParser(readableStream);
    //    res = saxParser.parse(handler);
    //  }
    //  let Dtime = Chrono.nanoNow() - Stime;
    //  let res1 = res;
    //  let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
    //  console.info('arkTsXmlSAXParserPerfTest arkTsAveragedTime XmlSAXParserPerfTest_void_parse_5300: '
    //    + arkTsAveragedTime + 'ns');
    //  performance.apiWithClassAndKeywordTxt('std.xml', 'XmlSAXParser', 'parse',
    //    'parse(xmlSAXHandler: XmlSAXHandler): void', arkTsAveragedTime);
    //})

    it('XmlSAXHandlerPerfTest_void_startDocument_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let handler = new TestXmlSAXHandler();
      let res: void= handler.startDocument();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = handler.startDocument();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsXmlSAXHandlerPerfTest arkTsAveragedTime XmlSAXHandlerPerfTest_void_startDocument_5400: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.xml', 'XmlSAXHandler', 'startDocument',
        'startDocument(): void', arkTsAveragedTime);
    })

    it('XmlSAXHandlerPerfTest_void_endDocument_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let handler = new TestXmlSAXHandler();
      let res: void= handler.endDocument();
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = handler.endDocument();
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsXmlSAXHandlerPerfTest arkTsAveragedTime XmlSAXHandlerPerfTest_void_endDocument_5500: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.xml', 'XmlSAXHandler', 'endDocument',
        'endDocument(): void', arkTsAveragedTime);
    })

    it('XmlSAXHandlerPerfTest_void_startElement_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let handler = new TestXmlSAXHandler();
      let attributes = new Map<string, string>();
      let res: void= handler.startElement("child", "http://example.com/ns2", "ns2:child", attributes);
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = handler.startElement("child", "http://example.com/ns2", "ns2:child", attributes);
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsXmlSAXHandlerPerfTest arkTsAveragedTime XmlSAXHandlerPerfTest_void_startElement_5600: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.xml', 'XmlSAXHandler', 'startElement',
        'startElement(elementName: string, namespaceURI: string | undefined, qName: string | undefined, ' +
          'attributes: Map<string, string>): void', arkTsAveragedTime);
    })

    it('XmlSAXHandlerPerfTest_void_endElement_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let handler = new TestXmlSAXHandler();
      let res: void = handler.endElement("child", "http://example.com/ns2", "ns2:child");
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = handler.endElement("child", "http://example.com/ns2", "ns2:child");
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsXmlSAXHandlerPerfTest arkTsAveragedTime XmlSAXHandlerPerfTest_void_endElement_5700: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.xml', 'XmlSAXHandler', 'endElement',
        'endElement(elementName: string, namespaceURI: string | undefined, qName: string | undefined):' +
          ' void', arkTsAveragedTime);
    })

    it('XmlSAXHandlerPerfTest_void_characters_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let handler = new TestXmlSAXHandler();
      let res: void= handler.characters("test content");
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = handler.characters("test content");
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsXmlSAXHandlerPerfTest arkTsAveragedTime XmlSAXHandlerPerfTest_void_characters_5800: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.xml', 'XmlSAXHandler', 'characters',
        'characters(content: string): void', arkTsAveragedTime);
    })

    it('XmlSAXHandlerPerfTest_void_endElement_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let handler: xml.XmlSAXHandler = {
        startDocument: () => {
        },
        endDocument: () => {
        },
        startElement: (elementName: string, namespaceURI: string | undefined, qName: string | undefined,
          attributes: Map<string, string>) => {
        },
        endElement: (elementName: string, namespaceURI: string | undefined, qName: string | undefined) => {
        },
        characters: (content: string) => {
        }
      };

      let res: void = handler.endElement!("child", "http://example.com/ns2", "ns2:child");
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = handler.endElement!("child", "http://example.com/ns2", "ns2:child");
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsXmlSAXHandlerPerfTest arkTsAveragedTime XmlSAXHandlerPerfTest_void_endElement_5900: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.xml', 'XmlSAXHandler', 'endElement',
        'endElement(elementName: string, namespaceURI: string | undefined, qName: string | undefined): void', arkTsAveragedTime);
    })

    it('XmlSAXHandlerPerfTest_void_characters_6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let handler: xml.XmlSAXHandler = {
        startDocument: () => {
        },
        endDocument: () => {
        },
        startElement: (elementName: string, namespaceURI: string | undefined, qName: string | undefined,
          attributes: Map<string, string>) => {
        },
        endElement: (elementName: string, namespaceURI: string | undefined, qName: string | undefined) => {
        },
        characters: (content: string) => {
        }
      };

      let res: void= handler.characters!("Text content");
      let Stime = Chrono.nanoNow();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = handler.characters!("Text content");
      }
      let Dtime = Chrono.nanoNow() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() / BASE_COUNT;
      console.info('arkTsXmlSAXHandlerPerfTest arkTsAveragedTime XmlSAXHandlerPerfTest_void_characters_6000: '
        + arkTsAveragedTime + 'ns');
      performance.apiWithClassAndKeywordTxt('std.xml', 'XmlSAXHandler', 'characters',
        'characters(content: string): void', arkTsAveragedTime);
    })
  })
}