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

export default function actionEventCommonEventFrameNode() {

  describe('actionEventCommonEventFrameNode', () => {
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
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_4160
     * @tc.name   : Create a new FrameNode and obtain whether the FrameNode is visible isVisible
     * @tc.desc   : Verify action event commonevent framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_4160', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0020 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventFrameNode/ActionEventCommonEventFrameNode01')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventFrameNode01'),1000)
      await button.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_4160 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_4160_446
     * @tc.name   : Create a new FrameNode, add it to the main tree, and obtain whether the FrameNode is visible isVisible
     * @tc.desc   : Verify action event commonevent framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_4160_446', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_4160_446 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventFrameNode/ActionEventCommonEventFrameNode02')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventFrameNode02_01'),1000)
      let button02: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventFrameNode02_02'),1000)
      await button02.click();
      await driver.waitForIdle(500,2000);
      await button01.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_4160_446 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_0061
     * @tc.name   : Create a new FrameNode (with no child nodes) and query the first child node using getFirstChild
     * @tc.desc   : Verify action event commonevent framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_0061', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_0061 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventFrameNode/ActionEventCommonEventFrameNode03')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventFrameNode03_01'),1000)
      let button02: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventFrameNode03_02'),1000)
      let button03: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventFrameNode03_03'),1000)
      await button01.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await button02.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await button03.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_0061 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_0071
     * @tc.name   : Create a new FrameNode and query child node (query for non-existent node) using getChild
     * @tc.desc   : Verify action event commonevent framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_0071', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_0071 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventFrameNode/ActionEventCommonEventFrameNode04')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventFrameNode04_01'),1000)
      let button02: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventFrameNode04_02'),1000)
      let button03: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventFrameNode04_03'),1000)
      await button01.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await button02.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await button03.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_0071 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_0081
     * @tc.name   : Create a new FrameNode and query sibling node (no next sibling node) using getNextSibling
     * @tc.desc   : Verify action event commonevent framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_0081', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_0081 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventFrameNode/ActionEventCommonEventFrameNode05')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventFrameNode05_01'),1000)
      let button02: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventFrameNode05_02'),1000)
      let button03: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventFrameNode05_03'),1000)
      await button01.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await button02.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await button03.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_0081 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_0361
     * @tc.name   : Call dispose in FrameNode after remove
     * @tc.desc   : Verify action event commonevent framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_0361', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_0081 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventFrameNode/ActionEventCommonEventFrameNode06')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventFrameNode06_01'),1000)
      let button02: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventFrameNode06_02'),1000)
      let button03: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventFrameNode06_03'),1000)
      await button01.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await button02.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await button03.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_0361 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_0362
     * @tc.name   : Call dispose in FrameNode before remove
     * @tc.desc   : Verify action event commonevent framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_0362', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_0362 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventFrameNode/ActionEventCommonEventFrameNode07')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventFrameNode07_01'),1000)
      let button02: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventFrameNode07_02'),1000)
      let button03: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventFrameNode07_03'),1000)
      await button01.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await button02.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await button03.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      await button02.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_0362 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_0401
     * @tc.name   : BuilderNode obtained frameNode add child node through appendChild new FrameNode(UIContext)
     * @tc.desc   : Verify action event commonevent framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_0401', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_0401 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventFrameNode/ActionEventCommonEventFrameNode08')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventFrameNode08_01'),1000)
      let button02: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventFrameNode08_02'),1000)
      await button01.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await button02.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_0401 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_0440
     * @tc.name   : Create new FrameNode, delete all child nodes using clearChildren
     * @tc.desc   : Verify action event commonevent framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_0440', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_0440 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventFrameNode/ActionEventCommonEventFrameNode09')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventFrameNode09_01'),1000)
      let button02: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventFrameNode09_02'),1000)
      await button01.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await button02.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_0440 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_0441
     * @tc.name   : Create new FrameNode, delete all child nodes (no child nodes) using clearChildren
     * @tc.desc   : Verify action event commonevent framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_0441', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_0441 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventFrameNode/ActionEventCommonEventFrameNode10')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventFrameNode10_01'),1000)
      let button02: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventFrameNode10_02'),1000)
      let button03: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventFrameNode10_03'),1000)
      await button01.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await button02.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await button03.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_0441 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_4171
     * @tc.name   : FrameNode call isClipToFrame after dispose, will not crash
     * @tc.desc   : Verify action event commonevent framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_4171', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_4171 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventFrameNode/ActionEventCommonEventFrameNode11')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventFrameNode11_01'),1000)
      let button02: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventFrameNode11_02'),1000)
      let button03: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventFrameNode11_03'),1000)
      await button01.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await button02.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await button03.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_4171 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_4291
     * @tc.name   : FrameNode call addComponentContent after dispose, will not crash
     * @tc.desc   : Verify action event commonevent framenode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_4291', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_4291 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventFrameNode/ActionEventCommonEventFrameNode12')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventFrameNode12_01'),1000)
      let button02: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventFrameNode12_02'),1000)
      let button03: Component = await driver.waitForComponent(ON.id('ActionEventCommonEventFrameNode12_03'),1000)
      await button01.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await button02.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await button03.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_FRAMENODE_4291 finish.`);
      done()
    })

  })
}