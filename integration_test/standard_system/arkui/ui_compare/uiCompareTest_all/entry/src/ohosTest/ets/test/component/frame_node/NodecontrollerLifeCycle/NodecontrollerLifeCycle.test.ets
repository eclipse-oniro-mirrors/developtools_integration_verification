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

export default function nodecontrollerLifeCycle() {

  describe('nodecontrollerLifeCycle', () => {
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
     * @tc.number : SUB_ACE_ACTION_NODECONTROLLER_LIFE_CYCLE_0010
     * @tc.name   : Action nodecontroller life cycle
     * @tc.desc   : Verify action nodecontroller life cycle interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_NODECONTROLLER_LIFE_CYCLE_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_NODECONTROLLER_LIFE_CYCLE_0010 start.`);
      // 1、进入demo
      Settings.createWindow('testability/pages/component/frame_node/NodecontrollerLifeCycle/NodecontrollerLifeCycle0010')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 查找触发按钮
      let trigger_button_lifecycle_0010 = await driver.waitForComponent(ON.id('trigger_button_lifecycle_0010'), 500)

      // 点击按钮触发NodeContainer上树
      await trigger_button_lifecycle_0010.click()
      await Utils.sleep(1000)

      // 2、日志筛选关键字 Cmw - 截图验证NodeController生命周期触发顺序
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_ACTION_NODECONTROLLER_LIFE_CYCLE_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_NODECONTROLLER_LIFE_CYCLE_0020
     * @tc.name   : Action nodecontroller life cycle
     * @tc.desc   : Verify action nodecontroller life cycle interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_NODECONTROLLER_LIFE_CYCLE_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_NODECONTROLLER_LIFE_CYCLE_0020 start.`);
      // 1、进入demo
      Settings.createWindow('testability/pages/component/frame_node/NodecontrollerLifeCycle/NodecontrollerLifeCycle0020')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 查找触发按钮
      let trigger_button_lifecycle_0020 = await driver.waitForComponent(ON.id('trigger_button_lifecycle_0020'), 500)

      // 点击按钮触发NodeController绑定
      await trigger_button_lifecycle_0020.click()
      await Utils.sleep(1000)

      // 2、日志筛选关键字 Cmw - 截图验证NodeController生命周期触发顺序
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_ACTION_NODECONTROLLER_LIFE_CYCLE_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_NODECONTROLLER_LIFE_CYCLE_0040
     * @tc.name   : Action nodecontroller life cycle
     * @tc.desc   : Verify action nodecontroller life cycle interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_NODECONTROLLER_LIFE_CYCLE_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_NODECONTROLLER_LIFE_CYCLE_0040 start.`);
      Settings.createWindow('testability/pages/component/frame_node/NodecontrollerLifeCycle/NodecontrollerLifeCycle0040')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 1、点击第一个下树按钮，查看日志
      let remove_button_lifecycle_0040 = await driver.waitForComponent(ON.id('remove_button_lifecycle_0040'), 500)
      await remove_button_lifecycle_0040.click()
      await Utils.sleep(500)

      // 2、点击第二个下树按钮，查看日志
      let remove_text_lifecycle_0040 = await driver.waitForComponent(ON.id('remove_text_lifecycle_0040'), 500)
      await remove_text_lifecycle_0040.click()
      await Utils.sleep(500)

      // 日志筛选关键字 Cmw - 截图验证NodeController下树生命周期触发顺序
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_ACTION_NODECONTROLLER_LIFE_CYCLE_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_NODECONTROLLER_LIFE_CYCLE_0050
     * @tc.name   : Action nodecontroller life cycle
     * @tc.desc   : Verify action nodecontroller life cycle interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_NODECONTROLLER_LIFE_CYCLE_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_NODECONTROLLER_LIFE_CYCLE_0050 start.`);
      Settings.createWindow('testability/pages/component/frame_node/NodecontrollerLifeCycle/NodecontrollerLifeCycle0050')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 1、点击第一个切换绑定按钮，查看日志
      let toggle_button_lifecycle_0050 = await driver.waitForComponent(ON.id('toggle_button_lifecycle_0050'), 500)
      await toggle_button_lifecycle_0050.click()
      await Utils.sleep(500)

      // 2、点击第二个切换绑定按钮，查看日志
      let toggle_text_lifecycle_0050 = await driver.waitForComponent(ON.id('toggle_text_lifecycle_0050'), 500)
      await toggle_text_lifecycle_0050.click()
      await Utils.sleep(500)

      // 日志筛选关键字 Cmw - 截图验证NodeController解绑生命周期触发顺序
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_ACTION_NODECONTROLLER_LIFE_CYCLE_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_NODECONTROLLER_LIFE_CYCLE_0140
     * @tc.name   : Action nodecontroller life cycle
     * @tc.desc   : Verify action nodecontroller life cycle interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_NODECONTROLLER_LIFE_CYCLE_0140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_NODECONTROLLER_LIFE_CYCLE_0140 start.`);
      // 1、打开应用
      Settings.createWindow('testability/pages/component/frame_node/NodecontrollerLifeCycle/NodecontrollerLifeCycle0140')
      let driver = await Driver.create()
      await Utils.sleep(1000)

      // 等待页面完全加载，让所有NodeController完成绑定
      await driver.waitForIdle(1000, 2000)

      // 2、关闭应用，日志筛选关键字cmw - 截图验证应用关闭时NodeController生命周期触发顺序
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_ACTION_NODECONTROLLER_LIFE_CYCLE_0140 finish.`);
      done()
    })




  })
}