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
import Utils from '../../../model/Utils'
import { Driver, ON } from '@kit.TestKit'
import windowSnap from '../../../model/snapShot'
import TestHelper from '../../../model/TestHelper'

export default function uiComponentTextRichEditorSetStyledString() {
  describe('uiComponentTextRichEditorSetStyledString', () => {

    afterEach(async (done: Function) => {

      await TestHelper.destroyWindow()

      done()

    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0058_478_201_232
     * @tc.name   : Verify attribute string built RichEditor component supports onSubmit
     * @tc.desc   : Verify text richeditor setstyledstring interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0058_478_201_232', Level.LEVEL3, async (done: Function) => {
      // 1、添加属性字符串构建的RichEditor组件
      Settings.createWindow('testability/pages/component/text/TextRichEditorSetStyledStringAlt/UiComponentTextRichEditorSetStyledString0058478201232')
      let driver = await Driver.create()
      await Utils.sleep(500)

      let rich_editor_setstyledstring_0058_478_201_232 = await driver.waitForComponent(ON.id('rich_editor_setstyledstring_0058_478_201_232'), 500)
      await Utils.sleep(500)

      // 2、设置onSubmit回调
      // 初始状态截图
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0058_478_201_232_01')
      await Utils.sleep(1000)

      // 3、输入法输入内容，按下软键盘输入法回车键
      // 点击组件使其获焦
      await rich_editor_setstyledstring_0058_478_201_232.click()
      await Utils.sleep(500)

      // 模拟键盘输入文本
      await rich_editor_setstyledstring_0058_478_201_232.inputText('测试输入内容')
      await Utils.sleep(500)

      // 模拟按下回车键触发onSubmit
      await driver.triggerKey(2054) // Enter键的keyCode是2054
      await Utils.sleep(500)

      // 预期效果1：触发该回调（截图验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0058_478_201_232_02')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0048_665
     * @tc.name   : Verify attribute string built RichEditor component supports getLayoutManager
     * @tc.desc   : Verify text richeditor setstyledstring interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0048_665', Level.LEVEL3, async (done: Function) => {
      // 1、添加RichEditor组件，生成属性字符串
      Settings.createWindow('testability/pages/component/text/TextRichEditorSetStyledStringAlt/UiComponentTextRichEditorSetStyledString0048665')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 2、组件配置getLayoutManager，且配置getLineCount
      let button_getlinecount = await driver.waitForComponent(ON.id('button_setstyledstring_0048_665_getlinecount'), 500)
      await button_getlinecount.click()
      await Utils.sleep(500)

      // 预期效果1：配置成功，getLineCount能获取正确行数信息
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0048_665_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0064
     * @tc.name   : Verify attribute string deletion operation
     * @tc.desc   : Verify text richeditor setstyledstring interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0064', Level.LEVEL3, async (done: Function) => {
      // 1、添加RichEditor组件，生成属性字符串
      // 2、生成带有图文混合内容的属性字符串
      Settings.createWindow('testability/pages/component/text/TextRichEditorSetStyledStringAlt/UiComponentTextRichEditorSetStyledString0064')
      let driver = await Driver.create()
      await Utils.sleep(500)

      let rich_editor_setstyledstring_0064 = await driver.waitForComponent(ON.id('rich_editor_setstyledstring_0064'), 500)
      await Utils.sleep(500)

      // 初始状态截图
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0064_01')
      await Utils.sleep(1000)

      // 3、连续或逐个删除中英文/emoji/换行符（循环模拟按删除键）
      // 点击组件使其获焦
      await rich_editor_setstyledstring_0064.click()
      await Utils.sleep(500)

      // 循环模拟按Backspace键删除内容，删除30次（足够删除所有内容）
      for (let i = 0; i < 30; i++) {
        await driver.triggerKey(2055) // Backspace键的keyCode是2055
        await Utils.sleep(50) // 每次删除间隔50ms
      }
      await Utils.sleep(500)
      
      // 预期效果1：删除操作无异常（截图验证）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0064_02')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0058_478_201
     * @tc.name   : Verify attribute string built RichEditor component does not support onDidIMEInput
     * @tc.desc   : Verify text richeditor setstyledstring interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0058_478_201', Level.LEVEL3, async (done: Function) => {
      // 1、添加属性字符串构建的RichEditor组件
      // 2、设置onDidIMEInput回调
      Settings.createWindow('testability/pages/component/text/TextRichEditorSetStyledStringAlt/UiComponentTextRichEditorSetStyledString0058478201')
      let driver = await Driver.create()
      await Utils.sleep(500)

      let rich_editor_setstyledstring_0058_478_201 = await driver.waitForComponent(ON.id('rich_editor_setstyledstring_0058_478_201'), 500)
      await Utils.sleep(500)

      // 初始状态截图
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0058_478_201_01')
      await Utils.sleep(1000)

      // 3、输入法输入内容，查看回调内容
      // 点击组件使其获焦
      await rich_editor_setstyledstring_0058_478_201.click()
      await Utils.sleep(500)

      // 模拟键盘输入文本
      await rich_editor_setstyledstring_0058_478_201.inputText('测试输入内容')
      await Utils.sleep(500)

      // 预期效果1：输入法完成输入时，不触发该回调（截图验证，计数器应该为0）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0058_478_201_02')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0030
     * @tc.name   : Verify attribute string supports placeholder attribute
     * @tc.desc   : Verify text richeditor setstyledstring interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0030', Level.LEVEL3, async (done: Function) => {
      // 1、添加RichEditor组件，生成属性字符串
      // 2、生成包含图片文本内容的属性字符串
      Settings.createWindow('testability/pages/component/text/TextRichEditorSetStyledStringAlt/UiComponentTextRichEditorSetStyledString0030')
      let driver = await Driver.create()
      await Utils.sleep(500)

      let rich_editor_setstyledstring_0030 = await driver.waitForComponent(ON.id('rich_editor_setstyledstring_0030'), 500)
      await Utils.sleep(500)

      // 初始状态截图
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0030_01')
      await Utils.sleep(1000)

      // 3、设置placeholder
      let button_clear = await driver.waitForComponent(ON.id('button_setstyledstring_0030_clear'), 500)
      await button_clear.click()
      await Utils.sleep(500)

      // 预期效果1：组件中能够正常显示placeholder的设定
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0030_02')
      await Utils.sleep(1000)

      let button_restore = await driver.waitForComponent(ON.id('button_setstyledstring_0030_restore'), 500)
      await button_restore.click()
      await Utils.sleep(500)

      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0030_03')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0033
     * @tc.name   : Verify attribute string supports caretColor attribute
     * @tc.desc   : Verify text richeditor setstyledstring interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0033', Level.LEVEL3, async (done: Function) => {
      // 1、添加RichEditor组件，生成属性字符串
      // 2、生成包含图片文本内容的属性字符串
      Settings.createWindow('testability/pages/component/text/TextRichEditorSetStyledStringAlt/UiComponentTextRichEditorSetStyledString0033')
      let driver = await Driver.create()
      await Utils.sleep(500)

      let rich_editor_setstyledstring_0033 = await driver.waitForComponent(ON.id('rich_editor_setstyledstring_0033'), 500)
      await rich_editor_setstyledstring_0033.click()

      // 3、设置caretColor为红色
      let button_red = await driver.waitForComponent(ON.id('button_setstyledstring_0033_red'), 500)
      await button_red.click()
      await Utils.sleep(500)

      // 预期效果1：组件中光标颜色能够按照设定的颜色显示（红色）
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0033_01')
      await Utils.sleep(1000)

      // 4、设置caretColor为绿色
      let button_green = await driver.waitForComponent(ON.id('button_setstyledstring_0033_green'), 500)
      await button_green.click()
      await Utils.sleep(500)

      // 预期效果2：光标颜色变为绿色
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0033_02')
      await Utils.sleep(1000)

      // 5、设置caretColor为蓝色
      let button_blue = await driver.waitForComponent(ON.id('button_setstyledstring_0033_blue'), 500)
      await button_blue.click()
      await Utils.sleep(500)

      // 预期效果3：光标颜色变为蓝色
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0033_03')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0041
     * @tc.name   : Verify attribute string input operation
     * @tc.desc   : Verify text richeditor setstyledstring interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0041', Level.LEVEL3, async (done: Function) => {
      // 1、添加RichEditor组件，生成属性字符串
      // 2、输入两张图片
      Settings.createWindow('testability/pages/component/text/TextRichEditorSetStyledStringAlt/UiComponentTextRichEditorSetStyledString0041')
      let driver = await Driver.create()
      await Utils.sleep(500)

      let rich_editor_setstyledstring_0041 = await driver.waitForComponent(ON.id('rich_editor_setstyledstring_0041'), 500)
      await Utils.sleep(500)

      // 初始状态截图
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0041_01')
      await Utils.sleep(1000)

      // 3、在两张图片之间依次输入一个字符的文本内容
      let button_input_char = await driver.waitForComponent(ON.id('button_setstyledstring_0041_input_char'), 500)
      await button_input_char.click()
      await Utils.sleep(500)

      // 预期效果1：能够正常输入无异常
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0041_02')
      await Utils.sleep(1000)

      // 4、在两张图片之间输入多个emoji再进行删除操作
      let button_input_emoji = await driver.waitForComponent(ON.id('button_setstyledstring_0041_input_emoji'), 500)
      await button_input_emoji.click()
      await Utils.sleep(500)

      // 预期效果2：操作无异常
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0041_03')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0042
     * @tc.name   : Verify attribute string supports getCaretOffset
     * @tc.desc   : Verify text richeditor setstyledstring interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0042', Level.LEVEL3, async (done: Function) => {
      // 1、添加RichEditor组件，生成属性字符串
      // 2、生成包含图片文本内容的属性字符串
      Settings.createWindow('testability/pages/component/text/TextRichEditorSetStyledStringAlt/UiComponentTextRichEditorSetStyledString0042')
      let driver = await Driver.create()
      await Utils.sleep(500)

      let rich_editor_setstyledstring_0042 = await driver.waitForComponent(ON.id('rich_editor_setstyledstring_0042'), 500)
      await rich_editor_setstyledstring_0042.click()
      await Utils.sleep(500)

      // 3、设置getCaretOffset，光标点击任意位置
      let button_getoffset = await driver.waitForComponent(ON.id('button_setstyledstring_0042_getoffset'), 500)
      await button_getoffset.click()
      await Utils.sleep(500)

      // 预期效果1：获取光标位置正常
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0042_01')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0081
     * @tc.name   : Get attribute string displayed by rich text component through getStyledString
     * @tc.desc   : Verify text richeditor setstyledstring interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0081', Level.LEVEL3, async (done: Function) => {
      // 1、添加RichEditor组件
      // 2、生成带有图文混合内容的属性字符串
      Settings.createWindow('testability/pages/component/text/TextRichEditorSetStyledStringAlt/UiComponentTextRichEditorSetStyledString0081')
      let driver = await Driver.create()
      await Utils.sleep(500)

      let rich_editor_setstyledstring_0081 = await driver.waitForComponent(ON.id('rich_editor_setstyledstring_0081'), 500)
      await Utils.sleep(500)

      // 初始状态截图
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0081_01')
      await Utils.sleep(1000)

      // 3、通过getStyledString获取富文本组件显示的属性字符串
      let button_get = await driver.waitForComponent(ON.id('button_setstyledstring_0081_get'), 500)
      await button_get.click()
      await Utils.sleep(500)

      // 预期效果1：通过getStyledString能够正确获取富文本组件显示的属性字符串
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0081_02')
      await Utils.sleep(1000)

      let button_modify_get = await driver.waitForComponent(ON.id('button_setstyledstring_0081_modify_get'), 500)
      await button_modify_get.click()
      await Utils.sleep(500)

      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0081_03')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0058_478_201_232_533
     * @tc.name   : Verify attribute string built RichEditor component supports editMenuOptions
     * @tc.desc   : Verify text richeditor setstyledstring interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0058_478_201_232_533', Level.LEVEL3, async (done: Function) => {
      // 1、添加属性字符串构建的RichEditor组件
      Settings.createWindow('testability/pages/component/text/TextRichEditorSetStyledStringAlt/UiComponentTextRichEditorSetStyledString0058478201232533')
      let driver = await Driver.create()
      await Utils.sleep(500)

      let rich_editor_setstyledstring_0058_478_201_232_533 = await driver.waitForComponent(ON.id('rich_editor_setstyledstring_0058_478_201_232_533'), 500)
      await rich_editor_setstyledstring_0058_478_201_232_533.longClick()
      await Utils.sleep(1000)
      
      // 2、为组件设置自定义菜单扩展项editMenuOptions
      // 预期效果1：长按选中文本后弹出包含自定义菜单项的菜单
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0058_478_201_232_533_01')
      await Utils.sleep(1000)

      // 3、查找"复制"菜单项位置，点击右侧"更多"箭头展开更多菜单
      let copyposition = await driver.waitForComponent(ON.text('全选'), 500)
      let copyposition_center = await copyposition.getBoundsCenter()
      // 向右偏移50vp点击"更多"箭头
      await driver.click(copyposition_center.x + 50, copyposition_center.y)
      await Utils.sleep(1000)

      // 预期效果2：点击"更多"箭头后展开所有自定义菜单项
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0058_478_201_232_533_02')
      await Utils.sleep(1000)
      
      // 4、点击自定义菜单项1
      let menu_item_1 = await driver.waitForComponent(ON.text('自定义菜单项1'), 500)
      await menu_item_1.click()
      await Utils.sleep(500)

      // 预期效果3：点击自定义菜单项后，辅助编辑器显示点击结果
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0058_478_201_232_533_03')
      await Utils.sleep(1000)

      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0058_478
     * @tc.name   : Verify attribute string built RichEditor component supports barState
     * @tc.desc   : Verify text richeditor setstyledstring interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0058_478', Level.LEVEL3, async (done: Function) => {
      // 1、添加属性字符串构建的RichEditor组件
      Settings.createWindow('testability/pages/component/text/TextRichEditorSetStyledStringAlt/UiComponentTextRichEditorSetStyledString0058478')
      let driver = await Driver.create()
      await Utils.sleep(500)

      let rich_editor_setstyledstring_0058_478 = await driver.waitForComponent(ON.id('rich_editor_setstyledstring_0058_478'), 500)
      await Utils.sleep(500)

      // 初始状态截图
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0058_478_01')
      await Utils.sleep(1000)

      // 2、为组件设置barState属性
      let button_on = await driver.waitForComponent(ON.id('button_setstyledstring_0058_478_on'), 500)
      await button_on.click()
      await Utils.sleep(500)

      // 预期效果1：组件支持通过barState修改编辑态时滚动条的显示模式
      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0058_478_02')
      await Utils.sleep(1000)

      let button_off = await driver.waitForComponent(ON.id('button_setstyledstring_0058_478_off'), 500)
      await button_off.click()
      await Utils.sleep(500)

      await windowSnap.snapShot('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_setStyledString_0058_478_03')
      await Utils.sleep(1000)

      done();
    })

  })
}