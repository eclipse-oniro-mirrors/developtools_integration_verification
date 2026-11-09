/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, afterEach, Level } from '@ohos/hypium'
import Settings from '../../../model/Settings'
import Logger from '../../../model/Logger'
import Utils from '../../../model/Utils'
import { Driver, ON } from '@kit.TestKit'
import windowSnap from '../../../model/snapShot'

export default function uiComponentTextImagespanColorfilter() {
  describe('uiComponentTextImagespanColorfilter', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        done()
        return
      }
      Settings.windowClass.destroyWindow((err) => {
        if (err.code) {
          Logger.error('TEST', `Failed to destroy the window.Cause :${JSON.stringify(err)}`)
          return;
        }
        Logger.info('TEST', `Succeeded in destroy the window`);
      })
      await Utils.sleep(1000);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_IMAGESPAN_COLORFILTER_0010
     * @tc.name   : imagespan add different types of pictures and set colorFilter
     * @tc.desc   : Verify text imagespan colorfilter interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_IMAGESPAN_COLORFILTER_0010', Level.LEVEL3, async (done: Function) => {
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/text/TextImagespanColorfilter/UiComponentTextImagespanColorfilter0010')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：为imagespan引用不同类型的图片
      // 步骤3：设置colorFilter
      await Utils.sleep(1000)

      // 步骤4：查看图片的过滤颜色效果
      // 预期效果1：图片的过滤色正常显示
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_IMAGESPAN_COLORFILTER_0010_01')
      await Utils.sleep(1000)
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_IMAGESPAN_COLORFILTER_0020
     * @tc.name   : imagespan add different types of pictures and set DrawingColorFilter
     * @tc.desc   : Verify text imagespan colorfilter interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_IMAGESPAN_COLORFILTER_0020', Level.LEVEL3, async (done: Function) => {
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/text/TextImagespanColorfilter/UiComponentTextImagespanColorfilter0020')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：为imagespan引用不同类型的图片
      // 步骤3：设置DrawingColorFilter
      await Utils.sleep(1000)

      // 步骤4：查看图片的过滤颜色效果
      // 预期效果1：图片的过滤色正常显示
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_IMAGESPAN_COLORFILTER_0020_01')
      await Utils.sleep(1000)
      done();
    })
  })
}
