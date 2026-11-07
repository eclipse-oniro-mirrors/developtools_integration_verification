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

export default function uiComponentSpecialComponentsUiContextAbility() {

  describe('uiComponentSpecialComponentsUiContextAbility', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ABILITY_0010
     * @tc.name   : In singleton mode, bundleCodeDir's getHostContext obtains the installation package directory
     * @tc.desc   : Verify special components uicontext ability interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ABILITY_0010', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ABILITY_0010 start.`);
      Settings.createWindow('testability/pages/component/embedded/SpecialComponentsUiContextAbility/UiComponentSpecialComponentsUiContextAbility01')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentSpecialComponentsUiContextAbility01'),1000);
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ABILITY_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ABILITY_0020
     * @tc.name   : In singleton mode, cacheDir's getHostContext obtains the cache directory
     * @tc.desc   : Verify special components uicontext ability interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ABILITY_0020', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ABILITY_0020 start.`);
      Settings.createWindow('testability/pages/component/embedded/SpecialComponentsUiContextAbility/UiComponentSpecialComponentsUiContextAbility02')
      let driver:Driver=Driver.create();
      let button02: Component = await driver.waitForComponent(ON.id('UiComponentSpecialComponentsUiContextAbility02'),1000);
      await button02.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ABILITY_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ABILITY_0030
     * @tc.name   : In singleton mode, databaseDir's getHostContext obtains the database directory
     * @tc.desc   : Verify special components uicontext ability interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ABILITY_0030', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ABILITY_0030 start.`);
      Settings.createWindow('testability/pages/component/embedded/SpecialComponentsUiContextAbility/UiComponentSpecialComponentsUiContextAbility03')
      let driver:Driver=Driver.create();
      let button03: Component = await driver.waitForComponent(ON.id('UiComponentSpecialComponentsUiContextAbility03'),1000);
      await button03.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ABILITY_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ABILITY_0040
     * @tc.name   : In singleton mode, distributedFilesDir's getHostContext obtains the distributed files directory
     * @tc.desc   : Verify special components uicontext ability interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ABILITY_0040', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ABILITY_0040 start.`);
      Settings.createWindow('testability/pages/component/embedded/SpecialComponentsUiContextAbility/UiComponentSpecialComponentsUiContextAbility04')
      let driver:Driver=Driver.create();
      let button04: Component = await driver.waitForComponent(ON.id('UiComponentSpecialComponentsUiContextAbility04'),1000);
      await button04.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ABILITY_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ABILITY_0050
     * @tc.name   : In singleton mode, filesDir's getHostContext obtains the files directory
     * @tc.desc   : Verify special components uicontext ability interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ABILITY_0050', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ABILITY_0050 start.`);
      Settings.createWindow('testability/pages/component/embedded/SpecialComponentsUiContextAbility/UiComponentSpecialComponentsUiContextAbility05')
      let driver:Driver=Driver.create();
      let button05: Component = await driver.waitForComponent(ON.id('UiComponentSpecialComponentsUiContextAbility05'),1000);
      await button05.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ABILITY_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ABILITY_0060
     * @tc.name   : In singleton mode, preferencesDir's getHostContext obtains the preferences directory
     * @tc.desc   : Verify special components uicontext ability interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ABILITY_0060', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ABILITY_0060 start.`);
      Settings.createWindow('testability/pages/component/embedded/SpecialComponentsUiContextAbility/UiComponentSpecialComponentsUiContextAbility06')
      let driver:Driver=Driver.create();
      let button06: Component = await driver.waitForComponent(ON.id('UiComponentSpecialComponentsUiContextAbility06'),1000);
      await button06.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ABILITY_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ABILITY_0070
     * @tc.name   : In singleton mode, resourceDir's getHostContext obtains the resource directory
     * @tc.desc   : Verify special components uicontext ability interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ABILITY_0070', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ABILITY_0070 start.`);
      Settings.createWindow('testability/pages/component/embedded/SpecialComponentsUiContextAbility/UiComponentSpecialComponentsUiContextAbility07')
      let driver:Driver=Driver.create();
      let button07: Component = await driver.waitForComponent(ON.id('UiComponentSpecialComponentsUiContextAbility07'),1000);
      await button07.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ABILITY_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ABILITY_0080
     * @tc.name   : In singleton mode, tempDir's getHostContext obtains the temporary directory
     * @tc.desc   : Verify special components uicontext ability interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ABILITY_0080', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ABILITY_0080 start.`);
      Settings.createWindow('testability/pages/component/embedded/SpecialComponentsUiContextAbility/UiComponentSpecialComponentsUiContextAbility08')
      let driver:Driver=Driver.create();
      let button08: Component = await driver.waitForComponent(ON.id('UiComponentSpecialComponentsUiContextAbility08'),1000);
      await button08.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_UICONTEXT_ABILITY_0080 finish.`);
      done()
    })

  })
}