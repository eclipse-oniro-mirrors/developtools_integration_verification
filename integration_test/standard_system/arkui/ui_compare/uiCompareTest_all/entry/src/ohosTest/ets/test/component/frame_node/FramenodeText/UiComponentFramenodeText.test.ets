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

import { describe, it, afterEach, Level } from '@ohos/hypium'
import Settings from '../../../model/Settings'
import Logger from '../../../model/Logger'
import Utils from '../../../model/Utils'
import { Driver, ON } from '@kit.TestKit'
import windowSnap from '../../../model/snapShot'

export default function uiComponentFramenodeText() {
  describe('uiComponentFramenodeText', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0050
     * @tc.name   : Marquee component, set marquee strategy to DEFAULT
     * @tc.desc   : Verify framenode text interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0050', Level.LEVEL3, async (done: Function) => {
      // 步骤1：打开页面，等待页面加载完成
      Settings.createWindow('testability/pages/component/frame_node/FramenodeText/UiComponentFramenodeText0050')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：查找Marquee组件，验证初始状态
      let marquee_framenode_text_0050 = await driver.waitForComponent(ON.id('marquee_framenode_text_0050'), 500)
      if (!marquee_framenode_text_0050) {
        Logger.error('TEST', 'Marquee component not found!');
        done();
        return;
      }

      await Utils.sleep(500)

      // 预期效果1：截图验证初始跑马灯状态
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0050_01')
      await Utils.sleep(1000)

      // 步骤3：点击按钮修改跑马灯文本内容
      let button_framenode_text_0050_modify = await driver.waitForComponent(ON.id('button_framenode_text_0050_modify'), 500)
      if (button_framenode_text_0050_modify) {
        await button_framenode_text_0050_modify.click()
        await Utils.sleep(500)
      }

      // 步骤4：等待跑马灯重新启动
      await Utils.sleep(1000)

      // 预期效果2：截图验证修改文本后跑马灯重置滚动位置并重新启动滚动
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0050_02')
      await Utils.sleep(1000)
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0080
     * @tc.name   : TextArea component, set placeholder text style
     * @tc.desc   : Verify framenode text interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0080', Level.LEVEL3, async (done: Function) => {
      // 步骤1：打开页面，等待页面加载完成
      Settings.createWindow('testability/pages/component/frame_node/FramenodeText/UiComponentFramenodeText0080')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：查找TextArea组件（Normal样式）
      let textarea_framenode_text_0080_normal = await driver.waitForComponent(ON.id('textarea_framenode_text_0080_normal'), 500)
      if (!textarea_framenode_text_0080_normal) {
        Logger.error('TEST', 'TextArea component (Normal) not found!');
        done();
        return;
      }

      // 步骤3：查找TextArea组件（Italic样式）
      let textarea_framenode_text_0080_italic = await driver.waitForComponent(ON.id('textarea_framenode_text_0080_italic'), 500)
      if (!textarea_framenode_text_0080_italic) {
        Logger.error('TEST', 'TextArea component (Italic) not found!');
        done();
        return;
      }

      await Utils.sleep(500)

      // 预期效果：截图验证提示文本显示正常，支持正常样式与斜体样式
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0080_01')
      await Utils.sleep(1000)
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0130
     * @tc.name   : TextArea component, set text maximum length
     * @tc.desc   : Verify framenode text interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0130', Level.LEVEL3, async (done: Function) => {
      // 步骤1：打开页面，等待页面加载完成
      Settings.createWindow('testability/pages/component/frame_node/FramenodeText/UiComponentFramenodeText0130')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2：查找TextArea组件
      let textarea_framenode_text_0130 = await driver.waitForComponent(ON.id('textarea_framenode_text_0130'), 500)
      if (!textarea_framenode_text_0130) {
        Logger.error('TEST', 'TextArea component not found!');
        done();
        return;
      }

      await Utils.sleep(500)

      // 步骤3：点击按钮输入12个字符
      let button_framenode_text_0130_input12 = await driver.waitForComponent(ON.id('button_framenode_text_0130_input12'), 500)
      if (button_framenode_text_0130_input12) {
        await button_framenode_text_0130_input12.click()
        await Utils.sleep(500)
      }

      // 预期效果：截图验证TextArea组件最多可输入12个字符
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_FRAMENODE_TEXT_0130_01')
      await Utils.sleep(1000)
      done();
    })

  })
}