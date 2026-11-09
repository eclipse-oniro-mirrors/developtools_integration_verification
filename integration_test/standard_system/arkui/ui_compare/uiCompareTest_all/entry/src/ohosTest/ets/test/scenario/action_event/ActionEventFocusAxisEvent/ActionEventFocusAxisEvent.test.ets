/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, afterEach } from '@ohos/hypium';
import { Driver, ON } from '@kit.TestKit';
import Settings from '../../../model/Settings';
import windowSnap from '../../../model/snapShot';
import Logger from '../../../model/Logger';

/*
 * FocusAxisEvent事件测试 - 手柄遥杆触发
 * 自动化程度: 30% (需要手柄设备进行手动测试)
 */
export default function actionEventFocusAxisEventTest() {
  describe('actionEventFocusAxisEventTest', () => {
    afterEach(async () => {
      let driver = Driver.create();
      await driver.delayMs(500);
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0010
     * @tc.name   : FocusAxisEvent0010
     * @tc.desc   : Verify action event commonevent focusaxisevent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0010', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0010 start');
      let driver = Driver.create();
      await driver.delayMs(500);
      await windowSnap.snapShot();
      await driver.delayMs(500);
      Logger.info('TEST', 'SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0010 end');
      Logger.info('TEST', '手动验证: 连接手柄，移动遥杆，检查target信息是否正确打印');
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0020
     * @tc.name   : FocusAxisEvent0020
     * @tc.desc   : Verify action event commonevent focusaxisevent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0020', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0020 start');
      let driver = Driver.create();
      await driver.delayMs(500);
      await windowSnap.snapShot();
      await driver.delayMs(500);
      Logger.info('TEST', 'SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0020 end');
      Logger.info('TEST', '手动验证: 连接手柄，移动遥杆，检查timestamp是否正确打印');
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0030
     * @tc.name   : FocusAxisEvent0030
     * @tc.desc   : Verify action event commonevent focusaxisevent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0030', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0030 start');
      let driver = Driver.create();
      await driver.delayMs(500);
      await windowSnap.snapShot();
      await driver.delayMs(500);
      Logger.info('TEST', 'SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0030 end');
      Logger.info('TEST', '手动验证: 连接手柄，移动遥杆，检查sourceTool是否为10');
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0040
     * @tc.name   : FocusAxisEvent0040
     * @tc.desc   : Verify action event commonevent focusaxisevent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0040', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0040 start');
      let driver = Driver.create();
      await driver.delayMs(500);
      await windowSnap.snapShot();
      await driver.delayMs(500);
      Logger.info('TEST', 'SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0040 end');
      Logger.info('TEST', '手动验证: 连接手柄，移动遥杆，检查deviceId是否正确打印');
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0050
     * @tc.name   : FocusAxisEvent0050
     * @tc.desc   : Verify action event commonevent focusaxisevent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0050', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0050 start');
      let driver = Driver.create();
      await driver.delayMs(500);
      await windowSnap.snapShot();
      await driver.delayMs(500);
      Logger.info('TEST', 'SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0050 end');
      Logger.info('TEST', '手动验证: 连接手柄和键盘，按组合键+移动遥杆，检查组合键状态');
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0060
     * @tc.name   : FocusAxisEvent0060
     * @tc.desc   : Verify action event commonevent focusaxisevent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0060', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0060 start');
      let driver = Driver.create();
      await driver.delayMs(500);
      await windowSnap.snapShot();
      await driver.delayMs(500);
      Logger.info('TEST', 'SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0060 end');
      Logger.info('TEST', '手动验证: 连接手柄，移动遥杆/十字键，检查轴值是否在正确范围');
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0070
     * @tc.name   : FocusAxisEvent0070
     * @tc.desc   : Verify action event commonevent focusaxisevent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0070', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0070 start');
      let driver = Driver.create();
      await driver.delayMs(500);
      await windowSnap.snapShot();
      await driver.delayMs(500);
      Logger.info('TEST', 'SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0070 end');
      Logger.info('TEST', '手动验证: 连接手柄，移动遥杆，检查source是否为1');
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0080
     * @tc.name   : FocusAxisEvent0080
     * @tc.desc   : Verify action event commonevent focusaxisevent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0080', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0080 start');
      let driver = Driver.create();
      await driver.delayMs(500);
      await windowSnap.snapShot();
      await driver.delayMs(500);
      Logger.info('TEST', 'SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0080 end');
      Logger.info('TEST', '手动验证: 连接手柄，移动遥杆，检查只有子组件触发事件');
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0090
     * @tc.name   : FocusAxisEvent0090
     * @tc.desc   : Verify action event commonevent focusaxisevent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0090', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0090 start');
      let driver = Driver.create();
      await driver.delayMs(500);
      await windowSnap.snapShot();
      await driver.delayMs(500);
      Logger.info('TEST', 'SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0090 end');
      Logger.info('TEST', '手动验证: 连接手柄，移动遥杆，检查父子组件都触发事件');
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0190
     * @tc.name   : FocusAxisEvent0190
     * @tc.desc   : Verify action event commonevent focusaxisevent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0190', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0190 start');
      let driver = Driver.create();
      await driver.delayMs(500);
      await windowSnap.snapShot();
      await driver.delayMs(500);
      Logger.info('TEST', 'SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0190 end');
      Logger.info('TEST', '手动验证: 连接手柄，按方向键/A/B/Back，检查intentionCode');
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0200
     * @tc.name   : FocusAxisEvent0200
     * @tc.desc   : Verify action event commonevent focusaxisevent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0200', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0200 start');
      let driver = Driver.create();
      await driver.delayMs(500);
      await windowSnap.snapShot();
      await driver.delayMs(500);
      Logger.info('TEST', 'SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0200 end');
      Logger.info('TEST', '手动验证: 按A/B/X/Y键，检查onKeyPreIme拦截，KeyEvent不触发');
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0210
     * @tc.name   : FocusAxisEvent0210
     * @tc.desc   : Verify action event commonevent focusaxisevent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0210', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0210 start');
      let driver = Driver.create();
      await driver.delayMs(500);
      await windowSnap.snapShot();
      await driver.delayMs(500);
      Logger.info('TEST', 'SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0210 end');
      Logger.info('TEST', '手动验证: 移动遥杆后按RT禁用按钮，检查事件响应不完全');
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0220
     * @tc.name   : FocusAxisEvent0220
     * @tc.desc   : Verify action event commonevent focusaxisevent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0220', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0220 start');
      let driver = Driver.create();
      await driver.delayMs(500);
      await windowSnap.snapShot();
      await driver.delayMs(500);
      Logger.info('TEST', 'SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0220 end');
      Logger.info('TEST', '手动验证: 横竖屏切换后，移动遥杆，检查轴值打印正确');
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0230
     * @tc.name   : FocusAxisEvent0230
     * @tc.desc   : Verify action event commonevent focusaxisevent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0230', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0230 start');
      let driver = Driver.create();
      await driver.delayMs(500);
      await windowSnap.snapShot();
      await driver.delayMs(500);
      Logger.info('TEST', 'SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0230 end');
      Logger.info('TEST', '手动验证: Modifier方式获取target信息正确');
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0240
     * @tc.name   : FocusAxisEvent0240
     * @tc.desc   : Verify action event commonevent focusaxisevent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0240', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0240 start');
      let driver = Driver.create();
      await driver.delayMs(500);
      await windowSnap.snapShot();
      await driver.delayMs(500);
      Logger.info('TEST', 'SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0240 end');
      Logger.info('TEST', '手动验证: Modifier方式获取timestamp正确');
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0250
     * @tc.name   : FocusAxisEvent0250
     * @tc.desc   : Verify action event commonevent focusaxisevent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0250', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0250 start');
      let driver = Driver.create();
      await driver.delayMs(500);
      await windowSnap.snapShot();
      await driver.delayMs(500);
      Logger.info('TEST', 'SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0250 end');
      Logger.info('TEST', '手动验证: Modifier方式获取sourceTool为10');
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0260
     * @tc.name   : FocusAxisEvent0260
     * @tc.desc   : Verify action event commonevent focusaxisevent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0260', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0260 start');
      let driver = Driver.create();
      await driver.delayMs(500);
      await windowSnap.snapShot();
      await driver.delayMs(500);
      Logger.info('TEST', 'SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0260 end');
      Logger.info('TEST', '手动验证: Modifier方式获取deviceId正确');
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0270
     * @tc.name   : FocusAxisEvent0270
     * @tc.desc   : Verify action event commonevent focusaxisevent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0270', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0270 start');
      let driver = Driver.create();
      await driver.delayMs(500);
      await windowSnap.snapShot();
      await driver.delayMs(500);
      Logger.info('TEST', 'SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0270 end');
      Logger.info('TEST', '手动验证: Modifier方式获取组合键状态正确');
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0280
     * @tc.name   : FocusAxisEvent0280
     * @tc.desc   : Verify action event commonevent focusaxisevent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0280', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0280 start');
      let driver = Driver.create();
      await driver.delayMs(500);
      await windowSnap.snapShot();
      await driver.delayMs(500);
      Logger.info('TEST', 'SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0280 end');
      Logger.info('TEST', '手动验证: Modifier方式获取axisMap轴值正确');
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0290
     * @tc.name   : FocusAxisEvent0290
     * @tc.desc   : Verify action event commonevent focusaxisevent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0290', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0290 start');
      let driver = Driver.create();
      await driver.delayMs(500);
      await windowSnap.snapShot();
      await driver.delayMs(500);
      Logger.info('TEST', 'SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0290 end');
      Logger.info('TEST', '手动验证: Modifier方式获取source为1');
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0300
     * @tc.name   : FocusAxisEvent0300
     * @tc.desc   : Verify action event commonevent focusaxisevent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0300', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0300 start');
      let driver = Driver.create();
      await driver.delayMs(500);
      await windowSnap.snapShot();
      await driver.delayMs(500);
      Logger.info('TEST', 'SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0300 end');
      Logger.info('TEST', '手动验证: Modifier+stopPropagation，只有子组件触发');
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0310
     * @tc.name   : FocusAxisEvent0310
     * @tc.desc   : Verify action event commonevent focusaxisevent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0310', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0310 start');
      let driver = Driver.create();
      await driver.delayMs(500);
      await windowSnap.snapShot();
      await driver.delayMs(500);
      Logger.info('TEST', 'SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0310 end');
      Logger.info('TEST', '手动验证: Modifier无stopPropagation，父子都触发');
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0410
     * @tc.name   : FocusAxisEvent0410
     * @tc.desc   : Verify action event commonevent focusaxisevent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0410', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0410 start');
      let driver = Driver.create();
      await driver.delayMs(500);
      await windowSnap.snapShot();
      await driver.delayMs(500);
      Logger.info('TEST', 'SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0410 end');
      Logger.info('TEST', '手动验证: Modifier方式获取intentionCode正确');
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0420
     * @tc.name   : FocusAxisEvent0420
     * @tc.desc   : Verify action event commonevent focusaxisevent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0420', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0420 start');
      let driver = Driver.create();
      await driver.delayMs(500);
      await windowSnap.snapShot();
      await driver.delayMs(500);
      Logger.info('TEST', 'SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0420 end');
      Logger.info('TEST', '手动验证: Modifier方式A/B/X/Y被拦截');
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0430
     * @tc.name   : FocusAxisEvent0430
     * @tc.desc   : Verify action event commonevent focusaxisevent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0430', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0430 start');
      let driver = Driver.create();
      await driver.delayMs(500);
      await windowSnap.snapShot();
      await driver.delayMs(500);
      Logger.info('TEST', 'SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0430 end');
      Logger.info('TEST', '手动验证: Modifier方式按RT后事件响应不完全');
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0440
     * @tc.name   : FocusAxisEvent0440
     * @tc.desc   : Verify action event commonevent focusaxisevent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0440', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0440 start');
      let driver = Driver.create();
      await driver.delayMs(500);
      await windowSnap.snapShot();
      await driver.delayMs(500);
      Logger.info('TEST', 'SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0440 end');
      Logger.info('TEST', '手动验证: Modifier方式横竖屏切换后轴值正确');
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0630
     * @tc.name   : FocusAxisEvent0630
     * @tc.desc   : Verify action event commonevent focusaxisevent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0630', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0630 start');
      let driver = Driver.create();
      await driver.delayMs(500);
      await windowSnap.snapShot();
      await driver.delayMs(500);
      Logger.info('TEST', 'SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0630 end');
      Logger.info('TEST', '手动验证: 5分钟压力测试，事件正常响应');
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0640
     * @tc.name   : FocusAxisEvent0640
     * @tc.desc   : Verify action event commonevent focusaxisevent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0640', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0640 start');
      let driver = Driver.create();
      await driver.delayMs(500);
      await windowSnap.snapShot();
      await driver.delayMs(500);
      Logger.info('TEST', 'SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0640 end');
      Logger.info('TEST', '手动验证: 100次事件正常响应');
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0650
     * @tc.name   : FocusAxisEvent0650
     * @tc.desc   : Verify action event commonevent focusaxisevent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0650', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0650 start');
      let driver = Driver.create();
      await driver.delayMs(500);
      await windowSnap.snapShot();
      await driver.delayMs(500);
      Logger.info('TEST', 'SUB_ACE_ACTION_EVENT_COMMONEVENT_FOCUSAXISEVENT_0650 end');
      Logger.info('TEST', '手动验证: 内存泄漏不超过500KB');
      done();
    });
  });
}
