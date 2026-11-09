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

export default function commonAttrFocusgroup() {

  describe('commonAttrFocusgroup', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_0100
     * @tc.name   : When focusScopeId is dynamically changed to either a valid or invalid ID while isGroup is true, the focus group takes effect.
     * @tc.desc   : Verify commonattr focusgroup interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_0100 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrFocusgroup/CommonAttrFocusgroup0100')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：按tab键进行走焦，首次获焦为"defaultFocus：true"按钮
      await driver.triggerKey(2049) // Tab键
      await Utils.sleep(500)

      // 步骤3：继续按tab键，走焦到焦点组1只有第一个button可获焦
      await driver.triggerKey(2049) // Tab键
      await Utils.sleep(500)

      // 步骤4：再次按tab键，焦点跳出焦点组，走焦到下一非焦点组组件
      await driver.triggerKey(2049) // Tab键
      await Utils.sleep(500)

      // 步骤5：按方向键在焦点组内走焦
      await driver.triggerKey(2013) // 向下方向键
      await Utils.sleep(500)
      await driver.triggerKey(2012) // 向上方向键
      await Utils.sleep(500)

      // 步骤6：点击"更改第一个焦点组的id"按钮，值改为undefined
      let changeIdBtn = await driver.waitForComponent(ON.id('commonattr_focusgroup_0100_change_id'), 500)
      await changeIdBtn.click()
      await Utils.sleep(500)

      // 步骤7：按tab键，页面组件依次走焦
      await driver.triggerKey(2049) // Tab键
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键
      await Utils.sleep(500)

      // 步骤8：按方向键可正常走焦
      await driver.triggerKey(2013) // 向下方向键
      await Utils.sleep(500)

      // 步骤9：点击"更改第一个焦点组的id"按钮，值改为null
      await changeIdBtn.click()
      await Utils.sleep(500)

      // 步骤10：按tab键，页面组件依次走焦
      await driver.triggerKey(2049) // Tab键
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键
      await Utils.sleep(500)

      // 步骤11：按方向键可正常走焦
      await driver.triggerKey(2013) // 向下方向键
      await Utils.sleep(500)

      // 步骤12：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_0100 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_0200
     * @tc.name   : When focusScopeId is a normal value and isGroup is dynamically changed to true or false, the focus group takes effect accordingly.
     * @tc.desc   : Verify commonattr focusgroup interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_0200', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_0200 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrFocusgroup/CommonAttrFocusgroup0200')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：按tab键进行走焦，焦点组只有第一个button可获焦
      await driver.triggerKey(2049) // Tab键
      await Utils.sleep(500)

      // 步骤3：再次按tab键，焦点跳出焦点组，走焦到下一非焦点组组件
      await driver.triggerKey(2049) // Tab键
      await Utils.sleep(500)

      // 步骤4：按方向键在焦点组内走焦
      await driver.triggerKey(2013) // 向下方向键
      await Utils.sleep(500)
      await driver.triggerKey(2012) // 向上方向键
      await Utils.sleep(500)

      // 步骤5：点击"更改第一个焦点组的isGroup"按钮，值改为false
      let changeIsGroupBtn = await driver.waitForComponent(ON.id('commonattr_focusgroup_0200_change_isgroup'), 500)
      await changeIsGroupBtn.click()
      await Utils.sleep(500)

      // 步骤6：按tab键，页面组件依次走焦
      await driver.triggerKey(2049) // Tab键
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键
      await Utils.sleep(500)
      await driver.triggerKey(2049) // Tab键
      await Utils.sleep(500)

      // 步骤7：按方向键可正常走焦
      await driver.triggerKey(2013) // 向下方向键
      await Utils.sleep(500)
      await driver.triggerKey(2012) // 向上方向键
      await Utils.sleep(500)

      // 步骤8：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_0200 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_0300
     * @tc.name   : When focusScopeId is set to a duplicate value and isGroup is true, the later focus group with the same ID does not take effect.
     * @tc.desc   : Verify commonattr focusgroup interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_0300', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_0300 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrFocusgroup/CommonAttrFocusgroup0300')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击"更改第一个焦点组的id:focusGroup1"按钮，变为"更改第一个焦点组的id:focusGroup2"
      let changeIdBtn = await driver.waitForComponent(ON.id('commonattr_focusgroup_0300_change_id'), 500)
      await changeIdBtn.click()
      await Utils.sleep(500)

      // 步骤3：按tab键走焦，将焦点框从焦点组1一直走焦到焦点组2
      await driver.triggerKey(2049) // Tab键 - 走焦到焦点组1
      await Utils.sleep(500)

      await driver.triggerKey(2049) // Tab键 - 走焦到焦点组2的btn1
      await Utils.sleep(500)

      // 步骤4：焦点组2三个按钮未形成焦点组，走焦顺序为btn1 -> btn2 -> btn3
      await driver.triggerKey(2049) // Tab键 - 走焦到焦点组2的btn2
      await Utils.sleep(500)

      await driver.triggerKey(2049) // Tab键 - 走焦到焦点组2的btn3
      await Utils.sleep(500)

      // 步骤5：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_0300 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_0400
     * @tc.name   : In split mode, pressing Tab key navigates focus from navdestination to navbar across pages.
     * @tc.desc   : Verify commonattr focusgroup interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_0400', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_0400 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrFocusgroup/CommonAttrFocusgroup0400')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击"双栏"按钮切换为双栏模式
      let doubleBtn = await driver.waitForComponent(ON.id('commonattr_focusgroup_0400_double'), 500)
      await doubleBtn.click()
      await Utils.sleep(500)

      // 步骤3：点击"pushPageOne"进入PageOne页面
      let pushPageOneBtn = await driver.waitForComponent(ON.id('commonattr_focusgroup_0400_push_pageone'), 500)
      await pushPageOneBtn.click()
      await Utils.sleep(500)

      // 步骤4：点击"pushPageOneTmp"进入PageOneTmp页面
      let pushPageOneTmpBtn = await driver.waitForComponent(ON.id('commonattr_focusgroup_0400_push_pageonetmp'), 500)
      await pushPageOneTmpBtn.click()
      await Utils.sleep(500)

      // 步骤5：按tab键，PageOneTmp页面上首个组件btn1组件获焦
      await driver.triggerKey(2049) // Tab键
      await Utils.sleep(500)

      // 步骤6：按tab键，从焦点组走焦到非焦点组组件上，btn3组件获焦显示焦点框
      await driver.triggerKey(2049) // Tab键
      await Utils.sleep(500)

      // 步骤7：按tab键，可走焦到PageOne页面，焦点组1的btn1上面
      await driver.triggerKey(2049) // Tab键
      await Utils.sleep(500)

      // 步骤8：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_0400 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_0500
     * @tc.name   : Cross focus group navigation, another focus group has a previously focused node, no default focus component.
     * @tc.desc   : Verify commonattr focusgroup interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_0500', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_0500 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrFocusgroup/CommonAttrFocusgroup0500')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：焦点组4中，点击"btn2"按钮
      let group4Btn2 = await driver.waitForComponent(ON.id('commonattr_focusgroup_0500_group4_btn2'), 500)
      await group4Btn2.click()
      await Utils.sleep(500)

      // 步骤3：一直点击tab键进行循环走焦，走到焦点组1
      await driver.triggerKey(2049) // Tab键 - 走焦到焦点组1
      await Utils.sleep(500)

      // 步骤4：继续按tab键走焦到焦点组2
      await driver.triggerKey(2049) // Tab键 - 走焦到焦点组2
      await Utils.sleep(500)

      // 步骤5：继续按tab键走焦到焦点组3
      await driver.triggerKey(2049) // Tab键 - 走焦到焦点组3
      await Utils.sleep(500)

      // 步骤6：继续按tab键走焦到焦点组4，btn2获焦（上次获焦的节点）
      await driver.triggerKey(2049) // Tab键 - 走焦到焦点组4的btn2
      await Utils.sleep(500)

      // 步骤7：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_0500 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_0600
     * @tc.name   : Cross focus group navigation, another focus group has a previously focused node, with default focus component.
     * @tc.desc   : Verify commonattr focusgroup interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_0600', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_0600 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrFocusgroup/CommonAttrFocusgroup0600')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：焦点组6中，点击"btn2"按钮
      let group6Btn2 = await driver.waitForComponent(ON.id('commonattr_focusgroup_0600_group6_btn2'), 500)
      await group6Btn2.click()
      await Utils.sleep(500)

      // 步骤3：一直点击tab键进行循环走焦，走到焦点组1
      await driver.triggerKey(2049) // Tab键 - 走焦到焦点组1
      await Utils.sleep(500)

      // 步骤4：继续按tab键走焦到焦点组2
      await driver.triggerKey(2049) // Tab键 - 走焦到焦点组2
      await Utils.sleep(500)

      // 步骤5：继续按tab键走焦到焦点组3
      await driver.triggerKey(2049) // Tab键 - 走焦到焦点组3
      await Utils.sleep(500)

      // 步骤6：继续按tab键走焦到焦点组4
      await driver.triggerKey(2049) // Tab键 - 走焦到焦点组4
      await Utils.sleep(500)

      // 步骤7：继续按tab键走焦到焦点组5
      await driver.triggerKey(2049) // Tab键 - 走焦到焦点组5
      await Utils.sleep(500)

      // 步骤8：继续按tab键走焦到焦点组6，btn2获焦（上次获焦的节点）
      await driver.triggerKey(2049) // Tab键 - 走焦到焦点组6的btn2
      await Utils.sleep(500)

      // 步骤9：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_0600 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_0700
     * @tc.name   : Cross focus group navigation, another focus group has no previously focused node, no default focus component.
     * @tc.desc   : Verify commonattr focusgroup interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_0700', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_0700 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrFocusgroup/CommonAttrFocusgroup0700')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击"pushPageOne"按钮，进入PageOne页面
      let pushPageOneBtn = await driver.waitForComponent(ON.id('commonattr_focusgroup_0700_push_pageone'), 500)
      await pushPageOneBtn.click()
      await Utils.sleep(500)

      // 步骤3：按tab键进行循环走焦，获焦顺序：返回按钮→btn1→btn3→返回按钮
      await driver.triggerKey(2049) // Tab键 - 走焦到返回按钮
      await Utils.sleep(500)

      await driver.triggerKey(2049) // Tab键 - 走焦到焦点组1的btn1
      await Utils.sleep(500)

      await driver.triggerKey(2049) // Tab键 - 走焦到焦点组2的btn3
      await Utils.sleep(500)

      await driver.triggerKey(2049) // Tab键 - 走焦回到返回按钮，循环走焦
      await Utils.sleep(500)

      // 步骤4：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_0700 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_0800
     * @tc.name   : Cross focus group navigation, another focus group has no previously focused node, with default focus component.
     * @tc.desc   : Verify commonattr focusgroup interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_0800', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_0800 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrFocusgroup/CommonAttrFocusgroup0800')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：进入页面按tab键，走焦到焦点组6中，"defaultFocus:true"按钮获焦
      await driver.triggerKey(2049) // Tab键 - 走焦到焦点组6的defaultFocus:true按钮
      await Utils.sleep(500)

      // 步骤3：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_0800 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_0900
     * @tc.name   : Mixed focus navigation between focus group and non-focus group, no default focus component in focus group.
     * @tc.desc   : Verify commonattr focusgroup interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_0900', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_0900 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrFocusgroup/CommonAttrFocusgroup0900')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：进入页面连续点击tab键，焦点从非焦点组button1走焦
      await driver.triggerKey(2049) // Tab键 - 走焦到非焦点组button1
      await Utils.sleep(500)

      // 步骤3：继续按tab键走焦到焦点组1
      await driver.triggerKey(2049) // Tab键 - 走焦到焦点组1的btn1
      await Utils.sleep(500)

      // 步骤4：继续按tab键走焦到焦点组2
      await driver.triggerKey(2049) // Tab键 - 走焦到焦点组2的btn1
      await Utils.sleep(500)

      // 步骤5：继续按tab键走焦到焦点组3
      await driver.triggerKey(2049) // Tab键 - 走焦到焦点组3的btn1
      await Utils.sleep(500)

      // 步骤6：继续按tab键走焦到焦点组4的btn1
      await driver.triggerKey(2049) // Tab键 - 走焦到焦点组4的btn1
      await Utils.sleep(500)

      // 步骤7：继续按tab键走焦到"隐藏"按钮
      await driver.triggerKey(2049) // Tab键 - 走焦到隐藏按钮
      await Utils.sleep(500)

      // 步骤8：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_0900 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_1000
     * @tc.name   : Focus group has no focusable child component, parent container component is focusable.
     * @tc.desc   : Verify commonattr focusgroup interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_1000', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_1000 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrFocusgroup/CommonAttrFocusgroup1000')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：进入页面按tab键走焦到焦点组1
      await driver.triggerKey(2049) // Tab键 - 走焦到焦点组1的btn1
      await Utils.sleep(500)

      // 步骤3：继续按tab键走焦到焦点组2
      await driver.triggerKey(2049) // Tab键 - 走焦到焦点组2的btn1
      await Utils.sleep(500)

      // 步骤4：继续按tab键，跳过焦点组3（123不可获焦），走焦到焦点组4
      await driver.triggerKey(2049) // Tab键 - 跳过焦点组3，走焦到焦点组4的btn1
      await Utils.sleep(500)

      // 步骤5：继续按tab键循环走焦回到焦点组1
      await driver.triggerKey(2049) // Tab键 - 走焦回到焦点组1
      await Utils.sleep(500)

      // 步骤6：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_1000 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_1100
     * @tc.name   : Delete focus group and check focus navigation with Tab key.
     * @tc.desc   : Verify commonattr focusgroup interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_1100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_1100 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrFocusgroup/CommonAttrFocusgroup1100')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击"del"按钮删除焦点组2
      let delBtn = await driver.waitForComponent(ON.id('commonattr_focusgroup_1100_del_btn'), 500)
      await delBtn.click()
      await Utils.sleep(500)

      // 步骤3：按tab键走焦，已删除的焦点组不会获焦
      await driver.triggerKey(2049) // Tab键 - 走焦到焦点组1的btn1
      await Utils.sleep(500)

      // 步骤4：继续按tab键走焦到焦点组3（跳过已删除的焦点组2）
      await driver.triggerKey(2049) // Tab键 - 走焦到焦点组3的btn1
      await Utils.sleep(500)

      // 步骤5：继续按tab键走焦到del按钮
      await driver.triggerKey(2049) // Tab键 - 走焦到del按钮
      await Utils.sleep(500)

      // 步骤6：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_1100 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_1200
     * @tc.name   : Focus group is invisible, check focus navigation with Tab key.
     * @tc.desc   : Verify commonattr focusgroup interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_1200', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_1200 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrFocusgroup/CommonAttrFocusgroup1200')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击"隐藏"按钮，焦点组4不可见
      let hideBtn = await driver.waitForComponent(ON.id('commonattr_focusgroup_1200_hide_btn'), 500)
      await hideBtn.click()
      await Utils.sleep(500)

      // 步骤3：按tab键走焦到焦点组1
      await driver.triggerKey(2049) // Tab键 - 走焦到焦点组1的btn1
      await Utils.sleep(500)

      // 步骤4：继续按tab键走焦到焦点组2
      await driver.triggerKey(2049) // Tab键 - 走焦到焦点组2的btn1
      await Utils.sleep(500)

      // 步骤5：继续按tab键走焦到焦点组3
      await driver.triggerKey(2049) // Tab键 - 走焦到焦点组3的btn1
      await Utils.sleep(500)

      // 步骤6：继续按tab键，跳过不可见的焦点组4，走焦到隐藏按钮
      await driver.triggerKey(2049) // Tab键 - 跳过焦点组4，走焦到隐藏按钮
      await Utils.sleep(500)

      // 步骤7：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_1200 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_1300
     * @tc.name   : Focus group component sets tabIndex, navigate according to tabIndex order.
     * @tc.desc   : Verify commonattr focusgroup interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_1300', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_1300 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrFocusgroup/CommonAttrFocusgroup1300')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：按tab键走焦，按照tabIndex顺序：焦点组2btn1（tabIndex:1）
      await driver.triggerKey(2049) // Tab键 - 走焦到焦点组2的btn1
      await Utils.sleep(500)

      // 步骤3：继续按tab键走焦到焦点组1btn1（tabIndex:2）
      await driver.triggerKey(2049) // Tab键 - 走焦到焦点组1的btn1
      await Utils.sleep(500)

      // 步骤4：继续按tab键走焦到焦点组3btn1（tabIndex:3）
      await driver.triggerKey(2049) // Tab键 - 走焦到焦点组3的btn1
      await Utils.sleep(500)

      // 步骤5：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_1300 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_1400
     * @tc.name   : Focus group inner component sets focusBox to change focus box style.
     * @tc.desc   : Verify commonattr focusgroup interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_1400', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_1400 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrFocusgroup/CommonAttrFocusgroup1400')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击"pushPageOne"按钮，进入PageOne页面
      let pushPageOneBtn = await driver.waitForComponent(ON.id('commonattr_focusgroup_1400_push_pageone'), 500)
      await pushPageOneBtn.click()
      await Utils.sleep(500)

      // 步骤3：按tab键进行循环走焦，焦点框为红色
      await driver.triggerKey(2049) // Tab键 - 走焦到焦点组1的btn1（红色焦点框）
      await Utils.sleep(500)

      // 步骤4：继续按tab键走焦到焦点组2
      await driver.triggerKey(2049) // Tab键 - 走焦到焦点组2的btn3（红色焦点框）
      await Utils.sleep(500)

      // 步骤5：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_1400 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_1500
     * @tc.name   : Click blank area to call clearFocus, clear focus.
     * @tc.desc   : Verify commonattr focusgroup interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_1500', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_1500 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrFocusgroup/CommonAttrFocusgroup1500')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：进入页面按tab键
      await driver.triggerKey(2049) // Tab键 - 走焦到焦点组1的btn1
      await Utils.sleep(500)

      // 步骤3：点击"clearFocus"按钮清除焦点
      let clearFocusBtn = await driver.waitForComponent(ON.id('commonattr_focusgroup_1500_clear_focus_btn'), 500)
      await clearFocusBtn.click()
      await Utils.sleep(500)

      // 步骤4：再按tab键，"clearFocus"按钮获焦
      await driver.triggerKey(2049) // Tab键 - clearFocus按钮获焦
      await Utils.sleep(500)

      // 步骤5：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_1500 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_1600
     * @tc.name   : Non-subwindow calls Menu, MenuGroup is set as focus group, navigate with Tab key.
     * @tc.desc   : Verify commonattr focusgroup interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_1600', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_1600 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrFocusgroup/CommonAttrFocusgroup1600')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击bindMenu按钮打开菜单
      let bindMenuBtn = await driver.waitForComponent(ON.id('commonattr_focusgroup_1600_bind_menu'), 500)
      await bindMenuBtn.click()
      await Utils.sleep(500)

      // 步骤3：按tab键走焦，MenuGroup形成焦点组，第一个菜单选项获焦
      await driver.triggerKey(2049) // Tab键 - 第一个菜单选项获焦
      await Utils.sleep(500)

      // 步骤4：继续按tab键走焦到菜单一第一项
      await driver.triggerKey(2049) // Tab键 - 走焦到菜单一第一项
      await Utils.sleep(500)

      // 步骤5：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_1600 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_1700
     * @tc.name   : Subwindow calls Menu, MenuGroup is set as focus group, navigate with Tab key.
     * @tc.desc   : Verify commonattr focusgroup interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_1700', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_1700 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrFocusgroup/CommonAttrFocusgroup1700')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击bindMenu按钮打开子窗口菜单
      let bindMenuBtn = await driver.waitForComponent(ON.id('commonattr_focusgroup_1700_bind_menu'), 500)
      await bindMenuBtn.click()
      await Utils.sleep(500)

      // 步骤3：按tab键走焦，MenuGroup形成焦点组，第一个菜单选项获焦
      await driver.triggerKey(2049) // Tab键 - 第一个菜单选项获焦
      await Utils.sleep(500)

      // 步骤4：继续按tab键走焦到菜单一第一项
      await driver.triggerKey(2049) // Tab键 - 走焦到菜单一第一项
      await Utils.sleep(500)

      // 步骤5：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_1700 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_1800
     * @tc.name   : Dialog component adds focus group, navigate with Tab key.
     * @tc.desc   : Verify commonattr focusgroup interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_1800', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_1800 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrFocusgroup/CommonAttrFocusgroup1800')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击ComponentDialog按钮打开子窗口弹窗
      let openDialogBtn = await driver.waitForComponent(ON.id('commonattr_focusgroup_1800_open_dialog'), 500)
      await openDialogBtn.click()
      await Utils.sleep(500)

      // 步骤3：按tab键走焦，走焦顺序：btn1
      await driver.triggerKey(2049) // Tab键 - 走焦到btn1
      await Utils.sleep(500)

      // 步骤4：继续按tab键走焦到TextInput
      await driver.triggerKey(2049) // Tab键 - 走焦到TextInput
      await Utils.sleep(500)

      // 步骤5：继续按tab键走焦到close
      await driver.triggerKey(2049) // Tab键 - 走焦到close
      await Utils.sleep(500)

      // 步骤6：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_1800 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_1900
     * @tc.name   : Popup component adds focus group, navigate with Tab key.
     * @tc.desc   : Verify commonattr focusgroup interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_1900', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_1900 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrFocusgroup/CommonAttrFocusgroup1900')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击CustomPopupOption1按钮打开子窗口弹窗
      let openPopupBtn = await driver.waitForComponent(ON.id('commonattr_focusgroup_1900_open_popup'), 500)
      await openPopupBtn.click()
      await Utils.sleep(500)

      // 步骤3：按tab键走焦，走焦顺序：btn1
      await driver.triggerKey(2049) // Tab键 - 走焦到btn1
      await Utils.sleep(500)

      // 步骤4：继续按tab键走焦到btn4（焦点组2的第一个按钮btn3，然后跳到btn4）
      await driver.triggerKey(2049) // Tab键 - 走焦到焦点组2的btn3
      await Utils.sleep(500)

      // 步骤5：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_1900 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_2000
     * @tc.name   : Half modal page adds focus group, navigate with Tab key in half modal panel.
     * @tc.desc   : Verify commonattr focusgroup interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_2000', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_2000 start.`);
      // 步骤1：打开页面
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrFocusgroup/CommonAttrFocusgroup2000')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)

      // 步骤2：点击bindSheet按钮打开半模态面板
      let openSheetBtn = await driver.waitForComponent(ON.id('commonattr_focusgroup_2000_open_sheet'), 500)
      await openSheetBtn.click()
      await Utils.sleep(500)

      // 步骤3：按tab键走焦，走焦顺序：btn1
      await driver.triggerKey(2049) // Tab键 - 走焦到btn1
      await Utils.sleep(500)

      // 步骤4：继续按tab键走焦到btn4（焦点组2）
      await driver.triggerKey(2049) // Tab键 - 走焦到焦点组2的btn3
      await Utils.sleep(500)

      // 步骤5：继续按tab键走焦到关闭按钮
      await driver.triggerKey(2049) // Tab键 - 走焦到关闭按钮
      await Utils.sleep(500)

      // 步骤6：继续按tab键循环走焦回到btn1
      await driver.triggerKey(2049) // Tab键 - 走焦回到btn1
      await Utils.sleep(500)

      // 步骤7：截图验证
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_2000 finish.`);
      done()
    })


  })
}