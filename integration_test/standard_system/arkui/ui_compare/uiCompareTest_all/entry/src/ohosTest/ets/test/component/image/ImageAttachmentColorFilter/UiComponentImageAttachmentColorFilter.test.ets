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

export default function uiComponentImageAttachmentColorFilter() {

  describe('uiComponentImageAttachmentColorFilter', () => {
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
     * @tc.number : SUB_ACE_UI_IMPORT_COMPONENTCONTENT_0080
     * @tc.name   : Set the ImageAttachment property string to add an image, and set colorFilter and objectFit at the same time
     * @tc.desc   : Verify import componentcontent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_IMPORT_COMPONENTCONTENT_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_IMPORT_COMPONENTCONTENT_0080 start.`);
      Settings.createWindow('testability/pages/component/image/ImageAttachmentColorFilter/UiComponentImageAttachmentColorFilter01')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentImageAttachmentColorFilter01_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentImageAttachmentColorFilter01_02'),1000);
      await button01.click()
      await driver.waitForIdle(500,2000)
      await button02.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_IMPORT_COMPONENTCONTENT_0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0090
     * @tc.name   : Set the ImageAttachment property string to add an image, and set colorFilter and layoutStyle at the same time
     * @tc.desc   : Verify imageattachment colorfilter interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0090 start.`);
      Settings.createWindow('testability/pages/component/image/ImageAttachmentColorFilter/UiComponentImageAttachmentColorFilter02')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentImageAttachmentColorFilter02_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentImageAttachmentColorFilter02_02'),1000);
      await button01.click()
      await driver.waitForIdle(500,2000)
      await button02.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0070
     * @tc.name   : Set the ImageAttachment property string to add an image, and set colorFilter and verticalAlign at the same time
     * @tc.desc   : Verify imageattachment colorfilter interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0070 start.`);
      Settings.createWindow('testability/pages/component/image/ImageAttachmentColorFilter/UiComponentImageAttachmentColorFilter03')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentImageAttachmentColorFilter03_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentImageAttachmentColorFilter03_02'),1000);
      await button01.click()
      await driver.waitForIdle(500,2000)
      await button02.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0060
     * @tc.name   : Set the ImageAttachment property string to add an image, and set colorFilter and size at the same time
     * @tc.desc   : Verify imageattachment colorfilter interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0060 start.`);
      Settings.createWindow('testability/pages/component/image/ImageAttachmentColorFilter/UiComponentImageAttachmentColorFilter04')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentImageAttachmentColorFilter04_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentImageAttachmentColorFilter04_02'),1000);
      await button01.click()
      await driver.waitForIdle(500,2000)
      await button02.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0030
     * @tc.name   : Set the ImageAttachment property string to add an image, and set the colorFilter to 19 bits
     * @tc.desc   : Verify imageattachment colorfilter interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0030 start.`);
      Settings.createWindow('testability/pages/component/image/ImageAttachmentColorFilter/UiComponentImageAttachmentColorFilter05')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentImageAttachmentColorFilter05_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentImageAttachmentColorFilter05_02'),1000);
      await button01.click()
      await driver.waitForIdle(500,2000)
      await button02.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0020
     * @tc.name   : Set the ImageAttachment property string to add an image, and set the colorFilter to 20 bits
     * @tc.desc   : Verify imageattachment colorfilter interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0020 start.`);
      Settings.createWindow('testability/pages/component/image/ImageAttachmentColorFilter/UiComponentImageAttachmentColorFilter06')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentImageAttachmentColorFilter06_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentImageAttachmentColorFilter06_02'),1000);
      await button01.click()
      await driver.waitForIdle(500,2000)
      await button02.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0100
     * @tc.name   : Set the ImageAttachment property string to add an image, set a colorFilter, and use replaceString to replace the image with text
     * @tc.desc   : Verify imageattachment colorfilter interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0100 start.`);
      Settings.createWindow('testability/pages/component/image/ImageAttachmentColorFilter/UiComponentImageAttachmentColorFilter07')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentImageAttachmentColorFilter07_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentImageAttachmentColorFilter07_02'),1000);
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentImageAttachmentColorFilter07_03'),1000);
      await button01.click()
      await driver.waitForIdle(500,2000)
      await button03.click()
      await driver.waitForIdle(500,2000)
      await button02.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0100 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0110
     * @tc.name   : Set the ImageAttachment property string to add an image, set the colorFilter, and use insertString to insert text before and after the image
     * @tc.desc   : Verify imageattachment colorfilter interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0110 start.`);
      Settings.createWindow('testability/pages/component/image/ImageAttachmentColorFilter/UiComponentImageAttachmentColorFilter08')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentImageAttachmentColorFilter08_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentImageAttachmentColorFilter08_02'),1000);
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentImageAttachmentColorFilter08_03'),1000);
      let button04: Component = await driver.waitForComponent(ON.id('UiComponentImageAttachmentColorFilter08_04'),1000);
      await button01.click()
      await driver.waitForIdle(500,2000)
      await button04.click()
      await driver.waitForIdle(500,2000)
      await button03.click()
      await driver.waitForIdle(500,2000)
      await button02.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0200
     * @tc.name   : Set the ImageAttachment property string to add an image, set the colorFilter, and use appendStyledString to insert a new image
     * @tc.desc   : Verify imageattachment colorfilter interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0200', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0200 start.`);
      Settings.createWindow('testability/pages/component/image/ImageAttachmentColorFilter/UiComponentImageAttachmentColorFilter09')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentImageAttachmentColorFilter09_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentImageAttachmentColorFilter09_02'),1000);
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentImageAttachmentColorFilter09_03'),1000);
      await button01.click()
      await driver.waitForIdle(500,2000)
      await button03.click()
      await driver.waitForIdle(500,2000)
      await button02.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0200 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0190
     * @tc.name   : Set the ImageAttachment property string to add an image, set the colorFilter, and use insertStyledString to insert a new image
     * @tc.desc   : Verify imageattachment colorfilter interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0190 start.`);
      Settings.createWindow('testability/pages/component/image/ImageAttachmentColorFilter/UiComponentImageAttachmentColorFilter10')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentImageAttachmentColorFilter10_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentImageAttachmentColorFilter10_02'),1000);
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentImageAttachmentColorFilter10_03'),1000);
      await button01.click()
      await driver.waitForIdle(500,2000)
      await button03.click()
      await driver.waitForIdle(500,2000)
      await button02.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0190 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0180
     * @tc.name   : Set the ImageAttachment property string to add an image, set the colorFilter, and use replaceStyledString to insert a new image
     * @tc.desc   : Verify imageattachment colorfilter interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0180 start.`);
      Settings.createWindow('testability/pages/component/image/ImageAttachmentColorFilter/UiComponentImageAttachmentColorFilter11')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentImageAttachmentColorFilter11_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentImageAttachmentColorFilter11_02'),1000);
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentImageAttachmentColorFilter11_03'),1000);
      await button01.click()
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button03.click()
      await driver.waitForIdle(500,2000)
      await button02.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0180 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0040
     * @tc.name   : Set ImageAttachment with colorFilter 21 bits
     * @tc.desc   : Verify imageattachment colorfilter interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0040 start.`);
      Settings.createWindow('testability/pages/component/image/ImageAttachmentColorFilter/UiComponentImageAttachmentColorFilter12')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('UiComponentImageAttachmentColorFilter12_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentImageAttachmentColorFilter12_02'),1000);
      windowSnap.snapShot()
      await button.click()
      await button02.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0050
     * @tc.name   : Set ImageAttachment with colorFilter null/undefined
     * @tc.desc   : Verify imageattachment colorfilter interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0050 start.`);
      Settings.createWindow('testability/pages/component/image/ImageAttachmentColorFilter/UiComponentImageAttachmentColorFilter13')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentImageAttachmentColorFilter13_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentImageAttachmentColorFilter13_02'),1000);
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      await button02.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0120
     * @tc.name   : Set ImageAttachment with colorFilter and removeString
     * @tc.desc   : Verify imageattachment colorfilter interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0120 start.`);
      Settings.createWindow('testability/pages/component/image/ImageAttachmentColorFilter/UiComponentImageAttachmentColorFilter14')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentImageAttachmentColorFilter14_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentImageAttachmentColorFilter14_02'),1000);
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentImageAttachmentColorFilter14_03'),1000);
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button02.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button03.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0130
     * @tc.name   : Set ImageAttachment with colorFilter and replaceStyle
     * @tc.desc   : Verify imageattachment colorfilter interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0130 start.`);
      Settings.createWindow('testability/pages/component/image/ImageAttachmentColorFilter/UiComponentImageAttachmentColorFilter15')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentImageAttachmentColorFilter15_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentImageAttachmentColorFilter15_02'),1000);
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentImageAttachmentColorFilter15_03'),1000);
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button02.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button03.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0130 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0140
     * @tc.name   : Set ImageAttachment with colorFilter and setStyle
     * @tc.desc   : Verify imageattachment colorfilter interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0140 start.`);
      Settings.createWindow('testability/pages/component/image/ImageAttachmentColorFilter/UiComponentImageAttachmentColorFilter16')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentImageAttachmentColorFilter16_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentImageAttachmentColorFilter16_02'),1000);
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentImageAttachmentColorFilter16_03'),1000);
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button02.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button03.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0140 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0150
     * @tc.name   : Set ImageAttachment with colorFilter and clearStyles
     * @tc.desc   : Verify imageattachment colorfilter interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0150 start.`);
      Settings.createWindow('testability/pages/component/image/ImageAttachmentColorFilter/UiComponentImageAttachmentColorFilter17')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentImageAttachmentColorFilter17_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentImageAttachmentColorFilter17_02'),1000);
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentImageAttachmentColorFilter17_03'),1000);
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button02.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button03.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0150 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0160
     * @tc.name   : Set ImageAttachment with colorFilter and removeStyle
     * @tc.desc   : Verify imageattachment colorfilter interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0160 start.`);
      Settings.createWindow('testability/pages/component/image/ImageAttachmentColorFilter/UiComponentImageAttachmentColorFilter18')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentImageAttachmentColorFilter18_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentImageAttachmentColorFilter18_02'),1000);
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentImageAttachmentColorFilter18_03'),1000);
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button02.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button03.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0160 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0170
     * @tc.name   : Set ImageAttachment with colorFilter and removeStyles
     * @tc.desc   : Verify imageattachment colorfilter interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0170 start.`);
      Settings.createWindow('testability/pages/component/image/ImageAttachmentColorFilter/UiComponentImageAttachmentColorFilter19')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentImageAttachmentColorFilter19_01'),1000);
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentImageAttachmentColorFilter19_02'),1000);
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentImageAttachmentColorFilter19_03'),1000);
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button02.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button03.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0220
     * @tc.name   : Set ImageAttachment with colorFilter in RichEditor
     * @tc.desc   : Verify imageattachment colorfilter interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0220', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0220 start.`);
      Settings.createWindow('testability/pages/component/image/ImageAttachmentColorFilter/UiComponentImageAttachmentColorFilter21')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('UiComponentImageAttachmentColorFilter21_01'),1000);
      windowSnap.snapShot()
      await button.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_IMAGEATTACHMENT_COLORFILTER_0220 finish.`);
      done()
    })

  })
}