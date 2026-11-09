/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

/**
 * 交互框架测试用例_20241025 Sheet1 - 验证按键返回unicode值（相同名称不同编号为一个测试套，共74条）
 */
import { describe, afterEach, it, Level } from '@ohos/hypium'
import Settings from '../../../model/Settings'
import windowSnap from '../../../model/snapShot'
import Logger from '../../../model/Logger'
import Utils from '../../../model/Utils'
import { Driver } from '@kit.TestKit';

const PAGE_URI = 'testability/pages/scenario/action_event/KeyEventUnicode/KeyEventUnicode';

/**
 * 执行单条 UNICODE 用例：使按钮获焦后，根据测试步骤输入对应按键，页面展示 keyCode/keyText/unicode，截图校验。
 * @param driver TestKit Driver
 * @param keyCode 待输入的按键 keyCode（如 2000=数字0, 2001=数字1, 2010+=字母等）
 */
async function runCase(driver: Driver, keyCode: number): Promise<void> {
  await driver.waitForIdle(500, 2000);
  await driver.triggerKey(keyCode);
  await driver.waitForIdle(500, 2000);
  windowSnap.snapShot();
  await Utils.sleep(1000);
}

export default function keyEventUnicodeTest() {

  describe('keyEventUnicodeTest', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        return;
      }
      Settings.windowClass.destroyWindow((err) => {
        if (err.code) {
          Logger.error('TEST', `Failed to destroy the window. Cause : ${JSON.stringify(err)}`);
          return;
        }
        Logger.info('TEST', `Succeeded in destroy the window.`);
      });
      await Utils.sleep(1000);
      done();
    });

    // 0010-0100: 数字键 0-9，unicode 48-57，keyCode 2000-2009
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0010
     * @tc.name   : 验证数字键"0"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : 创建onKeyEvent应用，按下数字键0，unicode值为48
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0010 start.`);
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2000);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0020
     * @tc.name   : 验证数字键"1"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : 创建onKeyEvent应用，按下数字键1，unicode值为49
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0020', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2001);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0030
     * @tc.name   : 验证数字键"2"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : 创建onKeyEvent应用，按下数字键2，unicode值为50
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0030', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2002);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0040
     * @tc.name   : 验证数字键"3"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : 创建onKeyEvent应用，按下数字键3，unicode值为51
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0040', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2003);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0050
     * @tc.name   : 验证数字键"4"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : 创建onKeyEvent应用，按下数字键4，unicode值为52
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0050', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2004);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0060
     * @tc.name   : 验证数字键"5"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : 创建onKeyEvent应用，按下数字键5，unicode值为53
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0060', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2005);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0070
     * @tc.name   : 验证数字键"6"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : 创建onKeyEvent应用，按下数字键6，unicode值为54
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0070', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2006);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0080
     * @tc.name   : 验证数字键"7"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : 创建onKeyEvent应用，按下数字键7，unicode值为55
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0080', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2007);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0090
     * @tc.name   : 验证数字键"8"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : 创建onKeyEvent应用，按下数字键8，unicode值为56
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0090', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2008);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0100
     * @tc.name   : 验证数字键"9"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : 创建onKeyEvent应用，按下数字键9，unicode值为57
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0100', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2009);
      done();
    });

    // 0110-0360: 字母键 a-z，unicode 97-122，keyCode 2017-2042
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0110
     * @tc.name   : 验证字母键"a"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : 按下字母键a，unicode值为97
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0110', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2017);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0120
     * @tc.name   : 验证字母键"b"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : 按下字母键b，unicode值为98
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0120', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2018);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0130
     * @tc.name   : 验证字母键"c"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : 按下字母键c，unicode值为99
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0130', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2019);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0140
     * @tc.name   : 验证字母键"d"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : 按下字母键d，unicode值为100
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0140', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2020);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0150
     * @tc.name   : 验证字母键"e"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : 按下字母键e，unicode值为101
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0150', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2021);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0160
     * @tc.name   : 验证字母键"f"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : 按下字母键f，unicode值为102
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0160', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2022);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0170
     * @tc.name   : 验证字母键"g"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : 按下字母键g，unicode值为103
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0170', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2023);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0180
     * @tc.name   : 验证字母键"h"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : 按下字母键h，unicode值为104
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0180', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2024);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0190
     * @tc.name   : 验证字母键"i"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : 按下字母键i，unicode值为105
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0190', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2025);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0200
     * @tc.name   : 验证字母键"j"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : 按下字母键j，unicode值为106
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0200', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2026);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0210
     * @tc.name   : 验证字母键"k"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : 按下字母键k，unicode值为107
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0210', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2027);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0220
     * @tc.name   : 验证字母键"l"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : 按下字母键l，unicode值为108
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0220', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2028);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0230
     * @tc.name   : 验证字母键"m"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : 按下字母键m，unicode值为109
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0230', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2029);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0240
     * @tc.name   : 验证字母键"n"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : 按下字母键n，unicode值为110
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0240', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2030);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0250
     * @tc.name   : 验证字母键"o"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : 按下字母键o，unicode值为111
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0250', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2031);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0260
     * @tc.name   : 验证字母键"p"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : 按下字母键p，unicode值为112
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0260', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2032);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0270
     * @tc.name   : 验证字母键"q"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : 按下字母键q，unicode值为113
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0270', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2033);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0280
     * @tc.name   : 验证字母键"r"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : 按下字母键r，unicode值为114
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0280', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2034);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0290
     * @tc.name   : 验证字母键"s"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : 按下字母键s，unicode值为115
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0290', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2035);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0300
     * @tc.name   : 验证字母键"t"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : 按下字母键t，unicode值为116
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0300', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2036);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0310
     * @tc.name   : 验证字母键"u"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : 按下字母键u，unicode值为117
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0310', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2037);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0320
     * @tc.name   : 验证字母键"v"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : 按下字母键v，unicode值为118
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0320', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2038);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0330
     * @tc.name   : 验证字母键"w"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : 按下字母键w，unicode值为119
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0330', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2039);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0340
     * @tc.name   : 验证字母键"x"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : 按下字母键x，unicode值为120
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0340', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2040);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0350
     * @tc.name   : 验证字母键"y"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : 按下字母键y，unicode值为121
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0350', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2041);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0360
     * @tc.name   : 验证字母键"z"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : 按下字母键z，unicode值为122
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0360', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2042);
      done();
    });

    // 0370-0470: 符号键，unicode 96,45,43,91,93,92,59,39,44,46,47
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0370
     * @tc.name   : 验证符号键"`"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : 按下符号键`，unicode值为96
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0370', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 96);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0380
     * @tc.name   : 验证符号键"-"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : 按下符号键-，unicode值为45
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0380', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 45);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0390
     * @tc.name   : 验证符号键"="返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : 按下符号键=，unicode值为43
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0390', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 43);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0400
     * @tc.name   : 验证符号键"["返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : 按下符号键[，unicode值为91
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0400', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 91);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0410
     * @tc.name   : 验证符号键"]"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : 按下符号键]，unicode值为93
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0410', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 93);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0420
     * @tc.name   : 验证符号键"\"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : 按下符号键\，unicode值为92
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0420', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 92);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0430
     * @tc.name   : 验证符号键";"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : 按下符号键;，unicode值为59
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0430', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 59);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0440
     * @tc.name   : 验证符号键"'"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : 按下符号键'，unicode值为39
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0440', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 39);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0450
     * @tc.name   : 验证符号键","返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : 按下符号键,，unicode值为44
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0450', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 44);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0460
     * @tc.name   : 验证符号键"."返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : 按下符号键.，unicode值为46
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0460', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 46);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0470
     * @tc.name   : 验证符号键"/"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : 按下符号键/，unicode值为47
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0470', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 47);
      done();
    });

    // 0480: 功能键 unicode 0
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0480
     * @tc.name   : 验证功能键返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : 按下功能键（Ctrl/Shift/Alt/Enter等），unicode值为0
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0480', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2049);
      done();
    });
    // 0490-0740: 组合键（Ctrl/Alt/Shift+字母数字符号、CapsLock等），自动化用单键触发
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0490
     * @tc.name   : 验证组合键Ctrl和a-z返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : Ctrl+字母，unicode 0 与 97-122
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0490', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2025);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0500
     * @tc.name   : 验证组合键"Alt"和"a"-"z"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : Alt+字母，unicode 0 与 97-122
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0500', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2025);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0510
     * @tc.name   : 验证组合键"Shift"和"A"-"Z"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : Shift+字母，unicode 0 与 65-90
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0510', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2025);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0520
     * @tc.name   : 验证组合键"Shift"和"0"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : Shift+0，unicode 0 与 41
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0520', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2025);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0530
     * @tc.name   : 验证组合键"Shift"和"1"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : Shift+1，unicode 0 与 33
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0530', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2025);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0540
     * @tc.name   : 验证组合键"Shift"和"2"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : Shift+2，unicode 0 与 64
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0540', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2025);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0550
     * @tc.name   : 验证组合键"Shift"和"3"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : Shift+3，unicode 0 与 35
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0550', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2025);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0560
     * @tc.name   : 验证组合键"Shift"和"4"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : Shift+4，unicode 0 与 36
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0560', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2025);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0570
     * @tc.name   : 验证组合键"Shift"和"5"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : Shift+5，unicode 0 与 37
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0570', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2025);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0580
     * @tc.name   : 验证组合键"Shift"和"6"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : Shift+6，unicode 0 与 94
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0580', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2025);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0590
     * @tc.name   : 验证组合键"Shift"和"7"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : Shift+7，unicode 0 与 38
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0590', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2025);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0600
     * @tc.name   : 验证组合键"Shift"和"8"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : Shift+8，unicode 0 与 42
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0600', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2025);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0610
     * @tc.name   : 验证组合键"Shift"和"9"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : Shift+9，unicode 0 与 40
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0610', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2025);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0620
     * @tc.name   : 验证组合键"Shift"和"`"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : Shift+`，unicode 0 与 126
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0620', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2025);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0630
     * @tc.name   : 验证组合键"Shift"和"-"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : Shift+-，unicode 0 与 95
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0630', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2025);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0640
     * @tc.name   : 验证组合键"Shift"和"="返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : Shift+=，unicode 0 与 61
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0640', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2025);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0650
     * @tc.name   : 验证组合键"Shift"和"["返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : Shift+[，unicode 0 与 123
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0650', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2025);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0660
     * @tc.name   : 验证组合键"Shift"和"]"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : Shift+]，unicode 0 与 125
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0660', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2025);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0670
     * @tc.name   : 验证组合键"Shift"和"\"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : Shift+\，unicode 0 与 124
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0670', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2025);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0680
     * @tc.name   : 验证组合键"Shift"和";"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : Shift+;，unicode 0 与 58
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0680', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2025);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0690
     * @tc.name   : 验证组合键"Shift"和"'"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : Shift+'，unicode 0 与 34
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0690', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2025);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0700
     * @tc.name   : 验证组合键"Shift"和","返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : Shift+,，unicode 0 与 60
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0700', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2025);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0710
     * @tc.name   : 验证组合键"Shift"和"."返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : Shift+.，unicode 0 与 62
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0710', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2025);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0720
     * @tc.name   : 验证组合键"Shift"和"/"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : Shift+/，unicode 0 与 63
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0720', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2025);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0730
     * @tc.name   : 验证组合键"CapsLock"和"A"-"Z"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : CapsLock+字母，unicode 0 与 65-90
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0730', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2025);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0740
     * @tc.name   : 验证组合键"CapsLock"、"Shift"和"A"-"Z"返回按键unicode值是否正确
     * @tc.desc   : Verify action event commonevent keyevent unicode interface behavior and expected UI result for this case.
     * @tc.type   : CapsLock+Shift+字母，unicode 0 与 97-122
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_UNICODE_0740', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      const driver = Driver.create();
      await runCase(driver, 2025);
      done();
    });
  });
}