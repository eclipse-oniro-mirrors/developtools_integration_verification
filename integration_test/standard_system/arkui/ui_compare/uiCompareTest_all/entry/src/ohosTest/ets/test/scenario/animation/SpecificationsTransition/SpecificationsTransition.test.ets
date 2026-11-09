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

export default function specificationsTransition() {

  describe('specificationsTransition', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0010
     * @tc.name   : Popupbox specifications transition
     * @tc.desc   : Verify popupbox specifications transition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0010 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/animation/SpecificationsTransition/SpecificationsTransition0010')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击【Duration_10000_Index】
      let button_duration_10000_index = await driver.waitForComponent(ON.id('button_duration_10000_index'), 500)
      await button_duration_10000_index.click()
      await Utils.sleep(500)
      
      // 步骤3：点击【Duration_10000_Asymmetric】
      let button_duration_10000_asymmetric = await driver.waitForComponent(ON.id('button_duration_10000_asymmetric'), 500)
      await button_duration_10000_asymmetric.click()
      await Utils.sleep(500)
      
      // 步骤4：点击【AlertDialog: autoCancel_True】
      let button_alert_dialog = await driver.waitForComponent(ON.id('button_alert_dialog_auto_cancel_true'), 500)
      await button_alert_dialog.click()
      await Utils.sleep(500)
      
      // 步骤5：左/右滑/点击遮蔽层/button按钮
      await driver.click(100, 100)
      await Utils.sleep(500)
      
      // 预期结果5：弹窗消失，消失动画正常播放，持续时间10000ms
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0020
     * @tc.name   : Popupbox specifications transition
     * @tc.desc   : Verify popupbox specifications transition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0020 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/animation/SpecificationsTransition/SpecificationsTransition0020')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击【Duration_10000_Index】
      let button_duration_10000_index = await driver.waitForComponent(ON.id('button_duration_10000_index'), 500)
      await button_duration_10000_index.click()
      await Utils.sleep(500)
      
      // 步骤3：点击【Duration_10000_Combine】
      let button_duration_10000_combine = await driver.waitForComponent(ON.id('button_duration_10000_combine'), 500)
      await button_duration_10000_combine.click()
      await Utils.sleep(500)
      
      // 步骤4：点击【AlertDialog: autoCancel_True】
      let button_alert_dialog = await driver.waitForComponent(ON.id('button_alert_dialog_auto_cancel_true'), 500)
      await button_alert_dialog.click()
      await Utils.sleep(500)
      
      // 步骤5：左/右滑/点击遮蔽层/button按钮
      await driver.click(100, 100)
      await Utils.sleep(500)
      
      // 预期结果5：弹窗消失，消失动画正常播放，持续时间10000ms
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0030
     * @tc.name   : Popupbox specifications transition
     * @tc.desc   : Verify popupbox specifications transition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0030 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/animation/SpecificationsTransition/SpecificationsTransition0030')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击【Duration_10000_Index】
      let button_duration_10000_index = await driver.waitForComponent(ON.id('button_duration_10000_index'), 500)
      await button_duration_10000_index.click()
      await Utils.sleep(500)
      
      // 步骤3：点击【Duration_10000_Move】
      let button_duration_10000_move = await driver.waitForComponent(ON.id('button_duration_10000_move'), 500)
      await button_duration_10000_move.click()
      await Utils.sleep(500)
      
      // 步骤4：点击【AlertDialog: autoCancel_True】
      let button_alert_dialog = await driver.waitForComponent(ON.id('button_alert_dialog_auto_cancel_true'), 500)
      await button_alert_dialog.click()
      await Utils.sleep(500)
      
      // 步骤5：左/右滑/点击遮蔽层/button按钮
      await driver.click(100, 100)
      await Utils.sleep(500)
      
      // 预期结果5：弹窗消失，消失动画正常播放，持续时间10000ms
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0030 finish.`);
      done()
    })




    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0050
     * @tc.name   : Popupbox specifications transition
     * @tc.desc   : Verify popupbox specifications transition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0050 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/animation/SpecificationsTransition/SpecificationsTransition0050')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击【Duration_10000_Index】
      let button_duration_10000_index = await driver.waitForComponent(ON.id('button_duration_10000_index'), 500)
      await button_duration_10000_index.click()
      await Utils.sleep(500)
      
      // 步骤3：点击【Duration_10000_Rotate】
      let button_duration_10000_rotate = await driver.waitForComponent(ON.id('button_duration_10000_rotate'), 500)
      await button_duration_10000_rotate.click()
      await Utils.sleep(500)
      
      // 步骤4：点击【AlertDialog: autoCancel_True】
      let button_alert_dialog = await driver.waitForComponent(ON.id('button_alert_dialog_auto_cancel_true'), 500)
      await button_alert_dialog.click()
      await Utils.sleep(500)
      
      // 预期结果4：弹出AlertDialog，显示动画正常播放，持续时间10000ms
      await Utils.sleep(1000)
      
      // 步骤5：点击遮蔽层关闭弹窗
      await driver.click(100, 100)
      await Utils.sleep(500)
      
      // 预期结果5：弹窗消失，消失动画正常播放，持续时间10000ms
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0060
     * @tc.name   : Popupbox specifications transition
     * @tc.desc   : Verify popupbox specifications transition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0060 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/animation/SpecificationsTransition/SpecificationsTransition0060')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击【Duration_10000_Index】
      let button_duration_10000_index = await driver.waitForComponent(ON.id('button_duration_10000_index'), 500)
      await button_duration_10000_index.click()
      await Utils.sleep(500)
      
      // 步骤3：点击【Duration_10000_Scale】
      let button_duration_10000_scale = await driver.waitForComponent(ON.id('button_duration_10000_scale'), 500)
      await button_duration_10000_scale.click()
      await Utils.sleep(500)
      
      // 步骤4：点击【AlertDialog: autoCancel_True】
      let button_alert_dialog = await driver.waitForComponent(ON.id('button_alert_dialog_auto_cancel_true'), 500)
      await button_alert_dialog.click()
      await Utils.sleep(500)
      
      // 预期结果4：弹出AlertDialog，显示动画正常播放，持续时间10000ms
      await Utils.sleep(1000)
      
      // 步骤5：点击遮蔽层关闭弹窗
      await driver.click(100, 100)
      await Utils.sleep(500)
      
      // 预期结果5：弹窗消失，消失动画正常播放，持续时间10000ms
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0080
     * @tc.name   : Popupbox specifications transition
     * @tc.desc   : Verify popupbox specifications transition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0080 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/animation/SpecificationsTransition/SpecificationsTransition0080')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击【Duration_10000_Index】
      let button_duration_10000_index = await driver.waitForComponent(ON.id('button_duration_10000_index'), 500)
      await button_duration_10000_index.click()
      await Utils.sleep(500)
      
      // 步骤3：点击【Duration_10000_pat_IDENTITY】
      let button_duration_10000_pat_identity = await driver.waitForComponent(ON.id('button_duration_10000_pat_identity'), 500)
      await button_duration_10000_pat_identity.click()
      await Utils.sleep(500)
      
      // 步骤4：点击【AlertDialog: autoCancel_True】
      let button_alert_dialog = await driver.waitForComponent(ON.id('button_alert_dialog_auto_cancel_true'), 500)
      await button_alert_dialog.click()
      await Utils.sleep(500)
      
      // 预期结果4：弹出AlertDialog，显示动画正常播放，持续时间10000ms
      await Utils.sleep(1000)
      
      // 步骤5：点击遮蔽层关闭弹窗
      await driver.click(100, 100)
      await Utils.sleep(500)
      
      // 预期结果5：弹窗消失，消失动画正常播放，持续时间10000ms
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0090
     * @tc.name   : Popupbox specifications transition
     * @tc.desc   : Verify popupbox specifications transition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0090 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/animation/SpecificationsTransition/SpecificationsTransition0090')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击【Duration_10000_Index】
      let button_duration_10000_index = await driver.waitForComponent(ON.id('button_duration_10000_index'), 500)
      await button_duration_10000_index.click()
      await Utils.sleep(500)
      
      // 步骤3：点击【button_duration_10000_pat_opacity】
      let button_duration_10000_pat_opacity = await driver.waitForComponent(ON.id('button_duration_10000_pat_opacity'), 500)
      await button_duration_10000_pat_opacity.click()
      await Utils.sleep(500)
      
      // 步骤4：点击【AlertDialog: autoCancel_True】
      let button_alert_dialog = await driver.waitForComponent(ON.id('button_alert_dialog_auto_cancel_true'), 500)
      await button_alert_dialog.click()
      await Utils.sleep(500)
      
      // 预期结果4：弹出AlertDialog，显示动画正常播放，持续时间10000ms
      await Utils.sleep(1000)
      
      // 步骤5：点击遮蔽层关闭弹窗
      await driver.click(100, 100)
      await Utils.sleep(500)
      
      // 预期结果5：弹窗消失，消失动画正常播放，持续时间10000ms
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0100
     * @tc.name   : Popupbox specifications transition
     * @tc.desc   : Verify popupbox specifications transition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0100 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/animation/SpecificationsTransition/SpecificationsTransition0090')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击【Duration_10000_Index】
      let button_duration_10000_index = await driver.waitForComponent(ON.id('button_duration_10000_index'), 500)
      await button_duration_10000_index.click()
      await Utils.sleep(500)
      
      // 步骤3：点击【Duration_10000_pat_OPACITY】
      let button_duration_10000_pat_opacity = await driver.waitForComponent(ON.id('button_duration_10000_pat_opacity'), 500)
      await button_duration_10000_pat_opacity.click()
      await Utils.sleep(500)
      
      // 步骤4：点击【AlertDialog: autoCancel_True】
      let button_alert_dialog = await driver.waitForComponent(ON.id('button_alert_dialog_auto_cancel_true'), 500)
      await button_alert_dialog.click()
      await Utils.sleep(500)
      
      // 预期结果4：弹出AlertDialog，显示动画正常播放，持续时间10000ms
      await Utils.sleep(1000)
      
      // 步骤5：点击遮蔽层关闭弹窗
      await driver.click(100, 100)
      await Utils.sleep(500)
      
      // 预期结果5：弹窗消失，消失动画正常播放，持续时间10000ms
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0100 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0110
     * @tc.name   : Popupbox specifications transition
     * @tc.desc   : Verify popupbox specifications transition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0110 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/animation/SpecificationsTransition/SpecificationsTransition0110')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击【Duration_10000_Index】
      let button_duration_10000_index = await driver.waitForComponent(ON.id('button_duration_10000_index'), 500)
      await button_duration_10000_index.click()
      await Utils.sleep(500)
      
      // 步骤3：点击【Duration_10000_pat_SLIDE_SWITCH】
      let button_duration_10000_pat_slide_switch = await driver.waitForComponent(ON.id('button_duration_10000_pat_slide_switch'), 500)
      await button_duration_10000_pat_slide_switch.click()
      await Utils.sleep(500)
      
      // 步骤4：点击【AlertDialog: autoCancel_True】
      let button_alert_dialog = await driver.waitForComponent(ON.id('button_alert_dialog_auto_cancel_true'), 500)
      await button_alert_dialog.click()
      await Utils.sleep(500)
      
      // 预期结果4：弹出AlertDialog，显示动画正常播放，持续时间10000ms
      await Utils.sleep(1000)
      
      // 步骤5：点击遮蔽层关闭弹窗
      await driver.click(100, 100)
      await Utils.sleep(500)
      
      // 预期结果5：弹窗消失，消失动画正常播放，持续时间10000ms
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0120
     * @tc.name   : Popupbox specifications transition
     * @tc.desc   : Verify popupbox specifications transition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0120 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/animation/SpecificationsTransition/SpecificationsTransition0120')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击【Duration_10000_Index】
      let button_duration_10000_index = await driver.waitForComponent(ON.id('button_duration_10000_index'), 500)
      await button_duration_10000_index.click()
      await Utils.sleep(500)
      
      // 步骤3：点击【Duration_10000_Asymmetric】
      let button_duration_10000_asymmetric = await driver.waitForComponent(ON.id('button_duration_10000_asymmetric'), 500)
      await button_duration_10000_asymmetric.click()
      await Utils.sleep(500)
      
      // 步骤4：点击【AlertDialog: autoCancel_True】
      let button_alert_dialog = await driver.waitForComponent(ON.id('button_alert_dialog_auto_cancel_true'), 500)
      await button_alert_dialog.click()
      await Utils.sleep(500)
      
      // 步骤5：弹出动画过程中，点击【ActionSheet: autoCancel_True】按钮
      // 等待一小段时间让动画开始播放，但不等动画完成
      await Utils.sleep(2000)
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet_auto_cancel_true'), 500)
      await button_action_sheet.click()
      await Utils.sleep(500)
      
      // 步骤6：退出动画过程中，再次点击【ActionSheet: autoCancel_True】按钮
      // 先关闭当前的ActionSheet
      await driver.click(100, 100)
      await Utils.sleep(500)
      
      // 再次触发AlertDialog
      await button_alert_dialog.click()
      await Utils.sleep(500)
      
      // 点击遮蔽层开始退出动画
      await driver.click(100, 100)
      await Utils.sleep(1000)
      
      // 在退出动画过程中点击ActionSheet按钮
      await button_action_sheet.click()
      await Utils.sleep(500)
      
      // 预期结果6：弹窗AlertDialog退出动效正常播放，弹窗ActionSheet正常弹出
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0130
     * @tc.name   : Popupbox specifications transition
     * @tc.desc   : Verify popupbox specifications transition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0130 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/animation/SpecificationsTransition/SpecificationsTransition0130')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击【Duration_10000_Index】
      let button_duration_10000_index = await driver.waitForComponent(ON.id('button_duration_10000_index'), 500)
      await button_duration_10000_index.click()
      await Utils.sleep(500)
      
      // 步骤3：点击【Duration_10000_Combine】
      let button_duration_10000_combine = await driver.waitForComponent(ON.id('button_duration_10000_combine'), 500)
      await button_duration_10000_combine.click()
      await Utils.sleep(500)
      
      // 步骤4：点击【AlertDialog: autoCancel_True】
      let button_alert_dialog = await driver.waitForComponent(ON.id('button_alert_dialog_auto_cancel_true'), 500)
      await button_alert_dialog.click()
      await Utils.sleep(500)
      
      // 步骤5：弹出动画过程中，点击【ActionSheet: autoCancel_True】按钮
      // 等待一小段时间让动画开始播放，但不等动画完成
      await Utils.sleep(2000)
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet_auto_cancel_true'), 500)
      await button_action_sheet.click()
      await Utils.sleep(500)

      // 步骤6：退出动画过程中，再次点击【ActionSheet: autoCancel_True】按钮
      // 先关闭当前的ActionSheet
      await driver.click(100, 100)
      await Utils.sleep(500)
      
      // 再次触发AlertDialog
      await button_alert_dialog.click()
      await Utils.sleep(500)
      
      // 点击遮蔽层开始退出动画
      await driver.click(100, 100)
      await Utils.sleep(1000)
      
      // 在退出动画过程中点击ActionSheet按钮
      await button_action_sheet.click()
      await Utils.sleep(500)
      
      // 预期结果6：弹窗AlertDialog退出动效正常播放，弹窗ActionSheet正常弹出
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0130 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0140
     * @tc.name   : Popupbox specifications transition
     * @tc.desc   : Verify popupbox specifications transition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0140 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/animation/SpecificationsTransition/SpecificationsTransition0140')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击【Duration_10000_Index】
      let button_duration_10000_index = await driver.waitForComponent(ON.id('button_duration_10000_index'), 500)
      await button_duration_10000_index.click()
      await Utils.sleep(500)
      
      // 步骤3：点击【Duration_10000_Move】
      let button_duration_10000_move = await driver.waitForComponent(ON.id('button_duration_10000_move'), 500)
      await button_duration_10000_move.click()
      await Utils.sleep(500)
      
      // 步骤4：点击【AlertDialog: autoCancel_True】
      let button_alert_dialog = await driver.waitForComponent(ON.id('button_alert_dialog_auto_cancel_true'), 500)
      await button_alert_dialog.click()
      await Utils.sleep(500)
      
      // 步骤5：弹出动画过程中，点击【ActionSheet: autoCancel_True】按钮
      // 等待一小段时间让动画开始播放，但不等动画完成
      await Utils.sleep(2000)
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet_auto_cancel_true'), 500)
      await button_action_sheet.click()
      await Utils.sleep(500)

      // 步骤6：退出动画过程中，再次点击【ActionSheet: autoCancel_True】按钮
      // 先关闭当前的ActionSheet
      await driver.click(100, 100)
      await Utils.sleep(500)
      
      // 再次触发AlertDialog
      await button_alert_dialog.click()
      await Utils.sleep(500)
      
      // 点击遮蔽层开始退出动画
      await driver.click(100, 100)
      await Utils.sleep(1000)
      
      // 在退出动画过程中点击ActionSheet按钮
      await button_action_sheet.click()
      await Utils.sleep(500)
      
      // 预期结果6：弹窗AlertDialog退出动效正常播放，弹窗ActionSheet正常弹出
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0140 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0150
     * @tc.name   : Popupbox specifications transition
     * @tc.desc   : Verify popupbox specifications transition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0150 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/animation/SpecificationsTransition/SpecificationsTransition0150')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击【Duration_10000_Index】
      let button_duration_10000_index = await driver.waitForComponent(ON.id('button_duration_10000_index'), 500)
      await button_duration_10000_index.click()
      await Utils.sleep(500)
      
      // 步骤3：点击【Duration_10000_Opacity】
      let button_duration_10000_opacity = await driver.waitForComponent(ON.id('button_duration_10000_opacity'), 500)
      await button_duration_10000_opacity.click()
      await Utils.sleep(500)
      
      // 步骤4：点击【AlertDialog: autoCancel_True】
      let button_alert_dialog = await driver.waitForComponent(ON.id('button_alert_dialog_auto_cancel_true'), 500)
      await button_alert_dialog.click()
      await Utils.sleep(500)
      
      // 步骤5：弹出动画过程中，点击【ActionSheet: autoCancel_True】按钮
      // 等待一小段时间让动画开始播放，但不等动画完成
      await Utils.sleep(2000)
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet_auto_cancel_true'), 500)
      await button_action_sheet.click()
      await Utils.sleep(500)
      
      // 步骤6：退出动画过程中，再次点击【ActionSheet: autoCancel_True】按钮
      // 先关闭当前的ActionSheet
      await driver.click(100, 100)
      await Utils.sleep(500)
      
      // 再次触发AlertDialog
      await button_alert_dialog.click()
      await Utils.sleep(500)
      
      // 点击遮蔽层开始退出动画
      await driver.click(100, 100)
      await Utils.sleep(1000)
      
      // 在退出动画过程中点击ActionSheet按钮
      await button_action_sheet.click()
      await Utils.sleep(500)
      
      // 预期结果6：弹窗AlertDialog退出动效正常播放，弹窗ActionSheet正常弹出
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0150 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0160
     * @tc.name   : Popupbox specifications transition
     * @tc.desc   : Verify popupbox specifications transition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0160 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/animation/SpecificationsTransition/SpecificationsTransition0160')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击【Duration_10000_Index】
      let button_duration_10000_index = await driver.waitForComponent(ON.id('button_duration_10000_index'), 500)
      await button_duration_10000_index.click()
      await Utils.sleep(500)
      
      // 步骤3：点击【Duration_10000_Rotate】
      let button_duration_10000_rotate = await driver.waitForComponent(ON.id('button_duration_10000_rotate'), 500)
      await button_duration_10000_rotate.click()
      await Utils.sleep(500)
      
      // 步骤4：点击【AlertDialog: autoCancel_True】
      let button_alert_dialog = await driver.waitForComponent(ON.id('button_alert_dialog_auto_cancel_true'), 500)
      await button_alert_dialog.click()
      await Utils.sleep(500)
      
      // 步骤5：弹出动画过程中，点击【ActionSheet: autoCancel_True】按钮
      // 等待一小段时间让动画开始播放，但不等动画完成
      await Utils.sleep(2000)
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet_auto_cancel_true'), 500)
      await button_action_sheet.click()
      await Utils.sleep(500)

      
      // 步骤6：退出动画过程中，再次点击【ActionSheet: autoCancel_True】按钮
      // 先关闭当前的ActionSheet
      await driver.click(100, 100)
      await Utils.sleep(500)
      
      // 再次触发AlertDialog
      await button_alert_dialog.click()
      await Utils.sleep(500)
      
      // 点击遮蔽层开始退出动画
      await driver.click(100, 100)
      await Utils.sleep(1000)
      
      // 在退出动画过程中点击ActionSheet按钮
      await button_action_sheet.click()
      await Utils.sleep(500)
      
      // 预期结果6：弹窗AlertDialog退出动效正常播放，弹窗ActionSheet正常弹出
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0160 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0170
     * @tc.name   : Popupbox specifications transition
     * @tc.desc   : Verify popupbox specifications transition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0170 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/animation/SpecificationsTransition/SpecificationsTransition0170')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击【Duration_10000_Index】
      let button_duration_10000_index = await driver.waitForComponent(ON.id('button_duration_10000_index'), 500)
      await button_duration_10000_index.click()
      await Utils.sleep(500)
      
      // 步骤3：点击【Duration_10000_Scale】
      let button_duration_10000_scale = await driver.waitForComponent(ON.id('button_duration_10000_scale'), 500)
      await button_duration_10000_scale.click()
      await Utils.sleep(500)
      
      // 步骤4：点击【AlertDialog: autoCancel_True】
      let button_alert_dialog = await driver.waitForComponent(ON.id('button_alert_dialog_auto_cancel_true'), 500)
      await button_alert_dialog.click()
      await Utils.sleep(500)
      
      // 步骤5：弹出动画过程中，点击【ActionSheet: autoCancel_True】按钮
      // 等待一小段时间让动画开始播放，但不等动画完成
      await Utils.sleep(2000)
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet_auto_cancel_true'), 500)
      await button_action_sheet.click()
      await Utils.sleep(500)
      
      // 步骤6：退出动画过程中，再次点击【ActionSheet: autoCancel_True】按钮
      // 先关闭当前的ActionSheet
      await driver.click(100, 100)
      await Utils.sleep(500)
      
      // 再次触发AlertDialog
      await button_alert_dialog.click()
      await Utils.sleep(500)
      
      // 点击遮蔽层开始退出动画
      await driver.click(100, 100)
      await Utils.sleep(1000)
      
      // 在退出动画过程中点击ActionSheet按钮
      await button_action_sheet.click()
      await Utils.sleep(500)
      
      // 预期结果6：弹窗AlertDialog退出动效正常播放，弹窗ActionSheet正常弹出
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0180
     * @tc.name   : Popupbox specifications transition
     * @tc.desc   : Verify popupbox specifications transition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0180 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/animation/SpecificationsTransition/SpecificationsTransition0180')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击【Duration_10000_Index】
      let button_duration_10000_index = await driver.waitForComponent(ON.id('button_duration_10000_index'), 500)
      await button_duration_10000_index.click()
      await Utils.sleep(500)
      
      // 步骤3：点击【Duration_10000_Translate】
      let button_duration_10000_translate = await driver.waitForComponent(ON.id('button_duration_10000_translate'), 500)
      await button_duration_10000_translate.click()
      await Utils.sleep(500)
      
      // 步骤4：点击【AlertDialog: autoCancel_True】
      let button_alert_dialog = await driver.waitForComponent(ON.id('button_alert_dialog_auto_cancel_true'), 500)
      await button_alert_dialog.click()
      await Utils.sleep(500)
      
      // 步骤5：弹出动画过程中，点击【ActionSheet: autoCancel_True】按钮
      // 等待一小段时间让动画开始播放，但不等动画完成
      await Utils.sleep(2000)
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet_auto_cancel_true'), 500)
      await button_action_sheet.click()
      await Utils.sleep(500)
      
      // 步骤6：退出动画过程中，再次点击【ActionSheet: autoCancel_True】按钮
      // 先关闭当前的ActionSheet
      await driver.click(100, 100)
      await Utils.sleep(500)
      
      // 再次触发AlertDialog
      await button_alert_dialog.click()
      await Utils.sleep(500)
      
      // 点击遮蔽层开始退出动画
      await driver.click(100, 100)
      await Utils.sleep(1000)
      
      // 在退出动画过程中点击ActionSheet按钮
      await button_action_sheet.click()
      await Utils.sleep(500)
      
      // 预期结果6：弹窗AlertDialog退出动效正常播放，弹窗ActionSheet正常弹出
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0180 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0190
     * @tc.name   : Popupbox specifications transition
     * @tc.desc   : Verify popupbox specifications transition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0190 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/animation/SpecificationsTransition/SpecificationsTransition0190')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击【Duration_10000_Index】
      let button_duration_10000_index = await driver.waitForComponent(ON.id('button_duration_10000_index'), 500)
      await button_duration_10000_index.click()
      await Utils.sleep(500)
      
      // 步骤3：点击【Duration_10000_pat_IDENTITY】
      let button_duration_10000_pat_identity = await driver.waitForComponent(ON.id('button_duration_10000_pat_identity'), 500)
      await button_duration_10000_pat_identity.click()
      await Utils.sleep(500)
      
      // 步骤4：点击【AlertDialog: autoCancel_True】
      let button_alert_dialog = await driver.waitForComponent(ON.id('button_alert_dialog_auto_cancel_true'), 500)
      await button_alert_dialog.click()
      await Utils.sleep(500)
      
      // 步骤5：弹出动画过程中，点击【ActionSheet: autoCancel_True】按钮
      // 等待一小段时间让动画开始播放，但不等动画完成
      await Utils.sleep(2000)
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet_auto_cancel_true'), 500)
      await button_action_sheet.click()
      await Utils.sleep(500)
      
      // 步骤6：退出动画过程中，再次点击【ActionSheet: autoCancel_True】按钮
      // 先关闭当前的ActionSheet
      await driver.click(100, 100)
      await Utils.sleep(500)
      
      // 再次触发AlertDialog
      await button_alert_dialog.click()
      await Utils.sleep(500)
      
      // 点击遮蔽层开始退出动画
      await driver.click(100, 100)
      await Utils.sleep(1000)
      
      // 在退出动画过程中点击ActionSheet按钮
      await button_action_sheet.click()
      await Utils.sleep(500)
      
      // 预期结果6：弹窗AlertDialog退出动效正常播放，弹窗ActionSheet正常弹出
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0190 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0200
     * @tc.name   : Popupbox specifications transition
     * @tc.desc   : Verify popupbox specifications transition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0200', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0200 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/animation/SpecificationsTransition/SpecificationsTransition0200')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击【Duration_10000_Index】
      let button_duration_10000_index = await driver.waitForComponent(ON.id('button_duration_10000_index'), 500)
      await button_duration_10000_index.click()
      await Utils.sleep(500)
      
      // 步骤3：点击【Duration_10000_pat_OPACITY】
      let button_duration_10000_pat_opacity = await driver.waitForComponent(ON.id('button_duration_10000_pat_opacity'), 500)
      await button_duration_10000_pat_opacity.click()
      await Utils.sleep(500)
      
      // 步骤4：点击【AlertDialog: autoCancel_True】
      let button_alert_dialog = await driver.waitForComponent(ON.id('button_alert_dialog_auto_cancel_true'), 500)
      await button_alert_dialog.click()
      await Utils.sleep(500)
      
      // 步骤5：弹出动画过程中，点击【ActionSheet: autoCancel_True】按钮
      // 等待一小段时间让动画开始播放，但不等动画完成
      await Utils.sleep(2000)
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet_auto_cancel_true'), 500)
      await button_action_sheet.click()
      await Utils.sleep(500)
      
      // 步骤6：退出动画过程中，再次点击【ActionSheet: autoCancel_True】按钮
      // 先关闭当前的ActionSheet
      await driver.click(100, 100)
      await Utils.sleep(500)
      
      // 再次触发AlertDialog
      await button_alert_dialog.click()
      await Utils.sleep(500)
      
      // 点击遮蔽层开始退出动画
      await driver.click(100, 100)
      await Utils.sleep(1000)
      
      // 在退出动画过程中点击ActionSheet按钮
      await button_action_sheet.click()
      await Utils.sleep(500)
      
      // 预期结果6：弹窗AlertDialog退出动效正常播放，弹窗ActionSheet正常弹出
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0200 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0210
     * @tc.name   : Popupbox specifications transition
     * @tc.desc   : Verify popupbox specifications transition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0210', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0210 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/animation/SpecificationsTransition/SpecificationsTransition0210')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击【Duration_10000_Index】
      let button_duration_10000_index = await driver.waitForComponent(ON.id('button_duration_10000_index'), 500)
      await button_duration_10000_index.click()
      await Utils.sleep(500)
      
      // 步骤3：点击【Duration_10000_pat_SLIDE】
      let button_duration_10000_pat_slide = await driver.waitForComponent(ON.id('button_duration_10000_pat_slide'), 500)
      await button_duration_10000_pat_slide.click()
      await Utils.sleep(500)
      
      // 步骤4：点击【AlertDialog: autoCancel_True】
      let button_alert_dialog = await driver.waitForComponent(ON.id('button_alert_dialog_auto_cancel_true'), 500)
      await button_alert_dialog.click()
      await Utils.sleep(500)
      
      // 步骤5：弹出动画过程中，点击【ActionSheet: autoCancel_True】按钮
      // 等待一小段时间让动画开始播放，但不等动画完成
      await Utils.sleep(2000)
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet_auto_cancel_true'), 500)
      await button_action_sheet.click()
      await Utils.sleep(500)
      
      // 步骤6：退出动画过程中，再次点击【ActionSheet: autoCancel_True】按钮
      // 先关闭当前的ActionSheet
      await driver.click(100, 100)
      await Utils.sleep(500)
      
      // 再次触发AlertDialog
      await button_alert_dialog.click()
      await Utils.sleep(500)
      
      // 点击遮蔽层开始退出动画
      await driver.click(100, 100)
      await Utils.sleep(1000)
      
      // 在退出动画过程中点击ActionSheet按钮
      await button_action_sheet.click()
      await Utils.sleep(500)
      
      // 预期结果6：弹窗AlertDialog退出动效正常播放，弹窗ActionSheet正常弹出
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0210 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0220
     * @tc.name   : Popupbox specifications transition
     * @tc.desc   : Verify popupbox specifications transition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0220', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0220 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/animation/SpecificationsTransition/SpecificationsTransition0220')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击【Duration_10000_Index】
      let button_duration_10000_index = await driver.waitForComponent(ON.id('button_duration_10000_index'), 500)
      await button_duration_10000_index.click()
      await Utils.sleep(500)
      
      // 步骤3：点击【Duration_10000_pat_SLIDE_SWITCH】
      let button_duration_10000_pat_slide_switch = await driver.waitForComponent(ON.id('button_duration_10000_pat_slide_switch'), 500)
      await button_duration_10000_pat_slide_switch.click()
      await Utils.sleep(500)
      
      // 步骤4：点击【AlertDialog: autoCancel_True】
      let button_alert_dialog = await driver.waitForComponent(ON.id('button_alert_dialog_auto_cancel_true'), 500)
      await button_alert_dialog.click()
      await Utils.sleep(500)
      
      // 步骤5：弹出动画过程中，点击【ActionSheet: autoCancel_True】按钮
      // 等待一小段时间让动画开始播放，但不等动画完成
      await Utils.sleep(2000)
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet_auto_cancel_true'), 500)
      await button_action_sheet.click()
      await Utils.sleep(500)
      
      // 步骤6：退出动画过程中，再次点击【ActionSheet: autoCancel_True】按钮
      // 先关闭当前的ActionSheet
      await driver.click(100, 100)
      await Utils.sleep(500)
      
      // 再次触发AlertDialog
      await button_alert_dialog.click()
      await Utils.sleep(500)
      
      // 点击遮蔽层开始退出动画
      await driver.click(100, 100)
      await Utils.sleep(1000)
      
      // 在退出动画过程中点击ActionSheet按钮
      await button_action_sheet.click()
      await Utils.sleep(500)
      
      // 预期结果6：弹窗AlertDialog退出动效正常播放，弹窗ActionSheet正常弹出
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0220 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0240
     * @tc.name   : Popupbox specifications transition
     * @tc.desc   : Verify popupbox specifications transition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0240', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0240 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/animation/SpecificationsTransition/SpecificationsTransition0240')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击【Duration_10000_Index】
      let button_duration_10000_index = await driver.waitForComponent(ON.id('button_duration_10000_index'), 500)
      await button_duration_10000_index.click()
      await Utils.sleep(500)
      
      // 步骤3：点击【Duration_10000_pat_SLIDE_SWITCH】
      let button_duration_10000_pat_slide_switch = await driver.waitForComponent(ON.id('button_duration_10000_pat_slide_switch'), 500)
      await button_duration_10000_pat_slide_switch.click()
      await Utils.sleep(500)
      
      // 步骤4：点击【AlertDialog: autoCancel_True】
      let button_alert_dialog = await driver.waitForComponent(ON.id('button_alert_dialog_auto_cancel_true'), 500)
      await button_alert_dialog.click()
      await Utils.sleep(500)
      
      // 步骤5：弹出动画过程中，点击home键后返回app
      // 等待一小段时间让动画开始播放
      await Utils.sleep(2000)
      
      // 模拟按下Home键（将应用切换到后台）
      await driver.triggerKey(2015) // 2015 是 Home 键的键码
      await Utils.sleep(1000)
      
      // 返回应用（模拟从后台切换回前台）
      await driver.triggerKey(2015)
      await Utils.sleep(500)
      
      // 点击遮蔽层开始退出动画
      await driver.click(100, 100)
      await Utils.sleep(1000)
      
      // 在退出动画过程中按Home键
      await driver.triggerKey(2015)
      await Utils.sleep(1000)
      
      // 返回应用
      await driver.triggerKey(2015)
      await Utils.sleep(500)
      
      // 预期结果6：切后台时弹窗AlertDialog的退出动效继续播放
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0240 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0250
     * @tc.name   : Popupbox specifications transition
     * @tc.desc   : Verify popupbox specifications transition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0250', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0250 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/animation/SpecificationsTransition/SpecificationsTransition0250')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击【Duration_10000_Index】
      let button_duration_10000_index = await driver.waitForComponent(ON.id('button_duration_10000_index'), 500)
      await button_duration_10000_index.click()
      await Utils.sleep(500)
      
      // 步骤3：点击【Duration_10000_Asymmetric】
      let button_duration_10000_asymmetric = await driver.waitForComponent(ON.id('button_duration_10000_asymmetric'), 500)
      await button_duration_10000_asymmetric.click()
      await Utils.sleep(500)
      
      // 步骤4：点击【AlertDialog: autoCancel_True】
      let button_alert_dialog = await driver.waitForComponent(ON.id('button_alert_dialog_auto_cancel_true'), 500)
      await button_alert_dialog.click()
      await Utils.sleep(500)
      
      // 步骤5：弹出动画过程中，左/右滑/点击back键
      // 等待一小段时间让动画开始播放
      await Utils.sleep(2000)
      
      // 按下Back键
      await driver.triggerKey(2) // 2 是 Back 键的键码
      await Utils.sleep(500)
      
      // 步骤6：再次左/右滑/点击back键
      await driver.triggerKey(2)
      await Utils.sleep(500)
      
      // 步骤7：再次左/右滑/点击back键
      await driver.triggerKey(2)
      await Utils.sleep(500)
      
      // 预期结果7：应用返回上一级
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0250 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0270
     * @tc.name   : Popupbox specifications transition
     * @tc.desc   : Verify popupbox specifications transition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0270', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0270 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/animation/SpecificationsTransition/SpecificationsTransition0270')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击【iter_Duration_2000】
      let button_iter_duration_2000 = await driver.waitForComponent(ON.id('iter_duration_2000'), 500)
      await button_iter_duration_2000.click()
      await Utils.sleep(500)
      
      // 步骤3：点击【Duration_2000_Opacity】
      let button_duration_2000_opacity = await driver.waitForComponent(ON.id('button_duration_2000_opacity'), 500)
      await button_duration_2000_opacity.click()
      await Utils.sleep(500)
      
      // 步骤4：点击【AlertDialog: autoCancel_True】
      let button_alert_dialog = await driver.waitForComponent(ON.id('button_alert_dialog_auto_cancel_true'), 500)
      await button_alert_dialog.click()
      await Utils.sleep(500)
      
      // 步骤5：点击遮蔽层关闭弹窗
      await driver.click(100, 100)
      await Utils.sleep(500)
      
      // 预期结果5：弹窗AlertDialog的显示动效终止，并且开始无限次执行退出动效
      // 等待一段时间观察退出动画是否在循环播放
      await Utils.sleep(3000)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0270 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0300
     * @tc.name   : Popupbox specifications transition
     * @tc.desc   : Verify popupbox specifications transition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0300', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0300 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/animation/SpecificationsTransition/SpecificationsTransition0300')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击【Duration_10000_Index】
      let button_duration_10000_index = await driver.waitForComponent(ON.id('button_duration_10000_index'), 500)
      await button_duration_10000_index.click()
      await Utils.sleep(500)
      
      // 步骤3：点击【Duration_10000_Combine】
      let button_duration_10000_combine = await driver.waitForComponent(ON.id('button_duration_10000_combine'), 500)
      await button_duration_10000_combine.click()
      await Utils.sleep(500)
      
      // 步骤4：点击【ActionSheet: autoCancel_True】
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet_auto_cancel_true'), 500)
      await button_action_sheet.click()
      await Utils.sleep(500)
      
      // 预期结果4：弹出ActionSheet，显示动画正常播放，持续时间10000ms
      await Utils.sleep(1000)
      
      // 步骤5：点击遮蔽层关闭弹窗
      await driver.click(100, 100)
      await Utils.sleep(500)
      
      // 预期结果5：弹窗消失，消失动画正常播放，持续时间10000ms
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0300 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0340
     * @tc.name   : Popupbox specifications transition
     * @tc.desc   : Verify popupbox specifications transition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0340', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0340 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/animation/SpecificationsTransition/SpecificationsTransition0340')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击【Duration_10000_Index】
      let button_duration_10000_index = await driver.waitForComponent(ON.id('button_duration_10000_index'), 500)
      await button_duration_10000_index.click()
      await Utils.sleep(500)
      
      // 步骤3：点击【Duration_10000_Scale】
      let button_duration_10000_scale = await driver.waitForComponent(ON.id('button_duration_10000_scale'), 500)
      await button_duration_10000_scale.click()
      await Utils.sleep(500)
      
      // 步骤4：点击【ActionSheet: autoCancel_True】
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet_auto_cancel_true'), 500)
      await button_action_sheet.click()
      await Utils.sleep(500)
      
      // 预期结果4：弹出ActionSheet，显示动画正常播放，持续时间10000ms
      await Utils.sleep(1000)
      
      // 步骤5：点击遮蔽层关闭弹窗
      await driver.click(100, 100)
      await Utils.sleep(500)
      
      // 预期结果5：弹窗消失，消失动画正常播放，持续时间10000ms
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0340 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0370
     * @tc.name   : Popupbox specifications transition
     * @tc.desc   : Verify popupbox specifications transition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0370', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0370 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/animation/SpecificationsTransition/SpecificationsTransition0370')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击【Duration_10000_Index】
      let button_duration_10000_index = await driver.waitForComponent(ON.id('button_duration_10000_index'), 500)
      await button_duration_10000_index.click()
      await Utils.sleep(500)
      
      // 步骤3：点击【Duration_10000_pat_OPACITY】
      let button_duration_10000_pat_opacity = await driver.waitForComponent(ON.id('button_duration_10000_pat_opacity'), 500)
      await button_duration_10000_pat_opacity.click()
      await Utils.sleep(500)
      
      // 步骤4：点击【ActionSheet: autoCancel_True】
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet_auto_cancel_true'), 500)
      await button_action_sheet.click()
      await Utils.sleep(500)
      
      // 预期结果4：弹出ActionSheet，显示动画正常播放，持续时间10000ms
      await Utils.sleep(1000)
      
      // 步骤5：点击遮蔽层关闭弹窗
      await driver.click(100, 100)
      await Utils.sleep(500)
      
      // 预期结果5：弹窗消失，消失动画正常播放，持续时间10000ms
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0370 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0480
     * @tc.name   : Popupbox specifications transition
     * @tc.desc   : Verify popupbox specifications transition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0480', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0480 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/animation/SpecificationsTransition/SpecificationsTransition0480')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击【Duration_10000_Index】
      let button_duration_10000_index = await driver.waitForComponent(ON.id('button_duration_10000_index'), 500)
      await button_duration_10000_index.click()
      await Utils.sleep(500)
      
      // 步骤3：点击【Duration_10000_pat_OPACITY】
      let button_duration_10000_pat_opacity = await driver.waitForComponent(ON.id('button_duration_10000_pat_opacity'), 500)
      await button_duration_10000_pat_opacity.click()
      await Utils.sleep(500)
      
      // 步骤4：点击【ActionSheet: autoCancel_True】
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet_auto_cancel_true'), 500)
      await button_action_sheet.click()
      await Utils.sleep(500)
      
      // 步骤5：弹出动画过程中，点击【AlertDialog: autoCancel_True】按钮
      // 等待一小段时间让动画开始播放，但不等动画完成
      await Utils.sleep(2000)
      let button_alert_dialog = await driver.waitForComponent(ON.id('button_alert_dialog_auto_cancel_true'), 500)
      await button_alert_dialog.click()
      await Utils.sleep(500)

      // 步骤6：退出动画过程中，再次点击【AlertDialog: autoCancel_True】按钮
      // 先关闭当前的AlertDialog
      await driver.click(100, 100)
      await Utils.sleep(500)
      
      // 再次触发ActionSheet
      await button_action_sheet.click()
      await Utils.sleep(500)
      
      // 点击遮蔽层开始退出动画
      await driver.click(100, 100)
      await Utils.sleep(1000)
      
      // 在退出动画过程中点击AlertDialog按钮
      await button_alert_dialog.click()
      await Utils.sleep(500)
      
      // 预期结果6：弹窗ActionSheet退出动效正常播放，弹窗AlertDialog正常弹出
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0480 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0500
     * @tc.name   : Popupbox specifications transition
     * @tc.desc   : Verify popupbox specifications transition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0500', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0500 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/animation/SpecificationsTransition/SpecificationsTransition0500')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击【Duration_10000_Index】
      let button_duration_10000_index = await driver.waitForComponent(ON.id('button_duration_10000_index'), 500)
      await button_duration_10000_index.click()
      await Utils.sleep(500)
      
      // 步骤3：点击【Duration_10000_pat_SLIDE_SWITCH】
      let button_duration_10000_pat_slide_switch = await driver.waitForComponent(ON.id('button_duration_10000_pat_slide_switch'), 500)
      await button_duration_10000_pat_slide_switch.click()
      await Utils.sleep(500)
      
      // 步骤4：点击【ActionSheet: autoCancel_True】
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet_auto_cancel_true'), 500)
      await button_action_sheet.click()
      await Utils.sleep(500)
      
      // 步骤5：弹出动画过程中，点击【AlertDialog: autoCancel_True】按钮
      // 等待一小段时间让动画开始播放，但不等动画完成
      await Utils.sleep(2000)
      let button_alert_dialog = await driver.waitForComponent(ON.id('button_alert_dialog_auto_cancel_true'), 500)
      await button_alert_dialog.click()
      await Utils.sleep(500)
      
      // 步骤6：退出动画过程中，再次点击【AlertDialog: autoCancel_True】按钮
      // 先关闭当前的AlertDialog
      await driver.click(100, 100)
      await Utils.sleep(500)
      
      // 再次触发ActionSheet
      await button_action_sheet.click()
      await Utils.sleep(500)
      
      // 点击遮蔽层开始退出动画
      await driver.click(100, 100)
      await Utils.sleep(1000)
      
      // 在退出动画过程中点击AlertDialog按钮
      await button_alert_dialog.click()
      await Utils.sleep(500)
      
      // 预期结果6：弹窗ActionSheet退出动效正常播放，弹窗AlertDialog正常弹出
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0500 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0230
     * @tc.name   : Popupbox specifications transition
     * @tc.desc   : Verify popupbox specifications transition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0230', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0230 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/animation/SpecificationsTransition/SpecificationsTransition0230')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击【Duration_10000_Index】
      let button_duration_10000_index = await driver.waitForComponent(ON.id('button_duration_10000_index'), 500)
      await button_duration_10000_index.click()
      await Utils.sleep(500)
      
      // 步骤3：点击【Duration_10000_pat_SLIDE_SWITCH】
      let button_duration_10000_pat_slide_switch = await driver.waitForComponent(ON.id('button_duration_10000_pat_slide_switch'), 500)
      await button_duration_10000_pat_slide_switch.click()
      await Utils.sleep(500)
      
      // 步骤4：点击【AlertDialog: autoCancel_True】
      let button_alert_dialog = await driver.waitForComponent(ON.id('button_alert_dialog_auto_cancel_true'), 500)
      await button_alert_dialog.click()
      await Utils.sleep(500)
      
      // 步骤5：弹出动画过程中，锁屏后再解锁
      // 等待一小段时间让动画开始播放
      await Utils.sleep(2000)
      
      // 模拟锁屏（按下电源键）
      await driver.triggerKey(26) // 26 是 Power 键的键码
      await Utils.sleep(1000)
      
      // 模拟解锁（再次按下电源键）
      await driver.triggerKey(26)
      await Utils.sleep(500)

      // 点击遮蔽层开始退出动画
      await driver.click(100, 100)
      await Utils.sleep(1000)
      
      // 在退出动画过程中锁屏
      await driver.triggerKey(26)
      await Utils.sleep(1000)
      
      // 解锁
      await driver.triggerKey(26)
      await Utils.sleep(500)
      
      // 预期结果6：锁屏后弹窗AlertDialog的退出动效继续播放
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0230 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0280
     * @tc.name   : Popupbox specifications transition
     * @tc.desc   : Verify popupbox specifications transition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0280', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0280 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/animation/SpecificationsTransition/SpecificationsTransition0280')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击【playMode_Duration_2000】
      let button_playmode_duration_2000 = await driver.waitForComponent(ON.id('playmode_duration_2000'), 500)
      await button_playmode_duration_2000.click()
      await Utils.sleep(500)
      
      // 步骤3：点击【Duration_2000_Asymmetric】
      let button_duration_2000_asymmetric = await driver.waitForComponent(ON.id('button_duration_2000_asymmetric'), 500)
      await button_duration_2000_asymmetric.click()
      await Utils.sleep(500)
      
      // 步骤4：点击【AlertDialog: autoCancel_True】
      let button_alert_dialog = await driver.waitForComponent(ON.id('button_alert_dialog_auto_cancel_true'), 500)
      await button_alert_dialog.click()
      await Utils.sleep(500)
      
      // 预期结果4：反向弹出AlertDialog
      await windowSnap.snapShot()
      await Utils.sleep(3000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0280 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0260
     * @tc.name   : Popupbox specifications transition
     * @tc.desc   : Verify popupbox specifications transition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0260', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0260 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/animation/SpecificationsTransition/SpecificationsTransition0260')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击【不设置】
      let button_no_transition = await driver.waitForComponent(ON.id('button_no_transition'), 500)
      await button_no_transition.click()
      await Utils.sleep(500)
      
      // 步骤3：点击【AlertDialog】
      let button_alert_dialog = await driver.waitForComponent(ON.id('button_alert_dialog'), 500)
      await button_alert_dialog.click()
      await Utils.sleep(500)
      
      // 步骤4：左/右滑/点击遮蔽层/button按钮
      await driver.click(100, 100)
      await Utils.sleep(500)
      
      // 预期结果5：弹窗消失，使用默认消失动画
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0260 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0410
     * @tc.name   : Popupbox specifications transition
     * @tc.desc   : Verify popupbox specifications transition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0410', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0410 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/animation/SpecificationsTransition/SpecificationsTransition0410')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击【Duration_10000_Index】
      let button_duration_10000_index = await driver.waitForComponent(ON.id('button_duration_10000_index'), 500)
      await button_duration_10000_index.click()
      await Utils.sleep(500)
      
      // 步骤3：点击【Duration_10000_Combine】
      let button_duration_10000_combine = await driver.waitForComponent(ON.id('button_duration_10000_combine'), 500)
      await button_duration_10000_combine.click()
      await Utils.sleep(500)
      
      // 步骤4：点击【ActionSheet: autoCancel_True】
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet_auto_cancel_true'), 500)
      await button_action_sheet.click()
      await Utils.sleep(500)
      
      // 步骤5：弹出动画过程中，点击【AlertDialog: autoCancel_True】按钮
      // 等待一小段时间让动画开始播放，但不等动画完成
      await Utils.sleep(2000)
      let button_alert_dialog = await driver.waitForComponent(ON.id('button_alert_dialog_auto_cancel_true'), 500)
      await button_alert_dialog.click()
      await Utils.sleep(500)
      
      // 步骤6：退出动画过程中，再次点击【AlertDialog: autoCancel_True】按钮
      // 先关闭当前的AlertDialog
      await driver.click(100, 100)
      await Utils.sleep(500)
      
      // 再次触发ActionSheet
      await button_action_sheet.click()
      await Utils.sleep(500)
      
      // 点击遮蔽层开始退出动画
      await driver.click(100, 100)
      await Utils.sleep(1000)
      
      // 在退出动画过程中点击AlertDialog按钮
      await button_alert_dialog.click()
      await Utils.sleep(500)
      
      // 预期结果6：弹窗ActionSheet退出动效正常播放，弹窗AlertDialog正常弹出
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0410 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0390
     * @tc.name   : Popupbox specifications transition
     * @tc.desc   : Verify popupbox specifications transition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0390', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0390 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/animation/SpecificationsTransition/SpecificationsTransition0390')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击【Duration_10000_Index】
      let button_duration_10000_index = await driver.waitForComponent(ON.id('button_duration_10000_index'), 500)
      await button_duration_10000_index.click()
      await Utils.sleep(500)
      
      // 步骤3：点击【Duration_10000_pat_SLIDE_SWITCH】
      let button_duration_10000_pat_slide_switch = await driver.waitForComponent(ON.id('button_duration_10000_pat_slide_switch'), 500)
      await button_duration_10000_pat_slide_switch.click()
      await Utils.sleep(500)
      
      // 步骤4：点击【ActionSheet: autoCancel_True】
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet_auto_cancel_true'), 500)
      await button_action_sheet.click()
      await Utils.sleep(500)

      // 步骤5：左/右滑/点击遮蔽层/button按钮
      await driver.click(100, 100)
      await Utils.sleep(500)
      
      // 预期结果5：弹窗消失，消失动画正常播放，持续时间10000ms
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0390 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0450
     * @tc.name   : Popupbox specifications transition
     * @tc.desc   : Verify popupbox specifications transition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0450', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0450 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/animation/SpecificationsTransition/SpecificationsTransition0450')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击【Duration_10000_Index】
      let button_duration_10000_index = await driver.waitForComponent(ON.id('button_duration_10000_index'), 500)
      await button_duration_10000_index.click()
      await Utils.sleep(500)
      
      // 步骤3：点击【Duration_10000_Scale】
      let button_duration_10000_scale = await driver.waitForComponent(ON.id('button_duration_10000_scale'), 500)
      await button_duration_10000_scale.click()
      await Utils.sleep(500)
      
      // 步骤4：点击【ActionSheet: autoCancel_True】
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet_auto_cancel_true'), 500)
      await button_action_sheet.click()
      await Utils.sleep(500)
      
      // 步骤5：弹出动画过程中，点击【AlertDialog: autoCancel_True】按钮
      // 等待一小段时间让动画开始播放，但不等动画完成
      await Utils.sleep(2000)
      let button_alert_dialog = await driver.waitForComponent(ON.id('button_alert_dialog_auto_cancel_true'), 500)
      await button_alert_dialog.click()
      await Utils.sleep(500)
      
      // 步骤6：退出动画过程中，再次点击【AlertDialog: autoCancel_True】按钮
      // 先关闭当前的AlertDialog
      await driver.click(100, 100)
      await Utils.sleep(500)
      
      // 再次触发ActionSheet
      await button_action_sheet.click()
      await Utils.sleep(500)
      
      // 点击遮蔽层开始退出动画
      await driver.click(100, 100)
      await Utils.sleep(1000)
      
      // 在退出动画过程中点击AlertDialog按钮
      await button_alert_dialog.click()
      await Utils.sleep(500)
      
      // 预期结果6：弹窗ActionSheet退出动效正常播放，弹窗AlertDialog正常弹出
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0450 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0350
     * @tc.name   : Popupbox specifications transition
     * @tc.desc   : Verify popupbox specifications transition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0350', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0350 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/animation/SpecificationsTransition/SpecificationsTransition0350')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击【Duration_10000_Index】
      let button_duration_10000_index = await driver.waitForComponent(ON.id('button_duration_10000_index'), 500)
      await button_duration_10000_index.click()
      await Utils.sleep(500)
      
      // 步骤3：点击【Duration_10000_Translate】
      let button_duration_10000_translate = await driver.waitForComponent(ON.id('button_duration_10000_translate'), 500)
      await button_duration_10000_translate.click()
      await Utils.sleep(500)
      
      // 步骤4：点击【ActionSheet: autoCancel_True】
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet_auto_cancel_true'), 500)
      await button_action_sheet.click()
      await Utils.sleep(500)
      
      // 步骤5：左/右滑/点击遮蔽层/button按钮
      await driver.click(100, 100)
      await Utils.sleep(500)
      
      // 预期结果5：弹窗消失，消失动画正常播放，持续时间10000ms
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0350 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0470
     * @tc.name   : Popupbox specifications transition
     * @tc.desc   : Verify popupbox specifications transition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0470', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0470 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/animation/SpecificationsTransition/SpecificationsTransition0470')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击【Duration_10000_Index】
      let button_duration_10000_index = await driver.waitForComponent(ON.id('button_duration_10000_index'), 500)
      await button_duration_10000_index.click()
      await Utils.sleep(500)
      
      // 步骤3：点击【Duration_10000_pat_IDENTITY】
      let button_duration_10000_pat_identity = await driver.waitForComponent(ON.id('button_duration_10000_pat_identity'), 500)
      await button_duration_10000_pat_identity.click()
      await Utils.sleep(500)
      
      // 步骤4：点击【ActionSheet: autoCancel_True】
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet_auto_cancel_true'), 500)
      await button_action_sheet.click()
      await Utils.sleep(500)
      
      // 步骤5：弹出动画过程中，点击【AlertDialog: autoCancel_True】按钮
      // 等待一小段时间让动画开始播放，但不等动画完成
      await Utils.sleep(2000)
      let button_alert_dialog = await driver.waitForComponent(ON.id('button_alert_dialog_auto_cancel_true'), 500)
      await button_alert_dialog.click()
      await Utils.sleep(500)
      
      // 步骤6：退出动画过程中，再次点击【AlertDialog: autoCancel_True】按钮
      // 先关闭当前的AlertDialog
      await driver.click(100, 100)
      await Utils.sleep(500)
      
      // 再次触发ActionSheet
      await button_action_sheet.click()
      await Utils.sleep(500)
      
      // 点击遮蔽层开始退出动画
      await driver.click(100, 100)
      await Utils.sleep(1000)
      
      // 在退出动画过程中点击AlertDialog按钮
      await button_alert_dialog.click()
      await Utils.sleep(500)
      
      // 预期结果6：弹窗ActionSheet退出动效正常播放，弹窗AlertDialog正常弹出
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0470 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0430
     * @tc.name   : Popupbox specifications transition
     * @tc.desc   : Verify popupbox specifications transition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0430', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0430 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/animation/SpecificationsTransition/SpecificationsTransition0430')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击【Duration_10000_Index】
      let button_duration_10000_index = await driver.waitForComponent(ON.id('button_duration_10000_index'), 500)
      await button_duration_10000_index.click()
      await Utils.sleep(500)
      
      // 步骤3：点击【Duration_10000_Opacity】
      let button_duration_10000_opacity = await driver.waitForComponent(ON.id('button_duration_10000_opacity'), 500)
      await button_duration_10000_opacity.click()
      await Utils.sleep(500)
      
      // 步骤4：点击【ActionSheet: autoCancel_True】
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet_auto_cancel_true'), 500)
      await button_action_sheet.click()
      await Utils.sleep(500)
      
      // 步骤5：弹出动画过程中，点击【AlertDialog: autoCancel_True】按钮
      // 等待一小段时间让动画开始播放，但不等动画完成
      await Utils.sleep(2000)
      let button_alert_dialog = await driver.waitForComponent(ON.id('button_alert_dialog_auto_cancel_true'), 500)
      await button_alert_dialog.click()
      await Utils.sleep(500)
      
      // 步骤6：退出动画过程中，再次点击【AlertDialog: autoCancel_True】按钮
      // 先关闭当前的AlertDialog
      await driver.click(100, 100)
      await Utils.sleep(500)
      
      // 再次触发ActionSheet
      await button_action_sheet.click()
      await Utils.sleep(500)
      
      // 点击遮蔽层开始退出动画
      await driver.click(100, 100)
      await Utils.sleep(1000)
      
      // 在退出动画过程中点击AlertDialog按钮
      await button_alert_dialog.click()
      await Utils.sleep(500)
      
      // 预期结果6：弹窗ActionSheet退出动效正常播放，弹窗AlertDialog正常弹出
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0430 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0330
     * @tc.name   : Popupbox specifications transition
     * @tc.desc   : Verify popupbox specifications transition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0330', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0330 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/animation/SpecificationsTransition/SpecificationsTransition0330')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击【Duration_10000_Index】
      let button_duration_10000_index = await driver.waitForComponent(ON.id('button_duration_10000_index'), 500)
      await button_duration_10000_index.click()
      await Utils.sleep(500)
      
      // 步骤3：点击【Duration_10000_Rotate】
      let button_duration_10000_rotate = await driver.waitForComponent(ON.id('button_duration_10000_rotate'), 500)
      await button_duration_10000_rotate.click()
      await Utils.sleep(500)
      
      // 步骤4：点击【ActionSheet: autoCancel_True】
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet_auto_cancel_true'), 500)
      await button_action_sheet.click()
      await Utils.sleep(500)
      
      // 步骤5：左/右滑/点击遮蔽层/button按钮
      await driver.click(100, 100)
      await Utils.sleep(500)
      
      // 预期结果5：弹窗消失，消失动画正常播放，持续时间10000ms
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0330 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0320
     * @tc.name   : Popupbox specifications transition
     * @tc.desc   : Verify popupbox specifications transition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0320', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0320 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/animation/SpecificationsTransition/SpecificationsTransition0320')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击【Duration_10000_Index】
      let button_duration_10000_index = await driver.waitForComponent(ON.id('button_duration_10000_index'), 500)
      await button_duration_10000_index.click()
      await Utils.sleep(500)
      
      // 步骤3：点击【Duration_10000_Opacity】
      let button_duration_10000_opacity = await driver.waitForComponent(ON.id('button_duration_10000_opacity'), 500)
      await button_duration_10000_opacity.click()
      await Utils.sleep(500)
      
      // 步骤4：点击【ActionSheet: autoCancel_True】
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet_auto_cancel_true'), 500)
      await button_action_sheet.click()
      await Utils.sleep(500)
      
      // 步骤5：左/右滑/点击遮蔽层/button按钮
      await driver.click(100, 100)
      await Utils.sleep(500)
      
      // 预期结果5：弹窗消失，消失动画正常播放，持续时间10000ms
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0320 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0520
     * @tc.name   : Popupbox specifications transition
     * @tc.desc   : Verify popupbox specifications transition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0520', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0520 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/animation/SpecificationsTransition/SpecificationsTransition0520')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击【Duration_10000_Index】
      let button_duration_10000_index = await driver.waitForComponent(ON.id('button_duration_10000_index'), 500)
      await button_duration_10000_index.click()
      await Utils.sleep(500)
      
      // 步骤3：点击【Duration_10000_pat_SLIDE_SWITCH】
      let button_duration_10000_pat_slide_switch = await driver.waitForComponent(ON.id('button_duration_10000_pat_slide_switch'), 500)
      await button_duration_10000_pat_slide_switch.click()
      await Utils.sleep(500)
      
      // 步骤4：点击【ActionSheet: autoCancel_True】
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet_auto_cancel_true'), 500)
      await button_action_sheet.click()
      await Utils.sleep(500)

      // 模拟按下Home键（将应用切换到后台）
      await driver.triggerKey(2015) // 2015 是 Home 键的键码
      await Utils.sleep(1000)
      
      // 返回应用（模拟从后台切换回前台）
      await driver.triggerKey(2015)
      await Utils.sleep(500)

      // 点击遮蔽层开始退出动画
      await driver.click(100, 100)
      await Utils.sleep(1000)
      
      // 在退出动画过程中按Home键
      await driver.triggerKey(2015)
      await Utils.sleep(1000)
      
      // 返回应用
      await driver.triggerKey(2015)
      await Utils.sleep(500)
      
      // 预期结果6：切后台时弹窗ActionSheet的退出动效继续播放
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0520 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0310
     * @tc.name   : Popupbox specifications transition
     * @tc.desc   : Verify popupbox specifications transition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0310', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0310 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/animation/SpecificationsTransition/SpecificationsTransition0310')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击【Duration_10000_Index】
      let button_duration_10000_index = await driver.waitForComponent(ON.id('button_duration_10000_index'), 500)
      await button_duration_10000_index.click()
      await Utils.sleep(500)
      
      // 步骤3：点击【Duration_10000_Move】
      let button_duration_10000_move = await driver.waitForComponent(ON.id('button_duration_10000_move'), 500)
      await button_duration_10000_move.click()
      await Utils.sleep(500)
      
      // 步骤4：点击【ActionSheet: autoCancel_True】
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet_auto_cancel_true'), 500)
      await button_action_sheet.click()
      await Utils.sleep(500)

      
      // 步骤5：左/右滑/点击遮蔽层/button按钮
      await driver.click(100, 100)
      await Utils.sleep(500)
      
      // 预期结果5：弹窗消失，消失动画正常播放，持续时间10000ms
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0310 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0550
     * @tc.name   : Popupbox specifications transition
     * @tc.desc   : Verify popupbox specifications transition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0550', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0550 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/animation/SpecificationsTransition/SpecificationsTransition0550')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击【iter_Duration_2000】
      let button_iter_duration_2000 = await driver.waitForComponent(ON.id('iter_duration_2000'), 500)
      await button_iter_duration_2000.click()
      await Utils.sleep(500)
      
      // 步骤3：点击【Duration_2000_Opacity】
      let button_duration_2000_opacity = await driver.waitForComponent(ON.id('button_duration_2000_opacity'), 500)
      await button_duration_2000_opacity.click()
      await Utils.sleep(500)
      
      // 步骤4：点击【ActionSheet: autoCancel_True】
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet_auto_cancel_true'), 500)
      await button_action_sheet.click()
      await Utils.sleep(500)

      // 步骤5：左/右滑/点击遮蔽层/button按钮
      await driver.click(100, 100)
      await Utils.sleep(500)
      
      // 预期结果5：弹窗ActionSheet的显示动效终止，并且开始无限次执行退出动效
      // 等待几个动画循环周期，验证退出动画持续播放
      await Utils.sleep(5000)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0550 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0460
     * @tc.name   : Popupbox specifications transition
     * @tc.desc   : Verify popupbox specifications transition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0460', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0460 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/animation/SpecificationsTransition/SpecificationsTransition0460')
      let driver: Driver = Driver.create();

      // 步骤2：点击【Duration_10000_Index】
      let button_duration_10000_index = await driver.waitForComponent(ON.id('button_duration_10000_index'), 500)
      await button_duration_10000_index.click()
      await Utils.sleep(500)
      
      // 步骤3：点击【Duration_10000_Translate】
      let button_duration_10000_translate = await driver.waitForComponent(ON.id('button_duration_10000_translate'), 500)
      await button_duration_10000_translate.click()
      await Utils.sleep(500)
      
      // 步骤4：点击【ActionSheet: autoCancel_True】
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet_auto_cancel_true'), 500)
      await button_action_sheet.click()
      await Utils.sleep(500)
      
      // 步骤5：弹出动画过程中，点击【AlertDialog: autoCancel_True】按钮
      // 等待2秒让动画开始播放(但不等动画完成，因为动画持续10000ms)
      await Utils.sleep(2000)
      let button_alert_dialog = await driver.waitForComponent(ON.id('button_alert_dialog_auto_cancel_true'), 500)
      await button_alert_dialog.click()
      await Utils.sleep(500)
      
      // 关闭AlertDialog
      await driver.click(100, 100)
      await Utils.sleep(1000)
      
      // 步骤6：再次触发ActionSheet，在退出动画过程中点击【AlertDialog: autoCancel_True】按钮
      await button_action_sheet.click()
      await Utils.sleep(500)

      // 点击遮蔽层触发退出动画
      await driver.click(100, 100)
      await Utils.sleep(500)
      
      // 在退出动画过程中点击AlertDialog按钮
      await Utils.sleep(2000)
      await button_alert_dialog.click()
      await Utils.sleep(500)
      
      // 预期结果6：弹窗ActionSheet退出动效正常播放，弹窗AlertDialog正常弹出
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0460 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0510
     * @tc.name   : Popupbox specifications transition
     * @tc.desc   : Verify popupbox specifications transition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0510', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0510 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/animation/SpecificationsTransition/SpecificationsTransition0510')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击【Duration_10000_Index】
      let button_duration_10000_index = await driver.waitForComponent(ON.id('button_duration_10000_index'), 500)
      await button_duration_10000_index.click()
      await Utils.sleep(500)
      
      // 步骤3：点击【Duration_10000_pat_SLIDE_SWITCH】
      let button_duration_10000_pat_slide_switch = await driver.waitForComponent(ON.id('button_duration_10000_pat_slide_switch'), 500)
      await button_duration_10000_pat_slide_switch.click()
      await Utils.sleep(500)
      
      // 步骤4：点击【ActionSheet: autoCancel_True】
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet_auto_cancel_true'), 500)
      await button_action_sheet.click()
      await Utils.sleep(500)

      // 模拟锁屏操作(按电源键)
      await driver.triggerKey(26) // 26是电源键的keycode
      await Utils.sleep(1000)
      
      // 模拟解锁操作(再次按电源键)
      await driver.triggerKey(26)
      await Utils.sleep(1000)

      // 步骤6：退出动画过程中，锁屏后再解锁
      // 点击遮蔽层触发退出动画
      await driver.click(100, 100)
      await Utils.sleep(500)
      
      // 在退出动画过程中锁屏
      await Utils.sleep(2000)
      
      // 模拟锁屏操作(按电源键)
      await driver.triggerKey(26)
      await Utils.sleep(1000)
      
      // 模拟解锁操作(再次按电源键)
      await driver.triggerKey(26)
      await Utils.sleep(1000)
      
      // 预期结果6：锁屏后弹窗ActionSheet的退出动效继续播放
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0510 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0400
     * @tc.name   : Popupbox specifications transition
     * @tc.desc   : Verify popupbox specifications transition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0400', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0400 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/animation/SpecificationsTransition/SpecificationsTransition0400')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击【Duration_10000_Index】
      let button_duration_10000_index = await driver.waitForComponent(ON.id('button_duration_10000_index'), 500)
      await button_duration_10000_index.click()
      await Utils.sleep(500)
      
      // 步骤3：点击【Duration_10000_Asymmetric】
      let button_duration_10000_asymmetric = await driver.waitForComponent(ON.id('button_duration_10000_asymmetric'), 500)
      await button_duration_10000_asymmetric.click()
      await Utils.sleep(500)
      
      // 步骤4：点击【ActionSheet: autoCancel_True】
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet_auto_cancel_true'), 500)
      await button_action_sheet.click()
      await Utils.sleep(500)
      
      // 步骤5：弹出动画过程中，点击【AlertDialog: autoCancel_True】按钮
      // 等待2秒让动画开始播放(但不等动画完成，因为动画持续10000ms)
      await Utils.sleep(2000)
      let button_alert_dialog = await driver.waitForComponent(ON.id('button_alert_dialog_auto_cancel_true'), 500)
      await button_alert_dialog.click()
      await Utils.sleep(500)

      
      // 关闭AlertDialog
      await driver.click(100, 100)
      await Utils.sleep(1000)
      
      // 步骤6：再次触发ActionSheet，在退出动画过程中点击【AlertDialog: autoCancel_True】按钮
      await button_action_sheet.click()
      await Utils.sleep(500)
      
      // 点击遮蔽层触发退出动画
      await driver.click(100, 100)
      await Utils.sleep(500)
      
      // 在退出动画过程中点击AlertDialog按钮
      await Utils.sleep(2000)
      await button_alert_dialog.click()
      await Utils.sleep(500)
      
      // 预期结果6：弹窗ActionSheet退出动效正常播放，弹窗AlertDialog正常弹出
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0400 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0490
     * @tc.name   : Popupbox specifications transition
     * @tc.desc   : Verify popupbox specifications transition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0490', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0490 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/animation/SpecificationsTransition/SpecificationsTransition0490')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击【Duration_10000_Index】
      let button_duration_10000_index = await driver.waitForComponent(ON.id('button_duration_10000_index'), 500)
      await button_duration_10000_index.click()
      await Utils.sleep(500)
      
      // 步骤3：点击【Duration_10000_pat_SLIDE】
      let button_duration_10000_pat_slide = await driver.waitForComponent(ON.id('button_duration_10000_pat_slide'), 500)
      await button_duration_10000_pat_slide.click()
      await Utils.sleep(500)
      
      // 步骤4：点击【ActionSheet: autoCancel_True】
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet_auto_cancel_true'), 500)
      await button_action_sheet.click()
      await Utils.sleep(500)
      
      // 步骤5：弹出动画过程中，点击【AlertDialog: autoCancel_True】按钮
      // 等待2秒让动画开始播放(但不等动画完成，因为动画持续10000ms)
      await Utils.sleep(2000)
      let button_alert_dialog = await driver.waitForComponent(ON.id('button_alert_dialog_auto_cancel_true'), 500)
      await button_alert_dialog.click()
      await Utils.sleep(500)

      // 关闭AlertDialog
      await driver.click(100, 100)
      await Utils.sleep(1000)
      
      // 步骤6：再次触发ActionSheet，在退出动画过程中点击【AlertDialog: autoCancel_True】按钮
      await button_action_sheet.click()
      await Utils.sleep(500)
      
      // 点击遮蔽层触发退出动画
      await driver.click(100, 100)
      await Utils.sleep(500)
      
      // 在退出动画过程中点击AlertDialog按钮
      await Utils.sleep(2000)
      await button_alert_dialog.click()
      await Utils.sleep(500)
      
      // 预期结果6：弹窗ActionSheet退出动效正常播放，弹窗AlertDialog正常弹出
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0490 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0380
     * @tc.name   : Popupbox specifications transition
     * @tc.desc   : Verify popupbox specifications transition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0380', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0380 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/animation/SpecificationsTransition/SpecificationsTransition0380')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击【Duration_10000_Index】
      let button_duration_10000_index = await driver.waitForComponent(ON.id('button_duration_10000_index'), 500)
      await button_duration_10000_index.click()
      await Utils.sleep(500)
      
      // 步骤3：点击【Duration_10000_pat_SLIDE】
      let button_duration_10000_pat_slide = await driver.waitForComponent(ON.id('button_duration_10000_pat_slide'), 500)
      await button_duration_10000_pat_slide.click()
      await Utils.sleep(500)
      
      // 步骤4：点击【ActionSheet: autoCancel_True】
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet_auto_cancel_true'), 500)
      await button_action_sheet.click()
      await Utils.sleep(500)

      // 步骤5：左/右滑/点击遮蔽层/button按钮
      await driver.click(100, 100)
      await Utils.sleep(500)
      
      // 预期结果5：弹窗消失，消失动画正常播放，持续时间10000ms
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0380 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0420
     * @tc.name   : Popupbox specifications transition
     * @tc.desc   : Verify popupbox specifications transition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0420', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0420 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/animation/SpecificationsTransition/SpecificationsTransition0420')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击【Duration_10000_Index】
      let button_duration_10000_index = await driver.waitForComponent(ON.id('button_duration_10000_index'), 500)
      await button_duration_10000_index.click()
      await Utils.sleep(500)
      
      // 步骤3：点击【Duration_10000_Move】
      let button_duration_10000_move = await driver.waitForComponent(ON.id('button_duration_10000_move'), 500)
      await button_duration_10000_move.click()
      await Utils.sleep(500)
      
      // 步骤4：点击【ActionSheet: autoCancel_True】
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet_auto_cancel_true'), 500)
      await button_action_sheet.click()
      await Utils.sleep(500)

      // 步骤5：弹出动画过程中，点击【AlertDialog: autoCancel_True】按钮
      // 等待2秒让动画开始播放(但不等动画完成，因为动画持续10000ms)
      await Utils.sleep(2000)
      let button_alert_dialog = await driver.waitForComponent(ON.id('button_alert_dialog_auto_cancel_true'), 500)
      await button_alert_dialog.click()
      await Utils.sleep(500)
      
      // 关闭AlertDialog
      await driver.click(100, 100)
      await Utils.sleep(1000)
      
      // 步骤6：再次触发ActionSheet，在退出动画过程中点击【AlertDialog: autoCancel_True】按钮
      await button_action_sheet.click()
      await Utils.sleep(500)

      // 点击遮蔽层触发退出动画
      await driver.click(100, 100)
      await Utils.sleep(500)
      
      // 在退出动画过程中点击AlertDialog按钮
      await Utils.sleep(2000)
      await button_alert_dialog.click()
      await Utils.sleep(500)
      
      // 预期结果6：弹窗ActionSheet退出动效正常播放，弹窗AlertDialog正常弹出
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0420 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0290
     * @tc.name   : Popupbox specifications transition
     * @tc.desc   : Verify popupbox specifications transition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0290', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0290 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/animation/SpecificationsTransition/SpecificationsTransition0290')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击【Duration_10000_Index】
      let button_duration_10000_index = await driver.waitForComponent(ON.id('button_duration_10000_index'), 500)
      await button_duration_10000_index.click()
      await Utils.sleep(500)
      
      // 步骤3：点击【Duration_10000_Asymmetric】
      let button_duration_10000_asymmetric = await driver.waitForComponent(ON.id('button_duration_10000_asymmetric'), 500)
      await button_duration_10000_asymmetric.click()
      await Utils.sleep(500)
      
      // 步骤4：点击【ActionSheet: autoCancel_True】
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet_auto_cancel_true'), 500)
      await button_action_sheet.click()
      await Utils.sleep(500)

      // 步骤5：左/右滑/点击遮蔽层/button按钮
      await driver.click(100, 100)
      await Utils.sleep(500)
      
      // 预期结果5：弹窗消失，消失动画正常播放，持续时间10000ms
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0290 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0530
     * @tc.name   : Popupbox specifications transition
     * @tc.desc   : Verify popupbox specifications transition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0530', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0530 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/animation/SpecificationsTransition/SpecificationsTransition0530')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击【Duration_10000_Index】
      let button_duration_10000_index = await driver.waitForComponent(ON.id('button_duration_10000_index'), 500)
      await button_duration_10000_index.click()
      await Utils.sleep(500)
      
      // 步骤3：点击【Duration_10000_Asymmetric】
      let button_duration_10000_asymmetric = await driver.waitForComponent(ON.id('button_duration_10000_asymmetric'), 500)
      await button_duration_10000_asymmetric.click()
      await Utils.sleep(500)
      
      // 步骤4：点击【ActionSheet: autoCancel_True】
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet_auto_cancel_true'), 500)
      await button_action_sheet.click()
      await Utils.sleep(500)
      
      // 步骤5：弹出动画过程中，点击back键
      // 等待2秒让动画开始播放(但不等动画完成，因为动画持续10000ms)
      await Utils.sleep(2000)
      await driver.triggerKey(2) // 2是Back键的keycode
      await Utils.sleep(500)
      
      // 步骤6：再次点击back键
      await driver.triggerKey(2)
      await Utils.sleep(500)
      
      // 步骤7：再次点击back键
      await driver.triggerKey(2)
      await Utils.sleep(500)
      
      // 预期结果7：应用返回上一级
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0530 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0560
     * @tc.name   : Popupbox specifications transition
     * @tc.desc   : Verify popupbox specifications transition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0560', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0560 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/animation/SpecificationsTransition/SpecificationsTransition0560')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击【playMode_Duration_2000】
      let button_playmode_duration_2000 = await driver.waitForComponent(ON.id('playmode_duration_2000'), 500)
      await button_playmode_duration_2000.click()
      await Utils.sleep(500)
      
      // 步骤3：点击【Duration_2000_Asymmetric】
      let button_duration_2000_asymmetric = await driver.waitForComponent(ON.id('button_duration_2000_asymmetric'), 500)
      await button_duration_2000_asymmetric.click()
      await Utils.sleep(500)
      
      // 步骤4：点击【ActionSheet: autoCancel_True】
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet_auto_cancel_true'), 500)
      await button_action_sheet.click()
      await Utils.sleep(500)
      
      // 预期结果4：反向弹出ActionSheet
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0560 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0360
     * @tc.name   : Popupbox specifications transition
     * @tc.desc   : Verify popupbox specifications transition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0360', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0360 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/animation/SpecificationsTransition/SpecificationsTransition0360')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击【Duration_10000_Index】
      let button_duration_10000_index = await driver.waitForComponent(ON.id('button_duration_10000_index'), 500)
      await button_duration_10000_index.click()
      await Utils.sleep(500)
      
      // 步骤3：点击【Duration_10000_pat_IDENTITY】
      let button_duration_10000_pat_identity = await driver.waitForComponent(ON.id('button_duration_10000_pat_identity'), 500)
      await button_duration_10000_pat_identity.click()
      await Utils.sleep(500)
      
      // 步骤4：点击【ActionSheet: autoCancel_True】
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet_auto_cancel_true'), 500)
      await button_action_sheet.click()
      await Utils.sleep(500)

      // 步骤5：左/右滑/点击遮蔽层/button按钮
      await driver.click(100, 100)
      await Utils.sleep(500)
      
      // 预期结果5：弹窗消失，消失动画正常播放，持续时间10000ms
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0360 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0440
     * @tc.name   : Popupbox specifications transition
     * @tc.desc   : Verify popupbox specifications transition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0440', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0440 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/animation/SpecificationsTransition/SpecificationsTransition0440')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击【Duration_10000_Index】
      let button_duration_10000_index = await driver.waitForComponent(ON.id('button_duration_10000_index'), 500)
      await button_duration_10000_index.click()
      await Utils.sleep(500)
      
      // 步骤3：点击【Duration_10000_Rotate】
      let button_duration_10000_rotate = await driver.waitForComponent(ON.id('button_duration_10000_rotate'), 500)
      await button_duration_10000_rotate.click()
      await Utils.sleep(500)
      
      // 步骤4：点击【ActionSheet: autoCancel_True】
      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet_auto_cancel_true'), 500)
      await button_action_sheet.click()
      await Utils.sleep(500)
      
      // 步骤5：弹出动画过程中，点击【AlertDialog: autoCancel_True】按钮
      // 等待2秒让动画开始播放(但不等动画完成，因为动画持续10000ms)
      await Utils.sleep(2000)
      let button_alert_dialog = await driver.waitForComponent(ON.id('button_alert_dialog_auto_cancel_true'), 500)
      await button_alert_dialog.click()
      await Utils.sleep(500)
      
      // 关闭AlertDialog
      await driver.click(100, 100)
      await Utils.sleep(1000)
      
      // 步骤6：再次触发ActionSheet，在退出动画过程中点击【AlertDialog: autoCancel_True】按钮
      await button_action_sheet.click()
      await Utils.sleep(500)
      
      // 点击遮蔽层触发退出动画
      await driver.click(100, 100)
      await Utils.sleep(500)
      
      // 在退出动画过程中点击AlertDialog按钮
      await Utils.sleep(2000)
      await button_alert_dialog.click()
      await Utils.sleep(500)
      
      // 预期结果6：弹窗ActionSheet退出动效正常播放，弹窗AlertDialog正常弹出
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0440 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0540
     * @tc.name   : Popupbox specifications transition
     * @tc.desc   : Verify popupbox specifications transition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0540', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0540 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/animation/SpecificationsTransition/SpecificationsTransition0540')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击【不设置】
      let button_no_set = await driver.waitForComponent(ON.id('button_duration_10000_index'), 500)
      await button_no_set.click()
      await Utils.sleep(500)
      
      // 步骤3：点击【ActionSheet】
      let button_no_transition = await driver.waitForComponent(ON.id('button_no_transition'), 500)
      await button_no_transition.click()
      await Utils.sleep(500)

      let button_action_sheet = await driver.waitForComponent(ON.id('button_action_sheet'), 500)
      await button_action_sheet.click()
      await Utils.sleep(500)
      
      // 步骤4：左/右滑/点击遮蔽层/button按钮
      await driver.click(100, 100)
      await Utils.sleep(500)
      
      // 预期结果5：弹窗消失，使用默认消失动画
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0540 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0040
     * @tc.name   : Popupbox specifications transition
     * @tc.desc   : Verify popupbox specifications transition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0040 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/animation/SpecificationsTransition/SpecificationsTransition0040')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击【Duration_10000_Index】
      let button_duration_10000_index = await driver.waitForComponent(ON.id('button_duration_10000_index'), 500)
      await button_duration_10000_index.click()
      await Utils.sleep(500)
      
      // 步骤3：点击【Duration_10000_Opacity】
      let button_duration_10000_opacity = await driver.waitForComponent(ON.id('button_duration_10000_opacity'), 500)
      await button_duration_10000_opacity.click()
      await Utils.sleep(500)
      
      // 步骤4：点击【AlertDialog: autoCancel_True】
      let button_alert_dialog = await driver.waitForComponent(ON.id('button_alert_dialog_auto_cancel_true'), 500)
      await button_alert_dialog.click()
      await Utils.sleep(500)

      // 步骤5：左/右滑/点击遮蔽层/button按钮
      await driver.click(100, 100)
      await Utils.sleep(500)
      
      // 预期结果5：弹窗消失，消失动画正常播放，持续时间10000ms
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0040 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0070
     * @tc.name   : Popupbox specifications transition
     * @tc.desc   : Verify popupbox specifications transition interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0070 start.`);
      // 步骤1：启动应用
      Settings.createWindow('testability/pages/scenario/animation/SpecificationsTransition/SpecificationsTransition0070')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      
      // 步骤2：点击【Duration_10000_Index】
      let button_duration_10000_index = await driver.waitForComponent(ON.id('button_duration_10000_index'), 500)
      await button_duration_10000_index.click()
      await Utils.sleep(500)
      
      // 步骤3：点击【Duration_10000_Translate】
      let button_duration_10000_translate = await driver.waitForComponent(ON.id('button_duration_10000_translate'), 500)
      await button_duration_10000_translate.click()
      await Utils.sleep(500)
      
      // 步骤4：点击【AlertDialog: autoCancel_True】
      let button_alert_dialog = await driver.waitForComponent(ON.id('button_alert_dialog_auto_cancel_true'), 500)
      await button_alert_dialog.click()
      await Utils.sleep(500)
      
      // 步骤5：左/右滑/点击遮蔽层/button按钮
      await driver.click(100, 100)
      await Utils.sleep(500)
      
      // 预期结果5：弹窗消失，消失动画正常播放，持续时间10000ms
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_SPECIFICATIONS_TRANSITION_0070 finish.`);
      done()
    })

  })
}