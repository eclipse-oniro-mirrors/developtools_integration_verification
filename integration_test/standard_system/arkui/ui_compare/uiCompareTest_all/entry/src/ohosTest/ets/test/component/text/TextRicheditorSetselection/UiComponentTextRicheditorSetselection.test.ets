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

export default function uiComponentTextRicheditorSetselectionTest() {
  describe('uiComponentTextRicheditorSetselectionTest', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SETSELECTION_0001
     * @tc.name   : Text richeditor setselection
     * @tc.desc   : Verify text richeditor setselection interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SETSELECTION_0001', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SETSELECTION_0001 start.`);
      Settings.createWindow('testability/pages/component/text/TextRicheditorSetselection/UiComponentTextRicheditorSetselection0001');
      let driver: Driver = Driver.create();
      
      await driver.waitForIdle(500, 2000);
      Logger.info('TEST', '页面加载完成，多行文本已加载');
      
      // 步骤1: 点击执行setSelection按钮
      Logger.info('TEST', '步骤1: 点击执行setSelection按钮');
      let execBtn = await driver.waitForComponent(ON.id('execSelectionBtn'), 2000);
      await execBtn.click();
      await driver.waitForIdle(500, 1000);
      Logger.info('TEST', 'setSelection已执行');
      
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SETSELECTION_0001 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SETSELECTION_0002
     * @tc.name   : Text richeditor setselection
     * @tc.desc   : Verify text richeditor setselection interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SETSELECTION_0002', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SETSELECTION_0002 start.`);
      Settings.createWindow('testability/pages/component/text/TextRicheditorSetselection/UiComponentTextRicheditorSetselection0002');
      let driver: Driver = Driver.create();
      
      await driver.waitForIdle(500, 2000);
      Logger.info('TEST', '页面加载完成，多行文本已加载');
      
      // 步骤1: 点击执行setSelection按钮
      Logger.info('TEST', '步骤1: 点击执行setSelection按钮');
      let execBtn = await driver.waitForComponent(ON.id('execSelectionBtn'), 2000);
      await execBtn.click();
      await driver.waitForIdle(500, 1000);
      Logger.info('TEST', 'setSelection已执行');
      
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SETSELECTION_0002 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SETSELECTION_0003
     * @tc.name   : Text richeditor setselection
     * @tc.desc   : Verify text richeditor setselection interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SETSELECTION_0003', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SETSELECTION_0003 start.`);
      Settings.createWindow('testability/pages/component/text/TextRicheditorSetselection/UiComponentTextRicheditorSetselection0003');
      let driver: Driver = Driver.create();
      
      await driver.waitForIdle(500, 2000);
      Logger.info('TEST', '页面加载完成，多行文本已加载');
      
      // 步骤1: 点击执行setSelection按钮
      Logger.info('TEST', '步骤1: 点击执行setSelection按钮');
      let execBtn = await driver.waitForComponent(ON.id('execSelectionBtn'), 2000);
      await execBtn.click();
      await driver.waitForIdle(500, 1000);
      Logger.info('TEST', 'setSelection已执行');
      
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SETSELECTION_0003 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SETSELECTION_0004
     * @tc.name   : Text richeditor setselection
     * @tc.desc   : Verify text richeditor setselection interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SETSELECTION_0004', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SETSELECTION_0004 start.`);
      Settings.createWindow('testability/pages/component/text/TextRicheditorSetselection/UiComponentTextRicheditorSetselection0004');
      let driver: Driver = Driver.create();
      
      await driver.waitForIdle(500, 2000);
      Logger.info('TEST', '页面加载完成，多行文本已加载');
      
      // 步骤1: 点击执行setSelection按钮
      Logger.info('TEST', '步骤1: 点击执行setSelection按钮');
      let execBtn = await driver.waitForComponent(ON.id('execSelectionBtn'), 2000);
      await execBtn.click();
      await driver.waitForIdle(500, 1000);
      Logger.info('TEST', 'setSelection已执行');
      
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SETSELECTION_0004 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SETSELECTION_0005
     * @tc.name   : Text richeditor setselection
     * @tc.desc   : Verify text richeditor setselection interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SETSELECTION_0005', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SETSELECTION_0005 start.`);
      Settings.createWindow('testability/pages/component/text/TextRicheditorSetselection/UiComponentTextRicheditorSetselection0005');
      let driver: Driver = Driver.create();
      
      await driver.waitForIdle(500, 2000);
      Logger.info('TEST', '页面加载完成，多行文本已加载');
      
      // 步骤1: 点击执行setSelection按钮
      Logger.info('TEST', '步骤1: 点击执行setSelection按钮');
      let execBtn = await driver.waitForComponent(ON.id('execSelectionBtn'), 2000);
      await execBtn.click();
      await driver.waitForIdle(500, 1000);
      Logger.info('TEST', 'setSelection已执行');
      
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SETSELECTION_0005 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SETSELECTION_0006
     * @tc.name   : Text richeditor setselection
     * @tc.desc   : Verify text richeditor setselection interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SETSELECTION_0006', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SETSELECTION_0006 start.`);
      Settings.createWindow('testability/pages/component/text/TextRicheditorSetselection/UiComponentTextRicheditorSetselection0006');
      let driver: Driver = Driver.create();
      
      await driver.waitForIdle(500, 2000);
      Logger.info('TEST', '页面加载完成，多行文本已加载');
      
      // 步骤1: 点击执行setSelection按钮
      Logger.info('TEST', '步骤1: 点击执行setSelection按钮');
      let execBtn = await driver.waitForComponent(ON.id('execSelectionBtn'), 2000);
      await execBtn.click();
      await driver.waitForIdle(500, 1000);
      Logger.info('TEST', 'setSelection已执行');
      
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SETSELECTION_0006 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SETSELECTION_0007
     * @tc.name   : Text richeditor setselection
     * @tc.desc   : Verify text richeditor setselection interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SETSELECTION_0007', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SETSELECTION_0007 start.`);
      Settings.createWindow('testability/pages/component/text/TextRicheditorSetselection/UiComponentTextRicheditorSetselection0007');
      let driver: Driver = Driver.create();
      
      await driver.waitForIdle(500, 2000);
      Logger.info('TEST', '页面加载完成，多行文本已加载');
      
      // 步骤1: 点击执行setSelection按钮
      Logger.info('TEST', '步骤1: 点击执行setSelection按钮');
      let execBtn = await driver.waitForComponent(ON.id('execSelectionBtn'), 2000);
      await execBtn.click();
      await driver.waitForIdle(500, 1000);
      Logger.info('TEST', 'setSelection已执行');
      
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SETSELECTION_0007 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SETSELECTION_0008
     * @tc.name   : Text richeditor setselection
     * @tc.desc   : Verify text richeditor setselection interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SETSELECTION_0008', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SETSELECTION_0008 start.`);
      Settings.createWindow('testability/pages/component/text/TextRicheditorSetselection/UiComponentTextRicheditorSetselection0008');
      let driver: Driver = Driver.create();
      
      await driver.waitForIdle(500, 2000);
      Logger.info('TEST', '页面加载完成，多行文本已加载');
      
      // 步骤1: 点击执行setSelection按钮
      Logger.info('TEST', '步骤1: 点击执行setSelection按钮');
      let execBtn = await driver.waitForComponent(ON.id('execSelectionBtn'), 2000);
      await execBtn.click();
      await driver.waitForIdle(500, 1000);
      Logger.info('TEST', 'setSelection已执行');
      
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SETSELECTION_0008 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SETSELECTION_0009
     * @tc.name   : Text richeditor setselection
     * @tc.desc   : Verify text richeditor setselection interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SETSELECTION_0009', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SETSELECTION_0009 start.`);
      Settings.createWindow('testability/pages/component/text/TextRicheditorSetselection/UiComponentTextRicheditorSetselection0009');
      let driver: Driver = Driver.create();
      
      await driver.waitForIdle(500, 2000);
      Logger.info('TEST', '页面加载完成，多行文本已加载');
      
      // 步骤1: 点击执行setSelection按钮
      Logger.info('TEST', '步骤1: 点击执行setSelection按钮');
      let execBtn = await driver.waitForComponent(ON.id('execSelectionBtn'), 2000);
      await execBtn.click();
      await driver.waitForIdle(500, 1000);
      Logger.info('TEST', 'setSelection已执行');
      
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SETSELECTION_0009 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SETSELECTION_0010
     * @tc.name   : Text richeditor setselection
     * @tc.desc   : Verify text richeditor setselection interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SETSELECTION_0010', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SETSELECTION_0010 start.`);
      Settings.createWindow('testability/pages/component/text/TextRicheditorSetselection/UiComponentTextRicheditorSetselection0010');
      let driver: Driver = Driver.create();
      
      await driver.waitForIdle(500, 2000);
      Logger.info('TEST', '页面加载完成，多行文本已加载');
      
      // 步骤1: 点击执行setSelection按钮
      Logger.info('TEST', '步骤1: 点击执行setSelection按钮');
      let execBtn = await driver.waitForComponent(ON.id('execSelectionBtn'), 2000);
      await execBtn.click();
      await driver.waitForIdle(500, 1000);
      Logger.info('TEST', 'setSelection已执行');
      
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SETSELECTION_0010 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SETSELECTION_0011
     * @tc.name   : Text richeditor setselection
     * @tc.desc   : Verify text richeditor setselection interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SETSELECTION_0011', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SETSELECTION_0011 start.`);
      Settings.createWindow('testability/pages/component/text/TextRicheditorSetselection/UiComponentTextRicheditorSetselection0011');
      let driver: Driver = Driver.create();
      
      await driver.waitForIdle(500, 2000);
      Logger.info('TEST', '页面加载完成，多行文本已加载');
      
      // 步骤1: 点击执行setSelection按钮
      Logger.info('TEST', '步骤1: 点击执行setSelection按钮');
      let execBtn = await driver.waitForComponent(ON.id('execSelectionBtn'), 2000);
      await execBtn.click();
      await driver.waitForIdle(500, 1000);
      Logger.info('TEST', 'setSelection已执行');
      
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SETSELECTION_0011 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SETSELECTION_0012
     * @tc.name   : Text richeditor setselection
     * @tc.desc   : Verify text richeditor setselection interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SETSELECTION_0012', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SETSELECTION_0012 start.`);
      Settings.createWindow('testability/pages/component/text/TextRicheditorSetselection/UiComponentTextRicheditorSetselection0012');
      let driver: Driver = Driver.create();
      
      await driver.waitForIdle(500, 2000);
      Logger.info('TEST', '页面加载完成，多行文本已加载');
      
      // 步骤1: 点击执行setSelection按钮
      Logger.info('TEST', '步骤1: 点击执行setSelection按钮');
      let execBtn = await driver.waitForComponent(ON.id('execSelectionBtn'), 2000);
      await execBtn.click();
      await driver.waitForIdle(500, 1000);
      Logger.info('TEST', 'setSelection已执行');
      
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SETSELECTION_0012 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SETSELECTION_0013
     * @tc.name   : Text richeditor setselection
     * @tc.desc   : Verify text richeditor setselection interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SETSELECTION_0013', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SETSELECTION_0013 start.`);
      Settings.createWindow('testability/pages/component/text/TextRicheditorSetselection/UiComponentTextRicheditorSetselection0013');
      let driver: Driver = Driver.create();
      
      await driver.waitForIdle(500, 2000);
      Logger.info('TEST', '页面加载完成，多行文本已加载');
      
      // 步骤1: 点击执行setSelection按钮
      Logger.info('TEST', '步骤1: 点击执行setSelection按钮');
      let execBtn = await driver.waitForComponent(ON.id('execSelectionBtn'), 2000);
      await execBtn.click();
      await driver.waitForIdle(500, 1000);
      Logger.info('TEST', 'setSelection已执行');
      
      // 步骤2: 改变宽度
      Logger.info('TEST', '步骤2: 点击改变宽度按钮');
      let widthBtn = await driver.waitForComponent(ON.id('changeWidthBtn'), 2000);
      await widthBtn.click();
      await driver.waitForIdle(500, 1000);
      
      // 步骤3: 重新选中
      Logger.info('TEST', '步骤3: 点击重新选中按钮');
      let reSelectBtn = await driver.waitForComponent(ON.id('reSelectBtn'), 2000);
      await reSelectBtn.click();
      await driver.waitForIdle(500, 1000);
      
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_SETSELECTION_0013 finish.`);
      done();
    });

  });
}