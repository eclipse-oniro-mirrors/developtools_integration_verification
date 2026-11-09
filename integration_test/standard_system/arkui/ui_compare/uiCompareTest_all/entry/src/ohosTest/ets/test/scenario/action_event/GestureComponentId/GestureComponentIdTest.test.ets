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

/**
 * 交互框架测试用例_20241025 Sheet3 - 组件响应点击/悬浮/鼠标/触摸/手势事件，组件信息获取正确（相同名称不同编号为一个测试套）
 */
import { describe, afterEach, it, Level } from '@ohos/hypium'
import Settings from '../../../model/Settings'
import windowSnap from '../../../model/snapShot'
import Logger from '../../../model/Logger'
import Utils from '../../../model/Utils'
import { Driver, ON } from '@kit.TestKit';

const ClickEvent_URI = 'testability/pages/scenario/action_event/GestureComponentId/ClickEvent';
const HoverEvent_URI = 'testability/pages/scenario/action_event/GestureComponentId/HoverEvent';
const HoverEventModifier_URI = 'testability/pages/scenario/action_event/GestureComponentId/HoverEventModifier';
const MouseEvent_URI = 'testability/pages/scenario/action_event/GestureComponentId/MouseEvent';
const MouseEventModifier_URI = 'testability/pages/scenario/action_event/GestureComponentId/MouseEventModifier';
const AccessibilityHoverEvent_URI = 'testability/pages/scenario/action_event/GestureComponentId/AccessibilityHoverEvent';
const TouchEvent_URI = 'testability/pages/scenario/action_event/GestureComponentId/TouchEvent';
const GestureEvent_URI = 'testability/pages/scenario/action_event/GestureComponentId/GestureEvent';
const GestureEventModifier_URI = 'testability/pages/scenario/action_event/GestureComponentId/GestureEventModifier';
const GestureDynamic_URI = 'testability/pages/scenario/action_event/GestureComponentId/GestureDynamic';

export default function gestureComponentIdTest() {
  describe('gestureComponentIdTest', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        return;
      }
      Settings.windowClass.destroyWindow((err) => {
        if (err.code) {
          Logger.error('TEST', `Failed to destroy the window. Cause : ${JSON.stringify(err)}`);
          return;
        }
        Logger.info('TEST', `Succeeded in destroy the window.`);
      });
      await Utils.sleep(1000);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0410
     * @tc.name   : 组件响应点击事件，组件信息获取正确
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : 进入ClickEvent页面，点击button、Menu、TextArea组件，响应点击事件，获取到的id为设置的id，area信息正确
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0410', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(ClickEvent_URI);
      let driver = await Driver.create();
      await driver.waitForIdle(500, 2000);
      let btn = await driver.waitForComponent(ON.id('button'), 2000);
      await btn.click();
      await Utils.sleep(300);
      let menu = await driver.waitForComponent(ON.id('Menu'), 2000);
      await menu.click();
      await Utils.sleep(300);
      let textArea = await driver.waitForComponent(ON.id('TextArea'), 2000);
      await textArea.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0420
     * @tc.name   : modifier-组件响应点击事件，组件信息获取正确
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : 进入ClickEvent页面，点击button_Modifier、Menu_Modifier、TextArea_Modifier组件，获取到的id为设置的id，area信息正确
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0420', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(ClickEvent_URI);
      let driver = await Driver.create();
      await driver.waitForIdle(500, 2000);
      let btn = await driver.waitForComponent(ON.id('button_Modifier'), 2000);
      await btn.click();
      await Utils.sleep(300);
      let menu = await driver.waitForComponent(ON.id('Menu_Modifier'), 2000);
      await menu.click();
      await Utils.sleep(300);
      let textArea = await driver.waitForComponent(ON.id('TextArea_Modifier'), 2000);
      await textArea.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0430
     * @tc.name   : 组件响应悬浮事件，组件信息获取正确
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : 进入HoverEvent页面，触控板/鼠标/手写笔悬浮button、Menu、TextArea，响应悬浮事件，获取到的id为设置的id，area信息正确
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0430', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(HoverEvent_URI);
      let driver = await Driver.create();
      await driver.waitForIdle(500, 2000);
      let btn = await driver.waitForComponent(ON.id('button'), 2000);
      await btn.click();
      await Utils.sleep(300);
      let menu = await driver.waitForComponent(ON.id('Menu'), 2000);
      await menu.click();
      await Utils.sleep(300);
      let textArea = await driver.waitForComponent(ON.id('TextArea'), 2000);
      await textArea.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0440
     * @tc.name   : modifier-组件响应悬浮事件，组件信息获取正确
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : 进入HoverEvent_modifier页面，悬浮button、Menu、TextArea组件，获取到的id为设置的id，area信息正确
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0440', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(HoverEventModifier_URI);
      let driver = await Driver.create();
      await driver.waitForIdle(500, 2000);
      let btn = await driver.waitForComponent(ON.id('button_Modifier'), 2000);
      await btn.click();
      await Utils.sleep(300);
      let menu = await driver.waitForComponent(ON.id('Menu_Modifier'), 2000);
      await menu.click();
      await Utils.sleep(300);
      let textArea = await driver.waitForComponent(ON.id('TextArea_Modifier'), 2000);
      await textArea.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0450
     * @tc.name   : 组件响应鼠标事件，鼠标悬浮组件，组件信息获取正确
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : 进入MouseEvent页面，鼠标悬浮button、Menu、TextArea组件，响应鼠标事件，获取到的id为设置的id，area信息正确
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0450', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(MouseEvent_URI);
      let driver = await Driver.create();
      await driver.waitForIdle(500, 2000);
      let btn = await driver.waitForComponent(ON.id('button'), 2000);
      await btn.click();
      await Utils.sleep(300);
      let menu = await driver.waitForComponent(ON.id('Menu'), 2000);
      await menu.click();
      await Utils.sleep(300);
      let textArea = await driver.waitForComponent(ON.id('TextArea'), 2000);
      await textArea.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0460
     * @tc.name   : 组件响应鼠标事件，鼠标点击组件，组件信息获取正确
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : 进入MouseEvent页面，鼠标点击button、Menu、TextArea组件，响应鼠标事件，获取到的id为设置的id，area信息正确
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0460', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(MouseEvent_URI);
      let driver = await Driver.create();
      await driver.waitForIdle(500, 2000);
      let btn = await driver.waitForComponent(ON.id('button'), 2000);
      await btn.click();
      await Utils.sleep(300);
      let menu = await driver.waitForComponent(ON.id('Menu'), 2000);
      await menu.click();
      await Utils.sleep(300);
      let textArea = await driver.waitForComponent(ON.id('TextArea'), 2000);
      await textArea.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0470
     * @tc.name   : modifier-组件响应鼠标事件，鼠标悬浮组件，组件信息获取正确
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : 进入MouseEvent_modifier页面，鼠标悬浮button_Modifier、Menu_Modifier、TextArea_Modifier，获取到的id为设置的id，area信息正确
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0470', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(MouseEventModifier_URI);
      let driver = await Driver.create();
      await driver.waitForIdle(500, 2000);
      let btn = await driver.waitForComponent(ON.id('button_Modifier'), 2000);
      await btn.click();
      await Utils.sleep(300);
      let menu = await driver.waitForComponent(ON.id('Menu_Modifier'), 2000);
      await menu.click();
      await Utils.sleep(300);
      let textArea = await driver.waitForComponent(ON.id('TextArea_Modifier'), 2000);
      await textArea.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0480
     * @tc.name   : modifier-组件响应鼠标事件，鼠标点击组件，组件信息获取正确
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : 进入MouseEvent_modifier页面，鼠标点击button_Modifier、Menu_Modifier、TextArea_Modifier，获取到的id为设置的id，area信息正确
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0480', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(MouseEventModifier_URI);
      let driver = await Driver.create();
      await driver.waitForIdle(500, 2000);
      let btn = await driver.waitForComponent(ON.id('button_Modifier'), 2000);
      await btn.click();
      await Utils.sleep(300);
      let menu = await driver.waitForComponent(ON.id('Menu_Modifier'), 2000);
      await menu.click();
      await Utils.sleep(300);
      let textArea = await driver.waitForComponent(ON.id('TextArea_Modifier'), 2000);
      await textArea.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0490
     * @tc.name   : 组件响应无障碍悬浮事件，组件信息获取正确
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : 进入AccessibilityHoverEvent页面，开启无障碍模式，手指触摸button、Menu组件，响应无障碍悬浮事件，获取到的id为设置的id，area信息正确
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0490', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(AccessibilityHoverEvent_URI);
      let driver = await Driver.create();
      await driver.waitForIdle(500, 2000);
      let btn = await driver.waitForComponent(ON.id('button'), 2000);
      await btn.click();
      await Utils.sleep(300);
      let menu = await driver.waitForComponent(ON.id('Menu'), 2000);
      await menu.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0500
     * @tc.name   : 组件响应触摸事件，组件信息获取正确
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : 进入TouchEvent页面，手指/鼠标在button、Menu、TextArea组件上按下，响应触摸事件，获取到的id为设置的id，area信息正确
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0500', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(TouchEvent_URI);
      let driver = await Driver.create();
      await driver.waitForIdle(500, 2000);
      let btn = await driver.waitForComponent(ON.id('button'), 2000);
      await btn.click();
      await Utils.sleep(300);
      let menu = await driver.waitForComponent(ON.id('Menu'), 2000);
      await menu.click();
      await Utils.sleep(300);
      let textArea = await driver.waitForComponent(ON.id('TextArea'), 2000);
      await textArea.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0510
     * @tc.name   : modifier-组件响应触摸事件，组件信息获取正确
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : 进入TouchEvent页面，手指/鼠标在button_Modifier、Menu_Modifier、TextArea_Modifier上按下，获取到的id为设置的id，area信息正确
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0510', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(TouchEvent_URI);
      let driver = await Driver.create();
      await driver.waitForIdle(500, 2000);
      let btn = await driver.waitForComponent(ON.id('button_Modifier'), 2000);
      await btn.click();
      await Utils.sleep(300);
      let menu = await driver.waitForComponent(ON.id('Menu_Modifier'), 2000);
      await menu.click();
      await Utils.sleep(300);
      let textArea = await driver.waitForComponent(ON.id('TextArea_Modifier'), 2000);
      await textArea.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0520
     * @tc.name   : 组件响应TapGesture手势，组件信息获取正确
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : 进入GestureEvent页面，手指/鼠标/触控板单击组件或获焦后按A键/Enter/空格键，均响应TapGesture，打印的id、area信息正确
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0520', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(GestureEvent_URI);
      let driver = await Driver.create();
      await driver.waitForIdle(500, 2000);
      let tapBtn = await driver.waitForComponent(ON.id('gesture_tap'), 2000);
      await tapBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0540
     * @tc.name   : 组件响应PanGesture手势，组件信息获取正确
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : 进入GestureEvent页面，手指平移/鼠标滚轮/触控板双指/鼠标点按/触控板点按，均响应PanGesture，打印的id、area信息正确
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0540', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(GestureEvent_URI);
      let driver = await Driver.create();
      await driver.waitForIdle(500, 2000);
      let panBtn = await driver.waitForComponent(ON.id('gesture_pan'), 2000);
      await panBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0550
     * @tc.name   : 组件响应PinchGesture手势，组件信息获取正确
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : 进入GestureEvent页面，手指捏合/组件获焦后Ctrl+鼠标滚动/触控板双指捏合，均响应PinchGesture，打印的id、area信息正确
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0550', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(GestureEvent_URI);
      let driver = await Driver.create();
      await driver.waitForIdle(500, 2000);
      let pinchBtn = await driver.waitForComponent(ON.id('gesture_pinch'), 2000);
      await pinchBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0570
     * @tc.name   : 组件响应SwipeGesture手势，组件信息获取正确
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : 进入GestureEvent页面，手指滑动/鼠标滚轮滑动/触控板双指滑动/鼠标点按滑动/触控板点按滑动，均响应SwipeGesture，打印的id、area信息正确
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0570', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(GestureEvent_URI);
      let driver = await Driver.create();
      await driver.waitForIdle(500, 2000);
      let swipeBtn = await driver.waitForComponent(ON.id('gesture_swipe'), 2000);
      await swipeBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0580
     * @tc.name   : modifier-组件响应TapGesture手势，组件信息获取正确
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : 进入GestureEvent_modifier页面，单击组件或获焦后按A键/Enter/空格键，均响应TapGesture，打印的id、area信息正确
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0580', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(GestureEventModifier_URI);
      let driver = await Driver.create();
      await driver.waitForIdle(500, 2000);
      let tapBtn = await driver.waitForComponent(ON.id('gesture_tap_modifier'), 2000);
      await tapBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0600
     * @tc.name   : modifier-组件响应PanGesture手势，组件信息获取正确
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : 进入GestureEvent_modifier页面，手指平移/鼠标滚轮/触控板双指/鼠标点按/触控板点按，均响应PanGesture，打印的id、area信息正确
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0600', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(GestureEventModifier_URI);
      let driver = await Driver.create();
      await driver.waitForIdle(500, 2000);
      let panBtn = await driver.waitForComponent(ON.id('gesture_pan_modifier'), 2000);
      await panBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0610
     * @tc.name   : modifier-组件响应PinchGesture手势，组件信息获取正确
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : 进入GestureEvent_modifier页面，手指捏合/获焦后Ctrl+鼠标滚动/触控板双指捏合，均响应PinchGesture，打印的id、area信息正确
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0610', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(GestureEventModifier_URI);
      let driver = await Driver.create();
      await driver.waitForIdle(500, 2000);
      let pinchBtn = await driver.waitForComponent(ON.id('gesture_pinch_modifier'), 2000);
      await pinchBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0630
     * @tc.name   : modifier-组件响应SwipeGesture手势，组件信息获取正确
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : 进入GestureEvent_modifier页面，手指滑动/鼠标滚轮/触控板双指滑动/鼠标点按滑动/触控板点按滑动，均响应SwipeGesture，打印的id、area信息正确
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0630', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(GestureEventModifier_URI);
      let driver = await Driver.create();
      await driver.waitForIdle(500, 2000);
      let swipeBtn = await driver.waitForComponent(ON.id('gesture_swipe_modifier'), 2000);
      await swipeBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0640
     * @tc.name   : 组件响应组合手势，组件信息获取正确
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : 进入GestureEvent页面，一只手指长按另一只手指移动，所有手势都能识别，获取到的id为同一个id
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0640', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(GestureEvent_URI);
      let driver = await Driver.create();
      await driver.waitForIdle(500, 2000);
      let tapBtn = await driver.waitForComponent(ON.id('gesture_tap'), 2000);
      await tapBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0690
     * @tc.name   : 父、子组件同时触发，在父子组件重叠的区域操作
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : 进入GestureEvent页面，点击父子重叠区域（子组件区域），父、子组件均响应TapGesture手势，获取的id、area信息均正确
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0690', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(GestureEvent_URI);
      let driver = await Driver.create();
      await driver.waitForIdle(500, 2000);
      let tapBtn = await driver.waitForComponent(ON.id('gesture_tap'), 2000);
      await tapBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0730
     * @tc.name   : 冒泡（鼠标事件）
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : 父、子组件均绑定鼠标事件，使用鼠标操作子组件，子组件将事件传递给父组件，父、子均响应鼠标事件，获取到的id均正确，area信息正确
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0730', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(GestureDynamic_URI);
      let driver = await Driver.create();
      await driver.waitForIdle(500, 2000);
      let dynamicBtn = await driver.waitForComponent(ON.id('id_0'), 2000);
      await dynamicBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0740
     * @tc.name   : 动态切换同一个组件的id，id均为正常值，50次
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : 点击按钮动态切换组件的id共50次，每次切换后获取到的组件id均为最新的，无错误
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0740', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(GestureDynamic_URI);
      let driver = await Driver.create();
      await driver.waitForIdle(500, 2000);
      let switchIdBtn = await driver.waitForComponent(ON.id('btn_switch_id'), 2000);
      for (let i = 0; i < 50; i++) {
        await switchIdBtn.click();
        await Utils.sleep(50);
      }
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0750
     * @tc.name   : 动态切换同一个组件的id，id存在异常值，50次
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : 点击按钮动态切换组件的id共50次，切换到异常值时获取到的组件id不变显示上次正常值，再次切换到正常值时组件id可正常获取
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0750', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(GestureDynamic_URI);
      let driver = await Driver.create();
      await driver.waitForIdle(500, 2000);
      let switchIdBtn = await driver.waitForComponent(ON.id('btn_switch_id'), 2000);
      for (let i = 0; i < 50; i++) {
        await switchIdBtn.click();
        await Utils.sleep(50);
      }
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0760
     * @tc.name   : 动态切换同一个组件的key，key均为正常值，50次
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : 点击按钮动态切换组件的key共50次，每次切换后获取到的组件id均为最新的，无错误
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0760', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(GestureDynamic_URI);
      let driver = await Driver.create();
      await driver.waitForIdle(500, 2000);
      let switchKeyBtn = await driver.waitForComponent(ON.id('btn_switch_key'), 2000);
      for (let i = 0; i < 50; i++) {
        await switchKeyBtn.click();
        await Utils.sleep(50);
      }
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0770
     * @tc.name   : 动态切换同一个组件的key，key存在异常值，50次
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : 点击按钮动态切换组件的key共50次，每次切换后获取到的组件id均为最新的，无错误
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0770', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(GestureDynamic_URI);
      let driver = await Driver.create();
      await driver.waitForIdle(500, 2000);
      let switchKeyBtn = await driver.waitForComponent(ON.id('btn_switch_key'), 2000);
      for (let i = 0; i < 50; i++) {
        await switchKeyBtn.click();
        await Utils.sleep(50);
      }
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0780
     * @tc.name   : 连续在同一个组件上操作50次
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : 在组件上连续点击50次，响应50次点击事件，每次获取到的组件id均正确
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0780', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(GestureDynamic_URI);
      let driver = await Driver.create();
      await driver.waitForIdle(500, 2000);
      for (let i = 0; i < 50; i++) {
        let comp = await driver.waitForComponent(ON.id('id_0'), 2000);
        await comp.click();
        await Utils.sleep(50);
      }
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      done();
    });
    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0790
     * @tc.name   : 连续在不同的组件上操作50次
     * @tc.desc   : Verify action event gesture component id interface behavior and expected UI result for this case.
     * @tc.type   : 在页面上各个组件（button、image、list、grid、column、video等）操作连续50次，事件/手势均响应正常，每次响应获取到的组件id均打印正常，video组件id为undefined
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_GESTURE_COMPONENT_ID_0790', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(GestureDynamic_URI);
      let driver = await Driver.create();
      await driver.waitForIdle(500, 2000);
      for (let i = 0; i < 20; i++) {
        let comp = await driver.waitForComponent(ON.id('id_0'), 2000);
        await comp.click();
        await Utils.sleep(80);
      }
      for (let i = 0; i < 15; i++) {
        let switchIdBtn = await driver.waitForComponent(ON.id('btn_switch_id'), 2000);
        await switchIdBtn.click();
        await Utils.sleep(80);
      }
      for (let i = 0; i < 15; i++) {
        let switchKeyBtn = await driver.waitForComponent(ON.id('btn_switch_key'), 2000);
        await switchKeyBtn.click();
        await Utils.sleep(80);
      }
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      done();
    });
  });
}