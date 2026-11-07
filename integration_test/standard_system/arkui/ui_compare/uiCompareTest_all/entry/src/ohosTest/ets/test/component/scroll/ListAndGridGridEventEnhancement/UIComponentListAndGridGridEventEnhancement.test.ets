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

export default function uIComponentListAndGridGridEventEnhancement() {

  describe('uIComponentListAndGridGridEventEnhancement', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_EVENTENHANCEMENT_0070_700
     * @tc.name   : Verify that Grid gesture scroll to bottom triggers onReachEnd event
     * @tc.desc   : Verify listandgrid grid eventenhancement interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_EVENTENHANCEMENT_0070_700', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_EVENTENHANCEMENT_0070_700 start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridGridEventEnhancement/UIComponentListAndGridGridEventEnhancement01')
      let driver:Driver=Driver.create();
      let grid: Component = await driver.waitForComponent(ON.id('UIComponentListAndGridGridEventEnhancement01'),1000);
      await grid.scrollToBottom();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_EVENTENHANCEMENT_0070_700 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_EVENTENHANCEMENT_0130_363
     * @tc.name   : Verify that Grid gesture sliding triggers onScrollStart event
     * @tc.desc   : Verify listandgrid grid eventenhancement interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_EVENTENHANCEMENT_0130_363', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_EVENTENHANCEMENT_0130_363 start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridGridEventEnhancement/UIComponentListAndGridGridEventEnhancement02')
      let driver:Driver=Driver.create();
      let grid: Component = await driver.waitForComponent(ON.id('UIComponentListAndGridGridEventEnhancement02'),1000);
      await grid.scrollToBottom();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_EVENTENHANCEMENT_0130_363 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_EVENTENHANCEMENT_0180_821
     * @tc.name   : Verify that Grid gesture sliding stop triggers onScrollStop event
     * @tc.desc   : Verify listandgrid grid eventenhancement interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_EVENTENHANCEMENT_0180_821', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_EVENTENHANCEMENT_0180_821 start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridGridEventEnhancement/UIComponentListAndGridGridEventEnhancement03')
      let driver:Driver=Driver.create();
      let grid: Component = await driver.waitForComponent(ON.id('UIComponentListAndGridGridEventEnhancement03'),1000);
      await grid.scrollToBottom();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_EVENTENHANCEMENT_0180_821 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_EVENTENHANCEMENT_0260_461
     * @tc.name   : Verify that finger sliding Grid triggers onScrollFrameBegin event
     * @tc.desc   : Verify listandgrid grid eventenhancement interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_EVENTENHANCEMENT_0260_461', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_EVENTENHANCEMENT_0260_461 start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridGridEventEnhancement/UIComponentListAndGridGridEventEnhancement04')
      let driver:Driver=Driver.create();
      let grid: Component = await driver.waitForComponent(ON.id('UIComponentListAndGridGridEventEnhancement04'),1000);
      await grid.scrollToBottom();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_EVENTENHANCEMENT_0260_461 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_EVENTENHANCEMENT_0300_438
     * @tc.name   : Verify that gesture sliding component triggers onScrollIndex event
     * @tc.desc   : Verify listandgrid grid eventenhancement interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_EVENTENHANCEMENT_0300_438', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_EVENTENHANCEMENT_0300_438 start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridGridEventEnhancement/UIComponentListAndGridGridEventEnhancement05')
      let driver:Driver=Driver.create();
      let grid: Component = await driver.waitForComponent(ON.id('UIComponentListAndGridGridEventEnhancement05'),1000);
      await grid.scrollToBottom();
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_GRID_EVENTENHANCEMENT_0300_438 finish.`);
      done()
    })


  })
}