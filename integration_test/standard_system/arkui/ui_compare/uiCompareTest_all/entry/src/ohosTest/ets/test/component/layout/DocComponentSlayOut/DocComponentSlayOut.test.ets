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

export default function docComponentSlayOut() {

  describe('docComponentSlayOut', () => {
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
     * @tc.number : SUB_ACE_DOC_COMPONENTSLAYOUT_0060
     * @tc.name   : The parameter type of the title attribute of the Navigation component supports the Resource type
     * @tc.desc   : Verify doc componentslayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_DOC_COMPONENTSLAYOUT_0060', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DOC_COMPONENTSLAYOUT_0060 start.`);
      Settings.createWindow('testability/pages/component/layout/DocComponentSlayOut/DocComponentSlayOut01')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_DOC_COMPONENTSLAYOUT_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_DOC_COMPONENTSLAYOUT_0080
     * @tc.name   : The Swiper component supports next-margin/previous-margin
     * @tc.desc   : Verify doc componentslayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_DOC_COMPONENTSLAYOUT_0080', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DOC_COMPONENTSLAYOUT_0080 start.`);
      Settings.createWindow('testability/pages/component/layout/DocComponentSlayOut/DocComponentSlayOut02')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_DOC_COMPONENTSLAYOUT_0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_DOC_COMPONENTSLAYOUT_0090
     * @tc.name   : The Text Span component supports property inheritance between parent and child components
     * @tc.desc   : Verify doc componentslayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_DOC_COMPONENTSLAYOUT_0090', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DOC_COMPONENTSLAYOUT_0090 start.`);
      Settings.createWindow('testability/pages/component/layout/DocComponentSlayOut/DocComponentSlayOut03')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_DOC_COMPONENTSLAYOUT_0090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_DOC_COMPONENTSLAYOUT_0130
     * @tc.name   : The scrolling component Grid allows developers to set the height and position of the scrollBar
     * @tc.desc   : Verify doc componentslayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_DOC_COMPONENTSLAYOUT_0130', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DOC_COMPONENTSLAYOUT_0130 start.`);
      Settings.createWindow('testability/pages/component/layout/DocComponentSlayOut/DocComponentSlayOut04');
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('DocComponentSlayOut04_02'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_DOC_COMPONENTSLAYOUT_0130 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_DOC_COMPONENTSLAYOUT_0100
     * @tc.name   : The TextArea component supports the onEditChange callback
     * @tc.desc   : Verify doc componentslayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_DOC_COMPONENTSLAYOUT_0100', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DOC_COMPONENTSLAYOUT_0100 start.`);
      Settings.createWindow('testability/pages/component/layout/DocComponentSlayOut/DocComponentSlayOut05');
      let driver:Driver=Driver.create();
      let textarea: Component = await driver.waitForComponent(ON.id('DocComponentSlayOut05'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await textarea.click();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_DOC_COMPONENTSLAYOUT_0100 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_DOC_COMPONENTSLAYOUT_0070
     * @tc.name   : The placeHolder property of the Search component supports the Resource type
     * @tc.desc   : Verify doc componentslayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_DOC_COMPONENTSLAYOUT_0070', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DOC_COMPONENTSLAYOUT_0070 start.`);
      Settings.createWindow('testability/pages/component/layout/DocComponentSlayOut/DocComponentSlayOut06');
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_DOC_COMPONENTSLAYOUT_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_DOC_COMPONENTSLAYOUT_0140
     * @tc.name   : Component Routing (Navigation, NavRouter) capabilities are enhanced to support routing stacks and program triggering capabilities
     * @tc.desc   : Verify doc componentslayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_DOC_COMPONENTSLAYOUT_0140', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DOC_COMPONENTSLAYOUT_0140 start.`);
      Settings.createWindow('testability/pages/component/layout/DocComponentSlayOut/DocComponentSlayOut07');
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      await Utils.sleep(2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_DOC_COMPONENTSLAYOUT_0140 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_DOC_COMPONENTSLAYOUT_0110
     * @tc.name   : WaterFlow and FlowItem waterfalls support the new framework
     * @tc.desc   : Verify doc componentslayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_DOC_COMPONENTSLAYOUT_0110', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DOC_COMPONENTSLAYOUT_0110 start.`);
      Settings.createWindow('testability/pages/component/layout/DocComponentSlayOut/DocComponentSlayOut08');
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_DOC_COMPONENTSLAYOUT_0110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_DOC_COMPONENTSLAYOUT_0120
     * @tc.name   : Scrollable Grid supports layout across major axes
     * @tc.desc   : Verify doc componentslayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_DOC_COMPONENTSLAYOUT_0120', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DOC_COMPONENTSLAYOUT_0120 start.`);
      Settings.createWindow('testability/pages/component/layout/DocComponentSlayOut/DocComponentSlayOut09');
      let driver:Driver=Driver.create();
      await Utils.sleep(2000)
      windowSnap.snapShot()
      await Utils.sleep(2000)
      Logger.info('TEST', `SUB_ACE_DOC_COMPONENTSLAYOUT_0120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_DOC_COMPONENTSLAYOUT_0020
     * @tc.name   : bindPopup supports the ability to set an offset relative to the placement position and hide the arrows
     * @tc.desc   : Verify doc componentslayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_DOC_COMPONENTSLAYOUT_0020', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DOC_COMPONENTSLAYOUT_0020 start.`);
      Settings.createWindow('testability/pages/component/layout/DocComponentSlayOut/DocComponentSlayOut10');
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('DocComponentSlayOut10'),1000);
      windowSnap.snapShot();
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_DOC_COMPONENTSLAYOUT_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_DOC_COMPONENTSLAYOUT_0010
     * @tc.name   : The bindContextMenu/bindMenu capability is enhanced
     * @tc.desc   : Verify doc componentslayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_DOC_COMPONENTSLAYOUT_0010', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DOC_COMPONENTSLAYOUT_0010 start.`);
      Settings.createWindow('testability/pages/component/layout/DocComponentSlayOut/DocComponentSlayOut11');
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('DocComponentSlayOut11_01'),1000);
      let Text: Component = await driver.waitForComponent(ON.id('DocComponentSlayOut11_02'),1000);
      let point=await button.getBoundsCenter()
      await Text.click();
      windowSnap.snapShot();
      await Utils.sleep(2000)
      await Text.click();
      await driver.mouseClick({x:point.x, y:point.y}, MouseButton.MOUSE_BUTTON_RIGHT);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_DOC_COMPONENTSLAYOUT_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_DOC_COMPONENTSLAYOUT_0030
     * @tc.name   : bindPopup supports the ability to set an offset relative to the placement position and hide the arrows
     * @tc.desc   : Verify doc componentslayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_DOC_COMPONENTSLAYOUT_0030', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DOC_COMPONENTSLAYOUT_0030 start.`);
      Settings.createWindow('testability/pages/component/layout/DocComponentSlayOut/DocComponentSlayOut12');
      let driver:Driver=Driver.create();
      windowSnap.snapShot()
      let counter: Component = await driver.waitForComponent(ON.id('DocComponentSlayOut12'),1000);
      let point=await counter.getBounds()
      await driver.click(point.right,point.top)
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_DOC_COMPONENTSLAYOUT_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_DOC_COMPONENTSLAYOUT_0040
     * @tc.name   : Flex supports the flex-grow attribute
     * @tc.desc   : Verify doc componentslayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_DOC_COMPONENTSLAYOUT_0040', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_DOC_COMPONENTSLAYOUT_0040 start.`);
      Settings.createWindow('testability/pages/component/layout/DocComponentSlayOut/DocComponentSlayOut13');
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_DOC_COMPONENTSLAYOUT_0040 finish.`);
      done()
    })

  })
}