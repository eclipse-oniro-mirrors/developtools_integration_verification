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
 * 交互框架测试用例_20241025 Sheet2 - 将鼠标从一个组件来回快速移动到另一个组件
 */
import { describe, afterEach, it, Level } from '@ohos/hypium'
import Settings from '../../../model/Settings'
import windowSnap from '../../../model/snapShot'
import Logger from '../../../model/Logger'
import Utils from '../../../model/Utils'
import { Driver, ON } from '@kit.TestKit';

const PAGE_URI = 'testability/pages/scenario/action_event/MouseBackwardanalysis/MouseBackwardanalysis';

export default function mouseBackwardanalysisTest() {
  describe('mouseBackwardanalysisTest', () => {
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
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_MOUSE_BACKWARDANALYSIS_0030
     * @tc.name   : 将鼠标从一个组件来回快速移动到另一个组件
     * @tc.desc   : Verify action event commonevent mouse backwardanalysis interface behavior and expected UI result for this case.
     * @tc.type   : 将鼠标从一个组件来回快速移动到另一个组件，日志打印的鼠标坐标均正常
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_MOUSE_BACKWARDANALYSIS_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_MOUSE_BACKWARDANALYSIS_0030 start.`);
      Settings.createWindow(PAGE_URI);
      let driver = await Driver.create();
      await driver.waitForIdle(500, 2000);
      let compA = await driver.waitForComponent(ON.id('MouseBackwardanalysis_A'), 2000);
      let compB = await driver.waitForComponent(ON.id('MouseBackwardanalysis_B'), 2000);
      let boundsA = await compA.getBounds();
      let boundsB = await compB.getBounds();
      let cxA = boundsA.left + (boundsA.right - boundsA.left) / 2;
      let cyA = boundsA.top + (boundsA.bottom - boundsA.top) / 2;
      let cxB = boundsB.left + (boundsB.right - boundsB.left) / 2;
      let cyB = boundsB.top + (boundsB.bottom - boundsB.top) / 2;
      for (let i = 0; i < 5; i++) {
        await driver.click(cxA, cyA);
        await Utils.sleep(100);
        await driver.click(cxB, cyB);
        await Utils.sleep(100);
      }
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_MOUSE_BACKWARDANALYSIS_0030 finish.`);
      done();
    });
  });
}