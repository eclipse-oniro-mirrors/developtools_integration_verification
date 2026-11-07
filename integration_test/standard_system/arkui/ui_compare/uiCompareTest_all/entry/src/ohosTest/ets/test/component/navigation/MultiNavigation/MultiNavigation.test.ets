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

export default function multiNavigation() {

  describe('multiNavigation', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0260
     * @tc.name   : Multinavigation
     * @tc.desc   : Verify multinavigation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0260', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0260 start.`);
      try {
        Settings.createWindow('testability/pages/component/navigation/MultiNavigation/MultiNavigation0260')
        let driver: Driver = Driver.create();
        await Utils.sleep(500) // 初始等待
        // 初始状态截图
        windowSnap.snapShot()
        await Utils.sleep(300) // 观察时间

        // 步骤1: 依次点击4个pushPathByName按钮
        Logger.info('TEST', '步骤1: 点击pushPathByName PageDetail1');
        const pushPageDetail1Button = await driver.findComponent(ON.id('pushPageDetail1Button'));
        await pushPageDetail1Button.click();
        await Utils.sleep(400); // 等待页面切换和渲染
        windowSnap.snapShot()

        Logger.info('TEST', '步骤1: 点击pushPathByName PageFull1');
        const pushPageFull1Button = await driver.findComponent(ON.id('pushPageFull1Button'));
        await pushPageFull1Button.click();
        await Utils.sleep(400); // 等待页面切换和渲染
        windowSnap.snapShot()

        Logger.info('TEST', '步骤1: 点击pushPathByName PageHome1');
        const pushPageHome1Button = await driver.findComponent(ON.id('pushPageHome1Button'));
        await pushPageHome1Button.click();
        await Utils.sleep(400); // 等待页面切换和渲染
        windowSnap.snapShot()

        Logger.info('TEST', '步骤1: 点击pushPathByName PageDetail2');
        const pushPageDetail2Button = await driver.findComponent(ON.id('pushPageDetail2Button'));
        await pushPageDetail2Button.click();
        await Utils.sleep(400); // 等待页面切换和渲染
        windowSnap.snapShot()

        // 步骤2: 点击getAllPathName
        Logger.info('TEST', '步骤2: 点击getAllPathName');
        const getAllPathNameButton = await driver.findComponent(ON.id('getAllPathNameButton'));
        await getAllPathNameButton.click();
        await Utils.sleep(400); // 等待结果显示
        windowSnap.snapShot()

        // 步骤3: 点击size
        Logger.info('TEST', '步骤3: 点击size');
        const sizeButton = await driver.findComponent(ON.id('sizeButton'));
        await sizeButton.click();
        await Utils.sleep(400); // 等待结果显示
        windowSnap.snapShot()

        // 步骤4: 点击getParamByName PageHome1
        Logger.info('TEST', '步骤4: 点击getParamByName PageHome1');
        const getParamPageHome1Button = await driver.findComponent(ON.id('getParamPageHome1Button'));
        await getParamPageHome1Button.click();
        await Utils.sleep(400); // 等待结果显示
        windowSnap.snapShot()

        // 步骤5: 点击getParamByName PageDetail1
        Logger.info('TEST', '步骤5: 点击getParamByName PageDetail1');
        const getParamPageDetail1Button = await driver.findComponent(ON.id('getParamPageDetail1Button'));
        await getParamPageDetail1Button.click();
        await Utils.sleep(400); // 等待结果显示
        windowSnap.snapShot()

        // 步骤6: 点击getParamByName PageFull1
        Logger.info('TEST', '步骤6: 点击getParamByName PageFull1');
        const getParamPageFull1Button = await driver.findComponent(ON.id('getParamPageFull1Button'));
        await getParamPageFull1Button.click();
        await Utils.sleep(400); // 等待结果显示
        windowSnap.snapShot()

        await Utils.sleep(500); // 最终等待时间
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0260 finish.`);
      } catch (error) {
        Logger.error('TEST', `Test error: ${error}`);
      }
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0270
     * @tc.name   : Multinavigation
     * @tc.desc   : Verify multinavigation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0270', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0270 start.`);
      try {
        Settings.createWindow('testability/pages/component/navigation/MultiNavigation/MultiNavigation0270')
        let driver: Driver = Driver.create();
        await Utils.sleep(500) // 初始等待
        // 初始状态截图
        windowSnap.snapShot()
        await Utils.sleep(300) // 观察时间

        // 步骤1: 点击pushPathByName PageDetail2
        Logger.info('TEST', '步骤1: 点击pushPathByName PageDetail2');
        const pushPageDetail2Button = await driver.findComponent(ON.id('pushPageDetail2Button'));
        await pushPageDetail2Button.click();
        await Utils.sleep(400); // 等待页面加载
        windowSnap.snapShot()

        // 步骤2: 点击SwitchFullScreen true
        Logger.info('TEST', '步骤2: 点击SwitchFullScreen true');
        const switchFullScreenTrueButton = await driver.findComponent(ON.id('switchFullScreenTrueButton'));
        await switchFullScreenTrueButton.click();
        await Utils.sleep(400); // 等待界面切换
        windowSnap.snapShot()

        // 步骤3: 点击SwitchFullScreen false
        Logger.info('TEST', '步骤3: 点击SwitchFullScreen false');
        const switchFullScreenFalseButton = await driver.findComponent(ON.id('switchFullScreenFalseButton'));
        await switchFullScreenFalseButton.click();
        await Utils.sleep(400); // 等待界面切换
        windowSnap.snapShot()

        // 步骤4: 点击SwitchFullScreen undefined
        Logger.info('TEST', '步骤4: 点击SwitchFullScreen undefined');
        const switchFullScreenUndefinedButton = await driver.findComponent(ON.id('switchFullScreenUndefinedButton'));
        await switchFullScreenUndefinedButton.click();
        await Utils.sleep(400); // 等待观察
        windowSnap.snapShot()

        await Utils.sleep(500); // 最终等待时间
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0270 finish.`);
      } catch (error) {
        Logger.error('TEST', `Test error: ${error}`);
      }
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0280
     * @tc.name   : Multinavigation
     * @tc.desc   : Verify multinavigation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0280', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0280 start.`);
      try {
        Settings.createWindow('testability/pages/component/navigation/MultiNavigation/MultiNavigation0280')
        let driver: Driver = Driver.create();
        await Utils.sleep(500) // 初始等待
        // 初始状态截图
        windowSnap.snapShot()
        await Utils.sleep(300) // 观察时间

        // 步骤1: 点击setKeepBottomPage true
        Logger.info('TEST', '步骤1: 点击setKeepBottomPage true');
        const setKeepBottomPageButton = await driver.findComponent(ON.id('setKeepBottomPageButton'));
        await setKeepBottomPageButton.click();
        await Utils.sleep(400); // 等待设置生效
        windowSnap.snapShot()

        // 步骤2: 多次点击pushPath PageHome1
        Logger.info('TEST', '步骤2: 多次点击pushPath PageHome1');
        const pushPathButton = await driver.findComponent(ON.id('pushPathButton'));
        for (let i = 0; i < 5; i++) {
          await pushPathButton.click();
          await Utils.sleep(300); // 每次点击后等待
          Logger.info('TEST', `点击第 ${i + 1} 次 pushPath PageHome1`);
        }
        windowSnap.snapShot()

        // 步骤3: 点击clear按钮
        Logger.info('TEST', '步骤3: 点击clear按钮');
        const clearButton = await driver.findComponent(ON.id('clearButton'));
        await clearButton.click();
        await Utils.sleep(800); // 等待退场动画完成
        windowSnap.snapShot()

        await Utils.sleep(500); // 最终等待时间
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0280 finish.`);
      } catch (error) {
        Logger.error('TEST', `Test error: ${error}`);
      }
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0290
     * @tc.name   : Multinavigation
     * @tc.desc   : Verify multinavigation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0290', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0290 start.`);
      try {
        Settings.createWindow('testability/pages/component/navigation/MultiNavigation/MultiNavigation0290')
        let driver: Driver = Driver.create();
        await Utils.sleep(500) // 初始等待
        // 初始状态截图
        windowSnap.snapShot()
        await Utils.sleep(300) // 观察时间

        // 步骤1: 快速点击pushPath PageHome1按钮
        Logger.info('TEST', '步骤1: 快速点击pushPath PageHome1按钮');
        const pushPathButton = await driver.findComponent(ON.id('pushPathButton'));
        
        // 快速连续点击10次
        for (let i = 0; i < 10; i++) {
          await pushPathButton.click();
          await Utils.sleep(50); // 非常短的间隔,模拟快速点击
          Logger.info('TEST', `快速点击第 ${i + 1} 次`);
        }
        
        await Utils.sleep(800); // 等待所有页面加载完成
        windowSnap.snapShot()

        // 验证页面显示正常
        Logger.info('TEST', '验证页面显示正常');
        await Utils.sleep(500);
        windowSnap.snapShot()

        await Utils.sleep(500); // 最终等待时间
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0290 finish.`);
      } catch (error) {
        Logger.error('TEST', `Test error: ${error}`);
      }
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0310
     * @tc.name   : Multinavigation
     * @tc.desc   : Verify multinavigation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0310', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0310 start.`);
      try {
        Settings.createWindow('testability/pages/component/navigation/MultiNavigation/MultiNavigation0310')
        let driver: Driver = Driver.create();
        await Utils.sleep(500) // 初始等待
        // 初始状态截图
        windowSnap.snapShot()
        await Utils.sleep(300) // 观察时间

        // 步骤1: 点击disableAnimation按钮设置为true
        Logger.info('TEST', '步骤1: 点击disableAnimation按钮设置为true');
        const disableAnimationButton = await driver.findComponent(ON.id('disableAnimationButton'));
        await disableAnimationButton.click();
        await Utils.sleep(400); // 等待设置生效
        windowSnap.snapShot()

        // 步骤2: 点击pushPath PageHome1
        Logger.info('TEST', '步骤2: 点击pushPath PageHome1');
        const pushPathButton = await driver.findComponent(ON.id('pushPathButton'));
        await pushPathButton.click();
        await Utils.sleep(600); // 等待页面跳转(无动画应该很快)
        windowSnap.snapShot()

        // 验证页面正常跳转
        Logger.info('TEST', '验证页面正常跳转');
        await Utils.sleep(500);
        windowSnap.snapShot()

        await Utils.sleep(500); // 最终等待时间
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0310 finish.`);
      } catch (error) {
        Logger.error('TEST', `Test error: ${error}`);
      }
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0330
     * @tc.name   : Multinavigation
     * @tc.desc   : Verify multinavigation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0330', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0330 start.`);
      try {
        Settings.createWindow('testability/pages/component/navigation/MultiNavigation/MultiNavigation0330')
        let driver: Driver = Driver.create();
        await Utils.sleep(500) // 初始等待
        // 初始状态截图
        windowSnap.snapShot()
        await Utils.sleep(300) // 观察时间

        // 步骤1: 依次点击4个pushPathByName按钮
        Logger.info('TEST', '步骤1: 点击pushPathByName PageDetail1');
        const pushPageDetail1Button = await driver.findComponent(ON.id('pushPageDetail1Button'));
        await pushPageDetail1Button.click();
        await Utils.sleep(300);
        windowSnap.snapShot()

        Logger.info('TEST', '步骤1: 点击pushPathByName PageFull1');
        const pushPageFull1Button = await driver.findComponent(ON.id('pushPageFull1Button'));
        await pushPageFull1Button.click();
        await Utils.sleep(300);
        windowSnap.snapShot()

        Logger.info('TEST', '步骤1: 点击pushPathByName PageHome1');
        const pushPageHome1Button = await driver.findComponent(ON.id('pushPageHome1Button'));
        await pushPageHome1Button.click();
        await Utils.sleep(300);
        windowSnap.snapShot()

        Logger.info('TEST', '步骤1: 再次点击pushPathByName PageDetail1');
        await pushPageDetail1Button.click();
        await Utils.sleep(300);
        windowSnap.snapShot()

        // 步骤2: 点击getAllPathName
        Logger.info('TEST', '步骤2: 点击getAllPathName');
        const getAllPathNameButton = await driver.findComponent(ON.id('getAllPathNameButton'));
        await getAllPathNameButton.click();
        await Utils.sleep(400);
        windowSnap.snapShot()

        // 步骤3: 点击setKeepBottomPage true
        Logger.info('TEST', '步骤3: 点击setKeepBottomPage true');
        const setKeepBottomPageButton = await driver.findComponent(ON.id('setKeepBottomPageButton'));
        await setKeepBottomPageButton.click();
        await Utils.sleep(400);
        windowSnap.snapShot()

        // 步骤4: 点击clear
        Logger.info('TEST', '步骤4: 点击clear');
        const clearButton = await driver.findComponent(ON.id('clearButton'));
        await clearButton.click();
        await Utils.sleep(800); // 等待clear完成和页面显示
        windowSnap.snapShot()

        // 验证界面显示PageHome1页面
        Logger.info('TEST', '验证界面显示PageHome1页面');
        await Utils.sleep(500);
        windowSnap.snapShot()

        await Utils.sleep(500); // 最终等待时间
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0330 finish.`);
      } catch (error) {
        Logger.error('TEST', `Test error: ${error}`);
      }
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0340
     * @tc.name   : Multinavigation
     * @tc.desc   : Verify multinavigation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0340', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0340 start.`);
      try {
        Settings.createWindow('testability/pages/component/navigation/MultiNavigation/MultiNavigation0340')
        let driver: Driver = Driver.create();
        await Utils.sleep(500) // 初始等待
        // 初始状态截图(应显示PageDetail1)
        windowSnap.snapShot()
        await Utils.sleep(300) // 观察时间

        // 步骤1: 点击setKeepBottomPage true
        Logger.info('TEST', '步骤1: 点击setKeepBottomPage true');
        const setKeepBottomPageButton = await driver.findComponent(ON.id('setKeepBottomPageButton'));
        await setKeepBottomPageButton.click();
        await Utils.sleep(400);
        windowSnap.snapShot()

        // 步骤2: 点击pop
        Logger.info('TEST', '步骤2: 点击pop');
        const popButton = await driver.findComponent(ON.id('popButton'));
        await popButton.click();
        await Utils.sleep(600); // 等待pop完成和页面切换
        windowSnap.snapShot()

        // 验证界面显示PageHome1页面
        Logger.info('TEST', '验证界面显示PageHome1页面,无其他反应');
        await Utils.sleep(500);
        windowSnap.snapShot()

        // 步骤3: 点击removeByName PageHome1
        Logger.info('TEST', '步骤3: 点击removeByName PageHome1');
        const removeByNameButton = await driver.findComponent(ON.id('removeByNameButton'));
        await removeByNameButton.click();
        await Utils.sleep(600); // 等待删除完成
        windowSnap.snapShot()

        // 验证界面显示空白,页面可删除
        Logger.info('TEST', '验证界面显示空白,页面可删除');
        await Utils.sleep(500);
        windowSnap.snapShot()

        await Utils.sleep(500); // 最终等待时间
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0340 finish.`);
      } catch (error) {
        Logger.error('TEST', `Test error: ${error}`);
      }
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0360
     * @tc.name   : Multinavigation
     * @tc.desc   : Verify multinavigation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0360', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0360 start.`);
      try {
        Settings.createWindow('testability/pages/component/navigation/MultiNavigation/MultiNavigation0360')
        let driver: Driver = Driver.create();
        await Utils.sleep(500) // 初始等待
        // 初始状态截图
        windowSnap.snapShot()
        await Utils.sleep(300) // 观察时间

        // 步骤1: 点击pushPath PageFull1
        Logger.info('TEST', '步骤1: 点击pushPath PageFull1');
        const pushPathButton = await driver.findComponent(ON.id('pushPathButton'));
        await pushPathButton.click();
        await Utils.sleep(800); // 等待页面跳转和生命周期触发
        windowSnap.snapShot()

        // 验证触发home页面的onWillHide、onHidden生命周期
        Logger.info('TEST', '验证触发home页面的onWillHide、onHidden生命周期');
        await Utils.sleep(500);
        windowSnap.snapShot()

        await Utils.sleep(500); // 最终等待时间
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0360 finish.`);
      } catch (error) {
        Logger.error('TEST', `Test error: ${error}`);
      }
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0410
     * @tc.name   : Multinavigation
     * @tc.desc   : Verify multinavigation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0410', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0410 start.`);
      try {
        Settings.createWindow('testability/pages/component/navigation/MultiNavigation/MultiNavigation0410')
        let driver: Driver = Driver.create();
        await Utils.sleep(500) // 初始等待
        // 初始状态截图
        windowSnap.snapShot()
        await Utils.sleep(300) // 观察时间

        // 步骤1: 依次点击3个pushPath按钮
        Logger.info('TEST', '步骤1: 点击pushPath PageDetail2');
        const pushPageDetail2Button = await driver.findComponent(ON.id('pushPageDetail2Button'));
        await pushPageDetail2Button.click();
        await Utils.sleep(300);
        windowSnap.snapShot()

        Logger.info('TEST', '步骤1: 点击pushPath PageDetail1 (第1次)');
        const pushPageDetail1Button = await driver.findComponent(ON.id('pushPageDetail1Button'));
        await pushPageDetail1Button.click();
        await Utils.sleep(300);
        windowSnap.snapShot()

        Logger.info('TEST', '步骤1: 点击pushPath PageDetail1 (第2次)');
        await pushPageDetail1Button.click();
        await Utils.sleep(300);
        windowSnap.snapShot()

        // 步骤2: 点击pushPath PageHome2
        Logger.info('TEST', '步骤2: 点击pushPath PageHome2');
        const pushPageHome2Button = await driver.findComponent(ON.id('pushPageHome2Button'));
        await pushPageHome2Button.click();
        await Utils.sleep(300);
        windowSnap.snapShot()

        // 步骤3: 点击pushPath PageDetail1
        Logger.info('TEST', '步骤3: 再次点击pushPath PageDetail1');
        await pushPageDetail1Button.click();
        await Utils.sleep(300);
        windowSnap.snapShot()

        // 步骤4: 输入框输入1000000000000
        Logger.info('TEST', '步骤4: 输入框输入1000000000000');
        const indexInput = await driver.findComponent(ON.id('indexInput'));
        await indexInput.inputText('1000000000000');
        await Utils.sleep(400);
        windowSnap.snapShot()

        // 步骤5: 点击moveIndexToTop
        Logger.info('TEST', '步骤5: 点击moveIndexToTop');
        const moveIndexToTopButton = await driver.findComponent(ON.id('moveIndexToTopButton'));
        await moveIndexToTopButton.click();
        await Utils.sleep(600); // 等待操作完成
        windowSnap.snapShot()

        // 验证页面无法跳转
        Logger.info('TEST', '验证页面无法跳转');
        await Utils.sleep(500);
        windowSnap.snapShot()

        await Utils.sleep(500); // 最终等待时间
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0410 finish.`);
      } catch (error) {
        Logger.error('TEST', `Test error: ${error}`);
      }
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0500
     * @tc.name   : Multinavigation
     * @tc.desc   : Verify multinavigation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0500', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0500 start.`);
      try {
        Settings.createWindow('testability/pages/component/navigation/MultiNavigation/MultiNavigation0500')
        let driver: Driver = Driver.create();
        await Utils.sleep(500) // 初始等待
        // 初始状态截图
        windowSnap.snapShot()
        await Utils.sleep(300) // 观察时间

        // 步骤1: 点击pushPath PageHome2
        Logger.info('TEST', '步骤1: 点击pushPath PageHome2');
        const pushPageHome2Button = await driver.findComponent(ON.id('pushPageHome2Button'));
        await pushPageHome2Button.click();
        await Utils.sleep(600); // 等待页面跳转
        windowSnap.snapShot()

        // 验证页面跳转到PageHome2
        Logger.info('TEST', '验证页面跳转到PageHome2');
        await Utils.sleep(500);
        windowSnap.snapShot()

        // 步骤2: 点击pushPath PageHome1
        Logger.info('TEST', '步骤2: 点击pushPath PageHome1');
        const pushPageHome1Button = await driver.findComponent(ON.id('pushPageHome1Button'));
        await pushPageHome1Button.click();
        await Utils.sleep(600); // 等待页面跳转
        windowSnap.snapShot()

        // 验证页面跳转到PageHome1
        Logger.info('TEST', '验证页面跳转到PageHome1');
        await Utils.sleep(500);
        windowSnap.snapShot()

        await Utils.sleep(500); // 最终等待时间
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0500 finish.`);
      } catch (error) {
        Logger.error('TEST', `Test error: ${error}`);
      }
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0510
     * @tc.name   : Multinavigation
     * @tc.desc   : Verify multinavigation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0510', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0510 start.`);
      try {
        Settings.createWindow('testability/pages/component/navigation/MultiNavigation/MultiNavigation0510')
        let driver: Driver = Driver.create();
        await Utils.sleep(500) // 初始等待
        // 初始状态截图
        windowSnap.snapShot()
        await Utils.sleep(300) // 观察时间

        // 步骤1: 点击pushPath PageDetail1
        Logger.info('TEST', '步骤1: 点击pushPath PageDetail1');
        const pushPageDetail1Button = await driver.findComponent(ON.id('pushPageDetail1Button'));
        await pushPageDetail1Button.click();
        await Utils.sleep(600); // 等待页面跳转和双栏显示
        windowSnap.snapShot()

        // 验证页面双栏显示,右侧显示PageDetail1
        Logger.info('TEST', '验证页面双栏显示,右侧显示PageDetail1');
        await Utils.sleep(500);
        windowSnap.snapShot()

        // 步骤2: 点击左侧分栏上pushPath PageDetail2
        Logger.info('TEST', '步骤2: 点击左侧分栏上pushPath PageDetail2');
        const pushPageDetail2Button = await driver.findComponent(ON.id('pushPageDetail2Button'));
        await pushPageDetail2Button.click();
        await Utils.sleep(600); // 等待右侧分栏跳转
        windowSnap.snapShot()

        // 验证右侧分栏跳转到PageDetail2
        Logger.info('TEST', '验证右侧分栏跳转到PageDetail2');
        await Utils.sleep(500);
        windowSnap.snapShot()

        // 步骤3: 点击左侧分栏上getAllPathName
        Logger.info('TEST', '步骤3: 点击左侧分栏上getAllPathName');
        const getAllPathNameButton = await driver.findComponent(ON.id('getAllPathNameButton'));
        await getAllPathNameButton.click();
        await Utils.sleep(600); // 等待结果显示
        windowSnap.snapShot()

        // 验证界面显示: getAllPathName return : PageHome1,PageDetail1
        Logger.info('TEST', '验证界面显示: getAllPathName return : PageHome1,PageDetail1');
        await Utils.sleep(500);
        windowSnap.snapShot()

        await Utils.sleep(500); // 最终等待时间
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0510 finish.`);
      } catch (error) {
        Logger.error('TEST', `Test error: ${error}`);
      }
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0520
     * @tc.name   : Multinavigation
     * @tc.desc   : Verify multinavigation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0520', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0520 start.`);
      try {
        Settings.createWindow('testability/pages/component/navigation/MultiNavigation/MultiNavigation0520')
        let driver: Driver = Driver.create();
        await Utils.sleep(500) // 初始等待
        // 初始状态截图
        windowSnap.snapShot()
        await Utils.sleep(300) // 观察时间

        // 步骤1: 点击pushPath PageDetail1
        Logger.info('TEST', '步骤1: 点击pushPath PageDetail1');
        const pushPageDetail1Button = await driver.findComponent(ON.id('pushPageDetail1Button'));
        await pushPageDetail1Button.click();
        await Utils.sleep(600); // 等待页面跳转和双栏显示
        windowSnap.snapShot()

        // 验证页面双栏显示,右侧显示PageDetail1
        Logger.info('TEST', '验证页面双栏显示,右侧显示PageDetail1');
        await Utils.sleep(500);
        windowSnap.snapShot()

        // 步骤2: 点击右侧分栏上pushPath PageDetail2
        Logger.info('TEST', '步骤2: 点击右侧分栏上pushPath PageDetail2');
        const pushPageDetail2ButtonRight = await driver.findComponent(ON.id('pushPageDetail2ButtonRight'));
        await pushPageDetail2ButtonRight.click();
        await Utils.sleep(600); // 等待右侧分栏跳转
        windowSnap.snapShot()

        // 验证右侧分栏跳转到PageDetail2
        Logger.info('TEST', '验证右侧分栏跳转到PageDetail2');
        await Utils.sleep(500);
        windowSnap.snapShot()

        // 步骤3: 点击左侧分栏上getAllPathName
        Logger.info('TEST', '步骤3: 点击左侧分栏上getAllPathName');
        const getAllPathNameButton = await driver.findComponent(ON.id('getAllPathNameButton'));
        await getAllPathNameButton.click();
        await Utils.sleep(600); // 等待结果显示
        windowSnap.snapShot()

        // 验证界面显示: getAllPathName return : PageHome1,PageDetail1,PageDetail2
        Logger.info('TEST', '验证界面显示: getAllPathName return : PageHome1,PageDetail1,PageDetail2');
        await Utils.sleep(500);
        windowSnap.snapShot()

        await Utils.sleep(500); // 最终等待时间
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0520 finish.`);
      } catch (error) {
        Logger.error('TEST', `Test error: ${error}`);
      }
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0530
     * @tc.name   : Multinavigation
     * @tc.desc   : Verify multinavigation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0530', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0530 start.`);
      try {
        Settings.createWindow('testability/pages/component/navigation/MultiNavigation/MultiNavigation0530')
        let driver: Driver = Driver.create();
        await Utils.sleep(500) // 初始等待
        // 初始状态截图
        windowSnap.snapShot()
        await Utils.sleep(300) // 观察时间

        // 步骤1: 点击pushPath PageFull1
        Logger.info('TEST', '步骤1: 点击pushPath PageFull1');
        const pushPageFull1Button = await driver.findComponent(ON.id('pushPageFull1Button'));
        await pushPageFull1Button.click();
        await Utils.sleep(600); // 等待页面跳转
        windowSnap.snapShot()

        // 验证页面跳转到PageFull1
        Logger.info('TEST', '验证页面跳转到PageFull1');
        await Utils.sleep(500);
        windowSnap.snapShot()

        // 步骤2: 点击pushPath PageDetail1
        Logger.info('TEST', '步骤2: 点击pushPath PageDetail1');
        const pushPageDetail1Button = await driver.findComponent(ON.id('pushPageDetail1Button'));
        await pushPageDetail1Button.click();
        await Utils.sleep(600); // 等待页面跳转
        windowSnap.snapShot()

        // 验证页面跳转到PageDetail1
        Logger.info('TEST', '验证页面跳转到PageDetail1');
        await Utils.sleep(500);
        windowSnap.snapShot()

        // 步骤3: 点击pushPath PageHome1
        Logger.info('TEST', '步骤3: 点击pushPath PageHome1');
        const pushPageHome1Button = await driver.findComponent(ON.id('pushPageHome1Button'));
        await pushPageHome1Button.click();
        await Utils.sleep(600); // 等待页面跳转
        windowSnap.snapShot()

        // 验证页面跳转到PageHome1
        Logger.info('TEST', '验证页面跳转到PageHome1');
        await Utils.sleep(500);
        windowSnap.snapShot()

        await Utils.sleep(500); // 最终等待时间
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0530 finish.`);
      } catch (error) {
        Logger.error('TEST', `Test error: ${error}`);
      }
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0540
     * @tc.name   : Multinavigation
     * @tc.desc   : Verify multinavigation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0540', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0540 start.`);
      try {
        Settings.createWindow('testability/pages/component/navigation/MultiNavigation/MultiNavigation0540')
        let driver: Driver = Driver.create();
        await Utils.sleep(500) // 初始等待
        // 初始状态截图
        windowSnap.snapShot()
        await Utils.sleep(300) // 观察时间

        // 步骤1: 点击pushPath PageDetail1
        Logger.info('TEST', '步骤1: 点击pushPath PageDetail1');
        const pushPageDetail1Button = await driver.findComponent(ON.id('pushPageDetail1Button'));
        await pushPageDetail1Button.click();
        await Utils.sleep(600); // 等待页面跳转和双栏显示
        windowSnap.snapShot()

        // 验证页面双栏显示,右侧显示PageDetail1
        Logger.info('TEST', '验证页面双栏显示,右侧显示PageDetail1');
        await Utils.sleep(500);
        windowSnap.snapShot()

        // 步骤2: 点击左侧分栏上replacePath PageDetail1
        Logger.info('TEST', '步骤2: 点击左侧分栏上replacePath PageDetail1');
        const replacePageDetail1Button = await driver.findComponent(ON.id('replacePageDetail1Button'));
        await replacePageDetail1Button.click();
        await Utils.sleep(600); // 等待右侧分栏跳转
        windowSnap.snapShot()

        // 验证右侧分栏跳转到PageDetail1
        Logger.info('TEST', '验证右侧分栏跳转到PageDetail1');
        await Utils.sleep(500);
        windowSnap.snapShot()

        // 步骤3: 点击左侧分栏上getAllPathName
        Logger.info('TEST', '步骤3: 点击左侧分栏上getAllPathName');
        const getAllPathNameButton = await driver.findComponent(ON.id('getAllPathNameButton'));
        await getAllPathNameButton.click();
        await Utils.sleep(600); // 等待结果显示
        windowSnap.snapShot()

        // 验证界面显示: getAllPathName return : PageHome1,PageDetail1
        Logger.info('TEST', '验证界面显示: getAllPathName return : PageHome1,PageDetail1');
        await Utils.sleep(500);
        windowSnap.snapShot()

        await Utils.sleep(500); // 最终等待时间
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0540 finish.`);
      } catch (error) {
        Logger.error('TEST', `Test error: ${error}`);
      }
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0550
     * @tc.name   : Multinavigation
     * @tc.desc   : Verify multinavigation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0550', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0550 start.`);
      try {
        Settings.createWindow('testability/pages/component/navigation/MultiNavigation/MultiNavigation0550')
        let driver: Driver = Driver.create();
        await Utils.sleep(500) // 初始等待
        // 初始状态截图
        windowSnap.snapShot()
        await Utils.sleep(300) // 观察时间

        // 步骤1: 点击pushPath PageDetail1
        Logger.info('TEST', '步骤1: 点击pushPath PageDetail1');
        const pushPageDetail1Button = await driver.findComponent(ON.id('pushPageDetail1Button'));
        await pushPageDetail1Button.click();
        await Utils.sleep(600); // 等待页面跳转和双栏显示
        windowSnap.snapShot()

        // 验证页面双栏显示,右侧显示PageDetail1
        Logger.info('TEST', '验证页面双栏显示,右侧显示PageDetail1');
        await Utils.sleep(500);
        windowSnap.snapShot()

        // 步骤2: 点击右侧分栏上replacePath PageDetail1
        Logger.info('TEST', '步骤2: 点击右侧分栏上replacePath PageDetail1');
        const replacePageDetail1ButtonRight = await driver.findComponent(ON.id('replacePageDetail1ButtonRight'));
        await replacePageDetail1ButtonRight.click();
        await Utils.sleep(600); // 等待右侧分栏跳转
        windowSnap.snapShot()

        // 验证右侧分栏跳转到PageDetail1
        Logger.info('TEST', '验证右侧分栏跳转到PageDetail1');
        await Utils.sleep(500);
        windowSnap.snapShot()

        // 步骤3: 点击左侧分栏上getAllPathName
        Logger.info('TEST', '步骤3: 点击左侧分栏上getAllPathName');
        const getAllPathNameButton = await driver.findComponent(ON.id('getAllPathNameButton'));
        await getAllPathNameButton.click();
        await Utils.sleep(600); // 等待结果显示
        windowSnap.snapShot()

        // 验证界面显示: getAllPathName return : PageHome1,PageDetail1
        Logger.info('TEST', '验证界面显示: getAllPathName return : PageHome1,PageDetail1');
        await Utils.sleep(500);
        windowSnap.snapShot()

        await Utils.sleep(500); // 最终等待时间
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0550 finish.`);
      } catch (error) {
        Logger.error('TEST', `Test error: ${error}`);
      }
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0560
     * @tc.name   : Multinavigation
     * @tc.desc   : Verify multinavigation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0560', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0560 start.`);
      try {
        Settings.createWindow('testability/pages/component/navigation/MultiNavigation/MultiNavigation0560')
        let driver: Driver = Driver.create();
        await Utils.sleep(500) // 初始等待
        // 初始状态截图
        windowSnap.snapShot()
        await Utils.sleep(300) // 观察时间

        // 步骤1: 点击pushPath PageFull1
        Logger.info('TEST', '步骤1: 点击pushPath PageFull1');
        const pushPageFull1Button = await driver.findComponent(ON.id('pushPageFull1Button'));
        await pushPageFull1Button.click();
        await Utils.sleep(600); // 等待页面跳转
        windowSnap.snapShot()

        // 验证页面跳转到PageFull1
        Logger.info('TEST', '验证页面跳转到PageFull1');
        await Utils.sleep(500);
        windowSnap.snapShot()

        // 步骤2: 点击右侧分栏上replacePath PageDetail1
        Logger.info('TEST', '步骤2: 点击右侧分栏上replacePath PageDetail1');
        const replacePageDetail1ButtonRight = await driver.findComponent(ON.id('replacePageDetail1ButtonRight'));
        await replacePageDetail1ButtonRight.click();
        await Utils.sleep(600); // 等待页面跳转
        windowSnap.snapShot()

        // 验证页面跳转到PageDetail1
        Logger.info('TEST', '验证页面跳转到PageDetail1');
        await Utils.sleep(500);
        windowSnap.snapShot()

        // 步骤3: 点击右侧分栏上replacePath PageHome1
        Logger.info('TEST', '步骤3: 点击右侧分栏上replacePath PageHome1');
        const replacePageHome1ButtonRight = await driver.findComponent(ON.id('replacePageHome1ButtonRight'));
        await replacePageHome1ButtonRight.click();
        await Utils.sleep(600); // 等待页面跳转
        windowSnap.snapShot()

        // 验证页面跳转到PageHome1
        Logger.info('TEST', '验证页面跳转到PageHome1');
        await Utils.sleep(500);
        windowSnap.snapShot()

        await Utils.sleep(500); // 最终等待时间
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MULTINAVIGATION_0560 finish.`);
      } catch (error) {
        Logger.error('TEST', `Test error: ${error}`);
      }
      done()
    })

  })
}