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
 * 交互框架测试用例_20241025 Sheet2 - 鼠标事件测试套（相同名称不同编号为一个测试套）
 */
import { describe, afterEach, it, Level } from '@ohos/hypium'
import Settings from '../../../model/Settings'
import windowSnap from '../../../model/snapShot'
import Logger from '../../../model/Logger'
import Utils from '../../../model/Utils'
import { Driver, ON } from '@kit.TestKit';

const PAGE_URI = 'testability/pages/scenario/action_event/Mouse/Mouse';

export default function mouseTest() {
  describe('mouseTest', () => {
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
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_MOUSE_0020
     * @tc.name   : 鼠标按键点击onMouse事件
     * @tc.desc   : Verify action event commonevent mouse interface behavior and expected UI result for this case.
     * @tc.type   : 创建ets页面添加Button绑定onMouse，进入页面连接鼠标点击Button，触发onMouse事件打印相关信息
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_MOUSE_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_MOUSE_0020 start.`);
      Settings.createWindow(PAGE_URI);
      let driver = await Driver.create();
      await driver.waitForIdle(500, 2000);
      let btn = await driver.waitForComponent(ON.id('Mouse_btn'), 2000);
      await btn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_MOUSE_0020 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_MOUSE_0030
     * @tc.name   : API12 hover事件不兼容变更，按下鼠标按键移动时不再上报onHover和onMouse
     * @tc.desc   : Verify action event commonevent mouse interface behavior and expected UI result for this case.
     * @tc.type   : 在no hover按钮上按下任意键不松手拖动经过onMouse按钮，中途不触发hover/鼠标事件
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_MOUSE_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_MOUSE_0030 start.`);
      Settings.createWindow(PAGE_URI);
      let driver = await Driver.create();
      await driver.waitForIdle(500, 2000);
      let noHoverBtn = await driver.waitForComponent(ON.id('Mouse_no_hover'), 2000);
      await noHoverBtn.click();
      let onMouseBtn = await driver.waitForComponent(ON.id('Mouse_onMouse_btn'), 2000);
      await onMouseBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_MOUSE_0030 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_MOUSE_0060
     * @tc.name   : API12鼠标事件的onMouse回调规格确认
     * @tc.desc   : Verify action event commonevent mouse interface behavior and expected UI result for this case.
     * @tc.type   : 不按下按键移动鼠标仅在绑定onMouse的button热区内生效；按下按键移动在任意位置都会触发回调
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_MOUSE_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_MOUSE_0060 start.`);
      Settings.createWindow(PAGE_URI);
      let driver = await Driver.create();
      await driver.waitForIdle(500, 2000);
      let onMouseBtn = await driver.waitForComponent(ON.id('Mouse_onMouse_btn'), 2000);
      await onMouseBtn.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_MOUSE_0060 finish.`);
      done();
    });
  });
}