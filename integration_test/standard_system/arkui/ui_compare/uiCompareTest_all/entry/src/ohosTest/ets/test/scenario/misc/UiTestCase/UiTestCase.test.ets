/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

export default function uiTestCase() {

  describe('uiTestCase', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0010
     * @tc.name   : Set fontFeature to the ss04 attribute
     * @tc.desc   : Verify text common fontfeature interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0010', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0010 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UiTestCase/UiTestCase01')
      let driver: Driver=Driver.create()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0011
     * @tc.name   : Set fontFeature to the ss03 attribute
     * @tc.desc   : Verify text common fontfeature interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0011', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0011 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UiTestCase/UiTestCase02')
      let driver: Driver=Driver.create()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0011 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0012
     * @tc.name   : Set fontFeature to the case
     * @tc.desc   : Verify text common fontfeature interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0012', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0012 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UiTestCase/UiTestCase03')
      let driver: Driver=Driver.create()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0012 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0013
     * @tc.name   : Set fontFeature to the ordn property
     * @tc.desc   : Verify text common fontfeature interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0013', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0013 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UiTestCase/UiTestCase04')
      let driver: Driver=Driver.create()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0013 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0015
     * @tc.name   : Set fontFeature to the sups property
     * @tc.desc   : Verify text common fontfeature interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0015', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0015 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UiTestCase/UiTestCase05')
      let driver: Driver=Driver.create()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0015 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0016
     * @tc.name   : Set fontFeature to the tnum property
     * @tc.desc   : Verify text common fontfeature interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0016', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0016 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UiTestCase/UiTestCase06')
      let driver: Driver=Driver.create()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0016 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0014
     * @tc.name   : Set fontFeature to the locl property
     * @tc.desc   : Verify text common fontfeature interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0014', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0014 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UiTestCase/UiTestCase07')
      let driver: Driver=Driver.create()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0014 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0017
     * @tc.name   : Set fontFeature to the fwid property
     * @tc.desc   : Verify text common fontfeature interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0017', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0017 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UiTestCase/UiTestCase08')
      let driver: Driver=Driver.create()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0017 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0018
     * @tc.name   : Set fontFeature to the ss05 property
     * @tc.desc   : Verify text common fontfeature interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0018', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0018 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UiTestCase/UiTestCase09')
      let driver: Driver=Driver.create()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0018 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0021
     * @tc.name   : Set fontFeature to the numr property
     * @tc.desc   : Verify text common fontfeature interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0021', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0021 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UiTestCase/UiTestCase10')
      let driver: Driver=Driver.create()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0021 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0022
     * @tc.name   : Set fontFeature to the pnum property
     * @tc.desc   : Verify text common fontfeature interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0022', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0022 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UiTestCase/UiTestCase11')
      let driver: Driver=Driver.create()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0022 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0024
     * @tc.name   : Set fontFeature to the sinf property
     * @tc.desc   : Verify text common fontfeature interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0024', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0024 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UiTestCase/UiTestCase12')
      let driver: Driver=Driver.create()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0024 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0027
     * @tc.name   : Set fontFeature to the sups property
     * @tc.desc   : Verify text common fontfeature interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0027', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0027 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UiTestCase/UiTestCase13')
      let driver: Driver=Driver.create()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0027 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0031
     * @tc.name   : Set fontFeature to the ss06 property
     * @tc.desc   : Verify text common fontfeature interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0031', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0031 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UiTestCase/UiTestCase14')
      let driver: Driver=Driver.create()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0031 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0032
     * @tc.name   : Set fontFeature to a different property value sups|subs
     * @tc.desc   : Verify text common fontfeature interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0032', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0032 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UiTestCase/UiTestCase15')
      let driver: Driver=Driver.create()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0032 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0042
     * @tc.name   : Set fontFeature to liga
     * @tc.desc   : Verify text common fontfeature interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0042', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0042 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UiTestCase/UiTestCase16')
      let driver: Driver=Driver.create()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0042 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0039
     * @tc.name   : Set fontFeature to null/undefined
     * @tc.desc   : Verify text common fontfeature interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0039', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0039 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UiTestCase/UiTestCase17')
      let driver: Driver=Driver.create()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0039 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0038
     * @tc.name   : Set fontFeature to frac
     * @tc.desc   : Verify text common fontfeature interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0038', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0038 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UiTestCase/UiTestCase18')
      let driver: Driver=Driver.create()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0038 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0046
     * @tc.name   : The span of a subcomponent of the text component supports setting the fontFeature property
     * @tc.desc   : Verify text common fontfeature interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0046', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0046 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UiTestCase/UiTestCase19')
      let driver: Driver=Driver.create()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0046 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0029
     * @tc.name   : Set fontFeature to ss02
     * @tc.desc   : Verify text common fontfeature interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0029', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0029 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UiTestCase/UiTestCase20')
      let driver: Driver=Driver.create()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0029 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0036
     * @tc.name   : Set fontFeature to ss01
     * @tc.desc   : Verify text common fontfeature interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0036', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0036 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UiTestCase/UiTestCase21')
      let driver: Driver=Driver.create()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0036 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0045
     * @tc.name   : Set multiple different types of property values
     * @tc.desc   : Verify text common fontfeature interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0045', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0045 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UiTestCase/UiTestCase22')
      let driver: Driver=Driver.create()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0045 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0025
     * @tc.name   : Set fontFeature to ss08
     * @tc.desc   : Verify text common fontfeature interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0025', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0025 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UiTestCase/UiTestCase23')
      let driver: Driver=Driver.create()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0045 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0028
     * @tc.name   : Set fontFeature to ss09
     * @tc.desc   : Verify text common fontfeature interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0028', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0028 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UiTestCase/UiTestCase24')
      let driver: Driver=Driver.create()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0028 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0020
     * @tc.name   : Set superscript/subscript properties at the same time
     * @tc.desc   : Verify text common fontfeature interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0020', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0020 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UiTestCase/UiTestCase25')
      let driver: Driver=Driver.create()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0030
     * @tc.name   : Set the property value to normal
     * @tc.desc   : Verify text common fontfeature interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0030', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0030 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UiTestCase/UiTestCase26')
      let driver: Driver=Driver.create()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0035
     * @tc.name   : Attribute value setting outlier "1" | 0”
     * @tc.desc   : Verify text common fontfeature interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0035', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0035 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UiTestCase/UiTestCase27')
      let driver: Driver=Driver.create()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0035 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0034
     * @tc.name   : The attribute value is set to an illegal value
     * @tc.desc   : Verify text common fontfeature interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0034', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0034 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UiTestCase/UiTestCase28')
      let driver: Driver=Driver.create()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0034 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0040
     * @tc.name   : The attribute value is set to an exception string value
     * @tc.desc   : Verify text common fontfeature interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0040', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0040 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UiTestCase/UiTestCase29')
      let driver: Driver=Driver.create()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0033
     * @tc.name   : The attribute value is set to the normal value on | off
     * @tc.desc   : Verify text common fontfeature interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0033', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0033 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UiTestCase/UiTestCase30')
      let driver: Driver=Driver.create()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0033 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0043
     * @tc.name   : The attribute value is set to a normal value of 1 | 0
     * @tc.desc   : Verify text common fontfeature interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0043', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0043 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UiTestCase/UiTestCase31')
      let driver: Driver=Driver.create()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0043 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0044
     * @tc.name   : Set the fontFeature multiple times
     * @tc.desc   : Verify text common fontfeature interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0044', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0044 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UiTestCase/UiTestCase32')
      let driver: Driver=Driver.create()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0044 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0048
     * @tc.name   : Set fontFeature to the hwid property
     * @tc.desc   : Verify text common fontfeature interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0048', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0048 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UiTestCase/UiTestCase33')
      let driver: Driver=Driver.create()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0048 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0019
     * @tc.name   : The value of the on|off attribute is not set
     * @tc.desc   : Verify text common fontfeature interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0019', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0019 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UiTestCase/UiTestCase34')
      let driver: Driver=Driver.create()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0019 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0041
     * @tc.name   : In inline mode (TextArea/TextInput), set the fontFeature text style
     * @tc.desc   : Verify text common fontfeature interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0041', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0041 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UiTestCase/UiTestCase35')
      let driver: Driver=Driver.create()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0041 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0037
     * @tc.name   : Dynamically switch the style mode of the component to view the display of text styles
     * @tc.desc   : Verify text common fontfeature interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0037', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0037 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UiTestCase/UiTestCase36')
      let driver: Driver=Driver.create()
      let button: Component = await driver.waitForComponent(ON.id('UiTestCase36'),1000)
      await button.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0037 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0023
     * @tc.name   : Dynamically switch the style mode of the component to view the display of text styles
     * @tc.desc   : Verify text common fontfeature interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0023', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0023 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UiTestCase/UiTestCase37')
      await Utils.sleep(1000)
      let driver: Driver=Driver.create()
      await driver.waitForIdle(500,2000)
      await driver.longClick(60,100)
      await driver.waitForIdle(500,2000)
      await driver.mouseClick({x:300, y:200}, MouseButton.MOUSE_BUTTON_LEFT, 2072);
      await driver.mouseClick({x:150, y:200}, MouseButton.MOUSE_BUTTON_LEFT, 2072);
      await driver.longClick(60,300)
      await driver.waitForIdle(500,2000)
      await driver.mouseClick({x:60, y:230}, MouseButton.MOUSE_BUTTON_LEFT, 2072)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0023 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXTAREA_SELECTION_0080
     * @tc.name   : The start position is less than 0 and the end position is equal to 0
     * @tc.desc   : Verify text textarea selection interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXTAREA_SELECTION_0080', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXTAREA_SELECTION_0080 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UiTestCase/UiTestCase38')
      let driver: Driver=Driver.create()
      let button: Component = await driver.waitForComponent(ON.id('UiTestCase38_button'),1000)
      let text: Component = await driver.waitForComponent(ON.id('UiTestCase38_text'),1000)
      await text.inputText('aaaa')
      await button.click()
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_TEXTAREA_SELECTION_0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0047
     * @tc.name   : Set fontFeature to vert
     * @tc.desc   : Verify text common fontfeature interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0047', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0047 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UiTestCase/UiTestCase39')
      let driver: Driver=Driver.create()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0047 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0026
     * @tc.name   : Set fontFeature to ss07
     * @tc.desc   : Verify text common fontfeature interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0026', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0026 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UiTestCase/UiTestCase40')
      let driver: Driver=Driver.create()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_COMMON_FONTFEATURE_0026 finish.`);
      done()
    })
  })
}