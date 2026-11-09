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
 * onKeyEvent属性测试-交互框架组（来自 onKeyEvent属性测试-交互框架组.xlsx）
 * DISPATCH 用例测试步骤：使按钮获焦 -> 输入按键 triggerKey(2025) -> 输入Tab键 triggerKey(2301) -> 截图查看页面返回值
 */
import { describe, afterEach, it, Level } from '@ohos/hypium'
import Settings from '../../../model/Settings'
import windowSnap from '../../../model/snapShot'
import Logger from '../../../model/Logger'
import Utils from '../../../model/Utils'
import { Driver, ON } from '@kit.TestKit';

const PAGE_PREFIX = 'testability/pages/scenario/action_event/OnKeyEventAttrTest/OnKeyEventAttrTest';

export default function onKeyEventAttrTest() {

  describe('onKeyEventAttrTest', () => {
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
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0070
     * @tc.name   : Action event commonevent keyevent dispatch
     * @tc.desc   : Verify action event commonevent keyevent dispatch interface behavior and expected UI result for this case.
     * @tc.type   : 带返回值onKeyEvent，属性测试timestamp。创建button绑定onKeyEvent，在事件回调中获取timestamp；使按钮获焦、按下任意按键，打印触发事件时间戳。
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0070 start.`);
      Settings.createWindow(PAGE_PREFIX + '0070');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(2025);
      await driver.waitForIdle(300, 1000);
      await driver.triggerKey(2301);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0070 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0080
     * @tc.name   : Action event commonevent keyevent dispatch
     * @tc.desc   : Verify action event commonevent keyevent dispatch interface behavior and expected UI result for this case.
     * @tc.type   : 带返回值onKeyEvent，属性测试intentionCode。创建button绑定onKeyEvent，在事件回调中获取intentionCode；使按钮获焦、按下任意按键，打印按键的意图。
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0080 start.`);
      Settings.createWindow(PAGE_PREFIX + '0080');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(2025);
      await driver.waitForIdle(300, 1000);
      await driver.triggerKey(2301);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0080 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0090
     * @tc.name   : Action event commonevent keyevent dispatch
     * @tc.desc   : Verify action event commonevent keyevent dispatch interface behavior and expected UI result for this case.
     * @tc.type   : 带返回值onKeyEvent，属性测试stopPropagation。父组件column、子组件button都绑定onKeyEvent，子组件事件回调中使用stopPropagation；使按钮获焦、按下任意按键，只有子组件的onKeyEvent事件都触发。
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0090 start.`);
      Settings.createWindow(PAGE_PREFIX + '0090');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(2025);
      await driver.waitForIdle(300, 1000);
      await driver.triggerKey(2301);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0090 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0100
     * @tc.name   : Action event commonevent keyevent dispatch
     * @tc.desc   : Verify action event commonevent keyevent dispatch interface behavior and expected UI result for this case.
     * @tc.type   : 带返回值onKeyEvent，属性测试getModifierKeyState。创建button绑定onKeyEvent，在事件回调中获取getModifierKeyState的值；使按钮获焦、按下组合键，打印对应的组合键。
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0100 start.`);
      Settings.createWindow(PAGE_PREFIX + '0100');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(2025);
      await driver.waitForIdle(300, 1000);
      await driver.triggerKey(2301);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0100 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0110
     * @tc.name   : Action event commonevent keyevent dispatch
     * @tc.desc   : Verify action event commonevent keyevent dispatch interface behavior and expected UI result for this case.
     * @tc.type   : 带返回值onKeyEvent，返回值为true。父子组件都绑定带返回值的onKeyEvent且返回值为true；按钮1获焦后按下任意按键，只有子组件的onKeyEvent响应。
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0110 start.`);
      Settings.createWindow(PAGE_PREFIX + '0110');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(2025);
      await driver.waitForIdle(300, 1000);
      await driver.triggerKey(2301);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0110 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0120
     * @tc.name   : Action event commonevent keyevent dispatch
     * @tc.desc   : Verify action event commonevent keyevent dispatch interface behavior and expected UI result for this case.
     * @tc.type   : 带返回值onKeyEvent，返回值为false。父子组件都绑定带返回值的onKeyEvent且返回值为false；按钮1获焦后按下任意按键，父子组件的onKeyEvent都响应。
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0120 start.`);
      Settings.createWindow(PAGE_PREFIX + '0120');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(2025);
      await driver.waitForIdle(300, 1000);
      await driver.triggerKey(2301);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0120 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0130
     * @tc.name   : Action event commonevent keyevent dispatch
     * @tc.desc   : Verify action event commonevent keyevent dispatch interface behavior and expected UI result for this case.
     * @tc.type   : 带返回值onKeyEvent，返回值为undefined。父子组件都绑定带返回值的onKeyEvent且返回值为undefined；按钮1获焦后按下任意按键，父子组件的onKeyEvent都响应。
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0130 start.`);
      Settings.createWindow(PAGE_PREFIX + '0130');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(2025);
      await driver.waitForIdle(300, 1000);
      await driver.triggerKey(2301);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0130 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0140
     * @tc.name   : Action event commonevent keyevent dispatch
     * @tc.desc   : Verify action event commonevent keyevent dispatch interface behavior and expected UI result for this case.
     * @tc.type   : 带返回值onKeyEvent，动态切换返回值。父子组件都绑定带返回值的onKeyEvent且返回值为动态变化的bool值；动态切换bool值、按钮1获焦后按下任意按键，动态设置为true时不可以走焦，false时可以走焦，undefined走false的逻辑。
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0140 start.`);
      Settings.createWindow(PAGE_PREFIX + '0140');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(2025);
      await driver.waitForIdle(300, 1000);
      await driver.triggerKey(2301);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0140 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0210
     * @tc.name   : Action event commonevent keyevent dispatch
     * @tc.desc   : Verify action event commonevent keyevent dispatch interface behavior and expected UI result for this case.
     * @tc.type   : 带返回值onKeyEventDispatch，属性测试timestamp。创建button绑定onKeyEventDispatch，在事件回调中获取timestamp；使按钮获焦、按下任意按键，打印触发事件时间戳。
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0210', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0210 start.`);
      Settings.createWindow(PAGE_PREFIX + '0210');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(2025);
      await driver.waitForIdle(300, 1000);
      await driver.triggerKey(2301);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0210 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0220
     * @tc.name   : Action event commonevent keyevent dispatch
     * @tc.desc   : Verify action event commonevent keyevent dispatch interface behavior and expected UI result for this case.
     * @tc.type   : 带返回值onKeyEventDispatch，属性测试intentionCode。创建button绑定onKeyEventDispatch，在事件回调中获取intentionCode；使按钮获焦、按下任意按键，打印按键的意图。
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0220', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0220 start.`);
      Settings.createWindow(PAGE_PREFIX + '0220');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(2025);
      await driver.waitForIdle(300, 1000);
      await driver.triggerKey(2301);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0220 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0230
     * @tc.name   : Action event commonevent keyevent dispatch
     * @tc.desc   : Verify action event commonevent keyevent dispatch interface behavior and expected UI result for this case.
     * @tc.type   : 带返回值onKeyEventDispatch，属性测试stopPropagation。父组件column、子组件button都绑定onKeyEventDispatch，子组件事件回调中使用stopPropagation；不支持，只有父组件onKeyEventDispatch事件响应。
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0230', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0230 start.`);
      Settings.createWindow(PAGE_PREFIX + '0230');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(2025);
      await driver.waitForIdle(300, 1000);
      await driver.triggerKey(2301);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0230 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0240
     * @tc.name   : Action event commonevent keyevent dispatch
     * @tc.desc   : Verify action event commonevent keyevent dispatch interface behavior and expected UI result for this case.
     * @tc.type   : 带返回值onKeyEventDispatch，属性测试getModifierKeyState。创建button绑定onKeyEventDispatch，在事件回调中获取getModifierKeyState；使按钮获焦、按下组合键，不支持，无法打印对应的组合键。
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0240', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0240 start.`);
      Settings.createWindow(PAGE_PREFIX + '0240');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(2025);
      await driver.waitForIdle(300, 1000);
      await driver.triggerKey(2301);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0240 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0280
     * @tc.name   : Action event commonevent keyevent dispatch
     * @tc.desc   : Verify action event commonevent keyevent dispatch interface behavior and expected UI result for this case.
     * @tc.type   : 带返回值onKeyEventDispatch，动态切换返回值。创建1个按钮，绑定onKeyEventDispatch和带返回值的onKeyEvent，onKeyEventDispatch返回值为可动态切换的bool值；动态切换bool值、按钮1获焦后按下任意按键，获取到的id为undefined，area相关信息打印正确。
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0280', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0280 start.`);
      Settings.createWindow(PAGE_PREFIX + '0280');
      let driver = await Driver.create();
      await driver.waitForIdle(500, 2000);
      let btnSwitch = await driver.waitForComponent(ON.id('OnKeyEventAttrTest0280_btn_switch'), 2000);
      await btnSwitch.click();
      await driver.waitForIdle(300, 1000);
      await driver.triggerKey(2025);
      await driver.waitForIdle(300, 1000);
      await driver.triggerKey(2301);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0280 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0310
     * @tc.name   : Action event commonevent keyevent dispatch
     * @tc.desc   : Verify action event commonevent keyevent dispatch interface behavior and expected UI result for this case.
     * @tc.type   : dispatchKeyEvent，设置的key存在，父子key相同。返回值为true，子组件的onKeyEvent响应。
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0310', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0310 start.`);
      Settings.createWindow(PAGE_PREFIX + '0310');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(2025);
      await driver.waitForIdle(300, 1000);
      await driver.triggerKey(2301);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0310 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0320
     * @tc.name   : Action event commonevent keyevent dispatch
     * @tc.desc   : Verify action event commonevent keyevent dispatch interface behavior and expected UI result for this case.
     * @tc.type   : dispatchKeyEvent，设置的key存在，兄弟key相同。返回值为true，按钮2的onKeyEvent响应。
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0320', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0320 start.`);
      Settings.createWindow(PAGE_PREFIX + '0320');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(2025);
      await driver.waitForIdle(300, 1000);
      await driver.triggerKey(2301);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0320 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0330
     * @tc.name   : Action event commonevent keyevent dispatch
     * @tc.desc   : Verify action event commonevent keyevent dispatch interface behavior and expected UI result for this case.
     * @tc.type   : dispatchKeyEvent，设置的key存在，动态切换key。按钮2、3、4、5返回值分别为true、false、false、false，并且对应的onKeyEvent响应。
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0330', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0330 start.`);
      Settings.createWindow(PAGE_PREFIX + '0330');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(2025);
      await driver.waitForIdle(300, 1000);
      await driver.triggerKey(2301);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0330 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0340
     * @tc.name   : Action event commonevent keyevent dispatch
     * @tc.desc   : Verify action event commonevent keyevent dispatch interface behavior and expected UI result for this case.
     * @tc.type   : dispatchKeyEvent，设置的key存在，key对应的组件被隐藏。onKeyEvent不响应。
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0340', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0340 start.`);
      Settings.createWindow(PAGE_PREFIX + '0340');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(2025);
      await driver.waitForIdle(300, 1000);
      await driver.triggerKey(2301);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0340 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0350
     * @tc.name   : Action event commonevent keyevent dispatch
     * @tc.desc   : Verify action event commonevent keyevent dispatch interface behavior and expected UI result for this case.
     * @tc.type   : dispatchKeyEvent，设置的key存在，设置event为undefined。onKeyEvent不响应。
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0350', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0350 start.`);
      Settings.createWindow(PAGE_PREFIX + '0350');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(2025);
      await driver.waitForIdle(300, 1000);
      await driver.triggerKey(2301);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0350 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0360
     * @tc.name   : Action event commonevent keyevent dispatch
     * @tc.desc   : Verify action event commonevent keyevent dispatch interface behavior and expected UI result for this case.
     * @tc.type   : 带返回值的onKeyEvent和原来的onKeyEvent同时设置。最后设置的生效。
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0360', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0360 start.`);
      Settings.createWindow(PAGE_PREFIX + '0360');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(2025);
      await driver.waitForIdle(300, 1000);
      await driver.triggerKey(2301);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0360 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0370
     * @tc.name   : Action event commonevent keyevent dispatch
     * @tc.desc   : Verify action event commonevent keyevent dispatch interface behavior and expected UI result for this case.
     * @tc.type   : 快捷键事件、onKeyPreIme和带返回值的onKeyEvent和onKeyEventDispatch同时使用，onKeyPreIme消费按键a。onKeyPreIme响应，其他都不响应。
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0370', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0370 start.`);
      Settings.createWindow(PAGE_PREFIX + '0370');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(2025);
      await driver.waitForIdle(300, 1000);
      await driver.triggerKey(2301);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0370 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0380
     * @tc.name   : Action event commonevent keyevent dispatch
     * @tc.desc   : Verify action event commonevent keyevent dispatch interface behavior and expected UI result for this case.
     * @tc.type   : 快捷键事件、onKeyPreIme和带返回值的onKeyEvent和onKeyEventDispatch同时使用，onKeyPreIme不消费按键a，快捷键消费按键b。
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0380', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0380 start.`);
      Settings.createWindow(PAGE_PREFIX + '0380');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(2025);
      await driver.waitForIdle(300, 1000);
      await driver.triggerKey(2301);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0380 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0390
     * @tc.name   : Action event commonevent keyevent dispatch
     * @tc.desc   : Verify action event commonevent keyevent dispatch interface behavior and expected UI result for this case.
     * @tc.type   : 快捷键事件、onKeyPreIme和带返回值的onKeyEvent和onKeyEventDispatch同时使用，onKeyPreIme不消费按键a，快捷键不消费按键b。按下按键c时onKeyPreIme响应但不消费，onKeyEventDispatch响应。
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0390', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0390 start.`);
      Settings.createWindow(PAGE_PREFIX + '0390');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(2025);
      await driver.waitForIdle(300, 1000);
      await driver.triggerKey(2301);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0390 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0400
     * @tc.name   : Action event commonevent keyevent dispatch
     * @tc.desc   : Verify action event commonevent keyevent dispatch interface behavior and expected UI result for this case.
     * @tc.type   : 父子组件场景，祖先节点派发给父组件，父子组件都设置onKeyEvent。父组件和子组件的onKeyEvent响应。
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0400', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0400 start.`);
      Settings.createWindow(PAGE_PREFIX + '0400');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(2025);
      await driver.waitForIdle(300, 1000);
      await driver.triggerKey(2301);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0400 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0410
     * @tc.name   : Action event commonevent keyevent dispatch
     * @tc.desc   : Verify action event commonevent keyevent dispatch interface behavior and expected UI result for this case.
     * @tc.type   : 父子组件场景，祖先节点派发给子组件，父子组件都设置onKeyEvent。返回值为true，子组件按钮2的onKeyEvent响应。
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0410', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0410 start.`);
      Settings.createWindow(PAGE_PREFIX + '0410');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(2025);
      await driver.waitForIdle(300, 1000);
      await driver.triggerKey(2301);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0410 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0420
     * @tc.name   : Action event commonevent keyevent dispatch
     * @tc.desc   : Verify action event commonevent keyevent dispatch interface behavior and expected UI result for this case.
     * @tc.type   : 多个组件进行拦截和派发。组件d的onKeyEvent响应，abc的dispatchKeyEvent响应。
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0420', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0420 start.`);
      Settings.createWindow(PAGE_PREFIX + '0420');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(2025);
      await driver.waitForIdle(300, 1000);
      await driver.triggerKey(2301);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0420 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0430
     * @tc.name   : Action event commonevent keyevent dispatch
     * @tc.desc   : Verify action event commonevent keyevent dispatch interface behavior and expected UI result for this case.
     * @tc.type   : 循环派发。事件无法派发成功。
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0430', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0430 start.`);
      Settings.createWindow(PAGE_PREFIX + '0430');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(2025);
      await driver.waitForIdle(300, 1000);
      await driver.triggerKey(2301);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0430 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0440
     * @tc.name   : Action event commonevent keyevent dispatch
     * @tc.desc   : Verify action event commonevent keyevent dispatch interface behavior and expected UI result for this case.
     * @tc.type   : 多次进行派发，派发给同一个组件。按钮2的onKeyEvent响应三次。
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0440', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0440 start.`);
      Settings.createWindow(PAGE_PREFIX + '0440');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(2025);
      await driver.waitForIdle(300, 1000);
      await driver.triggerKey(2301);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0440 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0450
     * @tc.name   : Action event commonevent keyevent dispatch
     * @tc.desc   : Verify action event commonevent keyevent dispatch interface behavior and expected UI result for this case.
     * @tc.type   : 多次进行派发，派发给不同的组件。按钮1、2、3的onKeyEvent响应。
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0450', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0450 start.`);
      Settings.createWindow(PAGE_PREFIX + '0450');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(2025);
      await driver.waitForIdle(300, 1000);
      await driver.triggerKey(2301);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0450 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0460
     * @tc.name   : Action event commonevent keyevent dispatch
     * @tc.desc   : Verify action event commonevent keyevent dispatch interface behavior and expected UI result for this case.
     * @tc.type   : 验证拦截后框架不再向子树分发事件。父组件在onKeyEventDispatch中拦截按键事件返回值为true，子组件的onKeyEvent不会响应。
     * @tc.size   : MediumTest
     * @tc.level  : 4
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0460', Level.LEVEL4, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0460 start.`);
      Settings.createWindow(PAGE_PREFIX + '0460');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(2025);
      await driver.waitForIdle(300, 1000);
      await driver.triggerKey(2301);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0460 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0470
     * @tc.name   : Action event commonevent keyevent dispatch
     * @tc.desc   : Verify action event commonevent keyevent dispatch interface behavior and expected UI result for this case.
     * @tc.type   : 验证拦截后的事件仍然可以参与容器祖先节点的事件冒泡处理。子组件在onKeyEventDispatch中拦截按键事件返回值为true，不可以走焦。
     * @tc.size   : MediumTest
     * @tc.level  : 4
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0470', Level.LEVEL4, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0470 start.`);
      Settings.createWindow(PAGE_PREFIX + '0470');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(2025);
      await driver.waitForIdle(300, 1000);
      await driver.triggerKey(2301);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0470 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0480
     * @tc.name   : Action event commonevent keyevent dispatch
     * @tc.desc   : Verify action event commonevent keyevent dispatch interface behavior and expected UI result for this case.
     * @tc.type   : 验证不支持跨进程分发，例如UIExtension。无法派发到UIextension内部。
     * @tc.size   : MediumTest
     * @tc.level  : 4
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0480', Level.LEVEL4, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0480 start.`);
      Settings.createWindow(PAGE_PREFIX + '0480');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(2025);
      await driver.waitForIdle(300, 1000);
      await driver.triggerKey(2301);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0480 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0490
     * @tc.name   : Action event commonevent keyevent dispatch
     * @tc.desc   : Verify action event commonevent keyevent dispatch interface behavior and expected UI result for this case.
     * @tc.type   : 验证不支持分发至非容器子树的节点。无法派发到text，text的onKeyEvent不响应。
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0490', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0490 start.`);
      Settings.createWindow(PAGE_PREFIX + '0490');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(2025);
      await driver.waitForIdle(300, 1000);
      await driver.triggerKey(2301);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0490 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0500
     * @tc.name   : Action event commonevent keyevent dispatch
     * @tc.desc   : Verify action event commonevent keyevent dispatch interface behavior and expected UI result for this case.
     * @tc.type   : 派发给父组件。子组件拦截按键事件派发给父组件，派发失败。
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0500', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0500 start.`);
      Settings.createWindow(PAGE_PREFIX + '0500');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(2025);
      await driver.waitForIdle(300, 1000);
      await driver.triggerKey(2301);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0500 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0510
     * @tc.name   : Action event commonevent keyevent dispatch
     * @tc.desc   : Verify action event commonevent keyevent dispatch interface behavior and expected UI result for this case.
     * @tc.type   : 派发给设置onKeyEventDispatch、onKeyPreIme的组件，查看回调值。onKeyPreIme不响应，onKeyEventDispatch响应且回调值为派发过来的按键。
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0510', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0510 start.`);
      Settings.createWindow(PAGE_PREFIX + '0510');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(2025);
      await driver.waitForIdle(300, 1000);
      await driver.triggerKey(2301);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0510 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0520
     * @tc.name   : Action event commonevent keyevent dispatch
     * @tc.desc   : Verify action event commonevent keyevent dispatch interface behavior and expected UI result for this case.
     * @tc.type   : 派发给兄弟节点。可以派发到兄弟节点。
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0520', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0520 start.`);
      Settings.createWindow(PAGE_PREFIX + '0520');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(2025);
      await driver.waitForIdle(300, 1000);
      await driver.triggerKey(2301);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0520 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0530
     * @tc.name   : Action event commonevent keyevent dispatch
     * @tc.desc   : Verify action event commonevent keyevent dispatch interface behavior and expected UI result for this case.
     * @tc.type   : 派发给设置onKeyEvent的组件，查看回调值。onKeyEvent响应且回调值为派发过来的按键。
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0530', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0530 start.`);
      Settings.createWindow(PAGE_PREFIX + '0530');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(2025);
      await driver.waitForIdle(300, 1000);
      await driver.triggerKey(2301);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0530 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0540
     * @tc.name   : Action event commonevent keyevent dispatch
     * @tc.desc   : Verify action event commonevent keyevent dispatch interface behavior and expected UI result for this case.
     * @tc.type   : dispatchKeyEvent，framenode的UniqueId存在。framenode的onKeyEvent响应，返回值为false。
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0540', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0540 start.`);
      Settings.createWindow(PAGE_PREFIX + '0540');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(2025);
      await driver.waitForIdle(300, 1000);
      await driver.triggerKey(2301);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0540 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0550
     * @tc.name   : Action event commonevent keyevent dispatch
     * @tc.desc   : Verify action event commonevent keyevent dispatch interface behavior and expected UI result for this case.
     * @tc.type   : dispatchKeyEvent，framenode的UniqueId不存在。framenode的onKeyEvent不响应。
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0550', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0550 start.`);
      Settings.createWindow(PAGE_PREFIX + '0550');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(2025);
      await driver.waitForIdle(300, 1000);
      await driver.triggerKey(2301);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0550 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0560
     * @tc.name   : Action event commonevent keyevent dispatch
     * @tc.desc   : Verify action event commonevent keyevent dispatch interface behavior and expected UI result for this case.
     * @tc.type   : dispatchKeyEvent，framenode被隐藏。framenode的onKeyEvent不响应。
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0560', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0560 start.`);
      Settings.createWindow(PAGE_PREFIX + '0560');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(2025);
      await driver.waitForIdle(300, 1000);
      await driver.triggerKey(2301);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0560 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0860
     * @tc.name   : Action event commonevent keyevent dispatch
     * @tc.desc   : Verify action event commonevent keyevent dispatch interface behavior and expected UI result for this case.
     * @tc.type   : 内存泄漏。使用Python脚本调用接口dispatchKeyEvent和事件onKeyEventDispatch，内存泄漏不超过500kb。
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0860', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0860 start.`);
      Settings.createWindow(PAGE_PREFIX + '0860');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(2025);
      await driver.waitForIdle(300, 1000);
      await driver.triggerKey(2301);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0860 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0870
     * @tc.name   : Action event commonevent keyevent dispatch
     * @tc.desc   : Verify action event commonevent keyevent dispatch interface behavior and expected UI result for this case.
     * @tc.type   : 频繁调用接口。使用Python脚本调用接口dispatchKeyEvent和事件onKeyEventDispatch，50次，测试报告结果为pass。
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0870', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0870 start.`);
      Settings.createWindow(PAGE_PREFIX + '0870');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(2025);
      await driver.waitForIdle(300, 1000);
      await driver.triggerKey(2301);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0870 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0880
     * @tc.name   : Action event commonevent keyevent dispatch
     * @tc.desc   : Verify action event commonevent keyevent dispatch interface behavior and expected UI result for this case.
     * @tc.type   : 资料测试。查看文档onKeyEvent、onKeyEventDispatch、dispatchKeyEvent等API，文档描述正确。
     * @tc.size   : MediumTest
     * @tc.level  : 4
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0880', Level.LEVEL4, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0880 start.`);
      Settings.createWindow(PAGE_PREFIX + '0880');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(2025);
      await driver.waitForIdle(300, 1000);
      await driver.triggerKey(2301);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0880 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0890
     * @tc.name   : Action event commonevent keyevent dispatch
     * @tc.desc   : Verify action event commonevent keyevent dispatch interface behavior and expected UI result for this case.
     * @tc.type   : 构造keyEvent进行分发。column绑定onKeyEventDispatch，构造keyEvent使用构造的事件进行派发，按下tab键，派发失败，返回值为undefined。
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0890', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0890 start.`);
      Settings.createWindow(PAGE_PREFIX + '0890');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      await driver.triggerKey(2025);
      await driver.waitForIdle(300, 1000);
      await driver.triggerKey(2301);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_KEYEVENT_DISPATCH_0890 finish.`);
      done();
    });

  });
}