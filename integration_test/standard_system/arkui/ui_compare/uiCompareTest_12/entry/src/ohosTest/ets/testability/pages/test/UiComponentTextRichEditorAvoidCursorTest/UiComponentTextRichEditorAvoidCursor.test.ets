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

export default function UiComponentTextRichEditorAvoidCursor() {
  describe('UiComponentTextRichEditorAvoidCursor', () => {
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
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_AVOID_CURSOR_0001
        * @tc.name   : Set cursor avoidance mechanism to OFFSET_WITH_CARET mode, change cursor position, observe avoidance effect
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 3
     */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_AVOID_CURSOR_0001", Level.LEVEL3, async (done: Function) => {
      Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorAvoidCursor/UiComponentTextRichEditorAvoidCursor0001")
      await Utils.sleep(1000) // 等待窗口创建完成
      let driver = await Driver.create()

      // 1、查找组件
      let rich_editor_avoidcursor_0001 = await driver.waitForComponent(ON.id("rich_editor_avoidcursor_0001"), 1500)
      if (!rich_editor_avoidcursor_0001) {
        Logger.error('TEST', 'RichEditor component not found!');
        done();
        return;
      }
      let button_avoidcursor_0001_setCaretPosition = await driver.waitForComponent(ON.id("button_avoidcursor_0001_setCaretPosition"), 1500)
      if (!button_avoidcursor_0001_setCaretPosition) {
        Logger.error('TEST', 'SetCaretPosition button not found!');
        done();
        return;
      }
      let button_avoidcursor_0001_caretPositionAdd =
        await driver.waitForComponent(ON.id("button_avoidcursor_0001_caretPositionAdd"), 1500)
      if (!button_avoidcursor_0001_caretPositionAdd) {
        Logger.error('TEST', 'CaretPositionAdd button not found!');
        done();
        return;
      }
      let button_avoidcursor_0001_caretPositionReduce =
        await driver.waitForComponent(ON.id("button_avoidcursor_0001_caretPositionReduce"), 1500)
      if (!button_avoidcursor_0001_caretPositionReduce) {
        Logger.error('TEST', 'CaretPositionReduce button not found!');
        done();
        return;
      }

      await Utils.sleep(1000)
      // 2、输入大段文字
      await rich_editor_avoidcursor_0001.inputText(
        "Most of us compare ourselves with anyone we think is happier — a relative, someone we know a lot, or someone we hardly know. As a result, what we do remember is anything that makes others happy, anything that makes ourselves unhappy, totally forgetting that there is something happy in our own life.\
 So the best way to destroy happiness is to look at something and focus on even the smallest flaw. It is the smallest flaw that would make us complain. And it is the complaint that leads to us becoming unhappy.\
 If one chooses to be happy, he will be blessed; if he chooses to be unhappy, he will be cursed. Happiness is just what you think will make you happy.Most of us compare ourselves with anyone we think is happier — a relative, someone we know a lot, or someone we hardly know. As a result, what we do remember is anything that makes others happy, anything that makes ourselves unhappy, totally forgetting that there is something happy in our own life.\
 ", { paste: false, addition: true });
      await Utils.sleep(1000)
      // 3、执行光标位置操作
      await button_avoidcursor_0001_setCaretPosition.click()
      await Utils.sleep(1000)
      await button_avoidcursor_0001_caretPositionAdd.click()
      await Utils.sleep(500)
      await button_avoidcursor_0001_setCaretPosition.click()
      await Utils.sleep(3000)
      await button_avoidcursor_0001_caretPositionReduce.click()
      await Utils.sleep(200)
      await button_avoidcursor_0001_setCaretPosition.click()
      await Utils.sleep(1000)
      // 4、截图并等待
      windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_AVOID_CURSOR_0001_01")
      await Utils.sleep(1000)
      done();
    })

    /*
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_AVOID_CURSOR_0002
        * @tc.name   : Set cursor avoidance mechanism to OFFSET_WITH_CARET mode, long press text content, observe avoidance effect
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 3
     */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_AVOID_CURSOR_0002", Level.LEVEL3, async (done: Function) => {
      Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorAvoidCursor/UiComponentTextRichEditorAvoidCursor0002")
      await Utils.sleep(1000) // 等待窗口创建完成
      let driver = await Driver.create()

      // 1、查找组件
      let rich_editor_avoidcursor_0002 = await driver.waitForComponent(ON.id("rich_editor_avoidcursor_0002"), 1500)
      if (!rich_editor_avoidcursor_0002) {
        Logger.error('TEST', 'RichEditor component not found!');
        done();
        return;
      }
      let point_avoidcursor_0002 = await rich_editor_avoidcursor_0002.getBoundsCenter()
      await Utils.sleep(1000)
      // 2、输入大段文字
      await rich_editor_avoidcursor_0002.inputText(
        "Most of us compare ourselves with anyone we think is happier — a relative, someone we know a lot, or someone we hardly know. As a result, what we do remember is anything that makes others happy, anything that makes ourselves unhappy, totally forgetting that there is something happy in our own life.\
 So the best way to destroy happiness is to look at something and focus on even the smallest flaw. It is the smallest flaw that would make us complain. And it is the complaint that leads to us becoming unhappy.\
 If one chooses to be happy, he will be blessed; if he chooses to be unhappy, he will be cursed. Happiness is just what you think will make you happy.Most of us compare ourselves with anyone we think is happier — a relative, someone we know a lot, or someone we hardly know. As a result, what we do remember is anything that makes others happy, anything that makes ourselves unhappy, totally forgetting that there is something happy in our own life.\
 ", { paste: false, addition: true });

      // 3、随机选中查看菜单状态
      await driver.longClick(point_avoidcursor_0002.x + 10, point_avoidcursor_0002.y + 10)
      await Utils.sleep(1000)
      // 4、截图并等待
      windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_AVOID_CURSOR_0002_01")
      await Utils.sleep(1000)
      done();
    })

    /*
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_AVOID_CURSOR_0014
        * @tc.name   : Set cursor avoidance mechanism to RESIZE_WITH_CARET mode, long press text content, observe avoidance effect
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 3
     */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_AVOID_CURSOR_0014", Level.LEVEL3, async (done: Function) => {
      Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorAvoidCursor/UiComponentTextRichEditorAvoidCursor0014")
      await Utils.sleep(1000) // 等待窗口创建完成
      let driver = await Driver.create()

      // 1、查找组件
      let rich_editor_avoidcursor_0014 = await driver.waitForComponent(ON.id("rich_editor_avoidcursor_0014"), 1500)
      if (!rich_editor_avoidcursor_0014) {
        Logger.error('TEST', 'RichEditor component not found!');
        done();
        return;
      }
      let point_avoidcursor_0014 = await rich_editor_avoidcursor_0014.getBoundsCenter()
      await Utils.sleep(1000)
      // 2、输入大段文字
      await rich_editor_avoidcursor_0014.inputText(
        "Most of us compare ourselves with anyone we think is happier — a relative, someone we know a lot, or someone we hardly know. As a result, what we do remember is anything that makes others happy, anything that makes ourselves unhappy, totally forgetting that there is something happy in our own life.\
 So the best way to destroy happiness is to look at something and focus on even the smallest flaw. It is the smallest flaw that would make us complain. And it is the complaint that leads to us becoming unhappy.\
 If one chooses to be happy, he will be blessed; if he chooses to be unhappy, he will be cursed. Happiness is just what you think will make you happy.Most of us compare ourselves with anyone we think is happier — a relative, someone we know a lot, or someone we hardly know. As a result, what we do remember is anything that makes others happy, anything that makes ourselves unhappy, totally forgetting that there is something happy in our own life.\
 ", { paste: false, addition: true });

      // 3、随机选中查看菜单状态
      await driver.longClick(point_avoidcursor_0014.x + 10, point_avoidcursor_0014.y + 370)
      await Utils.sleep(1000)
      // 4、截图并等待
      windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_AVOID_CURSOR_0014_01")
      await Utils.sleep(1000)
      done();
    })

    /*
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_AVOID_CURSOR_0015
        * @tc.name   : Set cursor avoidance mechanism to RESIZE_WITH_CARET mode, continuously input content, observe avoidance effect
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 3
     */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_AVOID_CURSOR_0015", Level.LEVEL3, async (done: Function) => {
      Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorAvoidCursor/UiComponentTextRichEditorAvoidCursor0015")
      await Utils.sleep(1000) // 等待窗口创建完成
      let driver = await Driver.create()

      // 1、查找组件
      let rich_editor_avoidcursor_0015 = await driver.waitForComponent(ON.id("rich_editor_avoidcursor_0015"), 1500)
      if (!rich_editor_avoidcursor_0015) {
        Logger.error('TEST', 'RichEditor component not found!');
        done();
        return;
      }
      let point_avoidcursor_0015 = await rich_editor_avoidcursor_0015.getBoundsCenter()
      await Utils.sleep(1000)
      // 2、输入大段文字
      await rich_editor_avoidcursor_0015.click()
      await rich_editor_avoidcursor_0015.inputText(
        "Most of us compare ourselves with anyone we think is happier — a relative, someone we know a lot, or someone we hardly know. As a result, what we do remember is anything that makes others happy, anything that makes ourselves unhappy, totally forgetting that there is something happy in our own life.\
 So the best way to destroy happiness is to look at something and focus on even the smallest flaw. It is the smallest flaw that would make us complain. And it is the complaint that leads to us becoming unhappy.\
 If one chooses to be happy, he will be blessed; if he chooses to be unhappy, he will be cursed. Happiness is just what you think will make you happy.Most of us compare ourselves with anyone we think is happier — a relative, someone we know a lot, or someone we hardly know. As a result, what we do remember is anything that makes others happy, anything that makes ourselves unhappy, totally forgetting that there is something happy in our own life.\
 ", { paste: false, addition: true });

      // 3、继续输入内容
      await Utils.sleep(1000)
      await rich_editor_avoidcursor_0015.inputText(
        "Most of us compare ourselves with anyone we think is happier — a relative, someone we know a lot, or someone we hardly know. As a result, what we do remember is anything that makes others happy, anything that makes ourselves unhappy, totally forgetting that there is something happy in our own life.\
 So the best way to destroy happiness is to look at something and focus on even the smallest flaw. It is the smallest flaw that would make us complain. And it is the complaint that leads to us becoming unhappy.\
 If one chooses to be happy, he will be blessed; if he chooses to be unhappy, he will be cursed. Happiness is just what you think will make you happy.Most of us compare ourselves with anyone we think is happier — a relative, someone we know a lot, or someone we hardly know. As a result, what we do remember is anything that makes others happy, anything that makes ourselves unhappy, totally forgetting that there is something happy in our own life.\
 ", { paste: false, addition: true });
      // 4、截图并等待
      windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_AVOID_CURSOR_0015_01")
      await Utils.sleep(1000)
      done();
    })

    /*
        * @tc.number : SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_AVOID_CURSOR_0013
        * @tc.name   : Set cursor avoidance mechanism to RESIZE_WITH_CARET mode, change cursor position, observe avoidance effect
        * @tc.type   : Function
        * @tc.size   : UiTest
        * @tc.level  : 3
     */
    it("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_AVOID_CURSOR_0013", Level.LEVEL3, async (done: Function) => {
      Settings.createWindow("testability/pages/component/text/UiComponentTextRichEditorAvoidCursor/UiComponentTextRichEditorAvoidCursor0013")
      await Utils.sleep(1000) // 等待窗口创建完成
      let driver = await Driver.create()

      // 1、查找组件
      let rich_editor_avoidcursor_0013 = await driver.waitForComponent(ON.id("rich_editor_avoidcursor_0013"), 1500)
      if (!rich_editor_avoidcursor_0013) {
        Logger.error('TEST', 'RichEditor component not found!');
        done();
        return;
      }
      let point_avoidcursor_0013 = await rich_editor_avoidcursor_0013.getBoundsCenter()
      await Utils.sleep(1000)
      // 2、输入大段文字
      await rich_editor_avoidcursor_0013.inputText(
        "Most of us compare ourselves with anyone we think is happier — a relative, someone we know a lot, or someone we hardly know. As a result, what we do remember is anything that makes others happy, anything that makes ourselves unhappy, totally forgetting that there is something happy in our own life.\
 So the best way to destroy happiness is to look at something and focus on even the smallest flaw. It is the smallest flaw that would make us complain. And it is the complaint that leads to us becoming unhappy.\
 If one chooses to be happy, he will be blessed; if he chooses to be unhappy, he will be cursed. Happiness is just what you think will make you happy.Most of us compare ourselves with anyone we think is happier — a relative, someone we know a lot, or someone we hardly know. As a result, what we do remember is anything that makes others happy, anything that makes ourselves unhappy, totally forgetting that there is something happy in our own life.\
 ", { paste: false, addition: true });

      // 3、随机选中查看菜单状态
      await driver.click(point_avoidcursor_0013.x + 10, point_avoidcursor_0013.y + 370)
      await Utils.sleep(1000)
      await driver.click(point_avoidcursor_0013.x + 10, point_avoidcursor_0013.y)
      // 4、截图并等待
      windowSnap.snapShot("SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_AVOID_CURSOR_0013_01")
      await Utils.sleep(1000)
      done();
    })

  })
}
