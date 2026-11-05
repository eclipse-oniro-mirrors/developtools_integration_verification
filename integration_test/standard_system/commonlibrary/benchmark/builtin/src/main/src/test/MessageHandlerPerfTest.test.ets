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

export default function MessageHandlerPerfTest():void {
  describe('MessageHandlerPerfTest', () => {
    // 毫秒 * 1000 = 微秒 毫秒 * 1000000 = 纳秒
    const BASE_COUNT = 50000;
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

    it('PerformanceTest_MessageHandler_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let Handler = (msg: concurrency.Message) => {};
        let result = new concurrency.MessageHandler(Handler);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = new concurrency.MessageHandler(Handler);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_MessageHandler_0100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.concurrency', 'MessageHandler', 'constructor',
            'constructor(callback: (msg: Message) => void): MessageHandler', arkTsAveragedTime);
    })

    it('PerformanceTest_MessageHandler_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let task = () => {};
        let handler = (msg: concurrency.Message) => {};
        let messageHandler = new concurrency.MessageHandler(handler);
        let result = false;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = messageHandler.hasCallbacks(task);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_MessageHandler_0200: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.concurrency', 'MessageHandler', 'hasCallbacks',
            'hasCallbacks(callback: Function): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_MessageHandler_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let handler = (msg: concurrency.Message) => {};
        let messageHandler = new concurrency.MessageHandler(handler);
        let result = false;
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = messageHandler.hasMessages(1);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_MessageHandler_0300: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.concurrency', 'MessageHandler', 'hasMessages',
            'hasMessages(what: number): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_MessageHandler_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let handler = (msg: concurrency.Message) => {};
        let messageHandler = new concurrency.MessageHandler(handler);
        let result = false;
        let objVar = new Object();
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            result = messageHandler.hasMessages(1,objVar);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = result;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_MessageHandler_0400: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.concurrency', 'MessageHandler', 'hasMessages',
            'hasMessages(what: number, object: Object): boolean', arkTsAveragedTime);
    })

    it('PerformanceTest_MessageHandler_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      let task = ():void => {};
      let worker = new EAWorker("TestWorker", task);
      worker.start();
      worker.run<void>(():void => {
        let handler = (msg: concurrency.Message):void => {};
        let messageHandler = new concurrency.MessageHandler(handler);

        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
          messageHandler.post(task);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = messageHandler;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_MessageHandler_0500: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.concurrency', 'MessageHandler', 'post',
          'post(task: Runnable | Callback): void', arkTsAveragedTime);
      })
      worker.quit();
    })

    it('PerformanceTest_MessageHandler_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let handler = (msg: concurrency.Message) => {};
        let task = ():void => {};
        let messageHandler = new concurrency.MessageHandler(handler);

        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
           messageHandler.removeCallbacks(task);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = messageHandler;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_MessageHandler_0600: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.concurrency', 'MessageHandler', 'removeCallbacks',
            'removeCallbacks(callback: Function | Runnable): void', arkTsAveragedTime);
    })

    it('PerformanceTest_MessageHandler_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let handler = (msg: concurrency.Message) => {};
        let messageHandler = new concurrency.MessageHandler(handler);
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            messageHandler.removeMessages(1);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = messageHandler;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_MessageHandler_0700: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.concurrency', 'MessageHandler', 'removeMessages',
            'removeMessages(what: number): void', arkTsAveragedTime);
    })


    it('PerformanceTest_MessageHandler_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let handler = (msg: concurrency.Message) => {};
        let messageHandler = new concurrency.MessageHandler(handler);
        let objVar = new Object();
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            messageHandler.removeMessages(1, objVar);
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = messageHandler;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_MessageHandler_0800: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.concurrency', 'MessageHandler', 'removeMessages',
            'removeMessages(what: number, object: Object): void', arkTsAveragedTime);
    })

    it('PerformanceTest_MessageHandler_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      let task = ():void => {};
      let worker = new EAWorker("TestWorker", task);
      worker.start();
      worker.run<void>(():void => {
        let handler = (msg: concurrency.Message):void => {};
            let messageHandler = new concurrency.MessageHandler(handler);
            let res: boolean = false;
            let Stime = new Date().getTime();
            for (let i = 0; i < BASE_COUNT; i++) {
                res = messageHandler.sendEmptyMessage(1);
            }
            let Dtime = new Date().getTime() - Stime;
            let res1 = res;
            let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
            console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_MessageHandler_0900: ' + arkTsAveragedTime + 'ns');
            performance.apiWithClassAndKeywordTxt('std.concurrency', 'MessageHandler', 'sendEmptyMessage',
                'sendEmptyMessage(what: number): boolean', arkTsAveragedTime);
        })
        worker.quit();
    })


    it('PerformanceTest_MessageHandler_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
      let task = ():void => {};
      let worker = new EAWorker("TestWorker", task);
      worker.start();
      worker.run<void>(():void => {
        let handler = (msg: concurrency.Message):void => {};
            let messageHandler = new concurrency.MessageHandler(handler);
            let msg3 = new concurrency.Message(messageHandler);
            let res: boolean = false;
            let Stime = new Date().getTime();
            for (let i = 0; i < BASE_COUNT; i++) {
                res = messageHandler.sendMessage(msg3);
            }
            let Dtime = new Date().getTime() - Stime;
            let res1 = res;
            let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
            console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_MessageHandler_1000: ' + arkTsAveragedTime + 'ns');
            performance.apiWithClassAndKeywordTxt('std.concurrency', 'MessageHandler', 'sendMessage',
                'sendMessage(msg: Message): boolean', arkTsAveragedTime);
        })
        worker.quit();
    })



    it('PerformanceTest_MessageHandler_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        let handler = (msg: concurrency.Message) => {};
        let messageHandler = new concurrency.MessageHandler(handler);
        let res = messageHandler.getWorker();
        let Stime = new Date().getTime();
        for (let i = 0; i < BASE_COUNT; i++) {
            res = messageHandler.getWorker();
        }
        let Dtime = new Date().getTime() - Stime;
        let res1 = res;
        let arkTsAveragedTime = Dtime.toDouble() * UNIT_TIME / BASE_COUNT;
        console.info('arkTsPerformanceTest arkTsAveragedTime PerformanceTest_MessageHandler_1100: ' + arkTsAveragedTime + 'ns');
        performance.apiWithClassAndKeywordTxt('std.concurrency', 'MessageHandler', 'getWorker',
            'getWorker(): Worker', arkTsAveragedTime);
    })

})
}
