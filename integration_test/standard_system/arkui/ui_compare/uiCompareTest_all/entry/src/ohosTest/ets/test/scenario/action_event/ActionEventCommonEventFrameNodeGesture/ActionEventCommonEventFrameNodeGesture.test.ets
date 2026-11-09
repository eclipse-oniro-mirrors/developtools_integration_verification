/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

export default function actionEventCommonEventFrameNodeGesture() {

  describe('actionEventCommonEventFrameNodeGesture', () => {
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
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_GESTURE_017
     * @tc.name   : Verify that LongPressGesture sets the limitFingerCount parameter to true
     * @tc.desc   : Verify action event commonevent framenode gesture interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_GESTURE_017', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_GESTURE_017`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventFrameNodeGesture_02/ActionEventCommonEventFrameNodeGesture01')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventFrameNodeGesture01'),1000);
      await button01.longClick();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_GESTURE_017 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_GESTURE_026
     * @tc.name   : Verify whether the limitFingerCount parameter is set to true in PanGesture
     * @tc.desc   : Verify action event commonevent framenode gesture interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_GESTURE_026', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_GESTURE_026`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventFrameNodeGesture_02/ActionEventCommonEventFrameNodeGesture02')
      let driver:Driver=Driver.create();
      let text: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventFrameNodeGesture02'),1000);
      let point = await text.getBoundsCenter()
      await driver.swipe(point.x-10,point.y,point.x+10,point.y,200)
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_GESTURE_026 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_GESTURE_034
     * @tc.name   : Verify that it is normal for SwipeGesture to set the speed parameter to a normal value
     * @tc.desc   : Verify action event commonevent framenode gesture interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_GESTURE_034', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_GESTURE_034`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventFrameNodeGesture_02/ActionEventCommonEventFrameNodeGesture03')
      let driver:Driver=Driver.create();
      let text: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventFrameNodeGesture03'),1000);
      let point = await text.getBoundsCenter()
      await driver.swipe(point.x-10,point.y,point.x+10,point.y,10)
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_GESTURE_034 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_GESTURE_035
     * @tc.name   : Verify that SwipeGesture sets the speed parameter to undefined correctly
     * @tc.desc   : Verify action event commonevent framenode gesture interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_GESTURE_035', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_GESTURE_035`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventFrameNodeGesture_02/ActionEventCommonEventFrameNodeGesture04')
      let driver:Driver=Driver.create();
      let text: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventFrameNodeGesture04'),1000);
      let point = await text.getBoundsCenter()
      await driver.swipe(point.x-10,point.y,point.x+10,point.y,10)
      windowSnap.snapShot();
      await driver.waitForIdle(500,2000);
      await driver.swipe(point.x-10,point.y,point.x+10,point.y,200)
      windowSnap.snapShot();
      await driver.waitForIdle(500,2000);
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_GESTURE_035 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_GESTURE_005
     * @tc.name   : Verify that the distanceThreshold parameter is set to normal in TapGesture
     * @tc.desc   : Verify action event commonevent framenode gesture interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_GESTURE_005', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_GESTURE_005`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventFrameNodeGesture_02/ActionEventCommonEventFrameNodeGesture05')
      let driver:Driver=Driver.create();
      let text: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventFrameNodeGesture05'),1000);
      let point = await text.getBoundsCenter()
      await driver.swipe(point.x-10,point.y,point.x+10,point.y,10)
      windowSnap.snapShot();
      await driver.waitForIdle(500,2000);
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_GESTURE_005 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_GESTURE_036
     * @tc.name   : Verify that the limitFingerCount parameter is set to true in SwipeGesture
     * @tc.desc   : Verify action event commonevent framenode gesture interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_GESTURE_036', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_GESTURE_036`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventFrameNodeGesture_02/ActionEventCommonEventFrameNodeGesture06')
      let driver:Driver=Driver.create();
      let text: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventFrameNodeGesture06'),1000);
      let point = await text.getBoundsCenter()
      await driver.swipe(point.x-10,point.y,point.x+10,point.y,10)
      windowSnap.snapShot();
      await driver.waitForIdle(500,2000);
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_GESTURE_036 finish.`);
      done();
    })
  })
}