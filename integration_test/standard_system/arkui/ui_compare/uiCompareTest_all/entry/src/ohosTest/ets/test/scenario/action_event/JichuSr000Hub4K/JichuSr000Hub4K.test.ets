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

export default function jichuSr000Hub4K() {

  describe('jichuSr000Hub4K', () => {
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
     * @tc.number : SUB_ACE_FUNCTION_JICHU_SR000HUB4K_0010
     * @tc.name   : Function jichu sr000hub4k
     * @tc.desc   : Verify function jichu sr000hub4k interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_FUNCTION_JICHU_SR000HUB4K_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_FUNCTION_JICHU_SR000HUB4K_0010 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/JichuSr000Hub4K/JichuSr000Hub4K0010')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_FUNCTION_JICHU_SR000HUB4K_0010 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_FUNCTION_JICHU_SR000HUB4K_0020
     * @tc.name   : Function jichu sr000hub4k
     * @tc.desc   : Verify function jichu sr000hub4k interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_FUNCTION_JICHU_SR000HUB4K_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_FUNCTION_JICHU_SR000HUB4K_0020 start.`);
      // 步骤1：打开未配置message的页面
      Settings.createWindow('testability/pages/scenario/action_event/JichuSr000Hub4K/JichuSr000Hub4K0020')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 预期结果：编译报错（此页面用于验证编译错误场景）
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_FUNCTION_JICHU_SR000HUB4K_0020 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_FUNCTION_JICHU_SR000HUB4K_0030
     * @tc.name   : Function jichu sr000hub4k
     * @tc.desc   : Verify function jichu sr000hub4k interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_FUNCTION_JICHU_SR000HUB4K_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_FUNCTION_JICHU_SR000HUB4K_0030 start.`);
      // 步骤1：打开promptAction.showDialog中未配置options的页面
      Settings.createWindow('testability/pages/scenario/action_event/JichuSr000Hub4K/JichuSr000Hub4K0030')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 预期结果：编译报错
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_FUNCTION_JICHU_SR000HUB4K_0030 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_FUNCTION_JICHU_SR000HUB4K_0040
     * @tc.name   : Function jichu sr000hub4k
     * @tc.desc   : Verify function jichu sr000hub4k interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_FUNCTION_JICHU_SR000HUB4K_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_FUNCTION_JICHU_SR000HUB4K_0040 start.`);
      // 步骤1：打开promptAction.showActionMenu未设置options的页面
      Settings.createWindow('testability/pages/scenario/action_event/JichuSr000Hub4K/JichuSr000Hub4K0040')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 预期结果：编译报错
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_FUNCTION_JICHU_SR000HUB4K_0040 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_FUNCTION_JICHU_SR000HUB4K_0050
     * @tc.name   : Function jichu sr000hub4k
     * @tc.desc   : Verify function jichu sr000hub4k interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_FUNCTION_JICHU_SR000HUB4K_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_FUNCTION_JICHU_SR000HUB4K_0050 start.`);
      // 步骤1：打开promptAction.showActionMenu未配置buttons的页面
      Settings.createWindow('testability/pages/scenario/action_event/JichuSr000Hub4K/JichuSr000Hub4K0050')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 预期结果：编译报错
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_FUNCTION_JICHU_SR000HUB4K_0050 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_FUNCTION_JICHU_SR000HUB4K_0060
     * @tc.name   : Function jichu sr000hub4k
     * @tc.desc   : Verify function jichu sr000hub4k interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_FUNCTION_JICHU_SR000HUB4K_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_FUNCTION_JICHU_SR000HUB4K_0060 start.`);
      // 步骤1：打开promptAction.showActionMenu下buttons中未配置color的页面
      Settings.createWindow('testability/pages/scenario/action_event/JichuSr000Hub4K/JichuSr000Hub4K0060')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 预期结果：编译报错
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_FUNCTION_JICHU_SR000HUB4K_0060 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_FUNCTION_JICHU_SR000HUB4K_0070
     * @tc.name   : Function jichu sr000hub4k
     * @tc.desc   : Verify function jichu sr000hub4k interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_FUNCTION_JICHU_SR000HUB4K_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_FUNCTION_JICHU_SR000HUB4K_0070 start.`);
      // 步骤1：打开promptAction.showActionMenu下buttons中未配置text的页面
      Settings.createWindow('testability/pages/scenario/action_event/JichuSr000Hub4K/JichuSr000Hub4K0070')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 预期结果：编译报错
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_FUNCTION_JICHU_SR000HUB4K_0070 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_FUNCTION_JICHU_SR000HUB4K_0080
     * @tc.name   : Function jichu sr000hub4k
     * @tc.desc   : Verify function jichu sr000hub4k interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_FUNCTION_JICHU_SR000HUB4K_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_FUNCTION_JICHU_SR000HUB4K_0080 start.`);
      // 步骤1：打开promptAction.showActionMenu下buttons中参数text设置为错误类型：number的页面
      Settings.createWindow('testability/pages/scenario/action_event/JichuSr000Hub4K/JichuSr000Hub4K0080')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 预期结果：编译报错
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_FUNCTION_JICHU_SR000HUB4K_0080 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_FUNCTION_JICHU_SR000HUB4K_0090
     * @tc.name   : Function jichu sr000hub4k
     * @tc.desc   : Verify function jichu sr000hub4k interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_FUNCTION_JICHU_SR000HUB4K_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_FUNCTION_JICHU_SR000HUB4K_0090 start.`);
      // 步骤1：打开promptAction.openCustomDialog中未配置options的页面
      Settings.createWindow('testability/pages/scenario/action_event/JichuSr000Hub4K/JichuSr000Hub4K0090')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 预期结果：编译报错
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_FUNCTION_JICHU_SR000HUB4K_0090 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_FUNCTION_JICHU_SR000HUB4K_0100
     * @tc.name   : Function jichu sr000hub4k
     * @tc.desc   : Verify function jichu sr000hub4k interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_FUNCTION_JICHU_SR000HUB4K_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_FUNCTION_JICHU_SR000HUB4K_0100 start.`);
      // 步骤1：安装hap包，进入demo
      Settings.createWindow('testability/pages/scenario/action_event/JichuSr000Hub4K/JichuSr000Hub4K0100')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：点击按钮，进入页面，再点击页面中的按钮
      let showDialogBtn = await driver.waitForComponent(ON.id('show_dialog_btn_0100'), 500)
      await showDialogBtn.click()
      await Utils.sleep(1000)
      // 预期结果：对话框可以在子窗口显示
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_FUNCTION_JICHU_SR000HUB4K_0100 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_FUNCTION_JICHU_SR000HUB4K_0110
     * @tc.name   : Function jichu sr000hub4k
     * @tc.desc   : Verify function jichu sr000hub4k interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_FUNCTION_JICHU_SR000HUB4K_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_FUNCTION_JICHU_SR000HUB4K_0110 start.`);
      // 步骤1：安装hap包，进入demo
      Settings.createWindow('testability/pages/scenario/action_event/JichuSr000Hub4K/JichuSr000Hub4K0110')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：点击按钮，进入页面，再点击页面中的按钮
      let showDialogBtn = await driver.waitForComponent(ON.id('show_dialog_btn_0110'), 500)
      await showDialogBtn.click()
      await Utils.sleep(1000)
      // 预期结果：对话框不可以在子窗口显示
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_FUNCTION_JICHU_SR000HUB4K_0110 finish.`);
      done()
    })


  })
}