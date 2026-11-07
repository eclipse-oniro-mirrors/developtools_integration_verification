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

export default function popupBoxAlertdialogInterface() {

  describe('popupBoxAlertdialogInterface', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_POPUPBOX_ALERTDIALOG_INTERFACE_1200
     * @tc.name   : Popupbox alertdialog interface
     * @tc.desc   : Verify popupbox alertdialog interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_POPUPBOX_ALERTDIALOG_INTERFACE_1200', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ALERTDIALOG_INTERFACE_1200 start.`);
      // 步骤1：进入警告弹窗界面
      Settings.createWindow('testability/pages/component/popup/PopupBoxAlertdialogInterface/PopupBoxAlertdialogInterface1200')
      let driver = await Driver.create()
      await driver.waitForIdle(500,3000)
      
      // 步骤2：点击"two button dialog"弹出警告弹窗，内容为$r("app.string.message")的信息
      let alert_dialog_button_1200 = await driver.waitForComponent(ON.id('alert_dialog_button_1200'), 500)
      await alert_dialog_button_1200.click()
      await driver.waitForIdle(500,3000)
      
      // 预期结果：弹出弹窗，内容显示"showAlertDialog_resource"
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POPUPBOX_ALERTDIALOG_INTERFACE_1200 finish.`);
      done()
    })






  })
}