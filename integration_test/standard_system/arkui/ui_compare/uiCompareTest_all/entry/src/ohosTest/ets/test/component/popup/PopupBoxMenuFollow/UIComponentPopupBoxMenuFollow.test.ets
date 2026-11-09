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

export default function uIComponentPopupBoxMenuFollow() {

  describe('uIComponentPopupBoxMenuFollow', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0210
     * @tc.name   : Verify that when bindContextMenu sets preview to a custom builder and placement is set to Bottom, the menu displays correctly and the menu items appear along with the preview.
     * @tc.desc   : Verify popupbox menu follow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0210', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0210 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxMenuFollow/UIComponentPopupBoxMenuFollow01')
      let driver:Driver=Driver.create();
      let image: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxMenuFollow01'),1000);
      let point = await image.getBoundsCenter()
      await driver.longClick(point.x,point.y)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0210 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0220
     * @tc.name   : Verify that when bindContextMenu sets preview to a custom builder and placement is set to LeftBottom, the menu displays normally and the menu items appear along with the preview image.
     * @tc.desc   : Verify popupbox menu follow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0220', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0220 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxMenuFollow/UIComponentPopupBoxMenuFollow02')
      let driver:Driver=Driver.create();
      let image: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxMenuFollow02'),1000);
      let point = await image.getBoundsCenter()
      await driver.longClick(point.x,point.y)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0220 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0230
     * @tc.name   : Verify that when bindContextMenu sets preview to a custom builder and placement is set to LeftTop, the menu displays normally and the menu items appear along with the preview.
     * @tc.desc   : Verify popupbox menu follow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0230', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0230 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxMenuFollow/UIComponentPopupBoxMenuFollow03')
      let driver:Driver=Driver.create();
      let image: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxMenuFollow03'),1000);
      let point = await image.getBoundsCenter()
      await driver.longClick(point.x,point.y)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0230 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0280
     * @tc.name   : Verify that when bindContextMenu sets preview to a custom builder and placement is set to TopLeft, the menu displays normally and the menu items appear along with the preview.
     * @tc.desc   : Verify popupbox menu follow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0280', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0280 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxMenuFollow/UIComponentPopupBoxMenuFollow04')
      let driver:Driver=Driver.create();
      let image: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxMenuFollow04'),1000);
      let point = await image.getBoundsCenter()
      await driver.longClick(point.x,point.y)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0280 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0270
     * @tc.name   : Verify that when bindContextMenu sets preview to a custom builder and placement is set to Right, the menu displays correctly and the menu items appear along with the preview image.
     * @tc.desc   : Verify popupbox menu follow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0270', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0270 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxMenuFollow/UIComponentPopupBoxMenuFollow05')
      let driver:Driver=Driver.create();
      let image: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxMenuFollow05'),1000);
      let point = await image.getBoundsCenter()
      await driver.longClick(point.x,point.y)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0270 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0240
     * @tc.name   : Verify that when bindContextMenu sets preview to a custom builder and placement is set to Left, the menu displays normally and the menu items appear along with the preview image.
     * @tc.desc   : Verify popupbox menu follow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0240', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0240 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxMenuFollow/UIComponentPopupBoxMenuFollow06')
      let driver:Driver=Driver.create();
      let image: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxMenuFollow06'),1000);
      let point = await image.getBoundsCenter()
      await driver.longClick(point.x,point.y)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0240 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0260
     * @tc.name   : Verify that when bindContextMenu sets preview to a custom builder and placement is set to RightTop, the menu displays normally and the menu items appear along with the preview.
     * @tc.desc   : Verify popupbox menu follow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0260', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0260 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxMenuFollow/UIComponentPopupBoxMenuFollow07')
      let driver:Driver=Driver.create();
      let image: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxMenuFollow07'),1000);
      let point = await image.getBoundsCenter()
      await driver.longClick(point.x,point.y)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0260 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0290
     * @tc.name   : Verify that when bindContextMenu sets preview to a custom builder and placement is set to TopRight, the menu displays normally and the menu items appear along with the preview.
     * @tc.desc   : Verify popupbox menu follow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0290', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0290 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxMenuFollow/UIComponentPopupBoxMenuFollow08')
      let driver:Driver=Driver.create();
      let image: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxMenuFollow08'),1000);
      let point = await image.getBoundsCenter()
      await driver.longClick(point.x,point.y)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0290 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0250
     * @tc.name   : Verify that when bindContextMenu sets preview to a custom builder and placement is set to RightBottom, the menu displays normally and the menu items appear along with the preview image.
     * @tc.desc   : Verify popupbox menu follow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0250', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0250 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxMenuFollow/UIComponentPopupBoxMenuFollow09')
      let driver:Driver=Driver.create();
      let image: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxMenuFollow09'),1000);
      let point = await image.getBoundsCenter()
      await driver.longClick(point.x,point.y)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0250 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0190
     * @tc.name   : Verify that when bindContextMenu sets preview to custom builder and placement to BottomLeft, the menu displays normally and the menu items appear along with the preview image.
     * @tc.desc   : Verify popupbox menu follow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0190', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0190 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxMenuFollow/UIComponentPopupBoxMenuFollow10')
      let driver:Driver=Driver.create();
      let image: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxMenuFollow10'),1000);
      let point = await image.getBoundsCenter()
      await driver.longClick(point.x,point.y)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0190 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0200
     * @tc.name   : Verify that when bindContextMenu sets preview to custom builder and placement to BottomRight, the menu displays normally and the menu items appear along with the preview image.
     * @tc.desc   : Verify popupbox menu follow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0200', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0200 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxMenuFollow/UIComponentPopupBoxMenuFollow11')
      let driver:Driver=Driver.create();
      let image: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxMenuFollow11'),1000);
      let point = await image.getBoundsCenter()
      await driver.longClick(point.x,point.y)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0200 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0300
     * @tc.name   : Verify that when bindContextMenu sets preview to custom builder and placement to Top, the menu displays normally and the menu items appear along with the preview image.
     * @tc.desc   : Verify popupbox menu follow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0300', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0300 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxMenuFollow/UIComponentPopupBoxMenuFollow12')
      let driver:Driver=Driver.create();
      let image: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxMenuFollow12'),1000);
      let point = await image.getBoundsCenter()
      await driver.longClick(point.x,point.y)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0300 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0090
     * @tc.name   : Verify that when bindContextMenu sets preview to MenuPreviewMode.IMAGE and placement to Bottom, the menu displays normally and the menu items appear along with the preview image.
     * @tc.desc   : Verify popupbox menu follow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0090', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0090 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxMenuFollow/UIComponentPopupBoxMenuFollow13')
      let driver:Driver=Driver.create();
      let image: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxMenuFollow13'),1000);
      let point = await image.getBoundsCenter()
      await driver.longClick(point.x,point.y)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0100
     * @tc.name   : Verify that when bindContextMenu sets preview to MenuPreviewMode.IMAGE and placement to LeftBottom, the menu displays normally and the menu items appear along with the preview image.
     * @tc.desc   : Verify popupbox menu follow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0100', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0100 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxMenuFollow/UIComponentPopupBoxMenuFollow14')
      let driver:Driver=Driver.create();
      let image: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxMenuFollow14'),1000);
      let point = await image.getBoundsCenter()
      await driver.longClick(point.x,point.y)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0100 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0110
     * @tc.name   : Verify that when bindContextMenu sets preview to MenuPreviewMode.IMAGE and placement to LeftTop, the menu displays normally and the menu items appear along with the preview image.
     * @tc.desc   : Verify popupbox menu follow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0110', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0110 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxMenuFollow/UIComponentPopupBoxMenuFollow15')
      let driver:Driver=Driver.create();
      let image: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxMenuFollow15'),1000);
      let point = await image.getBoundsCenter()
      await driver.longClick(point.x,point.y)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0160
     * @tc.name   : Verify that when bindContextMenu sets preview to MenuPreviewMode.IMAGE and placement to TopLeft, the menu displays normally and the menu items appear along with the preview image.
     * @tc.desc   : Verify popupbox menu follow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0160', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0160 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxMenuFollow/UIComponentPopupBoxMenuFollow16')
      let driver:Driver=Driver.create();
      let image: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxMenuFollow16'),1000);
      let point = await image.getBoundsCenter()
      await driver.longClick(point.x,point.y)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0160 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0150
     * @tc.name   : Verify that when bindContextMenu sets preview to MenuPreviewMode.IMAGE and placement to Right, the menu displays normally and the menu items appear along with the preview image.
     * @tc.desc   : Verify popupbox menu follow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0150', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0150 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxMenuFollow/UIComponentPopupBoxMenuFollow17')
      let driver:Driver=Driver.create();
      let image: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxMenuFollow17'),1000);
      let point = await image.getBoundsCenter()
      await driver.longClick(point.x,point.y)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0150 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0120
     * @tc.name   : Verify that when bindContextMenu sets preview to MenuPreviewMode.IMAGE and placement to Left, the menu displays normally and the menu items appear along with the preview image.
     * @tc.desc   : Verify popupbox menu follow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0120', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0120 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxMenuFollow/UIComponentPopupBoxMenuFollow18')
      let driver:Driver=Driver.create();
      let image: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxMenuFollow18'),1000);
      let point = await image.getBoundsCenter()
      await driver.longClick(point.x,point.y)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0140
     * @tc.name   : Verify that when bindContextMenu sets preview to MenuPreviewMode.IMAGE and placement to RightTop, the menu displays normally and the menu items appear along with the preview image.
     * @tc.desc   : Verify popupbox menu follow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0140', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0140 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxMenuFollow/UIComponentPopupBoxMenuFollow19')
      let driver:Driver=Driver.create();
      let image: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxMenuFollow19'),1000);
      let point = await image.getBoundsCenter()
      await driver.longClick(point.x,point.y)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0140 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0170
     * @tc.name   : Verify that when bindContextMenu sets preview to MenuPreviewMode.IMAGE and placement to TopRight, the menu displays normally and the menu items appear along with the preview image.
     * @tc.desc   : Verify popupbox menu follow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0170', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0170 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxMenuFollow/UIComponentPopupBoxMenuFollow20')
      let driver:Driver=Driver.create();
      let image: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxMenuFollow20'),1000);
      let point = await image.getBoundsCenter()
      await driver.longClick(point.x,point.y)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0130
     * @tc.name   : Verify that when bindContextMenu sets preview to MenuPreviewMode.IMAGE and placement to RightBottom, the menu displays normally and the menu items appear along with the preview image.
     * @tc.desc   : Verify popupbox menu follow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0130', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0130 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxMenuFollow/UIComponentPopupBoxMenuFollow21')
      let driver:Driver=Driver.create();
      let image: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxMenuFollow21'),1000);
      let point = await image.getBoundsCenter()
      await driver.longClick(point.x,point.y)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0130 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0180
     * @tc.name   : Verify that when bindContextMenu sets preview to MenuPreviewMode.IMAGE and placement to Top, the menu displays normally and the menu items appear along with the preview image.
     * @tc.desc   : Verify popupbox menu follow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0180', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0180 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxMenuFollow/UIComponentPopupBoxMenuFollow22')
      let driver:Driver=Driver.create();
      let image: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxMenuFollow22'),1000);
      let point = await image.getBoundsCenter()
      await driver.longClick(point.x,point.y)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0180 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0330
     * @tc.name   : Verify that the menu exits through left and right sliding, and the menu disappears with the preview image.
     * @tc.desc   : Verify popupbox menu follow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0330', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0330 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxMenuFollow/UIComponentPopupBoxMenuFollow23')
      let driver:Driver=Driver.create();
      let image: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxMenuFollow23'),1000);
      let text: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxMenuFollow23_02'),1000);
      let point = await image.getBoundsCenter()
      let point2 = await text.getBoundsCenter()
      await driver.longClick(point.x,point.y)
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await driver.swipe(point2.x-100,point2.y,point2.x,point2.y,600);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0330 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0350
     * @tc.name   : Verify that clicking blank makes the menu exit, and the menu disappears with the preview image.
     * @tc.desc   : Verify popupbox menu follow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0350', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0350 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxMenuFollow/UIComponentPopupBoxMenuFollow24')
      let driver:Driver=Driver.create();
      let image: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxMenuFollow24'),1000);
      let text: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxMenuFollow24_02'),1000);
      let point = await image.getBoundsCenter()
      let point2 = await text.getBoundsCenter()
      await driver.longClick(point.x,point.y)
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await driver.click(point2.x,point2.y)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0350 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0360
     * @tc.name   : Verify that clicking a menu option makes the menu exit, and the menu disappears with the preview image.
     * @tc.desc   : Verify popupbox menu follow interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0360', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0360 start.`);
      Settings.createWindow('testability/pages/component/popup/PopupBoxMenuFollow/UIComponentPopupBoxMenuFollow25')
      let driver:Driver=Driver.create();
      let image: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxMenuFollow25'),1000);
      let point = await image.getBoundsCenter()
      await driver.longClick(point.x,point.y)
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      let text: Component = await driver.waitForComponent(ON.id('UIComponentPopupBoxMenuFollow25_02'),1000);
      await text.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_FOLLOW_0360 finish.`);
      done()
    })



  })
}