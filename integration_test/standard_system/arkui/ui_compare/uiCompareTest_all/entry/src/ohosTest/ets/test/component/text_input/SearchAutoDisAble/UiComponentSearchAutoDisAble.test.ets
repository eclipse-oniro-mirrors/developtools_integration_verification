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

export default function uiComponentSearchAutoDisAble() {

  describe('uiComponentSearchAutoDisAble', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0090
     * @tc.name   : Set the empty text of the search component to true and add the onsubmit event
     * @tc.desc   : Verify search autodisable interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0090 start.`);
      Settings.createWindow('testability/pages/component/text_input/SearchAutoDisAble/UiComponentSearchAutoDisAble01')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      let Search: Component = await driver.waitForComponent(ON.id('UiComponentSearchAutoDisAble01'),1000);
      let point = await Search.getBoundsCenter();
      let rect = await Search.getBounds();
      await driver.click((point.x+(rect.right-rect.left)/2-1),point.y)
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0010
     * @tc.name   : Set the empty text of the search component to true
     * @tc.desc   : Verify search autodisable interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0010 start.`);
      Settings.createWindow('testability/pages/component/text_input/SearchAutoDisAble/UiComponentSearchAutoDisAble02')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      let Search: Component = await driver.waitForComponent(ON.id('UiComponentSearchAutoDisAble02'),1000);
      let point = await Search.getBoundsCenter();
      let rect = await Search.getBounds();
      await driver.click((point.x+(rect.right-rect.left)/2-1),point.y)
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0050
     * @tc.name   : Set the empty text of the search component to null
     * @tc.desc   : Verify search autodisable interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0050 start.`);
      Settings.createWindow('testability/pages/component/text_input/SearchAutoDisAble/UiComponentSearchAutoDisAble03')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      let Search: Component = await driver.waitForComponent(ON.id('UiComponentSearchAutoDisAble03'),1000);
      await Search.inputText('hello world');
      await driver.waitForIdle(500,2000);
      let point = await Search.getBoundsCenter();
      let rect = await Search.getBounds();
      await driver.click((point.x+(rect.right-rect.left)/2-1),point.y)
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0020
     * @tc.name   : Set the empty text of the search component to true and enter text
     * @tc.desc   : Verify search autodisable interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0020 start.`);
      Settings.createWindow('testability/pages/component/text_input/SearchAutoDisAble/UiComponentSearchAutoDisAble04')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      let Search: Component = await driver.waitForComponent(ON.id('UiComponentSearchAutoDisAble04'),1000);
      await Search.inputText('hello world');
      await driver.waitForIdle(500,2000);
      let point = await Search.getBoundsCenter();
      let rect = await Search.getBounds();
      await driver.click((point.x+(rect.right-rect.left)/2-1),point.y)
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0040
     * @tc.name   : Set the empty text of the search component to false and enter text
     * @tc.desc   : Verify search autodisable interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0040 start.`);
      Settings.createWindow('testability/pages/component/text_input/SearchAutoDisAble/UiComponentSearchAutoDisAble05')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      let Search: Component = await driver.waitForComponent(ON.id('UiComponentSearchAutoDisAble05'),1000);
      await Search.inputText('hello world');
      await driver.waitForIdle(500,2000);
      let point = await Search.getBoundsCenter();
      let rect = await Search.getBounds();
      await driver.click((point.x+(rect.right-rect.left)/2-1),point.y)
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0060
     * @tc.name   : Set the empty text of the search component to true
     * @tc.desc   : Verify search autodisable interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0060 start.`);
      Settings.createWindow('testability/pages/component/text_input/SearchAutoDisAble/UiComponentSearchAutoDisAble06')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      let Search: Component = await driver.waitForComponent(ON.id('UiComponentSearchAutoDisAble06'),1000);
      let point = await Search.getBoundsCenter();
      let rect = await Search.getBounds();
      await driver.click((point.x+(rect.right-rect.left)/2-1),point.y)
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0180
     * @tc.name   : Set the empty text of the search component to true
     * @tc.desc   : Verify search autodisable interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0180 start.`);
      Settings.createWindow('testability/pages/component/text_input/SearchAutoDisAble/UiComponentSearchAutoDisAble07')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      let Search: Component = await driver.waitForComponent(ON.id('UiComponentSearchAutoDisAble07'),1000);
      let point = await Search.getBoundsCenter();
      let rect = await Search.getBounds();
      await driver.mouseClick({x:(point.x+(rect.right-rect.left)/2-1),y:point.y},MouseButton.MOUSE_BUTTON_LEFT)
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0180 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0030
     * @tc.name   : Set the empty text of the search component to false
     * @tc.desc   : Verify search autodisable interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0030 start.`);
      Settings.createWindow('testability/pages/component/text_input/SearchAutoDisAble/UiComponentSearchAutoDisAble08')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      let Search: Component = await driver.waitForComponent(ON.id('UiComponentSearchAutoDisAble08'),1000);
      let point = await Search.getBoundsCenter();
      let rect = await Search.getBounds();
      await driver.click((point.x+(rect.right-rect.left)/2-1),point.y)
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0120
     * @tc.name   : Set the empty text of the search component to true and set placeholder
     * @tc.desc   : Verify search autodisable interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0120 start.`);
      Settings.createWindow('testability/pages/component/text_input/SearchAutoDisAble/UiComponentSearchAutoDisAble09')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      let Search: Component = await driver.waitForComponent(ON.id('UiComponentSearchAutoDisAble09'),1000);
      let point = await Search.getBoundsCenter();
      let rect = await Search.getBounds();
      await driver.click((point.x+(rect.right-rect.left)/2-1),point.y)
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0080
     * @tc.name   : Set the empty text of the search component to autoDisable to true, and change the font color of the SearchButton
     * @tc.desc   : Verify search autodisable interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0080 start.`);
      Settings.createWindow('testability/pages/component/text_input/SearchAutoDisAble/UiComponentSearchAutoDisAble10')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      let button: Component = await driver.waitForComponent(ON.id('UiComponentSearchAutoDisAble10_02'),1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0070
     * @tc.name   : Set the empty text of the search component to autoDisable to true, and change the font size of the SearchButton
     * @tc.desc   : Verify search autodisable interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0070 start.`);
      Settings.createWindow('testability/pages/component/text_input/SearchAutoDisAble/UiComponentSearchAutoDisAble11')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      let button: Component = await driver.waitForComponent(ON.id('UiComponentSearchAutoDisAble11_02'),1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0130
     * @tc.name   : Set the empty text of the search component to autoDisable to true, and change the search type of the SearchButton
     * @tc.desc   : Verify search autodisable interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0130 start.`);
      Settings.createWindow('testability/pages/component/text_input/SearchAutoDisAble/UiComponentSearchAutoDisAble12')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      let button: Component = await driver.waitForComponent(ON.id('UiComponentSearchAutoDisAble12_02'),1000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0130 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0110
     * @tc.name   : Set the empty text of the search component to autoDisable to true, and click the search icon
     * @tc.desc   : Verify search autodisable interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0110 start.`);
      Settings.createWindow('testability/pages/component/text_input/SearchAutoDisAble/UiComponentSearchAutoDisAble13')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      let Search: Component = await driver.waitForComponent(ON.id('UiComponentSearchAutoDisAble13'),1000);
      let point = await Search.getBoundsCenter();
      let rect = await Search.getBounds();
      await driver.click((point.x-(rect.right-rect.left)/2+25),point.y)
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0150
     * @tc.name   : When there is text in the search component, delete or cut all text
     * @tc.desc   : Verify search autodisable interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0150 start.`);
      Settings.createWindow('testability/pages/component/text_input/SearchAutoDisAble/UiComponentSearchAutoDisAble14')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      let Search: Component = await driver.waitForComponent(ON.id('UiComponentSearchAutoDisAble14'),1000);
      let button: Component = await driver.waitForComponent(ON.id('UiComponentSearchAutoDisAble14_02'),1000);
      await Search.inputText('hello world');
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000);
      await button.click();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0170
     * @tc.name   : enter tab key to focus
     * @tc.desc   : Verify search autodisable interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0170 start.`);
      Settings.createWindow('testability/pages/component/text_input/SearchAutoDisAble/UiComponentSearchAutoDisAble15')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      for(let i=0;i<4;++i) {
        await driver.triggerKey(2049)
        windowSnap.snapShot()
        await driver.waitForIdle(500,2000);
      }
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0190
     * @tc.name   : Modifier test
     * @tc.desc   : Verify search autodisable interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0190 start.`);
      Settings.createWindow('testability/pages/component/text_input/SearchAutoDisAble/UiComponentSearchAutoDisAble16')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      let Search: Component = await driver.waitForComponent(ON.id('UiComponentSearchAutoDisAble16'),1000);
      let point = await Search.getBoundsCenter();
      let rect = await Search.getBounds();
      await driver.click((point.x+(rect.right-rect.left)/2-1),point.y)
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0190 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0140
     * @tc.name   : Set the empty text of the search component to autoDisable to true, and enter the content on the pre-screen
     * @tc.desc   : Verify search autodisable interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0140 start.`);
      Settings.createWindow('testability/pages/component/text_input/SearchAutoDisAble/UiComponentSearchAutoDisAble17')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      let Search: Component = await driver.waitForComponent(ON.id('UiComponentSearchAutoDisAble17'),1000);
      await Search.inputText('2017');
      await driver.waitForIdle(500,2000);
      let point = await Search.getBoundsCenter();
      let rect = await Search.getBounds();
      await driver.click((point.x+(rect.right-rect.left)/2-1),point.y)
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SEARCH_AUTODISABLE_0140 finish.`);
      done()
    })
  })
}