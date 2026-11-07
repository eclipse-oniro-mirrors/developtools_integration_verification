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

import { describe, afterEach, it, Level } from '@ohos/hypium'
import Settings from '../../../model/Settings'
import windowSnap from '../../../model/snapShot'
import Logger from '../../../model/Logger'
import Utils from '../../../model/Utils'
import { Driver, ON, } from '@kit.TestKit';

export default function focusSegmentButtonTest() {

  describe('focusSegmentButtonTest', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_A11Y_0010
     * @tc.name   : Button segmentbuttom a11y
     * @tc.desc   : Verify button segmentbuttom a11y interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_A11Y_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_A11Y_0010 start.`);
      try {
        Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButton/SegmentButton0010');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        // 查找SegmentButton组件
        let segmentButton = await driver.findComponent(ON.id('segmentButton0010'));
        Logger.info('TEST', `Found SegmentButton component`);

        // 步骤1：点击多选类分段按钮的第一个按钮
        Logger.info('TEST', `Step 1: Click first button - expect focus and announcement (未选中，hello，按钮，单指双击即选中)`);
        await segmentButton.click();
        await driver.waitForIdle(1000, 2000);

        // 步骤2：单指双击多选类分段按钮的第一个按钮
        Logger.info('TEST', `Step 2: Double click first button - expect announcement (已选中)`);
        await segmentButton.doubleClick();
        await driver.waitForIdle(1000, 2000);

        // 步骤3：同步骤1 - 再次点击第一个按钮
        Logger.info('TEST', `Step 3: Click first button again - expect announcement (已选中，hello，按钮，单指双击即可取消选中)`);
        await segmentButton.click();
        await driver.waitForIdle(1000, 2000);

        // 步骤4：同步骤2 - 再次双击第一个按钮
        Logger.info('TEST', `Step 4: Double click first button again - expect announcement (未选中)`);
        await segmentButton.doubleClick();
        await driver.waitForIdle(1000, 2000);
        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_A11Y_0010 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_A11Y_0010 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_A11Y_0020
     * @tc.name   : Button segmentbuttom a11y
     * @tc.desc   : Verify button segmentbuttom a11y interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_A11Y_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_A11Y_0020 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButton/SegmentButton0020');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        // 查找SegmentButton组件
        let segmentButton = await driver.findComponent(ON.id('segmentButton0020'));
        Logger.info('TEST', `Found SegmentButton component`);

        // 步骤1：点击多选类分段按钮的第三个按钮
        Logger.info('TEST', `Step 1: Click third button - expect focus and announcement (未选中，未选中 666，666，按钮，新手提醒 666)`);
        await segmentButton.click();
        await driver.waitForIdle(1000, 2000);

        // 步骤2：单指双击多选类分段按钮的第三个按钮
        Logger.info('TEST', `Step 2: Double click third button - expect announcement (已选中)`);
        await segmentButton.doubleClick();
        await driver.waitForIdle(1000, 2000);

        // 步骤3：同步骤1 - 再次点击第三个按钮
        Logger.info('TEST', `Step 3: Click third button again - expect announcement (已选中，已选中 666，666，按钮，新手提醒 666)`);
        await segmentButton.click();
        await driver.waitForIdle(1000, 2000);

        // 步骤4：同步骤2 - 再次双击第三个按钮
        Logger.info('TEST', `Step 4: Double click third button again - expect announcement (未选中)`);
        await segmentButton.doubleClick();
        await driver.waitForIdle(1000, 2000);
        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_A11Y_0020 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_A11Y_0020 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_A11Y_0030
     * @tc.name   : Button segmentbuttom a11y
     * @tc.desc   : Verify button segmentbuttom a11y interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_A11Y_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_A11Y_0030 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButton/SegmentButton0030');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        // 查找SegmentButton组件
        let segmentButton = await driver.findComponent(ON.id('segmentButton0030'));
        Logger.info('TEST', `Found SegmentButton component`);

        // 步骤1：点击'大香蕉'页签类分段按钮
        // 预期：绿色焦点不会聚焦，不会播报
        Logger.info('TEST', `Step 1: Click '大香蕉' tab button - expect no focus, no announcement (accessibilityLevel: no)`);
        await segmentButton.click();
        await driver.waitForIdle(1000, 2000);
        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_A11Y_0030 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_A11Y_0030 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_A11Y_0050
     * @tc.name   : Button segmentbuttom a11y
     * @tc.desc   : Verify button segmentbuttom a11y interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_A11Y_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_A11Y_0050 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButton/SegmentButton0050');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        // 查找SegmentButton组件
        let segmentButton = await driver.findComponent(ON.id('segmentButton0050'));
        Logger.info('TEST', `Found SegmentButton component`);

        // 步骤1：点击'666'页签类分段按钮
        Logger.info('TEST', `Step 1: Click '666' tab button - expect focus and announcement (666，按钮，666)`);
        await segmentButton.click();
        await driver.waitForIdle(1000, 2000);

        // 步骤2：单指双击'666'页签类分段按钮
        Logger.info('TEST', `Step 2: Double click '666' tab button - expect announcement (已选中)`);
        await segmentButton.doubleClick();
        await driver.waitForIdle(1000, 2000);

        // 步骤3：同步骤1 - 再次点击'666'页签类分段按钮
        Logger.info('TEST', `Step 3: Click '666' tab button again - expect announcement (已选中，666，按钮，666)`);
        await segmentButton.click();
        await driver.waitForIdle(1000, 2000);
        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_A11Y_0050 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_A11Y_0050 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_A11Y_0100
     * @tc.name   : Button segmentbuttom a11y
     * @tc.desc   : Verify button segmentbuttom a11y interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_A11Y_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_A11Y_0100 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButton/SegmentButton0100');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        // 查找SegmentButton组件
        let segmentButton = await driver.findComponent(ON.id('segmentButton0100'));
        Logger.info('TEST', `Found SegmentButton component`);

        // 步骤1：点击单选类分段按钮的第一个按钮
        Logger.info('TEST', `Step 1: Click first button - expect focus and announcement (按钮，单指双击即可执行)`);
        await segmentButton.click();
        await driver.waitForIdle(1000, 2000);

        // 步骤2：单指双击单选类分段按钮的第一个按钮
        Logger.info('TEST', `Step 2: Double click first button - expect announcement (已选中)`);
        await segmentButton.doubleClick();
        await driver.waitForIdle(1000, 2000);

        // 步骤3：同步骤1 - 再次点击第一个按钮
        Logger.info('TEST', `Step 3: Click first button again - expect announcement (已选中，按钮，单指双击即可执行)`);
        await segmentButton.click();
        await driver.waitForIdle(1000, 2000);
        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_A11Y_0100 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_A11Y_0100 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_ACTION_0010
     * @tc.name   : Button segmentbuttom action
     * @tc.desc   : Verify button segmentbuttom action interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_ACTION_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_ACTION_0010 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButton/SegmentButtonAction0010');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        // 查找SegmentButton组件
        let segmentButton = await driver.findComponent(ON.id('segmentButtonAction0010'));
        Logger.info('TEST', `Found SegmentButton component with long text`);


        // 点击超长文本的第一个按钮
        Logger.info('TEST', `Click first button with long text`);
        await segmentButton.click();
        await driver.waitForIdle(1000, 2000);
        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_ACTION_0010 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_ACTION_0010 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_ACTION_0020
     * @tc.name   : Button segmentbuttom action
     * @tc.desc   : Verify button segmentbuttom action interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_ACTION_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_ACTION_0020 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButton/SegmentButtonAction0020');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        // 查找SegmentButton组件
        let segmentButton = await driver.findComponent(ON.id('segmentButtonAction0020'));
        Logger.info('TEST', `Found SegmentButton component with icon and long text`);

        // 点击超长文本+图片的第一个按钮
        // 预期：文字超长时，文字逐级缩小（最小到9），如果继续超长，显示…
        Logger.info('TEST', `Click first button with icon and long text - expect text to shrink or show ellipsis`);
        await segmentButton.click();
        await driver.waitForIdle(1000, 2000);
        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_ACTION_0020 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_ACTION_0020 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_ACTION_0030
     * @tc.name   : Button segmentbuttom action
     * @tc.desc   : Verify button segmentbuttom action interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_ACTION_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_ACTION_0030 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButton/SegmentButtonAction0030');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        // 查找SegmentButton组件
        let segmentButton = await driver.findComponent(ON.id('segmentButtonAction0030'));
        Logger.info('TEST', `Found single select capsule SegmentButton component with long text`);

        // 点击超长文本的第一个按钮
        // 预期：文字超长时，文字逐级缩小（最小到9），如果继续超长，显示…
        Logger.info('TEST', `Click first button - expect text to shrink or show ellipsis`);
        await segmentButton.click();
        await driver.waitForIdle(1000, 2000);
        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_ACTION_0030 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_ACTION_0030 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_ACTION_0040
     * @tc.name   : Button segmentbuttom action
     * @tc.desc   : Verify button segmentbuttom action interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_ACTION_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_ACTION_0040 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButton/SegmentButtonAction0040');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        // 查找SegmentButton组件
        let segmentButton = await driver.findComponent(ON.id('segmentButtonAction0040'));
        Logger.info('TEST', `Found single select capsule SegmentButton component with icon and long text`);

        // 点击超长文本+图片的第一个按钮
        // 预期：文字超长时，文字逐级缩小（最小到9），如果继续超长，显示…
        Logger.info('TEST', `Click first button with icon - expect text to shrink or show ellipsis`);
        await segmentButton.click();
        await driver.waitForIdle(1000, 2000);
        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_ACTION_0040 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_ACTION_0040 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_ACTION_0050
     * @tc.name   : Button segmentbuttom action
     * @tc.desc   : Verify button segmentbuttom action interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_ACTION_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_ACTION_0050 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButton/SegmentButtonAction0050');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        // 查找SegmentButton组件
        let segmentButton = await driver.findComponent(ON.id('segmentButtonAction0050'));
        Logger.info('TEST', `Found multiply select capsule SegmentButton component with long text`);

        // 点击超长文本的第一个按钮
        // 预期：文字超长时，文字逐级缩小（最小到9），如果继续超长，显示…
        Logger.info('TEST', `Click first button - expect text to shrink or show ellipsis`);
        await segmentButton.click();
        await driver.waitForIdle(1000, 2000);
        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_ACTION_0050 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_ACTION_0050 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_ACTION_0060
     * @tc.name   : Button segmentbuttom action
     * @tc.desc   : Verify button segmentbuttom action interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_ACTION_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_ACTION_0060 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButton/SegmentButtonAction0060');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        // 查找SegmentButton组件
        let segmentButton = await driver.findComponent(ON.id('segmentButtonAction0060'));
        Logger.info('TEST', `Found multiply select capsule SegmentButton component with icon and long text`);

        // 点击超长文本+图片的第一个按钮
        // 预期：文字超长时，文字逐级缩小（最小到9），如果继续超长，显示…
        Logger.info('TEST', `Click first button with icon - expect text to shrink or show ellipsis`);
        await segmentButton.click();
        await driver.waitForIdle(1000, 2000);
        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_ACTION_0060 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_ACTION_0060 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_ACTION_0070
     * @tc.name   : Button segmentbuttom action
     * @tc.desc   : Verify button segmentbuttom action interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_ACTION_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_ACTION_0070 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButton/SegmentButtonAction0070');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        // 查找SegmentButton组件和切换按钮
        let segmentButton = await driver.findComponent(ON.id('segmentButtonAction0070'));
        Logger.info('TEST', `Found SegmentButton component with text buttons (textPadding set)`);


        // 点击切换按钮
        let switchButton = await driver.findComponent(ON.text('切换按钮类型'));
        Logger.info('TEST', `Click switch button to change to icon buttons`);
        await switchButton.click();
        await driver.waitForIdle(1000, 2000);

        // 截图：图片按钮状态（不继承textPadding）
        // 预期：图片按钮不会继承文本的textPadding
        Logger.info('TEST', `Capture switched state - icon buttons should not inherit textPadding`);
        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_ACTION_0070 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_ACTION_0070 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0010
     * @tc.name   : Button segmentbuttom aging
     * @tc.desc   : Verify button segmentbuttom aging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0010 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButton/SegmentButtonAging0010');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        // 查找SegmentButton组件
        let segmentButton = await driver.findComponent(ON.id('segmentButtonAging0010'));
        Logger.info('TEST', `Found SegmentButton component with maxFontScale=2`);

        // 测试说明：依次点击按钮切换适老化档位，观察字体大小和粗细变化
        // 预期结果（根据适老化规范，maxFontScale=2）：

        // 标准档：1倍
        Logger.info('TEST', `Click 标准档 (1倍)`);
        let btn1 = await driver.findComponent(ON.id('fontScale_1'));
        await btn1.click();
        await driver.waitForIdle(1000, 2000);

        // 大1档：1.15倍
        Logger.info('TEST', `Click 大1档 (1.15倍)`);
        let btn2 = await driver.findComponent(ON.id('fontScale_1_15'));
        await btn2.click();
        await driver.waitForIdle(1000, 2000);

        // 大2档：1.3倍
        Logger.info('TEST', `Click 大2档 (1.3倍)`);
        let btn3 = await driver.findComponent(ON.id('fontScale_1_3'));
        await btn3.click();
        await driver.waitForIdle(1000, 2000);

        // 大3档：1.45倍
        Logger.info('TEST', `Click 大3档 (1.45倍)`);
        let btn4 = await driver.findComponent(ON.id('fontScale_1_45'));
        await btn4.click();
        await driver.waitForIdle(1000, 2000);

        // 大4档：1.75倍
        Logger.info('TEST', `Click 大4档 (1.75倍)`);
        let btn5 = await driver.findComponent(ON.id('fontScale_1_75'));
        await btn5.click();
        await driver.waitForIdle(1000, 2000);

        // 大5档：2倍（达到maxFontScale限制）
        Logger.info('TEST', `Click 大5档 (2倍，达到maxFontScale限制)`);
        let btn6 = await driver.findComponent(ON.id('fontScale_2'));
        await btn6.click();
        await driver.waitForIdle(1000, 2000);

        // 大6档：2.5倍（受maxFontScale=2限制，实际显示2倍）
        Logger.info('TEST', `Click 大6档 (2.5倍设置，受maxFontScale=2限制，实际显示2倍)`);
        let btn7 = await driver.findComponent(ON.id('fontScale_2_5'));
        await btn7.click();
        await driver.waitForIdle(1000, 2000);

        // 仅在最后截图一次
        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0010 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0010 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0020
     * @tc.name   : Button segmentbuttom aging
     * @tc.desc   : Verify button segmentbuttom aging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0020 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButton/SegmentButtonAging0020');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        let segmentButton = await driver.findComponent(ON.id('segmentButtonAging0020'));
        Logger.info('TEST', `Found SegmentButton component with maxFontScale=1.75`);

        Logger.info('TEST', `Click 标准档 (1倍)`);
        let btn1 = await driver.findComponent(ON.id('fontScale_1'));
        await btn1.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大1档 (1.15倍)`);
        let btn2 = await driver.findComponent(ON.id('fontScale_1_15'));
        await btn2.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大2档 (1.3倍)`);
        let btn3 = await driver.findComponent(ON.id('fontScale_1_3'));
        await btn3.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大3档 (1.45倍)`);
        let btn4 = await driver.findComponent(ON.id('fontScale_1_45'));
        await btn4.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大4档 (1.75倍，达到maxFontScale限制)`);
        let btn5 = await driver.findComponent(ON.id('fontScale_1_75'));
        await btn5.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大5档 (2倍设置，受maxFontScale=1.75限制，实际显示1.75倍)`);
        let btn6 = await driver.findComponent(ON.id('fontScale_2'));
        await btn6.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大6档 (2.5倍设置，受maxFontScale=1.75限制，实际显示1.75倍)`);
        let btn7 = await driver.findComponent(ON.id('fontScale_2_5'));
        await btn7.click();
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0020 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0020 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0030
     * @tc.name   : Button segmentbuttom aging
     * @tc.desc   : Verify button segmentbuttom aging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0030 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButton/SegmentButtonAging0030');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        let segmentButton = await driver.findComponent(ON.id('segmentButtonAging0030'));
        Logger.info('TEST', `Found SegmentButton component with maxFontScale=1.75`);

        Logger.info('TEST', `Click 标准档 (1倍)`);
        let btn1 = await driver.findComponent(ON.id('fontScale_1'));
        await btn1.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大1档 (1.15倍)`);
        let btn2 = await driver.findComponent(ON.id('fontScale_1_15'));
        await btn2.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大2档 (1.3倍)`);
        let btn3 = await driver.findComponent(ON.id('fontScale_1_3'));
        await btn3.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大3档 (1.45倍)`);
        let btn4 = await driver.findComponent(ON.id('fontScale_1_45'));
        await btn4.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大4档 (1.75倍，达到maxFontScale限制)`);
        let btn5 = await driver.findComponent(ON.id('fontScale_1_75'));
        await btn5.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大5档 (2倍设置，受maxFontScale=1.75限制，实际显示1.75倍)`);
        let btn6 = await driver.findComponent(ON.id('fontScale_2'));
        await btn6.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大6档 (2.5倍设置，受maxFontScale=1.75限制，实际显示1.75倍)`);
        let btn7 = await driver.findComponent(ON.id('fontScale_2_5'));
        await btn7.click();
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0030 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0030 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0050
     * @tc.name   : Button segmentbuttom aging
     * @tc.desc   : Verify button segmentbuttom aging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0050 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButton/SegmentButtonAging0050');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        let segmentButton = await driver.findComponent(ON.id('segmentButtonAging0050'));
        Logger.info('TEST', `Found SegmentButton component with maxFontScale=1.15`);

        Logger.info('TEST', `Click 标准档 (1倍)`);
        let btn1 = await driver.findComponent(ON.id('fontScale_1'));
        await btn1.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大1档 (1.15倍，达到maxFontScale限制)`);
        let btn2 = await driver.findComponent(ON.id('fontScale_1_15'));
        await btn2.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大2档 (1.3倍设置，受maxFontScale=1.15限制，实际显示1.15倍)`);
        let btn3 = await driver.findComponent(ON.id('fontScale_1_3'));
        await btn3.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大3档 (1.45倍设置，受maxFontScale=1.15限制，实际显示1.15倍)`);
        let btn4 = await driver.findComponent(ON.id('fontScale_1_45'));
        await btn4.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大4档 (1.75倍设置，受maxFontScale=1.15限制，实际显示1.15倍)`);
        let btn5 = await driver.findComponent(ON.id('fontScale_1_75'));
        await btn5.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大5档 (2倍设置，受maxFontScale=1.15限制，实际显示1.15倍)`);
        let btn6 = await driver.findComponent(ON.id('fontScale_2'));
        await btn6.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大6档 (2.5倍设置，受maxFontScale=1.15限制，实际显示1.15倍)`);
        let btn7 = await driver.findComponent(ON.id('fontScale_2_5'));
        await btn7.click();
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0050 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0050 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0100
     * @tc.name   : Button segmentbuttom aging
     * @tc.desc   : Verify button segmentbuttom aging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0100 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButton/SegmentButtonAging0100');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        let segmentButton = await driver.findComponent(ON.id('segmentButtonAging0100'));
        Logger.info('TEST', `Found SegmentButton component with maxFontScale=1.75`);

        Logger.info('TEST', `Click 标准档 (1倍)`);
        let btn1 = await driver.findComponent(ON.id('fontScale_1'));
        await btn1.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大1档 (1.15倍)`);
        let btn2 = await driver.findComponent(ON.id('fontScale_1_15'));
        await btn2.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大2档 (1.3倍)`);
        let btn3 = await driver.findComponent(ON.id('fontScale_1_3'));
        await btn3.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大3档 (1.45倍)`);
        let btn4 = await driver.findComponent(ON.id('fontScale_1_45'));
        await btn4.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大4档 (1.75倍，达到maxFontScale限制)`);
        let btn5 = await driver.findComponent(ON.id('fontScale_1_75'));
        await btn5.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大5档 (2倍设置，受maxFontScale=1.75限制，实际显示1.75倍)`);
        let btn6 = await driver.findComponent(ON.id('fontScale_2'));
        await btn6.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大6档 (2.5倍设置，受maxFontScale=1.75限制，实际显示1.75倍)`);
        let btn7 = await driver.findComponent(ON.id('fontScale_2_5'));
        await btn7.click();
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0100 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0100 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0130
     * @tc.name   : Button segmentbuttom aging
     * @tc.desc   : Verify button segmentbuttom aging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0130 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButton/SegmentButtonAging0130');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        let segmentButton = await driver.findComponent(ON.id('segmentButtonAging0130'));
        Logger.info('TEST', `Found SegmentButton component with maxFontScale=0.5 (小于1按1处理)`);

        Logger.info('TEST', `Click 标准档 (1倍)`);
        let btn1 = await driver.findComponent(ON.id('fontScale_1'));
        await btn1.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大1档 (1.15倍设置，受maxFontScale=0.5限制，实际显示1倍)`);
        let btn2 = await driver.findComponent(ON.id('fontScale_1_15'));
        await btn2.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大2档 (1.3倍设置，受maxFontScale=0.5限制，实际显示1倍)`);
        let btn3 = await driver.findComponent(ON.id('fontScale_1_3'));
        await btn3.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大3档 (1.45倍设置，受maxFontScale=0.5限制，实际显示1倍)`);
        let btn4 = await driver.findComponent(ON.id('fontScale_1_45'));
        await btn4.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大4档 (1.75倍设置，受maxFontScale=0.5限制，实际显示1倍)`);
        let btn5 = await driver.findComponent(ON.id('fontScale_1_75'));
        await btn5.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大5档 (2倍设置，受maxFontScale=0.5限制，实际显示1倍)`);
        let btn6 = await driver.findComponent(ON.id('fontScale_2'));
        await btn6.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大6档 (2.5倍设置，受maxFontScale=0.5限制，实际显示1倍)`);
        let btn7 = await driver.findComponent(ON.id('fontScale_2_5'));
        await btn7.click();
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0130 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0130 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0140
     * @tc.name   : Button segmentbuttom aging
     * @tc.desc   : Verify button segmentbuttom aging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0140 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButton/SegmentButtonAging0140');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        let segmentButton = await driver.findComponent(ON.id('segmentButtonAging0140'));
        Logger.info('TEST', `Found SegmentButton component with maxFontScale=1`);

        Logger.info('TEST', `Click 标准档 (1倍)`);
        let btn1 = await driver.findComponent(ON.id('fontScale_1'));
        await btn1.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大1档 (1.15倍设置，受maxFontScale=1限制，实际显示1倍)`);
        let btn2 = await driver.findComponent(ON.id('fontScale_1_15'));
        await btn2.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大2档 (1.3倍设置，受maxFontScale=1限制，实际显示1倍)`);
        let btn3 = await driver.findComponent(ON.id('fontScale_1_3'));
        await btn3.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大3档 (1.45倍设置，受maxFontScale=1限制，实际显示1倍)`);
        let btn4 = await driver.findComponent(ON.id('fontScale_1_45'));
        await btn4.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大4档 (1.75倍设置，受maxFontScale=1限制，实际显示1倍)`);
        let btn5 = await driver.findComponent(ON.id('fontScale_1_75'));
        await btn5.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大5档 (2倍设置，受maxFontScale=1限制，实际显示1倍)`);
        let btn6 = await driver.findComponent(ON.id('fontScale_2'));
        await btn6.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大6档 (2.5倍设置，受maxFontScale=1限制，实际显示1倍)`);
        let btn7 = await driver.findComponent(ON.id('fontScale_2_5'));
        await btn7.click();
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0140 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0140 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0150
     * @tc.name   : Button segmentbuttom aging
     * @tc.desc   : Verify button segmentbuttom aging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0150 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButton/SegmentButtonAging0150');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        let segmentButton = await driver.findComponent(ON.id('segmentButtonAging0150'));
        Logger.info('TEST', `Found SegmentButton component with maxFontScale=undefined (默认为1)`);

        Logger.info('TEST', `Click 标准档 (1倍)`);
        let btn1 = await driver.findComponent(ON.id('fontScale_1'));
        await btn1.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大1档 (1.15倍设置，受maxFontScale=undefined限制，实际显示1倍)`);
        let btn2 = await driver.findComponent(ON.id('fontScale_1_15'));
        await btn2.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大2档 (1.3倍设置，受maxFontScale=undefined限制，实际显示1倍)`);
        let btn3 = await driver.findComponent(ON.id('fontScale_1_3'));
        await btn3.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大3档 (1.45倍设置，受maxFontScale=undefined限制，实际显示1倍)`);
        let btn4 = await driver.findComponent(ON.id('fontScale_1_45'));
        await btn4.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大4档 (1.75倍设置，受maxFontScale=undefined限制，实际显示1倍)`);
        let btn5 = await driver.findComponent(ON.id('fontScale_1_75'));
        await btn5.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大5档 (2倍设置，受maxFontScale=undefined限制，实际显示1倍)`);
        let btn6 = await driver.findComponent(ON.id('fontScale_2'));
        await btn6.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大6档 (2.5倍设置，受maxFontScale=undefined限制，实际显示1倍)`);
        let btn7 = await driver.findComponent(ON.id('fontScale_2_5'));
        await btn7.click();
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0150 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0150 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0170
     * @tc.name   : Button segmentbuttom aging
     * @tc.desc   : Verify button segmentbuttom aging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0170 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButton/SegmentButtonAging0170');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        let segmentButton = await driver.findComponent(ON.id('segmentButtonAging0170'));
        Logger.info('TEST', `Found SegmentButton component with maxFontScale=1.3`);

        Logger.info('TEST', `Click 标准档 (1倍)`);
        let btn1 = await driver.findComponent(ON.id('fontScale_1'));
        await btn1.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大1档 (1.15倍)`);
        let btn2 = await driver.findComponent(ON.id('fontScale_1_15'));
        await btn2.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大2档 (1.3倍，达到maxFontScale限制)`);
        let btn3 = await driver.findComponent(ON.id('fontScale_1_3'));
        await btn3.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大3档 (1.45倍设置，受maxFontScale=1.3限制，实际显示1.3倍)`);
        let btn4 = await driver.findComponent(ON.id('fontScale_1_45'));
        await btn4.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大4档 (1.75倍设置，受maxFontScale=1.3限制，实际显示1.3倍)`);
        let btn5 = await driver.findComponent(ON.id('fontScale_1_75'));
        await btn5.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大5档 (2倍设置，受maxFontScale=1.3限制，实际显示1.3倍)`);
        let btn6 = await driver.findComponent(ON.id('fontScale_2'));
        await btn6.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大6档 (2.5倍设置，受maxFontScale=1.3限制，实际显示1.3倍)`);
        let btn7 = await driver.findComponent(ON.id('fontScale_2_5'));
        await btn7.click();
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0170 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0170 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0200
     * @tc.name   : Button segmentbuttom aging
     * @tc.desc   : Verify button segmentbuttom aging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0200', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0200 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButton/SegmentButtonAging0200');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        let segmentButton = await driver.findComponent(ON.id('segmentButtonAging0200'));
        Logger.info('TEST', `Found SegmentButton component with maxFontScale=2`);

        Logger.info('TEST', `Click 标准档 (1倍)`);
        let btn1 = await driver.findComponent(ON.id('fontScale_1'));
        await btn1.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大1档 (1.15倍)`);
        let btn2 = await driver.findComponent(ON.id('fontScale_1_15'));
        await btn2.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大2档 (1.3倍)`);
        let btn3 = await driver.findComponent(ON.id('fontScale_1_3'));
        await btn3.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大3档 (1.45倍)`);
        let btn4 = await driver.findComponent(ON.id('fontScale_1_45'));
        await btn4.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大4档 (1.75倍)`);
        let btn5 = await driver.findComponent(ON.id('fontScale_1_75'));
        await btn5.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大5档 (2倍，达到maxFontScale限制)`);
        let btn6 = await driver.findComponent(ON.id('fontScale_2'));
        await btn6.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大6档 (2.5倍设置，受maxFontScale=2限制，实际显示2倍)`);
        let btn7 = await driver.findComponent(ON.id('fontScale_2_5'));
        await btn7.click();
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0200 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0200 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0210
     * @tc.name   : Button segmentbuttom aging
     * @tc.desc   : Verify button segmentbuttom aging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0210', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0210 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButton/SegmentButtonAging0210');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        let segmentButton = await driver.findComponent(ON.id('segmentButtonAging0210'));
        Logger.info('TEST', `Found SegmentButton component with maxFontScale=1.45`);

        Logger.info('TEST', `Click 标准档 (1倍)`);
        let btn1 = await driver.findComponent(ON.id('fontScale_1'));
        await btn1.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大1档 (1.15倍)`);
        let btn2 = await driver.findComponent(ON.id('fontScale_1_15'));
        await btn2.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大2档 (1.3倍)`);
        let btn3 = await driver.findComponent(ON.id('fontScale_1_3'));
        await btn3.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大3档 (1.45倍，达到maxFontScale限制)`);
        let btn4 = await driver.findComponent(ON.id('fontScale_1_45'));
        await btn4.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大4档 (1.75倍设置，受maxFontScale=1.45限制，实际显示1.45倍)`);
        let btn5 = await driver.findComponent(ON.id('fontScale_1_75'));
        await btn5.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大5档 (2倍设置，受maxFontScale=1.45限制，实际显示1.45倍)`);
        let btn6 = await driver.findComponent(ON.id('fontScale_2'));
        await btn6.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大6档 (2.5倍设置，受maxFontScale=1.45限制，实际显示1.45倍)`);
        let btn7 = await driver.findComponent(ON.id('fontScale_2_5'));
        await btn7.click();
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0210 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0210 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0220
     * @tc.name   : Button segmentbuttom aging
     * @tc.desc   : Verify button segmentbuttom aging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0220', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0220 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButton/SegmentButtonAging0220');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        let segmentButton = await driver.findComponent(ON.id('segmentButtonAging0220'));
        Logger.info('TEST', `Found SegmentButton component with maxFontScale=0.5 (小于1按1处理)`);

        Logger.info('TEST', `Click 标准档 (1倍)`);
        let btn1 = await driver.findComponent(ON.id('fontScale_1'));
        await btn1.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大1档 (1.15倍设置，受maxFontScale=0.5限制，实际显示1倍)`);
        let btn2 = await driver.findComponent(ON.id('fontScale_1_15'));
        await btn2.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大2档 (1.3倍设置，受maxFontScale=0.5限制，实际显示1倍)`);
        let btn3 = await driver.findComponent(ON.id('fontScale_1_3'));
        await btn3.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大3档 (1.45倍设置，受maxFontScale=0.5限制，实际显示1倍)`);
        let btn4 = await driver.findComponent(ON.id('fontScale_1_45'));
        await btn4.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大4档 (1.75倍设置，受maxFontScale=0.5限制，实际显示1倍)`);
        let btn5 = await driver.findComponent(ON.id('fontScale_1_75'));
        await btn5.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大5档 (2倍设置，受maxFontScale=0.5限制，实际显示1倍)`);
        let btn6 = await driver.findComponent(ON.id('fontScale_2'));
        await btn6.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大6档 (2.5倍设置，受maxFontScale=0.5限制，实际显示1倍)`);
        let btn7 = await driver.findComponent(ON.id('fontScale_2_5'));
        await btn7.click();
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0220 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0220 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0240
     * @tc.name   : Button segmentbuttom aging
     * @tc.desc   : Verify button segmentbuttom aging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0240', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0240 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButton/SegmentButtonAging0240');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        let segmentButton = await driver.findComponent(ON.id('segmentButtonAging0240'));
        Logger.info('TEST', `Found SegmentButton component with maxFontScale=1.3`);

        Logger.info('TEST', `Click 标准档 (1倍)`);
        let btn1 = await driver.findComponent(ON.id('fontScale_1'));
        await btn1.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大1档 (1.15倍)`);
        let btn2 = await driver.findComponent(ON.id('fontScale_1_15'));
        await btn2.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大2档 (1.3倍，达到maxFontScale限制)`);
        let btn3 = await driver.findComponent(ON.id('fontScale_1_3'));
        await btn3.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大3档 (1.45倍设置，受maxFontScale=1.3限制，实际显示1.3倍)`);
        let btn4 = await driver.findComponent(ON.id('fontScale_1_45'));
        await btn4.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大4档 (1.75倍设置，受maxFontScale=1.3限制，实际显示1.3倍)`);
        let btn5 = await driver.findComponent(ON.id('fontScale_1_75'));
        await btn5.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大5档 (2倍设置，受maxFontScale=1.3限制，实际显示1.3倍)`);
        let btn6 = await driver.findComponent(ON.id('fontScale_2'));
        await btn6.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大6档 (2.5倍设置，受maxFontScale=1.3限制，实际显示1.3倍)`);
        let btn7 = await driver.findComponent(ON.id('fontScale_2_5'));
        await btn7.click();
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0240 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0240 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0270
     * @tc.name   : Button segmentbuttom aging
     * @tc.desc   : Verify button segmentbuttom aging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0270', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0270 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButton/SegmentButtonAging0270');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        let segmentButton = await driver.findComponent(ON.id('segmentButtonAging0270'));
        Logger.info('TEST', `Found SegmentButton component with maxFontScale=2`);

        Logger.info('TEST', `Click 标准档 (1倍)`);
        let btn1 = await driver.findComponent(ON.id('fontScale_1'));
        await btn1.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大1档 (1.15倍)`);
        let btn2 = await driver.findComponent(ON.id('fontScale_1_15'));
        await btn2.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大2档 (1.3倍)`);
        let btn3 = await driver.findComponent(ON.id('fontScale_1_3'));
        await btn3.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大3档 (1.45倍)`);
        let btn4 = await driver.findComponent(ON.id('fontScale_1_45'));
        await btn4.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大4档 (1.75倍)`);
        let btn5 = await driver.findComponent(ON.id('fontScale_1_75'));
        await btn5.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大5档 (2倍，达到maxFontScale限制)`);
        let btn6 = await driver.findComponent(ON.id('fontScale_2'));
        await btn6.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大6档 (2.5倍设置，受maxFontScale=2限制，实际显示2倍)`);
        let btn7 = await driver.findComponent(ON.id('fontScale_2_5'));
        await btn7.click();
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0270 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0270 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0280
     * @tc.name   : Button segmentbuttom aging
     * @tc.desc   : Verify button segmentbuttom aging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0280', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0280 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButton/SegmentButtonAging0280');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        let segmentButton = await driver.findComponent(ON.id('segmentButtonAging0280'));
        Logger.info('TEST', `Found SegmentButton component with maxFontScale=1.45`);

        Logger.info('TEST', `Click 标准档 (1倍)`);
        let btn1 = await driver.findComponent(ON.id('fontScale_1'));
        await btn1.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大1档 (1.15倍)`);
        let btn2 = await driver.findComponent(ON.id('fontScale_1_15'));
        await btn2.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大2档 (1.3倍)`);
        let btn3 = await driver.findComponent(ON.id('fontScale_1_3'));
        await btn3.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大3档 (1.45倍，达到maxFontScale限制)`);
        let btn4 = await driver.findComponent(ON.id('fontScale_1_45'));
        await btn4.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大4档 (1.75倍设置，受maxFontScale=1.45限制，实际显示1.45倍)`);
        let btn5 = await driver.findComponent(ON.id('fontScale_1_75'));
        await btn5.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大5档 (2倍设置，受maxFontScale=1.45限制，实际显示1.45倍)`);
        let btn6 = await driver.findComponent(ON.id('fontScale_2'));
        await btn6.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大6档 (2.5倍设置，受maxFontScale=1.45限制，实际显示1.45倍)`);
        let btn7 = await driver.findComponent(ON.id('fontScale_2_5'));
        await btn7.click();
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0280 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0280 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0290
     * @tc.name   : Button segmentbuttom aging
     * @tc.desc   : Verify button segmentbuttom aging interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0290', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0290 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButton/SegmentButtonAging0290');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        let segmentButton = await driver.findComponent(ON.id('segmentButtonAging0290'));
        Logger.info('TEST', `Found SegmentButton component with maxFontScale=-1 (小于1按1处理)`);

        Logger.info('TEST', `Click 标准档 (1倍)`);
        let btn1 = await driver.findComponent(ON.id('fontScale_1'));
        await btn1.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大1档 (1.15倍设置，受maxFontScale=-1限制，实际显示1倍)`);
        let btn2 = await driver.findComponent(ON.id('fontScale_1_15'));
        await btn2.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大2档 (1.3倍设置，受maxFontScale=-1限制，实际显示1倍)`);
        let btn3 = await driver.findComponent(ON.id('fontScale_1_3'));
        await btn3.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大3档 (1.45倍设置，受maxFontScale=-1限制，实际显示1倍)`);
        let btn4 = await driver.findComponent(ON.id('fontScale_1_45'));
        await btn4.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大4档 (1.75倍设置，受maxFontScale=-1限制，实际显示1倍)`);
        let btn5 = await driver.findComponent(ON.id('fontScale_1_75'));
        await btn5.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大5档 (2倍设置，受maxFontScale=-1限制，实际显示1倍)`);
        let btn6 = await driver.findComponent(ON.id('fontScale_2'));
        await btn6.click();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Click 大6档 (2.5倍设置，受maxFontScale=-1限制，实际显示1倍)`);
        let btn7 = await driver.findComponent(ON.id('fontScale_2_5'));
        await btn7.click();
        await driver.waitForIdle(1000, 2000);

        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0290 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_AGING_0290 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_CLICK_0010
     * @tc.name   : Button segmentbuttom click
     * @tc.desc   : Verify button segmentbuttom click interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_CLICK_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_CLICK_0010 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButton/SegmentButtonClick0010');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        let segmentButton = await driver.findComponent(ON.id('segmentButtonClick0010'));
        Logger.info('TEST', `Found SegmentButton component with onItemClicked event`);

        // 点击第一个按钮"年"，连续点击3次
        // onItemClicked回调会在页面的console.info中打印实际接收到的index参数
        Logger.info('TEST', `Click first button "年" continuously, check console for onItemClicked index parameter`);
        let firstButton = await driver.findComponent(ON.text('年'));
        await firstButton.click();
        await driver.waitForIdle(500, 1000);

        await firstButton.click();
        await driver.waitForIdle(500, 1000);

        await firstButton.click();
        await driver.waitForIdle(500, 1000);

        // 点击第二个按钮"月"，连续点击3次
        Logger.info('TEST', `Click second button "月" continuously, check console for onItemClicked index parameter`);
        let secondButton = await driver.findComponent(ON.text('月'));
        await secondButton.click();
        await driver.waitForIdle(500, 1000);

        await secondButton.click();
        await driver.waitForIdle(500, 1000);

        await secondButton.click();
        await driver.waitForIdle(500, 1000);

        // 点击第三个按钮"日"，连续点击3次
        Logger.info('TEST', `Click third button "日" continuously, check console for onItemClicked index parameter`);
        let thirdButton = await driver.findComponent(ON.text('日'));
        await thirdButton.click();
        await driver.waitForIdle(500, 1000);

        await thirdButton.click();
        await driver.waitForIdle(500, 1000);

        await thirdButton.click();
        await driver.waitForIdle(500, 1000);

        // 截图查看页面上的日志显示（日志中会显示实际接收到的index参数）
        Logger.info('TEST', `Check screenshot for click log, verify onItemClicked receives correct index parameter`);
        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_CLICK_0010 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_CLICK_0010 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_CLICK_0020
     * @tc.name   : Button segmentbuttom click
     * @tc.desc   : Verify button segmentbuttom click interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_CLICK_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_CLICK_0020 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButton/SegmentButtonClick0020');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        let segmentButton = await driver.findComponent(ON.id('segmentButtonClick0020'));
        Logger.info('TEST', `Found SegmentButton component with onItemClicked event (single-select capsule)`);

        // 点击第一个按钮"年"，连续点击3次
        Logger.info('TEST', `Click first button "年" continuously, check console for onItemClicked index parameter`);
        let firstButton = await driver.findComponent(ON.text('年'));
        await firstButton.click();
        await driver.waitForIdle(500, 1000);

        await firstButton.click();
        await driver.waitForIdle(500, 1000);

        await firstButton.click();
        await driver.waitForIdle(500, 1000);

        // 点击第二个按钮"月"，连续点击3次
        Logger.info('TEST', `Click second button "月" continuously, check console for onItemClicked index parameter`);
        let secondButton = await driver.findComponent(ON.text('月'));
        await secondButton.click();
        await driver.waitForIdle(500, 1000);

        await secondButton.click();
        await driver.waitForIdle(500, 1000);

        await secondButton.click();
        await driver.waitForIdle(500, 1000);

        // 点击第三个按钮"日"，连续点击3次
        Logger.info('TEST', `Click third button "日" continuously, check console for onItemClicked index parameter`);
        let thirdButton = await driver.findComponent(ON.text('日'));
        await thirdButton.click();
        await driver.waitForIdle(500, 1000);

        await thirdButton.click();
        await driver.waitForIdle(500, 1000);

        await thirdButton.click();
        await driver.waitForIdle(500, 1000);

        // 截图查看页面上的日志显示
        Logger.info('TEST', `Check screenshot for click log, verify onItemClicked receives correct index parameter`);
        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_CLICK_0020 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_CLICK_0020 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_CLICK_0030
     * @tc.name   : Button segmentbuttom click
     * @tc.desc   : Verify button segmentbuttom click interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_CLICK_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_CLICK_0030 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButton/SegmentButtonClick0030');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        let segmentButton = await driver.findComponent(ON.id('segmentButtonClick0030'));
        Logger.info('TEST', `Found SegmentButton component with onItemClicked event (multi-select capsule)`);

        // 点击第一个按钮"年"，连续点击3次
        Logger.info('TEST', `Click first button "年" continuously, check console for onItemClicked index parameter`);
        let firstButton = await driver.findComponent(ON.text('年'));
        await firstButton.click();
        await driver.waitForIdle(500, 1000);

        await firstButton.click();
        await driver.waitForIdle(500, 1000);

        await firstButton.click();
        await driver.waitForIdle(500, 1000);

        // 点击第二个按钮"月"，连续点击3次
        Logger.info('TEST', `Click second button "月" continuously, check console for onItemClicked index parameter`);
        let secondButton = await driver.findComponent(ON.text('月'));
        await secondButton.click();
        await driver.waitForIdle(500, 1000);

        await secondButton.click();
        await driver.waitForIdle(500, 1000);

        await secondButton.click();
        await driver.waitForIdle(500, 1000);

        // 点击第三个按钮"日"，连续点击3次
        Logger.info('TEST', `Click third button "日" continuously, check console for onItemClicked index parameter`);
        let thirdButton = await driver.findComponent(ON.text('日'));
        await thirdButton.click();
        await driver.waitForIdle(500, 1000);

        await thirdButton.click();
        await driver.waitForIdle(500, 1000);

        await thirdButton.click();
        await driver.waitForIdle(500, 1000);

        // 截图查看页面上的日志显示
        Logger.info('TEST', `Check screenshot for click log, verify onItemClicked receives correct index parameter`);
        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_CLICK_0030 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_CLICK_0030 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0010
     * @tc.name   : Button segmentbuttom interaction
     * @tc.desc   : Verify button segmentbuttom interaction interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0010 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButton/SegmentButtonInteraction0010');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        let segmentButtonTab = await driver.findComponent(ON.id('segmentButtonTab'));
        let segmentButtonSingleCapsule = await driver.findComponent(ON.id('segmentButtonSingleCapsule'));
        let segmentButtonMultiplyCapsule = await driver.findComponent(ON.id('segmentButtonMultiplyCapsule'));
        Logger.info('TEST', `Found all three types of SegmentButton components`);

        // 测试页签类分段按钮的press状态
        Logger.info('TEST', `Test tab type SegmentButton press state`);
        Logger.info('TEST', `Click buttons of tab type - observe press state`);
        await segmentButtonTab.click();
        await driver.waitForIdle(500, 1000);

        // 测试单选胶囊类分段按钮的press状态
        Logger.info('TEST', `Test single-select capsule type SegmentButton press state`);
        Logger.info('TEST', `Click buttons of single-select capsule type - observe press state`);
        await segmentButtonSingleCapsule.click();
        await driver.waitForIdle(500, 1000);

        // 测试多选胶囊类分段按钮的press状态
        Logger.info('TEST', `Test multi-select capsule type SegmentButton press state`);
        Logger.info('TEST', `Click buttons of multi-select capsule type - observe press state`);
        await segmentButtonMultiplyCapsule.click();
        await driver.waitForIdle(500, 1000);

        // 再次点击观察press状态
        Logger.info('TEST', `Click again to observe press state on selected buttons`);
        await segmentButtonMultiplyCapsule.click();
        await driver.waitForIdle(500, 1000);

        // 截图观察press状态效果
        Logger.info('TEST', `Capture screenshot to observe press state effect across all button types`);
        Logger.info('TEST', `Expected: All button types (tab, single-select, multi-select) show consistent press state`);
        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0010 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0010 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0020
     * @tc.name   : Button segmentbuttom interaction
     * @tc.desc   : Verify button segmentbuttom interaction interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0020 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButton/SegmentButtonInteraction0020');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        let segmentButtonTab = await driver.findComponent(ON.id('segmentButtonTab'));
        let segmentButtonSingleCapsule = await driver.findComponent(ON.id('segmentButtonSingleCapsule'));
        Logger.info('TEST', `Found tab and single-select capsule SegmentButton components`);

        // 测试页签类分段按钮的滑动选中 - 使用fling方法
        Logger.info('TEST', `Test tab type SegmentButton swipe gesture using fling`);
        let tabBounds = await segmentButtonTab.getBounds();
        let tabStartX = tabBounds.left + 50;
        let tabY = (tabBounds.top + tabBounds.bottom) / 2;

        Logger.info('TEST', `Fling on tab SegmentButton from left to right`);
        await driver.fling({x: tabStartX, y: tabY}, {x: tabBounds.right - 50, y: tabY}, 20, 600);
        await driver.waitForIdle(500, 1000);

        // 测试单选胶囊类分段按钮的滑动选中 - 使用fling方法
        Logger.info('TEST', `Test single-select capsule type SegmentButton swipe gesture using fling`);
        let capsuleBounds = await segmentButtonSingleCapsule.getBounds();
        let capsuleStartX = capsuleBounds.left + 50;
        let capsuleY = (capsuleBounds.top + capsuleBounds.bottom) / 2;

        Logger.info('TEST', `Fling on single-select capsule SegmentButton from left to right`);
        await driver.fling({x: capsuleStartX, y: capsuleY}, {x: capsuleBounds.right - 50, y: capsuleY}, 20, 600);
        await driver.waitForIdle(500, 1000);

        // 反向滑动测试 - 使用fling方法
        Logger.info('TEST', `Fling back from right to left`);
        await driver.fling({x: capsuleBounds.right - 50, y: capsuleY}, {x: capsuleStartX, y: capsuleY}, 20, 600);
        await driver.waitForIdle(500, 1000);

        // 截图观察滑动效果
        Logger.info('TEST', `Capture screenshot to observe swipe gesture effect`);
        Logger.info('TEST', `Expected: Both tab and single-select capsule show consistent swipe-to-select behavior`);
        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0020 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0020 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0030
     * @tc.name   : Button segmentbuttom interaction
     * @tc.desc   : Verify button segmentbuttom interaction interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0030 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButton/SegmentButtonInteraction0030');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        let segmentButtonTab = await driver.findComponent(ON.id('segmentButtonTab'));
        let segmentButtonSingleCapsule = await driver.findComponent(ON.id('segmentButtonSingleCapsule'));
        let segmentButtonMultiplyCapsule = await driver.findComponent(ON.id('segmentButtonMultiplyCapsule'));
        let helperButton = await driver.findComponent(ON.id('helperButton'));
        Logger.info('TEST', `Found all three types of SegmentButton components and helper button`);

        // 点击辅助按钮使其获焦，然后通过Tab键切换焦点
        Logger.info('TEST', `Click helper button first to set initial focus`);
        await helperButton.click();
        await driver.waitForIdle(500, 1000);

        // 模拟Tab键切换焦点（通过点击不同组件来观察获焦效果）
        Logger.info('TEST', `Click tab type SegmentButton to observe focus effect`);
        await segmentButtonTab.click();
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: Tab type SegmentButton shows blue focus frame`);

        // 点击单选胶囊类观察获焦效果
        Logger.info('TEST', `Click single-select capsule type SegmentButton to observe focus effect`);
        await segmentButtonSingleCapsule.click();
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: Single-select capsule type SegmentButton shows blue focus frame`);

        // 点击多选胶囊类观察获焦效果
        Logger.info('TEST', `Click multi-select capsule type SegmentButton to observe focus effect`);
        await segmentButtonMultiplyCapsule.click();
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: Multi-select capsule type SegmentButton shows blue focus frame`);

        // 截图观察获焦效果
        Logger.info('TEST', `Capture screenshot to observe focus effect`);
        Logger.info('TEST', `Expected: All button types show consistent blue focus frame when focused`);
        Logger.info('TEST', `Note: Manual testing with Tab key required to fully verify focus navigation`);
        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0030 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0030 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0040
     * @tc.name   : Button segmentbuttom interaction
     * @tc.desc   : Verify button segmentbuttom interaction interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0040 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButton/SegmentButtonInteraction0040');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Found all three types of SegmentButton components`);

        // SegmentButton组件内置了hover效果，无需额外设置hoverEffect属性
        // 注意：SegmentButton不支持通用属性（包括hoverEffect）
        // hover效果需要通过鼠标实际悬停来触发，自动化测试无法完全模拟
        Logger.info('TEST', `SegmentButton has built-in hover effect`);
        Logger.info('TEST', `Manual test required: Move mouse over buttons to observe hover effect`);
        Logger.info('TEST', `Expected hover effect: Button shows visual feedback when mouse hovers over it`);
        // 截图初始状态供参考
        Logger.info('TEST', `Capture initial state for reference`);
        Logger.info('TEST', `Expected: All three button types (tab, single-select, multi-select) have consistent hover effect`);
        Logger.info('TEST', `Note: Actual hover effect verification requires manual mouse operation`);
        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0040 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0040 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0050
     * @tc.name   : Button segmentbuttom interaction
     * @tc.desc   : Verify button segmentbuttom interaction interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0050 start.`);
       Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButton/SegmentButtonInteraction0050');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        Settings.changeWindowOrientation();

        Settings.changeWindowOrientation();

        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0050 end.`);

      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0060
     * @tc.name   : Button segmentbuttom interaction
     * @tc.desc   : Verify button segmentbuttom interaction interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0060 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButton/SegmentButtonInteraction0060');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        let segmentButtonTab = await driver.findComponent(ON.id('segmentButtonTab'));
        let segmentButtonSingleCapsule = await driver.findComponent(ON.id('segmentButtonSingleCapsule'));
        let segmentButtonMultiplyCapsule = await driver.findComponent(ON.id('segmentButtonMultiplyCapsule'));
        Logger.info('TEST', `Found all three types of SegmentButton components`);

        // 测试页签类：点击未选中的按钮2
        Logger.info('TEST', `Click unselected button2 on tab type (initial: button1 selected)`);
        await segmentButtonTab.click();
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: Button2 selected, button1 unselected, with smooth animation`);

        // 测试单选胶囊类：点击未选中的按钮2
        Logger.info('TEST', `Click unselected button2 on single-select capsule type (initial: button1 selected)`);
        await segmentButtonSingleCapsule.click();
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: Button2 selected, button1 unselected, with smooth animation`);

        // 测试多选胶囊类：点击未选中的按钮1
        Logger.info('TEST', `Click unselected button1 on multi-select capsule type (initial: none selected)`);
        await segmentButtonMultiplyCapsule.click();
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: Button1 selected, with smooth animation`);

        // 再点击另一个未选中的按钮
        Logger.info('TEST', `Click unselected button2 on multi-select capsule type`);
        await segmentButtonMultiplyCapsule.click();
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: Button1 and button2 both selected, with smooth animation`);

        // 截图观察最终状态
        Logger.info('TEST', `Capture final state after clicking unselected buttons`);
        Logger.info('TEST', `Expected: All button types show smooth selection animation and correct final state`);
        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0060 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0060 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0070
     * @tc.name   : Button segmentbuttom interaction
     * @tc.desc   : Verify button segmentbuttom interaction interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0070 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButton/SegmentButtonInteraction0070');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        let segmentButtonTab = await driver.findComponent(ON.id('segmentButtonTab'));
        let segmentButtonSingleCapsule = await driver.findComponent(ON.id('segmentButtonSingleCapsule'));
        Logger.info('TEST', `Found tab and single-select capsule SegmentButton components`);

        // 在页签类按钮上滑动（从按钮1滑动到按钮3）
        Logger.info('TEST', `Fling on tab type SegmentButton from button1 to button3`);
        let tabBounds = await segmentButtonTab.getBounds();
        await driver.fling(
          {x: tabBounds.left + 50, y: (tabBounds.top + tabBounds.bottom) / 2},
          {x: tabBounds.right - 100, y: (tabBounds.top + tabBounds.bottom) / 2},
          20,
          600
        );
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: After fling, the target button becomes selected`);

        // 在单选胶囊类按钮上滑动（从按钮1滑动到按钮3）
        Logger.info('TEST', `Fling on single-select capsule type SegmentButton from button1 to button3`);
        let singleBounds = await segmentButtonSingleCapsule.getBounds();
        await driver.fling(
          {x: singleBounds.left + 50, y: (singleBounds.top + singleBounds.bottom) / 2},
          {x: singleBounds.right - 100, y: (singleBounds.top + singleBounds.bottom) / 2},
          20,
          600
        );
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: After fling, the target button becomes selected`);

        // 截图观察最终状态
        Logger.info('TEST', `Capture final state after fling gestures`);
        Logger.info('TEST', `Expected: Tab and single-select capsule both show target button selected after fling`);
        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0070 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0070 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0080
     * @tc.name   : Button segmentbuttom interaction
     * @tc.desc   : Verify button segmentbuttom interaction interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0080 start.`);
        Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButton/SegmentButtonInteraction0080');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        Settings.changeWindowOrientation();

        Settings.changeWindowOrientation();

        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0080 end.`);

      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0090
     * @tc.name   : Button segmentbuttom interaction
     * @tc.desc   : Verify button segmentbuttom interaction interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0090 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButton/SegmentButtonInteraction0090');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Find specific buttons by text to click (different text for each type)`);

        // 点击页签类按钮背景（通过文本定位Tab2）
        Logger.info('TEST', `Click Tab2 on tab type SegmentButton`);
        let tabButton2 = await driver.findComponent(ON.text('Tab2'));
        await tabButton2.click();
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: Tab2 background becomes selected, Tab1 unselected`);

        // 点击单选胶囊类按钮背景（通过文本定位单选3）
        Logger.info('TEST', `Click 单选3 on single-select capsule type SegmentButton`);
        let singleButton3 = await driver.findComponent(ON.text('单选3'));
        await singleButton3.click();
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: 单选3 background becomes selected, 单选1 unselected`);

        // 点击多选胶囊类按钮背景（通过文本定位多选1）
        Logger.info('TEST', `Click 多选1 on multi-select capsule type SegmentButton`);
        let multiButton1 = await driver.findComponent(ON.text('多选1'));
        await multiButton1.click();
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: 多选1 background becomes selected`);

        // 点击多选胶囊类按钮背景（通过文本定位多选2）
        Logger.info('TEST', `Click 多选2 on multi-select capsule type SegmentButton`);
        let multiButton2 = await driver.findComponent(ON.text('多选2'));
        await multiButton2.click();
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: 多选2 background becomes selected, 多选1 remains selected (multi-select effect)`);

        // 再点击多选胶囊类的多选4，进一步验证多选效果
        Logger.info('TEST', `Click 多选4 on multi-select capsule type SegmentButton`);
        let multiButton4 = await driver.findComponent(ON.text('多选4'));
        await multiButton4.click();
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: 多选4 background becomes selected, 多选1 and 多选2 remain selected (multi-select effect)`);

        // 再点击已选中的多选1，验证取消选中效果
        Logger.info('TEST', `Click 多选1 again to unselect it on multi-select capsule type`);
        await multiButton1.click();
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: 多选1 background becomes unselected, 多选2 and 多选4 remain selected`)

        // 截图观察最终状态
        Logger.info('TEST', `Capture final state after clicking button backgrounds`);
        Logger.info('TEST', `Expected: All button types show correct background selection state`);
        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0090 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0090 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0100
     * @tc.name   : Button segmentbuttom interaction
     * @tc.desc   : Verify button segmentbuttom interaction interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0100 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButton/SegmentButtonInteraction0100');
      let driver: Driver = await Driver.create();
      await driver.waitForIdle(1000, 2000);
      Settings.changeWindowOrientation()
      Settings.changeWindowOrientation()
      Logger.info('TEST', `Portrait mode - capture final state`);
      Logger.info('TEST', `Expected: All button background states unchanged after rotation`);
      await windowSnap.snapShot();
      await Utils.sleep(1000);

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0100 end.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0110
     * @tc.name   : Button segmentbuttom interaction
     * @tc.desc   : Verify button segmentbuttom interaction interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0110 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButton/SegmentButtonInteraction0110');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Find Image components to click icons directly`);

        // 使用 ON.type('Image') 查找所有图标
        let allImages = await driver.findComponents(ON.type('Image'));
        Logger.info('TEST', `Found ${allImages.length} Image components on the page`);

        // 点击纯图标单选类的第2个图标（索引1）
        if (allImages.length >= 2) {
          Logger.info('TEST', `Click second icon on icon-only single-select capsule type`);
          await allImages[1].click();
          await driver.waitForIdle(500, 1000);
          Logger.info('TEST', `Expected: Second icon button becomes selected`);
        }

        // 点击图标+文本单选类的第3个图标（单选3的图标，索引6）
        // 纯图标有4个，图标+文本单选有4个，所以单选3的图标索引是 4+2=6
        if (allImages.length >= 7) {
          Logger.info('TEST', `Click icon of 单选3 on icon+text single-select capsule type`);
          await allImages[6].click();
          await driver.waitForIdle(500, 1000);
          Logger.info('TEST', `Expected: 单选3 becomes selected, 单选1 unselected`);
        }

        // 点击多选胶囊类的多选1图标（索引8）
        // 纯图标4个 + 单选4个 = 8，多选1的图标索引是8
        if (allImages.length >= 9) {
          Logger.info('TEST', `Click icon of 多选1 on multi-select capsule type`);
          await allImages[8].click();
          await driver.waitForIdle(500, 1000);
          Logger.info('TEST', `Expected: 多选1 becomes selected`);
        }

        // 点击多选胶囊类的多选2图标（索引9）
        if (allImages.length >= 10) {
          Logger.info('TEST', `Click icon of 多选2 on multi-select capsule type`);
          await allImages[9].click();
          await driver.waitForIdle(500, 1000);
          Logger.info('TEST', `Expected: 多选2 becomes selected, 多选1 remains selected (multi-select effect)`);
        }

        // 点击多选胶囊类的多选4图标（索引11）
        if (allImages.length >= 12) {
          Logger.info('TEST', `Click icon of 多选4 on multi-select capsule type`);
          await allImages[11].click();
          await driver.waitForIdle(500, 1000);
          Logger.info('TEST', `Expected: 多选4 becomes selected, 多选1 and 多选2 remain selected`);
        }

        // 截图观察最终状态
        Logger.info('TEST', `Capture final state after clicking icons`);
        Logger.info('TEST', `Expected: Click icon has same effect as click text - all selections are correct`);
        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0110 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0110 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0120
     * @tc.name   : Button segmentbuttom interaction
     * @tc.desc   : Verify button segmentbuttom interaction interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0120 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButton/SegmentButtonInteraction0120');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        // 获取纯图标单选类SegmentButton组件
        let iconOnlyButton = await driver.findComponent(ON.id('segmentButtonIconOnly'));
        Logger.info('TEST', `Found icon-only single-select capsule SegmentButton`);

        // 在纯图标SegmentButton上滑动（从第1个图标滑动到第3个图标）
        Logger.info('TEST', `Fling on icon-only SegmentButton from icon1 to icon3`);
        let iconBounds = await iconOnlyButton.getBounds();
        await driver.fling(
          {x: iconBounds.left + 50, y: (iconBounds.top + iconBounds.bottom) / 2},
          {x: iconBounds.right - 50, y: (iconBounds.top + iconBounds.bottom) / 2},
          20,
          600
        );
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: After fling, the target icon becomes selected`);

        // 获取图标+文本单选类SegmentButton组件
        let singleCapsuleButton = await driver.findComponent(ON.id('segmentButtonSingleCapsule'));
        Logger.info('TEST', `Found icon+text single-select capsule SegmentButton`);

        // 在图标+文本SegmentButton上滑动（从第1个滑动到第3个）
        Logger.info('TEST', `Fling on icon+text SegmentButton from button1 to button3`);
        let capsuleBounds = await singleCapsuleButton.getBounds();
        await driver.fling(
          {x: capsuleBounds.left + 50, y: (capsuleBounds.top + capsuleBounds.bottom) / 2},
          {x: capsuleBounds.right - 50, y: (capsuleBounds.top + capsuleBounds.bottom) / 2},
          20,
          600
        );
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: After fling, the target button becomes selected`);

        // 反向滑动测试（从右向左）
        Logger.info('TEST', `Fling back from right to left on icon-only SegmentButton`);
        await driver.fling(
          {x: iconBounds.right - 50, y: (iconBounds.top + iconBounds.bottom) / 2},
          {x: iconBounds.left + 50, y: (iconBounds.top + iconBounds.bottom) / 2},
          20,
          600
        );
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: After fling back, the first icon becomes selected`);

        // 截图观察最终状态
        Logger.info('TEST', `Capture final state after fling gestures on icons`);
        Logger.info('TEST', `Expected: Fling on icons works same as fling on text - selection changes correctly`);
        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0120 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0120 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0130
     * @tc.name   : Button segmentbuttom interaction
     * @tc.desc   : Verify button segmentbuttom interaction interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0130 start.`);
       Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButton/SegmentButtonInteraction0130');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);
        // 点击按钮切换到横屏
        Settings.changeWindowOrientation();

        // 点击按钮切换回竖屏
        Logger.info('TEST', `Click button to change back to portrait mode`);
        Settings.changeWindowOrientation();

        Logger.info('TEST', `Portrait mode - capture final state`);
        Logger.info('TEST', `Expected: All icon selection states unchanged after rotation`);
        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0130 end.`);

      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0140
     * @tc.name   : Button segmentbuttom interaction
     * @tc.desc   : Verify button segmentbuttom interaction interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0140 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButton/SegmentButtonInteraction0140');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Find specific buttons by text to click icon+text`);

        // 点击单选类的单选2（点击图标+文本）
        Logger.info('TEST', `Click icon+text of 单选2 on single-select capsule type`);
        let singleButton2 = await driver.findComponent(ON.text('单选2'));
        await singleButton2.click();
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: 单选2 becomes selected, 单选1 unselected`);

        // 点击单选类的单选3
        Logger.info('TEST', `Click icon+text of 单选3 on single-select capsule type`);
        let singleButton3 = await driver.findComponent(ON.text('单选3'));
        await singleButton3.click();
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: 单选3 becomes selected, 单选2 unselected`);

        // 点击多选类的多选1（点击图标+文本）
        Logger.info('TEST', `Click icon+text of 多选1 on multi-select capsule type`);
        let multiButton1 = await driver.findComponent(ON.text('多选1'));
        await multiButton1.click();
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: 多选1 becomes selected`);

        // 点击多选类的多选2
        Logger.info('TEST', `Click icon+text of 多选2 on multi-select capsule type`);
        let multiButton2 = await driver.findComponent(ON.text('多选2'));
        await multiButton2.click();
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: 多选2 becomes selected, 多选1 remains selected`);

        // 点击多选类的多选4
        Logger.info('TEST', `Click icon+text of 多选4 on multi-select capsule type`);
        let multiButton4 = await driver.findComponent(ON.text('多选4'));
        await multiButton4.click();
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: 多选4 becomes selected, 多选1 and 多选2 remain selected`);

        // 截图观察最终状态
        Logger.info('TEST', `Capture final state after clicking icon+text`);
        Logger.info('TEST', `Expected: Single: 单选3 selected, Multi: 多选1, 多选2, 多选4 selected`);
        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0140 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0140 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0150
     * @tc.name   : Button segmentbuttom interaction
     * @tc.desc   : Verify button segmentbuttom interaction interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0150 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButton/SegmentButtonInteraction0150');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        // 获取单选胶囊类SegmentButton组件
        let singleCapsuleButton = await driver.findComponent(ON.id('segmentButtonSingleCapsule'));
        Logger.info('TEST', `Found icon+text single-select capsule SegmentButton`);

        // 在图标+文本SegmentButton上滑动（从左向右）
        Logger.info('TEST', `Fling on icon+text SegmentButton from left to right`);
        let capsuleBounds = await singleCapsuleButton.getBounds();
        await driver.fling(
          {x: capsuleBounds.left + 50, y: (capsuleBounds.top + capsuleBounds.bottom) / 2},
          {x: capsuleBounds.right - 50, y: (capsuleBounds.top + capsuleBounds.bottom) / 2},
          20,
          600
        );
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: After fling, the rightmost icon+text becomes selected`);

        // 反向滑动测试（从右向左）
        Logger.info('TEST', `Fling back from right to left on icon+text SegmentButton`);
        await driver.fling(
          {x: capsuleBounds.right - 50, y: (capsuleBounds.top + capsuleBounds.bottom) / 2},
          {x: capsuleBounds.left + 50, y: (capsuleBounds.top + capsuleBounds.bottom) / 2},
          20,
          600
        );
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: After fling back, the leftmost icon+text becomes selected`);

        // 再次滑动到中间位置
        Logger.info('TEST', `Fling to middle position`);
        await driver.fling(
          {x: capsuleBounds.left + 50, y: (capsuleBounds.top + capsuleBounds.bottom) / 2},
          {x: (capsuleBounds.left + capsuleBounds.right) / 2, y: (capsuleBounds.top + capsuleBounds.bottom) / 2},
          20,
          600
        );
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: After fling, the middle icon+text becomes selected`);

        // 截图观察最终状态
        Logger.info('TEST', `Capture final state after fling gestures on icon+text`);
        Logger.info('TEST', `Expected: Fling on icon+text works correctly - selection changes with fling gesture`);
        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0150 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0150 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0160
     * @tc.name   : Button segmentbuttom interaction
     * @tc.desc   : Verify button segmentbuttom interaction interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0160 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButton/SegmentButtonInteraction0160');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        Settings.changeWindowOrientation();

        Settings.changeWindowOrientation();

        Logger.info('TEST', `Portrait mode - capture final state`);
        Logger.info('TEST', `Expected: All icon+text selection states unchanged after rotation`);
        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0160 end.`);

      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0170
     * @tc.name   : Button segmentbuttom interaction
     * @tc.desc   : Verify button segmentbuttom interaction interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0170 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButton/SegmentButtonInteraction0170');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        // 获取页签类SegmentButton组件
        let tabButton = await driver.findComponent(ON.id('segmentButtonTab'));
        Logger.info('TEST', `Found tab type SegmentButton`);

        // 在页签类SegmentButton上模拟鼠标滑动（从左向右）
        Logger.info('TEST', `Mouse drag on tab type SegmentButton from left to right`);
        let tabBounds = await tabButton.getBounds();
        await driver.fling(
          {x: tabBounds.left + 50, y: (tabBounds.top + tabBounds.bottom) / 2},
          {x: tabBounds.right - 50, y: (tabBounds.top + tabBounds.bottom) / 2},
          20,
          600
        );
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: After mouse drag, the rightmost button becomes selected`);

        // 获取单选胶囊类SegmentButton组件
        let singleCapsuleButton = await driver.findComponent(ON.id('segmentButtonSingleCapsule'));
        Logger.info('TEST', `Found single-select capsule type SegmentButton`);

        // 在单选胶囊类SegmentButton上模拟鼠标滑动（从左向右）
        Logger.info('TEST', `Mouse drag on single-select capsule type SegmentButton from left to right`);
        let capsuleBounds = await singleCapsuleButton.getBounds();
        await driver.fling(
          {x: capsuleBounds.left + 50, y: (capsuleBounds.top + capsuleBounds.bottom) / 2},
          {x: capsuleBounds.right - 50, y: (capsuleBounds.top + capsuleBounds.bottom) / 2},
          20,
          600
        );
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: After mouse drag, the rightmost button becomes selected`);

        // 反向滑动测试（从右向左）
        Logger.info('TEST', `Mouse drag back from right to left on tab type SegmentButton`);
        await driver.fling(
          {x: tabBounds.right - 50, y: (tabBounds.top + tabBounds.bottom) / 2},
          {x: tabBounds.left + 50, y: (tabBounds.top + tabBounds.bottom) / 2},
          20,
          600
        );
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: After mouse drag back, the leftmost button becomes selected`);

        // 截图观察最终状态
        Logger.info('TEST', `Capture final state after mouse drag gestures`);
        Logger.info('TEST', `Expected: Mouse drag can slide to and select the target button`);
        Logger.info('TEST', `Note: Best verified with actual mouse operation for drag effect`);
        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0170 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERACTION_0170 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERFACE_2380
     * @tc.name   : Button segmentbuttom interface
     * @tc.desc   : Verify button segmentbuttom interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERFACE_2380', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERFACE_2380 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButton/SegmentButtonInterface2380');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        let pushButton = await driver.findComponent(ON.id('pushButton'));
        Logger.info('TEST', `Found push button`);
        Logger.info('TEST', `Initial state: 3 buttons (按钮1, 按钮2, 按钮3)`);

        // 第一次push
        Logger.info('TEST', `Click push button - first time`);
        await pushButton.click();
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: New button "按钮4" added, new length = 4`);

        // 第二次push
        Logger.info('TEST', `Click push button - second time`);
        await pushButton.click();
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: New button "按钮5" added, new length = 5`);

        // 第三次push
        Logger.info('TEST', `Click push button - third time`);
        await pushButton.click();
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: New button "按钮6" added, new length = 6`);

        // 截图观察最终状态
        Logger.info('TEST', `Capture final state after push operations`);
        Logger.info('TEST', `Expected: SegmentButton shows 6 buttons, push result shows new length`);
        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERFACE_2380 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERFACE_2380 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERFACE_2390
     * @tc.name   : Button segmentbuttom interface
     * @tc.desc   : Verify button segmentbuttom interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERFACE_2390', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERFACE_2390 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButton/SegmentButtonInterface2390');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        let popButton = await driver.findComponent(ON.id('popButton'));
        Logger.info('TEST', `Found pop button`);
        Logger.info('TEST', `Initial state: 5 buttons (按钮1-5)`);

        // 第一次pop
        Logger.info('TEST', `Click pop button - first time`);
        await popButton.click();
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: 按钮5 removed, returns removed element`);

        // 第二次pop
        Logger.info('TEST', `Click pop button - second time`);
        await popButton.click();
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: 按钮4 removed, returns removed element`);

        // 第三次pop
        Logger.info('TEST', `Click pop button - third time`);
        await popButton.click();
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: 按钮3 removed, returns removed element`);

        // 截图观察最终状态
        Logger.info('TEST', `Capture final state after pop operations`);
        Logger.info('TEST', `Expected: SegmentButton shows 2 buttons, pop result shows removed element`);
        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERFACE_2390 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERFACE_2390 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERFACE_2400
     * @tc.name   : Button segmentbuttom interface
     * @tc.desc   : Verify button segmentbuttom interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERFACE_2400', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERFACE_2400 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButton/SegmentButtonInterface2400');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        // 页签类pop（初始选中索引2，即第3个Tab3）
        let popTabButton = await driver.findComponent(ON.id('popTabButton'));
        Logger.info('TEST', `Tab type: Initial selected index [2] (Tab3)`);

        // 删除末尾按钮，直到删除选中项
        Logger.info('TEST', `Click pop Tab button - remove Tab4`);
        await popTabButton.click();
        await driver.waitForIdle(500, 1000);

        Logger.info('TEST', `Click pop Tab button - remove Tab3 (selected item)`);
        await popTabButton.click();
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: Tab type must have selection, returns to first (index 0)`);

        // 单选类pop（初始选中索引3，即第4个单选4）
        let popSingleButton = await driver.findComponent(ON.id('popSingleButton'));
        Logger.info('TEST', `Single-select type: Initial selected index [3] (单选4)`);

        Logger.info('TEST', `Click pop Single button - remove 单选4 (selected item)`);
        await popSingleButton.click();
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: Single-select can be unselected`);

        // 多选类pop（初始选中索引[2,3]，即第3、4个多选3、多选4）
        let popMultiButton = await driver.findComponent(ON.id('popMultiButton'));
        Logger.info('TEST', `Multi-select type: Initial selected indexes [2,3] (多选3, 多选4)`);

        Logger.info('TEST', `Click pop Multi button - remove 多选4 (one of selected items)`);
        await popMultiButton.click();
        await driver.waitForIdle(500, 1000);

        Logger.info('TEST', `Click pop Multi button - remove 多选3 (another selected item)`);
        await popMultiButton.click();
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: Multi-select can be unselected`);

        // 截图观察最终状态
        Logger.info('TEST', `Capture final state after pop operations on all types`);
        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERFACE_2400 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERFACE_2400 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERFACE_2410
     * @tc.name   : Button segmentbuttom interface
     * @tc.desc   : Verify button segmentbuttom interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERFACE_2410', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERFACE_2410 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButton/SegmentButtonInterface2410');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        let shiftButton = await driver.findComponent(ON.id('shiftButton'));
        Logger.info('TEST', `Found shift button`);
        Logger.info('TEST', `Initial state: 5 buttons (按钮1-5)`);

        // 第一次shift
        Logger.info('TEST', `Click shift button - first time`);
        await shiftButton.click();
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: 按钮1 removed from beginning, returns removed element`);

        // 第二次shift
        Logger.info('TEST', `Click shift button - second time`);
        await shiftButton.click();
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: 按钮2 removed from beginning, returns removed element`);

        // 第三次shift
        Logger.info('TEST', `Click shift button - third time`);
        await shiftButton.click();
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: 按钮3 removed from beginning, returns removed element`);

        // 截图观察最终状态
        Logger.info('TEST', `Capture final state after shift operations`);
        Logger.info('TEST', `Expected: SegmentButton shows 2 buttons (按钮4, 按钮5), shift result shows removed element`);
        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERFACE_2410 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERFACE_2410 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERFACE_2420
     * @tc.name   : Button segmentbuttom interface
     * @tc.desc   : Verify button segmentbuttom interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERFACE_2420', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERFACE_2420 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButton/SegmentButtonInterface2420');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        let unshiftButton = await driver.findComponent(ON.id('unshiftButton'));
        Logger.info('TEST', `Found unshift button`);
        Logger.info('TEST', `Initial state: 3 buttons (按钮1-3)`);

        // 第一次unshift
        Logger.info('TEST', `Click unshift button - first time`);
        await unshiftButton.click();
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: 新按钮1 added at beginning, returns new length 4`);

        // 第二次unshift
        Logger.info('TEST', `Click unshift button - second time`);
        await unshiftButton.click();
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: 新按钮2 added at beginning, returns new length 5`);

        // 第三次unshift
        Logger.info('TEST', `Click unshift button - third time`);
        await unshiftButton.click();
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: 新按钮3 added at beginning, returns new length 6`);

        // 截图观察最终状态
        Logger.info('TEST', `Capture final state after unshift operations`);
        Logger.info('TEST', `Expected: SegmentButton shows 6 buttons, unshift result shows new length`);
        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERFACE_2420 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERFACE_2420 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERFACE_2430
     * @tc.name   : Button segmentbuttom interface
     * @tc.desc   : Verify button segmentbuttom interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERFACE_2430', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERFACE_2430 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButton/SegmentButtonInterface2430');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Initial state: 5 buttons (按钮1-5)`);

        // splice删除操作 - 从索引1删除2个
        let spliceDeleteButton = await driver.findComponent(ON.id('spliceDeleteButton'));
        Logger.info('TEST', `Click splice delete button - splice(1, 2)`);
        await spliceDeleteButton.click();
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: 按钮2, 按钮3 removed, returns array of removed elements`);

        // splice插入操作 - 在索引1插入2个新元素
        let spliceInsertButton = await driver.findComponent(ON.id('spliceInsertButton'));
        Logger.info('TEST', `Click splice insert button - splice(1, 0, 新A, 新B)`);
        await spliceInsertButton.click();
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: 新A, 新B inserted at index 1, returns empty array`);

        // 重置
        let resetButton = await driver.findComponent(ON.id('resetButton'));
        await resetButton.click();
        await driver.waitForIdle(500, 1000);

        // splice替换操作 - 替换索引0的元素
        let spliceReplaceButton = await driver.findComponent(ON.id('spliceReplaceButton'));
        Logger.info('TEST', `Click splice replace button - splice(0, 1, 替换)`);
        await spliceReplaceButton.click();
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: 按钮1 replaced with 替换, returns array with removed element`);

        // 截图观察最终状态
        Logger.info('TEST', `Capture final state after splice operations`);
        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERFACE_2430 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERFACE_2430 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERFACE_2440
     * @tc.name   : Button segmentbuttom interface
     * @tc.desc   : Verify button segmentbuttom interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERFACE_2440', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERFACE_2440 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButton/SegmentButtonInterface2440');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Initial state: 5 buttons (按钮1-5)`);

        // 删3插1 - 删除多个，插入少个
        let delete3Insert1Button = await driver.findComponent(ON.id('spliceDelete3Insert1Button'));
        Logger.info('TEST', `Click splice(1, 3, 新A) - delete 3, insert 1`);
        await delete3Insert1Button.click();
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: 3 elements removed, 1 inserted, length decreased by 2`);

        // 删1插3 - 删除少个，插入多个 (现在只有3个按钮，可以插入)
        let delete1Insert3Button = await driver.findComponent(ON.id('spliceDelete1Insert3Button'));
        Logger.info('TEST', `Click splice(1, 1, 新B, 新C, 新D) - delete 1, insert 3`);
        await delete1Insert3Button.click();
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: 1 element removed, 3 inserted, length increased by 2`);

        // 重置
        let resetButton = await driver.findComponent(ON.id('resetButton'));
        await resetButton.click();
        await driver.waitForIdle(500, 1000);

        // 删2插0 - 纯删除
        let delete2Insert0Button = await driver.findComponent(ON.id('spliceDelete2Insert0Button'));
        Logger.info('TEST', `Click splice(0, 2) - delete 2, insert 0`);
        await delete2Insert0Button.click();
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: 2 elements removed, 0 inserted, pure deletion`);

        // 删0插2 - 纯插入 (现在只有3个按钮，可以插入)
        let delete0Insert2Button = await driver.findComponent(ON.id('spliceDelete0Insert2Button'));
        Logger.info('TEST', `Click splice(2, 0, 插X, 插Y) - delete 0, insert 2`);
        await delete0Insert2Button.click();
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: 0 elements removed, 2 inserted, pure insertion`);

        // 截图观察最终状态
        Logger.info('TEST', `Capture final state - different delete/insert counts work correctly`);
        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERFACE_2440 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERFACE_2440 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERFACE_2450
     * @tc.name   : Button segmentbuttom interface
     * @tc.desc   : Verify button segmentbuttom interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERFACE_2450', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERFACE_2450 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButton/SegmentButtonInterface2450');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Initial state: 3 buttons`);

        // push添加到5个
        let pushButton = await driver.findComponent(ON.id('pushButton'));
        Logger.info('TEST', `Click push button twice to reach 5 buttons`);
        await pushButton.click();
        await driver.waitForIdle(500, 1000);
        await pushButton.click();
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: Now have 5 buttons`);

        // 再次push，应该无效
        Logger.info('TEST', `Click push button again - should be invalid (exceed 5)`);
        await pushButton.click();
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: push invalid, still 5 buttons`);

        // 重置
        let resetButton = await driver.findComponent(ON.id('resetButton'));
        await resetButton.click();
        await driver.waitForIdle(500, 1000);

        // pop删除到2个
        let popButton = await driver.findComponent(ON.id('popButton'));
        Logger.info('TEST', `Click pop button to reduce to 2 buttons`);
        await popButton.click();
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: Now have 2 buttons`);

        // 再次pop，应该无效
        Logger.info('TEST', `Click pop button again - should be invalid (below 2)`);
        await popButton.click();
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: pop invalid, still 2 buttons`);

        // 截图观察最终状态
        Logger.info('TEST', `Capture final state - button count limit enforced`);
        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERFACE_2450 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERFACE_2450 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERFACE_2460
     * @tc.name   : Button segmentbuttom interface
     * @tc.desc   : Verify button segmentbuttom interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERFACE_2460', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERFACE_2460 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButton/SegmentButtonInterface2460');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Initial state: 3 buttons`);

        // 创建纯文本Item
        let createTextButton = await driver.findComponent(ON.id('createTextButton'));
        Logger.info('TEST', `Click create text item button`);
        await createTextButton.click();
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: New text item created and added`);

        // 创建图标+文本Item
        let createIconTextButton = await driver.findComponent(ON.id('createIconTextButton'));
        Logger.info('TEST', `Click create icon+text item button`);
        await createIconTextButton.click();
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: New icon+text item created`);

        // 创建带无障碍属性的Item
        let createAccessibilityButton = await driver.findComponent(ON.id('createAccessibilityButton'));
        Logger.info('TEST', `Click create accessibility item button`);
        await createAccessibilityButton.click();
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: New item with accessibility properties created`);

        // 截图观察最终状态
        Logger.info('TEST', `Capture final state - create method works correctly`);
        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERFACE_2460 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERFACE_2460 error: ${err}`);
      }
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERFACE_2470
     * @tc.name   : Button segmentbuttom interface
     * @tc.desc   : Verify button segmentbuttom interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERFACE_2470', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERFACE_2470 start.`);
      try {
        await Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButton/SegmentButtonInterface2470');
        let driver: Driver = await Driver.create();
        await driver.waitForIdle(1000, 2000);

        Logger.info('TEST', `Initial state: 3 buttons, index 1 selected`);

        // 选中按钮3（索引2）
        let selectButton3 = await driver.findComponent(ON.id('selectButton3'));
        Logger.info('TEST', `Click to select button 3 (index 2)`);
        await selectButton3.click();
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: Button 3 selected (index 2)`);

        // 创建新数组
        let createNewArrayButton = await driver.findComponent(ON.id('createNewArrayButton'));
        Logger.info('TEST', `Click create new array button`);
        await createNewArrayButton.click();
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: New array created, original buttons not selected`);

        // 重置
        let resetButton = await driver.findComponent(ON.id('resetButton'));
        await resetButton.click();
        await driver.waitForIdle(500, 1000);

        // 选中按钮1
        let selectButton1 = await driver.findComponent(ON.id('selectButton1'));
        await selectButton1.click();
        await driver.waitForIdle(500, 1000);

        // 创建新Item并push
        let createAndPushButton = await driver.findComponent(ON.id('createAndPushButton'));
        Logger.info('TEST', `Click create and push button`);
        await createAndPushButton.click();
        await driver.waitForIdle(500, 1000);
        Logger.info('TEST', `Expected: New item added, selection state preserved`);

        // 截图观察最终状态
        Logger.info('TEST', `Capture final state - selection behavior after create`);
        await windowSnap.snapShot();
        await Utils.sleep(1000);

        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERFACE_2470 end.`);
      } catch (err) {
        Logger.error('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTOM_INTERFACE_2470 error: ${err}`);
      }
      done();
    });
  });
}
