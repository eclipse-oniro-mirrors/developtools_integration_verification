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
import Utils from '../../../model/Utils'
import { Driver, ON } from '@kit.TestKit'
import windowSnap from '../../../model/snapShot'
import TestHelper from '../../../model/TestHelper'

export default function uiComponentTextTextInherit() {
  describe('uiComponentTextTextInherit', () => {
    afterEach(async (done: Function) => {
      await TestHelper.destroyWindow()
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_INHERIT_0020
     * @tc.name   : Only the Text component is set properties
     * @tc.desc   : Verify text inherit interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_INHERIT_0020', Level.LEVEL3, async (done: Function) => {
      // 1、更新转测版本镜像及SDK，新建eTS页面
      Settings.createWindow('testability/pages/component/text/TextTextInherit/UiComponentTextTextInherit0020')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 2、新建一个Text组件
      // 3、给Text组件创建一个Span子组件
      // 4、Text组件设定fontColor、lineHeight、fontSize、fontWeight、fontStyle、letterSpacing、textCase、decoration、forgroundColor属性值，Span组件不设置
      // 5、编译运行hap包
      let text_inherit_0020 = await driver.waitForComponent(ON.id('text_inherit_0020'), 500)
      await Utils.sleep(500)

      // 预期效果1：打开测试hap，文本的以下属性均取Text组件设置的属性值：fontColor、lineHeight、fontSize、fontWeight、fontStyle、letterSpacing、textCase、decoration、forgroundColor
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_TEXT_INHERIT_0020_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_INHERIT_0070
     * @tc.name   : Dynamically change the size of text's size or letterSpacing or lineHeight to verify dynamic inheritance
     * @tc.desc   : Verify text inherit interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_INHERIT_0070', Level.LEVEL3, async (done: Function) => {
      // 1、更新转测版本镜像及SDK，新建eTS页面
      Settings.createWindow('testability/pages/component/text/TextTextInherit/UiComponentTextTextInherit0070')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 2、新建一个Text组件
      // 3、给Text组件创建一个Span子组件
      // 4、Span组件不设置fontSize、lineHeight、letterSpacing属性值
      let text_inherit_0070 = await driver.waitForComponent(ON.id('text_inherit_0070'), 500)
      await Utils.sleep(500)

      // 初始状态截图
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_TEXT_INHERIT_0070_01')
      await Utils.sleep(1000)

      // 5、动态改变Text组件的fontSize、lineHeight、letterSpacing属性值
      let btn_change_fontsize_0070 = await driver.waitForComponent(ON.id('btn_change_fontsize_0070'), 500)
      await btn_change_fontsize_0070.click()
      await Utils.sleep(500)

      // 预期效果：Text的fontSize属性动态变化时，Span组件能正确继承对应属性值
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_TEXT_INHERIT_0070_02')
      await Utils.sleep(1000)

      let btn_change_lineheight_0070 = await driver.waitForComponent(ON.id('btn_change_lineheight_0070'), 500)
      await btn_change_lineheight_0070.click()
      await Utils.sleep(500)

      // 预期效果：Text的lineHeight属性动态变化时，Span组件能正确继承对应属性值
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_TEXT_INHERIT_0070_03')
      await Utils.sleep(1000)

      let btn_change_letterspacing_0070 = await driver.waitForComponent(ON.id('btn_change_letterspacing_0070'), 500)
      await btn_change_letterspacing_0070.click()
      await Utils.sleep(500)

      // 预期效果：Text的letterSpacing属性动态变化时，Span组件能正确继承对应属性值
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_TEXT_INHERIT_0070_04')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_INHERIT_0050
     * @tc.name   : Both Text component and its child component Span set multiple properties simultaneously
     * @tc.desc   : Verify text inherit interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_INHERIT_0050', Level.LEVEL3, async (done: Function) => {
      // 1、更新转测版本镜像及SDK，新建eTS页面
      Settings.createWindow('testability/pages/component/text/TextTextInherit/UiComponentTextTextInherit0050')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 2、新建一个Text组件
      // 3、给Text组件创建一个Span子组件
      // 4、Span组件设定fontColor、lineHeight、fontSize、fontWeight、fontStyle、letterSpacing、textCase、decoration、forgroundColor属性值
      // 5、Text组件设定letterSpacing、textCase、decoration、forgroundColor属性值
      // 6、编译运行hap包
      let text_inherit_0050 = await driver.waitForComponent(ON.id('text_inherit_0050'), 500)
      await Utils.sleep(500)

      // 预期效果1：文本的以下属性遵循优先级规则：若Span组件设定了该属性，则取Span设定的值；若Span未设定但Text设定了，则取Text设定的值。涉及属性：fontColor、lineHeight、fontSize、fontWeight、fontStyle、letterSpacing、textCase、decoration、forgroundColor
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_TEXT_INHERIT_0050_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_TEXT_INHERIT_0030
     * @tc.name   : Only the child component Span is set properties
     * @tc.desc   : Verify text inherit interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_TEXT_INHERIT_0030', Level.LEVEL3, async (done: Function) => {
      // 1、更新转测版本镜像及SDK，新建eTS页面
      Settings.createWindow('testability/pages/component/text/TextTextInherit/UiComponentTextTextInherit0030')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 2、新建一个Text组件
      // 3、给Text组件创建一个Span子组件
      // 4、Span组件设定fontColor、lineHeight、fontSize、fontWeight、fontStyle、letterSpacing、textCase、decoration、forgroundColor属性值，Text组件不设置
      // 5、编译运行hap包
      let text_inherit_0030 = await driver.waitForComponent(ON.id('text_inherit_0030'), 500)
      await Utils.sleep(500)

      // 预期效果1：打开测试hap，文本的以下属性均取Span组件设置的属性值：fontColor、lineHeight、fontSize、fontWeight、fontStyle、letterSpacing、textCase、decoration、forgroundColor
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_TEXT_INHERIT_0030_01')
      await Utils.sleep(1000)

      done();
    })

  })
}