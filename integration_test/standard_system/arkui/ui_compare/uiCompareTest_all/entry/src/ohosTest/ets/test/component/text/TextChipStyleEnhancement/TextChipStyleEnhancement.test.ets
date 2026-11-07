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

export default function textChipStyleEnhancement() {

  describe('textChipStyleEnhancement', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0040
     * @tc.name   : Text chip styleenhancement
     * @tc.desc   : Verify text chip styleenhancement interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0040 start.`);
      Settings.createWindow('testability/pages/component/text/TextChipStyleEnhancement/TextChipStyleEnhancement0040')
      let driver: Driver = Driver.create();
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      // 点击设置FontColor actived: 1按钮
      let buttonSetFontColorActived = await driver.waitForComponent(ON.id('button_set_font_color_actived'), 3000)
      if (buttonSetFontColorActived) {
        await buttonSetFontColorActived.click()
        await Utils.sleep(1000)
      }
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0050
     * @tc.name   : Text chip styleenhancement
     * @tc.desc   : Verify text chip styleenhancement interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0050 start.`);
      Settings.createWindow('testability/pages/component/text/TextChipStyleEnhancement/TextChipStyleEnhancement0050')
      let driver: Driver = Driver.create();
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      // 点击设置FontColor actived: 2按钮
      let buttonSetFontColorActived = await driver.waitForComponent(ON.id('button_set_font_color_actived'), 3000)
      if (buttonSetFontColorActived) {
        await buttonSetFontColorActived.click()
        await Utils.sleep(2000)
      }
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0060
     * @tc.name   : Text chip styleenhancement
     * @tc.desc   : Verify text chip styleenhancement interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0060 start.`);
      Settings.createWindow('testability/pages/component/text/TextChipStyleEnhancement/TextChipStyleEnhancement0060')
      let driver: Driver = Driver.create();
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      // 点击设置FontColor actived: 3按钮
      let buttonSetFontColorActived = await driver.waitForComponent(ON.id('button_set_font_color_actived'), 3000)
      if (buttonSetFontColorActived) {
        await buttonSetFontColorActived.click()
        await Utils.sleep(2000)
      }
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0070
     * @tc.name   : Text chip styleenhancement
     * @tc.desc   : Verify text chip styleenhancement interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0070 start.`);
      Settings.createWindow('testability/pages/component/text/TextChipStyleEnhancement/TextChipStyleEnhancement0070')
      let driver: Driver = Driver.create();
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      // 点击设置FontColor actived: 4按钮
      let buttonSetFontColorActived = await driver.waitForComponent(ON.id('button_set_font_color_actived'), 3000)
      if (buttonSetFontColorActived) {
        await buttonSetFontColorActived.click()
        await Utils.sleep(2000)
      }
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0080
     * @tc.name   : Text chip styleenhancement
     * @tc.desc   : Verify text chip styleenhancement interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0080 start.`);
      Settings.createWindow('testability/pages/component/text/TextChipStyleEnhancement/TextChipStyleEnhancement0080')
      let driver: Driver = Driver.create();
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      // 点击刷新页面按钮
      let buttonRefreshPage = await driver.waitForComponent(ON.id('button_refresh_page'), 3000)
      if (buttonRefreshPage) {
        await buttonRefreshPage.click()
        await Utils.sleep(2000)
      }
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0090
     * @tc.name   : Text chip styleenhancement
     * @tc.desc   : Verify text chip styleenhancement interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0090 start.`);
      Settings.createWindow('testability/pages/component/text/TextChipStyleEnhancement/TextChipStyleEnhancement0090')
      let driver: Driver = Driver.create();
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      // 点击设置FillColor actived: 1按钮
      let buttonSetFillColorActived = await driver.waitForComponent(ON.id('button_set_fill_color_actived'), 3000)
      if (buttonSetFillColorActived) {
        await buttonSetFillColorActived.click()
        await Utils.sleep(2000)
      }
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0100
     * @tc.name   : Text chip styleenhancement
     * @tc.desc   : Verify text chip styleenhancement interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0100 start.`);
      Settings.createWindow('testability/pages/component/text/TextChipStyleEnhancement/TextChipStyleEnhancement0100')
      let driver: Driver = Driver.create();
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      // 点击设置FillColor actived: 2按钮
      let buttonSetFillColorActived = await driver.waitForComponent(ON.id('button_set_fill_color_actived'), 3000)
      if (buttonSetFillColorActived) {
        await buttonSetFillColorActived.click()
        await Utils.sleep(2000)
      }
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0100 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0110
     * @tc.name   : Text chip styleenhancement
     * @tc.desc   : Verify text chip styleenhancement interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0110 start.`);
      Settings.createWindow('testability/pages/component/text/TextChipStyleEnhancement/TextChipStyleEnhancement0110')
      let driver: Driver = Driver.create();
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      // 点击设置FillColor actived: 3按钮
      let buttonSetFillColorActived = await driver.waitForComponent(ON.id('button_set_fill_color_actived'), 3000)
      if (buttonSetFillColorActived) {
        await buttonSetFillColorActived.click()
        await Utils.sleep(2000)
      }
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0120
     * @tc.name   : Text chip styleenhancement
     * @tc.desc   : Verify text chip styleenhancement interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0120 start.`);
      Settings.createWindow('testability/pages/component/text/TextChipStyleEnhancement/TextChipStyleEnhancement0120')
      let driver: Driver = Driver.create();
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      // 点击设置FillColor actived: 4按钮
      let buttonSetFillColorActived = await driver.waitForComponent(ON.id('button_set_fill_color_actived'), 3000)
      if (buttonSetFillColorActived) {
        await buttonSetFillColorActived.click()
        await Utils.sleep(2000)
      }
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0130
     * @tc.name   : Text chip styleenhancement
     * @tc.desc   : Verify text chip styleenhancement interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0130 start.`);
      Settings.createWindow('testability/pages/component/text/TextChipStyleEnhancement/TextChipStyleEnhancement0130')
      let driver: Driver = Driver.create();
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      // 点击刷新页面按钮
      let buttonRefreshPage = await driver.waitForComponent(ON.id('button_refresh_page'), 3000)
      if (buttonRefreshPage) {
        await buttonRefreshPage.click()
        await Utils.sleep(2000)
      }
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0130 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0140
     * @tc.name   : Text chip styleenhancement
     * @tc.desc   : Verify text chip styleenhancement interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0140 start.`);
      Settings.createWindow('testability/pages/component/text/TextChipStyleEnhancement/TextChipStyleEnhancement0140')
      let driver: Driver = Driver.create();
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      // 点击设置BackgroundColor actived: 1按钮
      let buttonSetBackgroundColorActived = await driver.waitForComponent(ON.id('button_set_background_color_actived'), 3000)
      if (buttonSetBackgroundColorActived) {
        await buttonSetBackgroundColorActived.click()
        await Utils.sleep(2000)
      }
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0140 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0150
     * @tc.name   : Text chip styleenhancement
     * @tc.desc   : Verify text chip styleenhancement interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0150 start.`);
      Settings.createWindow('testability/pages/component/text/TextChipStyleEnhancement/TextChipStyleEnhancement0150')
      let driver: Driver = Driver.create();
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      // 点击设置BackgroundColor actived: 2按钮
      let buttonSetBackgroundColorActived = await driver.waitForComponent(ON.id('button_set_background_color_actived'), 3000)
      if (buttonSetBackgroundColorActived) {
        await buttonSetBackgroundColorActived.click()
        await Utils.sleep(2000)
      }
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0150 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0160
     * @tc.name   : Text chip styleenhancement
     * @tc.desc   : Verify text chip styleenhancement interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0160 start.`);
      Settings.createWindow('testability/pages/component/text/TextChipStyleEnhancement/TextChipStyleEnhancement0160')
      let driver: Driver = Driver.create();
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      // 点击设置BackgroundColor actived: 3按钮
      let buttonSetBackgroundColorActived = await driver.waitForComponent(ON.id('button_set_background_color_actived'), 3000)
      if (buttonSetBackgroundColorActived) {
        await buttonSetBackgroundColorActived.click()
        await Utils.sleep(2000)
      }
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0160 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0170
     * @tc.name   : Text chip styleenhancement
     * @tc.desc   : Verify text chip styleenhancement interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0170 start.`);
      Settings.createWindow('testability/pages/component/text/TextChipStyleEnhancement/TextChipStyleEnhancement0170')
      let driver: Driver = Driver.create();
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      // 点击设置BackgroundColor actived: 4按钮
      let buttonSetBackgroundColorActived = await driver.waitForComponent(ON.id('button_set_background_color_actived'), 3000)
      if (buttonSetBackgroundColorActived) {
        await buttonSetBackgroundColorActived.click()
        await Utils.sleep(2000)
      }
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0180
     * @tc.name   : Text chip styleenhancement
     * @tc.desc   : Verify text chip styleenhancement interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0180 start.`);
      Settings.createWindow('testability/pages/component/text/TextChipStyleEnhancement/TextChipStyleEnhancement0180')
      let driver: Driver = Driver.create();
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      // 点击设置BackgroundColor actived: 2按钮
      let buttonSetBackgroundColorActived = await driver.waitForComponent(ON.id('button_set_background_color_actived'), 3000)
      if (buttonSetBackgroundColorActived) {
        await buttonSetBackgroundColorActived.click()
        await Utils.sleep(2000)
      }
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      // 点击设置FontColor actived: 1按钮
      let buttonSetFontColorActived = await driver.waitForComponent(ON.id('button_set_font_color_actived'), 3000)
      if (buttonSetFontColorActived) {
        await buttonSetFontColorActived.click()
        await Utils.sleep(2000)
      }
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      // 点击设置FillColor actived: 1按钮
      let buttonSetFillColorActived = await driver.waitForComponent(ON.id('button_set_fill_color_actived'), 3000)
      if (buttonSetFillColorActived) {
        await buttonSetFillColorActived.click()
        await Utils.sleep(2000)
      }
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0180 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0190
     * @tc.name   : Text chip styleenhancement
     * @tc.desc   : Verify text chip styleenhancement interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0190 start.`);
      Settings.createWindow('testability/pages/component/text/TextChipStyleEnhancement/TextChipStyleEnhancement0190')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0190 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0220
     * @tc.name   : Text chip styleenhancement
     * @tc.desc   : Verify text chip styleenhancement interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0220', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0220 start.`);
      Settings.createWindow('testability/pages/component/text/TextChipStyleEnhancement/TextChipStyleEnhancement0220')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_CHIP_STYLEENHANCEMENT_0220 finish.`);
      done()
    })

  })
}