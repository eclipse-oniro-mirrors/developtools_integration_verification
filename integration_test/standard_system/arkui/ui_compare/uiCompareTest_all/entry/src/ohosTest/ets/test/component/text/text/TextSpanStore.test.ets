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
import { BusinessError } from '@kit.BasicServicesKit'

export default function textSpanStoreTest() {
  describe('textSpanStoreTest', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        return
      }

      Settings.windowClass.destroyWindow((err: BusinessError) => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0030
     * @tc.name   : Text span store
     * @tc.desc   : Verify text span store interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0030 start.`);
      Settings.createWindow('testability/pages/component/text/text/textSpanStore01')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤1: selection设置start/end在表情中间
      let textComponent: Component = await driver.waitForComponent(ON.id('text_span_store_01'), 1000);
      // 设置selection在表情中间（假设表情在位置1，选择位置0-2）
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0030_01')
      await Utils.sleep(1000)

      // 步骤2: 复制内容，查看回调
      // 长按选中文本后复制
      let copyButton: Component = await driver.waitForComponent(ON.id('copy_button_01'), 1000);
      await copyButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0030_02')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0040
     * @tc.name   : Text span store
     * @tc.desc   : Verify text span store interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0040 start.`);
      Settings.createWindow('testability/pages/component/text/text/textSpanStore02')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤1: selection设置start/end在表情中间
      let textComponent: Component = await driver.waitForComponent(ON.id('text_span_store_02'), 1000);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0040_01')
      await Utils.sleep(1000)

      // 步骤2: 拖拽文本至输入框
      // 长按选中文本后拖拽
      await textComponent.longClick();
      await driver.waitForIdle(500, 2000);
      let textInputComponent: Component = await driver.waitForComponent(ON.id('text_input_02'), 1000);
      let textBounds = await textComponent.getBounds();
      let inputBounds = await textInputComponent.getBounds();
      // 拖拽从文本到输入框
      await driver.swipe(textBounds.left + 50, textBounds.top + 50, inputBounds.left + 50, inputBounds.top + 50, 500);
      await driver.waitForIdle(1000, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0040_02')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0050
     * @tc.name   : Text span store
     * @tc.desc   : Verify text span store interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0050 start.`);
      Settings.createWindow('testability/pages/component/text/text/textSpanStore03')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤1: 长按选中文本后拖动手柄
      let textComponent: Component = await driver.waitForComponent(ON.id('text_span_store_03'), 1000);
      await textComponent.longClick();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0050_01')
      await Utils.sleep(1000)

      // 拖动手柄
      let bounds = await textComponent.getBounds();
      await driver.swipe(bounds.left + 50, bounds.top + 50, bounds.left + 100, bounds.top + 50, 300);
      await driver.waitForIdle(1000, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0050_02')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0060
     * @tc.name   : Text span store
     * @tc.desc   : Verify text span store interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0060 start.`);
      Settings.createWindow('testability/pages/component/text/text/textSpanStore04')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤1: 查看表情显示
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0060')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0070
     * @tc.name   : Text span store
     * @tc.desc   : Verify text span store interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0070 start.`);
      Settings.createWindow('testability/pages/component/text/text/textSpanStore05')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤1: 查看表情显示
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0070')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0080
     * @tc.name   : Text span store
     * @tc.desc   : Verify text span store interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0080 start.`);
      Settings.createWindow('testability/pages/component/text/text/textSpanStore06')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤1: 查看表情显示
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0080')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0090
     * @tc.name   : Text span store
     * @tc.desc   : Verify text span store interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0090 start.`);
      Settings.createWindow('testability/pages/component/text/text/textSpanStore07')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤1: 查看表情显示
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0090')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0100
     * @tc.name   : Text span store
     * @tc.desc   : Verify text span store interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0100 start.`);
      Settings.createWindow('testability/pages/component/text/text/textSpanStore08')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤1: 查看表情显示
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0100')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0100 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0110
     * @tc.name   : Text span store
     * @tc.desc   : Verify text span store interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0110 start.`);
      Settings.createWindow('testability/pages/component/text/text/textSpanStore09')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤1: 查看表情显示
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0110')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0120
     * @tc.name   : Text span store
     * @tc.desc   : Verify text span store interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0120 start.`);
      Settings.createWindow('testability/pages/component/text/text/textSpanStore10')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤1: 查看表情显示
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0120')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0130
     * @tc.name   : Text span store
     * @tc.desc   : Verify text span store interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0130 start.`);
      Settings.createWindow('testability/pages/component/text/text/textSpanStore11')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤1: 查看表情显示
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0130')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0130 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0140
     * @tc.name   : Text span store
     * @tc.desc   : Verify text span store interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0140 start.`);
      Settings.createWindow('testability/pages/component/text/text/textSpanStore12')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤1: 查看表情显示
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0140')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0140 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0150
     * @tc.name   : Text span store
     * @tc.desc   : Verify text span store interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0150 start.`);
      Settings.createWindow('testability/pages/component/text/text/textSpanStore13')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤1: 查看表情显示
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0150')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0150 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0160
     * @tc.name   : Text span store
     * @tc.desc   : Verify text span store interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0160 start.`);
      Settings.createWindow('testability/pages/component/text/text/textSpanStore14')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤1: replaceString替换部分表情
      let replaceButton: Component = await driver.waitForComponent(ON.id('replace_button_14'), 1000);
      await replaceButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0160')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0160 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0170
     * @tc.name   : Text span store
     * @tc.desc   : Verify text span store interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0170 start.`);
      Settings.createWindow('testability/pages/component/text/text/textSpanStore15')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤1: insertString在表情中间插入
      let insertButton: Component = await driver.waitForComponent(ON.id('insert_button_15'), 1000);
      await insertButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0170')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0180
     * @tc.name   : Text span store
     * @tc.desc   : Verify text span store interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0180 start.`);
      Settings.createWindow('testability/pages/component/text/text/textSpanStore16')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤1: removeString在移除部分表情
      let removeButton: Component = await driver.waitForComponent(ON.id('remove_button_16'), 1000);
      await removeButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0180')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0180 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0190
     * @tc.name   : Text span store
     * @tc.desc   : Verify text span store interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0190 start.`);
      Settings.createWindow('testability/pages/component/text/text/textSpanStore17')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤1: replaceStyle替换部分表情样式
      let replaceStyleButton: Component = await driver.waitForComponent(ON.id('replace_style_button_17'), 1000);
      await replaceStyleButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0190')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0190 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0200
     * @tc.name   : Text span store
     * @tc.desc   : Verify text span store interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0200', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0200 start.`);
      Settings.createWindow('testability/pages/component/text/text/textSpanStore18')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤1: setStyle设置部分表情样式
      let setStyleButton: Component = await driver.waitForComponent(ON.id('set_style_button_18'), 1000);
      await setStyleButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0200')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0200 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0210
     * @tc.name   : Text span store
     * @tc.desc   : Verify text span store interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0210', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0210 start.`);
      Settings.createWindow('testability/pages/component/text/text/textSpanStore19')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤1: removeStyle清除部分表情的属性样式
      let removeStyleButton: Component = await driver.waitForComponent(ON.id('remove_style_button_19'), 1000);
      await removeStyleButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0210')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0210 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0220
     * @tc.name   : Text span store
     * @tc.desc   : Verify text span store interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0220', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0220 start.`);
      Settings.createWindow('testability/pages/component/text/text/textSpanStore20')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤1: removeStyles清除部分表情的所有样式
      let removeStylesButton: Component = await driver.waitForComponent(ON.id('remove_styles_button_20'), 1000);
      await removeStylesButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0220')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0220 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0230
     * @tc.name   : Text span store
     * @tc.desc   : Verify text span store interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0230', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0230 start.`);
      Settings.createWindow('testability/pages/component/text/text/textSpanStore21')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤1: clearStyles清除所有样式
      let clearStylesButton: Component = await driver.waitForComponent(ON.id('clear_styles_button_21'), 1000);
      await clearStylesButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0230')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0230 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0240
     * @tc.name   : Text span store
     * @tc.desc   : Verify text span store interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0240', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0240 start.`);
      Settings.createWindow('testability/pages/component/text/text/textSpanStore22')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤1: replaceStyledString替换部分表情为新的属性字符串
      let replaceStyledStringButton: Component = await driver.waitForComponent(ON.id('replace_styled_string_button_22'), 1000);
      await replaceStyledStringButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0240')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0240 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0250
     * @tc.name   : Text span store
     * @tc.desc   : Verify text span store interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0250', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0250 start.`);
      Settings.createWindow('testability/pages/component/text/text/textSpanStore23')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤1: insertStyledString在表情中间插入新的属性字符串
      let insertStyledStringButton: Component = await driver.waitForComponent(ON.id('insert_styled_string_button_23'), 1000);
      await insertStyledStringButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0250')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0250 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0260
     * @tc.name   : Text span store
     * @tc.desc   : Verify text span store interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0260', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0260 start.`);
      Settings.createWindow('testability/pages/component/text/text/textSpanStore24')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤1: appendStyledString追加新的属性字符串
      let appendStyledStringButton: Component = await driver.waitForComponent(ON.id('append_styled_string_button_24'), 1000);
      await appendStyledStringButton.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0260')
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_SPAN_STORE_0260 finish.`);
      done()
    })
  })
}
