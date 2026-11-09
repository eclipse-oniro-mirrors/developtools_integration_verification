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
import { Driver, ON, Component, On, MouseButton } from '@kit.TestKit'
import { uiAppearance } from '@kit.ArkUI'
import { BusinessError } from '@kit.BasicServicesKit';
import windowSnap from '../../../model/snapShot'

export default function UiComponentTextRichEditorLongPressTouying() {
  describe('UiComponentTextRichEditorLongPressTouying', () => {
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
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_lonngpresstouying_0005
        * @tc.name   : Long press mixed content, cancel and re-long press
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 3
     */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_lonngpresstouying_0005", Level.LEVEL3, async (done: Function) => {
      Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorLongPressTouying/UiComponentTextRichEditorLongPressTouying0005")
      await Utils.sleep(2000) // 等待窗口创建完成
      let driver = await Driver.create()

      // 1、查找RichEditor组件
      let rich_editor_longpresstouying_0005 = await driver.waitForComponent(ON.id("rich_editor_longpresstouying_0005"), 5000)
      if (!rich_editor_longpresstouying_0005) {
        Logger.error('TEST', 'RichEditor component not found!');
        done();
        return;
      }
      
      // 2、等待组件完全加载
      await Utils.sleep(1000)
      
      // 3、第一次长按图文混合内容
      let rich_editor_0005_point = await rich_editor_longpresstouying_0005.getBoundsCenter();
      await driver.longClickAt(rich_editor_0005_point, 1500) // 短时长按
      
      // 4、抬手取消后，重新长按浮起
      await driver.longClickAt(rich_editor_0005_point, 2000) // 长时长按
      
      // 5、截图验证长按后的效果
      await Utils.sleep(1000)
      await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_lonngpresstouying_0005_01")
      
      done();
    })

    /*
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_lonngpresstouying_0002
        * @tc.name   : Long press mixed content then long press again
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 3
     */
                it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_lonngpresstouying_0002", Level.LEVEL3, async (done: Function) => {
          Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorLongPressTouying/UiComponentTextRichEditorLongPressTouying0002")
          await Utils.sleep(2000) // 等待窗口创建完成
          let driver = await Driver.create()

          // 1、查找RichEditor组件
          let rich_editor_longpresstouying_0002 = await driver.waitForComponent(ON.id("rich_editor_longpresstouying_0002"), 5000)
          if (!rich_editor_longpresstouying_0002) {
            Logger.error('TEST', 'RichEditor component not found!');
            done();
            return;
          }
          
          // 2、等待组件完全加载
          await Utils.sleep(1000)
          
          // 3、第一次长按图文混合内容
          let rich_editor_0002_point = await rich_editor_longpresstouying_0002.getBoundsCenter();
          await driver.longClickAt(rich_editor_0002_point, 1500)

          // 4、再次长按
          await driver.longClickAt(rich_editor_0002_point, 1500)

          // 5、截图验证长按后的效果
          await Utils.sleep(1000)
          await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_lonngpresstouying_0002_01")
          
          done();
        })

    /*
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_lonngpresstouying_0006
        * @tc.name   : Long press mixed content with multiple line breaks
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 3
     */
                 it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_lonngpresstouying_0006", Level.LEVEL3, async (done: Function) => {
           Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorLongPressTouying/UiComponentTextRichEditorLongPressTouying0006")
           await Utils.sleep(2000) // 等待窗口创建完成
           let driver = await Driver.create()

           // 1、查找RichEditor组件
           let rich_editor_longpresstouying_0006 = await driver.waitForComponent(ON.id("rich_editor_longpresstouying_0006"), 5000)
           if (!rich_editor_longpresstouying_0006) {
             Logger.error('TEST', 'RichEditor component not found!');
             done();
             return;
           }
           
           // 2、等待组件完全加载
           await Utils.sleep(1000)
           
           // 3、选中组件内容后长按
           let rich_editor_0006_point = await rich_editor_longpresstouying_0006.getBoundsCenter();
           await driver.longClickAt(rich_editor_0006_point, 1500)

           // 4、再次长按
           await driver.longClickAt(rich_editor_0006_point, 1500)

           // 5、截图验证长按后的效果
           await Utils.sleep(1000)
           await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_lonngpresstouying_0006_01")
           
           done();
         })

    /*
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_lonngpresstouying_0003
        * @tc.name   : Double click image content then long press
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 3
     */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_lonngpresstouying_0003", Level.LEVEL3, async (done: Function) => {
      Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorLongPressTouying/UiComponentTextRichEditorLongPressTouying0003")
      await Utils.sleep(2000) // 等待窗口创建完成
      let driver = await Driver.create()

      // 1、查找RichEditor组件
      let rich_editor_longpresstouying_0003 = await driver.waitForComponent(ON.id("rich_editor_longpresstouying_0003"), 5000)
      if (!rich_editor_longpresstouying_0003) {
        Logger.error('TEST', 'RichEditor component not found!');
        done();
        return;
      }
      
      // 2、等待组件完全加载
      await Utils.sleep(1000)
      
      // 3、双击图片内容
      let rich_editor_0003_point = await rich_editor_longpresstouying_0003.getBoundsCenter();
      await driver.mouseDoubleClick(rich_editor_0003_point, MouseButton.MOUSE_BUTTON_LEFT)
      
      // 4、长按
      await driver.longClickAt(rich_editor_0003_point, 1500)
      
      // 5、截图验证长按后的效果
      await Utils.sleep(1000)
      await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_lonngpresstouying_0003_01")
      
      done();
    })

    /*
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_lonngpresstouying_0010
        * @tc.name   : Long press text with height greater than component height
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 3
     */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_lonngpresstouying_0010", Level.LEVEL3, async (done: Function) => {
      Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorLongPressTouying/UiComponentTextRichEditorLongPressTouying0010")
      await Utils.sleep(2000) // 等待窗口创建完成
      let driver = await Driver.create()

      // 1、查找RichEditor组件
      let rich_editor_longpresstouying_0010 = await driver.waitForComponent(ON.id("rich_editor_longpresstouying_0010"), 5000)
      if (!rich_editor_longpresstouying_0010) {
        Logger.error('TEST', 'RichEditor component not found!');
        done();
        return;
      }
      
      // 2、等待组件完全加载
      await Utils.sleep(1000)
      
      // 3、选中高度大于组件高度的文本后长按
      let rich_editor_0010_point = await rich_editor_longpresstouying_0010.getBoundsCenter();
      await driver.longClickAt(rich_editor_0010_point, 1500)
      
      // 4、截图验证长按后的效果
      await Utils.sleep(1000)
      await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_lonngpresstouying_0010_01")
      
      done();
    })

    /*
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_lonngpresstouying_0009
        * @tc.name   : Long press image with height greater than component height
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 3
     */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_lonngpresstouying_0009", Level.LEVEL3, async (done: Function) => {
      Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorLongPressTouying/UiComponentTextRichEditorLongPressTouying0009")
      await Utils.sleep(2000) // 等待窗口创建完成
      let driver = await Driver.create()

      // 1、查找RichEditor组件和选择图片按钮
      let rich_editor_longpresstouying_0009 = await driver.waitForComponent(ON.id("rich_editor_longpresstouying_0009"), 5000)
      let button_longpresstouying_0009_select = await driver.waitForComponent(ON.id("button_longpresstouying_0009_select"), 5000)
      
      if (!rich_editor_longpresstouying_0009 || !button_longpresstouying_0009_select) {
        Logger.error('TEST', 'Required components not found!');
        done();
        return;
      }
      
      // 2、等待组件完全加载
      await Utils.sleep(1000)
      
      // 3、点击选择图片按钮（模拟用户选择图片）
      await button_longpresstouying_0009_select.click()

      // 4、获取RichEditor中心点并长按
      let rich_editor_longpresstouying_0009_point = await rich_editor_longpresstouying_0009.getBoundsCenter();
      await driver.longClickAt(rich_editor_longpresstouying_0009_point, 1500)
      
      // 5、截图验证长按后的效果
      await Utils.sleep(1000)
      await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_lonngpresstouying_0009_01")
      
      done();
    })

  })
}
