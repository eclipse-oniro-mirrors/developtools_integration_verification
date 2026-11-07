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
import { Driver, ON, Component, On, } from '@kit.TestKit'
import { uiAppearance } from '@kit.ArkUI'
import { BusinessError } from '@kit.BasicServicesKit';
import windowSnap from '../../../model/snapShot'

export default function uiComponentTextRichEditorGundongtiao() {
  describe('uiComponentTextRichEditorGundongtiao', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_gundongtiao_0001
     * @tc.name   : BarState.Auto模式滚动条测试
     * @tc.desc   : Verify text richeditor gundongtiao interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_gundongtiao_0001', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/text/TextRichEditorGundongtiao/UiComponentTextRichEditorGundongtiao0001')
      await Utils.sleep(500)
      let driver = await Driver.create()

      // 1、查找RichEditor组件和添加内容按钮
      let rich_editor_gundongtiao_0001 = await driver.waitForComponent(ON.id('rich_editor_gundongtiao_0001'), 500)
      let addContentBtn = await driver.waitForComponent(ON.id('addContentBtn0001'), 500)
      if (!rich_editor_gundongtiao_0001 || !addContentBtn) {
        Logger.error('TEST', 'Component not found!');
        done();
        return;
      }

      // 2、添加图文内容
      await addContentBtn.click()
      await Utils.sleep(300)
      await addContentBtn.click()
      await Utils.sleep(300)

      // 3、测试上下滑动手势
      await rich_editor_gundongtiao_0001.scrollToTop()
      await Utils.sleep(300)
      await rich_editor_gundongtiao_0001.scrollToBottom()
      await Utils.sleep(2500)

      // 4、截图验证测试结果
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_gundongtiao_0001_01')
      await Utils.sleep(500)
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_gundongtiao_0010
     * @tc.name   : 动态切换BarState模式测试
     * @tc.desc   : Verify text richeditor gundongtiao interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_gundongtiao_0010', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/text/TextRichEditorGundongtiao/UiComponentTextRichEditorGundongtiao0010')
      await Utils.sleep(500)
      let driver = await Driver.create()

      // 1、查找RichEditor组件和控制按钮
      let rich_editor_gundongtiao_0010 = await driver.waitForComponent(ON.id('rich_editor_gundongtiao_0010'), 500)
      let addContentBtn = await driver.waitForComponent(ON.id('addContentBtn0010'), 500);
      let switchBtn = await driver.waitForComponent(ON.id('switchBarStateBtn0010'), 500);
      if (!rich_editor_gundongtiao_0010 || !addContentBtn || !switchBtn) {
        Logger.error('TEST', 'Component not found!');
        done();
        return;
      }

      // 2、添加图文内容以触发滚动条
      await addContentBtn.click()
      await Utils.sleep(300)
      await addContentBtn.click()
      await Utils.sleep(300)

      // 3、测试Auto状态并截图
      await rich_editor_gundongtiao_0010.scrollToTop()
      await Utils.sleep(300)
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_gundongtiao_0010_01')
      await Utils.sleep(300)

      // 4、切换到On状态并测试滑动
      await switchBtn.click()
      await Utils.sleep(300)
      await rich_editor_gundongtiao_0010.scrollToBottom()
      await Utils.sleep(300)
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_gundongtiao_0010_02')
      await Utils.sleep(300)

      // 5、切换到Off状态并测试滑动
      await switchBtn.click()
      await Utils.sleep(300)
      await rich_editor_gundongtiao_0010.scrollToTop()
      await Utils.sleep(300)
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_gundongtiao_0010_03')
      await Utils.sleep(500)
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_gundongtiao_0002
     * @tc.name   : BarState.On模式滚动条测试
     * @tc.desc   : Verify text richeditor gundongtiao interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_gundongtiao_0002', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/text/TextRichEditorGundongtiao/UiComponentTextRichEditorGundongtiao0002')
      await Utils.sleep(500)
      let driver = await Driver.create()

      // 1、查找RichEditor组件和添加内容按钮
      let rich_editor_gundongtiao_0002 = await driver.waitForComponent(ON.id('rich_editor_gundongtiao_0002'), 500)
      let addContentBtn = await driver.waitForComponent(ON.id('addContentBtn0002'), 500);
      if (!rich_editor_gundongtiao_0002 || !addContentBtn) {
        Logger.error('TEST', 'Component not found!');
        done();
        return;
      }

      // 2、添加图文内容
      await addContentBtn.click()
      await Utils.sleep(300)
      await addContentBtn.click()
      await Utils.sleep(300)

      // 3、测试上下滑动手势
      await rich_editor_gundongtiao_0002.scrollToTop()
      await Utils.sleep(300)
      await rich_editor_gundongtiao_0002.scrollToBottom()
      await Utils.sleep(300)

      // 4、截图验证测试结果 - BarState为On时滚动条应该显示
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_gundongtiao_0002_01')
      await Utils.sleep(500)
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_gundongtiao_0003
     * @tc.name   : BarState.Off模式滚动条测试
     * @tc.desc   : Verify text richeditor gundongtiao interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_gundongtiao_0003', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow('testability/pages/component/text/TextRichEditorGundongtiao/UiComponentTextRichEditorGundongtiao0003')
      await Utils.sleep(500)
      let driver = await Driver.create()

      // 1、查找RichEditor组件和添加内容按钮
      let rich_editor_gundongtiao_0003 = await driver.waitForComponent(ON.id('rich_editor_gundongtiao_0003'), 500)
      let addContentBtn = await driver.waitForComponent(ON.id('addContentBtn0003'), 500);
      if (!rich_editor_gundongtiao_0003 || !addContentBtn) {
        Logger.error('TEST', 'Component not found!');
        done();
        return;
      }

      // 2、添加图文内容
      await addContentBtn.click()
      await Utils.sleep(300)
      await addContentBtn.click()
      await Utils.sleep(300)

      // 3、测试上下滑动手势
      await rich_editor_gundongtiao_0003.scrollToTop()
      await Utils.sleep(300)
      await rich_editor_gundongtiao_0003.scrollToBottom()
      await Utils.sleep(300)

      // 4、截图验证测试结果 - BarState为Off时滚动条不应该显示
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_gundongtiao_0003_01')
      await Utils.sleep(500)
      done();
    })

  })
}