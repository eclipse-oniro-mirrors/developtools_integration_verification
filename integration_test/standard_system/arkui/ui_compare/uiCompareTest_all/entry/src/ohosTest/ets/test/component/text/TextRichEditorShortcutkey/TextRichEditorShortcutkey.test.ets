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
import { Driver, ON, Component, MouseButton } from '@kit.TestKit'

export default function textRichEditorShortcutkey() {

  describe('textRichEditorShortcutkey', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SHORTCUTKEY_0005
     * @tc.name   : Text richeditor shortcutkey
     * @tc.desc   : Verify text richeditor shortcutkey interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SHORTCUTKEY_0005', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SHORTCUTKEY_0005 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorShortcutkey/TextRichEditorShortcutkey05')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('TextRichEditorShortcutkey05_01'), 1000);
      await driver.click(30, 80);
      await driver.waitForIdle(500,2000);
      await driver.triggerKey(2069);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SHORTCUTKEY_0005 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SHORTCUTKEY_0004
     * @tc.name   : Text richeditor shortcutkey
     * @tc.desc   : Verify text richeditor shortcutkey interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SHORTCUTKEY_0004', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SHORTCUTKEY_0004 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorShortcutkey/TextRichEditorShortcutkey05')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('TextRichEditorShortcutkey05_01'), 1000);
      await driver.click(30, 80);
      await driver.waitForIdle(500,2000);
      await driver.triggerKey(2068);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SHORTCUTKEY_0005 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SHORTCUTKEY_0003
     * @tc.name   : Text richeditor shortcutkey
     * @tc.desc   : Verify text richeditor shortcutkey interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SHORTCUTKEY_0003', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SHORTCUTKEY_0003 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorShortcutkey/TextRichEditorShortcutkey03')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('TextRichEditorShortcutkey05_01'), 1000);
      await driver.click(30, 80);
      await driver.waitForIdle(500,2000);
      await driver.triggerCombineKeys(2072,2015);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SHORTCUTKEY_0003 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SHORTCUTKEY_0001
     * @tc.name   : Text richeditor shortcutkey
     * @tc.desc   : Verify text richeditor shortcutkey interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SHORTCUTKEY_0001', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SHORTCUTKEY_0001 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorShortcutkey/TextRichEditorShortcutkey01')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('TextRichEditorShortcutkey05_01'), 1000);
      await driver.click(50, 80);
      await driver.waitForIdle(500,2000);
      await driver.triggerCombineKeys(2072,2055);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SHORTCUTKEY_0001 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SHORTCUTKEY_0002
     * @tc.name   : Text richeditor shortcutkey
     * @tc.desc   : Verify text richeditor shortcutkey interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SHORTCUTKEY_0002', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SHORTCUTKEY_0001 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorShortcutkey/TextRichEditorShortcutkey01')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('TextRichEditorShortcutkey05_01'), 1000);
      await driver.click(50, 80);
      await driver.waitForIdle(500,2000);
      await driver.triggerCombineKeys(2072,2014);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SHORTCUTKEY_0001 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SHORTCUTKEY_0006
     * @tc.name   : Text richeditor shortcutkey
     * @tc.desc   : Verify text richeditor shortcutkey interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SHORTCUTKEY_0006', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SHORTCUTKEY_0006 start.`);
      Settings.createWindow('testability/pages/component/text/TextRichEditorShortcutkey/TextRichEditorShortcutkey06')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      // 通过ID定位（推荐）
      let component = await driver.waitForComponent(ON.id('TextRichEditorShortcutkey05_01'), 1000);
      await driver.click(50, 80);
      await driver.waitForIdle(500,2000);
      await driver.mouseClick({x:100, y:80}, MouseButton.MOUSE_BUTTON_LEFT,2047);
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SHORTCUTKEY_0006 finish.`);
      done();
    })
  })
}