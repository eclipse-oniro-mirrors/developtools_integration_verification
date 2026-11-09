/*
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

export default function focusSegmentButtonV2TestPart1() {

  describe('focusSegmentButtonV2TestPart1', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0010
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0010 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 胶囊型分段按钮（单选）');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20010');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2：点击buttonBackgroundColor接口按钮（模拟点击参数配置和设置齿轮）
      Logger.info('TEST', 'Step 2-3: Click buttonBackgroundColor interface button');
      let buttonBackgroundColorButton = await driver.findComponent(ON.id('buttonBackgroundColorButton'));
      if (buttonBackgroundColorButton) {
        await buttonBackgroundColorButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤4：已在点击时设置 itemSelectedBackgroundColor: ColorMetrics.resourceColor($r("app.string.Pink"))
      Logger.info('TEST', 'Step 4: itemSelectedBackgroundColor set to ColorMetrics.resourceColor($r("app.string.Pink"))');

      // 步骤5：观察分段按钮背景是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the segment button background displays normally');
      Logger.info('TEST', 'Expected: 分段按钮背景按照预设颜色正常显示，为粉色');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0010 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0020
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0020 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 胶囊型分段按钮（单选）');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20020');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-3：点击itemFontColor接口按钮
      Logger.info('TEST', 'Step 2-3: Click itemFontColor interface button');
      let itemFontColorButton = await driver.findComponent(ON.id('itemFontColorButton'));
      if (itemFontColorButton) {
        await itemFontColorButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤4：已设置 itemFontColor: ColorMetrics.resourceColor($r("app.color.Pink"))
      Logger.info('TEST', 'Step 4: itemFontColor set to ColorMetrics.resourceColor($r("app.color.Pink"))');

      // 步骤5：观察非选中的分段按钮的字体颜色
      Logger.info('TEST', 'Step 5: Observe unselected segment button font color');
      Logger.info('TEST', 'Expected: 非选中的分段按钮的字体颜色按照预设颜色正常显示，为粉色');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0020 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0030
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0030 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 胶囊型分段按钮（单选）');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20030');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-3：点击itemIconFillColor接口按钮
      Logger.info('TEST', 'Step 2-3: Click itemIconFillColor interface button');
      let itemIconFillColorButton = await driver.findComponent(ON.id('itemIconFillColorButton'));
      if (itemIconFillColorButton) {
        await itemIconFillColorButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤4：已设置 itemIconFillColor: ColorMetrics.resourceColor($r("app.color.Pink"))
      Logger.info('TEST', 'Step 4: itemIconFillColor set to ColorMetrics.resourceColor($r("app.color.Pink"))');

      // 步骤5：观察未选择的分段按钮的图标颜色
      Logger.info('TEST', 'Step 5: Observe unselected segment button icon color');
      Logger.info('TEST', 'Expected: 未选择的分段按钮的图标按照预设颜色正常显示，为粉色');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0030 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0040
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0040 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 胶囊型分段按钮（单选）');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20040');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-3：点击itemSelectedBackgroundColor接口按钮
      Logger.info('TEST', 'Step 2-3: Click itemSelectedBackgroundColor interface button');
      let itemSelectedBackgroundColorButton = await driver.findComponent(ON.id('itemSelectedBackgroundColorButton'));
      if (itemSelectedBackgroundColorButton) {
        await itemSelectedBackgroundColorButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤4：已设置 itemSelectedBackgroundColor: ColorMetrics.resourceColor($r("app.color.Pink"))
      Logger.info('TEST', 'Step 4: itemSelectedBackgroundColor set to ColorMetrics.resourceColor($r("app.color.Pink"))');

      // 步骤5：观察已选择的分段按钮的背景颜色
      Logger.info('TEST', 'Step 5: Observe selected segment button background color');
      Logger.info('TEST', 'Expected: 已选择的分段按钮的背景颜色按照预设颜色正常显示，为粉色');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0040 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0050
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0050 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 胶囊型分段按钮（单选）');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20050');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-3：点击itemSelectedFontColor接口按钮
      Logger.info('TEST', 'Step 2-3: Click itemSelectedFontColor interface button');
      let itemSelectedFontColorButton = await driver.findComponent(ON.id('itemSelectedFontColorButton'));
      if (itemSelectedFontColorButton) {
        await itemSelectedFontColorButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤4：已设置 itemSelectedFontColor: ColorMetrics.resourceColor($r("app.color.Pink"))
      Logger.info('TEST', 'Step 4: itemSelectedFontColor set to ColorMetrics.resourceColor($r("app.color.Pink"))');

      // 步骤5：观察已选择的分段按钮的字体颜色
      Logger.info('TEST', 'Step 5: Observe selected segment button font color');
      Logger.info('TEST', 'Expected: 已选择的分段按钮的字体颜色按照预设颜色正常显示，为粉色');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0050 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0060
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0060 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 胶囊型分段按钮（单选）');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20060');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-3：点击itemSelectedIconFillColor接口按钮
      Logger.info('TEST', 'Step 2-3: Click itemSelectedIconFillColor interface button');
      let itemSelectedIconFillColorButton = await driver.findComponent(ON.id('itemSelectedIconFillColorButton'));
      if (itemSelectedIconFillColorButton) {
        await itemSelectedIconFillColorButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤4：已设置 itemSelectedIconFillColor: ColorMetrics.resourceColor($r("app.color.Pink"))
      Logger.info('TEST', 'Step 4: itemSelectedIconFillColor set to ColorMetrics.resourceColor($r("app.color.Pink"))');

      // 步骤5：观察已选择的分段按钮的图标颜色
      Logger.info('TEST', 'Step 5: Observe selected segment button icon color');
      Logger.info('TEST', 'Expected: 已选择的分段按钮的图标按照预设颜色正常显示，为粉色');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0060 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0070
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0070 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 胶囊型分段按钮（单选）');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20070');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-3：点击itemSelectedSymbolFontColor接口按钮
      Logger.info('TEST', 'Step 2-3: Click itemSelectedSymbolFontColor interface button');
      let itemSelectedSymbolFontColorButton = await driver.findComponent(ON.id('itemSelectedSymbolFontColorButton'));
      if (itemSelectedSymbolFontColorButton) {
        await itemSelectedSymbolFontColorButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤4：已设置颜色
      Logger.info('TEST', 'Step 4: itemSelectedSymbolFontColor set to ColorMetrics.resourceColor($r("app.color.Pink"))');

      // 步骤5：观察已选择的分段按钮的HM Symbol类型图标颜色
      Logger.info('TEST', 'Step 5: Observe selected segment button HM Symbol icon color');
      Logger.info('TEST', 'Expected: 已选择的分段按钮的HM Symbol类型图标按照预设颜色正常显示，为粉色');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0070 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0080
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0080 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 胶囊型分段按钮（单选）');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20080');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-3：点击itemSymbolFontColor接口按钮
      Logger.info('TEST', 'Step 2-3: Click itemSymbolFontColor interface button');
      let itemSymbolFontColorButton = await driver.findComponent(ON.id('itemSymbolFontColorButton'));
      if (itemSymbolFontColorButton) {
        await itemSymbolFontColorButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤4：已设置颜色
      Logger.info('TEST', 'Step 4: itemSymbolFontColor set to ColorMetrics.resourceColor($r("app.color.Pink"))');

      // 步骤5：观察未选择的分段按钮的HM Symbol类型图标颜色
      Logger.info('TEST', 'Step 5: Observe unselected segment button HM Symbol icon color');
      Logger.info('TEST', 'Expected: 未选择的分段按钮的HM Symbol类型图标按照预设颜色正常显示，为粉色');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0080 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0090
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0090 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 胶囊型分段按钮（多选）');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20090');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-3：点击itemBackgroundColor接口按钮
      Logger.info('TEST', 'Step 2-3: Click itemBackgroundColor interface button');
      let itemBackgroundColorButton = await driver.findComponent(ON.id('itemBackgroundColorButton'));
      if (itemBackgroundColorButton) {
        await itemBackgroundColorButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤4：已设置颜色
      Logger.info('TEST', 'Step 4: itemBackgroundColor set to ColorMetrics.resourceColor($r("app.color.Pink"))');

      // 步骤5：观察分段按钮背景颜色
      Logger.info('TEST', 'Step 5: Observe segment button background color');
      Logger.info('TEST', 'Expected: 分段按钮背景按照预设颜色正常显示，为粉色');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0090 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0100
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0100 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 胶囊型分段按钮（多选）');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20100');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-3：点击itemFontColor接口按钮
      Logger.info('TEST', 'Step 2-3: Click itemFontColor interface button');
      let itemFontColorButton = await driver.findComponent(ON.id('itemFontColorButton'));
      if (itemFontColorButton) {
        await itemFontColorButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤4：已设置颜色
      Logger.info('TEST', 'Step 4: itemFontColor set to ColorMetrics.resourceColor($r("app.color.Pink"))');

      // 步骤5：观察非选中的分段按钮的字体颜色
      Logger.info('TEST', 'Step 5: Observe unselected segment button font color');
      Logger.info('TEST', 'Expected: 非选中的分段按钮的字体颜色按照预设颜色正常显示，为粉色');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0100 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0110
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0110 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 胶囊型分段按钮（多选）');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20110');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-3：点击itemIconFillColor接口按钮
      Logger.info('TEST', 'Step 2-3: Click itemIconFillColor interface button');
      let itemIconFillColorButton = await driver.findComponent(ON.id('itemIconFillColorButton'));
      if (itemIconFillColorButton) {
        await itemIconFillColorButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤4：已设置颜色
      Logger.info('TEST', 'Step 4: itemIconFillColor set to ColorMetrics.resourceColor($r("app.color.Pink"))');

      // 步骤5：观察未选择的分段按钮的图标颜色
      Logger.info('TEST', 'Step 5: Observe unselected segment button icon color');
      Logger.info('TEST', 'Expected: 未选择的分段按钮的图标按照预设颜色正常显示，为粉色');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0110 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0120
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0120 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 胶囊型分段按钮（多选）');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20120');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-3：点击itemSelectedBackgroundColor接口按钮
      Logger.info('TEST', 'Step 2-3: Click itemSelectedBackgroundColor interface button');
      let itemSelectedBackgroundColorButton = await driver.findComponent(ON.id('itemSelectedBackgroundColorButton'));
      if (itemSelectedBackgroundColorButton) {
        await itemSelectedBackgroundColorButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤4：已设置颜色
      Logger.info('TEST', 'Step 4: itemSelectedBackgroundColor set to ColorMetrics.resourceColor($r("app.color.Pink"))');

      // 步骤5：观察已选择的分段按钮的背景颜色
      Logger.info('TEST', 'Step 5: Observe selected segment button background color');
      Logger.info('TEST', 'Expected: 已选择的分段按钮的背景颜色按照预设颜色正常显示，为粉色');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0120 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0130
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0130 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 胶囊型分段按钮（多选）');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20130');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-3：点击itemSelectedFontColor接口按钮
      Logger.info('TEST', 'Step 2-3: Click itemSelectedFontColor interface button');
      let itemSelectedFontColorButton = await driver.findComponent(ON.id('itemSelectedFontColorButton'));
      if (itemSelectedFontColorButton) {
        await itemSelectedFontColorButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤4：已设置颜色
      Logger.info('TEST', 'Step 4: itemSelectedFontColor set to ColorMetrics.resourceColor($r("app.color.Pink"))');

      // 步骤5：观察已选择的分段按钮的字体颜色
      Logger.info('TEST', 'Step 5: Observe selected segment button font color');
      Logger.info('TEST', 'Expected: 已选择的分段按钮的字体颜色按照预设颜色正常显示，为粉色');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0130 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0140
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0140 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 胶囊型分段按钮（多选）');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20140');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-3：点击itemSelectedIconFillColor接口按钮
      Logger.info('TEST', 'Step 2-3: Click itemSelectedIconFillColor interface button');
      let itemSelectedIconFillColorButton = await driver.findComponent(ON.id('itemSelectedIconFillColorButton'));
      if (itemSelectedIconFillColorButton) {
        await itemSelectedIconFillColorButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤4：已设置颜色
      Logger.info('TEST', 'Step 4: itemSelectedIconFillColor set to ColorMetrics.resourceColor($r("app.color.Pink"))');

      // 步骤5：观察已选择的分段按钮的图标颜色
      Logger.info('TEST', 'Step 5: Observe selected segment button icon color');
      Logger.info('TEST', 'Expected: 已选择的分段按钮的图标按照预设颜色正常显示，为粉色');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0140 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0150
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0150 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 胶囊型分段按钮（多选）');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20150');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-3：点击itemSelectedSymbolFontColor接口按钮
      Logger.info('TEST', 'Step 2-3: Click itemSelectedSymbolFontColor interface button');
      let itemSelectedSymbolFontColorButton = await driver.findComponent(ON.id('itemSelectedSymbolFontColorButton'));
      if (itemSelectedSymbolFontColorButton) {
        await itemSelectedSymbolFontColorButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤4：已设置颜色
      Logger.info('TEST', 'Step 4: itemSelectedSymbolFontColor set to ColorMetrics.resourceColor($r("app.color.Pink"))');

      // 步骤5：观察已选择的分段按钮的HM Symbol类型图标颜色
      Logger.info('TEST', 'Step 5: Observe selected segment button HM Symbol icon color');
      Logger.info('TEST', 'Expected: 已选择的分段按钮的HM Symbol类型图标按照预设颜色正常显示，为粉色');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0150 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0160
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0160 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 胶囊型分段按钮（多选）');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20160');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-3：点击itemSymbolFontColor接口按钮
      Logger.info('TEST', 'Step 2-3: Click itemSymbolFontColor interface button');
      let itemSymbolFontColorButton = await driver.findComponent(ON.id('itemSymbolFontColorButton'));
      if (itemSymbolFontColorButton) {
        await itemSymbolFontColorButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤4：已设置颜色
      Logger.info('TEST', 'Step 4: itemSymbolFontColor set to ColorMetrics.resourceColor($r("app.color.Pink"))');

      // 步骤5：观察未选择的分段按钮的HM Symbol类型图标颜色
      Logger.info('TEST', 'Step 5: Observe unselected segment button HM Symbol icon color');
      Logger.info('TEST', 'Expected: 未选择的分段按钮的HM Symbol类型图标按照预设颜色正常显示，为粉色');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0160 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0170
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0170 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 页签型分段按钮');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20170');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-3：点击buttonBackgroundColor接口按钮
      Logger.info('TEST', 'Step 2-3: Click buttonBackgroundColor interface button');
      let buttonBackgroundColorButton = await driver.findComponent(ON.id('buttonBackgroundColorButton'));
      if (buttonBackgroundColorButton) {
        await buttonBackgroundColorButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤4：已设置颜色
      Logger.info('TEST', 'Step 4: buttonBackgroundColor set to ColorMetrics.resourceColor($r("app.color.Pink"))');

      // 步骤5：观察分段按钮背景颜色
      Logger.info('TEST', 'Step 5: Observe segment button background color');
      Logger.info('TEST', 'Expected: 分段按钮背景按照预设颜色正常显示，为粉色');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0170 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0180
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0180 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 页签型分段按钮');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20180');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-3：点击itemFontColor接口按钮
      Logger.info('TEST', 'Step 2-3: Click itemFontColor interface button');
      let itemFontColorButton = await driver.findComponent(ON.id('itemFontColorButton'));
      if (itemFontColorButton) {
        await itemFontColorButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤4：已设置颜色
      Logger.info('TEST', 'Step 4: itemFontColor set to ColorMetrics.resourceColor($r("app.color.Pink"))');

      // 步骤5：观察非选中的分段按钮字体颜色
      Logger.info('TEST', 'Step 5: Observe unselected segment button font color');
      Logger.info('TEST', 'Expected: 非选中的分段按钮的字体颜色按照预设颜色正常显示，为粉色');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0180 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0190
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0190 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 页签型分段按钮');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20190');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-3：点击itemIconFillColor接口按钮
      Logger.info('TEST', 'Step 2-3: Click itemIconFillColor interface button');
      let itemIconFillColorButton = await driver.findComponent(ON.id('itemIconFillColorButton'));
      if (itemIconFillColorButton) {
        await itemIconFillColorButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤4：已设置颜色
      Logger.info('TEST', 'Step 4: itemIconFillColor set to ColorMetrics.resourceColor($r("app.color.Pink"))');

      // 步骤5：观察未选择的分段按钮的图标颜色
      Logger.info('TEST', 'Step 5: Observe unselected segment button icon color');
      Logger.info('TEST', 'Expected: 未选择的分段按钮的图标按照预设颜色正常显示，为粉色');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0190 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0200
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0200', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0200 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 页签型分段按钮');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20200');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-3：点击itemSelectedBackgroundColor接口按钮
      Logger.info('TEST', 'Step 2-3: Click itemSelectedBackgroundColor interface button');
      let itemSelectedBackgroundColorButton = await driver.findComponent(ON.id('itemSelectedBackgroundColorButton'));
      if (itemSelectedBackgroundColorButton) {
        await itemSelectedBackgroundColorButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤4：已设置颜色
      Logger.info('TEST', 'Step 4: itemSelectedBackgroundColor set to ColorMetrics.resourceColor($r("app.color.Pink"))');

      // 步骤5：观察已选择的分段按钮的背景颜色
      Logger.info('TEST', 'Step 5: Observe selected segment button background color');
      Logger.info('TEST', 'Expected: 已选择的分段按钮的背景颜色按照预设颜色正常显示，为粉色');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0200 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0210
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0210', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0210 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 页签型分段按钮');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20210');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-3：点击itemSelectedFontColor接口按钮
      Logger.info('TEST', 'Step 2-3: Click itemSelectedFontColor interface button');
      let itemSelectedFontColorButton = await driver.findComponent(ON.id('itemSelectedFontColorButton'));
      if (itemSelectedFontColorButton) {
        await itemSelectedFontColorButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤4：已设置颜色
      Logger.info('TEST', 'Step 4: itemSelectedFontColor set to ColorMetrics.resourceColor($r("app.color.Pink"))');

      // 步骤5：观察已选择的分段按钮的字体颜色
      Logger.info('TEST', 'Step 5: Observe selected segment button font color');
      Logger.info('TEST', 'Expected: 已选择的分段按钮的字体颜色按照预设颜色正常显示，为粉色');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0210 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0220
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0220', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0220 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 页签型分段按钮');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20220');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-3：点击itemSelectedIconFillColor接口按钮
      Logger.info('TEST', 'Step 2-3: Click itemSelectedIconFillColor interface button');
      let itemSelectedIconFillColorButton = await driver.findComponent(ON.id('itemSelectedIconFillColorButton'));
      if (itemSelectedIconFillColorButton) {
        await itemSelectedIconFillColorButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤4：已设置颜色
      Logger.info('TEST', 'Step 4: itemSelectedIconFillColor set to ColorMetrics.resourceColor($r("app.color.Pink"))');

      // 步骤5：观察已选择的分段按钮的图标颜色
      Logger.info('TEST', 'Step 5: Observe selected segment button icon color');
      Logger.info('TEST', 'Expected: 已选择的分段按钮的图标按照预设颜色正常显示，为粉色');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0220 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0230
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0230', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0230 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 页签型分段按钮');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20230');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-3：点击itemSelectedSymbolFontColor接口按钮
      Logger.info('TEST', 'Step 2-3: Click itemSelectedSymbolFontColor interface button');
      let itemSelectedSymbolFontColorButton = await driver.findComponent(ON.id('itemSelectedSymbolFontColorButton'));
      if (itemSelectedSymbolFontColorButton) {
        await itemSelectedSymbolFontColorButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤4：已设置颜色
      Logger.info('TEST', 'Step 4: itemSelectedSymbolFontColor set to ColorMetrics.resourceColor($r("app.color.Pink"))');

      // 步骤5：观察已选择的分段按钮的HM Symbol类型图标颜色
      Logger.info('TEST', 'Step 5: Observe selected segment button HM Symbol icon color');
      Logger.info('TEST', 'Expected: 已选择的分段按钮的HM Symbol类型图标按照预设颜色正常显示，为粉色');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0230 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0240
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0240', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0240 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 页签型分段按钮');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20240');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-3：点击itemSymbolFontColor接口按钮
      Logger.info('TEST', 'Step 2-3: Click itemSymbolFontColor interface button');
      let itemSymbolFontColorButton = await driver.findComponent(ON.id('itemSymbolFontColorButton'));
      if (itemSymbolFontColorButton) {
        await itemSymbolFontColorButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤4：已设置颜色
      Logger.info('TEST', 'Step 4: itemSymbolFontColor set to ColorMetrics.resourceColor($r("app.color.Pink"))');

      // 步骤5：观察未选择的分段按钮的HM Symbol类型图标颜色
      Logger.info('TEST', 'Step 5: Observe unselected segment button HM Symbol icon color');
      Logger.info('TEST', 'Expected: 未选择的分段按钮的HM Symbol类型图标按照预设颜色正常显示，为粉色');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0240 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0250
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0250', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0250 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 with colorMode: DARK');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20250');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2：观察分段按钮背景模糊效果
      Logger.info('TEST', 'Step 2: Observe segment button background blur effect');
      Logger.info('TEST', 'Expected: 分段按钮背景模糊是暗色模式');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0250 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0260
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0260', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0260 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 with colorMode: LIGHT');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20260');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2：观察分段按钮背景模糊效果
      Logger.info('TEST', 'Step 2: Observe segment button background blur effect');
      Logger.info('TEST', 'Expected: 分段按钮背景模糊是亮色模式');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0260 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0270
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0270', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0270 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 with colorMode: SYSTEM');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20270');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2：观察分段按钮背景模糊效果
      Logger.info('TEST', 'Step 2: Observe segment button background blur effect');
      Logger.info('TEST', 'Expected: 分段按钮背景模糊跟随系统');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0270 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0280
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0280', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0280 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 with BlurStyle.COMPONENT_REGULAR');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20280');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击COMPONENT_REGULAR按钮
      Logger.info('TEST', 'Step 2-4: Click COMPONENT_REGULAR button');
      let componentRegularButton = await driver.findComponent(ON.id('componentRegularButton'));
      if (componentRegularButton) {
        await componentRegularButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察分段按钮背景模糊效果
      Logger.info('TEST', 'Step 5: Observe segment button background blur effect');
      Logger.info('TEST', 'Expected: 分段按钮背景按照预设模糊 COMPONENT_REGULAR 正常显示');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0280 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0290
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0290', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0290 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 with BlurStyle.COMPONENT_THICK');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20290');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击COMPONENT_THICK按钮
      Logger.info('TEST', 'Step 2-4: Click COMPONENT_THICK button');
      let componentThickButton = await driver.findComponent(ON.id('componentThickButton'));
      if (componentThickButton) {
        await componentThickButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察分段按钮背景模糊效果
      Logger.info('TEST', 'Step 5: Observe segment button background blur effect');
      Logger.info('TEST', 'Expected: 分段按钮背景按照预设模糊 COMPONENT_THICK 正常显示');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0290 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0300
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0300', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0300 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 with BlurStyle.COMPONENT_THIN');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20300');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击COMPONENT_THIN按钮
      Logger.info('TEST', 'Step 2-4: Click COMPONENT_THIN button');
      let componentThinButton = await driver.findComponent(ON.id('componentThinButton'));
      if (componentThinButton) {
        await componentThinButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察分段按钮背景模糊效果
      Logger.info('TEST', 'Step 5: Observe segment button background blur effect');
      Logger.info('TEST', 'Expected: 分段按钮背景按照预设模糊 COMPONENT_THIN 正常显示');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0300 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0310
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0310', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0310 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 with BlurStyle.COMPONENT_ULTRA_THICK');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20310');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击COMPONENT_ULTRA_THICK按钮
      Logger.info('TEST', 'Step 2-4: Click COMPONENT_ULTRA_THICK button');
      let componentUltraThickButton = await driver.findComponent(ON.id('componentUltraThickButton'));
      if (componentUltraThickButton) {
        await componentUltraThickButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察分段按钮背景模糊效果
      Logger.info('TEST', 'Step 5: Observe segment button background blur effect');
      Logger.info('TEST', 'Expected: 分段按钮背景按照预设模糊 COMPONENT_ULTRA_THICK 正常显示');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0310 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0320
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0320', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0320 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 with BlurStyle.BACKGROUND_REGULAR');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20320');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击BACKGROUND_REGULAR按钮
      Logger.info('TEST', 'Step 2-4: Click BACKGROUND_REGULAR button');
      let backgroundRegularButton = await driver.findComponent(ON.id('backgroundRegularButton'));
      if (backgroundRegularButton) {
        await backgroundRegularButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察分段按钮背景模糊效果
      Logger.info('TEST', 'Step 5: Observe segment button background blur effect');
      Logger.info('TEST', 'Expected: 分段按钮背景按照预设模糊 BACKGROUND_REGULAR 正常显示');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0320 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0330
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0330', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0330 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 with BlurStyle.BACKGROUND_THICK');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20330');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击BACKGROUND_THICK按钮
      Logger.info('TEST', 'Step 2-4: Click BACKGROUND_THICK button');
      let backgroundThickButton = await driver.findComponent(ON.id('backgroundThickButton'));
      if (backgroundThickButton) {
        await backgroundThickButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察分段按钮背景模糊效果
      Logger.info('TEST', 'Step 5: Observe segment button background blur effect');
      Logger.info('TEST', 'Expected: 分段按钮背景按照预设模糊 BACKGROUND_THICK 正常显示');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0330 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0340
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0340', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0340 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 with BlurStyle.BACKGROUND_THIN');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20340');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击BACKGROUND_THIN按钮
      Logger.info('TEST', 'Step 2-4: Click BACKGROUND_THIN button');
      let backgroundThinButton = await driver.findComponent(ON.id('backgroundThinButton'));
      if (backgroundThinButton) {
        await backgroundThinButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察分段按钮背景模糊效果
      Logger.info('TEST', 'Step 5: Observe segment button background blur effect');
      Logger.info('TEST', 'Expected: 分段按钮背景按照预设模糊 BACKGROUND_THIN 正常显示');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0340 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0350
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0350', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0350 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 with BlurStyle.BACKGROUND_ULTRA_THICK');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20350');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击BACKGROUND_ULTRA_THICK按钮
      Logger.info('TEST', 'Step 2-4: Click BACKGROUND_ULTRA_THICK button');
      let backgroundUltraThickButton = await driver.findComponent(ON.id('backgroundUltraThickButton'));
      if (backgroundUltraThickButton) {
        await backgroundUltraThickButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察分段按钮背景模糊效果
      Logger.info('TEST', 'Step 5: Observe segment button background blur effect');
      Logger.info('TEST', 'Expected: 分段按钮背景按照预设模糊 BACKGROUND_ULTRA_THICK 正常显示');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0350 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0360
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0360', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0360 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 with BlurStyle.COMPONENT_ULTRA_THIN');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20360');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击COMPONENT_ULTRA_THIN按钮
      Logger.info('TEST', 'Step 2-4: Click COMPONENT_ULTRA_THIN button');
      let componentUltraThinButton = await driver.findComponent(ON.id('componentUltraThinButton'));
      if (componentUltraThinButton) {
        await componentUltraThinButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察分段按钮背景模糊效果
      Logger.info('TEST', 'Step 5: Observe segment button background blur effect');
      Logger.info('TEST', 'Expected: 分段按钮背景按照预设模糊 COMPONENT_ULTRA_THIN 正常显示');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0360 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0370
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0370', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0370 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 with BlurStyle.NONE');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20370');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击NONE按钮
      Logger.info('TEST', 'Step 2-4: Click NONE button');
      let noneButton = await driver.findComponent(ON.id('noneButton'));
      if (noneButton) {
        await noneButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察分段按钮背景模糊效果
      Logger.info('TEST', 'Step 5: Observe segment button background blur effect');
      Logger.info('TEST', 'Expected: 分段按钮背景按照预设模糊 NONE 正常显示（无模糊效果）');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0370 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0380
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0380', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0380 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 with BlurStyle.Regular');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20380');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击Regular按钮
      Logger.info('TEST', 'Step 2-4: Click Regular button');
      let regularButton = await driver.findComponent(ON.id('regularButton'));
      if (regularButton) {
        await regularButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察分段按钮背景模糊效果
      Logger.info('TEST', 'Step 5: Observe segment button background blur effect');
      Logger.info('TEST', 'Expected: 分段按钮背景按照预设模糊 Regular 正常显示');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0380 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0390
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0390', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0390 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 with BlurStyle.Thick');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20390');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击Thick按钮
      Logger.info('TEST', 'Step 2-4: Click Thick button');
      let thickButton = await driver.findComponent(ON.id('thickButton'));
      if (thickButton) {
        await thickButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察分段按钮背景模糊效果
      Logger.info('TEST', 'Step 5: Observe segment button background blur effect');
      Logger.info('TEST', 'Expected: 分段按钮背景按照预设模糊 Thick 正常显示');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0390 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0400
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0400', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0400 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 with BlurStyle.Thin');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20400');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击Thin按钮
      Logger.info('TEST', 'Step 2-4: Click Thin button');
      let thinButton = await driver.findComponent(ON.id('thinButton'));
      if (thinButton) {
        await thinButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察分段按钮背景模糊效果
      Logger.info('TEST', 'Step 5: Observe segment button background blur effect');
      Logger.info('TEST', 'Expected: 分段按钮背景按照预设模糊 Thin 正常显示');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0400 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0410
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0410', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0410 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 with rgba color');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20410');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击rgba黄色按钮
      Logger.info('TEST', 'Step 2-4: Click rgba yellow button');
      let rgbaYellowButton = await driver.findComponent(ON.id('rgbaYellowButton'));
      if (rgbaYellowButton) {
        await rgbaYellowButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察分段按钮背景颜色
      Logger.info('TEST', 'Step 5: Observe segment button background color');
      Logger.info('TEST', 'Expected: 分段按钮背景按照预设颜色正常显示，为黄色');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0410 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0420
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0420', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0420 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 with custom colors');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20420');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 测试红+绿=黄
      Logger.info('TEST', 'Step 2: Test yellow (red + green)');
      let yellowButton = await driver.findComponent(ON.id('yellowButton'));
      if (yellowButton) {
        await yellowButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 测试绿+蓝=青
      Logger.info('TEST', 'Step 3: Test cyan (green + blue)');
      let cyanButton = await driver.findComponent(ON.id('cyanButton'));
      if (cyanButton) {
        await cyanButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 测试蓝+红=品红
      Logger.info('TEST', 'Step 4: Test magenta (blue + red)');
      let magentaButton = await driver.findComponent(ON.id('magentaButton'));
      if (magentaButton) {
        await magentaButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察分段按钮背景颜色
      Logger.info('TEST', 'Step 5: Observe segment button background color');
      Logger.info('TEST', 'Expected: 分段按钮背景按照预设颜色正常显示，Alpha透明度调节功能正常');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0420 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0430
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0430', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0430 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 with preset colors');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20430');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 测试预设蓝色
      Logger.info('TEST', 'Step 2: Test preset blue');
      let presetBlueButton = await driver.findComponent(ON.id('presetBlueButton'));
      if (presetBlueButton) {
        await presetBlueButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 测试预设灰色
      Logger.info('TEST', 'Step 3: Test preset gray');
      let presetGrayButton = await driver.findComponent(ON.id('presetGrayButton'));
      if (presetGrayButton) {
        await presetGrayButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 测试预设白色
      Logger.info('TEST', 'Step 4: Test preset white');
      let presetWhiteButton = await driver.findComponent(ON.id('presetWhiteButton'));
      if (presetWhiteButton) {
        await presetWhiteButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察分段按钮背景颜色
      Logger.info('TEST', 'Step 5: Observe segment button background color');
      Logger.info('TEST', 'Expected: 分段按钮背景按照预设颜色（蓝色、灰色、白色）正常显示');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0430 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0440
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0440', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0440 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 buttonBorderRadius');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20440');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-3：点击buttonBorderRadius接口按钮
      Logger.info('TEST', 'Step 2-3: Click buttonBorderRadius interface button');
      let resourceBorderRadiusButton = await driver.findComponent(ON.id('resourceBorderRadiusButton'));
      if (resourceBorderRadiusButton) {
        await resourceBorderRadiusButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤4：设置接口参数为$r(app.string.string1) - 100vp
      Logger.info('TEST', 'Step 4: buttonBorderRadius set to $r(app.string.string1) - 100vp');

      // 步骤5：观察分段按钮圆角是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the segment button border radius displays normally');
      Logger.info('TEST', 'Expected: 分段按钮的圆角正常显示，圆角设的小值才能比较明显');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0440 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0450
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0450', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0450 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 buttonBorderRadius with percentage');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20450');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-3：点击buttonBorderRadius接口按钮
      Logger.info('TEST', 'Step 2-3: Click buttonBorderRadius interface button');
      let percentBorderRadiusButton = await driver.findComponent(ON.id('percentBorderRadiusButton'));
      if (percentBorderRadiusButton) {
        await percentBorderRadiusButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤4：设置接口参数为10%
      Logger.info('TEST', 'Step 4: buttonBorderRadius set to 10%');

      // 步骤5：观察分段按钮圆角是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the segment button border radius displays normally');
      Logger.info('TEST', 'Expected: 分段按钮的圆角正常显示，圆角设的小值才能比较明显');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0450 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0460
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0460', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0460 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 buttonBorderRadius with fp unit');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20460');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-3：点击buttonBorderRadius接口按钮
      Logger.info('TEST', 'Step 2-3: Click buttonBorderRadius interface button');
      let fpBorderRadiusButton = await driver.findComponent(ON.id('fpBorderRadiusButton'));
      if (fpBorderRadiusButton) {
        await fpBorderRadiusButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤4：设置接口参数为10fp
      Logger.info('TEST', 'Step 4: buttonBorderRadius set to 10fp');

      // 步骤5：观察分段按钮圆角是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the segment button border radius displays normally');
      Logger.info('TEST', 'Expected: 分段按钮的圆角正常显示，圆角设的小值才能比较明显');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0460 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0470
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0470', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0470 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 buttonBorderRadius with lpx unit');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20470');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-3：点击buttonBorderRadius接口按钮
      Logger.info('TEST', 'Step 2-3: Click buttonBorderRadius interface button');
      let lpxBorderRadiusButton = await driver.findComponent(ON.id('lpxBorderRadiusButton'));
      if (lpxBorderRadiusButton) {
        await lpxBorderRadiusButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤4：设置接口参数为10lpx
      Logger.info('TEST', 'Step 4: buttonBorderRadius set to 10lpx');

      // 步骤5：观察分段按钮圆角是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the segment button border radius displays normally');
      Logger.info('TEST', 'Expected: 分段按钮的圆角正常显示，圆角设的小值才能比较明显');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0470 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0480
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0480', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0480 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 buttonBorderRadius with px unit');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20480');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-3：点击buttonBorderRadius接口按钮
      Logger.info('TEST', 'Step 2-3: Click buttonBorderRadius interface button');
      let pxBorderRadiusButton = await driver.findComponent(ON.id('pxBorderRadiusButton'));
      if (pxBorderRadiusButton) {
        await pxBorderRadiusButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤4：设置接口参数为10px
      Logger.info('TEST', 'Step 4: buttonBorderRadius set to 10px');

      // 步骤5：观察分段按钮背板圆角是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the segment button border radius displays normally');
      Logger.info('TEST', 'Expected: 分段按钮的圆角正常显示，圆角设的小值才能比较明显');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0480 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0490
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0490', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0490 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 buttonBorderRadius with vp unit');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20490');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-3：点击buttonBorderRadius接口按钮
      Logger.info('TEST', 'Step 2-3: Click buttonBorderRadius interface button');
      let vpBorderRadiusButton = await driver.findComponent(ON.id('vpBorderRadiusButton'));
      if (vpBorderRadiusButton) {
        await vpBorderRadiusButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤4：设置接口参数为10vp
      Logger.info('TEST', 'Step 4: buttonBorderRadius set to 10vp');

      // 步骤5：观察分段按钮圆角是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the segment button border radius displays normally');
      Logger.info('TEST', 'Expected: 分段按钮的圆角正常显示，圆角设的小值才能比较明显');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0490 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0500
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0500', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0500 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 buttonBorderRadius with undefined');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20500');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-3：点击buttonBorderRadius接口按钮
      Logger.info('TEST', 'Step 2-3: Click buttonBorderRadius interface button');
      let undefinedBorderRadiusButton = await driver.findComponent(ON.id('undefinedBorderRadiusButton'));
      if (undefinedBorderRadiusButton) {
        await undefinedBorderRadiusButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤4：设置接口参数为undefined
      Logger.info('TEST', 'Step 4: buttonBorderRadius set to undefined');

      // 步骤5：观察分段按钮圆角是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the segment button border radius displays normally');
      Logger.info('TEST', 'Expected: 分段按钮的圆角正常显示，设置undefined时使用默认圆角');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0500 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0510
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0510', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0510 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 buttonMinHeight');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20510');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-3：点击buttonMinHeight接口按钮
      Logger.info('TEST', 'Step 2-3: Click buttonMinHeight interface button');
      let resourceMinHeightButton = await driver.findComponent(ON.id('resourceMinHeightButton'));
      if (resourceMinHeightButton) {
        await resourceMinHeightButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤4：设置接口参数为$r(app.string.string1) - 50vp
      Logger.info('TEST', 'Step 4: buttonMinHeight set to $r(app.string.string1) - 50vp');

      // 步骤5：观察分段按钮最小高度是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the segment button min height displays normally');
      Logger.info('TEST', 'Expected: 分段按钮自适应最小高度，当前分段按钮的高度就是设置的最小高度50vp');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0510 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0520
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0520', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0520 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 buttonMinHeight with negative value');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20520');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-3：点击buttonMinHeight接口按钮
      Logger.info('TEST', 'Step 2-3: Click buttonMinHeight interface button');
      let negativeMinHeightButton = await driver.findComponent(ON.id('negativeMinHeightButton'));
      if (negativeMinHeightButton) {
        await negativeMinHeightButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤4：设置接口参数为-1vp
      Logger.info('TEST', 'Step 4: buttonMinHeight set to -1vp');

      // 步骤5：观察分段按钮最小高度是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the segment button min height displays normally');
      Logger.info('TEST', 'Expected: 分段按钮自适应最小高度，设置-1vp时使用默认值40vp');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0520 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0530
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0530', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0530 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 buttonMinHeight with percentage');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20530');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-3：点击buttonMinHeight接口按钮
      Logger.info('TEST', 'Step 2-3: Click buttonMinHeight interface button');
      let percentMinHeightButton = await driver.findComponent(ON.id('percentMinHeightButton'));
      if (percentMinHeightButton) {
        await percentMinHeightButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤4：设置接口参数为10%
      Logger.info('TEST', 'Step 4: buttonMinHeight set to 10%');

      // 步骤5：观察分段按钮最小高度是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the segment button min height displays normally');
      Logger.info('TEST', 'Expected: 分段按钮自适应最小高度，当前分段按钮的高度就是设置的最小高度10%');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0530 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0540
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0540', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0540 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 buttonMinHeight with fp unit');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20540');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-3：点击buttonMinHeight接口按钮
      Logger.info('TEST', 'Step 2-3: Click buttonMinHeight interface button');
      let fpMinHeightButton = await driver.findComponent(ON.id('fpMinHeightButton'));
      if (fpMinHeightButton) {
        await fpMinHeightButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤4：设置接口参数为90fp
      Logger.info('TEST', 'Step 4: buttonMinHeight set to 90fp');

      // 步骤5：观察分段按钮最小高度是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the segment button min height displays normally');
      Logger.info('TEST', 'Expected: 分段按钮自适应最小高度，当前分段按钮的高度就是设置的最小高度90fp');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0540 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0550
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0550', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0550 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 buttonMinHeight with lpx unit');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20550');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-3：点击buttonMinHeight接口按钮
      Logger.info('TEST', 'Step 2-3: Click buttonMinHeight interface button');
      let lpxMinHeightButton = await driver.findComponent(ON.id('lpxMinHeightButton'));
      if (lpxMinHeightButton) {
        await lpxMinHeightButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤4：设置接口参数为90lpx
      Logger.info('TEST', 'Step 4: buttonMinHeight set to 90lpx');

      // 步骤5：观察分段按钮最小高度是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the segment button min height displays normally');
      Logger.info('TEST', 'Expected: 分段按钮自适应最小高度，当前分段按钮的高度就是设置的最小高度90lpx');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0550 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0560
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0560', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0560 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 buttonMinHeight with px unit');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20560');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-3：点击buttonMinHeight接口按钮
      Logger.info('TEST', 'Step 2-3: Click buttonMinHeight interface button');
      let pxMinHeightButton = await driver.findComponent(ON.id('pxMinHeightButton'));
      if (pxMinHeightButton) {
        await pxMinHeightButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤4：设置接口参数为90px
      Logger.info('TEST', 'Step 4: buttonMinHeight set to 90px');

      // 步骤5：观察分段按钮最小高度是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the segment button min height displays normally');
      Logger.info('TEST', 'Expected: 分段按钮自适应最小高度，当前分段按钮的高度就是默认值40vp');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0560 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0570
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0570', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0570 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 buttonMinHeight with vp unit');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20570');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-3：点击buttonMinHeight接口按钮
      Logger.info('TEST', 'Step 2-3: Click buttonMinHeight interface button');
      let vpMinHeightButton = await driver.findComponent(ON.id('vpMinHeightButton'));
      if (vpMinHeightButton) {
        await vpMinHeightButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤4：设置接口参数为90vp
      Logger.info('TEST', 'Step 4: buttonMinHeight set to 90vp');

      // 步骤5：观察分段按钮最小高度是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the segment button min height displays normally');
      Logger.info('TEST', 'Expected: 分段按钮自适应最小高度，当前分段按钮的高度就是设置的最小高度90vp');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0570 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0580
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0580', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0580 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 buttonMinHeight with undefined');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20580');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-3：点击buttonMinHeight接口按钮
      Logger.info('TEST', 'Step 2-3: Click buttonMinHeight interface button');
      let undefinedMinHeightButton = await driver.findComponent(ON.id('undefinedMinHeightButton'));
      if (undefinedMinHeightButton) {
        await undefinedMinHeightButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤4：设置接口参数为undefined
      Logger.info('TEST', 'Step 4: buttonMinHeight set to undefined');

      // 步骤5：观察分段按钮最小高度是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the segment button min height displays normally');
      Logger.info('TEST', 'Expected: 分段按钮自适应最小高度，设置undefined时使用默认值40vp');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0580 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0590
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0590', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0590 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 buttonPadding');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20590');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-3：点击buttonPadding接口按钮
      Logger.info('TEST', 'Step 2-3: Click buttonPadding interface button');
      let resourcePaddingButton = await driver.findComponent(ON.id('resourcePaddingButton'));
      if (resourcePaddingButton) {
        await resourcePaddingButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤4：设置接口参数为$r(app.string.string1) - 100vp
      Logger.info('TEST', 'Step 4: buttonPadding set to $r(app.string.string1) - 100vp');

      // 步骤5：观察分段按钮背板内边距和布局是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the segment button padding displays normally');
      Logger.info('TEST', 'Expected: 分段按钮背板的内边距依照设置的内边距显示');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0590 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0600
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0600', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0600 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 buttonPadding with percentage');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20600');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-3：点击buttonPadding接口按钮
      Logger.info('TEST', 'Step 2-3: Click buttonPadding interface button');
      let percentPaddingButton = await driver.findComponent(ON.id('percentPaddingButton'));
      if (percentPaddingButton) {
        await percentPaddingButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤4：设置接口参数为10%
      Logger.info('TEST', 'Step 4: buttonPadding set to 10%');

      // 步骤5：观察分段按钮背板内边距和布局是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the segment button padding displays normally');
      Logger.info('TEST', 'Expected: 分段按钮背板的内边距依照设置的内边距显示');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0600 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0610
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0610', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0610 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 buttonPadding with fp unit');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20610');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-3：点击buttonPadding接口按钮
      Logger.info('TEST', 'Step 2-3: Click buttonPadding interface button');
      let fpPaddingButton = await driver.findComponent(ON.id('fpPaddingButton'));
      if (fpPaddingButton) {
        await fpPaddingButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤4：设置接口参数为50fp
      Logger.info('TEST', 'Step 4: buttonPadding set to 50fp');

      // 步骤5：观察分段按钮背板内边距和布局是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the segment button padding displays normally');
      Logger.info('TEST', 'Expected: 分段按钮背板的内边距依照设置的内边距显示');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0610 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0620
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0620', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0620 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 buttonPadding with lpx unit');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20620');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-3：点击buttonPadding接口按钮
      Logger.info('TEST', 'Step 2-3: Click buttonPadding interface button');
      let lpxPaddingButton = await driver.findComponent(ON.id('lpxPaddingButton'));
      if (lpxPaddingButton) {
        await lpxPaddingButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤4：设置接口参数为50lpx
      Logger.info('TEST', 'Step 4: buttonPadding set to 50lpx');

      // 步骤5：观察分段按钮背板内边距和布局是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the segment button padding displays normally');
      Logger.info('TEST', 'Expected: 分段按钮背板的内边距依照设置的内边距显示');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0620 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0630
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0630', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0630 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 buttonPadding with px unit');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20630');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-3：点击buttonPadding接口按钮
      Logger.info('TEST', 'Step 2-3: Click buttonPadding interface button');
      let pxPaddingButton = await driver.findComponent(ON.id('pxPaddingButton'));
      if (pxPaddingButton) {
        await pxPaddingButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤4：设置接口参数为50px
      Logger.info('TEST', 'Step 4: buttonPadding set to 50px');

      // 步骤5：观察分段按钮背板内边距和布局是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the segment button padding displays normally');
      Logger.info('TEST', 'Expected: 分段按钮背板的内边距依照设置的内边距显示');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0630 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0640
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0640', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0640 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 buttonPadding with vp unit');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20640');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-3：点击buttonPadding接口按钮
      Logger.info('TEST', 'Step 2-3: Click buttonPadding interface button');
      let vpPaddingButton = await driver.findComponent(ON.id('vpPaddingButton'));
      if (vpPaddingButton) {
        await vpPaddingButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤4：设置接口参数为50vp
      Logger.info('TEST', 'Step 4: buttonPadding set to 50vp');

      // 步骤5：观察分段按钮背板内边距和布局是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the segment button padding displays normally');
      Logger.info('TEST', 'Expected: 分段按钮背板的内边距依照设置的内边距显示');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0640 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0650
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0650', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0650 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 buttonPadding with undefined');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20650');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-3：点击buttonPadding接口按钮
      Logger.info('TEST', 'Step 2-3: Click buttonPadding interface button');
      let undefinedPaddingButton = await driver.findComponent(ON.id('undefinedPaddingButton'));
      if (undefinedPaddingButton) {
        await undefinedPaddingButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤4：设置接口参数为undefined
      Logger.info('TEST', 'Step 4: buttonPadding set to undefined');

      // 步骤5：观察分段按钮背板内边距和布局是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the segment button padding displays normally');
      Logger.info('TEST', 'Expected: 分段按钮背板的内边距依照设置的内边距显示（使用默认值）');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0650 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0660
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0660', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0660 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 itemBorderRadius with resource');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20660');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-3：点击itemBorderRadius接口按钮
      Logger.info('TEST', 'Step 2-3: Click itemBorderRadius interface button');
      let resourceItemBorderRadiusButton = await driver.findComponent(ON.id('resourceItemBorderRadiusButton'));
      if (resourceItemBorderRadiusButton) {
        await resourceItemBorderRadiusButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤4：设置接口参数为$r(app.string.itemBorderRadius_100vp)
      Logger.info('TEST', 'Step 4: itemBorderRadius set to $r(app.string.itemBorderRadius_100vp) - 100vp');

      // 步骤5：观察分段按钮按钮圆角是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the segment button item border radius displays normally');
      Logger.info('TEST', 'Expected: 分段按钮的圆角正常显示，圆角设的小值才能比较明显');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0660 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0670
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0670', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0670 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 itemBorderRadius with 10%');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20670');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-3：点击itemBorderRadius接口按钮
      Logger.info('TEST', 'Step 2-3: Click itemBorderRadius interface button');
      let percentItemBorderRadiusButton = await driver.findComponent(ON.id('percentItemBorderRadiusButton'));
      if (percentItemBorderRadiusButton) {
        await percentItemBorderRadiusButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤4：设置接口参数为10%
      Logger.info('TEST', 'Step 4: itemBorderRadius set to 10%');

      // 步骤5：观察分段按钮按钮圆角是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the segment button item border radius displays normally');
      Logger.info('TEST', 'Expected: 分段按钮的圆角正常显示，圆角设的小值才能比较明显');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0670 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0680
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0680', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0680 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 itemBorderRadius with 10fp');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20680');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-3：点击itemBorderRadius接口按钮
      Logger.info('TEST', 'Step 2-3: Click itemBorderRadius interface button');
      let fpItemBorderRadiusButton = await driver.findComponent(ON.id('fpItemBorderRadiusButton'));
      if (fpItemBorderRadiusButton) {
        await fpItemBorderRadiusButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤4：设置接口参数为10fp
      Logger.info('TEST', 'Step 4: itemBorderRadius set to 10fp');

      // 步骤5：观察分段按钮按钮圆角是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the segment button item border radius displays normally');
      Logger.info('TEST', 'Expected: 分段按钮的圆角正常显示，圆角设的小值才能比较明显');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0680 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0690
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0690', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0690 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 itemBorderRadius with 10lpx');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20690');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-3：点击itemBorderRadius接口按钮
      Logger.info('TEST', 'Step 2-3: Click itemBorderRadius interface button');
      let lpxItemBorderRadiusButton = await driver.findComponent(ON.id('lpxItemBorderRadiusButton'));
      if (lpxItemBorderRadiusButton) {
        await lpxItemBorderRadiusButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤4：设置接口参数为10lpx
      Logger.info('TEST', 'Step 4: itemBorderRadius set to 10lpx');

      // 步骤5：观察分段按钮按钮圆角是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the segment button item border radius displays normally');
      Logger.info('TEST', 'Expected: 分段按钮的圆角正常显示，圆角设的小值才能比较明显');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0690 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0700
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0700', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0700 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 itemBorderRadius with 10px');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20700');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-3：点击itemBorderRadius接口按钮
      Logger.info('TEST', 'Step 2-3: Click itemBorderRadius interface button');
      let pxItemBorderRadiusButton = await driver.findComponent(ON.id('pxItemBorderRadiusButton'));
      if (pxItemBorderRadiusButton) {
        await pxItemBorderRadiusButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤4：设置接口参数为10px
      Logger.info('TEST', 'Step 4: itemBorderRadius set to 10px');

      // 步骤5：观察分段按钮item圆角是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the segment button item border radius displays normally');
      Logger.info('TEST', 'Expected: 分段按钮的圆角正常显示，圆角设的小值才能比较明显');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0700 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0710
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0710', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0710 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 itemBorderRadius with 10vp');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20710');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-3：点击itemBorderRadius接口按钮
      Logger.info('TEST', 'Step 2-3: Click itemBorderRadius interface button');
      let vpItemBorderRadiusButton = await driver.findComponent(ON.id('vpItemBorderRadiusButton'));
      if (vpItemBorderRadiusButton) {
        await vpItemBorderRadiusButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤4：设置接口参数为10vp
      Logger.info('TEST', 'Step 4: itemBorderRadius set to 10vp');

      // 步骤5：观察分段按钮按钮圆角是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the segment button item border radius displays normally');
      Logger.info('TEST', 'Expected: 分段按钮的圆角正常显示，圆角设的小值才能比较明显');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0710 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0720
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0720', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0720 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 itemBorderRadius with undefined');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20720');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-3：点击itemBorderRadius接口按钮
      Logger.info('TEST', 'Step 2-3: Click itemBorderRadius interface button');
      let undefinedItemBorderRadiusButton = await driver.findComponent(ON.id('undefinedItemBorderRadiusButton'));
      if (undefinedItemBorderRadiusButton) {
        await undefinedItemBorderRadiusButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤4：设置接口参数为undefined
      Logger.info('TEST', 'Step 4: itemBorderRadius set to undefined');

      // 步骤5：观察分段按钮按钮圆角是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the segment button item border radius displays normally');
      Logger.info('TEST', 'Expected: 分段按钮的圆角正常显示，使用默认圆角');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0720 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0730
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0730', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0730 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 itemFontColor with rgba');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20730');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击itemFontColor接口按钮，设置为rgba(255,255,0,255)
      Logger.info('TEST', 'Step 2-4: Click itemFontColor interface button with rgba(255,255,0,255)');
      let rgbaColorButton = await driver.findComponent(ON.id('rgbaColorButton'));
      if (rgbaColorButton) {
        await rgbaColorButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察非选中的分段按钮的字体颜色是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the unselected segment button font color displays normally');
      Logger.info('TEST', 'Expected: 非选中的分段按钮的字体颜色按照预设颜色正常显示，为黄色');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0730 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0740
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0740', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0740 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 itemFontColor with custom colors');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20740');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：测试红色
      Logger.info('TEST', 'Step 2-4: Click custom color button (red)');
      let redColorButton = await driver.findComponent(ON.id('redColorButton'));
      if (redColorButton) {
        await redColorButton.click();
        await driver.waitForIdle(1000, 2000);
      }
      Logger.info('TEST', 'Red color test - 单独设置红色');

      // 测试绿色
      Logger.info('TEST', 'Click custom color button (green)');
      let greenColorButton = await driver.findComponent(ON.id('greenColorButton'));
      if (greenColorButton) {
        await greenColorButton.click();
        await driver.waitForIdle(1000, 2000);
      }
      Logger.info('TEST', 'Green color test - 单独设置绿色');

      // 测试蓝色
      Logger.info('TEST', 'Click custom color button (blue)');
      let blueColorButton = await driver.findComponent(ON.id('blueColorButton'));
      if (blueColorButton) {
        await blueColorButton.click();
        await driver.waitForIdle(1000, 2000);
      }
      Logger.info('TEST', 'Blue color test - 单独设置蓝色');

      // 测试黄色（红+绿混合）
      Logger.info('TEST', 'Click custom color button (yellow - red+green)');
      let yellowColorButton = await driver.findComponent(ON.id('yellowColorButton'));
      if (yellowColorButton) {
        await yellowColorButton.click();
        await driver.waitForIdle(1000, 2000);
      }
      Logger.info('TEST', 'Yellow color test - 红光和绿光混合产生黄光');

      // 测试青色（绿+蓝混合）
      Logger.info('TEST', 'Click custom color button (cyan - green+blue)');
      let cyanColorButton = await driver.findComponent(ON.id('cyanColorButton'));
      if (cyanColorButton) {
        await cyanColorButton.click();
        await driver.waitForIdle(1000, 2000);
      }
      Logger.info('TEST', 'Cyan color test - 绿光和蓝光混合产生青光');

      // 测试品红色（红+蓝混合）
      Logger.info('TEST', 'Click custom color button (magenta - red+blue)');
      let magentaColorButton = await driver.findComponent(ON.id('magentaColorButton'));
      if (magentaColorButton) {
        await magentaColorButton.click();
        await driver.waitForIdle(1000, 2000);
      }
      Logger.info('TEST', 'Magenta color test - 蓝光和红光混合产生品红色');

      // 测试白色（红+绿+蓝等量混合）
      Logger.info('TEST', 'Click custom color button (white - red+green+blue)');
      let whiteColorButton = await driver.findComponent(ON.id('whiteColorButton'));
      if (whiteColorButton) {
        await whiteColorButton.click();
        await driver.waitForIdle(1000, 2000);
      }
      Logger.info('TEST', 'White color test - 红、绿、蓝等量混合得到白色光');

      // 测试半透明红色（Alpha透明度调节）
      Logger.info('TEST', 'Click custom color button (semi-transparent red)');
      let semiTransparentRedButton = await driver.findComponent(ON.id('semiTransparentRedButton'));
      if (semiTransparentRedButton) {
        await semiTransparentRedButton.click();
        await driver.waitForIdle(1000, 2000);
      }
      Logger.info('TEST', 'Semi-transparent red test - Alpha透明度调节功能');

      // 步骤5：观察非选中的分段按钮的字体颜色是否正常显示
      Logger.info('TEST', 'Step 5: All custom colors tested');
      Logger.info('TEST', 'Expected: 非选中的分段按钮的字体颜色按照自定义颜色正常显示');
      Logger.info('TEST', 'Alpha是负责设置颜色透明度的，透明度的调节功能正常');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0740 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0750
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0750', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0750 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 itemFontColor with preset colors');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20750');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击预设颜色按钮（蓝色）
      Logger.info('TEST', 'Step 2-4: Click preset color button (blue)');
      let presetBlueButton = await driver.findComponent(ON.id('presetBlueButton'));
      if (presetBlueButton) {
        await presetBlueButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察非选中的分段按钮的字体颜色是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the unselected segment button font color displays normally');
      Logger.info('TEST', 'Expected: 非选中的分段按钮的字体颜色按照预设颜色正常显示');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0750 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0760
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0760', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0760 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 itemFontSize with -1');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20760');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击itemFontSize接口按钮，设置为-1
      Logger.info('TEST', 'Step 2-4: Click itemFontSize interface button with -1');
      let negativeFontSizeButton = await driver.findComponent(ON.id('negativeFontSizeButton'));
      if (negativeFontSizeButton) {
        await negativeFontSizeButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察未选择的item的字体大小是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the unselected item font size displays normally');
      Logger.info('TEST', 'Expected: 未选择的item的字体大小按照预设的大小正常显示，为默认值14fp');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0760 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0770
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0770', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0770 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 itemFontSize with 20vp');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20770');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击itemFontSize接口按钮，设置为20vp
      Logger.info('TEST', 'Step 2-4: Click itemFontSize interface button with 20vp');
      let vpFontSizeButton = await driver.findComponent(ON.id('vpFontSizeButton'));
      if (vpFontSizeButton) {
        await vpFontSizeButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察未选择的item的字体大小是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the unselected item font size displays normally');
      Logger.info('TEST', 'Expected: 未选择的item的字体大小按照预设的大小正常显示，为20vp');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0770 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0780
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0780', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0780 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 itemFontSize with 40%');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20780');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击itemFontSize接口按钮，设置为40%
      Logger.info('TEST', 'Step 2-4: Click itemFontSize interface button with 40%');
      let percentFontSizeButton = await driver.findComponent(ON.id('percentFontSizeButton'));
      if (percentFontSizeButton) {
        await percentFontSizeButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察未选择的item的字体大小是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the unselected item font size displays normally');
      Logger.info('TEST', 'Expected: 未选择的item的字体大小按照预设的大小正常显示');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0780 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0790
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0790', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0790 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 itemFontSize with 40fp');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20790');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击itemFontSize接口按钮，设置为40fp
      Logger.info('TEST', 'Step 2-4: Click itemFontSize interface button with 40fp');
      let fpFontSizeButton = await driver.findComponent(ON.id('fpFontSizeButton'));
      if (fpFontSizeButton) {
        await fpFontSizeButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察未选择的item的字体大小是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the unselected item font size displays normally');
      Logger.info('TEST', 'Expected: 未选择的item的字体大小按照预设的大小正常显示');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0790 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0800
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0800', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0800 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 itemFontSize with 40lpx');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20800');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击itemFontSize接口按钮，设置为40lpx
      Logger.info('TEST', 'Step 2-4: Click itemFontSize interface button with 40lpx');
      let lpxFontSizeButton = await driver.findComponent(ON.id('lpxFontSizeButton'));
      if (lpxFontSizeButton) {
        await lpxFontSizeButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察未选择的item的字体大小是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the unselected item font size displays normally');
      Logger.info('TEST', 'Expected: 未选择的item的字体大小按照预设的大小正常显示');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0800 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0810
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0810', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0810 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 itemFontSize with 40px');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20810');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击itemFontSize接口按钮，设置为40px
      Logger.info('TEST', 'Step 2-4: Click itemFontSize interface button with 40px');
      let pxFontSizeButton = await driver.findComponent(ON.id('pxFontSizeButton'));
      if (pxFontSizeButton) {
        await pxFontSizeButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察未选择的item的字体大小是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the unselected item font size displays normally');
      Logger.info('TEST', 'Expected: 未选择的item的字体大小按照预设的大小正常显示');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0810 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0820
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0820', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0820 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 itemFontSize with resource');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20820');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击itemFontSize接口按钮，设置为resource
      Logger.info('TEST', 'Step 2-4: Click itemFontSize interface button with resource($r("app.string.string1"))');
      let resourceFontSizeButton = await driver.findComponent(ON.id('resourceFontSizeButton'));
      if (resourceFontSizeButton) {
        await resourceFontSizeButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察未选择的item的字体大小是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the unselected item font size displays normally');
      Logger.info('TEST', 'Expected: 未选择的item的字体大小按照预设的大小正常显示');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0820 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0830
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0830', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0830 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 itemFontSize with undefined');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20830');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击itemFontSize接口按钮，设置为undefined
      Logger.info('TEST', 'Step 2-4: Click itemFontSize interface button with undefined');
      let undefinedFontSizeButton = await driver.findComponent(ON.id('undefinedFontSizeButton'));
      if (undefinedFontSizeButton) {
        await undefinedFontSizeButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察未选择的item的字体大小是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the unselected item font size displays normally');
      Logger.info('TEST', 'Expected: 未选择的item的字体大小按照预设的大小正常显示，为默认值14fp');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0830 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0840
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0840', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0840 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 itemFontWeight with Bolder');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20840');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击itemFontWeight接口按钮，设置为Bolder
      Logger.info('TEST', 'Step 2-4: Click itemFontWeight interface button with Bolder');
      let bolderFontWeightButton = await driver.findComponent(ON.id('bolderFontWeightButton'));
      if (bolderFontWeightButton) {
        await bolderFontWeightButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察分段按钮文字粗细是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the segment button font weight displays normally');
      Logger.info('TEST', 'Expected: 分段按钮文字粗细按照预设的大小正常显示');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0840 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0850
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0850', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0850 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 itemFontWeight with Bold');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20850');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击itemFontWeight接口按钮，设置为Bold
      Logger.info('TEST', 'Step 2-4: Click itemFontWeight interface button with Bold');
      let boldFontWeightButton = await driver.findComponent(ON.id('boldFontWeightButton'));
      if (boldFontWeightButton) {
        await boldFontWeightButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察分段按钮文字粗细是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the segment button font weight displays normally');
      Logger.info('TEST', 'Expected: 分段按钮文字粗细按照预设的大小正常显示');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0850 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0860
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0860', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0860 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 itemFontWeight with Lighter');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20860');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击itemFontWeight接口按钮，设置为Lighter
      Logger.info('TEST', 'Step 2-4: Click itemFontWeight interface button with Lighter');
      let lighterFontWeightButton = await driver.findComponent(ON.id('lighterFontWeightButton'));
      if (lighterFontWeightButton) {
        await lighterFontWeightButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察分段按钮文字粗细是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the segment button font weight displays normally');
      Logger.info('TEST', 'Expected: 分段按钮文字粗细按照预设的大小正常显示');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0860 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0870
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0870', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0870 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 itemFontWeight with Medium');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20870');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击itemFontWeight接口按钮，设置为Medium
      Logger.info('TEST', 'Step 2-4: Click itemFontWeight interface button with Medium');
      let mediumFontWeightButton = await driver.findComponent(ON.id('mediumFontWeightButton'));
      if (mediumFontWeightButton) {
        await mediumFontWeightButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察分段按钮文字粗细是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the segment button font weight displays normally');
      Logger.info('TEST', 'Expected: 分段按钮文字粗细按照预设的大小正常显示');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0870 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0880
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0880', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0880 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 itemFontWeight with Normal');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20880');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击itemFontWeight接口按钮，设置为Normal
      Logger.info('TEST', 'Step 2-4: Click itemFontWeight interface button with Normal');
      let normalFontWeightButton = await driver.findComponent(ON.id('normalFontWeightButton'));
      if (normalFontWeightButton) {
        await normalFontWeightButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察分段按钮文字粗细是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the segment button font weight displays normally');
      Logger.info('TEST', 'Expected: 分段按钮文字粗细按照预设的大小正常显示');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0880 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0890
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0890', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0890 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 itemFontWeight with Regular');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20890');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击itemFontWeight接口按钮，设置为Regular
      Logger.info('TEST', 'Step 2-4: Click itemFontWeight interface button with Regular');
      let regularFontWeightButton = await driver.findComponent(ON.id('regularFontWeightButton'));
      if (regularFontWeightButton) {
        await regularFontWeightButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察分段按钮文字粗细是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the segment button font weight displays normally');
      Logger.info('TEST', 'Expected: 分段按钮文字粗细按照预设的大小正常显示，Regular和Normal的字体大小是一致的');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0890 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0900
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0900', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0900 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 itemFontWeight with undefined');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20900');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击itemFontWeight接口按钮，设置为undefined
      Logger.info('TEST', 'Step 2-4: Click itemFontWeight interface button with undefined');
      let undefinedFontWeightButton = await driver.findComponent(ON.id('undefinedFontWeightButton'));
      if (undefinedFontWeightButton) {
        await undefinedFontWeightButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察分段按钮文字粗细是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the segment button font weight displays normally');
      Logger.info('TEST', 'Expected: 分段按钮文字粗细按照预设的大小正常显示，取得默认值medium');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0900 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0910
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0910', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0910 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 itemIconFillColor with rgba');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20910');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击itemIconFillColor接口按钮，设置为rgba(255,255,0,255)
      Logger.info('TEST', 'Step 2-4: Click itemIconFillColor interface button with rgba(255,255,0,255)');
      let rgbaColorButton = await driver.findComponent(ON.id('rgbaColorButton'));
      if (rgbaColorButton) {
        await rgbaColorButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察未选择的分段按钮的图标是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the unselected segment button icon displays normally');
      Logger.info('TEST', 'Expected: 未选择的分段按钮的图标按照预设颜色正常显示，为黄色');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0910 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0920
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0920', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0920 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 itemIconFillColor with custom colors');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20920');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：测试红色
      Logger.info('TEST', 'Step 2-4: Click custom color button (red)');
      let redColorButton = await driver.findComponent(ON.id('redColorButton'));
      if (redColorButton) {
        await redColorButton.click();
        await driver.waitForIdle(1000, 2000);
      }
      Logger.info('TEST', 'Red color test - 单独设置红色');

      // 测试绿色
      Logger.info('TEST', 'Click custom color button (green)');
      let greenColorButton = await driver.findComponent(ON.id('greenColorButton'));
      if (greenColorButton) {
        await greenColorButton.click();
        await driver.waitForIdle(1000, 2000);
      }
      Logger.info('TEST', 'Green color test - 单独设置绿色');

      // 测试蓝色
      Logger.info('TEST', 'Click custom color button (blue)');
      let blueColorButton = await driver.findComponent(ON.id('blueColorButton'));
      if (blueColorButton) {
        await blueColorButton.click();
        await driver.waitForIdle(1000, 2000);
      }
      Logger.info('TEST', 'Blue color test - 单独设置蓝色');

      // 测试黄色（红+绿混合）
      Logger.info('TEST', 'Click custom color button (yellow - red+green)');
      let yellowColorButton = await driver.findComponent(ON.id('yellowColorButton'));
      if (yellowColorButton) {
        await yellowColorButton.click();
        await driver.waitForIdle(1000, 2000);
      }
      Logger.info('TEST', 'Yellow color test - 红光和绿光混合产生黄光');

      // 测试青色（绿+蓝混合）
      Logger.info('TEST', 'Click custom color button (cyan - green+blue)');
      let cyanColorButton = await driver.findComponent(ON.id('cyanColorButton'));
      if (cyanColorButton) {
        await cyanColorButton.click();
        await driver.waitForIdle(1000, 2000);
      }
      Logger.info('TEST', 'Cyan color test - 绿光和蓝光混合产生青光');

      // 测试品红色（红+蓝混合）
      Logger.info('TEST', 'Click custom color button (magenta - red+blue)');
      let magentaColorButton = await driver.findComponent(ON.id('magentaColorButton'));
      if (magentaColorButton) {
        await magentaColorButton.click();
        await driver.waitForIdle(1000, 2000);
      }
      Logger.info('TEST', 'Magenta color test - 蓝光和红光混合产生品红色');

      // 测试白色（红+绿+蓝等量混合）
      Logger.info('TEST', 'Click custom color button (white - red+green+blue)');
      let whiteColorButton = await driver.findComponent(ON.id('whiteColorButton'));
      if (whiteColorButton) {
        await whiteColorButton.click();
        await driver.waitForIdle(1000, 2000);
      }
      Logger.info('TEST', 'White color test - 红、绿、蓝等量混合得到白色光');

      // 测试半透明红色（Alpha透明度调节）
      Logger.info('TEST', 'Click custom color button (semi-transparent red)');
      let semiTransparentRedButton = await driver.findComponent(ON.id('semiTransparentRedButton'));
      if (semiTransparentRedButton) {
        await semiTransparentRedButton.click();
        await driver.waitForIdle(1000, 2000);
      }
      Logger.info('TEST', 'Semi-transparent red test - Alpha透明度调节功能');

      // 步骤5：观察未选择的分段按钮的图标是否正常显示
      Logger.info('TEST', 'Step 5: All custom colors tested');
      Logger.info('TEST', 'Expected: 未选择的分段按钮的图标按照自定义颜色正常显示');
      Logger.info('TEST', 'Alpha是负责设置颜色透明度的，透明度的调节功能正常');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0920 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0930
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0930', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0930 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 itemIconFillColor with preset colors');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20930');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：测试预设颜色蓝色
      Logger.info('TEST', 'Step 2-4: Click preset color button (blue)');
      let presetBlueButton = await driver.findComponent(ON.id('presetBlueButton'));
      if (presetBlueButton) {
        await presetBlueButton.click();
        await driver.waitForIdle(1000, 2000);
      }
      Logger.info('TEST', 'Preset blue color test');

      // 测试预设颜色灰色
      Logger.info('TEST', 'Click preset color button (gray)');
      let presetGrayButton = await driver.findComponent(ON.id('presetGrayButton'));
      if (presetGrayButton) {
        await presetGrayButton.click();
        await driver.waitForIdle(1000, 2000);
      }
      Logger.info('TEST', 'Preset gray color test');

      // 测试预设颜色白色
      Logger.info('TEST', 'Click preset color button (white)');
      let presetWhiteButton = await driver.findComponent(ON.id('presetWhiteButton'));
      if (presetWhiteButton) {
        await presetWhiteButton.click();
        await driver.waitForIdle(1000, 2000);
      }
      Logger.info('TEST', 'Preset white color test');

      // 步骤5：观察未选择的分段按钮的图标是否正常显示
      Logger.info('TEST', 'Step 5: All preset colors tested');
      Logger.info('TEST', 'Expected: 未选择的分段按钮的图标按照预设颜色正常显示');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0930 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0940
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0940', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0940 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 itemIconSize with undefined');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20940');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击itemIconSize接口按钮，设置为undefined
      Logger.info('TEST', 'Step 2-4: Click itemIconSize interface button with undefined');
      let undefinedIconSizeButton = await driver.findComponent(ON.id('undefinedIconSizeButton'));
      if (undefinedIconSizeButton) {
        await undefinedIconSizeButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察图标大小是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the icon size displays normally');
      Logger.info('TEST', 'Expected: 图标大小按照预设的大小正常显示，为默认值24vp');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0940 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0950
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0950', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0950 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 itemIconSize with -1vp');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20950');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击itemIconSize接口按钮，设置为宽:-1vp, 高:-1vp
      Logger.info('TEST', 'Step 2-4: Click itemIconSize interface button with width:-1vp, height:-1vp');
      let negativeIconSizeButton = await driver.findComponent(ON.id('negativeIconSizeButton'));
      if (negativeIconSizeButton) {
        await negativeIconSizeButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察图标大小是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the icon size displays normally');
      Logger.info('TEST', 'Expected: 图标大小按照预设的大小正常显示，为默认值24vp');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0950 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0960
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0960', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0960 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 itemIconSize with 20vp');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20960');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击itemIconSize接口按钮，设置为宽:20vp, 高:20vp
      Logger.info('TEST', 'Step 2-4: Click itemIconSize interface button with width:20vp, height:20vp');
      let vpIconSizeButton = await driver.findComponent(ON.id('vpIconSizeButton'));
      if (vpIconSizeButton) {
        await vpIconSizeButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察图标大小是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the icon size displays normally');
      Logger.info('TEST', 'Expected: 图标大小按照预设的大小正常显示，为20vp');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0960 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0970
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0970', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0970 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 itemIconSize with 40fp and 40%');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20970');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击itemIconSize接口按钮，设置为宽:40fp, 高:40%
      Logger.info('TEST', 'Step 2-4: Click itemIconSize interface button with width:40fp, height:40%');
      let fpPercentIconSizeButton = await driver.findComponent(ON.id('fpPercentIconSizeButton'));
      if (fpPercentIconSizeButton) {
        await fpPercentIconSizeButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察图标大小是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the icon size displays normally');
      Logger.info('TEST', 'Expected: 图标大小按照预设的大小正常显示');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0970 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0980
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0980', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0980 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 itemIconSize with 40px and 40lpx');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20980');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击itemIconSize接口按钮，设置为宽:40px, 高:40lpx
      Logger.info('TEST', 'Step 2-4: Click itemIconSize interface button with width:40px, height:40lpx');
      let pxLpxIconSizeButton = await driver.findComponent(ON.id('pxLpxIconSizeButton'));
      if (pxLpxIconSizeButton) {
        await pxLpxIconSizeButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察图标大小是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the icon size displays normally');
      Logger.info('TEST', 'Expected: 图标大小按照预设的大小正常显示');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0980 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0990
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0990', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0990 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 itemIconSize with 50vp and resource');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV20990');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击itemIconSize接口按钮，设置为宽:50vp, 高:$r("app.string.string1")
      Logger.info('TEST', 'Step 2-4: Click itemIconSize interface button with width:50vp, height:resource');
      let vpResourceIconSizeButton = await driver.findComponent(ON.id('vpResourceIconSizeButton'));
      if (vpResourceIconSizeButton) {
        await vpResourceIconSizeButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察图标大小是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the icon size displays normally');
      Logger.info('TEST', 'Expected: 图标大小按照预设的大小正常显示');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_0990 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1000
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1000', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1000 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 itemMaxFontScale with abnormal number');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV21000');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击itemMaxFontScale接口按钮，设置为异常范围的值
      Logger.info('TEST', 'Step 2-4: Click itemMaxFontScale interface button with abnormal values');
      let negativeMaxFontScaleButton = await driver.findComponent(ON.id('negativeMaxFontScaleButton'));
      if (negativeMaxFontScaleButton) {
        await negativeMaxFontScaleButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      let zeroMaxFontScaleButton = await driver.findComponent(ON.id('zeroMaxFontScaleButton'));
      if (zeroMaxFontScaleButton) {
        await zeroMaxFontScaleButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察是否正常显示（异常值不生效）
      Logger.info('TEST', 'Step 5: Observe if the abnormal values do not take effect');
      Logger.info('TEST', 'Expected: 设置异常范围的值不生效');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1000 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1010
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1010 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 itemMaxFontScale with resource type');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV21010');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击itemMaxFontScale接口按钮，设置为resource类型
      Logger.info('TEST', 'Step 2-4: Click itemMaxFontScale interface button with resource type (1.9)');
      let resourceMaxFontScaleButton = await driver.findComponent(ON.id('resourceMaxFontScaleButton'));
      if (resourceMaxFontScaleButton) {
        await resourceMaxFontScaleButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察是否正常显示（和设置number为1.9一致）
      Logger.info('TEST', 'Step 5: Observe if the font scale displays normally');
      Logger.info('TEST', 'Expected: 和之前设置number为1.9一致');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1010 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1020
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1020 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 itemMaxFontScale with normal range number');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV21020');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击itemMaxFontScale接口按钮，设置正常范围的值(1-2)
      Logger.info('TEST', 'Step 2-4: Click itemMaxFontScale interface buttons with normal range values (1-2)');
      let scale1_0Button = await driver.findComponent(ON.id('scale1_0Button'));
      if (scale1_0Button) {
        await scale1_0Button.click();
        await driver.waitForIdle(1000, 2000);
      }

      let scale1_5Button = await driver.findComponent(ON.id('scale1_5Button'));
      if (scale1_5Button) {
        await scale1_5Button.click();
        await driver.waitForIdle(1000, 2000);
      }

      let scale2_0Button = await driver.findComponent(ON.id('scale2_0Button'));
      if (scale2_0Button) {
        await scale2_0Button.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the font scale displays normally');
      Logger.info('TEST', 'Expected: 在1-2之间调节可以观察到字体的明显放大');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1020 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1030
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1030 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 itemMinFontScale with abnormal number');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV21030');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击itemMinFontScale接口按钮，设置为异常范围的值
      Logger.info('TEST', 'Step 2-4: Click itemMinFontScale interface button with abnormal values');
      let negativeMinFontScaleButton = await driver.findComponent(ON.id('negativeMinFontScaleButton'));
      if (negativeMinFontScaleButton) {
        await negativeMinFontScaleButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      let zeroMinFontScaleButton = await driver.findComponent(ON.id('zeroMinFontScaleButton'));
      if (zeroMinFontScaleButton) {
        await zeroMinFontScaleButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察是否正常显示（异常值不生效）
      Logger.info('TEST', 'Step 5: Observe if the abnormal values do not take effect');
      Logger.info('TEST', 'Expected: 设置异常范围的值不生效');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1030 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1040
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1040 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 itemMinFontScale with resource type');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV21040');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击itemMinFontScale接口按钮，设置为resource类型
      Logger.info('TEST', 'Step 2-4: Click itemMinFontScale interface button with resource type (0.5)');
      let resourceMinFontScaleButton = await driver.findComponent(ON.id('resourceMinFontScaleButton'));
      if (resourceMinFontScaleButton) {
        await resourceMinFontScaleButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察是否正常显示（和设置number为0.5一致）
      Logger.info('TEST', 'Step 5: Observe if the font scale displays normally');
      Logger.info('TEST', 'Expected: 和之前设置number为0.5一致');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1040 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1050
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1050 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 itemMinFontScale with normal range number');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV21050');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击itemMinFontScale接口按钮，设置正常范围的值(0.8-1)
      Logger.info('TEST', 'Step 2-4: Click itemMinFontScale interface buttons with normal range values (0.8-1)');
      let scale0_8Button = await driver.findComponent(ON.id('scale0_8Button'));
      if (scale0_8Button) {
        await scale0_8Button.click();
        await driver.waitForIdle(1000, 2000);
      }

      let scale0_9Button = await driver.findComponent(ON.id('scale0_9Button'));
      if (scale0_9Button) {
        await scale0_9Button.click();
        await driver.waitForIdle(1000, 2000);
      }

      let scale1_0Button = await driver.findComponent(ON.id('scale1_0Button'));
      if (scale1_0Button) {
        await scale1_0Button.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the font scale displays normally');
      Logger.info('TEST', 'Expected: 在0.8-1之间调节可以观察到字体的明显缩小');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1050 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1060
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1060 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 buttonMinHeight with resource type');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV21060');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击buttonMinHeight接口按钮，设置为resource类型($r("app.string.buttonMinHeight_50vp"))
      Logger.info('TEST', 'Step 2-4: Click buttonMinHeight interface button with resource type (50vp)');
      let resourceMinHeightButton = await driver.findComponent(ON.id('resourceMinHeightButton'));
      if (resourceMinHeightButton) {
        await resourceMinHeightButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察分段按钮按钮最小高度是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the button min height displays normally');
      Logger.info('TEST', 'Expected: 分段按钮自适应最小高度，当前分段按钮的高度就是设置的最小高度50vp');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1060 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1070
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1070 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 buttonMinHeight with -1vp');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV21070');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击buttonMinHeight接口按钮，设置为-1vp
      Logger.info('TEST', 'Step 2-4: Click buttonMinHeight interface button with -1vp');
      let negativeMinHeightButton = await driver.findComponent(ON.id('negativeMinHeightButton'));
      if (negativeMinHeightButton) {
        await negativeMinHeightButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察分段按钮按钮最小高度是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the button min height displays normally');
      Logger.info('TEST', 'Expected: 分段按钮自适应最小高度，当前分段按钮的高度就是默认值40vp');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1070 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1080
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1080 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 buttonMinHeight with 40%');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV21080');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击buttonMinHeight接口按钮，设置为40%
      Logger.info('TEST', 'Step 2-4: Click buttonMinHeight interface button with 40%');
      let percentMinHeightButton = await driver.findComponent(ON.id('percentMinHeightButton'));
      if (percentMinHeightButton) {
        await percentMinHeightButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察分段按钮按钮最小高度是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the button min height displays normally');
      Logger.info('TEST', 'Expected: 分段按钮自适应最小高度，当前分段按钮的高度就是设置的最小高度40%');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1080 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1090
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1090 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 buttonMinHeight with 40fp');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV21090');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击buttonMinHeight接口按钮，设置为40fp
      Logger.info('TEST', 'Step 2-4: Click buttonMinHeight interface button with 40fp');
      let fpMinHeightButton = await driver.findComponent(ON.id('fpMinHeightButton'));
      if (fpMinHeightButton) {
        await fpMinHeightButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察分段按钮按钮最小高度是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the button min height displays normally');
      Logger.info('TEST', 'Expected: 分段按钮自适应最小高度，当前分段按钮的高度就是设置的最小高度40fp');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1090 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1100
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1100 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 buttonMinHeight with 40lpx');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV21100');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击buttonMinHeight接口按钮，设置为40lpx
      Logger.info('TEST', 'Step 2-4: Click buttonMinHeight interface button with 40lpx');
      let lpxMinHeightButton = await driver.findComponent(ON.id('lpxMinHeightButton'));
      if (lpxMinHeightButton) {
        await lpxMinHeightButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察分段按钮按钮最小高度是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the button min height displays normally');
      Logger.info('TEST', 'Expected: buttonMinHeight小于button的默认高度40vp');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1100 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1110
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1110 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 buttonMinHeight with 40px');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV21110');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击buttonMinHeight接口按钮，设置为40px
      Logger.info('TEST', 'Step 2-4: Click buttonMinHeight interface button with 40px');
      let pxMinHeightButton = await driver.findComponent(ON.id('pxMinHeightButton'));
      if (pxMinHeightButton) {
        await pxMinHeightButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察分段按钮按钮最小高度是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the button min height displays normally');
      Logger.info('TEST', 'Expected: 设置太小时，会按文字大小+上下padding显示，小于20vp时item固定为20vp高度');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1110 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1120
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1120 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 buttonMinHeight with 40vp');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV21120');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击buttonMinHeight接口按钮，设置为40vp
      Logger.info('TEST', 'Step 2-4: Click buttonMinHeight interface button with 40vp');
      let vpMinHeightButton = await driver.findComponent(ON.id('vpMinHeightButton'));
      if (vpMinHeightButton) {
        await vpMinHeightButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察分段按钮按钮最小高度是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the button min height displays normally');
      Logger.info('TEST', 'Expected: 分段按钮自适应最小高度，当前分段按钮的高度就是设置的最小高度40vp');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1120 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1130
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1130 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 buttonMinHeight with undefined');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV21130');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击buttonMinHeight接口按钮，设置为undefined
      Logger.info('TEST', 'Step 2-4: Click buttonMinHeight interface button with undefined');
      let undefinedMinHeightButton = await driver.findComponent(ON.id('undefinedMinHeightButton'));
      if (undefinedMinHeightButton) {
        await undefinedMinHeightButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察分段按钮按钮最小高度是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the button min height displays normally');
      Logger.info('TEST', 'Expected: 分段按钮高度为默认值');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1130 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1140
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1140 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 itemPadding with mixed units');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV21140');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击itemPadding接口按钮，设置为混合单位
      Logger.info('TEST', 'Step 2-4: Click itemPadding interface button with mixed units (40px, 40fp, 40lpx, resource)');
      let mixedPaddingButton = await driver.findComponent(ON.id('mixedPaddingButton'));
      if (mixedPaddingButton) {
        await mixedPaddingButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察分段按钮item内边距和布局是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the item padding displays normally');
      Logger.info('TEST', 'Expected: 分段按钮item的内边距依照设置的内边距显示');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1140 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1150
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1150 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 itemPadding with negative values');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV21150');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击itemPadding接口按钮，设置为包含负值
      Logger.info('TEST', 'Step 2-4: Click itemPadding interface button with negative values (40, 40, -1, -1)');
      let negativePaddingButton = await driver.findComponent(ON.id('negativePaddingButton'));
      if (negativePaddingButton) {
        await negativePaddingButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察分段按钮item内边距和布局是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the item padding displays normally');
      Logger.info('TEST', 'Expected: 分段按钮item的内边距依照设置显示，负值取默认值');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1150 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1160
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1160 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 itemPadding with 1% for all sides');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV21160');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击itemPadding接口按钮，设置为均为1%
      Logger.info('TEST', 'Step 2-4: Click itemPadding interface button with 1% for all sides');
      let percentPaddingButton = await driver.findComponent(ON.id('percentPaddingButton'));
      if (percentPaddingButton) {
        await percentPaddingButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察分段按钮item内边距和布局是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the item padding displays normally');
      Logger.info('TEST', 'Expected: 分段按钮item的内边距依照设置的内边距显示');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1160 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1170
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1170 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 itemSelectedBackgroundColor with rgba yellow');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV21170');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击itemSelectedBackgroundColor接口按钮，设置为rgba黄色
      Logger.info('TEST', 'Step 2-4: Click itemSelectedBackgroundColor interface button with rgba yellow');
      let rgbaColorButton = await driver.findComponent(ON.id('rgbaColorButton'));
      if (rgbaColorButton) {
        await rgbaColorButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察已选择的分段按钮的背景颜色是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the selected item background color displays normally');
      Logger.info('TEST', 'Expected: 已选择的分段按钮的背景颜色按照预设颜色正常显示，为黄色');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1170 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1180
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1180 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 itemSelectedBackgroundColor with custom colors');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV21180');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：依次点击所有自定义颜色按钮
      Logger.info('TEST', 'Step 2-4: Click all custom color buttons');
      let redColorButton = await driver.findComponent(ON.id('redColorButton'));
      if (redColorButton) {
        await redColorButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      let greenColorButton = await driver.findComponent(ON.id('greenColorButton'));
      if (greenColorButton) {
        await greenColorButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      let blueColorButton = await driver.findComponent(ON.id('blueColorButton'));
      if (blueColorButton) {
        await blueColorButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      let yellowColorButton = await driver.findComponent(ON.id('yellowColorButton'));
      if (yellowColorButton) {
        await yellowColorButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      let cyanColorButton = await driver.findComponent(ON.id('cyanColorButton'));
      if (cyanColorButton) {
        await cyanColorButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      let magentaColorButton = await driver.findComponent(ON.id('magentaColorButton'));
      if (magentaColorButton) {
        await magentaColorButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      let whiteColorButton = await driver.findComponent(ON.id('whiteColorButton'));
      if (whiteColorButton) {
        await whiteColorButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      let semiTransparentRedButton = await driver.findComponent(ON.id('semiTransparentRedButton'));
      if (semiTransparentRedButton) {
        await semiTransparentRedButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察已选择的分段按钮的背景颜色是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the selected item background color displays normally');
      Logger.info('TEST', 'Expected: 已选择的分段按钮的背景颜色按照预设颜色正常显示');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1180 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1190
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1190 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 itemSelectedBackgroundColor with preset colors');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV21190');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：依次点击预设颜色按钮
      Logger.info('TEST', 'Step 2-4: Click preset color buttons (blue, gray, white)');
      let presetBlueButton = await driver.findComponent(ON.id('presetBlueButton'));
      if (presetBlueButton) {
        await presetBlueButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      let presetGrayButton = await driver.findComponent(ON.id('presetGrayButton'));
      if (presetGrayButton) {
        await presetGrayButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      let presetWhiteButton = await driver.findComponent(ON.id('presetWhiteButton'));
      if (presetWhiteButton) {
        await presetWhiteButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察已选择的分段按钮的背景颜色是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the selected item background color displays normally');
      Logger.info('TEST', 'Expected: 已选择的分段按钮的背景颜色按照预设颜色正常显示');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1190 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1200
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1200', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1200 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 itemSelectedFontColor with rgba yellow');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV21200');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击itemSelectedFontColor接口按钮，设置为rgba黄色
      Logger.info('TEST', 'Step 2-4: Click itemSelectedFontColor interface button with rgba yellow');
      let rgbaColorButton = await driver.findComponent(ON.id('rgbaColorButton'));
      if (rgbaColorButton) {
        await rgbaColorButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察已选择的分段按钮的字体颜色是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the selected item font color displays normally');
      Logger.info('TEST', 'Expected: 已选择的分段按钮的字体颜色按照预设颜色正常显示，为黄色');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1200 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1210
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1210', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1210 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 itemSelectedFontColor with custom colors');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV21210');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：依次点击所有自定义颜色按钮
      Logger.info('TEST', 'Step 2-4: Click all custom color buttons');
      let redColorButton = await driver.findComponent(ON.id('redColorButton'));
      if (redColorButton) {
        await redColorButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      let greenColorButton = await driver.findComponent(ON.id('greenColorButton'));
      if (greenColorButton) {
        await greenColorButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      let blueColorButton = await driver.findComponent(ON.id('blueColorButton'));
      if (blueColorButton) {
        await blueColorButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      let yellowColorButton = await driver.findComponent(ON.id('yellowColorButton'));
      if (yellowColorButton) {
        await yellowColorButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      let cyanColorButton = await driver.findComponent(ON.id('cyanColorButton'));
      if (cyanColorButton) {
        await cyanColorButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      let magentaColorButton = await driver.findComponent(ON.id('magentaColorButton'));
      if (magentaColorButton) {
        await magentaColorButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      let whiteColorButton = await driver.findComponent(ON.id('whiteColorButton'));
      if (whiteColorButton) {
        await whiteColorButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      let semiTransparentRedButton = await driver.findComponent(ON.id('semiTransparentRedButton'));
      if (semiTransparentRedButton) {
        await semiTransparentRedButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察已选择的分段按钮的字体颜色是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the selected item font color displays normally');
      Logger.info('TEST', 'Expected: 已选择的分段按钮的字体颜色按照预设颜色正常显示');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1210 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1220
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1220', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1220 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - CapsuleSegmentButtonV2 itemSelectedFontColor with preset colors');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV21220');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：依次点击预设颜色按钮
      Logger.info('TEST', 'Step 2-4: Click preset color buttons (blue, gray, white)');
      let presetBlueButton = await driver.findComponent(ON.id('presetBlueButton'));
      if (presetBlueButton) {
        await presetBlueButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      let presetGrayButton = await driver.findComponent(ON.id('presetGrayButton'));
      if (presetGrayButton) {
        await presetGrayButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      let presetWhiteButton = await driver.findComponent(ON.id('presetWhiteButton'));
      if (presetWhiteButton) {
        await presetWhiteButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察已选择的分段按钮的字体颜色是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the selected item font color displays normally');
      Logger.info('TEST', 'Expected: 已选择的分段按钮的字体颜色按照预设颜色正常显示');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_1220 end`);
      done();
    })
  })
}