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

export default function uiComponentTextRicheditorGundongtiaoTest() {
  describe('uiComponentTextRicheditorGundongtiaoTest', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_gundongtiao_0007
     * @tc.name   : Text richeditor gundongtiao
     * @tc.desc   : Verify text richeditor gundongtiao interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_gundongtiao_0007', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_gundongtiao_0007 start.`);
      Settings.createWindow('testability/pages/component/text/TextRicheditorGundongtiaoAlt/UiComponentTextRicheditorGundongtiao0007');
      let driver: Driver = Driver.create();
      
      await driver.waitForIdle(500, 2000);
      Logger.info('TEST', '页面加载完成，RichEditor已加载大量内容');
      
      // 步骤1: 点击功能按钮
      Logger.info('TEST', '步骤1: 点击widthPlusBtn按钮');
      let btn1 = await driver.waitForComponent(ON.id('widthPlusBtn'), 2000);
      await btn1.click();
      await driver.waitForIdle(500, 1000);
      
      // 步骤2: 点击功能按钮
      Logger.info('TEST', '步骤2: 点击heightPlusBtn按钮');
      let btn2 = await driver.waitForComponent(ON.id('heightPlusBtn'), 2000);
      await btn2.click();
      await driver.waitForIdle(500, 1000);
      
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_gundongtiao_0007 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_gundongtiao_0008
     * @tc.name   : Text richeditor gundongtiao
     * @tc.desc   : Verify text richeditor gundongtiao interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_gundongtiao_0008', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_gundongtiao_0008 start.`);
      Settings.createWindow('testability/pages/component/text/TextRicheditorGundongtiaoAlt/UiComponentTextRicheditorGundongtiao0008');
      let driver: Driver = Driver.create();
      
      await driver.waitForIdle(500, 2000);
      Logger.info('TEST', '页面加载完成，RichEditor已加载大量内容');
      
      // 步骤1: 点击功能按钮
      Logger.info('TEST', '步骤1: 点击rotateBtn按钮');
      let btn1 = await driver.waitForComponent(ON.id('rotateBtn'), 2000);
      await btn1.click();
      await driver.waitForIdle(500, 1000);
      
      // 步骤2: 点击功能按钮
      Logger.info('TEST', '步骤2: 点击scaleBtn按钮');
      let btn2 = await driver.waitForComponent(ON.id('scaleBtn'), 2000);
      await btn2.click();
      await driver.waitForIdle(500, 1000);
      
      // 步骤3: 点击功能按钮
      Logger.info('TEST', '步骤3: 点击translateBtn按钮');
      let btn3 = await driver.waitForComponent(ON.id('translateBtn'), 2000);
      await btn3.click();
      await driver.waitForIdle(500, 1000);
      
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_gundongtiao_0008 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_gundongtiao_0012
     * @tc.name   : Text richeditor gundongtiao
     * @tc.desc   : Verify text richeditor gundongtiao interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_gundongtiao_0012', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_gundongtiao_0012 start.`);
      Settings.createWindow('testability/pages/component/text/TextRicheditorGundongtiaoAlt/UiComponentTextRicheditorGundongtiao0012');
      let driver: Driver = Driver.create();
      
      await driver.waitForIdle(500, 2000);
      Logger.info('TEST', '页面加载完成，RichEditor已加载大量内容');
      
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_gundongtiao_0012 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_gundongtiao_0013
     * @tc.name   : Text richeditor gundongtiao
     * @tc.desc   : Verify text richeditor gundongtiao interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_gundongtiao_0013', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_gundongtiao_0013 start.`);
      Settings.createWindow('testability/pages/component/text/TextRicheditorGundongtiaoAlt/UiComponentTextRicheditorGundongtiao0013');
      let driver: Driver = Driver.create();
      
      await driver.waitForIdle(500, 2000);
      Logger.info('TEST', '页面加载完成，RichEditor已加载大量内容');
      
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_gundongtiao_0013 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_gundongtiao_0014
     * @tc.name   : Text richeditor gundongtiao
     * @tc.desc   : Verify text richeditor gundongtiao interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_gundongtiao_0014', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_gundongtiao_0014 start.`);
      Settings.createWindow('testability/pages/component/text/TextRicheditorGundongtiaoAlt/UiComponentTextRicheditorGundongtiao0014');
      let driver: Driver = Driver.create();
      
      await driver.waitForIdle(500, 2000);
      Logger.info('TEST', '页面加载完成，RichEditor已加载大量内容');
      
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_gundongtiao_0014 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_gundongtiao_0016
     * @tc.name   : Text richeditor gundongtiao
     * @tc.desc   : Verify text richeditor gundongtiao interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_gundongtiao_0016', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_gundongtiao_0016 start.`);
      Settings.createWindow('testability/pages/component/text/TextRicheditorGundongtiaoAlt/UiComponentTextRicheditorGundongtiao0016');
      let driver: Driver = Driver.create();
      
      await driver.waitForIdle(500, 2000);
      Logger.info('TEST', '页面加载完成，RichEditor已加载大量内容');
      
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_gundongtiao_0016 finish.`);
      done();
    });

  });
}