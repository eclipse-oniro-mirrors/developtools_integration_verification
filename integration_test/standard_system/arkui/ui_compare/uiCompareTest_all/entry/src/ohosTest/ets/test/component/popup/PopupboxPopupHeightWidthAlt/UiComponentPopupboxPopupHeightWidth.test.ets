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

export default function uiComponentPopupboxPopupHeightWidth() {
  describe('uiComponentPopupboxPopupHeightWidth', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0140
     * @tc.name   : Popup adds width property, PopupOptions parameter width set to "0"
     * @tc.desc   : Verify popupbox popup heightwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0140', Level.LEVEL3, async (done: Function) => {
      // 步骤1: 打开 demo
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupHeightWidth/UiComponentPopupboxPopupHeightWidth0140')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2: 点击按钮
      let button_popup_0140_open = await driver.waitForComponent(ON.id('button_popup_0140_open'), 500)
      await button_popup_0140_open.click()
      await Utils.sleep(500)

      // 预期效果1: 气泡宽度为自适应宽度
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0140_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0160
     * @tc.name   : Popup adds width property, PopupOptions parameter width set to Resource type "50px"
     * @tc.desc   : Verify popupbox popup heightwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0160', Level.LEVEL3, async (done: Function) => {
      // 步骤1: 打开 demo
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupHeightWidth/UiComponentPopupboxPopupHeightWidth0160')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2: 点击按钮
      let button_popup_0160_open = await driver.waitForComponent(ON.id('button_popup_0160_open'), 500)
      await button_popup_0160_open.click()
      await Utils.sleep(500)

      // 预期效果1: 气泡宽度为 50px
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0160_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0170
     * @tc.name   : Popup adds width property, PopupOptions parameter width set to Resource type "0px"
     * @tc.desc   : Verify popupbox popup heightwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0170', Level.LEVEL3, async (done: Function) => {
      // 步骤1: 打开 demo
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupHeightWidth/UiComponentPopupboxPopupHeightWidth0170')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2: 点击按钮
      let button_popup_0170_open = await driver.waitForComponent(ON.id('button_popup_0170_open'), 500)
      await button_popup_0170_open.click()
      await Utils.sleep(500)

      // 预期效果1: 气泡宽度为自适应宽度
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0170_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0180
     * @tc.name   : Popup adds width property, PopupOptions parameter width set to Resource type "-50px"
     * @tc.desc   : Verify popupbox popup heightwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0180', Level.LEVEL3, async (done: Function) => {
      // 步骤1: 打开 demo
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupHeightWidth/UiComponentPopupboxPopupHeightWidth0180')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2: 点击按钮
      let button_popup_0180_open = await driver.waitForComponent(ON.id('button_popup_0180_open'), 500)
      await button_popup_0180_open.click()
      await Utils.sleep(500)

      // 预期效果1: 气泡宽度为自适应宽度
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0180_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0190
     * @tc.name   : Popup adds width property, PopupOptions parameter width set to Resource type "50vp"
     * @tc.desc   : Verify popupbox popup heightwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0190', Level.LEVEL3, async (done: Function) => {
      // 步骤1: 打开 demo
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupHeightWidth/UiComponentPopupboxPopupHeightWidth0190')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2: 点击按钮
      let button_popup_0190_open = await driver.waitForComponent(ON.id('button_popup_0190_open'), 500)
      await button_popup_0190_open.click()
      await Utils.sleep(500)

      // 预期效果1: 气泡宽度为 50vp
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0190_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0200
     * @tc.name   : Popup adds width property, PopupOptions parameter width set to Resource type "0vp"
     * @tc.desc   : Verify popupbox popup heightwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0200', Level.LEVEL3, async (done: Function) => {
      // 步骤1: 打开 demo
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupHeightWidth/UiComponentPopupboxPopupHeightWidth0200')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2: 点击按钮
      let button_popup_0200_open = await driver.waitForComponent(ON.id('button_popup_0200_open'), 500)
      await button_popup_0200_open.click()
      await Utils.sleep(500)

      // 预期效果1: 气泡宽度为自适应宽度
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0200_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0210
     * @tc.name   : Popup adds width property, PopupOptions parameter width set to Resource type "-50vp"
     * @tc.desc   : Verify popupbox popup heightwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0210', Level.LEVEL3, async (done: Function) => {
      // 步骤1: 打开 demo
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupHeightWidth/UiComponentPopupboxPopupHeightWidth0210')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2: 点击按钮
      let button_popup_0210_open = await driver.waitForComponent(ON.id('button_popup_0210_open'), 500)
      await button_popup_0210_open.click()
      await Utils.sleep(500)

      // 预期效果1: 气泡宽度为自适应宽度
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0210_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0220
     * @tc.name   : Popup adds width property, PopupOptions parameter width set to Resource type "50fp"
     * @tc.desc   : Verify popupbox popup heightwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0220', Level.LEVEL3, async (done: Function) => {
      // 步骤1: 打开 demo
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupHeightWidth/UiComponentPopupboxPopupHeightWidth0220')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2: 点击按钮
      let button_popup_0220_open = await driver.waitForComponent(ON.id('button_popup_0220_open'), 500)
      await button_popup_0220_open.click()
      await Utils.sleep(500)

      // 预期效果1: 气泡宽度为 50fp
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0220_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0230
     * @tc.name   : Popup adds width property, PopupOptions parameter width set to Resource type "-0fp"
     * @tc.desc   : Verify popupbox popup heightwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0230', Level.LEVEL3, async (done: Function) => {
      // 步骤1: 打开 demo
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupHeightWidth/UiComponentPopupboxPopupHeightWidth0230')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2: 点击按钮
      let button_popup_0230_open = await driver.waitForComponent(ON.id('button_popup_0230_open'), 500)
      await button_popup_0230_open.click()
      await Utils.sleep(500)

      // 预期效果1: 气泡宽度为自适应宽度
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0230_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0240
     * @tc.name   : Popup adds width property, PopupOptions parameter width set to Resource type "-50fp"
     * @tc.desc   : Verify popupbox popup heightwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0240', Level.LEVEL3, async (done: Function) => {
      // 步骤1: 打开 demo
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupHeightWidth/UiComponentPopupboxPopupHeightWidth0240')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2: 点击按钮
      let button_popup_0240_open = await driver.waitForComponent(ON.id('button_popup_0240_open'), 500)
      await button_popup_0240_open.click()
      await Utils.sleep(500)

      // 预期效果1: 气泡宽度为自适应宽度
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0240_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0250
     * @tc.name   : Popup adds width property, PopupOptions parameter width set to Resource type "50lpx"
     * @tc.desc   : Verify popupbox popup heightwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0250', Level.LEVEL3, async (done: Function) => {
      // 步骤1: 打开 demo
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupHeightWidth/UiComponentPopupboxPopupHeightWidth0250')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2: 点击按钮
      let button_popup_0250_open = await driver.waitForComponent(ON.id('button_popup_0250_open'), 500)
      await button_popup_0250_open.click()
      await Utils.sleep(500)

      // 预期效果1: 气泡宽度为 50lpx
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0250_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0260
     * @tc.name   : Popup adds width property, PopupOptions parameter width set to Resource type "0lpx"
     * @tc.desc   : Verify popupbox popup heightwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0260', Level.LEVEL3, async (done: Function) => {
      // 步骤1: 打开 demo
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupHeightWidth/UiComponentPopupboxPopupHeightWidth0260')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2: 点击按钮
      let button_popup_0260_open = await driver.waitForComponent(ON.id('button_popup_0260_open'), 500)
      await button_popup_0260_open.click()
      await Utils.sleep(500)

      // 预期效果1: 气泡宽度为自适应宽度
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0260_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0270
     * @tc.name   : Popup adds width property, PopupOptions parameter width set to Resource type "-50lpx"
     * @tc.desc   : Verify popupbox popup heightwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0270', Level.LEVEL3, async (done: Function) => {
      // 步骤1: 打开 demo
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupHeightWidth/UiComponentPopupboxPopupHeightWidth0270')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2: 点击按钮
      let button_popup_0270_open = await driver.waitForComponent(ON.id('button_popup_0270_open'), 500)
      await button_popup_0270_open.click()
      await Utils.sleep(500)

      // 预期效果1: 气泡宽度为自适应宽度
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0270_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0280
     * @tc.name   : Popup adds width property, PopupOptions parameter width set to Resource type "80%"
     * @tc.desc   : Verify popupbox popup heightwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0280', Level.LEVEL3, async (done: Function) => {
      // 步骤1: 打开 demo
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupHeightWidth/UiComponentPopupboxPopupHeightWidth0280')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2: 点击按钮
      let button_popup_0280_open = await driver.waitForComponent(ON.id('button_popup_0280_open'), 500)
      await button_popup_0280_open.click()
      await Utils.sleep(500)

      // 预期效果1: 气泡宽度为组件的 80%
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0280_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0290
     * @tc.name   : Popup adds width property, PopupOptions parameter width set to Resource type "0"
     * @tc.desc   : Verify popupbox popup heightwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0290', Level.LEVEL3, async (done: Function) => {
      // 步骤1: 打开 demo
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupHeightWidth/UiComponentPopupboxPopupHeightWidth0290')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2: 点击按钮
      let button_popup_0290_open = await driver.waitForComponent(ON.id('button_popup_0290_open'), 500)
      await button_popup_0290_open.click()
      await Utils.sleep(500)

      // 预期效果1: 气泡宽度为自适应宽度
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0290_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0300
     * @tc.name   : Popup adds width property, PopupOptions parameter width set to Resource type "-50%"
     * @tc.desc   : Verify popupbox popup heightwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0300', Level.LEVEL3, async (done: Function) => {
      // 步骤1: 打开 demo
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupHeightWidth/UiComponentPopupboxPopupHeightWidth0300')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2: 点击按钮
      let button_popup_0300_open = await driver.waitForComponent(ON.id('button_popup_0300_open'), 500)
      await button_popup_0300_open.click()
      await Utils.sleep(500)

      // 预期效果1: 气泡宽度为自适应宽度
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0300_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0310
     * @tc.name   : Popup adds width property, PopupOptions parameter width not set, short text input 1 (grid count less than 4)
     * @tc.desc   : Verify popupbox popup heightwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0310', Level.LEVEL3, async (done: Function) => {
      // 步骤1: 打开 demo
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupHeightWidth/UiComponentPopupboxPopupHeightWidth0310')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2: 点击按钮
      let button_popup_0310_open = await driver.waitForComponent(ON.id('button_popup_0310_open'), 500)
      await button_popup_0310_open.click()
      await Utils.sleep(500)

      // 预期效果1: 气泡宽度为 50px
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0310_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0320
     * @tc.name   : Popup adds width property, PopupOptions parameter width not set, short text input 2 (grid count less than 4)
     * @tc.desc   : Verify popupbox popup heightwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0320', Level.LEVEL3, async (done: Function) => {
      // 步骤1: 打开 demo
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupHeightWidth/UiComponentPopupboxPopupHeightWidth0320')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2: 点击按钮
      let button_popup_0320_open = await driver.waitForComponent(ON.id('button_popup_0320_open'), 500)
      await button_popup_0320_open.click()
      await Utils.sleep(500)

      // 预期效果1: 弹窗宽度与文本长度适配
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0320_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0330
     * @tc.name   : Popup adds width property, PopupOptions parameter width not set, short text input 3 (grid count less than 4)
     * @tc.desc   : Verify popupbox popup heightwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0330', Level.LEVEL3, async (done: Function) => {
      // 步骤1: 打开 demo
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupHeightWidth/UiComponentPopupboxPopupHeightWidth0330')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2: 点击按钮
      let button_popup_0330_open = await driver.waitForComponent(ON.id('button_popup_0330_open'), 500)
      await button_popup_0330_open.click()
      await Utils.sleep(500)

      // 预期效果1: 弹窗宽度与文本长度适配
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0330_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0340
     * @tc.name   : Popup adds width property, PopupOptions parameter width not set, longer text input 1 (grid count greater than 4 and less than 480vp)
     * @tc.desc   : Verify popupbox popup heightwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0340', Level.LEVEL3, async (done: Function) => {
      // 步骤1: 打开 demo
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupHeightWidth/UiComponentPopupboxPopupHeightWidth0340')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2: 点击按钮
      let button_popup_0340_open = await driver.waitForComponent(ON.id('button_popup_0340_open'), 500)
      await button_popup_0340_open.click()
      await Utils.sleep(500)

      // 预期效果1: 弹窗宽度与文本长度适配
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0340_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0350
     * @tc.name   : Popup adds width property, PopupOptions parameter width not set, longer text input 2 (grid count greater than 4 and less than 480vp)
     * @tc.desc   : Verify popupbox popup heightwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0350', Level.LEVEL3, async (done: Function) => {
      // 步骤1: 打开 demo
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupHeightWidth/UiComponentPopupboxPopupHeightWidth0350')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2: 点击按钮
      let button_popup_0350_open = await driver.waitForComponent(ON.id('button_popup_0350_open'), 500)
      await button_popup_0350_open.click()
      await Utils.sleep(500)

      // 预期效果1: 弹窗宽度与文本长度适配
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0350_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0360
     * @tc.name   : Popup adds width property, PopupOptions parameter width not set, longer text input 3 (grid count greater than 4 and less than 480vp)
     * @tc.desc   : Verify popupbox popup heightwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0360', Level.LEVEL3, async (done: Function) => {
      // 步骤1: 打开 demo
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupHeightWidth/UiComponentPopupboxPopupHeightWidth0360')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2: 点击按钮
      let button_popup_0360_open = await driver.waitForComponent(ON.id('button_popup_0360_open'), 500)
      await button_popup_0360_open.click()
      await Utils.sleep(500)

      // 预期效果1: 弹窗宽度与文本长度适配
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0360_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0370
     * @tc.name   : Popup adds width property, PopupOptions parameter width not set, very long text input (grid count greater than 480vp)
     * @tc.desc   : Verify popupbox popup heightwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0370', Level.LEVEL3, async (done: Function) => {
      // 步骤1: 打开 demo
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupHeightWidth/UiComponentPopupboxPopupHeightWidth0370')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2: 点击按钮
      let button_popup_0370_open = await driver.waitForComponent(ON.id('button_popup_0370_open'), 500)
      await button_popup_0370_open.click()
      await Utils.sleep(500)

      // 预期效果1: 弹窗宽度为 480vp
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_0370_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_2280
     * @tc.name   : Preview capability blue zone test
     * @tc.desc   : Verify popupbox popup heightwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_2280', Level.LEVEL3, async (done: Function) => {
      // 步骤1: 打开 demo
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupHeightWidth/UiComponentPopupboxPopupHeightWidth2280')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2: 直接在 IDE 的预览功能中查看 UI 界面
      let button_popup_2280_open = await driver.waitForComponent(ON.id('button_popup_2280_open'), 500)
      await button_popup_2280_open.click()
      await Utils.sleep(500)

      // 预期效果1: 可以通过预览功能查看高级组件 popup，UI 界面显示正常
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_2280_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_2290
     * @tc.name   : Popup adds arrowPlacement property, ContextPopupOptions parameter ArrowPlacement set to Start
     * @tc.desc   : Verify popupbox popup heightwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_2290', Level.LEVEL3, async (done: Function) => {
      // 步骤1: 打开 demo
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupHeightWidth/UiComponentPopupboxPopupHeightWidth2290')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2: 点击按钮
      let button_popup_2290_open = await driver.waitForComponent(ON.id('button_popup_2290_open'), 500)
      await button_popup_2290_open.click()
      await Utils.sleep(500)

      // 预期效果1: 位置点均位于父组件区域的范围内，不会超出父组件的边界范围
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_2290_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_2300
     * @tc.name   : Popup adds arrowPlacement property, ContextPopupOptions parameter ArrowPlacement set to Center
     * @tc.desc   : Verify popupbox popup heightwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_2300', Level.LEVEL3, async (done: Function) => {
      // 步骤1: 打开 demo
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupHeightWidth/UiComponentPopupboxPopupHeightWidth2300')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2: 点击按钮
      let button_popup_2300_open = await driver.waitForComponent(ON.id('button_popup_2300_open'), 500)
      await button_popup_2300_open.click()
      await Utils.sleep(500)

      // 预期效果1: 位置点均位于父组件区域的范围内，不会超出父组件的边界范围
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_2300_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_2310
     * @tc.name   : Popup adds arrowPlacement property, ContextPopupOptions parameter ArrowPlacement set to End
     * @tc.desc   : Verify popupbox popup heightwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_2310', Level.LEVEL3, async (done: Function) => {
      // 步骤1: 打开 demo
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupHeightWidth/UiComponentPopupboxPopupHeightWidth2310')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2: 点击按钮
      let button_popup_2310_open = await driver.waitForComponent(ON.id('button_popup_2310_open'), 500)
      await button_popup_2310_open.click()
      await Utils.sleep(500)

      // 预期效果1: 位置点均位于父组件区域的范围内，不会超出父组件的边界范围
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_2310_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_2320
     * @tc.name   : Popup adds arrow style, arrow position set via arrowOffset, within 20vp of leftmost (top) side of bubble (including 20vp)
     * @tc.desc   : Verify popupbox popup heightwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_2320', Level.LEVEL3, async (done: Function) => {
      // 步骤1: 打开 demo
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupHeightWidth/UiComponentPopupboxPopupHeightWidth2320')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2: 点击按钮
      let button_popup_2320_open = await driver.waitForComponent(ON.id('button_popup_2320_open'), 500)
      await button_popup_2320_open.click()
      await Utils.sleep(500)

      // 预期效果1: 直角三角形
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_2320_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_2330
     * @tc.name   : Popup adds arrow style, arrow position set via arrowOffset, within safe distance of bubble
     * @tc.desc   : Verify popupbox popup heightwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_2330', Level.LEVEL3, async (done: Function) => {
      // 步骤1: 打开 demo
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupHeightWidth/UiComponentPopupboxPopupHeightWidth2330')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2: 点击按钮
      let button_popup_2330_open = await driver.waitForComponent(ON.id('button_popup_2330_open'), 500)
      await button_popup_2330_open.click()
      await Utils.sleep(500)

      // 预期效果1: 默认三角形
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_2330_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_2340
     * @tc.name   : Popup adds arrow style, arrow position set via arrowOffset, within 20vp of rightmost (bottom) side of bubble (including 20vp)
     * @tc.desc   : Verify popupbox popup heightwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_2340', Level.LEVEL3, async (done: Function) => {
      // 步骤1: 打开 demo
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupHeightWidth/UiComponentPopupboxPopupHeightWidth2340')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2: 点击按钮
      let button_popup_2340_open = await driver.waitForComponent(ON.id('button_popup_2340_open'), 500)
      await button_popup_2340_open.click()
      await Utils.sleep(500)

      // 预期效果1: 直角三角形
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_2340_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_2350
     * @tc.name   : Popup adds arrow style, arrow position set via arrowOffset, popup width less than 40vp
     * @tc.desc   : Verify popupbox popup heightwidth interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_2350', Level.LEVEL3, async (done: Function) => {
      // 步骤1: 打开 demo
      Settings.createWindow('testability/pages/component/popup/PopupboxPopupHeightWidth/UiComponentPopupboxPopupHeightWidth2350')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2: 点击按钮
      let button_popup_2350_open = await driver.waitForComponent(ON.id('button_popup_2350_open'), 500)
      await button_popup_2350_open.click()
      await Utils.sleep(500)

      // 预期效果1: 侧边距离不足 40vp，不显示箭头
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_POPUPBOX_POPUP_HEIGHTWIDTH_2350_01')
      await Utils.sleep(1000)

      done();
    })
  })
}