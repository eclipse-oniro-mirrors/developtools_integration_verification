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

export default function MessagePerfTest():void {
  describe('MessagePerfTest', () => {
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


    it('PerformanceTest_Message_Constructor_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let handler: concurrency.MessageHandler | undefined = undefined;
      try {
        handler = new concurrency.MessageHandler((msg: concurrency.Message) => { });
      } catch (e) {
      }
      if (handler === undefined) {
        console.info('arkTsPerformanceTest PerformanceTest_Message_Constructor_0100: SKIPPED - no worker');
        return;
      }
      let res: concurrency.Message = new concurrency.Message(handler);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new concurrency.Message(handler);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Message_Constructor_0100: ' + arkTsAveragedTime + 'ns');
      expect(res1 !== null).assertTrue();
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Message', 'constructor',
        'constructor(handler: MessageHandler)', arkTsAveragedTime);
    })

    it('PerformanceTest_Message_Constructor_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let handler: concurrency.MessageHandler | undefined = undefined;
      try {
        handler = new concurrency.MessageHandler((msg: concurrency.Message) => { });
      } catch (e) { }
      if (handler === undefined) {
        console.info('arkTsPerformanceTest PerformanceTest_Message_Constructor_0200: SKIPPED - no worker');
        return;
      }
      let res: concurrency.Message = new concurrency.Message(1, handler);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new concurrency.Message(1, handler);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Message_Constructor_0200: ' + arkTsAveragedTime + 'ns');
      expect(res1 !== null).assertTrue();
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Message', 'constructor',
        'constructor(what: int, handler: MessageHandler)', arkTsAveragedTime);
    })

    it('PerformanceTest_Message_Constructor_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let handler: concurrency.MessageHandler | undefined = undefined;
      try {
        handler = new concurrency.MessageHandler((msg: concurrency.Message) => { });
      } catch (e) { }
      if (handler === undefined) {
        console.info('arkTsPerformanceTest PerformanceTest_Message_Constructor_0300: SKIPPED - no worker');
        return;
      }
      let obj = new Object();
      let res: concurrency.Message = new concurrency.Message(1, obj, handler);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new concurrency.Message(1, obj, handler);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Message_Constructor_0300: ' + arkTsAveragedTime + 'ns');
      expect(res1 !== null).assertTrue();
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Message', 'constructor',
        'constructor(what: int, obj: Object, handler: MessageHandler)', arkTsAveragedTime);
    })

    it('PerformanceTest_Message_Constructor_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let handler: concurrency.MessageHandler | undefined = undefined;
      try {
        handler = new concurrency.MessageHandler((msg: concurrency.Message) => { });
      } catch (e) { }
      if (handler === undefined) {
        console.info('arkTsPerformanceTest PerformanceTest_Message_Constructor_0400: SKIPPED - no worker');
        return;
      }
      let cb = () => { };
      let res: concurrency.Message = new concurrency.Message(cb, handler);
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = new concurrency.Message(cb, handler);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Message_Constructor_0400: ' + arkTsAveragedTime + 'ns');
      expect(res1 !== null).assertTrue();
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Message', 'constructor',
        'constructor(callback: CB, handler: MessageHandler)', arkTsAveragedTime);
    })

    it('PerformanceTest_Message_Instance_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let handler: concurrency.MessageHandler | undefined = undefined;
      try {
        handler = new concurrency.MessageHandler((msg: concurrency.Message) => { });
      } catch (e) { }
      if (handler === undefined) {
        console.info('arkTsPerformanceTest PerformanceTest_Message_Instance_0100: SKIPPED - no worker');
        return;
      }
      let msg = new concurrency.Message(42, handler);
      let res: int = 0;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = msg.getWhat();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Message_Instance_0100: ' + arkTsAveragedTime + 'ns');
      expect(res1).assertEqual(42);
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Message', 'getWhat',
        'getWhat(): int', arkTsAveragedTime);
    })

    it('PerformanceTest_Message_Instance_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let handler: concurrency.MessageHandler | undefined = undefined;
      try {
        handler = new concurrency.MessageHandler((msg: concurrency.Message) => { });
      } catch (e) { }
      if (handler === undefined) {
        console.info('arkTsPerformanceTest PerformanceTest_Message_Instance_0200: SKIPPED - no worker');
        return;
      }
      let cb = () => { };
      let msg = new concurrency.Message(cb, handler);
      let res: (() => void) | undefined = undefined;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = msg.getCallback();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Message_Instance_0200: ' + arkTsAveragedTime + 'ns');
      expect(res1 !== undefined).assertTrue();
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Message', 'getCallback',
        'getCallback(): CB | undefined', arkTsAveragedTime);
    })

    it('PerformanceTest_Message_Instance_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let handler: concurrency.MessageHandler | undefined = undefined;
      try {
        handler = new concurrency.MessageHandler((msg: concurrency.Message) => { });
      } catch (e) { }
      if (handler === undefined) {
        console.info('arkTsPerformanceTest PerformanceTest_Message_Instance_0300: SKIPPED - no worker');
        return;
      }
      let obj = new Object();
      let msg = new concurrency.Message(1, obj, handler);
      let res = msg.getObject();
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = msg.getObject();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Message_Instance_0300: ' + arkTsAveragedTime + 'ns');
      expect(res1 !== undefined).assertTrue();
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Message', 'getObject',
        'getObject(): Object | undefined', arkTsAveragedTime);
    })

    it('PerformanceTest_Message_Instance_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let handler: concurrency.MessageHandler | undefined = undefined;
      try {
        handler = new concurrency.MessageHandler((msg: concurrency.Message) => { });
      } catch (e) { }
      if (handler === undefined) {
        console.info('arkTsPerformanceTest PerformanceTest_Message_Instance_0400: SKIPPED - no worker');
        return;
      }
      let msg = new concurrency.Message(handler);
      let res: concurrency.MessageHandler = handler;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = msg.getTarget();
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Message_Instance_0400: ' + arkTsAveragedTime + 'ns');
      expect(res1 !== null).assertTrue();
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Message', 'getTarget',
        'getTarget(): MessageHandler', arkTsAveragedTime);
    })

    it('PerformanceTest_Message_Instance_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let handler: concurrency.MessageHandler | undefined = undefined;
      try {
        handler = new concurrency.MessageHandler((msg: concurrency.Message) => { });
      } catch (e) { }
      if (handler === undefined) {
        console.info('arkTsPerformanceTest PerformanceTest_Message_Instance_0500: SKIPPED - no worker');
        return;
      }
      let msg1 = new concurrency.Message(1, handler);
      let msg2 = new concurrency.Message(1, handler);
      let res: boolean = false;
      let Stime = new Date().getTime();
      for (let i = 0; i < BASE_COUNT; i++) {
        res = msg1.equals(msg2);
      }
      let Dtime = new Date().getTime() - Stime;
      let res1 = res;
      let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
      console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Message_Instance_0500: ' + arkTsAveragedTime + 'ns');
      expect(res1).assertTrue();
      performance.apiWithClassAndKeywordTxt('std.concurrency', 'Message', 'equals',
        'equals(other: Message): boolean', arkTsAveragedTime);
    })

    // it('PerformanceTest_Message_Instance_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let task = () => { };
    //   let worker = new EAWorker("TestWorker", task);
    //   worker.start()
    //   worker.run<void>(() => {
    //
    //     let handler = new concurrency.MessageHandler((msg: concurrency.Message) => { });
    //     let msg = new concurrency.Message(1, handler);
    //     let Stime = new Date().getTime();
    //     for (let i = 0; i < BASE_COUNT; i++) {
    //       msg.sendToTarget();
    //     }
    //     let Dtime = new Date().getTime() - Stime;
    //     let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
    //     let res1 = msg;
    //     console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_Message_Instance_0600: ' + arkTsAveragedTime + 'ns');
    //     expect(res1 !== null).assertTrue();
    //     performance.apiWithClassAndKeywordTxt('std.concurrency', 'Message', 'sendToTarget',
    //       'sendToTarget(): void', arkTsAveragedTime);
    //   })
    //   worker.quit()
    // })
  })
}
