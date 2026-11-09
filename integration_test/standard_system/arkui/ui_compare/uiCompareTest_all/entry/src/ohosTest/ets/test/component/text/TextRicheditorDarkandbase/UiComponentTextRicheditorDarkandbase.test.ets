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

import { describe, it, afterEach } from '@ohos/hypium';
import Settings from '../../../model/Settings';
import windowSnap from '../../../model/snapShot';
import Logger from '../../../model/Logger';
import Utils from '../../../model/Utils';
import { Driver, ON, Component } from '@kit.TestKit';

export default function uiComponentTextRicheditorDarkandbaseTest() {
  describe('uiComponentTextRicheditorDarkandbaseTest', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        return;
      }
      Settings.windowClass.destroyWindow((err) => {
        if (err.code) {
          Logger.error('TEST', `Failed to destroy the window. Cause : ${JSON.stringify(err)}`);
          return;
        }
        Logger.info('TEST', `Succeeded in destroy the window.`);
      });
      await Utils.sleep(1000);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_darkandbase_0021
     * @tc.name   : Text richeditor darkandbase
     * @tc.desc   : Verify text richeditor darkandbase interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_darkandbase_0021', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_darkandbase_0021 start.`);
      Settings.createWindow('testability/pages/component/text/TextRicheditorDarkandbase/UiComponentTextRicheditorDarkandbase0021');
      let driver: Driver = Driver.create();
      
      await driver.waitForIdle(500, 2000);
      Logger.info('TEST', '页面加载完成，初始文本和settypingstyle已设置');
      
      // 步骤1: 点击切换深色模式
      Logger.info('TEST', '步骤1: 点击切换深色模式按钮');
      let darkModeBtn = await driver.waitForComponent(ON.id('toggleDarkModeBtn'), 2000);
      await darkModeBtn.click();
      await driver.waitForIdle(500, 1000);
      
      // 步骤2: 点击模拟拖拽
      Logger.info('TEST', '步骤2: 点击模拟拖拽按钮');
      let dragBtn = await driver.waitForComponent(ON.id('simulateDragBtn'), 2000);
      await dragBtn.click();
      await driver.waitForIdle(500, 1000);
      
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_darkandbase_0021 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_darkandbase_0022
     * @tc.name   : Text richeditor darkandbase
     * @tc.desc   : Verify text richeditor darkandbase interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_darkandbase_0022', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_darkandbase_0022 start.`);
      Settings.createWindow('testability/pages/component/text/TextRicheditorDarkandbase/UiComponentTextRicheditorDarkandbase0022');
      let driver: Driver = Driver.create();
      
      await driver.waitForIdle(500, 2000);
      Logger.info('TEST', '页面加载完成');
      
      // 步骤1: 点击切换深色模式
      Logger.info('TEST', '步骤1: 点击切换深色模式按钮');
      let darkModeBtn = await driver.waitForComponent(ON.id('toggleDarkModeBtn'), 2000);
      await darkModeBtn.click();
      await driver.waitForIdle(500, 1000);
      
      // 步骤2: 点击模拟粘贴
      Logger.info('TEST', '步骤2: 点击模拟粘贴按钮');
      let pasteBtn = await driver.waitForComponent(ON.id('simulatePasteBtn'), 2000);
      await pasteBtn.click();
      await driver.waitForIdle(500, 1000);
      
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_darkandbase_0022 finish.`);
      done();
    });

  });
}