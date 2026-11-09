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

export default function focusSegmentButtonV2TestPart3() {

  describe('focusSegmentButtonV2TestPart3', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2540
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2540', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2540 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 itemMinHeight 40%');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV22540');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set 40%');
      let percentMinHeightButton = await driver.findComponent(ON.id('percentMinHeightButton'));
      if (percentMinHeightButton) {
        await percentMinHeightButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察分段按钮按钮最小高度是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the min height displays normally');
      Logger.info('TEST', 'Expected: 此时分段按钮自适应最小高度，当前分段按钮的高度就是设置的最小高度40%');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2540 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2550
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2550', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2550 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 itemMinHeight 40fp');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV22550');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set 40fp');
      let fpMinHeightButton = await driver.findComponent(ON.id('fpMinHeightButton'));
      if (fpMinHeightButton) {
        await fpMinHeightButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察分段按钮按钮最小高度是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the min height displays normally');
      Logger.info('TEST', 'Expected: 此时分段按钮自适应最小高度，当前分段按钮的高度就是设置的最小高度40fp');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2550 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2560
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2560', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2560 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 itemMinHeight 40lpx');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV22560');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set 40lpx');
      let lpxMinHeightButton = await driver.findComponent(ON.id('lpxMinHeightButton'));
      if (lpxMinHeightButton) {
        await lpxMinHeightButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察分段按钮按钮最小高度是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the min height displays normally');
      Logger.info('TEST', 'Expected: 此时itemMinHeight小于button的默认高度40vp');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2560 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2570
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2570', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2570 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 itemMinHeight 40px');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV22570');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set 40px');
      let pxMinHeightButton = await driver.findComponent(ON.id('pxMinHeightButton'));
      if (pxMinHeightButton) {
        await pxMinHeightButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察分段按钮按钮最小高度是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the min height displays normally');
      Logger.info('TEST', 'Expected: itemMinHeight设置得太小了，不足以显示下文字，会按文字的大小+上下padding来显示。目前在设置小于20vp的时候，item会固定为20vp的高度');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2570 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2580
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2580', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2580 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 itemMinHeight 40vp');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV22580');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set 40vp');
      let vpMinHeightButton = await driver.findComponent(ON.id('vpMinHeightButton'));
      if (vpMinHeightButton) {
        await vpMinHeightButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察分段按钮按钮最小高度是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the min height displays normally');
      Logger.info('TEST', 'Expected: 此时分段按钮自适应最小高度，当前分段按钮的高度就是设置的最小高度40vp');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2580 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2590
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2590', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2590 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 itemMinHeight undefined');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV22590');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set undefined');
      let undefinedMinHeightButton = await driver.findComponent(ON.id('undefinedMinHeightButton'));
      if (undefinedMinHeightButton) {
        await undefinedMinHeightButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察分段按钮按钮最小高度是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the min height displays normally');
      Logger.info('TEST', 'Expected: 此时分段按钮高度为默认值');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2590 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2600
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2600', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2600 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 itemPadding mixed units');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV22600');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set itemPadding (40px, 40fp, 40lpx, resource)');
      let mixedPaddingButton = await driver.findComponent(ON.id('mixedPaddingButton'));
      if (mixedPaddingButton) {
        await mixedPaddingButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察分段按钮item内边距和布局是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the item padding displays normally');
      Logger.info('TEST', 'Expected: 此时分段按钮item的内边距依照设置的内边距显示');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2600 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2610
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2610', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2610 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 itemPadding with negative values');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV22610');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set itemPadding (40, 40, -1, -1)');
      let negativePaddingButton = await driver.findComponent(ON.id('negativePaddingButton'));
      if (negativePaddingButton) {
        await negativePaddingButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察分段按钮item内边距和布局是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the item padding displays normally');
      Logger.info('TEST', 'Expected: 此时分段按钮item的内边距依照设置的内边距显示，负值取默认值');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2610 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2620
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2620', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2620 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 itemPadding 1%');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV22620');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set itemPadding 1%');
      let percentPaddingButton = await driver.findComponent(ON.id('percentPaddingButton'));
      if (percentPaddingButton) {
        await percentPaddingButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察分段按钮item内边距和布局是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the item padding displays normally');
      Logger.info('TEST', 'Expected: 此时分段按钮item的内边距依照设置的内边距显示');

      // 截图验证
      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2620 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2630
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2630', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2630 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 itemSelectedBackgroundColor rgba');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV22630');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set rgba color (yellow)');
      let rgbaColorButton = await driver.findComponent(ON.id('rgbaColorButton'));
      if (rgbaColorButton) {
        await rgbaColorButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察已选择的分段按钮的背景颜色是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the selected background color displays normally');
      Logger.info('TEST', 'Expected: 已选择的分段按钮的背景颜色按照预设颜色正常显示，为黄色');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2630 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2640
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2640', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2640 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 itemSelectedBackgroundColor custom');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV22640');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：测试各种自定义颜色
      Logger.info('TEST', 'Step 2-4: Click buttons to test custom colors');
      
      // 测试红色
      let redColorButton = await driver.findComponent(ON.id('redColorButton'));
      if (redColorButton) {
        await redColorButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 测试绿色
      let greenColorButton = await driver.findComponent(ON.id('greenColorButton'));
      if (greenColorButton) {
        await greenColorButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 测试蓝色
      let blueColorButton = await driver.findComponent(ON.id('blueColorButton'));
      if (blueColorButton) {
        await blueColorButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 测试黄色（红+绿）
      let yellowColorButton = await driver.findComponent(ON.id('yellowColorButton'));
      if (yellowColorButton) {
        await yellowColorButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 测试青色（绿+蓝）
      let cyanColorButton = await driver.findComponent(ON.id('cyanColorButton'));
      if (cyanColorButton) {
        await cyanColorButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 测试品红色（红+蓝）
      let magentaColorButton = await driver.findComponent(ON.id('magentaColorButton'));
      if (magentaColorButton) {
        await magentaColorButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 测试白色（红+绿+蓝）
      let whiteColorButton = await driver.findComponent(ON.id('whiteColorButton'));
      if (whiteColorButton) {
        await whiteColorButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 测试半透明红色
      let semiTransparentRedButton = await driver.findComponent(ON.id('semiTransparentRedButton'));
      if (semiTransparentRedButton) {
        await semiTransparentRedButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察已选择的分段按钮的背景颜色是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the selected background color displays normally');
      Logger.info('TEST', 'Expected: 已选择的分段按钮的背景颜色按照预设颜色正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2640 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2650
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2650', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2650 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 itemSelectedBackgroundColor preset');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV22650');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：测试预设颜色
      Logger.info('TEST', 'Step 2-4: Click buttons to test preset colors');
      
      // 测试预设蓝色
      let presetBlueButton = await driver.findComponent(ON.id('presetBlueButton'));
      if (presetBlueButton) {
        await presetBlueButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 测试预设灰色
      let presetGrayButton = await driver.findComponent(ON.id('presetGrayButton'));
      if (presetGrayButton) {
        await presetGrayButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 测试预设白色
      let presetWhiteButton = await driver.findComponent(ON.id('presetWhiteButton'));
      if (presetWhiteButton) {
        await presetWhiteButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察已选择的分段按钮的背景颜色是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the selected background color displays normally');
      Logger.info('TEST', 'Expected: 已选择的分段按钮的背景颜色按照预设颜色正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2650 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2660
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2660', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2660 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 itemSelectedFontColor rgba');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV22660');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set rgba color (yellow)');
      let rgbaColorButton = await driver.findComponent(ON.id('rgbaColorButton'));
      if (rgbaColorButton) {
        await rgbaColorButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察已选择的分段按钮的字体颜色是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the selected font color displays normally');
      Logger.info('TEST', 'Expected: 已选择的分段按钮的字体颜色按照预设颜色正常显示，为黄色');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2660 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2670
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2670', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2670 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 itemSelectedFontColor custom');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV22670');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：测试各种自定义颜色
      Logger.info('TEST', 'Step 2-4: Click buttons to test custom colors');
      
      // 测试红色
      let redColorButton = await driver.findComponent(ON.id('redColorButton'));
      if (redColorButton) {
        await redColorButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 测试绿色
      let greenColorButton = await driver.findComponent(ON.id('greenColorButton'));
      if (greenColorButton) {
        await greenColorButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 测试蓝色
      let blueColorButton = await driver.findComponent(ON.id('blueColorButton'));
      if (blueColorButton) {
        await blueColorButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 测试黄色（红+绿）
      let yellowColorButton = await driver.findComponent(ON.id('yellowColorButton'));
      if (yellowColorButton) {
        await yellowColorButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 测试青色（绿+蓝）
      let cyanColorButton = await driver.findComponent(ON.id('cyanColorButton'));
      if (cyanColorButton) {
        await cyanColorButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 测试品红色（红+蓝）
      let magentaColorButton = await driver.findComponent(ON.id('magentaColorButton'));
      if (magentaColorButton) {
        await magentaColorButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 测试白色（红+绿+蓝）
      let whiteColorButton = await driver.findComponent(ON.id('whiteColorButton'));
      if (whiteColorButton) {
        await whiteColorButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 测试半透明红色
      let semiTransparentRedButton = await driver.findComponent(ON.id('semiTransparentRedButton'));
      if (semiTransparentRedButton) {
        await semiTransparentRedButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察已选择的分段按钮的字体颜色是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the selected font color displays normally');
      Logger.info('TEST', 'Expected: 已选择的分段按钮的字体颜色按照预设颜色正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2670 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2680
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2680', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2680 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 itemSelectedFontColor preset');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV22680');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：测试预设颜色
      Logger.info('TEST', 'Step 2-4: Click buttons to test preset colors');
      
      // 测试预设蓝色
      let presetBlueButton = await driver.findComponent(ON.id('presetBlueButton'));
      if (presetBlueButton) {
        await presetBlueButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 测试预设灰色
      let presetGrayButton = await driver.findComponent(ON.id('presetGrayButton'));
      if (presetGrayButton) {
        await presetGrayButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 测试预设白色
      let presetWhiteButton = await driver.findComponent(ON.id('presetWhiteButton'));
      if (presetWhiteButton) {
        await presetWhiteButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察已选择的分段按钮的字体颜色是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the selected font color displays normally');
      Logger.info('TEST', 'Expected: 已选择的分段按钮的字体颜色按照预设颜色正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2680 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2690
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2690', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2690 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 itemSelectedFontSize -1');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV22690');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set itemSelectedFontSize to -1');
      let negativeFontSizeButton = await driver.findComponent(ON.id('negativeFontSizeButton'));
      if (negativeFontSizeButton) {
        await negativeFontSizeButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察已选择的item的字体大小是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the selected font size displays normally');
      Logger.info('TEST', 'Expected: 已选择的item的字体大小按照预设的大小正常显示，为默认值14fp');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2690 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2700
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2700', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2700 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 itemSelectedFontSize 20vp');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV22700');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set itemSelectedFontSize to 20vp');
      let vpFontSizeButton = await driver.findComponent(ON.id('vpFontSizeButton'));
      if (vpFontSizeButton) {
        await vpFontSizeButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察已选择的item的字体大小是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the selected font size displays normally');
      Logger.info('TEST', 'Expected: 已选择的item的字体大小按照预设的大小正常显示，为20vp');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2700 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2710
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2710', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2710 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 itemSelectedFontSize 40%');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV22710');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set itemSelectedFontSize to 40%');
      let percentFontSizeButton = await driver.findComponent(ON.id('percentFontSizeButton'));
      if (percentFontSizeButton) {
        await percentFontSizeButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察已选择的item的字体大小是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the selected font size displays normally');
      Logger.info('TEST', 'Expected: 已选择的item的字体大小按照预设的大小正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2710 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2720
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2720', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2720 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 itemSelectedFontSize 40fp');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV22720');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set itemSelectedFontSize to 40fp');
      let fpFontSizeButton = await driver.findComponent(ON.id('fpFontSizeButton'));
      if (fpFontSizeButton) {
        await fpFontSizeButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察已选择的item的字体大小是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the selected font size displays normally');
      Logger.info('TEST', 'Expected: 已选择的item的字体大小按照预设的大小正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2720 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2730
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2730', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2730 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 itemSelectedFontSize 40lpx');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV22730');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set itemSelectedFontSize to 40lpx');
      let lpxFontSizeButton = await driver.findComponent(ON.id('lpxFontSizeButton'));
      if (lpxFontSizeButton) {
        await lpxFontSizeButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察已选择的item的字体大小是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the selected font size displays normally');
      Logger.info('TEST', 'Expected: 已选择的item的字体大小按照预设的大小正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2730 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2740
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2740', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2740 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 itemSelectedFontSize 40px');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV22740');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set itemSelectedFontSize to 40px');
      let pxFontSizeButton = await driver.findComponent(ON.id('pxFontSizeButton'));
      if (pxFontSizeButton) {
        await pxFontSizeButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察已选择的item的字体大小是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the selected font size displays normally');
      Logger.info('TEST', 'Expected: 已选择的item的字体大小按照预设的大小正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2740 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2750
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2750', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2750 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 itemSelectedFontSize resource');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV22750');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set itemSelectedFontSize to resource');
      let resourceFontSizeButton = await driver.findComponent(ON.id('resourceFontSizeButton'));
      if (resourceFontSizeButton) {
        await resourceFontSizeButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察已选择的item的字体大小是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the selected font size displays normally');
      Logger.info('TEST', 'Expected: 已选择的item的字体大小按照预设的大小正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2750 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2760
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2760', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2760 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 itemSelectedFontSize undefined');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV22760');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set itemSelectedFontSize to undefined');
      let undefinedFontSizeButton = await driver.findComponent(ON.id('undefinedFontSizeButton'));
      if (undefinedFontSizeButton) {
        await undefinedFontSizeButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察已选择的item的字体大小是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the selected font size displays normally');
      Logger.info('TEST', 'Expected: 已选择的item的字体大小按照预设的大小正常显示，为默认值14fp');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2760 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2770
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2770', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2770 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 itemSelectedFontWeight Bolder');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV22770');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set itemSelectedFontWeight to Bolder');
      let bolderFontWeightButton = await driver.findComponent(ON.id('bolderFontWeightButton'));
      if (bolderFontWeightButton) {
        await bolderFontWeightButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察已选中的分段按钮文字粗细是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the selected font weight displays normally');
      Logger.info('TEST', 'Expected: 已选中的分段按钮文字粗细按照预设的大小正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2770 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2780
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2780', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2780 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 itemSelectedFontWeight Bold');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV22780');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set itemSelectedFontWeight to Bold');
      let boldFontWeightButton = await driver.findComponent(ON.id('boldFontWeightButton'));
      if (boldFontWeightButton) {
        await boldFontWeightButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察已选中的分段按钮文字粗细是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the selected font weight displays normally');
      Logger.info('TEST', 'Expected: 已选中的分段按钮文字粗细按照预设的大小正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2780 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2790
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2790', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2790 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 itemSelectedFontWeight Lighter');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV22790');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set itemSelectedFontWeight to Lighter');
      let lighterFontWeightButton = await driver.findComponent(ON.id('lighterFontWeightButton'));
      if (lighterFontWeightButton) {
        await lighterFontWeightButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察已选中的分段按钮文字粗细是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the selected font weight displays normally');
      Logger.info('TEST', 'Expected: 已选中的分段按钮文字粗细按照预设的大小正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2790 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2800
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2800', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2800 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 itemSelectedFontWeight Medium');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV22800');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set itemSelectedFontWeight to Medium');
      let mediumFontWeightButton = await driver.findComponent(ON.id('mediumFontWeightButton'));
      if (mediumFontWeightButton) {
        await mediumFontWeightButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察已选中的分段按钮文字粗细是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the selected font weight displays normally');
      Logger.info('TEST', 'Expected: 已选中的分段按钮文字粗细按照预设的大小正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2800 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2810
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2810', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2810 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 itemSelectedFontWeight Normal');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV22810');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set itemSelectedFontWeight to Normal');
      let normalFontWeightButton = await driver.findComponent(ON.id('normalFontWeightButton'));
      if (normalFontWeightButton) {
        await normalFontWeightButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察已选中的分段按钮文字粗细是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the selected font weight displays normally');
      Logger.info('TEST', 'Expected: 已选中的分段按钮文字粗细按照预设的大小正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2810 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2820
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2820', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2820 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 itemSelectedFontWeight Regular');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV22820');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set itemSelectedFontWeight to Regular');
      let regularFontWeightButton = await driver.findComponent(ON.id('regularFontWeightButton'));
      if (regularFontWeightButton) {
        await regularFontWeightButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察已选中的分段按钮文字粗细是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the selected font weight displays normally');
      Logger.info('TEST', 'Expected: 已选中的分段按钮文字粗细按照预设的大小正常显示，Regular和Normal的字体大小是一致的');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2820 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2830
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2830', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2830 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 itemSelectedFontWeight undefined');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV22830');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set itemSelectedFontWeight to undefined');
      let undefinedFontWeightButton = await driver.findComponent(ON.id('undefinedFontWeightButton'));
      if (undefinedFontWeightButton) {
        await undefinedFontWeightButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察已选中的分段按钮文字粗细是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the selected font weight displays normally');
      Logger.info('TEST', 'Expected: 已选中的分段按钮文字粗细按照预设的大小正常显示，取得默认值medium');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2830 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2840
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2840', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2840 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 itemSelectedIconFillColor rgba');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV22840');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set itemSelectedIconFillColor to rgba yellow');
      let rgbaColorButton = await driver.findComponent(ON.id('rgbaColorButton'));
      if (rgbaColorButton) {
        await rgbaColorButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察已选择的分段按钮的图标是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the selected icon color displays normally');
      Logger.info('TEST', 'Expected: 已选择的分段按钮的图标按照预设颜色正常显示，为黄色');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2840 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2850
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2850', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2850 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 itemSelectedIconFillColor custom');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV22850');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：测试自定义颜色
      Logger.info('TEST', 'Step 2-4: Click buttons to test custom colors');
      
      // 测试红色
      let redColorButton = await driver.findComponent(ON.id('redColorButton'));
      if (redColorButton) {
        await redColorButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 测试绿色
      let greenColorButton = await driver.findComponent(ON.id('greenColorButton'));
      if (greenColorButton) {
        await greenColorButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 测试蓝色
      let blueColorButton = await driver.findComponent(ON.id('blueColorButton'));
      if (blueColorButton) {
        await blueColorButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 测试黄色
      let yellowColorButton = await driver.findComponent(ON.id('yellowColorButton'));
      if (yellowColorButton) {
        await yellowColorButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 测试青色
      let cyanColorButton = await driver.findComponent(ON.id('cyanColorButton'));
      if (cyanColorButton) {
        await cyanColorButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 测试品红色
      let magentaColorButton = await driver.findComponent(ON.id('magentaColorButton'));
      if (magentaColorButton) {
        await magentaColorButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 测试白色
      let whiteColorButton = await driver.findComponent(ON.id('whiteColorButton'));
      if (whiteColorButton) {
        await whiteColorButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 测试半透明红色
      let semiTransparentRedButton = await driver.findComponent(ON.id('semiTransparentRedButton'));
      if (semiTransparentRedButton) {
        await semiTransparentRedButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察已选择的分段按钮的图标是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the selected icon color displays normally');
      Logger.info('TEST', 'Expected: 已选择的分段按钮的图标按照预设颜色正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2850 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2860
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2860', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2860 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 itemSelectedIconFillColor preset');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV22860');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：测试预设颜色
      Logger.info('TEST', 'Step 2-4: Click buttons to test preset colors');
      
      // 测试预设蓝色
      let presetBlueButton = await driver.findComponent(ON.id('presetBlueButton'));
      if (presetBlueButton) {
        await presetBlueButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 测试预设灰色
      let presetGrayButton = await driver.findComponent(ON.id('presetGrayButton'));
      if (presetGrayButton) {
        await presetGrayButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 测试预设白色
      let presetWhiteButton = await driver.findComponent(ON.id('presetWhiteButton'));
      if (presetWhiteButton) {
        await presetWhiteButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察已选择的分段按钮的图标是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the selected icon color displays normally');
      Logger.info('TEST', 'Expected: 已选择的分段按钮的图标按照预设颜色正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2860 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2870
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2870', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2870 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 itemSelectedSymbolFontColor rgba');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV22870');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set itemSelectedSymbolFontColor to rgba yellow');
      let rgbaColorButton = await driver.findComponent(ON.id('rgbaColorButton'));
      if (rgbaColorButton) {
        await rgbaColorButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察已选择的分段按钮的HM Symbol类型图标是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the selected symbol color displays normally');
      Logger.info('TEST', 'Expected: 已选择的分段按钮的HM Symbol类型图标按照预设颜色正常显示，为黄色');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2870 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2880
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2880', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2880 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 itemSelectedSymbolFontColor custom');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV22880');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：测试自定义颜色
      Logger.info('TEST', 'Step 2-4: Click buttons to test custom colors');
      
      // 测试红色
      let redColorButton = await driver.findComponent(ON.id('redColorButton'));
      if (redColorButton) {
        await redColorButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 测试绿色
      let greenColorButton = await driver.findComponent(ON.id('greenColorButton'));
      if (greenColorButton) {
        await greenColorButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 测试蓝色
      let blueColorButton = await driver.findComponent(ON.id('blueColorButton'));
      if (blueColorButton) {
        await blueColorButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 测试黄色
      let yellowColorButton = await driver.findComponent(ON.id('yellowColorButton'));
      if (yellowColorButton) {
        await yellowColorButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 测试青色
      let cyanColorButton = await driver.findComponent(ON.id('cyanColorButton'));
      if (cyanColorButton) {
        await cyanColorButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 测试品红色
      let magentaColorButton = await driver.findComponent(ON.id('magentaColorButton'));
      if (magentaColorButton) {
        await magentaColorButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 测试白色
      let whiteColorButton = await driver.findComponent(ON.id('whiteColorButton'));
      if (whiteColorButton) {
        await whiteColorButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 测试半透明红色
      let semiTransparentRedButton = await driver.findComponent(ON.id('semiTransparentRedButton'));
      if (semiTransparentRedButton) {
        await semiTransparentRedButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察已选择的分段按钮的HM Symbol类型图标是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the selected symbol color displays normally');
      Logger.info('TEST', 'Expected: 已选择的分段按钮的HM Symbol类型图标按照预设颜色正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2880 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2890
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2890', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2890 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 itemSelectedSymbolFontColor preset');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV22890');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：测试预设颜色
      Logger.info('TEST', 'Step 2-4: Click buttons to test preset colors');
      
      // 测试预设蓝色
      let presetBlueButton = await driver.findComponent(ON.id('presetBlueButton'));
      if (presetBlueButton) {
        await presetBlueButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 测试预设灰色
      let presetGrayButton = await driver.findComponent(ON.id('presetGrayButton'));
      if (presetGrayButton) {
        await presetGrayButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 测试预设白色
      let presetWhiteButton = await driver.findComponent(ON.id('presetWhiteButton'));
      if (presetWhiteButton) {
        await presetWhiteButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察已选择的分段按钮的HM Symbol类型图标是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the selected symbol color displays normally');
      Logger.info('TEST', 'Expected: 已选择的分段按钮的HM Symbol类型图标按照预设颜色正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2890 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2900
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2900', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2900 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 itemSpace -1');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV22900');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set itemSpace to -1');
      let negativeSpaceButton = await driver.findComponent(ON.id('negativeSpaceButton'));
      if (negativeSpaceButton) {
        await negativeSpaceButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察item之间的间隙是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the item space displays normally');
      Logger.info('TEST', 'Expected: item之间的间隙按照预设的大小正常显示，为默认值0');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2900 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2910
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2910', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2910 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 itemSpace 20vp');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV22910');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set itemSpace to 20vp');
      let vpSpaceButton = await driver.findComponent(ON.id('vpSpaceButton'));
      if (vpSpaceButton) {
        await vpSpaceButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察item之间的间隙是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the item space displays normally');
      Logger.info('TEST', 'Expected: item之间的间隙按照预设的大小正常显示，为20vp');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2910 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2920
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2920', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2920 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 itemSpace 40%');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV22920');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set itemSpace to 40%');
      let percentSpaceButton = await driver.findComponent(ON.id('percentSpaceButton'));
      if (percentSpaceButton) {
        await percentSpaceButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察item之间的间隙是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the item space displays normally');
      Logger.info('TEST', 'Expected: item之间的间隙按照预设的大小正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2920 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2930
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2930', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2930 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 itemSpace 40fp');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV22930');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set itemSpace to 40fp');
      let fpSpaceButton = await driver.findComponent(ON.id('fpSpaceButton'));
      if (fpSpaceButton) {
        await fpSpaceButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察item之间的间隙是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the item space displays normally');
      Logger.info('TEST', 'Expected: item之间的间隙按照预设的大小正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2930 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2940
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2940', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2940 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 itemSpace 40lpx');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV22940');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set itemSpace to 40lpx');
      let lpxSpaceButton = await driver.findComponent(ON.id('lpxSpaceButton'));
      if (lpxSpaceButton) {
        await lpxSpaceButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察item之间的间隙是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the item space displays normally');
      Logger.info('TEST', 'Expected: item之间的间隙按照预设的大小正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2940 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2950
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2950', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2950 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 itemSpace 40px');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV22950');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set itemSpace to 40px');
      let pxSpaceButton = await driver.findComponent(ON.id('pxSpaceButton'));
      if (pxSpaceButton) {
        await pxSpaceButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察item之间的间隙是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the item space displays normally');
      Logger.info('TEST', 'Expected: item之间的间隙按照预设的大小正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2950 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2960
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2960', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2960 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 itemSpace resource');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV22960');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set itemSpace to resource');
      let resourceSpaceButton = await driver.findComponent(ON.id('resourceSpaceButton'));
      if (resourceSpaceButton) {
        await resourceSpaceButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察item之间的间隙是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the item space displays normally');
      Logger.info('TEST', 'Expected: item之间的间隙按照预设的大小正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2960 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2970
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2970', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2970 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 itemSpace undefined');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV22970');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set itemSpace to undefined');
      let undefinedSpaceButton = await driver.findComponent(ON.id('undefinedSpaceButton'));
      if (undefinedSpaceButton) {
        await undefinedSpaceButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察item之间的间隙是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the item space displays normally');
      Logger.info('TEST', 'Expected: item之间的间隙按照预设的大小正常显示，为默认值1');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2970 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2980
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2980', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2980 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 itemSymbolFontColor rgba');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV22980');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set itemSymbolFontColor to rgba yellow');
      let rgbaColorButton = await driver.findComponent(ON.id('rgbaColorButton'));
      if (rgbaColorButton) {
        await rgbaColorButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察未选择的分段按钮的HM Symbol类型图标是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the unselected symbol icon displays with yellow color');
      Logger.info('TEST', 'Expected: 未选择的分段按钮的HM Symbol类型图标按照预设颜色正常显示，为黄色');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2980 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2990
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2990', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2990 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 itemSymbolFontColor custom');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV22990');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击多个颜色按钮测试自定义颜色
      Logger.info('TEST', 'Step 2-4: Click buttons to test custom colors');

      let redColorButton = await driver.findComponent(ON.id('redColorButton'));
      if (redColorButton) {
        await redColorButton.click();
        await driver.waitForIdle(500, 1000);
      }

      let greenColorButton = await driver.findComponent(ON.id('greenColorButton'));
      if (greenColorButton) {
        await greenColorButton.click();
        await driver.waitForIdle(500, 1000);
      }

      let blueColorButton = await driver.findComponent(ON.id('blueColorButton'));
      if (blueColorButton) {
        await blueColorButton.click();
        await driver.waitForIdle(500, 1000);
      }

      let yellowColorButton = await driver.findComponent(ON.id('yellowColorButton'));
      if (yellowColorButton) {
        await yellowColorButton.click();
        await driver.waitForIdle(500, 1000);
      }

      let cyanColorButton = await driver.findComponent(ON.id('cyanColorButton'));
      if (cyanColorButton) {
        await cyanColorButton.click();
        await driver.waitForIdle(500, 1000);
      }

      let magentaColorButton = await driver.findComponent(ON.id('magentaColorButton'));
      if (magentaColorButton) {
        await magentaColorButton.click();
        await driver.waitForIdle(500, 1000);
      }

      let whiteColorButton = await driver.findComponent(ON.id('whiteColorButton'));
      if (whiteColorButton) {
        await whiteColorButton.click();
        await driver.waitForIdle(500, 1000);
      }

      let semiTransparentRedButton = await driver.findComponent(ON.id('semiTransparentRedButton'));
      if (semiTransparentRedButton) {
        await semiTransparentRedButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察未选择的分段按钮的HM Symbol类型图标是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the unselected symbol icon displays with custom colors');
      Logger.info('TEST', 'Expected: 未选择的分段按钮的HM Symbol类型图标按照预设颜色正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_2990 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3000
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3000', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3000 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 itemSymbolFontColor preset');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23000');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击预设颜色按钮
      Logger.info('TEST', 'Step 2-4: Click buttons to test preset colors');

      let presetBlueButton = await driver.findComponent(ON.id('presetBlueButton'));
      if (presetBlueButton) {
        await presetBlueButton.click();
        await driver.waitForIdle(500, 1000);
      }

      let presetGrayButton = await driver.findComponent(ON.id('presetGrayButton'));
      if (presetGrayButton) {
        await presetGrayButton.click();
        await driver.waitForIdle(500, 1000);
      }

      let presetWhiteButton = await driver.findComponent(ON.id('presetWhiteButton'));
      if (presetWhiteButton) {
        await presetWhiteButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察未选择的分段按钮的HM Symbol类型图标是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the unselected symbol icon displays with preset colors');
      Logger.info('TEST', 'Expected: 未选择的分段按钮的HM Symbol类型图标按照预设颜色正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3000 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3010
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3010 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 itemSymbolFontSize -1');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23010');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set itemSymbolFontSize to -1');
      let negativeSizeButton = await driver.findComponent(ON.id('negativeSizeButton'));
      if (negativeSizeButton) {
        await negativeSizeButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察HM Symbol类型图标的图标是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the HM Symbol icon displays normally');
      Logger.info('TEST', 'Expected: HM Symbol类型图标的图标按照预设的大小正常显示，为默认值20fp');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3010 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3020
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3020 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 itemSymbolFontSize 20vp');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23020');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set itemSymbolFontSize to 20vp');
      let vpSizeButton = await driver.findComponent(ON.id('vpSizeButton'));
      if (vpSizeButton) {
        await vpSizeButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察HM Symbol类型图标的图标是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the HM Symbol icon displays normally');
      Logger.info('TEST', 'Expected: HM Symbol类型图标的图标按照预设的大小正常显示，为20vp');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3020 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3030
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3030 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 itemSymbolFontSize 40%');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23030');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set itemSymbolFontSize to 40%');
      let percentSizeButton = await driver.findComponent(ON.id('percentSizeButton'));
      if (percentSizeButton) {
        await percentSizeButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察HM Symbol类型图标的图标是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the HM Symbol icon displays normally');
      Logger.info('TEST', 'Expected: HM Symbol类型图标的图标按照预设的大小正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3030 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3040
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3040 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 itemSymbolFontSize 40fp');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23040');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set itemSymbolFontSize to 40fp');
      let fpSizeButton = await driver.findComponent(ON.id('fpSizeButton'));
      if (fpSizeButton) {
        await fpSizeButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察HM Symbol类型图标的图标是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the HM Symbol icon displays normally');
      Logger.info('TEST', 'Expected: HM Symbol类型图标的图标按照预设的大小正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3040 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3050
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3050 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 itemSymbolFontSize 40lpx');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23050');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set itemSymbolFontSize to 40lpx');
      let lpxSizeButton = await driver.findComponent(ON.id('lpxSizeButton'));
      if (lpxSizeButton) {
        await lpxSizeButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察HM Symbol类型图标的图标是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the HM Symbol icon displays normally');
      Logger.info('TEST', 'Expected: HM Symbol类型图标的图标按照预设的大小正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3050 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3060
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3060 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 itemSymbolFontSize 40px');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23060');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set itemSymbolFontSize to 40px');
      let pxSizeButton = await driver.findComponent(ON.id('pxSizeButton'));
      if (pxSizeButton) {
        await pxSizeButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察HM Symbol类型图标的图标是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the HM Symbol icon displays normally');
      Logger.info('TEST', 'Expected: HM Symbol类型图标的图标按照预设的大小正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3060 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3070
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3070 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 itemSymbolFontSize resource');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23070');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set itemSymbolFontSize to resource');
      let resourceSizeButton = await driver.findComponent(ON.id('resourceSizeButton'));
      if (resourceSizeButton) {
        await resourceSizeButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察HM Symbol类型图标的图标是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the HM Symbol icon displays normally');
      Logger.info('TEST', 'Expected: HM Symbol类型图标的图标按照预设的大小正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3070 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3080
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3080 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 itemSymbolFontSize undefined');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23080');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set itemSymbolFontSize to undefined');
      let undefinedSizeButton = await driver.findComponent(ON.id('undefinedSizeButton'));
      if (undefinedSizeButton) {
        await undefinedSizeButton.click();
        await driver.waitForIdle(1000, 2000);
      }

      // 步骤5：观察HM Symbol类型图标的图标是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the HM Symbol icon displays normally');
      Logger.info('TEST', 'Expected: HM Symbol类型图标的图标按照预设的大小正常显示，为默认值20fp');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3080 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3090
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3090 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 onItemClicked');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23090');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击分段按钮的不同item
      Logger.info('TEST', 'Step 2-4: Click different items on segment button');

      // 点击按钮2
      let button2 = await driver.findComponent(ON.text('按钮2'));
      if (button2) {
        await button2.click();
        await driver.waitForIdle(500, 1000);
      }

      // 点击按钮3
      let button3 = await driver.findComponent(ON.text('按钮3'));
      if (button3) {
        await button3.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察弹出的toast是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the toast displays normally');
      Logger.info('TEST', 'Expected: 点击的第几个item，toast能正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3090 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3100
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3100 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 OnSelectedIndexChange');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23100');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-3：点击分段按钮的不同item观察回调
      Logger.info('TEST', 'Step 2-3: Click different items and observe callback');

      // 点击按钮2
      let button2 = await driver.findComponent(ON.text('按钮2'));
      if (button2) {
        await button2.click();
        await driver.waitForIdle(500, 1000);
      }

      // 点击按钮3
      let button3 = await driver.findComponent(ON.text('按钮3'));
      if (button3) {
        await button3.click();
        await driver.waitForIdle(500, 1000);
      }

      // 点击按钮4
      let button4 = await driver.findComponent(ON.text('按钮4'));
      if (button4) {
        await button4.click();
        await driver.waitForIdle(500, 1000);
      }

      // 点击按钮1
      let button1 = await driver.findComponent(ON.text('按钮1'));
      if (button1) {
        await button1.click();
        await driver.waitForIdle(500, 1000);
      }

      // 观察日志回调是否正常
      Logger.info('TEST', 'Expected: 来回点击不同item，回调符合预期');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3100 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3110
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3110 start`);

      // 步骤1：进入测试页面（代码中已设置SelectedIndex为[-1, 1]）
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 SelectedIndex [-1, 1]');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23110');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2：观察分段按钮已选中的item是否符合预期
      Logger.info('TEST', 'Step 2: Observe if the selected item matches expectation');
      Logger.info('TEST', 'Expected: 分段按钮已选中的item符合预期，第2块item被选中');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3110 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3120
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3120 start`);

      // 步骤1：进入测试页面（代码中已设置SelectedIndex为[100, 999]）
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 SelectedIndex [100, 999]');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23120');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2：观察分段按钮已选中的item是否符合预期
      Logger.info('TEST', 'Step 2: Observe if the selected item matches expectation');
      Logger.info('TEST', 'Expected: 分段按钮无item被选中（100和999超出索引范围）');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3120 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3130
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3130 start`);

      // 步骤1：进入测试页面（代码中已设置SelectedIndex为[1, 2]）
      Logger.info('TEST', 'Step 1: Open test page - MultiCapsuleSegmentButtonV2 SelectedIndex [1, 2]');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23130');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2：观察分段按钮已选中的item是否符合预期
      Logger.info('TEST', 'Step 2: Observe if the selected item matches expectation');
      Logger.info('TEST', 'Expected: 分段按钮已选中的item符合预期，第2、3块item被选中');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3130 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3140
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3140 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 BackgroundBlurStyleOptions DARK');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23140');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2：点击设置按钮
      Logger.info('TEST', 'Step 2: Click button to set ColorMode to DARK');
      let darkModeButton = await driver.findComponent(ON.id('darkModeButton'));
      if (darkModeButton) {
        await darkModeButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤3：观察分段按钮背景模糊是否正常显示
      Logger.info('TEST', 'Step 3: Observe if the background blur displays in dark mode');
      Logger.info('TEST', 'Expected: 分段按钮背景模糊是暗色模式');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3140 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3150
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3150 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 BackgroundBlurStyleOptions LIGHT');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23150');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2：点击设置按钮
      Logger.info('TEST', 'Step 2: Click button to set ColorMode to LIGHT');
      let lightModeButton = await driver.findComponent(ON.id('lightModeButton'));
      if (lightModeButton) {
        await lightModeButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤3：观察分段按钮背景模糊是否正常显示
      Logger.info('TEST', 'Step 3: Observe if the background blur displays in light mode');
      Logger.info('TEST', 'Expected: 分段按钮背景模糊是亮色模式');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3150 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3160
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3160 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 BackgroundBlurStyleOptions SYSTEM');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23160');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2：点击设置按钮
      Logger.info('TEST', 'Step 2: Click button to set ColorMode to SYSTEM');
      let systemModeButton = await driver.findComponent(ON.id('systemModeButton'));
      if (systemModeButton) {
        await systemModeButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤3：观察分段按钮背景模糊是否正常显示
      Logger.info('TEST', 'Step 3: Observe if the background blur follows system mode');
      Logger.info('TEST', 'Expected: 分段按钮背景模糊跟随系统');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3160 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3170
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3170 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 BackgroundBlurStyle COMPONENT_REGULAR');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23170');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set BlurStyle to COMPONENT_REGULAR');
      let componentRegularButton = await driver.findComponent(ON.id('componentRegularButton'));
      if (componentRegularButton) {
        await componentRegularButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察分段按钮背景模糊是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the background blur displays normally');
      Logger.info('TEST', 'Expected: 分段按钮背景按照预设模糊COMPONENT_REGULAR正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3170 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3180
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3180 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 BackgroundBlurStyle COMPONENT_THICK');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23180');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set BlurStyle to COMPONENT_THICK');
      let componentThickButton = await driver.findComponent(ON.id('componentThickButton'));
      if (componentThickButton) {
        await componentThickButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察分段按钮背景模糊是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the background blur displays normally');
      Logger.info('TEST', 'Expected: 分段按钮背景按照预设模糊COMPONENT_THICK正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3180 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3190
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3190 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 BackgroundBlurStyle COMPONENT_THIN');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23190');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set BlurStyle to COMPONENT_THIN');
      let componentThinButton = await driver.findComponent(ON.id('componentThinButton'));
      if (componentThinButton) {
        await componentThinButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察分段按钮背景模糊是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the background blur displays normally');
      Logger.info('TEST', 'Expected: 分段按钮背景按照预设模糊COMPONENT_THIN正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3190 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3200
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3200', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3200 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 BackgroundBlurStyle COMPONENT_ULTRA_THICK');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23200');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set BlurStyle to COMPONENT_ULTRA_THICK');
      let componentUltraThickButton = await driver.findComponent(ON.id('componentUltraThickButton'));
      if (componentUltraThickButton) {
        await componentUltraThickButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察分段按钮背景模糊是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the background blur displays normally');
      Logger.info('TEST', 'Expected: 分段按钮背景按照预设模糊COMPONENT_ULTRA_THICK正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3200 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3210
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3210', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3210 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 BackgroundBlurStyle BACKGROUND_REGULAR');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23210');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set BlurStyle to BACKGROUND_REGULAR');
      let backgroundRegularButton = await driver.findComponent(ON.id('backgroundRegularButton'));
      if (backgroundRegularButton) {
        await backgroundRegularButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察分段按钮背景模糊是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the background blur displays normally');
      Logger.info('TEST', 'Expected: 分段按钮背景按照预设模糊BACKGROUND_REGULAR正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3210 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3220
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3220', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3220 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 BackgroundBlurStyle BACKGROUND_THICK');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23220');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set BlurStyle to BACKGROUND_THICK');
      let backgroundThickButton = await driver.findComponent(ON.id('backgroundThickButton'));
      if (backgroundThickButton) {
        await backgroundThickButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察分段按钮背景模糊是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the background blur displays normally');
      Logger.info('TEST', 'Expected: 分段按钮背景按照预设模糊BACKGROUND_THICK正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3220 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3230
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3230', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3230 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 BackgroundBlurStyle BACKGROUND_THIN');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23230');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set BlurStyle to BACKGROUND_THIN');
      let backgroundThinButton = await driver.findComponent(ON.id('backgroundThinButton'));
      if (backgroundThinButton) {
        await backgroundThinButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察分段按钮背景模糊是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the background blur displays normally');
      Logger.info('TEST', 'Expected: 分段按钮背景按照预设模糊BACKGROUND_THIN正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3230 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3240
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3240', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3240 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 BackgroundBlurStyle BACKGROUND_ULTRA_THICK');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23240');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set BlurStyle to BACKGROUND_ULTRA_THICK');
      let backgroundUltraThickButton = await driver.findComponent(ON.id('backgroundUltraThickButton'));
      if (backgroundUltraThickButton) {
        await backgroundUltraThickButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察分段按钮背景模糊是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the background blur displays normally');
      Logger.info('TEST', 'Expected: 分段按钮背景按照预设模糊BACKGROUND_ULTRA_THICK正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3240 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3250
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3250', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3250 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 BackgroundBlurStyle COMPONENT_ULTRA_THIN');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23250');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set BlurStyle to COMPONENT_ULTRA_THIN');
      let componentUltraThinButton = await driver.findComponent(ON.id('componentUltraThinButton'));
      if (componentUltraThinButton) {
        await componentUltraThinButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察分段按钮背景模糊是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the background blur displays normally');
      Logger.info('TEST', 'Expected: 分段按钮背景按照预设模糊COMPONENT_ULTRA_THIN正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3250 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3260
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3260', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3260 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 BackgroundBlurStyle NONE');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23260');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set BlurStyle to NONE');
      let noneButton = await driver.findComponent(ON.id('noneButton'));
      if (noneButton) {
        await noneButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察分段按钮背景模糊是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the background blur displays normally');
      Logger.info('TEST', 'Expected: 分段按钮背景按照预设模糊NONE正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3260 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3270
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3270', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3270 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 BackgroundBlurStyle Regular');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23270');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set BlurStyle to Regular');
      let regularButton = await driver.findComponent(ON.id('regularButton'));
      if (regularButton) {
        await regularButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察分段按钮背景模糊是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the background blur displays normally');
      Logger.info('TEST', 'Expected: 分段按钮背景按照预设模糊Regular正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3270 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3280
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3280', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3280 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 BackgroundBlurStyle Thick');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23280');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set BlurStyle to Thick');
      let thickButton = await driver.findComponent(ON.id('thickButton'));
      if (thickButton) {
        await thickButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察分段按钮背景模糊是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the background blur displays normally');
      Logger.info('TEST', 'Expected: 分段按钮背景按照预设模糊Thick正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3280 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3290
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3290', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3290 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 BackgroundBlurStyle Thin');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23290');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set BlurStyle to Thin');
      let thinButton = await driver.findComponent(ON.id('thinButton'));
      if (thinButton) {
        await thinButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察分段按钮背景模糊是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the background blur displays normally');
      Logger.info('TEST', 'Expected: 分段按钮背景按照预设模糊Thin正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3290 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3300
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3300', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3300 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 buttonBackgroundColor rgba');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23300');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set buttonBackgroundColor to rgba yellow');
      let rgbaColorButton = await driver.findComponent(ON.id('rgbaColorButton'));
      if (rgbaColorButton) {
        await rgbaColorButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察分段按钮背景是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the background color displays normally');
      Logger.info('TEST', 'Expected: 分段按钮背景按照预设颜色正常显示，为黄色');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3300 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3310
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3310', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3310 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 buttonBackgroundColor custom colors');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23310');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击多个颜色按钮测试自定义颜色
      Logger.info('TEST', 'Step 2-4: Click buttons to test custom colors');

      // 点击红色按钮
      let redButton = await driver.findComponent(ON.id('redButton'));
      if (redButton) {
        await redButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 点击绿色按钮
      let greenButton = await driver.findComponent(ON.id('greenButton'));
      if (greenButton) {
        await greenButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 点击蓝色按钮
      let blueButton = await driver.findComponent(ON.id('blueButton'));
      if (blueButton) {
        await blueButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 点击黄色按钮
      let yellowButton = await driver.findComponent(ON.id('yellowButton'));
      if (yellowButton) {
        await yellowButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 点击青色按钮
      let cyanButton = await driver.findComponent(ON.id('cyanButton'));
      if (cyanButton) {
        await cyanButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 点击品红色按钮
      let magentaButton = await driver.findComponent(ON.id('magentaButton'));
      if (magentaButton) {
        await magentaButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 点击白色按钮
      let whiteButton = await driver.findComponent(ON.id('whiteButton'));
      if (whiteButton) {
        await whiteButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 点击半透明红色按钮
      let semiTransparentRedButton = await driver.findComponent(ON.id('semiTransparentRedButton'));
      if (semiTransparentRedButton) {
        await semiTransparentRedButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察分段按钮背景是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the background color displays normally');
      Logger.info('TEST', 'Expected: 分段按钮背景按照预设颜色正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3310 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3320
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3320', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3320 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 buttonBackgroundColor preset colors');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23320');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击预设颜色按钮
      Logger.info('TEST', 'Step 2-4: Click buttons to test preset colors');

      // 点击预设蓝色按钮
      let presetBlueButton = await driver.findComponent(ON.id('presetBlueButton'));
      if (presetBlueButton) {
        await presetBlueButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 点击预设灰色按钮
      let presetGrayButton = await driver.findComponent(ON.id('presetGrayButton'));
      if (presetGrayButton) {
        await presetGrayButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 点击预设白色按钮
      let presetWhiteButton = await driver.findComponent(ON.id('presetWhiteButton'));
      if (presetWhiteButton) {
        await presetWhiteButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察分段按钮背景是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the background color displays normally');
      Logger.info('TEST', 'Expected: 分段按钮背景按照预设颜色正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3320 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3330
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3330', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3330 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 buttonBackgroundEffect abnormal values');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23330');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set buttonBackgroundEffect with abnormal values');
      let abnormalButton = await driver.findComponent(ON.id('abnormalButton'));
      if (abnormalButton) {
        await abnormalButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察分段按钮背景效果是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the background effect displays normally');
      Logger.info('TEST', 'Expected: 分段按钮背景按照预设背景效果正常显示，全部为默认值的时候，颜色不会生效');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3330 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3340
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3340', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3340 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 buttonBackgroundEffect normal values');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23340');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set buttonBackgroundEffect with normal values');
      let normalButton = await driver.findComponent(ON.id('normalButton'));
      if (normalButton) {
        await normalButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察分段按钮背景效果是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the background effect displays normally');
      Logger.info('TEST', 'Expected: 分段按钮背景按照预设背景效果正常显示，能够正常显示预设的粉色效果');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3340 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3350
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3350', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3350 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 buttonBackgroundEffect with adaptiveColor and blurOptions');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23350');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set buttonBackgroundEffect with adaptiveColor and blurOptions');
      let advancedButton = await driver.findComponent(ON.id('advancedButton'));
      if (advancedButton) {
        await advancedButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察分段按钮背景效果是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the background effect displays normally');
      Logger.info('TEST', 'Expected: 分段按钮背景按照预设背景效果正常显示，背板颜色为粉色');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3350 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3360
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3360', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3360 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 buttonBackgroundEffect with DEFAULT adaptiveColor');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23360');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set buttonBackgroundEffect with DEFAULT adaptiveColor and grayscale[0,0]');
      let defaultAdaptiveButton = await driver.findComponent(ON.id('defaultAdaptiveButton'));
      if (defaultAdaptiveButton) {
        await defaultAdaptiveButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察分段按钮背景效果是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the background effect displays normally');
      Logger.info('TEST', 'Expected: 分段按钮背景按照预设背景效果正常显示，背板颜色为粉色');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3360 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3370
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3370', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3370 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 buttonBackgroundEffect with partial params');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23370');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set buttonBackgroundEffect with partial params');
      let partialParamsButton = await driver.findComponent(ON.id('partialParamsButton'));
      if (partialParamsButton) {
        await partialParamsButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察分段按钮背景效果是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the background effect displays normally');
      Logger.info('TEST', 'Expected: 分段按钮背景按照预设背景效果正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3370 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3380
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3380', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3380 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 buttonBackgroundEffect with partial abnormal values');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23380');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set buttonBackgroundEffect with partial abnormal values');
      let partialAbnormalButton = await driver.findComponent(ON.id('partialAbnormalButton'));
      if (partialAbnormalButton) {
        await partialAbnormalButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察分段按钮背景效果是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the background effect displays normally');
      Logger.info('TEST', 'Expected: 分段按钮背景按照预设背景效果正常显示，能够正常显示预设的粉色效果');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3380 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3390
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3390', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3390 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 buttonBorderRadius resource');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23390');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set buttonBorderRadius to resource');
      let resourceRadiusButton = await driver.findComponent(ON.id('resourceRadiusButton'));
      if (resourceRadiusButton) {
        await resourceRadiusButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察分段按钮按钮圆角是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the border radius displays normally');
      Logger.info('TEST', 'Expected: 分段按钮的圆角正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3390 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3400
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3400', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3400 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 buttonBorderRadius 10%');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23400');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set buttonBorderRadius to 10%');
      let percentRadiusButton = await driver.findComponent(ON.id('percentRadiusButton'));
      if (percentRadiusButton) {
        await percentRadiusButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察分段按钮按钮圆角是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the border radius displays normally');
      Logger.info('TEST', 'Expected: 分段按钮的圆角正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3400 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3410
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3410', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3410 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 buttonBorderRadius 10fp');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23410');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set buttonBorderRadius to 10fp');
      let fpRadiusButton = await driver.findComponent(ON.id('fpRadiusButton'));
      if (fpRadiusButton) {
        await fpRadiusButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察分段按钮按钮圆角是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the border radius displays normally');
      Logger.info('TEST', 'Expected: 分段按钮的圆角正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3410 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3420
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3420', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3420 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 buttonBorderRadius 10lpx');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23420');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set buttonBorderRadius to 10lpx');
      let lpxRadiusButton = await driver.findComponent(ON.id('lpxRadiusButton'));
      if (lpxRadiusButton) {
        await lpxRadiusButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察分段按钮按钮圆角是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the border radius displays normally');
      Logger.info('TEST', 'Expected: 分段按钮的圆角正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3420 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3430
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3430', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3430 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 buttonBorderRadius 10px');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23430');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set buttonBorderRadius to 10px');
      let pxRadiusButton = await driver.findComponent(ON.id('pxRadiusButton'));
      if (pxRadiusButton) {
        await pxRadiusButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察分段按钮背板的圆角是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the border radius displays normally');
      Logger.info('TEST', 'Expected: 分段按钮的圆角正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3430 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3440
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3440', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3440 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 buttonBorderRadius 10vp');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23440');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set buttonBorderRadius to 10vp');
      let vpRadiusButton = await driver.findComponent(ON.id('vpRadiusButton'));
      if (vpRadiusButton) {
        await vpRadiusButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察分段按钮按钮圆角是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the border radius displays normally');
      Logger.info('TEST', 'Expected: 分段按钮的圆角正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3440 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3450
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3450', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3450 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 buttonBorderRadius undefined');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23450');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set buttonBorderRadius to undefined');
      let undefinedRadiusButton = await driver.findComponent(ON.id('undefinedRadiusButton'));
      if (undefinedRadiusButton) {
        await undefinedRadiusButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察分段按钮按钮圆角是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the border radius displays normally');
      Logger.info('TEST', 'Expected: 分段按钮的圆角正常显示，使用默认圆角值');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3450 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3460
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3460', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3460 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 buttonMinHeight resource');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23460');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set buttonMinHeight to resource');
      let resourceHeightButton = await driver.findComponent(ON.id('resourceHeightButton'));
      if (resourceHeightButton) {
        await resourceHeightButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察分段按钮按钮最小高度是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the min height displays normally');
      Logger.info('TEST', 'Expected: 分段按钮自适应最小高度，当前分段按钮的高度就是设置的最小高度50vp');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3460 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3470
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3470', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3470 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 buttonMinHeight -1vp');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23470');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set buttonMinHeight to -1vp');
      let negativeHeightButton = await driver.findComponent(ON.id('negativeHeightButton'));
      if (negativeHeightButton) {
        await negativeHeightButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察分段按钮按钮最小高度是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the min height displays normally');
      Logger.info('TEST', 'Expected: 分段按钮自适应最小高度，当前分段按钮的高度就是默认值40vp');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3470 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3480
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3480', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3480 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 buttonMinHeight 10%');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23480');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set buttonMinHeight to 10%');
      let percentHeightButton = await driver.findComponent(ON.id('percentHeightButton'));
      if (percentHeightButton) {
        await percentHeightButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察分段按钮按钮最小高度是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the min height displays normally');
      Logger.info('TEST', 'Expected: 分段按钮自适应最小高度，当前分段按钮的高度就是设置的最小高度10%');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3480 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3490
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3490', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3490 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 buttonMinHeight 90fp');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23490');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set buttonMinHeight to 90fp');
      let fpHeightButton = await driver.findComponent(ON.id('fpHeightButton'));
      if (fpHeightButton) {
        await fpHeightButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察分段按钮按钮最小高度是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the min height displays normally');
      Logger.info('TEST', 'Expected: 分段按钮自适应最小高度，当前分段按钮的高度就是设置的最小高度90fp');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3490 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3500
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3500', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3500 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 buttonMinHeight 90lpx');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23500');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set buttonMinHeight to 90lpx');
      let lpxHeightButton = await driver.findComponent(ON.id('lpxHeightButton'));
      if (lpxHeightButton) {
        await lpxHeightButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察分段按钮按钮最小高度是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the min height displays normally');
      Logger.info('TEST', 'Expected: 分段按钮自适应最小高度，当前分段按钮的高度就是设置的最小高度');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3500 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3510
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3510', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3510 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 buttonMinHeight 90px');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23510');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set buttonMinHeight to 90px');
      let pxHeightButton = await driver.findComponent(ON.id('pxHeightButton'));
      if (pxHeightButton) {
        await pxHeightButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察分段按钮按钮最小高度是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the min height displays normally');
      Logger.info('TEST', 'Expected: 分段按钮自适应最小高度，当前分段按钮的高度就是默认值40vp');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3510 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3520
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3520', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3520 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 buttonMinHeight 90vp');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23520');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set buttonMinHeight to 90vp');
      let vpHeightButton = await driver.findComponent(ON.id('vpHeightButton'));
      if (vpHeightButton) {
        await vpHeightButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察分段按钮按钮最小高度是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the min height displays normally');
      Logger.info('TEST', 'Expected: 分段按钮自适应最小高度，当前分段按钮的高度就是设置的最小高度90vp');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3520 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3530
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3530', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3530 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 buttonMinHeight undefined');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23530');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set buttonMinHeight to undefined');
      let undefinedHeightButton = await driver.findComponent(ON.id('undefinedHeightButton'));
      if (undefinedHeightButton) {
        await undefinedHeightButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察分段按钮按钮最小高度是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the min height displays normally');
      Logger.info('TEST', 'Expected: 分段按钮自适应最小高度，当前分段按钮的高度就是默认值40vp');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3530 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3540
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3540', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3540 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 buttonPadding resource');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23540');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set buttonPadding to resource');
      let resourcePaddingButton = await driver.findComponent(ON.id('resourcePaddingButton'));
      if (resourcePaddingButton) {
        await resourcePaddingButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察分段按钮背板内边距和布局是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the padding displays normally');
      Logger.info('TEST', 'Expected: 分段按钮背板的内边距依照设置的内边距显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3540 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3550
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3550', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3550 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 buttonPadding 10%');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23550');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set buttonPadding to 10%');
      let percentPaddingButton = await driver.findComponent(ON.id('percentPaddingButton'));
      if (percentPaddingButton) {
        await percentPaddingButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察分段按钮背板内边距和布局是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the padding displays normally');
      Logger.info('TEST', 'Expected: 分段按钮背板的内边距依照设置的内边距显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3550 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3560
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3560', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3560 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 buttonPadding 50fp');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23560');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set buttonPadding to 50fp');
      let fpPaddingButton = await driver.findComponent(ON.id('fpPaddingButton'));
      if (fpPaddingButton) {
        await fpPaddingButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察分段按钮背板内边距和布局是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the padding displays normally');
      Logger.info('TEST', 'Expected: 分段按钮背板的内边距依照设置的内边距显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3560 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3570
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3570', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3570 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 buttonPadding 50lpx');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23570');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set buttonPadding to 50lpx');
      let lpxPaddingButton = await driver.findComponent(ON.id('lpxPaddingButton'));
      if (lpxPaddingButton) {
        await lpxPaddingButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察分段按钮背板内边距和布局是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the padding displays normally');
      Logger.info('TEST', 'Expected: 分段按钮背板的内边距依照设置的内边距显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3570 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3580
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3580', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3580 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 buttonPadding 50px');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23580');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set buttonPadding to 50px');
      let pxPaddingButton = await driver.findComponent(ON.id('pxPaddingButton'));
      if (pxPaddingButton) {
        await pxPaddingButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察分段按钮背板内边距和布局是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the padding displays normally');
      Logger.info('TEST', 'Expected: 分段按钮背板的内边距依照设置的内边距显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3580 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3590
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3590', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3590 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 buttonPadding 50vp');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23590');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set buttonPadding to 50vp');
      let vpPaddingButton = await driver.findComponent(ON.id('vpPaddingButton'));
      if (vpPaddingButton) {
        await vpPaddingButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察分段按钮背板内边距和布局是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the padding displays normally');
      Logger.info('TEST', 'Expected: 分段按钮背板的内边距依照设置的内边距显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3590 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3600
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3600', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3600 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 buttonPadding undefined');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23600');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set buttonPadding to undefined');
      let undefinedPaddingButton = await driver.findComponent(ON.id('undefinedPaddingButton'));
      if (undefinedPaddingButton) {
        await undefinedPaddingButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察分段按钮背板内边距和布局是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the padding displays normally');
      Logger.info('TEST', 'Expected: 分段按钮背板的内边距依照设置的内边距显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3600 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3610
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3610', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3610 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 itemBorderRadius resource');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23610');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set itemBorderRadius to resource');
      let resourceRadiusButton = await driver.findComponent(ON.id('resourceRadiusButton'));
      if (resourceRadiusButton) {
        await resourceRadiusButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察分段按钮按钮圆角是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the border radius displays normally');
      Logger.info('TEST', 'Expected: 分段按钮的圆角正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3610 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3620
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3620', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3620 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 itemBorderRadius 10%');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23620');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set itemBorderRadius to 10%');
      let percentRadiusButton = await driver.findComponent(ON.id('percentRadiusButton'));
      if (percentRadiusButton) {
        await percentRadiusButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察分段按钮按钮圆角是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the border radius displays normally');
      Logger.info('TEST', 'Expected: 分段按钮的圆角正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3620 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3630
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3630', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3630 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 itemBorderRadius 10fp');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23630');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set itemBorderRadius to 10fp');
      let fpRadiusButton = await driver.findComponent(ON.id('fpRadiusButton'));
      if (fpRadiusButton) {
        await fpRadiusButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察分段按钮按钮圆角是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the border radius displays normally');
      Logger.info('TEST', 'Expected: 分段按钮的圆角正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3630 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3640
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3640', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3640 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 itemBorderRadius 10lpx');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23640');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set itemBorderRadius to 10lpx');
      let lpxRadiusButton = await driver.findComponent(ON.id('lpxRadiusButton'));
      if (lpxRadiusButton) {
        await lpxRadiusButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察分段按钮按钮圆角是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the border radius displays normally');
      Logger.info('TEST', 'Expected: 分段按钮的圆角正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3640 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3650
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3650', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3650 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 itemBorderRadius 10px');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23650');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set itemBorderRadius to 10px');
      let pxRadiusButton = await driver.findComponent(ON.id('pxRadiusButton'));
      if (pxRadiusButton) {
        await pxRadiusButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察分段按钮item的圆角是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the border radius displays normally');
      Logger.info('TEST', 'Expected: 分段按钮的圆角正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3650 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3660
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3660', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3660 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 itemBorderRadius 10vp');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23660');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set itemBorderRadius to 10vp');
      let vpRadiusButton = await driver.findComponent(ON.id('vpRadiusButton'));
      if (vpRadiusButton) {
        await vpRadiusButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察分段按钮按钮圆角是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the border radius displays normally');
      Logger.info('TEST', 'Expected: 分段按钮的圆角正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3660 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3670
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3670', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3670 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 itemBorderRadius undefined');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23670');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set itemBorderRadius to undefined');
      let undefinedRadiusButton = await driver.findComponent(ON.id('undefinedRadiusButton'));
      if (undefinedRadiusButton) {
        await undefinedRadiusButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察分段按钮按钮圆角是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the border radius displays normally');
      Logger.info('TEST', 'Expected: 分段按钮的圆角正常显示，使用默认圆角值');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3670 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3680
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3680', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3680 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 itemFontColor rgba');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23680');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set itemFontColor to rgba yellow');
      let rgbaColorButton = await driver.findComponent(ON.id('rgbaColorButton'));
      if (rgbaColorButton) {
        await rgbaColorButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察非选中的分段按钮的字体颜色是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the font color displays normally');
      Logger.info('TEST', 'Expected: 非选中的分段按钮的字体颜色按照预设颜色正常显示，为黄色');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3680 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3690
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3690', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3690 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 itemFontColor custom colors');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23690');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击多个颜色按钮测试自定义颜色
      Logger.info('TEST', 'Step 2-4: Click buttons to test custom colors');

      // 点击红色按钮
      let redButton = await driver.findComponent(ON.id('redButton'));
      if (redButton) {
        await redButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 点击绿色按钮
      let greenButton = await driver.findComponent(ON.id('greenButton'));
      if (greenButton) {
        await greenButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 点击蓝色按钮
      let blueButton = await driver.findComponent(ON.id('blueButton'));
      if (blueButton) {
        await blueButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 点击黄色按钮
      let yellowButton = await driver.findComponent(ON.id('yellowButton'));
      if (yellowButton) {
        await yellowButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 点击青色按钮
      let cyanButton = await driver.findComponent(ON.id('cyanButton'));
      if (cyanButton) {
        await cyanButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 点击品红色按钮
      let magentaButton = await driver.findComponent(ON.id('magentaButton'));
      if (magentaButton) {
        await magentaButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 点击白色按钮
      let whiteButton = await driver.findComponent(ON.id('whiteButton'));
      if (whiteButton) {
        await whiteButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 点击半透明红色按钮
      let semiTransparentRedButton = await driver.findComponent(ON.id('semiTransparentRedButton'));
      if (semiTransparentRedButton) {
        await semiTransparentRedButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察非选中的分段按钮的字体颜色是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the font color displays normally');
      Logger.info('TEST', 'Expected: 非选中的分段按钮的字体颜色按照预设颜色正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3690 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3700
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3700', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3700 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 itemFontColor preset colors');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23700');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击预设颜色按钮
      Logger.info('TEST', 'Step 2-4: Click buttons to test preset colors');

      // 点击预设蓝色按钮
      let presetBlueButton = await driver.findComponent(ON.id('presetBlueButton'));
      if (presetBlueButton) {
        await presetBlueButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 点击预设灰色按钮
      let presetGrayButton = await driver.findComponent(ON.id('presetGrayButton'));
      if (presetGrayButton) {
        await presetGrayButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 点击预设白色按钮
      let presetWhiteButton = await driver.findComponent(ON.id('presetWhiteButton'));
      if (presetWhiteButton) {
        await presetWhiteButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察非选中的分段按钮的字体颜色是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the font color displays normally');
      Logger.info('TEST', 'Expected: 非选中的分段按钮的字体颜色按照预设颜色正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3700 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3710
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3710', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3710 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 itemFontSize -1');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23710');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set itemFontSize to -1');
      let negativeSizeButton = await driver.findComponent(ON.id('negativeSizeButton'));
      if (negativeSizeButton) {
        await negativeSizeButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察未选择的item的字体大小是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the font size displays normally');
      Logger.info('TEST', 'Expected: 未选择的item的字体大小按照预设的大小正常显示，为默认值14fp');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3710 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3720
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3720', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3720 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 itemFontSize 20vp');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23720');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set itemFontSize to 20vp');
      let vpSizeButton = await driver.findComponent(ON.id('vpSizeButton'));
      if (vpSizeButton) {
        await vpSizeButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察未选择的item的字体大小是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the font size displays normally');
      Logger.info('TEST', 'Expected: 未选择的item的字体大小按照预设的大小正常显示，为20vp');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3720 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3730
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3730', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3730 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 itemFontSize 40%');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23730');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set itemFontSize to 40%');
      let percentSizeButton = await driver.findComponent(ON.id('percentSizeButton'));
      if (percentSizeButton) {
        await percentSizeButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察未选择的item的字体大小是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the font size displays normally');
      Logger.info('TEST', 'Expected: 未选择的item的字体大小按照预设的大小正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3730 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3740
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3740', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3740 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 itemFontSize 40fp');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23740');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set itemFontSize to 40fp');
      let fpSizeButton = await driver.findComponent(ON.id('fpSizeButton'));
      if (fpSizeButton) {
        await fpSizeButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察未选择的item的字体大小是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the font size displays normally');
      Logger.info('TEST', 'Expected: 未选择的item的字体大小按照预设的大小正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3740 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3750
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3750', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3750 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 itemFontSize 40lpx');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23750');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set itemFontSize to 40lpx');
      let lpxSizeButton = await driver.findComponent(ON.id('lpxSizeButton'));
      if (lpxSizeButton) {
        await lpxSizeButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察未选择的item的字体大小是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the font size displays normally');
      Logger.info('TEST', 'Expected: 未选择的item的字体大小按照预设的大小正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3750 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3760
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3760', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3760 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 itemFontSize 40px');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23760');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set itemFontSize to 40px');
      let pxSizeButton = await driver.findComponent(ON.id('pxSizeButton'));
      if (pxSizeButton) {
        await pxSizeButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察未选择的item的字体大小是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the font size displays normally');
      Logger.info('TEST', 'Expected: 未选择的item的字体大小按照预设的大小正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3760 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3770
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3770', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3770 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 itemFontSize resource');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23770');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set itemFontSize to resource');
      let resourceSizeButton = await driver.findComponent(ON.id('resourceSizeButton'));
      if (resourceSizeButton) {
        await resourceSizeButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察未选择的item的字体大小是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the font size displays normally');
      Logger.info('TEST', 'Expected: 未选择的item的字体大小按照预设的大小正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3770 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3780
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3780', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3780 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 itemFontSize undefined');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23780');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮设置为undefined
      Logger.info('TEST', 'Step 2-4: Click button to set itemFontSize to undefined');
      let undefinedSizeButton = await driver.findComponent(ON.id('undefinedSizeButton'));
      if (undefinedSizeButton) {
        await undefinedSizeButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察未选择的item的字体大小是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the font size displays normally');
      Logger.info('TEST', 'Expected: 未选择的item的字体大小按照预设的大小正常显示，为默认值14fp');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3780 end`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3790
     * @tc.name   : Button segmentbuttonv2
     * @tc.desc   : Verify button segmentbuttonv2 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3790', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3790 start`);

      // 步骤1：进入测试页面
      Logger.info('TEST', 'Step 1: Open test page - TabSegmentButtonV2 itemFontWeight Bolder');
      Settings.createWindow('testability/pages/scenario/action_event/focus_SegmentButtonV2/SegmentButtonV23790');

      let driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 步骤2-4：点击设置按钮
      Logger.info('TEST', 'Step 2-4: Click button to set itemFontWeight to Bolder');
      let bolderButton = await driver.findComponent(ON.id('bolderButton'));
      if (bolderButton) {
        await bolderButton.click();
        await driver.waitForIdle(500, 1000);
      }

      // 步骤5：观察分段按钮文字粗细是否正常显示
      Logger.info('TEST', 'Step 5: Observe if the font weight displays normally');
      Logger.info('TEST', 'Expected: 分段按钮文字粗细按照预设的大小正常显示');

      await windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_BUTTON_SEGMENTBUTTONV2_3790 end`);
      done();
    })
  })
}