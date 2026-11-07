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

import { afterEach, describe, it, Level } from '@ohos/hypium'
import Settings from '../../../model/Settings'
import Logger from '../../../model/Logger'
import Utils from '../../../model/Utils'
import { Driver, ON } from '@kit.TestKit'
import windowSnap from '../../../model/snapShot'

export default function UiComponentTextRichEditorLineBreakStrategy() {
  describe('UiComponentTextRichEditorLineBreakStrategy', () => {
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
      await Utils.sleep(2000);
      done()
    })

    /*
      * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEBREAKSTRATEGY_0007
      * @tc.name   : Test RichEditor component with BALANCED line break strategy for mixed content
      * @tc.type   : Function
      * @tc.size   : UiTest
      * @tc.level  : 3
      */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEBREAKSTRATEGY_0007", Level.LEVEL3, async (done: Function) => {
        Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorLineBreakStrategy_12/UiComponentTextRichEditorLineBreakStrategy0007")
        await Utils.sleep(2000) // 等待窗口创建完成
        let driver = await Driver.create()

        // 1、查找RichEditor组件
        let rich_editor_linebreakstrategy_0007 = await driver.findComponent(ON.id("rich_editor_linebreakstrategy_0007"))
        if (!rich_editor_linebreakstrategy_0007) {
          Logger.error('TEST', 'RichEditor component not found!');
          done();
          return;
        }

        // 2、查找测试按钮组件
        let button_linebreakstrategy_0007_setGreedy = await driver.findComponent(ON.id("button_linebreakstrategy_0007_setGreedy"))
        let button_linebreakstrategy_0007_testBalanced = await driver.findComponent(ON.id("button_linebreakstrategy_0007_testBalanced"))
        let button_linebreakstrategy_0007_getAttribute = await driver.findComponent(ON.id("button_linebreakstrategy_0007_getAttribute"))

        if (!button_linebreakstrategy_0007_setGreedy || !button_linebreakstrategy_0007_testBalanced || !button_linebreakstrategy_0007_getAttribute) {
          Logger.error('TEST', 'Button components not found!');
          done();
          return;
        }

        // 3、等待组件加载完成
        await Utils.sleep(2000)

        // 4、截图查看初始BALANCED策略的折行效果
        await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEBREAKSTRATEGY_0007_INITIAL_01")
        await Utils.sleep(1000)

        // 5、步骤1：先设置非当前测试策略（GREEDY），用于对比测试
        await button_linebreakstrategy_0007_setGreedy.click()
        await Utils.sleep(1000)
        // 获取并验证GREEDY策略的属性值
        await button_linebreakstrategy_0007_getAttribute.click()
        await Utils.sleep(1000)

        // 6、步骤2：切换到当前要测试的BALANCED策略，观察折行效果
        await button_linebreakstrategy_0007_testBalanced.click()
        await Utils.sleep(1000)
        
        // 7、步骤3：获取并验证BALANCED策略的linebreak属性值，完成测试
        await button_linebreakstrategy_0007_getAttribute.click()
        await Utils.sleep(1000)
        await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEBREAKSTRATEGY_0007_02")

        done();
      })

    /*
      * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEBREAKSTRATEGY_0008
      * @tc.name   : Test RichEditor component with HIGH_QUALITY line break strategy for mixed content
      * @tc.type   : Function
      * @tc.size   : UiTest
      * @tc.level  : 3
      */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEBREAKSTRATEGY_0008", Level.LEVEL3, async (done: Function) => {
        Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorLineBreakStrategy_12/UiComponentTextRichEditorLineBreakStrategy0008")
        await Utils.sleep(2000) // 等待窗口创建完成
        let driver = await Driver.create()

        // 1、查找RichEditor组件
        let rich_editor_linebreakstrategy_0008 = await driver.findComponent(ON.id("rich_editor_linebreakstrategy_0008"))
        if (!rich_editor_linebreakstrategy_0008) {
          Logger.error('TEST', 'RichEditor component not found!');
          done();
          return;
        }

        // 2、查找测试按钮组件
        let button_linebreakstrategy_0008_setBalanced = await driver.findComponent(ON.id("button_linebreakstrategy_0008_setBalanced"))
        let button_linebreakstrategy_0008_testHighQuality = await driver.findComponent(ON.id("button_linebreakstrategy_0008_testHighQuality"))
        let button_linebreakstrategy_0008_getAttribute = await driver.findComponent(ON.id("button_linebreakstrategy_0008_getAttribute"))

        if (!button_linebreakstrategy_0008_setBalanced || !button_linebreakstrategy_0008_testHighQuality || !button_linebreakstrategy_0008_getAttribute) {
          Logger.error('TEST', 'Button components not found!');
          done();
          return;
        }

        // 3、等待组件加载完成
        await Utils.sleep(2000)

        // 4、步骤1：先设置非当前测试策略（BALANCED），用于对比测试
        await button_linebreakstrategy_0008_setBalanced.click()
        // 获取并验证BALANCED策略的属性值
        await button_linebreakstrategy_0008_getAttribute.click()
        await Utils.sleep(2000)

        // 5、步骤2：切换到当前要测试的HIGH_QUALITY策略，观察折行效果
        await button_linebreakstrategy_0008_testHighQuality.click()

        // 6、步骤3：获取并验证HIGH_QUALITY策略的linebreak属性值，完成测试
        await button_linebreakstrategy_0008_getAttribute.click()
        await Utils.sleep(2000)
        await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEBREAKSTRATEGY_0008_01")

        done();
      })

    /*
      * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEBREAKSTRATEGY_0009
      * @tc.name   : Test RichEditor component with GREEDY line break strategy for mixed content
      * @tc.type   : Function
      * @tc.size   : UiTest
      * @tc.level  : 3
      */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEBREAKSTRATEGY_0009", Level.LEVEL3, async (done: Function) => {
        Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorLineBreakStrategy_12/UiComponentTextRichEditorLineBreakStrategy0009")
        await Utils.sleep(2000) // 等待窗口创建完成
        let driver = await Driver.create()

        // 1、查找RichEditor组件
        let rich_editor_linebreakstrategy_0009 = await driver.findComponent(ON.id("rich_editor_linebreakstrategy_0009"))
        if (!rich_editor_linebreakstrategy_0009) {
          Logger.error('TEST', 'RichEditor component not found!');
          done();
          return;
        }

        // 2、查找测试按钮组件
        let button_linebreakstrategy_0009_setHighQuality = await driver.findComponent(ON.id("button_linebreakstrategy_0009_setHighQuality"))
        let button_linebreakstrategy_0009_testGreedy = await driver.findComponent(ON.id("button_linebreakstrategy_0009_testGreedy"))
        let button_linebreakstrategy_0009_getAttribute = await driver.findComponent(ON.id("button_linebreakstrategy_0009_getAttribute"))

        if (!button_linebreakstrategy_0009_setHighQuality || !button_linebreakstrategy_0009_testGreedy || !button_linebreakstrategy_0009_getAttribute) {
          Logger.error('TEST', 'Button components not found!');
          done();
          return;
        }

        // 3、等待组件加载完成
        await Utils.sleep(2000)

        // 4、步骤1：先设置非当前测试策略（HIGH_QUALITY），用于对比测试
        await button_linebreakstrategy_0009_setHighQuality.click()
        // 获取并验证HIGH_QUALITY策略的属性值
        await button_linebreakstrategy_0009_getAttribute.click()
        await Utils.sleep(2000)

        // 5、步骤2：切换到当前要测试的GREEDY策略，观察折行效果
        await button_linebreakstrategy_0009_testGreedy.click()
        // 获取并验证GREEDY策略的linebreak属性值
        await button_linebreakstrategy_0009_getAttribute.click()
        await Utils.sleep(2000)
        // 6、步骤3：完成测试，截图记录最终状态
        await windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_LINEBREAKSTRATEGY_0009_01")

        done();
      })
  })
}
