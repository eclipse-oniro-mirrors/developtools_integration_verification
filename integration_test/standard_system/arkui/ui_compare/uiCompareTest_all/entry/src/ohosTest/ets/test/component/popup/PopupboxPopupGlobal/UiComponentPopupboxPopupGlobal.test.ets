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

export default function uiComponentPopupboxPopupGlobal() {
  describe('uiComponentPopupboxPopupGlobal', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0060
     * @tc.name   : Verify openPopup interface with target parameter (id and componentId both number type)
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0060', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupGlobal/UiComponentPopupboxPopupGlobal0060')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：点击 "Open Popup" 按钮
      let button_open = await driver.waitForComponent(ON.id('button_popup_0060_open'), 500)
      await button_open.click()
      await Utils.sleep(500)

      // 预期效果1：Popup 弹出
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0060_01')
      await Utils.sleep(1000)


      // 步骤3：点击 "Close Popup" 按钮
      let button_close = await driver.waitForComponent(ON.id('button_popup_0060_close'), 500)
      await button_close.click()
      await Utils.sleep(500)

      // 预期效果3：popup 关闭
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0060_02')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0070
     * @tc.name   : Verify openPopup interface with target parameter (id is number type, componentId not used)
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0070', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupGlobal/UiComponentPopupboxPopupGlobal0070')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：点击 "Open Popup1" 按钮
      let button_open = await driver.waitForComponent(ON.id('button_popup_0070_open'), 500)
      await button_open.click()
      await Utils.sleep(500)

      // 预期效果1：Popup 弹出
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0070_01')
      await Utils.sleep(1000)

      // 步骤2：点击 "UpdatePopup" 按钮
      let button_update = await driver.waitForComponent(ON.id('button_popup_0070_update'), 500)
      await button_update.click()
      await Utils.sleep(500)

      // 预期效果2：popup 的地板变为浅红色（被模糊材质所影响）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0070_02')
      await Utils.sleep(1000)

      // 步骤3：点击 "Close Popup" 按钮
      let button_close = await driver.waitForComponent(ON.id('button_popup_0070_close'), 500)
      await button_close.click()
      await Utils.sleep(500)

      // 预期效果3：popup 关闭
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0070_03')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0080
     * @tc.name   : Verify openPopup interface with target parameter (id is string type, componentId is number type)
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0080', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupGlobal/UiComponentPopupboxPopupGlobal0080')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：点击 "Open Popup2" 按钮
      let button_open = await driver.waitForComponent(ON.id('button_popup_0080_open'), 500)
      await button_open.click()
      await Utils.sleep(500)

      // 预期效果1：Popup 弹出
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0080_01')
      await Utils.sleep(1000)

      // 步骤2：点击 "UpdatePopup" 按钮
      let button_update = await driver.waitForComponent(ON.id('button_popup_0080_update'), 500)
      await button_update.click()
      await Utils.sleep(500)

      // 预期效果2：popup 的地板变为浅红色（被模糊材质所影响）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0080_02')
      await Utils.sleep(1000)

      // 步骤3：点击 "Close Popup" 按钮
      let button_close = await driver.waitForComponent(ON.id('button_popup_0080_close'), 500)
      await button_close.click()
      await Utils.sleep(500)

      // 预期效果3：popup 关闭
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0080_03')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0090
     * @tc.name   : Verify openPopup interface with target parameter (id is string type, componentId not used)
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0090', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupGlobal/UiComponentPopupboxPopupGlobal0090')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：点击 "Open Popup2 no componentId" 按钮
      let button_open = await driver.waitForComponent(ON.id('button_popup_0090_open'), 500)
      await button_open.click()
      await Utils.sleep(500)

      // 预期效果1：Popup 弹出
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0090_01')
      await Utils.sleep(1000)

      // 步骤2：点击 "UpdatePopup" 按钮
      let button_update = await driver.waitForComponent(ON.id('button_popup_0090_update'), 500)
      await button_update.click()
      await Utils.sleep(500)

      // 预期效果2：popup 的地板变为浅红色（被模糊材质所影响）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0090_02')
      await Utils.sleep(1000)

      // 步骤3：点击 "Close Popup" 按钮
      let button_close = await driver.waitForComponent(ON.id('button_popup_0090_close'), 500)
      await button_close.click()
      await Utils.sleep(500)

      // 预期效果3：popup 关闭
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0090_03')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0100
     * @tc.name   : Verify openPopup interface options with radius parameter set to undefined
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0100', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupGlobal/UiComponentPopupboxPopupGlobal0100')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：点击 "跳转" 按钮
      let button_jump = await driver.waitForComponent(ON.id('button_jump_0100'), 500)
      await button_jump.click()
      await Utils.sleep(500)

      // 步骤2：将 targetSpace 状态选择为 "radius：undefined" 状态（已在步骤1中完成）
      // 点击 "open 打开" 按钮
      let button_open = await driver.waitForComponent(ON.id('button_popup_0100_open'), 500)
      await button_open.click()
      await Utils.sleep(500)

      // 预期效果：设置圆角半径为 20vp（箭头消失）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0100_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0190
     * @tc.name   : Verify openPopup interface options with shadow parameter set to ShadowOptions property
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0190', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupGlobal/UiComponentPopupboxPopupGlobal0190')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：点击 "Test" 按钮
      let button_test = await driver.waitForComponent(ON.id('button_test_0190'), 500)
      await button_test.click()
      await Utils.sleep(500)

      // 步骤2：点击 "跳转" 按钮三次，选择 "shadow：[object Object]" 状态
      let button_jump = await driver.waitForComponent(ON.id('button_jump_0190'), 500)
      await button_jump.click()
      await Utils.sleep(300)
      await button_jump.click()
      await Utils.sleep(300)
      await button_jump.click()
      await Utils.sleep(500)

      // 步骤3：点击 "open 打开" 按钮
      let button_open = await driver.waitForComponent(ON.id('button_open_0190'), 500)
      await button_open.click()
      await Utils.sleep(500)

      // 预期效果：气泡弹出，阴影参数符合预期
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0190_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0200
     * @tc.name   : Verify openPopup interface with target parameter (id is string type but not unique, using componentId)
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0200', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupGlobal/UiComponentPopupboxPopupGlobal0200')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：点击 "Popup9" 按钮
      let button_popup9 = await driver.waitForComponent(ON.id('button_popup9_0200'), 500)
      await button_popup9.click()
      await Utils.sleep(500)

      // 步骤2：点击 "Open Popup3, componentId 唯一" 按钮
      let button_open = await driver.waitForComponent(ON.id('button_open_popup3_0200'), 500)
      await button_open.click()
      await Utils.sleep(500)

      // 预期效果1：Popup 弹出
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0200_01')
      await Utils.sleep(1000)

      // 步骤3：点击 "UpdatePopup" 按钮
      let button_update = await driver.waitForComponent(ON.id('button_update_popup_0200'), 500)
      await button_update.click()
      await Utils.sleep(500)

      // 预期效果2：popup 的地板变为浅红色（被模糊材质所影响）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0200_02')
      await Utils.sleep(1000)

      // 步骤4：点击 "Close Popup" 按钮
      let button_close = await driver.waitForComponent(ON.id('button_close_popup_0200'), 500)
      await button_close.click()
      await Utils.sleep(500)

      // 预期效果3：popup 关闭
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0200_03')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0210
     * @tc.name   : Verify openPopup interface options with shadow parameter set to null
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0210', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupGlobal/UiComponentPopupboxPopupGlobal0210')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：点击 "Test" 按钮
      let button_test = await driver.waitForComponent(ON.id('button_test_0210'), 500)
      await button_test.click()
      await Utils.sleep(500)

      // 步骤2：点击 "跳转" 按钮，选择 "shadow：null" 状态
      let button_jump = await driver.waitForComponent(ON.id('button_jump_0210'), 500)
      await button_jump.click()
      await Utils.sleep(500)

      // 步骤3：点击 "open 打开" 按钮
      let button_open = await driver.waitForComponent(ON.id('button_open_0210'), 500)
      await button_open.click()
      await Utils.sleep(500)

      // 预期效果：气泡的阴影是中阴影
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0210_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0220
     * @tc.name   : Verify openPopup interface options with shadow parameter set to undefined
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0220', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupGlobal/UiComponentPopupboxPopupGlobal0220')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：点击 "Test" 按钮
      let button_test = await driver.waitForComponent(ON.id('button_test_0220'), 500)
      await button_test.click()
      await Utils.sleep(500)

      // 步骤2：点击 "跳转" 按钮，选择 "shadow：undefined" 状态
      let button_jump = await driver.waitForComponent(ON.id('button_jump_0220'), 500)
      await button_jump.click()
      await Utils.sleep(500)

      // 步骤3：点击 "open 打开" 按钮
      let button_open = await driver.waitForComponent(ON.id('button_open_0220'), 500)
      await button_open.click()
      await Utils.sleep(500)

      // 预期效果：气泡的阴影是中阴影
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0220_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0280
     * @tc.name   : Verify openPopup interface options with backgroundBlurStyle parameter set to BACKGROUND_THICK
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0280', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupGlobal/UiComponentPopupboxPopupGlobal0280')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：点击 "Test" 按钮
      let button_test = await driver.waitForComponent(ON.id('button_test_0280'), 500)
      await button_test.click()
      await Utils.sleep(500)

      // 步骤2：点击 "跳转" 按钮
      let button_jump = await driver.waitForComponent(ON.id('button_jump_0280'), 500)
      await button_jump.click()
      await Utils.sleep(500)

      // 步骤3：点击 "open 打开" 按钮
      let button_open = await driver.waitForComponent(ON.id('button_open_0280'), 500)
      await button_open.click()
      await Utils.sleep(500)

      // 预期效果：气泡的模糊背景是远距景深模糊
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0280_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0290
     * @tc.name   : Verify openPopup interface options with backgroundBlurStyle parameter set to BACKGROUND_ULTRA_THICK
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0290', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupGlobal/UiComponentPopupboxPopupGlobal0290')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：点击 "Test" 按钮
      let button_test = await driver.waitForComponent(ON.id('button_test_0290'), 500)
      await button_test.click()
      await Utils.sleep(500)

      // 步骤2：点击 "跳转" 按钮
      let button_jump = await driver.waitForComponent(ON.id('button_jump_0290'), 500)
      await button_jump.click()
      await Utils.sleep(500)

      // 步骤3：点击 "open 打开" 按钮
      let button_open = await driver.waitForComponent(ON.id('button_open_0290'), 500)
      await button_open.click()
      await Utils.sleep(500)

      // 预期效果：气泡的模糊背景是超远距景深模糊
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0290_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0310
     * @tc.name   : Verify openPopup interface with target parameter (id is string type but not unique, componentId string also not unique)
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0310', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupGlobal/UiComponentPopupboxPopupGlobal0310')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：点击 "Popup9" 按钮
      let button_popup9 = await driver.waitForComponent(ON.id('button_popup9_0310'), 500)
      await button_popup9.click()
      await Utils.sleep(500)

      // 步骤2：点击 "我和 Popup3 string 不一样，componentId 不唯一" 按钮
      let button_open = await driver.waitForComponent(ON.id('button_open_different_0310'), 500)
      await button_open.click()
      await Utils.sleep(500)

      // 预期效果1：Popup 弹出
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0310_01')
      await Utils.sleep(1000)

      // 步骤3：点击 "UpdatePopup" 按钮
      let button_update = await driver.waitForComponent(ON.id('button_update_popup_0310'), 500)
      await button_update.click()
      await Utils.sleep(500)

      // 预期效果2：popup 的地板变为浅红色（被模糊材质所影响）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0310_02')
      await Utils.sleep(1000)

      // 步骤4：点击 "Close Popup" 按钮
      let button_close = await driver.waitForComponent(ON.id('button_close_popup_0310'), 500)
      await button_close.click()
      await Utils.sleep(500)

      // 预期效果3：popup 关闭
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0310_03')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0320
     * @tc.name   : Verify openPopup interface options with backgroundBlurStyle parameter set to COMPONENT_ULTRA_THIN
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0320', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupGlobal/UiComponentPopupboxPopupGlobal0320')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：点击 "Test" 按钮
      let button_test = await driver.waitForComponent(ON.id('button_test_0320'), 500)
      await button_test.click()
      await Utils.sleep(500)

      // 步骤2：点击 "跳转" 按钮
      let button_jump = await driver.waitForComponent(ON.id('button_jump_0320'), 500)
      await button_jump.click()
      await Utils.sleep(500)

      // 步骤3：点击 "open 打开" 按钮
      let button_open = await driver.waitForComponent(ON.id('button_open_0320'), 500)
      await button_open.click()
      await Utils.sleep(500)

      // 预期效果：气泡的模糊背景是组件超轻薄材质模糊
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0320_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0390
     * @tc.name   : Verify openPopup interface options with focusable parameter set to true
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0390', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupGlobal/UiComponentPopupboxPopupGlobal0390')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：点击 "Test" 按钮
      let button_test = await driver.waitForComponent(ON.id('button_test_0390'), 500)
      await button_test.click()
      await Utils.sleep(500)

      // 步骤2：点击 "跳转" 按钮，选择 "focusable：true" 状态
      let button_jump = await driver.waitForComponent(ON.id('button_jump_0390'), 500)
      await button_jump.click()
      await Utils.sleep(500)

      // 步骤3：点击 "open2" 按钮
      let button_open2 = await driver.waitForComponent(ON.id('button_open2_0390'), 500)
      await button_open2.click()
      await Utils.sleep(500)

      // 预期效果1：气泡弹出
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0390_01')
      await Utils.sleep(1000)

      // 步骤4：外接键盘按 tab 键（此步骤需要手动测试或使用输入事件模拟）
      // 预期效果2：popup 的输入框获焦
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0390_02')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0400
     * @tc.name   : Verify openPopup interface options with focusable parameter set to false
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0400', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupGlobal/UiComponentPopupboxPopupGlobal0400')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：点击 "Test" 按钮
      let button_test = await driver.waitForComponent(ON.id('button_test_0400'), 500)
      await button_test.click()
      await Utils.sleep(500)

      // 步骤2：点击 "跳转" 按钮，选择 "focusable：false" 状态
      let button_jump = await driver.waitForComponent(ON.id('button_jump_0400'), 500)
      await button_jump.click()
      await Utils.sleep(500)

      // 步骤3：点击 "open2" 按钮
      let button_open2 = await driver.waitForComponent(ON.id('button_open2_0400'), 500)
      await button_open2.click()
      await Utils.sleep(500)

      // 预期效果1：气泡弹出
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0400_01')
      await Utils.sleep(1000)

      // 步骤4：外接键盘按 tab 键（此步骤需要手动测试或使用输入事件模拟）
      // 预期效果2：popup 的输入框不可获焦
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0400_02')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0410
     * @tc.name   : Verify openPopup interface options with focusable parameter set to null
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0410', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupGlobal/UiComponentPopupboxPopupGlobal0410')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：点击 "Test" 按钮
      let button_test = await driver.waitForComponent(ON.id('button_test_0410'), 500)
      await button_test.click()
      await Utils.sleep(500)

      // 步骤2：点击 "跳转" 按钮
      let button_jump = await driver.waitForComponent(ON.id('button_jump_0410'), 500)
      await button_jump.click()
      await Utils.sleep(500)

      // 步骤3：点击 "open2" 按钮
      let button_open2 = await driver.waitForComponent(ON.id('button_open2_0410'), 500)
      await button_open2.click()
      await Utils.sleep(500)

      // 预期效果1：气泡弹出，popup 的输入框不可获焦
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0410_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0420
     * @tc.name   : Verify openPopup interface with target parameter (id is string type but not unique, componentId not used)
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0420', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupGlobal/UiComponentPopupboxPopupGlobal0420')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：点击 "Popup9" 按钮
      let button_popup9 = await driver.waitForComponent(ON.id('button_popup9_0420'), 500)
      await button_popup9.click()
      await Utils.sleep(500)

      // 步骤2：点击 "我和 Popup3 string 一样 但没有 componentId" 按钮
      let button_open = await driver.waitForComponent(ON.id('button_open_0420'), 500)
      await button_open.click()
      await Utils.sleep(500)

      // 预期效果1：Popup 弹出
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0420_01')
      await Utils.sleep(1000)

      // 步骤3：点击 "UpdatePopup" 按钮
      let button_update = await driver.waitForComponent(ON.id('button_update_popup_0420'), 500)
      await button_update.click()
      await Utils.sleep(500)

      // 预期效果2：popup 的地板变为浅红色（被模糊材质所影响）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0420_02')
      await Utils.sleep(1000)

      // 步骤4：点击 "Close Popup" 按钮
      let button_close = await driver.waitForComponent(ON.id('button_close_popup_0420'), 500)
      await button_close.click()
      await Utils.sleep(500)

      // 预期效果3：popup 关闭
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0420_03')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0430
     * @tc.name   : Verify openPopup interface options with focusable parameter set to undefined
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0430', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupGlobal/UiComponentPopupboxPopupGlobal0430')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：点击 "Test" 按钮
      let button_test = await driver.waitForComponent(ON.id('button_test_0430'), 500)
      await button_test.click()
      await Utils.sleep(500)

      // 步骤2：点击 "跳转" 按钮
      let button_jump = await driver.waitForComponent(ON.id('button_jump_0430'), 500)
      await button_jump.click()
      await Utils.sleep(500)

      // 步骤3：点击 "open2" 按钮
      let button_open2 = await driver.waitForComponent(ON.id('button_open2_0430'), 500)
      await button_open2.click()
      await Utils.sleep(500)

      // 预期效果1：气泡弹出，popup 的输入框不可获焦
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0430_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0440
     * @tc.name   : Verify openPopup interface options with transition parameter opacity set to 0.5
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0440', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupGlobal/UiComponentPopupboxPopupGlobal0440')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：点击 "Test" 按钮
      let button_test = await driver.waitForComponent(ON.id('button_test_0440'), 500)
      await button_test.click()
      await Utils.sleep(500)

      // 步骤2：点击 "跳转" 按钮
      let button_jump = await driver.waitForComponent(ON.id('button_jump_0440'), 500)
      await button_jump.click()
      await Utils.sleep(500)

      // 步骤3：点击 "transition_opacity" 按钮
      let button_transition_opacity = await driver.waitForComponent(ON.id('button_transition_opacity_0440'), 500)
      await button_transition_opacity.click()
      await Utils.sleep(3500)

      // 预期效果：气泡弹出，透明度效果为 0.5，动画持续时间为 3 秒，动画播放速度为 1，动画曲线为 Linear
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0440_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0450
     * @tc.name   : Verify openPopup interface options with transition parameter translate all set to 50
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0450', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupGlobal/UiComponentPopupboxPopupGlobal0450')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：点击 "Test" 按钮
      let button_test = await driver.waitForComponent(ON.id('button_test_0450'), 500)
      await button_test.click()
      await Utils.sleep(500)

      // 步骤2：点击 "跳转" 按钮
      let button_jump = await driver.waitForComponent(ON.id('button_jump_0450'), 500)
      await button_jump.click()
      await Utils.sleep(500)

      // 步骤3：点击 "transition_translate1" 按钮
      let button_transition_translate1 = await driver.waitForComponent(ON.id('button_transition_translate1_0450'), 500)
      await button_transition_translate1.click()
      await Utils.sleep(3500)

      // 预期效果：气泡弹出，组件转场时横向平移为 50，纵向平移为 50，竖向平移不生效
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0450_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0460
     * @tc.name   : Verify openPopup interface options with transition parameter translate all set to "50"
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0460', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupGlobal/UiComponentPopupboxPopupGlobal0460')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：点击 "Test" 按钮
      let button_test = await driver.waitForComponent(ON.id('button_test_0460'), 500)
      await button_test.click()
      await Utils.sleep(500)

      // 步骤2：点击 "跳转" 按钮
      let button_jump = await driver.waitForComponent(ON.id('button_jump_0460'), 500)
      await button_jump.click()
      await Utils.sleep(500)

      // 步骤3：点击 "transition_translate2" 按钮
      let button_transition_translate2 = await driver.waitForComponent(ON.id('button_transition_translate2_0460'), 500)
      await button_transition_translate2.click()
      await Utils.sleep(3500)

      // 预期效果：气泡弹出，组件转场时横向平移为 50，纵向平移为 50，竖向平移不生效
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0460_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0470
     * @tc.name   : Verify openPopup interface options with transition parameter scale set to 1,1.5,2,50,50
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0470', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupGlobal/UiComponentPopupboxPopupGlobal0470')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：点击 "Test" 按钮
      let button_test = await driver.waitForComponent(ON.id('button_test_0470'), 500)
      await button_test.click()
      await Utils.sleep(500)

      // 步骤2：点击 "跳转" 按钮
      let button_jump = await driver.waitForComponent(ON.id('button_jump_0470'), 500)
      await button_jump.click()
      await Utils.sleep(500)

      // 步骤3：点击 "transition_scale" 按钮
      let button_transition_scale = await driver.waitForComponent(ON.id('button_transition_scale_0470'), 500)
      await button_transition_scale.click()
      await Utils.sleep(3500)

      // 预期效果：气泡弹出，x 轴的缩放倍数为 1，y 轴的缩放倍数为 1.5，z 轴的缩放倍数不生效，组件变换中心点 x 轴坐标为 50vp，组件变换中心点 y 轴坐标为 50vp
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0470_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0480
     * @tc.name   : Verify openPopup interface options with transition parameter rotate set to 50,50.50,90deg,50,50,0,0
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0480', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupGlobal/UiComponentPopupboxPopupGlobal0480')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：点击 "Test" 按钮
      let button_test = await driver.waitForComponent(ON.id('button_test_0480'), 500)
      await button_test.click()
      await Utils.sleep(500)

      // 步骤2：点击 "跳转" 按钮
      let button_jump = await driver.waitForComponent(ON.id('button_jump_0480'), 500)
      await button_jump.click()
      await Utils.sleep(500)

      // 步骤3：点击 "transition_rotate" 按钮
      let button_transition_rotate = await driver.waitForComponent(ON.id('button_transition_rotate_0480'), 500)
      await button_transition_rotate.click()
      await Utils.sleep(3500)

      // 预期效果：气泡弹出，旋转轴向量 x 坐标：50，旋转轴向量 y 坐标：50，旋转轴向量 z 坐标：50，旋转角度为 90deg，组件变换中心点 x 轴坐标为 50vp，组件变换中心点 y 轴坐标为 50vp，组件变换中心点 y 轴坐标为 0vp，视距为 0
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0480_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0490
     * @tc.name   : Verify openPopup interface options with transition parameter move set to TOP and START, asymmetric, combine
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0490', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupGlobal/UiComponentPopupboxPopupGlobal0490')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：点击 "Test" 按钮
      let button_test = await driver.waitForComponent(ON.id('button_test_0490'), 500)
      await button_test.click()
      await Utils.sleep(500)

      // 步骤2：点击 "跳转" 按钮
      let button_jump = await driver.waitForComponent(ON.id('button_jump_0490'), 500)
      await button_jump.click()
      await Utils.sleep(500)

      // 步骤3：点击 "transition_move1" 按钮
      let button_transition_move1 = await driver.waitForComponent(ON.id('button_transition_move1_0490'), 500)
      await button_transition_move1.click()
      await Utils.sleep(3500)

      // 预期效果1：气泡弹出，从窗口的上边缘弹出，出现时透明度从 0 到 1，动画持续 3 秒
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0490_01')
      await Utils.sleep(1000)

      // 步骤4：点击关闭按钮关闭弹窗
      let button_close = await driver.waitForComponent(ON.id('button_close_popup_0490'), 500)
      await button_close.click()
      await Utils.sleep(3500)

      // 预期效果2：气泡消失，从窗口的左边缘消失，动画持续 3 秒
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0490_02')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0500
     * @tc.name   : Verify openPopup interface options with transition parameter move set to BOTTOM and END, asymmetric, combine
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0500', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupGlobal/UiComponentPopupboxPopupGlobal0500')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：点击 "Test" 按钮
      let button_test = await driver.waitForComponent(ON.id('button_test_0500'), 500)
      await button_test.click()
      await Utils.sleep(500)

      // 步骤2：点击 "跳转" 按钮
      let button_jump = await driver.waitForComponent(ON.id('button_jump_0500'), 500)
      await button_jump.click()
      await Utils.sleep(500)

      // 步骤3：点击 "transition_move2" 按钮
      let button_transition_move2 = await driver.waitForComponent(ON.id('button_transition_move2_0500'), 500)
      await button_transition_move2.click()
      await Utils.sleep(3500)

      // 预期效果1：气泡弹出，从窗口的右边缘弹出，出现时透明度从 0 到 1，动画持续 3 秒
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0500_01')
      await Utils.sleep(1000)

      // 步骤4：点击关闭按钮关闭弹窗
      let button_close = await driver.waitForComponent(ON.id('button_close_popup_0500'), 500)
      await button_close.click()
      await Utils.sleep(3500)

      // 预期效果2：气泡消失，从窗口的下边缘消失，动画持续 3 秒
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0500_02')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0510
     * @tc.name   : Verify openPopup interface with onWillDismiss set to true
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0510', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupGlobal/UiComponentPopupboxPopupGlobal0510')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：将 onWillDismiss 状态选择为 "onWillDismiss：true" 状态
      let button_set_onwilldismiss = await driver.waitForComponent(ON.id('button_set_onwilldismiss_true_0510'), 500)
      await button_set_onwilldismiss.click()
      await Utils.sleep(500)

      // 步骤2：点击 "open2" 按钮
      let button_open2 = await driver.waitForComponent(ON.id('button_open2_0510'), 500)
      await button_open2.click()
      await Utils.sleep(500)

      // 预期效果1：popup 弹出
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0510_01')
      await Utils.sleep(1000)

      // 步骤3：点击空白处、左右滑动屏幕
      await driver.click(300, 300)
      await Utils.sleep(500)

      // 左滑
      await driver.swipe(300, 300, 100, 300)
      await Utils.sleep(500)

      // 右滑
      await driver.swipe(100, 300, 300, 300)
      await Utils.sleep(500)

      // 预期效果2：popup 退出
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0510_02')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0520
     * @tc.name   : Verify openPopup interface with onWillDismiss set to false
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0520', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupGlobal/UiComponentPopupboxPopupGlobal0520')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：将 onWillDismiss 状态选择为 "onWillDismiss：false" 状态
      let button_set_onwilldismiss = await driver.waitForComponent(ON.id('button_set_onwilldismiss_false_0520'), 500)
      await button_set_onwilldismiss.click()
      await Utils.sleep(500)

      // 步骤2：点击 "open2" 按钮
      let button_open2 = await driver.waitForComponent(ON.id('button_open2_0520'), 500)
      await button_open2.click()
      await Utils.sleep(500)

      // 预期效果1：popup 弹出
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0520_01')
      await Utils.sleep(1000)

      // 步骤3：点击空白处、左右滑动屏幕、键盘 esc 键
      await driver.click(100, 100)
      await Utils.sleep(500)

      // 左滑
      await driver.swipe(300, 300, 100, 300)
      await Utils.sleep(500)

      // 右滑
      await driver.swipe(100, 300, 300, 300)
      await Utils.sleep(500)

      // 按 ESC 键（键盘事件）
      await driver.triggerKey(27) // 27 是 ESC 键的 keyCode
      await Utils.sleep(500)

      // 预期效果2：popup 不会退出
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0520_02')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0540
     * @tc.name   : Verify openPopup interface with onWillDismiss set to null
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0540', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupGlobal/UiComponentPopupboxPopupGlobal0540')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：将 onWillDismiss 状态选择为 "onWillDismiss：null" 状态
      let button_set_onwilldismiss = await driver.waitForComponent(ON.id('button_set_onwilldismiss_null_0540'), 500)
      await button_set_onwilldismiss.click()
      await Utils.sleep(500)

      // 步骤2：点击 "open2" 按钮
      let button_open2 = await driver.waitForComponent(ON.id('button_open2_0540'), 500)
      await button_open2.click()
      await Utils.sleep(500)

      // 预期效果1：popup 弹出
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0540_01')
      await Utils.sleep(1000)

      // 步骤3：点击空白处、左右滑动屏幕
      await driver.click(100, 100)
      await Utils.sleep(500)

      // 左滑
      await driver.swipe(300, 300, 100, 300)
      await Utils.sleep(500)

      // 右滑
      await driver.swipe(100, 300, 300, 300)
      await Utils.sleep(500)

      // 预期效果2：popup 退出
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0540_02')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0550
     * @tc.name   : Verify openPopup interface with onWillDismiss set to undefined
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0550', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupGlobal/UiComponentPopupboxPopupGlobal0550')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：将 onWillDismiss 状态选择为 "onWillDismiss：undefined" 状态
      let button_set_onwilldismiss = await driver.waitForComponent(ON.id('button_set_onwilldismiss_undefined_0550'), 500)
      await button_set_onwilldismiss.click()
      await Utils.sleep(500)

      // 步骤2：点击 "open2" 按钮
      let button_open2 = await driver.waitForComponent(ON.id('button_open2_0550'), 500)
      await button_open2.click()
      await Utils.sleep(500)

      // 预期效果1：popup 弹出
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0550_01')
      await Utils.sleep(1000)

      // 步骤3：点击空白处、左右滑动屏幕
      await driver.click(100, 100)
      await Utils.sleep(500)

      // 左滑
      await driver.swipe(300, 300, 100, 300)
      await Utils.sleep(500)

      // 右滑
      await driver.swipe(100, 300, 300, 300)
      await Utils.sleep(500)

      // 预期效果2：popup 退出
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0550_02')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0590
     * @tc.name   : Verify openPopup interface with followTransformOfTarget set to undefined
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0590', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupGlobal/UiComponentPopupboxPopupGlobal0590')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：将 followTransformOfTarget 状态选择为 "followTransformOfTarget：undefined" 状态
      let button_set_followtransform = await driver.waitForComponent(ON.id('button_set_followtransform_undefined_0590'), 500)
      await button_set_followtransform.click()
      await Utils.sleep(500)

      // 步骤2：点击 "followTransformOfTarget_rotate" 按钮
      let button_followtransform_rotate = await driver.waitForComponent(ON.id('button_followtransform_rotate_0590'), 500)
      await button_followtransform_rotate.click()
      await Utils.sleep(1000)

      // 预期效果1：button 组件旋转 90 度，popup 弹出但位置没有跟随宿主组件变化（在 button 组件右侧）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0590_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0720
     * @tc.name   : Verify updatePopup interface options with showInSubWindow parameter set to false, then modified to true (partialUpdate is false)
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0720', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupGlobal/UiComponentPopupboxPopupGlobal0720')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：点击 "Test" 按钮
      let button_test = await driver.waitForComponent(ON.id('button_test_0720'), 500)
      await button_test.click()
      await Utils.sleep(500)

      // 步骤2：点击气泡内的 "跳转" 按钮
      let button_jump = await driver.waitForComponent(ON.id('button_jump_0720'), 500)
      await button_jump.click()
      await Utils.sleep(500)

      // 预期效果1：气泡弹出（不在子窗口显示气泡）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0720_01')
      await Utils.sleep(1000)

      // 步骤3：点击气泡内的 "update 更新" 按钮
      let button_update = await driver.waitForComponent(ON.id('button_update_0720'), 500)
      await button_update.click()
      await Utils.sleep(3000)

      // 预期效果2：等待 3s 后，showInSubWindow 还是 false（气泡仍不在子窗口显示）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0720_02')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0760
     * @tc.name   : Verify updatePopup interface options with offset parameters x and y set to null, then modified to 100 (partialUpdate is false)
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0760', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupGlobal/UiComponentPopupboxPopupGlobal0760')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：点击 "Test" 按钮
      let button_test = await driver.waitForComponent(ON.id('button_test_0760'), 500)
      await button_test.click()
      await Utils.sleep(500)

      // 步骤2：点击气泡内的 "跳转" 按钮
      let button_jump = await driver.waitForComponent(ON.id('button_jump_0760'), 500)
      await button_jump.click()
      await Utils.sleep(500)

      // 预期效果1：气泡的偏移是默认值
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0760_01')
      await Utils.sleep(1000)

      // 步骤3：点击气泡内的 "update 更新" 按钮
      let button_update = await driver.waitForComponent(ON.id('button_update_0760'), 500)
      await button_update.click()
      await Utils.sleep(3000)

      // 预期效果2：等待 3s 后，气泡的偏移保持默认值（x 和 y 没有变化）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0760_02')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0770
     * @tc.name   : Verify updatePopup interface options with width parameter set to null, then modified to 50vp (partialUpdate is false)
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0770', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupGlobal/UiComponentPopupboxPopupGlobal0770')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：点击 "Test" 按钮
      let button_test = await driver.waitForComponent(ON.id('button_test_0770'), 500)
      await button_test.click()
      await Utils.sleep(500)

      // 步骤2：点击气泡内的 "跳转" 按钮
      let button_jump = await driver.waitForComponent(ON.id('button_jump_0770'), 500)
      await button_jump.click()
      await Utils.sleep(500)

      // 预期效果1：弹窗宽度是默认值
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0770_01')
      await Utils.sleep(1000)

      // 步骤3：点击气泡内的 "update 更新" 按钮
      let button_update = await driver.waitForComponent(ON.id('button_update_0770'), 500)
      await button_update.click()
      await Utils.sleep(3000)

      // 预期效果2：等待 3s 后，弹窗宽度还是默认值（没有变为 50vp）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0770_02')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0790
     * @tc.name   : Verify updatePopup interface options with arrowWidth parameter set to null, then modified to 20vp (partialUpdate is false)
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0790', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupGlobal/UiComponentPopupboxPopupGlobal0790')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：点击 "Test" 按钮
      let button_test = await driver.waitForComponent(ON.id('button_test_0790'), 500)
      await button_test.click()
      await Utils.sleep(500)

      // 步骤2：点击气泡内的 "跳转" 按钮
      let button_jump = await driver.waitForComponent(ON.id('button_jump_0790'), 500)
      await button_jump.click()
      await Utils.sleep(500)

      // 预期效果1：气泡箭头宽度为 16vp
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0790_01')
      await Utils.sleep(1000)

      // 步骤3：点击气泡内的 "update 更新" 按钮
      let button_update = await driver.waitForComponent(ON.id('button_update_0790'), 500)
      await button_update.click()
      await Utils.sleep(3000)

      // 预期效果2：等待 3s 后，气泡箭头宽度还是 16vp
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0790_02')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0800
     * @tc.name   : Verify updatePopup interface options with arrowHeight parameter set to null, then modified to 20vp (partialUpdate is false)
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0800', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupGlobal/UiComponentPopupboxPopupGlobal0800')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：点击 "Test" 按钮
      let button_test = await driver.waitForComponent(ON.id('button_test_0800'), 500)
      await button_test.click()
      await Utils.sleep(500)

      // 步骤2：点击气泡内的 "跳转" 按钮
      let button_jump = await driver.waitForComponent(ON.id('button_jump_0800'), 500)
      await button_jump.click()
      await Utils.sleep(500)

      // 预期效果1：气泡箭头高度为 8vp
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0800_01')
      await Utils.sleep(1000)

      // 步骤3：点击气泡内的 "update 更新" 按钮
      let button_update = await driver.waitForComponent(ON.id('button_update_0800'), 500)
      await button_update.click()
      await Utils.sleep(3000)

      // 预期效果2：等待 3s 后，气泡箭头高度还是 8vp
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0800_02')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0840
     * @tc.name   : Verify updatePopup interface options with focusable parameter set to true, then modified to false (partialUpdate is false)
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0840', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupGlobal/UiComponentPopupboxPopupGlobal0840')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：点击 "Test" 按钮
      let button_test = await driver.waitForComponent(ON.id('button_test_0840'), 500)
      await button_test.click()
      await Utils.sleep(500)

      // 步骤2：点击气泡内的 "跳转" 按钮
      let button_jump = await driver.waitForComponent(ON.id('button_jump_0840'), 500)
      await button_jump.click()
      await Utils.sleep(500)

      // 预期效果1：气泡弹出
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0840_01')
      await Utils.sleep(1000)

      // 步骤3：点击气泡内的 "update 更新_focusable" 按钮
      let button_update = await driver.waitForComponent(ON.id('button_update_focusable_0840'), 500)
      await button_update.click()
      await Utils.sleep(3000)

      // 预期效果2：等待 3s 后，popup 的输入框获焦（focusable 还是 true）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0840_02')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0850
     * @tc.name   : Verify updatePopup interface options with transition parameter not set, then modified transition value (partialUpdate is false)
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0850', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupGlobal/UiComponentPopupboxPopupGlobal0850')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：点击 "Test" 按钮
      let button_test = await driver.waitForComponent(ON.id('button_test_0850'), 500)
      await button_test.click()
      await Utils.sleep(500)

      // 步骤2：点击气泡内的 "跳转" 按钮
      let button_jump = await driver.waitForComponent(ON.id('button_jump_0850'), 500)
      await button_jump.click()
      await Utils.sleep(500)

      // 预期效果1：气泡弹出
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0850_01')
      await Utils.sleep(1000)

      // 步骤3：点击气泡内的 "update 更新" 按钮
      let button_update = await driver.waitForComponent(ON.id('button_update_0850'), 500)
      await button_update.click()
      await Utils.sleep(3000)

      // 预期效果2：等待 3s 后，气泡并没有做动画（动画不是指背景颜色）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0850_02')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0870
     * @tc.name   : Verify updatePopup interface with onWillDismiss set to true, then modified to false (partialUpdate is false)
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0870', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupGlobal/UiComponentPopupboxPopupGlobal0870')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：点击 "Test" 按钮
      let button_test = await driver.waitForComponent(ON.id('button_test_0870'), 500)
      await button_test.click()
      await Utils.sleep(500)

      // 预期效果1：popup 弹出
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0870_01')
      await Utils.sleep(1000)

      // 步骤2：点击 "跳转" 按钮
      let button_jump = await driver.waitForComponent(ON.id('button_jump_0870'), 500)
      await button_jump.click()
      await Utils.sleep(500)

      // 步骤3：点击 "update 更新" 按钮
      let button_update = await driver.waitForComponent(ON.id('button_update_0870'), 500)
      await button_update.click()
      await Utils.sleep(3000)

      // 步骤4：点击空白处
      await driver.click(100, 100)
      await Utils.sleep(500)

      // 预期效果2：popup 消失
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0870_02')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0880
     * @tc.name   : Verify openPopup interface with followTransformOfTarget set to false, then modified to true (partialUpdate is false)
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0880', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupGlobal/UiComponentPopupboxPopupGlobal0880')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：点击 "Test" 按钮
      let button_test = await driver.waitForComponent(ON.id('button_test_0880'), 500)
      await button_test.click()
      await Utils.sleep(500)

      // 步骤2：点击 "跳转" 按钮
      let button_jump = await driver.waitForComponent(ON.id('button_jump_0880'), 500)
      await button_jump.click()
      await Utils.sleep(500)

      // 预期效果1：popup 弹出但位置不跟随宿主组件变化
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0880_01')
      await Utils.sleep(1000)

      // 步骤3：点击 "update 更新_followTransformOfTarget" 按钮
      let button_update = await driver.waitForComponent(ON.id('button_update_0880'), 500)
      await button_update.click()
      await Utils.sleep(3000)

      // 预期效果2：popup 在 button 组件下方
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_0880_02')
      await Utils.sleep(1000)

      done();
    })



    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1020
     * @tc.name   : Verify calling updatePopup interface first then openPopup
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1020', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupGlobal/UiComponentPopupboxPopupGlobal1020')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：点击 "Popup3" 按钮
      let button_popup3 = await driver.waitForComponent(ON.id('button_popup3_1020'), 500)
      await button_popup3.click()
      await Utils.sleep(500)

      // 步骤2：点击 "先 update 后 open" 按钮
      let button_test = await driver.waitForComponent(ON.id('button_test_1020'), 500)
      await button_test.click()
      await Utils.sleep(1000)

      // 预期效果1：命令式 popup 弹出
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1020_01')
      await Utils.sleep(1000)

      // 步骤3：点击空白处后等待 3 秒
      await driver.click(100, 100)
      await Utils.sleep(3000)

      // 预期效果2：popup 消失
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1020_02')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1030
     * @tc.name   : Verify multiple asynchronous callbacks opening the same openPopup simultaneously
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1030', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupGlobal/UiComponentPopupboxPopupGlobal1030')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：点击 "Test" 按钮
      let button_test = await driver.waitForComponent(ON.id('button_test_1030'), 500)
      await button_test.click()
      await Utils.sleep(500)

      // 步骤2：点击 "跳转" 按钮
      let button_jump = await driver.waitForComponent(ON.id('button_jump_1030'), 500)
      await button_jump.click()
      await Utils.sleep(500)

      // 步骤3：点击 "toolItem4" 按钮
      let button_toolitem4 = await driver.waitForComponent(ON.id('button_toolitem4_1030'), 500)
      await button_toolitem4.click()
      await Utils.sleep(500)

      // 预期效果1：命令式 popup 弹出（背板颜色为粉色）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1030_01')
      await Utils.sleep(1000)

      // 步骤4：等待 2 秒后
      await Utils.sleep(2000)

      // 预期效果2：验证截图
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1030_02')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1040
     * @tc.name   : Verify multiple asynchronous callbacks updating the same updatePopup simultaneously
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1040', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupGlobal/UiComponentPopupboxPopupGlobal1040')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：点击 "Test" 按钮
      let button_test = await driver.waitForComponent(ON.id('button_test_1040'), 500)
      await button_test.click()
      await Utils.sleep(500)

      // 步骤2：点击 "跳转" 按钮
      let button_jump = await driver.waitForComponent(ON.id('button_jump_1040'), 500)
      await button_jump.click()
      await Utils.sleep(500)

      // 步骤3：点击 "toolItem4" 按钮
      let button_toolitem4 = await driver.waitForComponent(ON.id('button_toolitem4_1040'), 500)
      await button_toolitem4.click()
      await Utils.sleep(500)

      // 预期效果1：命令式 popup 弹出（背板颜色为粉色）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1040_01')
      await Utils.sleep(1000)

      // 步骤4：等待 6 秒后
      await Utils.sleep(6000)

      // 预期效果2：popup 的背板颜色发生变化
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1040_02')
      await Utils.sleep(1000)

      // 步骤5：等待 7 秒后
      await Utils.sleep(1000)

      // 预期效果3：popup 的背板颜色变为白色
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1040_03')
      await Utils.sleep(1000)

      done();
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1060
     * @tc.name   : Verify multiple asynchronous callbacks opening openPopup simultaneously (same targetinfo)
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1060', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupGlobal/UiComponentPopupboxPopupGlobal1060')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：点击 "Test" 按钮
      let button_test = await driver.waitForComponent(ON.id('button_test_1060'), 500)
      await button_test.click()
      await Utils.sleep(500)

      // 步骤2：点击 "跳转" 按钮
      let button_jump = await driver.waitForComponent(ON.id('button_jump_1060'), 500)
      await button_jump.click()
      await Utils.sleep(500)

      // 步骤3：点击 "toolItem8" 按钮
      let button_toolitem8 = await driver.waitForComponent(ON.id('button_toolitem8_1060'), 500)
      await button_toolitem8.click()
      await Utils.sleep(500)

      // 预期效果：有 1 个命令式 popup 弹出
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1060_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1070
     * @tc.name   : Verify multiple asynchronous callbacks updating updatePopup simultaneously (same targetinfo)
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1070', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupGlobal/UiComponentPopupboxPopupGlobal1070')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：点击 "Test" 按钮
      let button_test = await driver.waitForComponent(ON.id('button_test_1070'), 500)
      await button_test.click()
      await Utils.sleep(500)

      // 步骤2：点击 "跳转" 按钮
      let button_jump = await driver.waitForComponent(ON.id('button_jump_1070'), 500)
      await button_jump.click()
      await Utils.sleep(500)

      // 步骤3：点击 "toolItem8" 按钮
      let button_toolitem8 = await driver.waitForComponent(ON.id('button_toolitem8_1070'), 500)
      await button_toolitem8.click()
      await Utils.sleep(500)

      // 预期效果1：有 1 个命令式 popup 弹出
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1070_01')
      await Utils.sleep(1000)

      // 步骤4：等待 6 秒后
      await Utils.sleep(6000)

      // 预期效果2：popup 的位置、背板颜色等发生变化
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1070_02')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1080
     * @tc.name   : Verify multiple asynchronous callbacks closing closePopup simultaneously (same targetinfo)
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1080', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupGlobal/UiComponentPopupboxPopupGlobal1080')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：点击 "Test" 按钮
      let button_test = await driver.waitForComponent(ON.id('button_test_1080'), 500)
      await button_test.click()
      await Utils.sleep(500)

      // 步骤2：点击 "跳转" 按钮
      let button_jump = await driver.waitForComponent(ON.id('button_jump_1080'), 500)
      await button_jump.click()
      await Utils.sleep(500)

      // 步骤3：点击 "toolItem8" 按钮
      let button_toolitem8 = await driver.waitForComponent(ON.id('button_toolitem8_1080'), 500)
      await button_toolitem8.click()
      await Utils.sleep(500)

      // 预期效果1：有 1 个命令式 popup 弹出
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1080_01')
      await Utils.sleep(1000)

      // 步骤4：等待 6 秒后
      await Utils.sleep(6000)

      // 预期效果2：popup 的位置、背板颜色等发生变化
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1080_02')
      await Utils.sleep(1000)

      // 步骤5：等待 8 秒后
      await Utils.sleep(2000)

      // 预期效果3：popup 消失
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1080_03')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1100
     * @tc.name   : Verify multiple asynchronous callbacks opening openPopup simultaneously (different targetinfo)
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1100', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupGlobal/UiComponentPopupboxPopupGlobal1100')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：点击 "Test" 按钮
      let button_test = await driver.waitForComponent(ON.id('button_test_1100'), 500)
      await button_test.click()
      await Utils.sleep(500)

      // 步骤2：点击 "跳转" 按钮
      let button_jump = await driver.waitForComponent(ON.id('button_jump_1100'), 500)
      await button_jump.click()
      await Utils.sleep(500)

      // 步骤3：点击 "toolItem8" 按钮
      let button_toolitem8 = await driver.waitForComponent(ON.id('button_toolitem8_1100'), 500)
      await button_toolitem8.click()
      await Utils.sleep(500)

      // 预期效果：有两个命令式 popup 弹出
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1100_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1110
     * @tc.name   : Verify multiple asynchronous callbacks updating updatePopup simultaneously (different targetinfo)
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1110', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupGlobal/UiComponentPopupboxPopupGlobal1110')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：点击 "Test" 按钮
      let button_test = await driver.waitForComponent(ON.id('button_test_1110'), 500)
      await button_test.click()
      await Utils.sleep(500)

      // 步骤2：点击 "跳转" 按钮
      let button_jump = await driver.waitForComponent(ON.id('button_jump_1110'), 500)
      await button_jump.click()
      await Utils.sleep(500)

      // 步骤3：点击 "toolItem8" 按钮
      let button_toolitem8 = await driver.waitForComponent(ON.id('button_toolitem8_1110'), 500)
      await button_toolitem8.click()
      await Utils.sleep(500)

      // 预期效果1：有两个命令式 popup 弹出
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1110_01')
      await Utils.sleep(1000)

      // 步骤4：等待 6 秒后
      await Utils.sleep(6000)

      // 预期效果2：两个 popup 的位置、背板颜色等发生变化
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1110_02')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1120
     * @tc.name   : Verify multiple asynchronous callbacks closing closePopup simultaneously (different targetinfo)
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1120', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupGlobal/UiComponentPopupboxPopupGlobal1120')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：点击 "Test" 按钮
      let button_test = await driver.waitForComponent(ON.id('button_test_1120'), 500)
      await button_test.click()
      await Utils.sleep(500)

      // 步骤2：点击 "跳转" 按钮
      let button_jump = await driver.waitForComponent(ON.id('button_jump_1120'), 500)
      await button_jump.click()
      await Utils.sleep(500)

      // 步骤3：点击 "toolItem8" 按钮
      let button_toolitem8 = await driver.waitForComponent(ON.id('button_toolitem8_1120'), 500)
      await button_toolitem8.click()
      await Utils.sleep(500)

      // 预期效果1：有两个命令式 popup 弹出
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1120_01')
      await Utils.sleep(1000)

      // 步骤4：等待 6 秒后
      await Utils.sleep(6000)

      // 预期效果2：两个 popup 的位置、背板颜色等发生变化
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1120_02')
      await Utils.sleep(1000)

      // 步骤5：等待 8 秒后
      await Utils.sleep(2000)

      // 预期效果3：两个 popup 都消失
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1120_03')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1130
     * @tc.name   : Verify calling openPopup, updatePopup, and closePopup interfaces inside half-modal
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1130', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupGlobal/UiComponentPopupboxPopupGlobal1130')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：点击 "Popup3" 按钮
      let button_popup3 = await driver.waitForComponent(ON.id('button_popup3_1130'), 500)
      await button_popup3.click()
      await Utils.sleep(500)

      // 步骤2：点击 "bindSheet" 按钮
      let button_bindsheet = await driver.waitForComponent(ON.id('button_bindsheet_1130'), 500)
      await button_bindsheet.click()
      await Utils.sleep(500)

      // 步骤3：点击 "弹出气泡" 按钮
      let button_show_popup = await driver.waitForComponent(ON.id('button_show_popup_1130'), 500)
      await button_show_popup.click()
      await Utils.sleep(500)

      // 预期效果1：命令式 popup 弹出
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1130_01')
      await Utils.sleep(1000)

      // 步骤4：等待 3 秒后
      await Utils.sleep(3000)

      // 预期效果2：popup 位置、宽度等属性发生变化
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1130_02')
      await Utils.sleep(1000)

      // 步骤5：再次等待 3 秒后
      await Utils.sleep(3000)

      // 预期效果3：popup 消失
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1130_03')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1380
     * @tc.name   : Verify openPopup interface with onStateChange set
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1380', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupGlobal/UiComponentPopupboxPopupGlobal1380')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：点击 "Test" 按钮
      let button_test = await driver.waitForComponent(ON.id('button_test_1380'), 500)
      await button_test.click()
      await Utils.sleep(500)

      // 步骤2：点击 "跳转" 按钮
      let button_jump = await driver.waitForComponent(ON.id('button_jump_1380'), 500)
      await button_jump.click()
      await Utils.sleep(500)

      // 步骤3：点击 "open 打开" 按钮
      let button_open = await driver.waitForComponent(ON.id('button_open_1380'), 500)
      await button_open.click()
      await Utils.sleep(500)

      // 预期效果：log 日志为：popup222 openPopup isVisible：true
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1380_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1410
     * @tc.name   : Verify openPopup interface options with arrowOffset parameter set to $r("app.string.string45")
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1410', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupGlobal/UiComponentPopupboxPopupGlobal1410')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：点击 "Test" 按钮
      let button_test = await driver.waitForComponent(ON.id('button_test_1410'), 500)
      await button_test.click()
      await Utils.sleep(500)

      // 步骤2：点击 "跳转" 按钮
      let button_jump = await driver.waitForComponent(ON.id('button_jump_1410'), 500)
      await button_jump.click()
      await Utils.sleep(500)

      // 步骤3：点击 "open 打开" 按钮
      let button_open = await driver.waitForComponent(ON.id('button_open_1410'), 500)
      await button_open.click()
      await Utils.sleep(500)

      // 预期效果：气泡箭头的偏移为 45 (在最下面)
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1410_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1440
     * @tc.name   : Verify openPopup interface options with showInSubWindow parameter set to true
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1440', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupGlobal/UiComponentPopupboxPopupGlobal1440')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：点击 "Test" 按钮
      let button_test = await driver.waitForComponent(ON.id('button_test_1440'), 500)
      await button_test.click()
      await Utils.sleep(500)

      // 步骤2：点击 "跳转" 按钮
      let button_jump = await driver.waitForComponent(ON.id('button_jump_1440'), 500)
      await button_jump.click()
      await Utils.sleep(500)

      // 步骤3：点击 "open 打开" 按钮
      let button_open = await driver.waitForComponent(ON.id('button_open_1440'), 500)
      await button_open.click()
      await Utils.sleep(500)

      // 预期效果：气泡弹出（在子窗口显示气泡）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1440_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1450
     * @tc.name   : Verify openPopup interface options with showInSubWindow parameter set to false
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1450', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupGlobal/UiComponentPopupboxPopupGlobal1450')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：点击 "Test" 按钮
      let button_test = await driver.waitForComponent(ON.id('button_test_1450'), 500)
      await button_test.click()
      await Utils.sleep(500)

      // 步骤2：点击 "跳转" 按钮
      let button_jump = await driver.waitForComponent(ON.id('button_jump_1450'), 500)
      await button_jump.click()
      await Utils.sleep(500)

      // 步骤3：点击 "open 打开" 按钮
      let button_open = await driver.waitForComponent(ON.id('button_open_1450'), 500)
      await button_open.click()
      await Utils.sleep(500)

      // 预期效果：气泡弹出（不在子窗口显示气泡）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1450_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1460
     * @tc.name   : Verify openPopup interface options with showInSubWindow parameter set to null
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1460', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupGlobal/UiComponentPopupboxPopupGlobal1460')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：点击 "Test" 按钮
      let button_test = await driver.waitForComponent(ON.id('button_test_1460'), 500)
      await button_test.click()
      await Utils.sleep(500)

      // 步骤2：点击 "跳转" 按钮
      let button_jump = await driver.waitForComponent(ON.id('button_jump_1460'), 500)
      await button_jump.click()
      await Utils.sleep(500)

      // 步骤3：点击 "open 打开" 按钮
      let button_open = await driver.waitForComponent(ON.id('button_open_1460'), 500)
      await button_open.click()
      await Utils.sleep(500)

      // 预期效果：气泡弹出（不在子窗口显示气泡）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1460_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1560
     * @tc.name   : Verify openPopup interface options with targetSpace parameter set to $r("app.string.string10")-10
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1560', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupGlobal/UiComponentPopupboxPopupGlobal1560')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：点击 "Test" 按钮
      let button_test = await driver.waitForComponent(ON.id('button_test_1560'), 500)
      await button_test.click()
      await Utils.sleep(500)

      // 步骤2：点击 "跳转" 按钮
      let button_jump = await driver.waitForComponent(ON.id('button_jump_1560'), 500)
      await button_jump.click()
      await Utils.sleep(500)

      // 步骤3：点击 "open 打开" 按钮
      let button_open = await driver.waitForComponent(ON.id('button_open_1560'), 500)
      await button_open.click()
      await Utils.sleep(500)

      // 预期效果：气泡和组件的间隙是 - 10（气泡覆盖在组件上方）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1560_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1670
     * @tc.name   : Verify openPopup interface options with width parameter set to $r("app.string.string45") 45vp
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1670', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupGlobal/UiComponentPopupboxPopupGlobal1670')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：点击 "Test" 按钮
      let button_test = await driver.waitForComponent(ON.id('button_test_1670'), 500)
      await button_test.click()
      await Utils.sleep(500)

      // 步骤2：点击 "跳转" 按钮
      let button_jump = await driver.waitForComponent(ON.id('button_jump_1670'), 500)
      await button_jump.click()
      await Utils.sleep(500)

      // 步骤3：点击 "open 打开" 按钮
      let button_open = await driver.waitForComponent(ON.id('button_open_1670'), 500)
      await button_open.click()
      await Utils.sleep(500)

      // 预期效果：弹窗宽度是 45vp
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1670_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1890
     * @tc.name   : Verify openPopup interface options with radius parameter set to 10px
     * @tc.desc   : Verify popupbox popup global interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1890', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupGlobal/UiComponentPopupboxPopupGlobal1890')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤1：点击 "Test" 按钮
      let button_test = await driver.waitForComponent(ON.id('button_test_1890'), 500)
      await button_test.click()
      await Utils.sleep(500)

      // 步骤2：点击 "跳转" 按钮
      let button_jump = await driver.waitForComponent(ON.id('button_jump_1890'), 500)
      await button_jump.click()
      await Utils.sleep(500)

      // 步骤3：点击 "open 打开" 按钮
      let button_open = await driver.waitForComponent(ON.id('button_open_1890'), 500)
      await button_open.click()
      await Utils.sleep(500)

      // 预期效果：气泡圆角半径为 10px
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_GLOBAL_1890_01')
      await Utils.sleep(1000)

      done();
    })

  })
}