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

export default function commonAttrPriority() {

  describe('commonAttrPriority', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0010
     * @tc.name   : If a component in the focus group has only the PREVIOUS priority set, it will still receive focus when tabbing through—even on subsequent passes; the priority remains effective.
     * @tc.desc   : Verify commonattr priority interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0010', Level.LEVEL3 , async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0010 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrPriority/CommonAttrPriority0010')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：按tab键首次走焦到焦点组1上
      // 预期结果：焦点组1"FocusPriority.PREVIOUS"按钮获焦，Button1不获焦
      await driver.triggerKey(2049) // Tab键
      await Utils.sleep(500)

      // 步骤3：按tab键走焦，循环走焦一圈
      await driver.triggerKey(2049) // Tab键走焦到焦点组2
      await Utils.sleep(500)

      // 步骤4：第二次走焦到焦点组1上
      // 预期结果：焦点组1"FocusPriority.PREVIOUS"按钮获焦，Button1不获焦
      await driver.triggerKey(2049) // Tab键再次走焦到焦点组1
      await Utils.sleep(500)

      // 步骤5：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0010 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0020
     * @tc.name   : If a component in the focus group has only the PRIOR priority set, it will still receive focus when tabbing through—even on subsequent passes; the priority remains effective.
     * @tc.desc   : Verify commonattr priority interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0020', Level.LEVEL3 , async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0020 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrPriority/CommonAttrPriority0020')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：按tab键首次走焦到焦点组3上
      // 预期结果：焦点组3"FocusPriority.PRIOR"按钮获焦，Button6不获焦
      await driver.triggerKey(2049) // Tab键走焦到焦点组1
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到焦点组2
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到焦点组3
      await Utils.sleep(500)

      // 步骤3：按tab键走焦，循环走焦一圈，第二次走焦到焦点组3上
      await driver.triggerKey(2049) // Tab键走焦到焦点组4
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到焦点组1
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到焦点组2
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键再次走焦到焦点组3
      await Utils.sleep(500)

      // 步骤4：截图验证
      // 预期结果：焦点组3"FocusPriority.PRIOR"按钮获焦，Button6不获焦
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0020 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0030
     * @tc.name   : In a focus group with AUTO, PRIOR, and PREVIOUS priorities set simultaneously, the PREVIOUS component (highest priority) gets focus on the first pass, and remains focused on subsequent passes.
     * @tc.desc   : Verify commonattr priority interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0030', Level.LEVEL3 , async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0030 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrPriority/CommonAttrPriority0030')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：按tab键走焦，第一次走焦到焦点组5上
      // 预期结果：焦点组5"FocusPriority.PREVIOUS"按钮获焦，AUTO、PRIOR不获焦
      await driver.triggerKey(2049) // Tab键走焦到焦点组1
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到焦点组2
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到焦点组3
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到焦点组4
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到焦点组5
      await Utils.sleep(500)

      // 步骤3：按tab键走焦，循环走焦一圈，第二次走焦到焦点组5上
      await driver.triggerKey(2049) // Tab键走焦到焦点组6
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到焦点组1
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到焦点组2
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到焦点组3
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到焦点组4
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键再次走焦到焦点组5
      await Utils.sleep(500)

      // 步骤4：截图验证
      // 预期结果：焦点组5上"FocusPriority.PREVIOUS"按钮获焦，AUTO、PRIOR不获焦
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0030 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0040
     * @tc.name   : In a focus group with AUTO and PRIOR priorities set simultaneously, the PRIOR component (highest priority) gets focus on the first pass, but on subsequent passes the priority becomes ineffective and the first component gets focus.
     * @tc.desc   : Verify commonattr priority interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0040', Level.LEVEL3 , async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0040 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrPriority/CommonAttrPriority0040')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：按tab键走焦，第一次走焦到焦点组6上
      // 预期结果：焦点组6"FocusPriority.PRIOR"按钮获焦，AUTO不获焦
      await driver.triggerKey(2049) // Tab键走焦到焦点组1
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到焦点组2
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到焦点组3
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到焦点组4
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到焦点组5
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到焦点组6
      await Utils.sleep(500)

      // 步骤3：按tab键走焦，循环走焦一圈，第二次走焦到焦点组6上
      // 预期结果：焦点组6"FocusPriority.PRIOR"按钮获焦，AUTO不获焦
      await driver.triggerKey(2049) // Tab键走焦到焦点组4
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到焦点组5
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键再次走焦到焦点组6
      await Utils.sleep(500)

      // 步骤4：点击焦点组6中的"FocusPriority.AUTO"按钮
      let autoBtn = await driver.waitForComponent(ON.id('button_priority_0040_auto'), 500)
      await autoBtn.click()
      await Utils.sleep(500)

      // 步骤5：按tab键走焦，循环走焦一圈，第二次走焦到焦点组6上
      // 预期结果：焦点组6上"FocusPriority.AUTO"按钮获焦，然后焦点跳到焦点组7中，6中的PRIOR不获焦
      await driver.triggerKey(2049) // Tab键走焦到焦点组7
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到焦点组1
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到焦点组2
      await Utils.sleep(500)

      // 步骤6：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0040 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0050
     * @tc.name   : In a focus group with PREVIOUS, PRIOR priorities and a component without priority set, the PREVIOUS component gets focus on both first and subsequent passes.
     * @tc.desc   : Verify commonattr priority interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0050', Level.LEVEL3 , async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0050 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrPriority/CommonAttrPriority0050')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：按tab键走焦，第一次走焦到焦点组7上
      // 预期结果：焦点组7"FocusPriority.PREVIOUS"按钮获焦，不设置、PRIOR不获焦
      await driver.triggerKey(2049) // Tab键走焦到焦点组1
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到焦点组2
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到焦点组3
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到焦点组4
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到焦点组5
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到焦点组6
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到焦点组7
      await Utils.sleep(500)

      // 步骤3：按tab键走焦，循环走焦一圈，第二次走焦到焦点组7上
      // 预期结果：焦点组7上"FocusPriority.PREVIOUS"按钮获焦，不设置、PRIOR不获焦
      await driver.triggerKey(2049) // Tab键走焦到焦点组6
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键再次走焦到焦点组7
      await Utils.sleep(500)

      // 步骤4：点击焦点组7中的"不设置"按钮
      let noneBtn = await driver.waitForComponent(ON.id('button_priority_0050_none'), 500)
      await noneBtn.click()
      await Utils.sleep(500)

      // 步骤5：按tab键走焦，循环走焦一圈，第二次走焦到焦点组7上
      // 预期结果：焦点组7上"FocusPriority.PREVIOUS"按钮获焦，不设置、PRIOR不获焦
      await driver.triggerKey(2049) // Tab键走焦到焦点组8
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到焦点组1
      await Utils.sleep(500)

      // 步骤6：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0050 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0060
     * @tc.name   : In a non-focus group with only PREVIOUS priority set, the priority component gets focus on the first pass, but on subsequent passes the priority becomes ineffective.
     * @tc.desc   : Verify commonattr priority interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0060', Level.LEVEL3 , async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0060 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrPriority/CommonAttrPriority0060')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：按tab键走焦，第一次走焦到非焦点组4上
      // 预期结果：非焦点组4"FocusPriority.PREVIOUS"按钮获焦，Button7不获焦
      await driver.triggerKey(2049) // Tab键走焦到非焦点组1的Button1
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组1的Button2
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组2的Button3
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组2的Button4
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组3的Button5
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组3的Button6
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组4的FocusPriority.PREVIOUS（首次走焦优先级生效）
      await Utils.sleep(500)

      // 步骤3：按tab键走焦，循环走焦一圈，第二次走焦到非焦点组4上
      // 预期结果：非焦点组4上Button7→FocusPriority.PREVIOUS按钮依次获焦，优先级不生效
      await driver.triggerKey(2049) // Tab键走焦到非焦点组5的Button9
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组5的Button10
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组1的Button1
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组1的Button2
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组2的Button3
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组2的Button4
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组3的Button5
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组3的Button6
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组4的Button7（非首次走焦，优先级不生效）
      await Utils.sleep(500)

      // 步骤4：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0060 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0070
     * @tc.name   : In a non-focus group with only PRIOR priority set, the priority component gets focus on the first pass, but on subsequent passes the priority becomes ineffective.
     * @tc.desc   : Verify commonattr priority interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0070', Level.LEVEL3 , async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0070 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrPriority/CommonAttrPriority0070')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：按tab键走焦，第一次走焦到非焦点组2上
      // 预期结果：非焦点组2"FocusPriority.PRIOR"按钮获焦，Button5不获焦
      await driver.triggerKey(2049) // Tab键走焦到非焦点组1的Button1
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组1的Button2
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组1的Button3
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组1的Button4
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组2的FocusPriority.PRIOR（首次走焦优先级生效）
      await Utils.sleep(500)

      // 步骤3：按tab键走焦，循环走焦一圈，第二次走焦到非焦点组2上
      // 预期结果：非焦点组2上Button5→FocusPriority.PRIOR按钮依次获焦，优先级不生效
      await driver.triggerKey(2049) // Tab键走焦到非焦点组3的Button7
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组3的Button8
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组1的Button1
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组1的Button2
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组1的Button3
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组1的Button4
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组2的Button5（非首次走焦，优先级不生效）
      await Utils.sleep(500)

      // 步骤4：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0070 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0080
     * @tc.name   : In a non-focus group with AUTO, PRIOR, and PREVIOUS priorities set simultaneously, the PREVIOUS component (highest priority) gets focus on the first pass, but on subsequent passes the priority becomes ineffective.
     * @tc.desc   : Verify commonattr priority interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0080', Level.LEVEL3 , async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0080 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrPriority/CommonAttrPriority0080')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：按tab键走焦，第一次走焦到非焦点组8上
      // 预期结果：非焦点组8"FocusPriority.PREVIOUS"按钮获焦，AUTO、PRIOR不获焦
      await driver.triggerKey(2049) // Tab键走焦到非焦点组6的Button11
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组6的Button12
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组7的Button13
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组7的Button14
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组8的FocusPriority.PREVIOUS（首次走焦优先级生效）
      await Utils.sleep(500)

      // 步骤3：按tab键走焦，循环走焦一圈，第二次走焦到非焦点组8上
      // 预期结果：优先级不生效，走焦顺序为：FocusPriority.AUTO→FocusPriority.PREVIOUS→FocusPriority.PRIOR
      await driver.triggerKey(2049) // Tab键走焦到非焦点组8的FocusPriority.PRIOR
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组9的Button15
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组9的Button16
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组1的Button1
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组1的Button2
      await Utils.sleep(500)

      // 步骤4：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0080 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0090
     * @tc.name   : In a non-focus group with PRIOR, PREVIOUS priorities and a component without priority set, the PREVIOUS component (highest priority) gets focus on the first pass, but on subsequent passes the priority becomes ineffective.
     * @tc.desc   : Verify commonattr priority interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0090', Level.LEVEL3 , async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0090 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrPriority/CommonAttrPriority0090')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：按tab键走焦，第一次走焦到非焦点组9上
      // 预期结果：非焦点组9"FocusPriority.PREVIOUS"按钮获焦，不设置、PRIOR不获焦
      await driver.triggerKey(2049) // Tab键走焦到非焦点组7的Button13
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组7的Button14
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组8的Button15
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组8的Button16
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组9的FocusPriority.PREVIOUS（首次走焦优先级生效）
      await Utils.sleep(500)

      // 步骤3：按tab键走焦，循环走焦一圈，第二次走焦到非焦点组9上
      // 预期结果：优先级不生效，走焦顺序为：不设置→FocusPriority.PREVIOUS→FocusPriority.PRIOR
      await driver.triggerKey(2049) // Tab键走焦到非焦点组9的FocusPriority.PRIOR
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组10的Button17
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组10的Button18
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组1的Button1
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组1的Button2
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组2的Button3
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组2的Button4
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组3的Button5
      await Utils.sleep(500)

      // 步骤4：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0090 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0100
     * @tc.name   : In a non-focus group with two PRIOR priority components and a component without priority, the PRIOR components get focus on the first pass, but on subsequent passes the priority becomes ineffective.
     * @tc.desc   : Verify commonattr priority interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0100', Level.LEVEL3 , async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0100 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrPriority/CommonAttrPriority0100')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：按tab键走焦，第一次走焦到非焦点组12上
      // 预期结果：走焦顺序为：FocusPriority.PRIOR→FocusPriority.PRIOR，不设置按钮不获焦
      await driver.triggerKey(2049) // Tab键走焦到非焦点组9的Button17
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组9的Button18
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组10的Button19
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组10的Button20
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组11的Button21
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组11的Button22
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组12的FocusPriority.PRIOR1（首次走焦优先级生效）
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组12的FocusPriority.PRIOR2
      await Utils.sleep(500)

      // 步骤3：按tab键走焦，循环走焦一圈，第二次走焦到非焦点组12上
      // 预期结果：走焦顺序为：不设置→FocusPriority.PRIOR→FocusPriority.PRIOR
      await driver.triggerKey(2049) // Tab键走焦到非焦点组13的Button23
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组13的Button24
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组1的Button1
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组1的Button2
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组2的Button3
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组2的Button4
      await Utils.sleep(500)

      // 步骤4：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0100 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0110
     * @tc.name   : In Menu non-subwindow mode, focus navigation between focus group and non-focus group, MenuItemGroup does not support focus-related operations, focus group is ineffective.
     * @tc.desc   : Verify commonattr priority interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0110', Level.LEVEL3 , async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0110 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrPriority/CommonAttrPriority0110')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击bindMenu 非子窗口按钮，打开菜单
      let bindMenuBtn = await driver.waitForComponent(ON.id('button_priority_0110_bindmenu'), 500)
      await bindMenuBtn.click()
      await Utils.sleep(500)

      // 步骤3：按tab键走焦，第一次走焦
      // 预期结果：焦点组，非焦点组中的菜单依次走焦，焦点组不生效
      await driver.triggerKey(2049) // Tab键走焦到MenuItem1
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到MenuItem2
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到MenuItem3
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到MenuItem4
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到MenuItem5
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到MenuItem6
      await Utils.sleep(500)

      // 步骤4：按tab键走焦，循环走焦一圈，第二次走焦
      // 预期结果：焦点组，非焦点组中的菜单依次走焦，焦点组不生效
      await driver.triggerKey(2049) // Tab键走焦到MenuItem1
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到MenuItem2
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到MenuItem3
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到MenuItem4
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到MenuItem5
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到MenuItem6
      await Utils.sleep(500)

      // 步骤5：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0110 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0120
     * @tc.name   : In Menu subwindow mode, focus navigation between focus group and non-focus group, MenuItemGroup does not support focus-related operations, focus group is ineffective.
     * @tc.desc   : Verify commonattr priority interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0120', Level.LEVEL3 , async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0120 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrPriority/CommonAttrPriority0120')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击bindMenu 子窗口按钮，打开菜单
      let bindMenuBtn = await driver.waitForComponent(ON.id('button_priority_0120_bindmenu'), 500)
      await bindMenuBtn.click()
      await Utils.sleep(500)

      // 步骤3：按tab键走焦，第一次走焦
      // 预期结果：焦点组，非焦点组中的菜单依次走焦，焦点组不生效
      await driver.triggerKey(2049) // Tab键走焦到MenuItem1
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到MenuItem2
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到MenuItem3
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到MenuItem4
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到MenuItem5
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到MenuItem6
      await Utils.sleep(500)

      // 步骤4：按tab键走焦，循环走焦一圈，第二次走焦
      // 预期结果：焦点组，非焦点组中的菜单依次走焦，焦点组不生效
      await driver.triggerKey(2049) // Tab键走焦到MenuItem1
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到MenuItem2
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到MenuItem3
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到MenuItem4
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到MenuItem5
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到MenuItem6
      await Utils.sleep(500)

      // 步骤5：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0120 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0130
     * @tc.name   : In dialog component, focus navigation between focus group and non-focus group.
     * @tc.desc   : Verify commonattr priority interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0130', Level.LEVEL3 , async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0130 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrPriority/CommonAttrPriority0130')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击ComponentDialog按钮，打开对话框
      let dialogBtn = await driver.waitForComponent(ON.id('button_priority_0130_dialog'), 500)
      await dialogBtn.click()
      await Utils.sleep(500)

      // 步骤3：按tab键走焦，第一次走焦
      // 预期结果：焦点组，FocusPriority.PREVIOUS按钮获焦，非焦点组PRIOR→btn7走焦
      await driver.triggerKey(2049) // Tab键走焦到焦点组的FocusPriority.PREVIOUS
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组的FocusPriority.PRIOR（首次走焦优先级生效）
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组的btn7
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到关闭按钮
      await Utils.sleep(500)

      // 步骤4：按tab键走焦，循环走焦一圈，第二次走焦
      // 预期结果：焦点组，FocusPriority.PREVIOUS按钮获焦，非焦点组btn5→PRIOR→btn7走焦
      await driver.triggerKey(2049) // Tab键走焦到焦点组的FocusPriority.PREVIOUS
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组的btn5（非首次走焦，优先级不生效）
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组的FocusPriority.PRIOR
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组的btn7
      await Utils.sleep(500)

      // 步骤5：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0130 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0140
     * @tc.name   : In popup component, focus navigation between focus group and non-focus group.
     * @tc.desc   : Verify commonattr priority interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0140', Level.LEVEL3 , async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0140 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrPriority/CommonAttrPriority0140')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击CustomPopupOptions1按钮，打开popup
      let popupBtn = await driver.waitForComponent(ON.id('button_priority_0140_popup'), 500)
      await popupBtn.click()
      await Utils.sleep(500)

      // 步骤3：按tab键走焦，第一次走焦
      // 预期结果：焦点组FocusPriority.PREVIOUS按钮获焦，非焦点组FocusPriority.PRIOR首先走焦→btn7
      await driver.triggerKey(2049) // Tab键走焦到焦点组的FocusPriority.PREVIOUS
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组的FocusPriority.PRIOR（首次走焦优先级生效）
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组的btn7
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到关闭按钮
      await Utils.sleep(500)

      // 步骤4：按tab键走焦，循环走焦一圈，第二次走焦
      // 预期结果：焦点组FocusPriority.PREVIOUS按钮获焦，非焦点组btn5→FocusPriority.PRIOR按钮→btn7走焦
      await driver.triggerKey(2049) // Tab键走焦到焦点组的FocusPriority.PREVIOUS
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组的btn5（非首次走焦，优先级不生效）
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组的FocusPriority.PRIOR
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组的btn7
      await Utils.sleep(500)

      // 步骤5：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0140 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0150
     * @tc.name   : In half-modal component, focus navigation between focus group and non-focus group.
     * @tc.desc   : Verify commonattr priority interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0150', Level.LEVEL3 , async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0150 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrPriority/CommonAttrPriority0150')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击bindSheet按钮，打开半模态
      let sheetBtn = await driver.waitForComponent(ON.id('button_priority_0150_sheet'), 500)
      await sheetBtn.click()
      await Utils.sleep(500)

      // 步骤3：按tab键走焦，第一次走焦
      // 预期结果：焦点组FocusPriority.PREVIOUS按钮获焦，非焦点组FocusPriority.PRIOR首先走焦→btn7
      await driver.triggerKey(2049) // Tab键走焦到焦点组的FocusPriority.PREVIOUS
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组的FocusPriority.PRIOR（首次走焦优先级生效）
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组的btn7
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到关闭按钮
      await Utils.sleep(500)

      // 步骤4：按tab键走焦，循环走焦一圈，第二次走焦
      // 预期结果：焦点组FocusPriority.PREVIOUS按钮获焦，非焦点组btn5→FocusPriority.PRIOR按钮→btn7走焦
      await driver.triggerKey(2049) // Tab键走焦到焦点组的FocusPriority.PREVIOUS
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组的btn5（非首次走焦，优先级不生效）
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组的FocusPriority.PRIOR
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键走焦到非焦点组的btn7
      await Utils.sleep(500)

      // 步骤5：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0150 finish.`);
      done()
    })


  })
}