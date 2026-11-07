/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
 
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import Settings from '../../../model/Settings'
import windowSnap from '../../../model/snapShot'
import Logger from '../../../model/Logger'
import Utils from '../../../model/Utils'
import { Driver, ON, Component, MouseButton } from '@kit.TestKit'
/*
 * SUB_ACE_UI_ATTRIBUTES_FONT_INTERFACE_0010:设置文本颜色
 *
 * Settings.createWindow(config.url)：
 *  创建窗口，更改窗口基本配置，更改方式详见model/Settings createWindow方法
 *
 * windowSnap.snapShot(globalThis.context)：
 *  窗口截屏&图片文件保存，存储在设备端
 *  存储文件固定，单挑用例执行后覆盖，用于自动化UI对比
 *  支持调试更改文件名为时间戳格式，更改model/snapShot createAndGetFile方法 注释L35，放开L32，L33
 *
 * Logger日志使用方法：
 *  import Logger form './model/Logger'
 *  Logger.info(TAG,`config = ${config}, err = ${JSON.stringify(exception)}`)
 * */

export default function actionEventCommonEventKeyEventDispatch() {

  describe('actionEventCommonEventKeyEventDispatch', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        return
      }

      Settings.windowClass.destroyWindow((err) => {
        if (err.code) {
          Logger.error('TEST', `Failed to destroy the window. Cause : ${JSON.stringify(err)}`)
          return;
        }
        Logger.info('TEST', `Succeeded in destroy the window.`);
      })
      await Utils.sleep(1000);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0020
     * @tc.name   : With the return value onKeyEvent, the property is tested for keycode
     * @tc.desc   : Verify action event commonevent keyevent dispatch interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0020', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0020 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventKeyEventDispatch_02/ActionEventCommonEventKeyEventDispatch01')
      let driver:Driver=Driver.create();
      await driver.triggerKey(2049)
      await driver.waitForIdle(500,2000);
      await driver.triggerKey(2012)
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0030
     * @tc.name   : With the return value onKeyEvent, the property is tested for keytext
     * @tc.desc   : Verify action event commonevent keyevent dispatch interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0030', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0030 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventKeyEventDispatch_02/ActionEventCommonEventKeyEventDispatch02')
      let driver:Driver=Driver.create();
      await driver.triggerKey(2049)
      await driver.waitForIdle(500,2000);
      await driver.triggerKey(2012)
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0160
     * @tc.name   : With the return value onKeyEventDispatch, the property is tested for keycode
     * @tc.desc   : Verify action event commonevent keyevent dispatch interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0160', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0160 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventKeyEventDispatch_02/ActionEventCommonEventKeyEventDispatch03')
      let driver:Driver=Driver.create();
      await driver.triggerKey(2049)
      await driver.waitForIdle(500,2000);
      await driver.triggerKey(2012)
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0160 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0170
     * @tc.name   : With the return value onKeyEventDispatch, the property is tested for keytext
     * @tc.desc   : Verify action event commonevent keyevent dispatch interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0170', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0170 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventKeyEventDispatch_02/ActionEventCommonEventKeyEventDispatch04')
      let driver:Driver=Driver.create();
      await driver.triggerKey(2049)
      await driver.waitForIdle(500,2000);
      await driver.triggerKey(2012)
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0170 finish.`);
      done()
    })
  })
}