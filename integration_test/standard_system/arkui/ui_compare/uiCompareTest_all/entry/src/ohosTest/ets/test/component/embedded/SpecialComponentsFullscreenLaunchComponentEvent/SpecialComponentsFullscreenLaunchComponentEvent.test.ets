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


export default function specialComponentsFullscreenLaunchComponentEvent() {

  describe('specialComponentsFullscreenLaunchComponentEvent', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_FULLSCREENLAUNCHCOMPONENT_EVENT_0100
     * @tc.name   : Special components fullscreenlaunchcomponent event
     * @tc.desc   : Verify special components fullscreenlaunchcomponent event interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_FULLSCREENLAUNCHCOMPONENT_EVENT_0100', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_FULLSCREENLAUNCHCOMPONENT_EVENT_0100 start.`);
      Settings.createWindow('testability/pages/component/embedded/SpecialComponentsFullscreenLaunchComponentEvent/SpecialComponentsFullscreenLaunchComponentEvent0010')
      let driver: Driver = Driver.create();
      
      // 初始状态截图
      Logger.info('TEST', 'Taking initial screenshot');
      windowSnap.snapShot()
      await Utils.sleep(500)
      
      try {
        // 步骤1: 点击"进入全屏模态手势测试"按钮
        Logger.info('TEST', 'Step 1: Click enter fullscreen modal button');
        let btnEnterModal: Component = await driver.findComponent(ON.id('SpecialComponentsFullscreenLaunchComponentEvent0010_003'));
        if (btnEnterModal) {
          await btnEnterModal.click();
          await Utils.sleep(1000) // 等待模态页面打开
          windowSnap.snapShot()
          Logger.info('TEST', 'Fullscreen modal opened');
        }
        
        // 步骤2: 点击"default test"按钮（在主页面上）
        // 注意：如果已经在模态页面，需要先关闭模态
        Logger.info('TEST', 'Step 2: Testing default test button');
        await driver.pressBack() // 关闭模态
        await Utils.sleep(500)
        
        let btnDefaultTest: Component = await driver.findComponent(ON.id('SpecialComponentsFullscreenLaunchComponentEvent0010_004'));
        if (btnDefaultTest) {
          await btnDefaultTest.click();
          await Utils.sleep(1000) // 等待模态页面打开
          windowSnap.snapShot()
          Logger.info('TEST', 'Default test button clicked, modal opened');
        }
        
        // 步骤3: 在模态页面中点击图片
        Logger.info('TEST', 'Step 3: Click image in modal page');
        let imgInModal: Component = await driver.findComponent(ON.id('ModalPage_003'));
        if (imgInModal) {
          await imgInModal.click();
          await Utils.sleep(500)
          windowSnap.snapShot()
          Logger.info('TEST', 'Image clicked');
        }
        
        // 步骤3: 点击"drag page"按钮
        Logger.info('TEST', 'Step 3: Click drag page button');
        let btnDragPage: Component = await driver.findComponent(ON.id('ModalPage_005'));
        if (btnDragPage) {
          await btnDragPage.click();
          await Utils.sleep(500)
          windowSnap.snapShot()
          Logger.info('TEST', 'Drag page button clicked');
        }
        
        // 步骤4: 点击输入框，验证软键盘拉起
        Logger.info('TEST', 'Step 4: Click input field to trigger soft keyboard');
        let inputField: Component = await driver.findComponent(ON.id('ModalPage_006'));
        if (inputField) {
          await inputField.click();
          await Utils.sleep(1000) // 等待软键盘弹出
          windowSnap.snapShot()
          Logger.info('TEST', 'Input field clicked, soft keyboard should appear');
        }
        
        // 等待一段时间观察软键盘状态
        await Utils.sleep(1000)
        windowSnap.snapShot()
        Logger.info('TEST', 'Final state with soft keyboard');
        
      } catch (error) {
        Logger.error('TEST', `Error during test: ${error}`);
      }
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_FULLSCREENLAUNCHCOMPONENT_EVENT_0100 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_FULLSCREENLAUNCHCOMPONENT_EVENT_0100_084_895_384
     * @tc.name   : Special components fullscreenlaunchcomponent event
     * @tc.desc   : Verify special components fullscreenlaunchcomponent event interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_FULLSCREENLAUNCHCOMPONENT_EVENT_0100_084_895_384', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_FULLSCREENLAUNCHCOMPONENT_EVENT_0100_084_895_384 start.`);
      Settings.createWindow('testability/pages/component/embedded/SpecialComponentsFullscreenLaunchComponentEvent/SpecialComponentsFullscreenLaunchComponentEvent0010084895384')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      
      // 初始状态截图
      Logger.info('TEST', 'Taking initial screenshot');
      windowSnap.snapShot()
      await Utils.sleep(500)
      
      try {
        // 步骤1: 点击"进入全屏模态焦点测试"按钮
        Logger.info('TEST', 'Step 1: Click enter fullscreen modal focus test button');
        let btnEnterModal: Component = await driver.findComponent(ON.id('SpecialComponentsFullscreenLaunchComponentEvent0010084895384_003'));
        if (btnEnterModal) {
          await btnEnterModal.click();
          await Utils.sleep(1000) // 等待模态页面打开
          windowSnap.snapShot()
          Logger.info('TEST', 'Fullscreen modal opened for focus test');
        }
        
        // 步骤2: 按Tab键进行走焦测试（由上至下）
        Logger.info('TEST', 'Step 2: Testing Tab key focus navigation (top to bottom)');
        
        // 第一次Tab - 焦点到按钮1
        await driver.triggerKey(2049) // Tab键
        await Utils.sleep(500)
        windowSnap.snapShot()
        Logger.info('TEST', 'Tab 1: Focus should be on Button 1');
        
        // 第二次Tab - 焦点到按钮2
        await driver.triggerKey(2049)
        await Utils.sleep(500)
        windowSnap.snapShot()
        Logger.info('TEST', 'Tab 2: Focus should be on Button 2');
        
        // 第三次Tab - 焦点到按钮3
        await driver.triggerKey(2049)
        await Utils.sleep(500)
        windowSnap.snapShot()
        Logger.info('TEST', 'Tab 3: Focus should be on Button 3');
        
        // 第四次Tab - 焦点到输入框1
        await driver.triggerKey(2049)
        await Utils.sleep(500)
        windowSnap.snapShot()
        Logger.info('TEST', 'Tab 4: Focus should be on TextInput 1');
        
        // 第五次Tab - 焦点到输入框2
        await driver.triggerKey(2049)
        await Utils.sleep(500)
        windowSnap.snapShot()
        Logger.info('TEST', 'Tab 5: Focus should be on TextInput 2');
        
        // 第六次Tab - 焦点到按钮4
        await driver.triggerKey(2049)
        await Utils.sleep(500)
        windowSnap.snapShot()
        Logger.info('TEST', 'Tab 6: Focus should be on Button 4');
        
        // 步骤3: 按方向键进行走焦测试（自由走焦）
        Logger.info('TEST', 'Step 3: Testing arrow keys focus navigation');
        
        // 按向上键
        await driver.triggerKey(2012) // 向上键
        await Utils.sleep(500)
        windowSnap.snapShot()
        Logger.info('TEST', 'Arrow Up: Focus moved up');
        
        // 按向下键
        await driver.triggerKey(2013) // 向下键
        await Utils.sleep(500)
        windowSnap.snapShot()
        Logger.info('TEST', 'Arrow Down: Focus moved down');
        
        // 再按向下键
        await driver.triggerKey(2013)
        await Utils.sleep(500)
        windowSnap.snapShot()
        Logger.info('TEST', 'Arrow Down again: Focus moved down');
        
        // 按向上键返回
        await driver.triggerKey(2012)
        await Utils.sleep(500)
        windowSnap.snapShot()
        Logger.info('TEST', 'Arrow Up: Focus moved up');
        
        // 最终状态截图
        await Utils.sleep(500)
        windowSnap.snapShot()
        Logger.info('TEST', 'Final focus state captured');
        
      } catch (error) {
        Logger.error('TEST', `Error during test: ${error}`);
      }
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_FULLSCREENLAUNCHCOMPONENT_EVENT_0100_084_895_384 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_FULLSCREENLAUNCHCOMPONENT_EVENT_0100_767
     * @tc.name   : Special components fullscreenlaunchcomponent event
     * @tc.desc   : Verify special components fullscreenlaunchcomponent event interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_FULLSCREENLAUNCHCOMPONENT_EVENT_0100_767', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_FULLSCREENLAUNCHCOMPONENT_EVENT_0100_767 start.`);
      Settings.createWindow('testability/pages/component/embedded/SpecialComponentsFullscreenLaunchComponentEvent/SpecialComponentsFullscreenLaunchComponentEvent0100767')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      
      // 初始状态截图
      Logger.info('TEST', 'Taking initial screenshot');
      windowSnap.snapShot()
      await Utils.sleep(500)
      
      try {
        // 步骤1: 点击"进入全屏模态拖拽测试"按钮
        Logger.info('TEST', 'Step 1: Click enter fullscreen modal drag test button');
        let btnEnterModal: Component = await driver.findComponent(ON.id('SpecialComponentsFullscreenLaunchComponentEvent0100767_003'));
        if (btnEnterModal) {
          await btnEnterModal.click();
          await Utils.sleep(1000) // 等待模态页面打开
          windowSnap.snapShot()
          Logger.info('TEST', 'Fullscreen modal opened for drag test');
        } else {
          Logger.error('TEST', 'Enter modal button not found');
        }
        
        // 等待模态页面完全加载
        await driver.waitForIdle(500, 2000)
        
        // 步骤2: 执行拖拽操作 - 将文本拖入输入框
        Logger.info('TEST', 'Step 2: Drag text to input field');
        
        // 获取可拖拽文本组件
        let dragText: Component = await driver.findComponent(ON.id('ModalDragPage_004'));
        // 获取输入框组件
        let inputField: Component = await driver.findComponent(ON.id('ModalDragPage_006'));
        
        if (dragText && inputField) {
          // 获取拖拽源和目标的位置
          let dragTextBounds = await dragText.getBounds();
          let inputBounds = await inputField.getBounds();
          
          // 计算中心点坐标
          let dragCenterX = dragTextBounds.left + (dragTextBounds.right - dragTextBounds.left) / 2;
          let dragCenterY = dragTextBounds.top + (dragTextBounds.bottom - dragTextBounds.top) / 2;
          let inputCenterX = inputBounds.left + (inputBounds.right - inputBounds.left) / 2;
          let inputCenterY = inputBounds.top + (inputBounds.bottom - inputBounds.top) / 2;
          
          Logger.info('TEST', `Drag source center: (${dragCenterX}, ${dragCenterY})`);
          Logger.info('TEST', `Drop target center: (${inputCenterX}, ${inputCenterY})`);
          
          // 执行拖拽操作：从文本中心拖到输入框中心
          await driver.drag(
            dragCenterX,
            dragCenterY,
            inputCenterX,
            inputCenterY,
            1000 // 拖拽速度（毫秒）
          );
          
          Logger.info('TEST', 'Drag operation executed');
          await Utils.sleep(1000) // 等待拖拽完成和UI更新
          windowSnap.snapShot()
          Logger.info('TEST', 'Drag operation completed');
        } else {
          Logger.error('TEST', 'Drag source or drop target not found');
          if (!dragText) {
            Logger.error('TEST', 'ModalDragPage_004 not found');
          }
          if (!inputField) {
            Logger.error('TEST', 'ModalDragPage_006 not found');
          }
        }
        
        // 验证输入框内容
        Logger.info('TEST', 'Verifying input field content');
        await Utils.sleep(500)
        windowSnap.snapShot()
        
        let displayText: Component = await driver.findComponent(ON.id('ModalDragPage_008'));
        if (displayText) {
          let text = await displayText.getText();
          Logger.info('TEST', `Input field content display text: ${text}`);
          if (text && text !== '(空)') {
            Logger.info('TEST', 'SUCCESS: Input field displays dragged text correctly');
          } else {
            Logger.error('TEST', 'FAILED: Input field is empty, text shows: ' + text);
          }
        } else {
          Logger.error('TEST', 'Display text component (ModalDragPage_008) not found');
        }
        
        // 最终状态截图
        await Utils.sleep(500)
        windowSnap.snapShot()
        Logger.info('TEST', 'Final state captured');
        
      } catch (error) {
        Logger.error('TEST', `Error during test: ${error}`);
      }
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SPECIALCOMPONENTS_FULLSCREENLAUNCHCOMPONENT_EVENT_0100_767 finish.`);
      done()
    })

  })
}