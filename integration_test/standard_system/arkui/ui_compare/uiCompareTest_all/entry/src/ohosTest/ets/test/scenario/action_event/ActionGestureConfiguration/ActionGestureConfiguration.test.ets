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
import { Driver, ON, Component, MouseButton, PointerMatrix } from '@kit.TestKit'

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

export default function actionGestureConfiguration() {

  describe('actionGestureConfiguration', () => {
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
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0030
     * @tc.name   : LongPressGesture does not set isFingerCountLimited
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0030`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration01')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration01'),1000);
      await button01.longClick();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0030 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0020
     * @tc.name   : LongPressGesture does not set fingers
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0020`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration02')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration02'),1000);
      await button01.longClick();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0020 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0010
     * @tc.name   : LongPressGesture does not set duration
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0010`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration03')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration03'),1000);
      await button01.longClick();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0020 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0040
     * @tc.name   : LongPressGesture does not set repeat
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0040`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration04')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration04'),1000);
      await button01.longClick();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0040 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0870
     * @tc.name   : SwipeGesture does not set fingers
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0870', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0870`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration05')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration05'),1000);
      let point = await button01.getBoundsCenter()
      await driver.swipe(point.x-10,point.y,point.x+10,point.y,10)
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0870 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0890
     * @tc.name   : SwipeGesture does not set speed
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0890', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0890`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration06')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration06'),1000);
      let point = await button01.getBoundsCenter()
      await driver.swipe(point.x-10,point.y,point.x+10,point.y,10)
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0890 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0880
     * @tc.name   : SwipeGesture does not set isFingerCountLimited
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0880', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0880`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration07')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration07'),1000);
      let point = await button01.getBoundsCenter()
      await driver.swipe(point.x-10,point.y,point.x+10,point.y,10)
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0880 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0860
     * @tc.name   : SwipeGesture does not set direction
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0860', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0860`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration08')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration08'),1000);
      let point = await button01.getBoundsCenter()
      await driver.swipe(point.x-10,point.y,point.x+10,point.y,10)
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0860 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_1170
     * @tc.name   : TapGesture sets count to 2
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_1170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1170`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration09')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration09'),1000);
      windowSnap.snapShot();
      await button01.doubleClick();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1170 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_1200
     * @tc.name   : TapGesture sets count to null
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_1200', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1200`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration10')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration10'),1000);
      windowSnap.snapShot();
      await button01.doubleClick();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1200 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_1210
     * @tc.name   : TapGesture sets count to undefined
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_1210', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1210`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration11')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration11'),1000);
      windowSnap.snapShot();
      await button01.doubleClick();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1210 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_1250
     * @tc.name   : TapGesture sets fingers to 2.5
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_1250', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1250`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration12')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration12'),1000);
      windowSnap.snapShot();
      await driver.waitForIdle(500,2000);
      let point =await button01.getBoundsCenter()
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x:point.x,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y+1});
      pointers.setPoint(1,0,{x:point.x,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y+1});
      await driver.injectMultiPointerAction(pointers);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1250 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_1240
     * @tc.name   : TapGesture sets fingers to 11
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_1240', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1240`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration13')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration13'),1000);
      windowSnap.snapShot();
      await button01.doubleClick();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1240 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_1220
     * @tc.name   : TapGesture sets fingers to -1
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_1220', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1220`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration14')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration14'),1000);
      windowSnap.snapShot();
      await button01.doubleClick();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1220 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_1230
     * @tc.name   : TapGesture sets fingers to 1
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_1230', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1230`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration15')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration15'),1000);
      windowSnap.snapShot();
      await button01.doubleClick();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1230 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_1280
     * @tc.name   : TapGesture sets fingers to undefined
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_1280', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1280`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration16')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration16'),1000);
      windowSnap.snapShot();
      await button01.doubleClick();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1280 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_1270
     * @tc.name   : TapGesture sets fingers to null
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_1270', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1270`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration17')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration17'),1000);
      windowSnap.snapShot();
      await button01.doubleClick();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1270 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_1150
     * @tc.name   : TapGesture sets count to -1
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_1150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1150`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration18')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration18'),1000);
      windowSnap.snapShot();
      await button01.doubleClick();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1150 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_1160
     * @tc.name   : TapGesture sets count to 1
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_1160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1160`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration19')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration19'),1000);
      windowSnap.snapShot();
      await button01.doubleClick();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1160 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_1300
     * @tc.name   : TapGesture sets isFingerCountLimited to true
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_1300', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1300`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration20')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration20'),1000);
      windowSnap.snapShot();
      await button01.doubleClick();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1300 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_1310
     * @tc.name   : TapGesture sets isFingerCountLimited to undefined
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_1310', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1310`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration21')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration21'),1000);
      windowSnap.snapShot();
      await button01.doubleClick();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1310 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_1290
     * @tc.name   : TapGesture sets isFingerCountLimited to false
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_1290', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1290`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration22')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration22'),1000);
      windowSnap.snapShot();
      await button01.doubleClick();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1290 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0100
     * @tc.name   : LongPressGesture is set to duration of 800
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0100`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration23')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration23'),1000);
      windowSnap.snapShot();
      await button01.longClick();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0100 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0050
     * @tc.name   : LongPressGesture is set to duration of -100
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0050`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration24')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration24'),1000);
      windowSnap.snapShot();
      await button01.longClick();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0050 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0060
     * @tc.name   : LongPressGesture is set to duration of 0
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0060`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration25')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration25'),1000);
      windowSnap.snapShot();
      await button01.longClick();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0060 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0080
     * @tc.name   : LongPressGesture is set to duration of 222.555
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0080`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration26')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration26'),1000);
      windowSnap.snapShot();
      await button01.longClick();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0080 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0070
     * @tc.name   : LongPressGesture is set to duration of 200
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0070`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration27')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration27'),1000);
      windowSnap.snapShot();
      await button01.longClick();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0070 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0090
     * @tc.name   : LongPressGesture is set to duration of 500
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0090`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration28')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration28'),1000);
      windowSnap.snapShot();
      await button01.longClick();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0090 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0120
     * @tc.name   : LongPressGesture is set to fingers of -1
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0120`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration29')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration29'),1000);
      windowSnap.snapShot();
      await button01.longClick();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0120 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0140
     * @tc.name   : LongPressGesture is set to fingers of 11
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0140`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration30')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration30'),1000);
      windowSnap.snapShot();
      await button01.longClick();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0140 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0130
     * @tc.name   : LongPressGesture is set to fingers of 11
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0130`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration31')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration31'),1000);
      windowSnap.snapShot();
      await button01.longClick();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0130 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0170
     * @tc.name   : LongPressGesture is set to fingers of null
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0170`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration32')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration32'),1000);
      windowSnap.snapShot();
      await button01.longClick();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0170 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0180
     * @tc.name   : LongPressGesture is set to fingers of undefined
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0180`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration33')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration33'),1000);
      windowSnap.snapShot();
      await button01.longClick();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0180 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0200
     * @tc.name   : LongPressGesture is set isFingerCountLimited to true
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0200', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0200`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration34')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration34'),1000);
      windowSnap.snapShot();
      await button01.longClick();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0200 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0190
     * @tc.name   : LongPressGesture is set isFingerCountLimited to false
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0190`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration35')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration35'),1000);
      windowSnap.snapShot();
      await button01.longClick();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0190 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0210
     * @tc.name   : LongPressGesture is set isFingerCountLimited to undefined
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0210', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0210`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration36')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration36'),1000);
      windowSnap.snapShot();
      await button01.longClick();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0210 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0230
     * @tc.name   : LongPressGesture is set repeated to true
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0230', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0230`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration37')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration37'),1000);
      windowSnap.snapShot();
      await button01.longClick();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0230 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0220
     * @tc.name   : LongPressGesture is set repeated to false
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0220', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0220`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration38')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration38'),1000);
      windowSnap.snapShot();
      await button01.longClick();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0220 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0240
     * @tc.name   : LongPressGesture is set repeated to undefined
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0240', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0240`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration39')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration39'),1000);
      windowSnap.snapShot();
      await button01.longClick();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0240 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0110
     * @tc.name   : LongPressGesture is set duration to undefined
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0110`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration40')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration40'),1000);
      windowSnap.snapShot();
      await button01.longClick();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0110 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0110
     * @tc.name   : SwipeGesture is set speed to 300
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_1100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1100`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration41')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration41'),1000);
      let point =await button01.getBoundsCenter()
      windowSnap.snapShot();
      await driver.fling({x:point.x-50,y:point.y},{x:point.x+50,y:point.y},5,6000);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1100 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_1060
     * @tc.name   : SwipeGesture is set speed to 0
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_1060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1060`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration42')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration42'),1000);
      let point =await button01.getBoundsCenter()
      windowSnap.snapShot();
      await driver.fling({x:point.x-50,y:point.y},{x:point.x+50,y:point.y},5,6000);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1060 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_1050
     * @tc.name   : SwipeGesture is set speed to -1
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_1050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1050`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration43')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration43'),1000);
      let point =await button01.getBoundsCenter()
      windowSnap.snapShot();
      await driver.fling({x:point.x-50,y:point.y},{x:point.x+50,y:point.y},5,6000);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1050 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_1070
     * @tc.name   : SwipeGesture is set speed to 100
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_1070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1070`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration44')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration44'),1000);
      let point =await button01.getBoundsCenter()
      windowSnap.snapShot();
      await driver.fling({x:point.x-50,y:point.y},{x:point.x+50,y:point.y},5,6000);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1070 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_1090
     * @tc.name   : SwipeGesture is set speed to 20.55
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_1090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1090`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration45')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration45'),1000);
      let point =await button01.getBoundsCenter()
      windowSnap.snapShot();
      await driver.fling({x:point.x-50,y:point.y},{x:point.x+50,y:point.y},5,6000);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1090 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_1080
     * @tc.name   : SwipeGesture is set speed to 2.5
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_1080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1080`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration46')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration46'),1000);
      let point =await button01.getBoundsCenter()
      windowSnap.snapShot();
      await driver.fling({x:point.x-50,y:point.y},{x:point.x+50,y:point.y},5,6000);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1080 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_1010
     * @tc.name   : SwipeGesture is set fingers to undefined
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_1010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1010`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration47')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration47'),1000);
      let point =await button01.getBoundsCenter()
      windowSnap.snapShot();
      await driver.fling({x:point.x-50,y:point.y},{x:point.x+50,y:point.y},5,6000);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1010 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_1110
     * @tc.name   : SwipeGesture is set speed to undefined
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_1110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1110`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration48')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration48'),1000);
      let point =await button01.getBoundsCenter()
      windowSnap.snapShot();
      await driver.fling({x:point.x-50,y:point.y},{x:point.x+50,y:point.y},5,6000);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1110 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_1000
     * @tc.name   : SwipeGesture is set fingers to null
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_1000', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1000`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration49')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration49'),1000);
      let point =await button01.getBoundsCenter()
      windowSnap.snapShot();
      await driver.fling({x:point.x-50,y:point.y},{x:point.x+50,y:point.y},5,6000);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1000 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0970
     * @tc.name   : SwipeGesture is set fingers to 11
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0970', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0970`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration50')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration50'),1000);
      let point =await button01.getBoundsCenter()
      windowSnap.snapShot();
      await driver.fling({x:point.x-50,y:point.y},{x:point.x+50,y:point.y},5,6000);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0970 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0960
     * @tc.name   : SwipeGesture is set fingers to 1
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0960', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0960`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration51')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration51'),1000);
      let point =await button01.getBoundsCenter()
      windowSnap.snapShot();
      await driver.fling({x:point.x-50,y:point.y},{x:point.x+50,y:point.y},5,6000);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0960 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0950
     * @tc.name   : SwipeGesture is set fingers to -1
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0950', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0950`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration52')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration52'),1000);
      let point =await button01.getBoundsCenter()
      windowSnap.snapShot();
      await driver.fling({x:point.x-50,y:point.y},{x:point.x+50,y:point.y},5,6000);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0950 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0980
     * @tc.name   : SwipeGesture is set fingers to 2.5
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0980', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0980`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration53')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration53'),1000);
      windowSnap.snapShot();
      await driver.waitForIdle(500,2000);
      let point =await button01.getBoundsCenter()
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x:point.x,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y+1});
      pointers.setPoint(1,0,{x:point.x,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y+1});
      await driver.injectMultiPointerAction(pointers);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0980 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0990
     * @tc.name   : SwipeGesture is set fingers to 4
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0990', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0990`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration54')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration54'),1000);
      windowSnap.snapShot();
      await driver.waitForIdle(500,2000);
      let point =await button01.getBoundsCenter()
      let pointers: PointerMatrix = PointerMatrix.create(4,2);
      pointers.setPoint(0,0,{x:point.x,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y+1});
      pointers.setPoint(1,0,{x:point.x,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y+1});
      pointers.setPoint(2,0,{x:point.x,y:point.y});
      pointers.setPoint(2,1,{x:point.x,y:point.y+1});
      pointers.setPoint(3,0,{x:point.x,y:point.y});
      pointers.setPoint(3,1,{x:point.x,y:point.y+1});
      await driver.injectMultiPointerAction(pointers);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0990 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_1040
     * @tc.name   : SwipeGesture is set isFingerCountLimited to undefined
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_1040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1040`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration55')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration55'),1000);
      let point =await button01.getBoundsCenter()
      windowSnap.snapShot();
      await driver.fling({x:point.x-50,y:point.y},{x:point.x+50,y:point.y},5,6000);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1040 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_1030
     * @tc.name   : SwipeGesture is set isFingerCountLimited to true
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_1030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1030`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration56')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration56'),1000);
      let point =await button01.getBoundsCenter()
      windowSnap.snapShot();
      await driver.fling({x:point.x-50,y:point.y},{x:point.x+50,y:point.y},5,6000);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1030 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_1020
     * @tc.name   : SwipeGesture is set isFingerCountLimited to false
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_1020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1020`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration57')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration57'),1000);
      let point =await button01.getBoundsCenter()
      windowSnap.snapShot();
      await driver.fling({x:point.x-50,y:point.y},{x:point.x+50,y:point.y},5,6000);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1020 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0920
     * @tc.name   : SwipeGesture is set direction to None
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0920', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0920`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration58')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration58'),1000);
      let point =await button01.getBoundsCenter()
      windowSnap.snapShot();
      await driver.fling({x:point.x-50,y:point.y},{x:point.x+50,y:point.y},5,6000);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0920 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0900
     * @tc.name   : SwipeGesture is set direction to All
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0900', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0900`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration59')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration59'),1000);
      let point =await button01.getBoundsCenter()
      windowSnap.snapShot();
      await driver.fling({x:point.x-50,y:point.y},{x:point.x+50,y:point.y},5,6000);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0900 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0910
     * @tc.name   : SwipeGesture is set direction to Horizontal
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0910', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0910`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration60')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration60'),1000);
      let point =await button01.getBoundsCenter()
      windowSnap.snapShot();
      await driver.fling({x:point.x-50,y:point.y},{x:point.x+50,y:point.y},5,6000);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0910 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0940
     * @tc.name   : SwipeGesture is set direction to Vertical
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0940', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0940`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration61')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration61'),1000);
      let point =await button01.getBoundsCenter()
      windowSnap.snapShot();
      await driver.fling({x:point.x,y:point.y-10},{x:point.x,y:point.y},5,6000);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0940 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0930
     * @tc.name   : SwipeGesture is set direction to undefined
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0930', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0930`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration62')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration62'),1000);
      let point =await button01.getBoundsCenter()
      windowSnap.snapShot();
      await driver.fling({x:point.x,y:point.y-10},{x:point.x,y:point.y},5,6000);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0930 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0280
     * @tc.name   : PanGesture is set distance to -10
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0280', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0280`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration63')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration63'),1000);
      let point =await button01.getBoundsCenter()
      windowSnap.snapShot();
      await driver.drag(point.x,point.y,point.x-100,point.y,1000);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0280 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0290
     * @tc.name   : PanGesture is set distance to 0
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0290', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0290`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration64')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration64'),1000);
      let point =await button01.getBoundsCenter()
      windowSnap.snapShot();
      await driver.drag(point.x,point.y,point.x-100,point.y,1000);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0290 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0300
     * @tc.name   : PanGesture is set distance to 1
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0300', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0300`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration65')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration65'),1000);
      let point =await button01.getBoundsCenter()
      windowSnap.snapShot();
      await driver.drag(point.x,point.y,point.x-100,point.y,1000);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0300 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0310
     * @tc.name   : PanGesture is set distance to 120
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0310', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0310`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration66')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration66'),1000);
      let point =await button01.getBoundsCenter()
      windowSnap.snapShot();
      await driver.drag(point.x+100,point.y,point.x-100,point.y,1000);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0310 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0320
     * @tc.name   : PanGesture is set distance to 20.5
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0320', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0320`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration67')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration67'),1000);
      let point =await button01.getBoundsCenter()
      windowSnap.snapShot();
      await driver.drag(point.x+100,point.y,point.x-100,point.y,1000);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0320 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0330
     * @tc.name   : PanGesture is set distance to 5
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0330', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0330`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration68')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration68'),1000);
      let point =await button01.getBoundsCenter()
      windowSnap.snapShot();
      await driver.drag(point.x+100,point.y,point.x-100,point.y,1000);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0330 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0340
     * @tc.name   : PanGesture is set distance to undefined
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0340', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0340`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration69')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration69'),1000);
      let point =await button01.getBoundsCenter()
      windowSnap.snapShot();
      await driver.drag(point.x+100,point.y,point.x-100,point.y,1000);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0340 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0440
     * @tc.name   : PanGesture is set isFingerCountLimited to undefined
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0440', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0440`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration70')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration70'),1000);
      let point =await button01.getBoundsCenter()
      windowSnap.snapShot();
      await driver.drag(point.x+100,point.y,point.x-100,point.y,1000);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0440 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0430
     * @tc.name   : PanGesture is set isFingerCountLimited to true
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0430', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0430`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration71')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration71'),1000);
      let point =await button01.getBoundsCenter()
      windowSnap.snapShot();
      await driver.drag(point.x+100,point.y,point.x-100,point.y,1000);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0430 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0420
     * @tc.name   : PanGesture is set isFingerCountLimited to false
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0420', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0420`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration72')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration72'),1000);
      let point =await button01.getBoundsCenter()
      windowSnap.snapShot();
      await driver.drag(point.x+100,point.y,point.x-100,point.y,1000);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0420 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0350
     * @tc.name   : PanGesture is set fingers to -1
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0350', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0350`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration73')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration73'),1000);
      let point =await button01.getBoundsCenter()
      windowSnap.snapShot();
      await driver.drag(point.x+100,point.y,point.x-100,point.y,1000);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0350 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0360
     * @tc.name   : PanGesture is set fingers to 1
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0360', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0360`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration74')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration74'),1000);
      let point =await button01.getBoundsCenter()
      windowSnap.snapShot();
      await driver.drag(point.x+100,point.y,point.x-100,point.y,1000);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0360 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0370
     * @tc.name   : PanGesture is set fingers to 11
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0370', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0370`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration75')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration75'),1000);
      let point =await button01.getBoundsCenter()
      windowSnap.snapShot();
      await driver.drag(point.x+100,point.y,point.x-100,point.y,1000);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0370 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0400
     * @tc.name   : PanGesture is set fingers to null
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0400', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0400`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration76')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration76'),1000);
      let point =await button01.getBoundsCenter()
      windowSnap.snapShot();
      await driver.drag(point.x+100,point.y,point.x-100,point.y,1000);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0400 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0410
     * @tc.name   : PanGesture is set fingers to undefined
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0410', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0410`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration77')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration77'),1000);
      let point =await button01.getBoundsCenter()
      windowSnap.snapShot();
      await driver.drag(point.x+100,point.y,point.x-100,point.y,1000);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0410 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_1260
     * @tc.name   : TapGesture is set fingers to 4
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_1260', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1260`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration78')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration78'),1000);
      windowSnap.snapShot();
      await driver.waitForIdle(500,2000);
      let point =await button01.getBoundsCenter()
      let pointers: PointerMatrix = PointerMatrix.create(4,2);
      pointers.setPoint(0,0,{x:point.x,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y});
      pointers.setPoint(1,0,{x:point.x,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y});
      pointers.setPoint(2,0,{x:point.x,y:point.y});
      pointers.setPoint(2,1,{x:point.x,y:point.y});
      pointers.setPoint(3,0,{x:point.x,y:point.y});
      pointers.setPoint(3,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1260 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0380
     * @tc.name   : PanGesture is set fingers to 2.5
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0380', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0380`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration79')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration79'),1000);
      windowSnap.snapShot();
      await driver.waitForIdle(500,2000);
      let point =await button01.getBoundsCenter()
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x:point.x,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y+20});
      pointers.setPoint(1,0,{x:point.x,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y+20});
      await driver.injectMultiPointerAction(pointers);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0380 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0390
     * @tc.name   : PanGesture is set fingers to 4
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0390', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0390`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration80')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration80'),1000);
      windowSnap.snapShot();
      await driver.waitForIdle(500,2000);
      let point =await button01.getBoundsCenter()
      let pointers: PointerMatrix = PointerMatrix.create(4,2);
      pointers.setPoint(0,0,{x:point.x,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y+20});
      pointers.setPoint(1,0,{x:point.x,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y+20});
      pointers.setPoint(2,0,{x:point.x,y:point.y});
      pointers.setPoint(2,1,{x:point.x,y:point.y+20});
      pointers.setPoint(3,0,{x:point.x,y:point.y});
      pointers.setPoint(3,1,{x:point.x,y:point.y+20});
      await driver.injectMultiPointerAction(pointers);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0390 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0570
     * @tc.name   : PinchGesture is set fingers to 1
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0570', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0570`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration81')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration81'),1000);
      windowSnap.snapShot();
      await driver.waitForIdle(500,2000);
      let point =await button01.getBoundsCenter()
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x:point.x-50,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y});
      pointers.setPoint(1,0,{x:point.x+50,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0570 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0560
     * @tc.name   : PinchGesture is set fingers to -1
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0560', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0560`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration82')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration82'),1000);
      windowSnap.snapShot();
      await driver.waitForIdle(500,2000);
      let point =await button01.getBoundsCenter()
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x:point.x-50,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y});
      pointers.setPoint(1,0,{x:point.x+50,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0560 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0590
     * @tc.name   : PinchGesture is set fingers to 2.5
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0590', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0590`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration83')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration83'),1000);
      windowSnap.snapShot();
      await driver.waitForIdle(500,2000);
      let point =await button01.getBoundsCenter()
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x:point.x-50,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y});
      pointers.setPoint(1,0,{x:point.x+50,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0590 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0580
     * @tc.name   : PinchGesture is set fingers to 11
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0580', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0580`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration84')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration84'),1000);
      windowSnap.snapShot();
      await driver.waitForIdle(500,2000);
      let point =await button01.getBoundsCenter()
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x:point.x-50,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y});
      pointers.setPoint(1,0,{x:point.x+50,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0580 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0620
     * @tc.name   : PinchGesture is set fingers to undefined
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0620', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0620`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration85')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration85'),1000);
      windowSnap.snapShot();
      await driver.waitForIdle(500,2000);
      let point =await button01.getBoundsCenter()
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x:point.x-50,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y});
      pointers.setPoint(1,0,{x:point.x+50,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0620 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0600
     * @tc.name   : PinchGesture is set fingers to 4
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0600', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0600`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration86')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration86'),1000);
      windowSnap.snapShot();
      await driver.waitForIdle(500,2000);
      let point =await button01.getBoundsCenter()
      let pointers: PointerMatrix = PointerMatrix.create(4,2);
      pointers.setPoint(0,0,{x:point.x-50,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y});
      pointers.setPoint(1,0,{x:point.x+50,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y});
      pointers.setPoint(2,0,{x:point.x-50,y:point.y});
      pointers.setPoint(2,1,{x:point.x,y:point.y});
      pointers.setPoint(3,0,{x:point.x+50,y:point.y});
      pointers.setPoint(3,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0600 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0550
     * @tc.name   : PinchGesture is set distance to undefined
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0550', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0550`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration87')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration87'),1000);
      windowSnap.snapShot();
      await driver.waitForIdle(500,2000);
      let point =await button01.getBoundsCenter()
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x:point.x-50,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y});
      pointers.setPoint(1,0,{x:point.x+50,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0550 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0510
     * @tc.name   : PinchGesture is set distance to 2.5
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0510', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0510`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration88')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration88'),1000);
      windowSnap.snapShot();
      await driver.waitForIdle(500,2000);
      let point =await button01.getBoundsCenter()
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x:point.x-50,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y});
      pointers.setPoint(1,0,{x:point.x+50,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0510 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0520
     * @tc.name   : PinchGesture is set distance to 20.55
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0520', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0520`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration89')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration89'),1000);
      windowSnap.snapShot();
      await driver.waitForIdle(500,2000);
      let point =await button01.getBoundsCenter()
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x:point.x-50,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y});
      pointers.setPoint(1,0,{x:point.x+50,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0520 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0540
     * @tc.name   : PinchGesture is set distance to 5
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0540', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0540`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration90')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration90'),1000);
      windowSnap.snapShot();
      await driver.waitForIdle(500,2000);
      let point =await button01.getBoundsCenter()
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x:point.x-50,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y});
      pointers.setPoint(1,0,{x:point.x+50,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0540 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0650
     * @tc.name   : PinchGesture is set isFingerCountLimited to undefined
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0650', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0650`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration91')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration91'),1000);
      windowSnap.snapShot();
      await driver.waitForIdle(500,2000);
      let point =await button01.getBoundsCenter()
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x:point.x-50,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y});
      pointers.setPoint(1,0,{x:point.x+50,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0650 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0640
     * @tc.name   : PinchGesture is set isFingerCountLimited to true
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0640', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0640`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration92')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration92'),1000);
      windowSnap.snapShot();
      await driver.waitForIdle(500,2000);
      let point =await button01.getBoundsCenter()
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x:point.x-50,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y});
      pointers.setPoint(1,0,{x:point.x+50,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0640 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0630
     * @tc.name   : PinchGesture is set isFingerCountLimited to false
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0630', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0630`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration93')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration93'),1000);
      windowSnap.snapShot();
      await driver.waitForIdle(500,2000);
      let point =await button01.getBoundsCenter()
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x:point.x-50,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y});
      pointers.setPoint(1,0,{x:point.x+50,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0630 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0530
     * @tc.name   : PinchGesture is set distance to 30
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0530', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0530`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration94')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration94'),1000);
      windowSnap.snapShot();
      await driver.waitForIdle(500,2000);
      let point =await button01.getBoundsCenter()
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x:point.x-50,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y});
      pointers.setPoint(1,0,{x:point.x+50,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0530 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0700
     * @tc.name   : RotationGesture is set angle to 0
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0700', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0700`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration95')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration95'),1000);
      windowSnap.snapShot();
      await driver.waitForIdle(500,2000);
      let point =await button01.getBoundsCenter()
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x:point.x,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y-20});
      pointers.setPoint(1,0,{x:point.x,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y-20});
      await driver.injectMultiPointerAction(pointers);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0700 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0690
     * @tc.name   : RotationGesture is set angle to -1
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0690', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0690`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration96')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration96'),1000);
      windowSnap.snapShot();
      await driver.waitForIdle(500,2000);
      let point =await button01.getBoundsCenter()
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x:point.x,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y-20});
      pointers.setPoint(1,0,{x:point.x,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y-20});
      await driver.injectMultiPointerAction(pointers);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0690 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0710
     * @tc.name   : RotationGesture is set angle to 1
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0710', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0710`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration97')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration97'),1000);
      windowSnap.snapShot();
      await driver.waitForIdle(500,2000);
      let point =await button01.getBoundsCenter()
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x:point.x,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y-20});
      pointers.setPoint(1,0,{x:point.x,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y-20});
      await driver.injectMultiPointerAction(pointers);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0710 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0750
     * @tc.name   : RotationGesture is set angle to undefined
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0750', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0750`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration98')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration98'),1000);
      windowSnap.snapShot();
      await driver.waitForIdle(500,2000);
      let point =await button01.getBoundsCenter()
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x:point.x,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y-20});
      pointers.setPoint(1,0,{x:point.x,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y-20});
      await driver.injectMultiPointerAction(pointers);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0750 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0730
     * @tc.name   : RotationGesture is set angle to 370
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0730', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0730`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration99')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration99'),1000);
      windowSnap.snapShot();
      await driver.waitForIdle(500,2000);
      let point =await button01.getBoundsCenter()
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x:point.x,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y-20});
      pointers.setPoint(1,0,{x:point.x,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y-20});
      await driver.injectMultiPointerAction(pointers);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0730 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0770
     * @tc.name   : RotationGesture is set fingers to 1
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0770', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0770`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration100')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration100'),1000);
      windowSnap.snapShot();
      await driver.waitForIdle(500,2000);
      let point =await button01.getBoundsCenter()
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x:point.x,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y-20});
      pointers.setPoint(1,0,{x:point.x,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y-20});
      await driver.injectMultiPointerAction(pointers);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0770 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0760
     * @tc.name   : RotationGesture is set fingers to -1
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0760', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0760`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration101')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration101'),1000);
      windowSnap.snapShot();
      await driver.waitForIdle(500,2000);
      let point =await button01.getBoundsCenter()
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x:point.x,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y-20});
      pointers.setPoint(1,0,{x:point.x,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y-20});
      await driver.injectMultiPointerAction(pointers);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0760 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0810
     * @tc.name   : RotationGesture is set fingers to null
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0810', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0810`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration102')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration102'),1000);
      windowSnap.snapShot();
      await driver.waitForIdle(500,2000);
      let point =await button01.getBoundsCenter()
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x:point.x,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y-20});
      pointers.setPoint(1,0,{x:point.x,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y-20});
      await driver.injectMultiPointerAction(pointers);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0810 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0790
     * @tc.name   : RotationGesture is set fingers to 2.5
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0790', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0790`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration103')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration103'),1000);
      windowSnap.snapShot();
      await driver.waitForIdle(500,2000);
      let point =await button01.getBoundsCenter()
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x:point.x,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y-20});
      pointers.setPoint(1,0,{x:point.x,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y-20});
      await driver.injectMultiPointerAction(pointers);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0790 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0780
     * @tc.name   : RotationGesture is set fingers to 11
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0780', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0780`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration104')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration104'),1000);
      windowSnap.snapShot();
      await driver.waitForIdle(500,2000);
      let point =await button01.getBoundsCenter()
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x:point.x,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y-20});
      pointers.setPoint(1,0,{x:point.x,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y-20});
      await driver.injectMultiPointerAction(pointers);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0780 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0800
     * @tc.name   : RotationGesture is set fingers to 4
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0800', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0800`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration105')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration105'),1000);
      windowSnap.snapShot();
      await driver.waitForIdle(500,2000);
      let point =await button01.getBoundsCenter()
      let pointers: PointerMatrix = PointerMatrix.create(4,2);
      pointers.setPoint(0,0,{x:point.x,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y-20});
      pointers.setPoint(1,0,{x:point.x,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y-20});
      pointers.setPoint(2,0,{x:point.x,y:point.y});
      pointers.setPoint(2,1,{x:point.x,y:point.y-20});
      pointers.setPoint(3,0,{x:point.x,y:point.y});
      pointers.setPoint(3,1,{x:point.x,y:point.y-20});
      await driver.injectMultiPointerAction(pointers);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0800 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0850
     * @tc.name   : RotationGesture is set isFingerCountLimited to undefined
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0850', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0850`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration106')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration106'),1000);
      windowSnap.snapShot();
      await driver.waitForIdle(500,2000);
      let point =await button01.getBoundsCenter()
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x:point.x,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y-20});
      pointers.setPoint(1,0,{x:point.x,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y-20});
      await driver.injectMultiPointerAction(pointers);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0850 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0830
     * @tc.name   : RotationGesture is set isFingerCountLimited to false
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0830', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0830`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration107')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration107'),1000);
      windowSnap.snapShot();
      await driver.waitForIdle(500,2000);
      let point =await button01.getBoundsCenter()
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x:point.x,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y-20});
      pointers.setPoint(1,0,{x:point.x,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y-20});
      await driver.injectMultiPointerAction(pointers);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0830 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0840
     * @tc.name   : RotationGesture is set isFingerCountLimited to true
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0840', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0840`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration108')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration108'),1000);
      windowSnap.snapShot();
      await driver.waitForIdle(500,2000);
      let point =await button01.getBoundsCenter()
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x:point.x,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y-20});
      pointers.setPoint(1,0,{x:point.x,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y-20});
      await driver.injectMultiPointerAction(pointers);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0840 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0500
     * @tc.name   : PinchGesture is set distance to 1
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0500', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0500`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration109')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration109'),1000);
      windowSnap.snapShot();
      await driver.waitForIdle(500,2000);
      let point =await button01.getBoundsCenter()
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x:point.x-50,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y});
      pointers.setPoint(1,0,{x:point.x+50,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0500 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0490
     * @tc.name   : PinchGesture is set distance to 0
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0490', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0490`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration110')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration110'),1000);
      windowSnap.snapShot();
      await driver.waitForIdle(500,2000);
      let point =await button01.getBoundsCenter()
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x:point.x-50,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y});
      pointers.setPoint(1,0,{x:point.x+50,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0490 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0480
     * @tc.name   : PinchGesture is set distance to -10
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0480', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0480`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration111')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration111'),1000);
      windowSnap.snapShot();
      await driver.waitForIdle(500,2000);
      let point =await button01.getBoundsCenter()
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x:point.x-50,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y});
      pointers.setPoint(1,0,{x:point.x+50,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0480 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0160
     * @tc.name   : LongPressGesture设置fingers为4
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0160 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration112')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration112'),1000);
      const point = await button.getBoundsCenter();
      let pointers3: PointerMatrix = PointerMatrix.create(4,2);
      pointers3.setPoint(0,0,{x:point.x+10,y:point.y});
      pointers3.setPoint(0,1,{x:point.x,y:point.y});
      pointers3.setPoint(1,0,{x:point.x+20,y:point.y});
      pointers3.setPoint(1,1,{x:point.x,y:point.y});
      pointers3.setPoint(2,0,{x:point.x+30,y:point.y});
      pointers3.setPoint(2,1,{x:point.x,y:point.y});
      pointers3.setPoint(3,0,{x:point.x+40,y:point.y});
      pointers3.setPoint(3,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers3);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0160 finish.`);
      done();
    })


    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0150
     * @tc.name   : LongPressGesture设置fingers为2.5
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0150 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration113')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration113'),1000);
      let point = await button.getBoundsCenter()
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x:point.x,y:point.y});
      pointers.setPoint(0,1,{x:point.x+50,y:point.y});
      pointers.setPoint(1,0,{x:point.x-50,y:point.y+20});
      pointers.setPoint(1,1,{x:point.x+50,y:point.y+20});
      await driver.injectMultiPointerAction(pointers,300);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0150 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0740
     * @tc.name   : RotationGesture设置angle为50
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0740', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0740 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration114')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration114'),1000);
      const btnBounds = await button.getBounds();
      const centerX = btnBounds.left + (btnBounds.right - btnBounds.left) / 2;
      const centerY = btnBounds.top + (btnBounds.bottom - btnBounds.top) / 2;
      const radius = 100;
      const pointers: PointerMatrix = PointerMatrix.create(2, 40);
      for (let i = 0; i < 40; i++) {
        const angle = (60 / 39) * i;
        const rad = angle * Math.PI / 180;
        const f0x = centerX + radius * Math.cos(rad);
        const f0y = centerY - radius * Math.sin(rad);
        const f1x = centerX - radius * Math.cos(rad);
        const f1y = centerY + radius * Math.sin(rad);
        pointers.setPoint(0, i, {x: Math.round(f0x), y: Math.round(f0y)});
        pointers.setPoint(1, i, {x: Math.round(f1x), y: Math.round(f1y)});
      }
      await driver.injectMultiPointerAction(pointers, 50);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0740 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0720
     * @tc.name   : RotationGesture设置angle为2.5
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0720', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0720 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration115')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration115'),1000);
      const btnBounds = await button.getBounds();
      const centerX = btnBounds.left + (btnBounds.right - btnBounds.left) / 2;
      const centerY = btnBounds.top + (btnBounds.bottom - btnBounds.top) / 2;
      const radius = 150;
      const targetAngle = 2.5;
      const pointers: PointerMatrix = PointerMatrix.create(2, 20);
      for (let i = 0; i < 20; i++) {
        const currentAngle = (targetAngle / 19) * i;
        const rad = currentAngle * Math.PI / 180;
        const f0x = centerX + radius * Math.cos(rad);
        const f0y = centerY - radius * Math.sin(rad);
        const f1x = centerX - radius * Math.cos(rad);
        const f1y = centerY + radius * Math.sin(rad);
        pointers.setPoint(0, i, {x: Math.round(f0x), y: Math.round(f0y)});
        pointers.setPoint(1, i, {x: Math.round(f1x), y: Math.round(f1y)});
      }
      await driver.injectMultiPointerAction(pointers, 30);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0720 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_1180
     * @tc.name   : TapGesture设置count为3.5
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_1180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1180 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration116')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration116'),1000);
      await button.click()
      await button.click()
      await button.click()
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1180 finish.`);
      done();
    })


    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0820
     * @tc.name   : RotationGesture设置fingers为undefined
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0820', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0820 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration117')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration117'),1000);
      const btnBounds = await button.getBounds();
      const centerX = btnBounds.left + (btnBounds.right - btnBounds.left) / 2;
      const centerY = btnBounds.top + (btnBounds.bottom - btnBounds.top) / 2;
      const radius = 100;
      const pointers: PointerMatrix = PointerMatrix.create(2, 30);
      for (let i = 0; i < 30; i++) {
        const angle = (30 / 29) * i;
        const rad = angle * Math.PI / 180;
        pointers.setPoint(0, i, {
          x: Math.round(centerX + radius * Math.cos(rad)),
          y: Math.round(centerY - radius * Math.sin(rad))
        });
        pointers.setPoint(1, i, {
          x: Math.round(centerX - radius * Math.cos(rad)),
          y: Math.round(centerY + radius * Math.sin(rad))
        });
      }
      await driver.injectMultiPointerAction(pointers, 50);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0820 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_0610
     * @tc.name   : PinchGesture设置fingers为null
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_0610', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0610 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration118')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration118'),1000);
      let point = await button.getBoundsCenter()
      let pointers: PointerMatrix = PointerMatrix.create(2, 10);
      for (let i = 0; i < 10; i++) {
        pointers.setPoint(0, i, {x: point.x - 20 - i * 5, y: point.y});
        pointers.setPoint(1, i, {x: point.x + 20 + i * 5, y: point.y});
      }
      await driver.injectMultiPointerAction(pointers);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_0610 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_CONFIGURATION_1190
     * @tc.name   : TapGesture设置count为4
     * @tc.desc   : Verify action gesture configuration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_CONFIGURATION_1190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1190 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionGestureConfiguration_02/ActionGestureConfiguration119')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('ActionGestureConfiguration119'),1000);
      let point = await button.getBoundsCenter()
      await button.click()
      await button.click()
      await button.click()
      await button.click()
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_CONFIGURATION_1190 finish.`);
      done();
    })
  })
}