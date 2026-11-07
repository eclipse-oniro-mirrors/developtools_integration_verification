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

export default function navNavigationAction() {

  describe('navNavigationAction', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ACTION_800
     * @tc.name   : Set NavigationTitleMode to Full mode, dynamically increase the subtitle length, and gradually reduce the subtitle font size with truncation.
     * @tc.desc   : Verify nav navigation action interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ACTION_800', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ACTION_800 start.`);
      // 步骤1：点击第四个测试页面
      Settings.createWindow('testability/pages/component/navigation/NavNavigationAction/NavNavigationAction800')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：输入字符更改subtitle长度，subtitle字体大小随输入字符增加而缩小，最后以...截断
      let inputSubtitle = await driver.waitForComponent(ON.id('input_subtitle_800'), 2000)
      // 输入超长文本
      await inputSubtitle.clearText()
      await inputSubtitle.inputText('HelloWorldTestSubtitleWithVeryLongTextToTriggerEllipsisHelloWorldTestSubtitleWithVeryLongTextToTriggerEllipsisHelloWorldTestSubtitleWithVeryLongTextToTriggerEllipsisHelloWorldTestSubtitleWithVeryLongTextToTriggerEllipsis')
      await Utils.sleep(500)
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_ACTION_800 finish.`);
      done()
    })




  })
}