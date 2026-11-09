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

import { describe, it, afterEach, Level } from '@ohos/hypium'
import Settings from '../../../model/Settings'
import Logger from '../../../model/Logger'
import Utils from '../../../model/Utils'
import { Driver, ON } from '@kit.TestKit'
import windowSnap from '../../../model/snapShot'

export default function uiComponentPopupboxMenuLocation() {
  describe('uiComponentPopupboxMenuLocation', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        done()
        return
      }
      Settings.windowClass.destroyWindow((err) => {
        if (err.code) {
          Logger.error('TEST', `Failed to destroy the window.Cause :${JSON.stringify(err)}`)
          return;
        }
        Logger.info('TEST', `Succeeded in destroy the window`);
      })
      await Utils.sleep(1000);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_LOCATION_0010
     * @tc.name   : Alert dialog new interface showinsubwindow=true
     * @tc.desc   : Verify popupbox menu location interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_LOCATION_0010', Level.LEVEL3, async (done: Function) => {
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/PopupboxMenuLocation/UiComponentPopupboxMenuLocation0010')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：点击按钮弹出警告弹窗
      let button_alert = await driver.waitForComponent(ON.id('button_alert_0010'), 500)
      await button_alert.click()
      await Utils.sleep(500)

      // 预期效果1：警告弹窗可以弹出至窗口外
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_LOCATION_0010_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_LOCATION_0020
     * @tc.name   : Alert dialog new interface showinsubwindow=false
     * @tc.desc   : Verify popupbox menu location interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_LOCATION_0020', Level.LEVEL3, async (done: Function) => {
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/PopupboxMenuLocation/UiComponentPopupboxMenuLocation0020')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：点击按钮弹出警告弹窗
      let button_alert = await driver.waitForComponent(ON.id('button_alert_0020'), 500)
      await button_alert.click()
      await Utils.sleep(500)

      // 预期效果1：警告弹窗不可以弹出至窗口外
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_LOCATION_0020_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_LOCATION_0030
     * @tc.name   : Alert dialog - offset-dx=500
     * @tc.desc   : Verify popupbox menu location interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_LOCATION_0030', Level.LEVEL3, async (done: Function) => {
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/PopupboxMenuLocation/UiComponentPopupboxMenuLocation0030')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：点击按钮弹出警告弹窗
      let button_alert = await driver.waitForComponent(ON.id('button_alert_0030'), 500)
      await button_alert.click()
      await Utils.sleep(500)

      // 预期效果1：弹窗出窗口外，向右500vp
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_LOCATION_0030_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_LOCATION_0040
     * @tc.name   : Alert dialog - offset-dx=-500
     * @tc.desc   : Verify popupbox menu location interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_LOCATION_0040', Level.LEVEL3, async (done: Function) => {
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/PopupboxMenuLocation/UiComponentPopupboxMenuLocation0040')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：点击按钮弹出警告弹窗
      let button_alert = await driver.waitForComponent(ON.id('button_alert_0040'), 500)
      await button_alert.click()
      await Utils.sleep(500)

      // 预期效果1：弹窗出窗口外，向左500vp
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_LOCATION_0040_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_LOCATION_0050
     * @tc.name   : Alert dialog - offset-dy=500
     * @tc.desc   : Verify popupbox menu location interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_LOCATION_0050', Level.LEVEL3, async (done: Function) => {
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/PopupboxMenuLocation/UiComponentPopupboxMenuLocation0050')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：点击按钮弹出警告弹窗
      let button_alert = await driver.waitForComponent(ON.id('button_alert_0050'), 500)
      await button_alert.click()
      await Utils.sleep(500)

      // 预期效果1：弹窗出窗口外，向下500vp
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_LOCATION_0050_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_LOCATION_0060
     * @tc.name   : Alert dialog - offset-dy=-500
     * @tc.desc   : Verify popupbox menu location interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_LOCATION_0060', Level.LEVEL3, async (done: Function) => {
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/PopupboxMenuLocation/UiComponentPopupboxMenuLocation0060')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：点击按钮弹出警告弹窗
      let button_alert = await driver.waitForComponent(ON.id('button_alert_0060'), 500)
      await button_alert.click()
      await Utils.sleep(500)

      // 预期效果1：弹窗出窗口外，向上500vp
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_LOCATION_0060_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_LOCATION_0070
     * @tc.name   : Alert dialog - alignment-TopStart at top-left corner of screen
     * @tc.desc   : Verify popupbox menu location interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_LOCATION_0070', Level.LEVEL3, async (done: Function) => {
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/PopupboxMenuLocation/UiComponentPopupboxMenuLocation0070')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：点击按钮弹出警告弹窗
      let button_alert = await driver.waitForComponent(ON.id('button_alert_0070'), 500)
      await button_alert.click()
      await Utils.sleep(500)

      // 预期效果1：弹窗出窗口外，位置左上
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_LOCATION_0070_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_LOCATION_0080
     * @tc.name   : Alert dialog - alignment-Top horizontally centered at top of screen
     * @tc.desc   : Verify popupbox menu location interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_LOCATION_0080', Level.LEVEL3, async (done: Function) => {
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/PopupboxMenuLocation/UiComponentPopupboxMenuLocation0080')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：点击按钮弹出警告弹窗
      let button_alert = await driver.waitForComponent(ON.id('button_alert_0080'), 500)
      await button_alert.click()
      await Utils.sleep(500)

      // 预期效果1：弹窗出窗口外，位置顶部居中
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_LOCATION_0080_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_LOCATION_0090
     * @tc.name   : Alert dialog - alignment-TopEnd at top-right corner of screen
     * @tc.desc   : Verify popupbox menu location interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_LOCATION_0090', Level.LEVEL3, async (done: Function) => {
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/PopupboxMenuLocation/UiComponentPopupboxMenuLocation0090')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：点击按钮弹出警告弹窗
      let button_alert = await driver.waitForComponent(ON.id('button_alert_0090'), 500)
      await button_alert.click()
      await Utils.sleep(500)

      // 预期效果1：弹窗出窗口外，位置右上
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_LOCATION_0090_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_LOCATION_0100
     * @tc.name   : Alert dialog - alignment-Start vertically centered at left side of screen
     * @tc.desc   : Verify popupbox menu location interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_LOCATION_0100', Level.LEVEL3, async (done: Function) => {
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/PopupboxMenuLocation/UiComponentPopupboxMenuLocation0100')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：点击按钮弹出警告弹窗
      let button_alert = await driver.waitForComponent(ON.id('button_alert_0100'), 500)
      await button_alert.click()
      await Utils.sleep(500)

      // 预期效果1：弹窗出窗口外，位置屏幕起始端纵向居中
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_LOCATION_0100_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_LOCATION_0110
     * @tc.name   : Alert dialog - alignment-Center horizontally and vertically centered on screen
     * @tc.desc   : Verify popupbox menu location interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_LOCATION_0110', Level.LEVEL3, async (done: Function) => {
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/PopupboxMenuLocation/UiComponentPopupboxMenuLocation0110')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：点击按钮弹出警告弹窗
      let button_alert = await driver.waitForComponent(ON.id('button_alert_0110'), 500)
      await button_alert.click()
      await Utils.sleep(500)

      // 预期效果1：弹窗出窗口外，位置屏幕横向和纵向居中
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_LOCATION_0110_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_LOCATION_0120
     * @tc.name   : Alert dialog - alignment-End vertically centered at right side of screen
     * @tc.desc   : Verify popupbox menu location interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_LOCATION_0120', Level.LEVEL3, async (done: Function) => {
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/PopupboxMenuLocation/UiComponentPopupboxMenuLocation0120')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：点击按钮弹出警告弹窗
      let button_alert = await driver.waitForComponent(ON.id('button_alert_0120'), 500)
      await button_alert.click()
      await Utils.sleep(500)

      // 预期效果1：弹窗出窗口外，位置屏幕尾端纵向居中
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_LOCATION_0120_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_LOCATION_0130
     * @tc.name   : Alert dialog - alignment-BottomStart at bottom-left corner of screen
     * @tc.desc   : Verify popupbox menu location interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_LOCATION_0130', Level.LEVEL3, async (done: Function) => {
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/PopupboxMenuLocation/UiComponentPopupboxMenuLocation0130')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：点击按钮弹出警告弹窗
      let button_alert = await driver.waitForComponent(ON.id('button_alert_0130'), 500)
      await button_alert.click()
      await Utils.sleep(500)

      // 预期效果1：弹窗出窗口外，位置屏幕底部起始端
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_LOCATION_0130_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_LOCATION_0140
     * @tc.name   : Alert dialog - alignment-Bottom horizontally centered at bottom of screen
     * @tc.desc   : Verify popupbox menu location interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_LOCATION_0140', Level.LEVEL3, async (done: Function) => {
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/PopupboxMenuLocation/UiComponentPopupboxMenuLocation0140')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：点击按钮弹出警告弹窗
      let button_alert = await driver.waitForComponent(ON.id('button_alert_0140'), 500)
      await button_alert.click()
      await Utils.sleep(500)

      // 预期效果1：弹窗出窗口外，位置底部横向居中
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_LOCATION_0140_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_LOCATION_0150
     * @tc.name   : Alert dialog - alignment-BottomEnd at bottom-right corner of screen
     * @tc.desc   : Verify popupbox menu location interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_LOCATION_0150', Level.LEVEL3, async (done: Function) => {
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/PopupboxMenuLocation/UiComponentPopupboxMenuLocation0150')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：点击按钮弹出警告弹窗
      let button_alert = await driver.waitForComponent(ON.id('button_alert_0150'), 500)
      await button_alert.click()
      await Utils.sleep(500)

      // 预期效果1：弹窗出窗口外，位置屏幕底部尾端
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_LOCATION_0150_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_LOCATION_0170
     * @tc.name   : isModal=false - bind 1 popup
     * @tc.desc   : Verify popupbox menu location interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_LOCATION_0170', Level.LEVEL3, async (done: Function) => {
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/PopupboxMenuLocation/UiComponentPopupboxMenuLocation0170')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：连续点击按钮弹出警告弹窗
      let button_alert = await driver.waitForComponent(ON.id('button_alert_0170'), 500)
      await button_alert.click()
      await Utils.sleep(500)

      // 预期效果1：弹窗可以连续弹出
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_LOCATION_0170_01')
      await Utils.sleep(500)

      // 步骤3：再次点击按钮
      await button_alert.click()
      await Utils.sleep(500)

      // 预期效果2：第二个弹窗也能弹出
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_LOCATION_0170_02')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_LOCATION_0180
     * @tc.name   : isModal=false - bind 2 popups
     * @tc.desc   : Verify popupbox menu location interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_LOCATION_0180', Level.LEVEL3, async (done: Function) => {
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/PopupboxMenuLocation/UiComponentPopupboxMenuLocation0180')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：点击按钮弹出2个警告弹窗
      let button_alert = await driver.waitForComponent(ON.id('button_alert_0180'), 500)
      await button_alert.click()
      await Utils.sleep(500)

      // 预期效果1：点击一次弹出2个弹窗
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_LOCATION_0180_01')
      await Utils.sleep(500)

      // 步骤3：再次点击按钮
      await button_alert.click()
      await Utils.sleep(500)

      // 预期效果2：点击两次弹出4个弹窗
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_LOCATION_0180_02')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_LOCATION_0200
     * @tc.name   : Continuous popup in mobile - background operation
     * @tc.desc   : Verify popupbox menu location interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_LOCATION_0200', Level.LEVEL3, async (done: Function) => {
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/popup/PopupboxMenuLocation/UiComponentPopupboxMenuLocation0200')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：连续点击按钮弹出警告弹窗
      let button_alert = await driver.waitForComponent(ON.id('button_alert_0200'), 500)
      await button_alert.click()
      await Utils.sleep(500)

      // 预期效果1：弹窗可以连续弹出
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_LOCATION_0200_01')
      await Utils.sleep(500)

      // 步骤3：再次点击按钮
      await button_alert.click()
      await Utils.sleep(500)

      // 预期效果2：新弹窗位置覆盖旧弹窗
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_MENU_LOCATION_0200_02')
      await Utils.sleep(1000)

      done();
    })

  })
}