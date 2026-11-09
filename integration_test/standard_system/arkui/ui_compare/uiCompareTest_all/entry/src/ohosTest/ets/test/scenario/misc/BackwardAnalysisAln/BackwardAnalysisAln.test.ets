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

export default function backwardAnalysisAln() {

  describe('backwardAnalysisAln', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BACKWARDANALYSIS_ALN_1380
     * @tc.name   : Popupbox backwardanalysis aln
     * @tc.desc   : Verify popupbox backwardanalysis aln interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BACKWARDANALYSIS_ALN_1380', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BACKWARDANALYSIS_ALN_1380 start.`);
      // 步骤1：编译hap包并执行，打开测试页面
      Settings.createWindow('testability/pages/scenario/misc/BackwardAnalysisAln/BackwardAnalysisAln1380')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      // 步骤2：slider此时是自动切换进度
      // 步骤3：点击按钮控制显隐
      let alertDialogBtn = await driver.waitForComponent(ON.id('alertdialog_backwardanalysis_aln_1380'), 500)
      await Utils.sleep(500)
      // 截图验证slider显隐正常，显示正常
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BACKWARDANALYSIS_ALN_1380 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BACKWARDANALYSIS_ALN_1390
     * @tc.name   : Popupbox backwardanalysis aln
     * @tc.desc   : Verify popupbox backwardanalysis aln interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BACKWARDANALYSIS_ALN_1390', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BACKWARDANALYSIS_ALN_1390 start.`);
      // 步骤1：List容器中放slider组件，通过上下滑动让slider可见和不可见
      Settings.createWindow('testability/pages/scenario/misc/BackwardAnalysisAln/BackwardAnalysisAln1390')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      // 步骤2：调节slider为不同的进度
      let list = await driver.waitForComponent(ON.id('list_backwardanalysis_aln_1390'), 500)
      await Utils.sleep(300)
      // 步骤3：点击按钮看所有slider是否是同一进度
      let syncBtn = await driver.waitForComponent(ON.id('sync_slider_btn_1390'), 500)
      await syncBtn.click()
      await Utils.sleep(500)
      // 截图验证slider显示的进度一致
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BACKWARDANALYSIS_ALN_1390 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BACKWARDANALYSIS_ALN_1400
     * @tc.name   : Popupbox backwardanalysis aln
     * @tc.desc   : Verify popupbox backwardanalysis aln interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BACKWARDANALYSIS_ALN_1400', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BACKWARDANALYSIS_ALN_1400 start.`);
      // 步骤1：运行测试demo
      Settings.createWindow('testability/pages/scenario/misc/BackwardAnalysisAln/BackwardAnalysisAln1400')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      // 步骤2：半模态快速滑动到底部，然后快速滑动多次
      let sheetList = await driver.waitForComponent(ON.id('sheet_list_1400'), 500)
      await Utils.sleep(300)
      // 步骤3：观察半模态情况
      // 截图验证半模态显示正常
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BACKWARDANALYSIS_ALN_1400 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BACKWARDANALYSIS_ALN_1410
     * @tc.name   : Popupbox backwardanalysis aln
     * @tc.desc   : Verify popupbox backwardanalysis aln interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BACKWARDANALYSIS_ALN_1410', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BACKWARDANALYSIS_ALN_1410 start.`);
      // 步骤1：先后弹出toast（showMode设置为default)和拉起输入法
      Settings.createWindow('testability/pages/scenario/misc/BackwardAnalysisAln/BackwardAnalysisAln1410')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      let toastBtn = await driver.waitForComponent(ON.id('show_toast_btn_1410'), 500)
      await toastBtn.click()
      await Utils.sleep(300)
      let textInput = await driver.waitForComponent(ON.id('text_input_1410'), 500)
      await textInput.click()
      await Utils.sleep(500)
      // 步骤2：观察toast是否避让输入法
      // 截图验证toast避让输入法
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BACKWARDANALYSIS_ALN_1410 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BACKWARDANALYSIS_ALN_1420
     * @tc.name   : Popupbox backwardanalysis aln
     * @tc.desc   : Verify popupbox backwardanalysis aln interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BACKWARDANALYSIS_ALN_1420', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BACKWARDANALYSIS_ALN_1420 start.`);
      // 步骤1：先后弹出toast（showMode设置为TopMost)和拉起输入法
      Settings.createWindow('testability/pages/scenario/misc/BackwardAnalysisAln/BackwardAnalysisAln1420')
      let driver: Driver = Driver.create();
      await Utils.sleep(1000)
      let toastBtn = await driver.waitForComponent(ON.id('show_toast_btn_1420'), 2000)
      await toastBtn.click()
      await Utils.sleep(500)
      let textInput = await driver.waitForComponent(ON.id('text_input_1420'), 2000)
      await textInput.click()
      await Utils.sleep(500)
      // 步骤3：观察toast是否避让输入法
      // 截图验证toast避让输入法
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BACKWARDANALYSIS_ALN_1420 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_BACKWARDANALYSIS_ALN_1430
     * @tc.name   : Popupbox backwardanalysis aln
     * @tc.desc   : Verify popupbox backwardanalysis aln interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_BACKWARDANALYSIS_ALN_1430', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BACKWARDANALYSIS_ALN_1430 start.`);
      // 步骤1：先后弹出dialog和拉起输入法
      Settings.createWindow('testability/pages/scenario/misc/BackwardAnalysisAln/BackwardAnalysisAln1430')
      let driver: Driver = Driver.create();
      await Utils.sleep(500)
      let dialogBtn = await driver.waitForComponent(ON.id('show_dialog_btn_1430'), 500)
      await dialogBtn.click()
      await Utils.sleep(300)
      let dialogTextInput = await driver.waitForComponent(ON.id('dialog_text_input_1430'), 500)
      await dialogTextInput.click()
      await Utils.sleep(500)
      // 步骤4：观察dialog是否避让输入法
      // 截图验证dialog避让输入法
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_BACKWARDANALYSIS_ALN_1430 finish.`);
      done()
    })


  })
}