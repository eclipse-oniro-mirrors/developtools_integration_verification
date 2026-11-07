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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import Settings from '../../../model/Settings'
import windowSnap from '../../../model/snapShot'
import Logger from '../../../model/Logger'
import Utils from '../../../model/Utils'
import { Driver, ON, Component } from '@kit.TestKit';

export default function gesturesEnabledNew() {

  describe('gesturesEnabledNew', () => {
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
     * @tc.number : SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0010
     * @tc.name   : Verify that the window interface parameter is correctly passed as false.
     * @tc.desc   : Verify window gestures enabled new interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0010 start.`);
      // 页面初始化
      Settings.createWindow('testability/pages/scenario/action_event/GesturesEnabledNew/GesturesEnabledNew0010')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤1：点击setWindowTitleMoveEnabled false
      let setWindowTitleMoveEnabledBtn = await driver.waitForComponent(ON.id('gestures_enabled_new_0010_btn'), 500)
      await setWindowTitleMoveEnabledBtn.click()
      await Utils.sleep(1000)

      // 预期结果：查看hilog日志，搜索关键词：EnableContainerModalGesture为0
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0010 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0020
     * @tc.name   : Verify that the window interface parameter is correctly passed as true.
     * @tc.desc   : Verify window gestures enabled new interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0020 start.`);
      // 页面初始化
      Settings.createWindow('testability/pages/scenario/action_event/GesturesEnabledNew/GesturesEnabledNew0020')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤1：点击setWindowTitleMoveEnabled true
      let setWindowTitleMoveEnabledBtn = await driver.waitForComponent(ON.id('gestures_enabled_new_0020_btn'), 500)
      await setWindowTitleMoveEnabledBtn.click()
      await Utils.sleep(1000)

      // 预期结果：查看hilog日志，搜索关键词：EnableContainerModalGesture为1
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0020 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0030
     * @tc.name   : Verify that the window interface parameter is correctly passed as undefined.
     * @tc.desc   : Verify window gestures enabled new interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0030 start.`);
      // 页面初始化
      Settings.createWindow('testability/pages/scenario/action_event/GesturesEnabledNew/GesturesEnabledNew0030')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤1：点击setWindowTitleMoveEnabled undefined
      let setWindowTitleMoveEnabledBtn = await driver.waitForComponent(ON.id('gestures_enabled_new_0030_btn'), 500)
      await setWindowTitleMoveEnabledBtn.click()
      await Utils.sleep(1000)

      // 预期结果：查看hilog日志，搜索关键词：EnableContainerModalGesture为1
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0030 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0060
     * @tc.name   : Gesture disabled - fixed title bar - mouse - drag.
     * @tc.desc   : Verify window gestures enabled new interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0060 start.`);
      // 页面初始化
      Settings.createWindow('testability/pages/scenario/action_event/GesturesEnabledNew/GesturesEnabledNew0060')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤1：点击setWindowTitleMoveEnabled false
      let setWindowTitleMoveEnabledBtn = await driver.waitForComponent(ON.id('gestures_enabled_new_0060_btn'), 500)
      await setWindowTitleMoveEnabledBtn.click()
      await Utils.sleep(1000)

      // 步骤2：鼠标拖拽窗口
      // 预期结果：不能拖动窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0060 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0070
     * @tc.name   : Gesture disabled - fixed title bar - mouse - double click.
     * @tc.desc   : Verify window gestures enabled new interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0070 start.`);
      // 页面初始化
      Settings.createWindow('testability/pages/scenario/action_event/GesturesEnabledNew/GesturesEnabledNew0070')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤1：点击setWindowTitleMoveEnabled false
      let setWindowTitleMoveEnabledBtn = await driver.waitForComponent(ON.id('gestures_enabled_new_0070_btn'), 500)
      await setWindowTitleMoveEnabledBtn.click()
      await Utils.sleep(1000)

      // 步骤2：窗口最大化，鼠标双击标题栏
      // 预期结果：不能缩小窗口
      // 步骤3：窗口缩放模式，鼠标双击标题栏
      // 预期结果：不能最大化窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0070 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0080
     * @tc.name   : Gesture disabled - fixed title bar - touchpad - double tap and hold.
     * @tc.desc   : Verify window gestures enabled new interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0080 start.`);
      // 页面初始化
      Settings.createWindow('testability/pages/scenario/action_event/GesturesEnabledNew/GesturesEnabledNew0080')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤1：点击setWindowTitleMoveEnabled false
      let setWindowTitleMoveEnabledBtn = await driver.waitForComponent(ON.id('gestures_enabled_new_0080_btn'), 500)
      await setWindowTitleMoveEnabledBtn.click()
      await Utils.sleep(1000)

      // 步骤2：触控板点击两次，不松手，拖拽标题栏
      // 预期结果：不能拖动窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0080 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0090
     * @tc.name   : Gesture disabled - fixed title bar - touchpad - one hand hold, one hand drag.
     * @tc.desc   : Verify the interface under test for scenario described by case 'SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0090'.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0090 start.`);
      // 页面初始化
      Settings.createWindow('testability/pages/scenario/action_event/GesturesEnabledNew/GesturesEnabledNew0090')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤1：点击setWindowTitleMoveEnabled false
      let setWindowTitleMoveEnabledBtn = await driver.waitForComponent(ON.id('gestures_enabled_new_0090_btn'), 500)
      await setWindowTitleMoveEnabledBtn.click()
      await Utils.sleep(1000)

      // 步骤2：一只手按住触控板，一只手拖拽标题栏
      // 预期结果：不能拖动窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0090 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0100
     * @tc.name   : Gesture disabled - fixed title bar - touchpad - double click.
     * @tc.desc   : Verify window gestures enabled new interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0100 start.`);
      // 页面初始化
      Settings.createWindow('testability/pages/scenario/action_event/GesturesEnabledNew/GesturesEnabledNew0100')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤1：点击setWindowTitleMoveEnabled false
      let setWindowTitleMoveEnabledBtn = await driver.waitForComponent(ON.id('gestures_enabled_new_0100_btn'), 500)
      await setWindowTitleMoveEnabledBtn.click()
      await Utils.sleep(1000)

      // 步骤2：窗口最大化，触控板上双击标题栏
      // 预期结果：不能缩小窗口
      // 步骤3：窗口缩放模式，触控板上双击标题栏
      // 预期结果：不能最大化窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0100 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0110
     * @tc.name   : Gesture disabled - fixed title bar - finger input (touch screen) - drag.
     * @tc.desc   : Verify window gestures enabled new interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0110 start.`);
      // 页面初始化
      Settings.createWindow('testability/pages/scenario/action_event/GesturesEnabledNew/GesturesEnabledNew0110')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤1：点击setWindowTitleMoveEnabled false
      let setWindowTitleMoveEnabledBtn = await driver.waitForComponent(ON.id('gestures_enabled_new_0110_btn'), 500)
      await setWindowTitleMoveEnabledBtn.click()
      await Utils.sleep(1000)

      // 步骤2：手指拖拽窗口
      // 预期结果：不能拖动窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0110 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0120
     * @tc.name   : Gesture disabled - fixed title bar - finger input (touch screen) - double click.
     * @tc.desc   : Verify window gestures enabled new interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0120 start.`);
      // 页面初始化
      Settings.createWindow('testability/pages/scenario/action_event/GesturesEnabledNew/GesturesEnabledNew0120')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤1：点击setWindowTitleMoveEnabled false
      let setWindowTitleMoveEnabledBtn = await driver.waitForComponent(ON.id('gestures_enabled_new_0120_btn'), 500)
      await setWindowTitleMoveEnabledBtn.click()
      await Utils.sleep(1000)

      // 步骤2：窗口最大化，手指双击标题栏
      // 预期结果：不能缩小窗口
      // 步骤3：窗口缩放模式，手指双击标题栏
      // 预期结果：不能最大化窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0120 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0130
     * @tc.name   : Gesture disabled - hidden title bar - mouse - drag.
     * @tc.desc   : Verify window gestures enabled new interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0130 start.`);
      // 页面初始化
      Settings.createWindow('testability/pages/scenario/action_event/GesturesEnabledNew/GesturesEnabledNew0130')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤1：点击setWindowTitleMoveEnabled false
      let setWindowTitleMoveEnabledBtn = await driver.waitForComponent(ON.id('gestures_enabled_new_0130_btn'), 500)
      await setWindowTitleMoveEnabledBtn.click()
      await Utils.sleep(1000)

      // 步骤2：鼠标拖拽窗口（隐藏标题栏模式）
      // 预期结果：不能拖动窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0130 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0140
     * @tc.name   : Gesture disabled - hidden title bar - mouse - double click.
     * @tc.desc   : Verify window gestures enabled new interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0140 start.`);
      // 页面初始化
      Settings.createWindow('testability/pages/scenario/action_event/GesturesEnabledNew/GesturesEnabledNew0140')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤1：点击setWindowTitleMoveEnabled false
      let setWindowTitleMoveEnabledBtn = await driver.waitForComponent(ON.id('gestures_enabled_new_0140_btn'), 500)
      await setWindowTitleMoveEnabledBtn.click()
      await Utils.sleep(1000)

      // 步骤2：窗口最大化，鼠标双击标题栏（隐藏标题栏模式）
      // 预期结果：不能缩小窗口
      // 步骤3：窗口缩放模式，鼠标双击标题栏（隐藏标题栏模式）
      // 预期结果：不能最大化窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0140 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0150
     * @tc.name   : Gesture disabled - hidden title bar - touchpad - double tap and hold.
     * @tc.desc   : Verify window gestures enabled new interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0150 start.`);
      // 页面初始化
      Settings.createWindow('testability/pages/scenario/action_event/GesturesEnabledNew/GesturesEnabledNew0150')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤1：点击setWindowTitleMoveEnabled false
      let setWindowTitleMoveEnabledBtn = await driver.waitForComponent(ON.id('gestures_enabled_new_0150_btn'), 500)
      await setWindowTitleMoveEnabledBtn.click()
      await Utils.sleep(1000)

      // 步骤2：触控板点击两次，不松手，拖拽标题栏（隐藏标题栏模式）
      // 预期结果：不能拖动窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0150 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0160
     * @tc.name   : Gesture disabled - hidden title bar - touchpad - one hand hold, one hand drag.
     * @tc.desc   : Verify window gestures enabled new interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0160 start.`);
      // 页面初始化
      Settings.createWindow('testability/pages/scenario/action_event/GesturesEnabledNew/GesturesEnabledNew0160')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤1：点击setWindowTitleMoveEnabled false
      let setWindowTitleMoveEnabledBtn = await driver.waitForComponent(ON.id('gestures_enabled_new_0160_btn'), 500)
      await setWindowTitleMoveEnabledBtn.click()
      await Utils.sleep(1000)

      // 步骤2：一只手按住触控板，一只手拖拽标题栏（隐藏标题栏模式）
      // 预期结果：不能拖动窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0160 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0170
     * @tc.name   : Gesture disabled - hidden title bar - touchpad - double click.
     * @tc.desc   : Verify window gestures enabled new interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0170 start.`);
      // 页面初始化
      Settings.createWindow('testability/pages/scenario/action_event/GesturesEnabledNew/GesturesEnabledNew0170')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤1：点击setWindowTitleMoveEnabled false
      let setWindowTitleMoveEnabledBtn = await driver.waitForComponent(ON.id('gestures_enabled_new_0170_btn'), 500)
      await setWindowTitleMoveEnabledBtn.click()
      await Utils.sleep(1000)

      // 步骤2：窗口最大化，触控板上双击标题栏（隐藏标题栏模式）
      // 预期结果：不能缩小窗口
      // 步骤3：窗口缩放模式，触控板上双击标题栏（隐藏标题栏模式）
      // 预期结果：不能最大化窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0170 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0180
     * @tc.name   : Gesture disabled - hidden title bar - finger input (touch screen) - drag.
     * @tc.desc   : Verify window gestures enabled new interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0180 start.`);
      // 页面初始化
      Settings.createWindow('testability/pages/scenario/action_event/GesturesEnabledNew/GesturesEnabledNew0180')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤1：点击setWindowTitleMoveEnabled false
      let setWindowTitleMoveEnabledBtn = await driver.waitForComponent(ON.id('gestures_enabled_new_0180_btn'), 500)
      await setWindowTitleMoveEnabledBtn.click()
      await Utils.sleep(1000)

      // 步骤2：手指拖拽窗口（隐藏标题栏模式）
      // 预期结果：不能拖动窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0180 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0190
     * @tc.name   : Gesture disabled - hidden title bar - finger input (touch screen) - double click.
     * @tc.desc   : Verify window gestures enabled new interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0190 start.`);
      // 页面初始化
      Settings.createWindow('testability/pages/scenario/action_event/GesturesEnabledNew/GesturesEnabledNew0190')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤1：点击setWindowTitleMoveEnabled false
      let setWindowTitleMoveEnabledBtn = await driver.waitForComponent(ON.id('gestures_enabled_new_0190_btn'), 500)
      await setWindowTitleMoveEnabledBtn.click()
      await Utils.sleep(1000)

      // 步骤2：窗口最大化，手指双击标题栏（隐藏标题栏模式）
      // 预期结果：不能缩小窗口
      // 步骤3：窗口缩放模式，手指双击标题栏（隐藏标题栏模式）
      // 预期结果：不能最大化窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0190 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0200
     * @tc.name   : Gesture disabled - floating title bar - mouse - drag.
     * @tc.desc   : Verify window gestures enabled new interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0200', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0200 start.`);
      // 页面初始化
      Settings.createWindow('testability/pages/scenario/action_event/GesturesEnabledNew/GesturesEnabledNew0200')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤1：点击setWindowTitleMoveEnabled false
      let setWindowTitleMoveEnabledBtn = await driver.waitForComponent(ON.id('gestures_enabled_new_0200_btn'), 500)
      await setWindowTitleMoveEnabledBtn.click()
      await Utils.sleep(1000)

      // 步骤2：鼠标拖拽窗口（悬浮标题栏模式）
      // 预期结果：不能拖动窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0200 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0210
     * @tc.name   : Gesture disabled - floating title bar - mouse - double click.
     * @tc.desc   : Verify window gestures enabled new interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0210', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0210 start.`);
      // 页面初始化
      Settings.createWindow('testability/pages/scenario/action_event/GesturesEnabledNew/GesturesEnabledNew0210')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤1：点击setWindowTitleMoveEnabled false
      let setWindowTitleMoveEnabledBtn = await driver.waitForComponent(ON.id('gestures_enabled_new_0210_btn'), 500)
      await setWindowTitleMoveEnabledBtn.click()
      await Utils.sleep(1000)

      // 步骤2：窗口最大化，鼠标双击标题栏（悬浮标题栏模式）
      // 预期结果：不能缩小窗口
      // 步骤3：窗口缩放模式，鼠标双击标题栏（悬浮标题栏模式）
      // 预期结果：不能最大化窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0210 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0220
     * @tc.name   : Gesture disabled - floating title bar - touchpad - double tap and hold.
     * @tc.desc   : Verify window gestures enabled new interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0220', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0220 start.`);
      // 页面初始化
      Settings.createWindow('testability/pages/scenario/action_event/GesturesEnabledNew/GesturesEnabledNew0220')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤1：点击setWindowTitleMoveEnabled false
      let setWindowTitleMoveEnabledBtn = await driver.waitForComponent(ON.id('gestures_enabled_new_0220_btn'), 500)
      await setWindowTitleMoveEnabledBtn.click()
      await Utils.sleep(1000)

      // 步骤2：触控板点击两次，不松手，拖拽标题栏（悬浮标题栏模式）
      // 预期结果：不能拖动窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0220 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0230
     * @tc.name   : Gesture disabled - floating title bar - touchpad - one hand hold, one hand drag.
     * @tc.desc   : Verify window gestures enabled new interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0230', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0230 start.`);
      // 页面初始化
      Settings.createWindow('testability/pages/scenario/action_event/GesturesEnabledNew/GesturesEnabledNew0230')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤1：点击setWindowTitleMoveEnabled false
      let setWindowTitleMoveEnabledBtn = await driver.waitForComponent(ON.id('gestures_enabled_new_0230_btn'), 500)
      await setWindowTitleMoveEnabledBtn.click()
      await Utils.sleep(1000)

      // 步骤2：一只手按住触控板，一只手拖拽标题栏（悬浮标题栏模式）
      // 预期结果：不能拖动窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0230 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0240
     * @tc.name   : Gesture disabled - floating title bar - touchpad - double click.
     * @tc.desc   : Verify window gestures enabled new interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0240', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0240 start.`);
      // 页面初始化
      Settings.createWindow('testability/pages/scenario/action_event/GesturesEnabledNew/GesturesEnabledNew0240')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤1：点击setWindowTitleMoveEnabled false
      let setWindowTitleMoveEnabledBtn = await driver.waitForComponent(ON.id('gestures_enabled_new_0240_btn'), 500)
      await setWindowTitleMoveEnabledBtn.click()
      await Utils.sleep(1000)

      // 步骤2：窗口最大化，触控板上双击标题栏（悬浮标题栏模式）
      // 预期结果：不能缩小窗口
      // 步骤3：窗口缩放模式，触控板上双击标题栏（悬浮标题栏模式）
      // 预期结果：不能最大化窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0240 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0250
     * @tc.name   : Gesture disabled - floating title bar - finger input (touch screen) - drag.
     * @tc.desc   : Verify window gestures enabled new interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0250', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0250 start.`);
      // 页面初始化
      Settings.createWindow('testability/pages/scenario/action_event/GesturesEnabledNew/GesturesEnabledNew0250')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤1：点击setWindowTitleMoveEnabled false
      let setWindowTitleMoveEnabledBtn = await driver.waitForComponent(ON.id('gestures_enabled_new_0250_btn'), 500)
      await setWindowTitleMoveEnabledBtn.click()
      await Utils.sleep(1000)

      // 步骤2：手指拖拽窗口（悬浮标题栏模式）
      // 预期结果：不能拖动窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0250 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0260
     * @tc.name   : Gesture disabled - floating title bar - finger input (touch screen) - double click.
     * @tc.desc   : Verify window gestures enabled new interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0260', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0260 start.`);
      // 页面初始化
      Settings.createWindow('testability/pages/scenario/action_event/GesturesEnabledNew/GesturesEnabledNew0260')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤1：点击setWindowTitleMoveEnabled false
      let setWindowTitleMoveEnabledBtn = await driver.waitForComponent(ON.id('gestures_enabled_new_0260_btn'), 500)
      await setWindowTitleMoveEnabledBtn.click()
      await Utils.sleep(1000)

      // 步骤2：窗口最大化，手指双击标题栏（悬浮标题栏模式）
      // 预期结果：不能缩小窗口
      // 步骤3：窗口缩放模式，手指双击标题栏（悬浮标题栏模式）
      // 预期结果：不能最大化窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0260 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0270
     * @tc.name   : Gesture enabled - fixed title bar - mouse - drag.
     * @tc.desc   : Verify window gestures enabled new interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0270', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0270 start.`);
      // 页面初始化
      Settings.createWindow('testability/pages/scenario/action_event/GesturesEnabledNew/GesturesEnabledNew0270')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤1：点击setWindowTitleMoveEnabled true
      let setWindowTitleMoveEnabledBtn = await driver.waitForComponent(ON.id('gestures_enabled_new_0270_btn'), 500)
      await setWindowTitleMoveEnabledBtn.click()
      await Utils.sleep(1000)

      // 步骤2：鼠标拖拽窗口（固定标题栏模式）
      // 预期结果：可以拖动窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0270 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0280
     * @tc.name   : Gesture enabled - fixed title bar - mouse - double click.
     * @tc.desc   : Verify window gestures enabled new interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0280', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0280 start.`);
      // 页面初始化
      Settings.createWindow('testability/pages/scenario/action_event/GesturesEnabledNew/GesturesEnabledNew0280')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤1：点击setWindowTitleMoveEnabled true
      let setWindowTitleMoveEnabledBtn = await driver.waitForComponent(ON.id('gestures_enabled_new_0280_btn'), 500)
      await setWindowTitleMoveEnabledBtn.click()
      await Utils.sleep(1000)

      // 步骤2：窗口最大化，鼠标双击标题栏（固定标题栏模式）
      // 预期结果：窗口缩小
      // 步骤3：窗口缩放模式，鼠标双击标题栏（固定标题栏模式）
      // 预期结果：窗口变为最大化
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0280 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0290
     * @tc.name   : Gesture enabled - fixed title bar - touchpad - double tap and hold.
     * @tc.desc   : Verify window gestures enabled new interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0290', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0290 start.`);
      // 页面初始化
      Settings.createWindow('testability/pages/scenario/action_event/GesturesEnabledNew/GesturesEnabledNew0290')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤1：点击setWindowTitleMoveEnabled true
      let setWindowTitleMoveEnabledBtn = await driver.waitForComponent(ON.id('gestures_enabled_new_0290_btn'), 500)
      await setWindowTitleMoveEnabledBtn.click()
      await Utils.sleep(1000)

      // 步骤2：触控板点击两次，不松手，拖拽标题栏（固定标题栏模式）
      // 预期结果：可以拖动窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0290 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0300
     * @tc.name   : Gesture enabled - fixed title bar - touchpad - one hand hold, one hand drag.
     * @tc.desc   : Verify window gestures enabled new interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0300', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0300 start.`);
      // 页面初始化
      Settings.createWindow('testability/pages/scenario/action_event/GesturesEnabledNew/GesturesEnabledNew0300')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤1：点击setWindowTitleMoveEnabled true
      let setWindowTitleMoveEnabledBtn = await driver.waitForComponent(ON.id('gestures_enabled_new_0300_btn'), 500)
      await setWindowTitleMoveEnabledBtn.click()
      await Utils.sleep(1000)

      // 步骤2：一只手按住触控板，一只手拖拽标题栏（固定标题栏模式）
      // 预期结果：可以拖动窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0300 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0310
     * @tc.name   : Gesture enabled - fixed title bar - touchpad - double click.
     * @tc.desc   : Verify window gestures enabled new interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0310', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0310 start.`);
      // 页面初始化
      Settings.createWindow('testability/pages/scenario/action_event/GesturesEnabledNew/GesturesEnabledNew0310')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤1：点击setWindowTitleMoveEnabled true
      let setWindowTitleMoveEnabledBtn = await driver.waitForComponent(ON.id('gestures_enabled_new_0310_btn'), 500)
      await setWindowTitleMoveEnabledBtn.click()
      await Utils.sleep(1000)

      // 步骤2：窗口最大化，触控板上双击标题栏（固定标题栏模式）
      // 预期结果：窗口缩小
      // 步骤3：窗口缩放模式，触控板上双击标题栏（固定标题栏模式）
      // 预期结果：窗口变为最大化
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0310 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0320
     * @tc.name   : Gesture enabled - fixed title bar - finger input (touch screen) - drag.
     * @tc.desc   : Verify window gestures enabled new interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0320', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0320 start.`);
      // 页面初始化
      Settings.createWindow('testability/pages/scenario/action_event/GesturesEnabledNew/GesturesEnabledNew0320')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤1：点击setWindowTitleMoveEnabled true
      let setWindowTitleMoveEnabledBtn = await driver.waitForComponent(ON.id('gestures_enabled_new_0320_btn'), 500)
      await setWindowTitleMoveEnabledBtn.click()
      await Utils.sleep(1000)

      // 步骤2：手指拖拽窗口（固定标题栏模式）
      // 预期结果：可以拖动窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0320 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0330
     * @tc.name   : Gesture enabled - fixed title bar - finger input (touch screen) - double click.
     * @tc.desc   : Verify window gestures enabled new interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0330', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0330 start.`);
      // 页面初始化
      Settings.createWindow('testability/pages/scenario/action_event/GesturesEnabledNew/GesturesEnabledNew0330')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤1：点击setWindowTitleMoveEnabled true
      let setWindowTitleMoveEnabledBtn = await driver.waitForComponent(ON.id('gestures_enabled_new_0330_btn'), 500)
      await setWindowTitleMoveEnabledBtn.click()
      await Utils.sleep(1000)

      // 步骤2：窗口最大化，手指双击标题栏（固定标题栏模式）
      // 预期结果：窗口缩小
      // 步骤3：窗口缩放模式，手指双击标题栏（固定标题栏模式）
      // 预期结果：窗口变为最大化
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0330 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0340
     * @tc.name   : Gesture enabled - hidden title bar - mouse - drag.
     * @tc.desc   : Verify window gestures enabled new interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0340', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0340 start.`);
      // 页面初始化
      Settings.createWindow('testability/pages/scenario/action_event/GesturesEnabledNew/GesturesEnabledNew0340')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤1：点击setWindowTitleMoveEnabled true
      let setWindowTitleMoveEnabledBtn = await driver.waitForComponent(ON.id('gestures_enabled_new_0340_btn'), 500)
      await setWindowTitleMoveEnabledBtn.click()
      await Utils.sleep(1000)

      // 步骤2：鼠标拖拽窗口（隐藏标题栏模式）
      // 预期结果：可以拖动窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0340 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0350
     * @tc.name   : Gesture enabled - hidden title bar - mouse - double click.
     * @tc.desc   : Verify window gestures enabled new interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0350', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0350 start.`);
      // 页面初始化
      Settings.createWindow('testability/pages/scenario/action_event/GesturesEnabledNew/GesturesEnabledNew0350')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤1：点击setWindowTitleMoveEnabled true
      let setWindowTitleMoveEnabledBtn = await driver.waitForComponent(ON.id('gestures_enabled_new_0350_btn'), 500)
      await setWindowTitleMoveEnabledBtn.click()
      await Utils.sleep(1000)

      // 步骤2：窗口最大化，鼠标双击标题栏（隐藏标题栏模式）
      // 预期结果：窗口缩小
      // 步骤3：窗口缩放模式，鼠标双击标题栏（隐藏标题栏模式）
      // 预期结果：窗口变为最大化
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0350 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0360
     * @tc.name   : Gesture enabled - hidden title bar - touchpad - double tap and hold.
     * @tc.desc   : Verify window gestures enabled new interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0360', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0360 start.`);
      // 页面初始化
      Settings.createWindow('testability/pages/scenario/action_event/GesturesEnabledNew/GesturesEnabledNew0360')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤1：点击setWindowTitleMoveEnabled true
      let setWindowTitleMoveEnabledBtn = await driver.waitForComponent(ON.id('gestures_enabled_new_0360_btn'), 500)
      await setWindowTitleMoveEnabledBtn.click()
      await Utils.sleep(1000)

      // 步骤2：触控板点击两次，不松手，拖拽标题栏（隐藏标题栏模式）
      // 预期结果：可以拖动窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0360 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0370
     * @tc.name   : Gesture enabled - hidden title bar - touchpad - one hand hold, one hand drag.
     * @tc.desc   : Verify window gestures enabled new interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0370', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0370 start.`);
      // 页面初始化
      Settings.createWindow('testability/pages/scenario/action_event/GesturesEnabledNew/GesturesEnabledNew0370')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤1：点击setWindowTitleMoveEnabled true
      let setWindowTitleMoveEnabledBtn = await driver.waitForComponent(ON.id('gestures_enabled_new_0370_btn'), 500)
      await setWindowTitleMoveEnabledBtn.click()
      await Utils.sleep(1000)

      // 步骤2：一只手按住触控板，一只手拖拽标题栏（隐藏标题栏模式）
      // 预期结果：可以拖动窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0370 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0380
     * @tc.name   : Gesture enabled - hidden title bar - touchpad - double click.
     * @tc.desc   : Verify window gestures enabled new interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0380', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0380 start.`);
      // 页面初始化
      Settings.createWindow('testability/pages/scenario/action_event/GesturesEnabledNew/GesturesEnabledNew0380')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤1：点击setWindowTitleMoveEnabled true
      let setWindowTitleMoveEnabledBtn = await driver.waitForComponent(ON.id('gestures_enabled_new_0380_btn'), 500)
      await setWindowTitleMoveEnabledBtn.click()
      await Utils.sleep(1000)

      // 步骤2：窗口最大化，触控板上双击标题栏（隐藏标题栏模式）
      // 预期结果：窗口缩小
      // 步骤3：窗口缩放模式，触控板上双击标题栏（隐藏标题栏模式）
      // 预期结果：窗口变为最大化
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0380 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0390
     * @tc.name   : Gesture enabled - hidden title bar - finger input (touch screen) - drag.
     * @tc.desc   : Verify window gestures enabled new interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0390', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0390 start.`);
      // 页面初始化
      Settings.createWindow('testability/pages/scenario/action_event/GesturesEnabledNew/GesturesEnabledNew0390')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤1：点击setWindowTitleMoveEnabled true
      let setWindowTitleMoveEnabledBtn = await driver.waitForComponent(ON.id('gestures_enabled_new_0390_btn'), 500)
      await setWindowTitleMoveEnabledBtn.click()
      await Utils.sleep(1000)

      // 步骤2：手指拖拽窗口（隐藏标题栏模式）
      // 预期结果：可以拖动窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0390 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0400
     * @tc.name   : Gesture enabled - hidden title bar - finger input (touch screen) - double click.
     * @tc.desc   : Verify window gestures enabled new interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0400', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0400 start.`);
      // 页面初始化
      Settings.createWindow('testability/pages/scenario/action_event/GesturesEnabledNew/GesturesEnabledNew0400')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤1：点击setWindowTitleMoveEnabled true
      let setWindowTitleMoveEnabledBtn = await driver.waitForComponent(ON.id('gestures_enabled_new_0400_btn'), 500)
      await setWindowTitleMoveEnabledBtn.click()
      await Utils.sleep(1000)

      // 步骤2：窗口最大化，手指双击标题栏（隐藏标题栏模式）
      // 预期结果：窗口缩小
      // 步骤3：窗口缩放模式，手指双击标题栏（隐藏标题栏模式）
      // 预期结果：窗口变为最大化
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0400 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0410
     * @tc.name   : Gesture enabled - floating title bar - mouse - drag.
     * @tc.desc   : Verify window gestures enabled new interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0410', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0410 start.`);
      // 页面初始化
      Settings.createWindow('testability/pages/scenario/action_event/GesturesEnabledNew/GesturesEnabledNew0410')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤1：点击setWindowTitleMoveEnabled true
      let setWindowTitleMoveEnabledBtn = await driver.waitForComponent(ON.id('gestures_enabled_new_0410_btn'), 500)
      await setWindowTitleMoveEnabledBtn.click()
      await Utils.sleep(1000)

      // 步骤2：鼠标拖拽窗口（悬浮标题栏模式）
      // 预期结果：不可以拖动窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0410 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0420
     * @tc.name   : Gesture enabled - floating title bar - mouse - double click.
     * @tc.desc   : Verify window gestures enabled new interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0420', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0420 start.`);
      // 页面初始化
      Settings.createWindow('testability/pages/scenario/action_event/GesturesEnabledNew/GesturesEnabledNew0420')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤1：点击setWindowTitleMoveEnabled true
      let setWindowTitleMoveEnabledBtn = await driver.waitForComponent(ON.id('gestures_enabled_new_0420_btn'), 500)
      await setWindowTitleMoveEnabledBtn.click()
      await Utils.sleep(1000)

      // 步骤2：窗口最大化，鼠标双击标题栏（悬浮标题栏模式）
      // 预期结果：窗口缩小
      // 步骤3：窗口缩放模式，鼠标双击标题栏（悬浮标题栏模式）
      // 预期结果：窗口变为最大化
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0420 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0430
     * @tc.name   : Gesture enabled - floating title bar - touchpad - double tap and hold.
     * @tc.desc   : Verify window gestures enabled new interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0430', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0430 start.`);
      // 页面初始化
      Settings.createWindow('testability/pages/scenario/action_event/GesturesEnabledNew/GesturesEnabledNew0430')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤1：点击setWindowTitleMoveEnabled true
      let setWindowTitleMoveEnabledBtn = await driver.waitForComponent(ON.id('gestures_enabled_new_0430_btn'), 500)
      await setWindowTitleMoveEnabledBtn.click()
      await Utils.sleep(1000)

      // 步骤2：触控板点击两次，不松手，拖拽标题栏（悬浮标题栏模式）
      // 预期结果：不可以拖动窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0430 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0440
     * @tc.name   : Gesture enabled - floating title bar - touchpad - one hand hold, one hand drag.
     * @tc.desc   : Verify the interface under test for scenario described by case 'SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0440'.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0440', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0440 start.`);
      // 页面初始化
      Settings.createWindow('testability/pages/scenario/action_event/GesturesEnabledNew/GesturesEnabledNew0440')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤1：点击setWindowTitleMoveEnabled true
      let setWindowTitleMoveEnabledBtn = await driver.waitForComponent(ON.id('gestures_enabled_new_0440_btn'), 500)
      await setWindowTitleMoveEnabledBtn.click()
      await Utils.sleep(1000)

      // 步骤2：一只手按住触控板，一只手拖拽标题栏（悬浮标题栏模式）
      // 预期结果：不可以拖动窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0440 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0450
     * @tc.name   : Gesture enabled - floating title bar - touchpad - double click.
     * @tc.desc   : Verify window gestures enabled new interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0450', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0450 start.`);
      // 页面初始化
      Settings.createWindow('testability/pages/scenario/action_event/GesturesEnabledNew/GesturesEnabledNew0450')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤1：点击setWindowTitleMoveEnabled true
      let setWindowTitleMoveEnabledBtn = await driver.waitForComponent(ON.id('gestures_enabled_new_0450_btn'), 500)
      await setWindowTitleMoveEnabledBtn.click()
      await Utils.sleep(1000)

      // 步骤2：窗口最大化，触控板上双击标题栏（悬浮标题栏模式）
      // 预期结果：窗口缩小
      // 步骤3：窗口缩放模式，触控板上双击标题栏（悬浮标题栏模式）
      // 预期结果：窗口变为最大化
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0450 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0460
     * @tc.name   : Gesture enabled - floating title bar - finger input (touch screen) - drag.
     * @tc.desc   : Verify window gestures enabled new interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0460', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0460 start.`);
      // 页面初始化
      Settings.createWindow('testability/pages/scenario/action_event/GesturesEnabledNew/GesturesEnabledNew0460')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤1：点击setWindowTitleMoveEnabled true
      let setWindowTitleMoveEnabledBtn = await driver.waitForComponent(ON.id('gestures_enabled_new_0460_btn'), 500)
      await setWindowTitleMoveEnabledBtn.click()
      await Utils.sleep(1000)

      // 步骤2：手指拖拽窗口（悬浮标题栏模式）
      // 预期结果：不能拖动窗口
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0460 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0470
     * @tc.name   : Gesture enabled - floating title bar - finger input (touch screen) - double click.
     * @tc.desc   : Verify window gestures enabled new interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0470', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0470 start.`);
      // 页面初始化
      Settings.createWindow('testability/pages/scenario/action_event/GesturesEnabledNew/GesturesEnabledNew0470')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤1：点击setWindowTitleMoveEnabled true
      let setWindowTitleMoveEnabledBtn = await driver.waitForComponent(ON.id('gestures_enabled_new_0470_btn'), 500)
      await setWindowTitleMoveEnabledBtn.click()
      await Utils.sleep(1000)

      // 步骤2：窗口最大化，手指双击标题栏（悬浮标题栏模式）
      // 预期结果：窗口缩小
      // 步骤3：窗口缩放模式，手指双击标题栏（悬浮标题栏模式）
      // 预期结果：窗口变为最大化
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0470 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0480
     * @tc.name   : Gesture disabled - switch different title bar states.
     * @tc.desc   : Verify window gestures enabled new interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0480', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0480 start.`);
      // 页面初始化
      Settings.createWindow('testability/pages/scenario/action_event/GesturesEnabledNew/GesturesEnabledNew0480')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 预置条件：点击setWindowTitleMoveEnabled false
      let setWindowTitleMoveEnabledBtn = await driver.waitForComponent(ON.id('gestures_enabled_new_0480_btn'), 500)
      await setWindowTitleMoveEnabledBtn.click()
      await Utils.sleep(1000)

      // 步骤1：打开固定标题栏，双击、拖拽标题栏
      // 预期结果：不能双击、拖拽
      // 步骤2：切换为隐藏标题栏，双击、拖拽标题栏
      // 预期结果：不能双击、拖拽
      // 步骤3：切换为悬浮标题栏，双击、拖拽标题栏
      // 预期结果：不能双击、拖拽
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0480 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0490
     * @tc.name   : Gesture disabled - lock screen and unlock, then drag and double click.
     * @tc.desc   : Verify window gestures enabled new interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0490', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0490 start.`);
      // 页面初始化
      Settings.createWindow('testability/pages/scenario/action_event/GesturesEnabledNew/GesturesEnabledNew0490')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 预置条件：点击setWindowTitleMoveEnabled false
      let setWindowTitleMoveEnabledBtn = await driver.waitForComponent(ON.id('gestures_enabled_new_0490_btn'), 500)
      await setWindowTitleMoveEnabledBtn.click()
      await Utils.sleep(1000)

      // 步骤1：打开标题栏，双击、拖拽标题栏
      // 预期结果：不能双击、拖拽
      // 步骤2：锁屏，开机，再次双击、拖拽标题栏
      // 预期结果：不能双击、拖拽
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0490 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0500
     * @tc.name   : Gesture disabled - drag 100 times, double click 100 times.
     * @tc.desc   : Verify window gestures enabled new interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0500', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0500 start.`);
      // 页面初始化
      Settings.createWindow('testability/pages/scenario/action_event/GesturesEnabledNew/GesturesEnabledNew0500')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 预置条件：点击setWindowTitleMoveEnabled false
      let setWindowTitleMoveEnabledBtn = await driver.waitForComponent(ON.id('gestures_enabled_new_0500_btn'), 500)
      await setWindowTitleMoveEnabledBtn.click()
      await Utils.sleep(1000)

      // 步骤1：打开标题栏，拖拽、双击100次
      // 预期结果：功能正常
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0500 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0510
     * @tc.name   : Enable-disable, repeat 100 times.
     * @tc.desc   : Verify window gestures enabled new interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0510', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0510 start.`);
      // 页面初始化
      Settings.createWindow('testability/pages/scenario/action_event/GesturesEnabledNew/GesturesEnabledNew0510')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)

      // 步骤1：重复点击setWindowTitleMoveEnabled false/true 100次，每次点击后拖拽、双击
      let setWindowTitleMoveEnabledBtnFalse = await driver.waitForComponent(ON.id('gestures_enabled_new_0510_btn_false'), 500)
      await setWindowTitleMoveEnabledBtnFalse.click()
      await Utils.sleep(500)

      let setWindowTitleMoveEnabledBtnTrue = await driver.waitForComponent(ON.id('gestures_enabled_new_0510_btn_true'), 500)
      await setWindowTitleMoveEnabledBtnTrue.click()
      await Utils.sleep(500)

      // 预期结果：功能正常
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_WINDOW_GESTURES_ENABLED_NEW_0510 finish.`);
      done()
    })


  })
}