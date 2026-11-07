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
 * 交互框架测试用例_20241025 Sheet2 - 鼠标样式/备忘录栏位显示测试套（MOUSE_REFESHBYVSYNC_0010~0140）
 */
import { describe, afterEach, it, Level } from '@ohos/hypium'
import Settings from '../../../model/Settings'
import windowSnap from '../../../model/snapShot'
import Logger from '../../../model/Logger'
import Utils from '../../../model/Utils'
import { Driver, ON } from '@kit.TestKit';

const PAGE_URI = 'testability/pages/scenario/action_event/MouseRefeshByVsync/MouseRefeshByVsync';

async function clickZone(driver: Driver, id: string): Promise<void> {
  let comp = await driver.waitForComponent(ON.id(id), 2000);
  let bounds = await comp.getBounds();
  let cx = bounds.left + (bounds.right - bounds.left) / 2;
  let cy = bounds.top + (bounds.bottom - bounds.top) / 2;
  await driver.click(cx, cy);
}

export default function mouseRefeshByVsyncTest() {
  describe('mouseRefeshByVsyncTest', () => {
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
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_MOUSE_REFESHBYVSYNC_0010
     * @tc.name   : 验证默认鼠标样式移动至备忘录第一栏显示样式
     * @tc.desc   : Verify action event commonevent mouse refeshbyvsync interface behavior and expected UI result for this case.
     * @tc.type   : 启动备忘录应用，鼠标移动至备忘录第一栏，鼠标显示默认样式
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_MOUSE_REFESHBYVSYNC_0010', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      let driver = await Driver.create();
      await driver.waitForIdle(500, 2000);
      await clickZone(driver, 'zone1');
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_MOUSE_REFESHBYVSYNC_0020
     * @tc.name   : 验证修改鼠标样式移动至备忘录第一栏显示样式
     * @tc.desc   : Verify action event commonevent mouse refeshbyvsync interface behavior and expected UI result for this case.
     * @tc.type   : 修改鼠标样式后启动备忘录，鼠标移动至第一栏显示修改样式
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_MOUSE_REFESHBYVSYNC_0020', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      let driver = await Driver.create();
      await driver.waitForIdle(500, 2000);
      await clickZone(driver, 'zone1');
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_MOUSE_REFESHBYVSYNC_0030
     * @tc.name   : 验证默认鼠标样式移动至第一、二栏之间sideBar显示样式
     * @tc.desc   : Verify action event commonevent mouse refeshbyvsync interface behavior and expected UI result for this case.
     * @tc.type   : 启动备忘录，鼠标移动至第一、二栏之间sideBar，鼠标显示分栏样式
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_MOUSE_REFESHBYVSYNC_0030', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      let driver = await Driver.create();
      await driver.waitForIdle(500, 2000);
      await clickZone(driver, 'sidebar1');
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_MOUSE_REFESHBYVSYNC_0050
     * @tc.name   : 验证默认鼠样式标移动至备忘录第二栏显示样式
     * @tc.desc   : Verify action event commonevent mouse refeshbyvsync interface behavior and expected UI result for this case.
     * @tc.type   : 启动备忘录，鼠标移动至第二栏，鼠标显示默认样式
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_MOUSE_REFESHBYVSYNC_0050', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      let driver = await Driver.create();
      await driver.waitForIdle(500, 2000);
      await clickZone(driver, 'zone2');
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_MOUSE_REFESHBYVSYNC_0060
     * @tc.name   : 验证修改鼠样式标移动至备忘录第二栏显示样式
     * @tc.desc   : Verify action event commonevent mouse refeshbyvsync interface behavior and expected UI result for this case.
     * @tc.type   : 修改鼠标样式后启动备忘录，鼠标移动至第二栏显示修改样式
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_MOUSE_REFESHBYVSYNC_0060', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      let driver = await Driver.create();
      await driver.waitForIdle(500, 2000);
      await clickZone(driver, 'zone2');
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_MOUSE_REFESHBYVSYNC_0070
     * @tc.name   : 验证默认鼠样式标移动至第二、三栏之间sideBar显示样式
     * @tc.desc   : Verify action event commonevent mouse refeshbyvsync interface behavior and expected UI result for this case.
     * @tc.type   : 启动备忘录，鼠标移动至第二、三栏之间sideBar，鼠标显示分栏样式
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_MOUSE_REFESHBYVSYNC_0070', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      let driver = await Driver.create();
      await driver.waitForIdle(500, 2000);
      await clickZone(driver, 'sidebar2');
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_MOUSE_REFESHBYVSYNC_0080
     * @tc.name   : 验证修改鼠样式标移动至第二、三栏之间sideBar显示样式
     * @tc.desc   : Verify action event commonevent mouse refeshbyvsync interface behavior and expected UI result for this case.
     * @tc.type   : 修改鼠标样式后启动备忘录，鼠标移动至第二、三栏之间sideBar显示修改样式
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_MOUSE_REFESHBYVSYNC_0080', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      let driver = await Driver.create();
      await driver.waitForIdle(500, 2000);
      await clickZone(driver, 'sidebar2');
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_MOUSE_REFESHBYVSYNC_0090
     * @tc.name   : 验证默认鼠样式标移动至备忘录第三栏显示样式
     * @tc.desc   : Verify action event commonevent mouse refeshbyvsync interface behavior and expected UI result for this case.
     * @tc.type   : 启动备忘录，鼠标移动至第三栏，鼠标显示文本输入样式
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_MOUSE_REFESHBYVSYNC_0090', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      let driver = await Driver.create();
      await driver.waitForIdle(500, 2000);
      await clickZone(driver, 'input1');
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_MOUSE_REFESHBYVSYNC_0100
     * @tc.name   : 验证修改鼠样式标移动至备忘录第三栏显示样式
     * @tc.desc   : Verify action event commonevent mouse refeshbyvsync interface behavior and expected UI result for this case.
     * @tc.type   : 修改鼠标样式后启动备忘录，鼠标移动至第三栏显示修改样式
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_MOUSE_REFESHBYVSYNC_0100', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      let driver = await Driver.create();
      await driver.waitForIdle(500, 2000);
      await clickZone(driver, 'input1');
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_MOUSE_REFESHBYVSYNC_0110
     * @tc.name   : 验证自定义光标样式，鼠标快速移动至输入框显示样式
     * @tc.desc   : Verify action event commonevent mouse refeshbyvsync interface behavior and expected UI result for this case.
     * @tc.type   : 修改鼠标样式后启动备忘录，鼠标快速移动至输入框显示修改样式
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_MOUSE_REFESHBYVSYNC_0110', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      let driver = await Driver.create();
      await driver.waitForIdle(500, 2000);
      await clickZone(driver, 'input1');
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_MOUSE_REFESHBYVSYNC_0120
     * @tc.name   : 验证自定义光标样式，鼠标快速移动至文本显示样式
     * @tc.desc   : Verify action event commonevent mouse refeshbyvsync interface behavior and expected UI result for this case.
     * @tc.type   : 修改鼠标样式后启动备忘录，鼠标快速移动至文本区域显示修改样式
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_MOUSE_REFESHBYVSYNC_0120', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      let driver = await Driver.create();
      await driver.waitForIdle(500, 2000);
      await clickZone(driver, 'zone2');
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_MOUSE_REFESHBYVSYNC_0130
     * @tc.name   : 验证一次设置所有自定义光标样式，鼠标快速移动至输入框显示样式
     * @tc.desc   : Verify action event commonevent mouse refeshbyvsync interface behavior and expected UI result for this case.
     * @tc.type   : 一次设置所有自定义光标样式后启动备忘录，鼠标快速移动至输入框显示修改样式
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_MOUSE_REFESHBYVSYNC_0130', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      let driver = await Driver.create();
      await driver.waitForIdle(500, 2000);
      await clickZone(driver, 'input1');
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      done();
    });

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_MOUSE_REFESHBYVSYNC_0140
     * @tc.name   : 验证一次设置所有自定义光标样式，鼠标快速移动至文本显示样式
     * @tc.desc   : Verify action event commonevent mouse refeshbyvsync interface behavior and expected UI result for this case.
     * @tc.type   : 一次设置所有自定义光标样式后启动备忘录，鼠标快速移动至文本区域显示修改样式
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_MOUSE_REFESHBYVSYNC_0140', Level.LEVEL3, async (done: Function) => {
      Settings.createWindow(PAGE_URI);
      let driver = await Driver.create();
      await driver.waitForIdle(500, 2000);
      await clickZone(driver, 'zone2');
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      done();
    });
  });
}