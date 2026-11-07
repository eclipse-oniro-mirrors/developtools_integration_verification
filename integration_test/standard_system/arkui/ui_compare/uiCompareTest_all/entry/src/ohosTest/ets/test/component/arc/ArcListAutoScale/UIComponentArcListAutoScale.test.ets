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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import Settings from '../../../model/Settings'
import windowSnap from '../../../model/snapShot'
import Logger from '../../../model/Logger'
import Utils from '../../../model/Utils'
import { Driver, ON, Component, MouseButton } from '@kit.TestKit'
import { BusinessError } from '@kit.BasicServicesKit';

export default function uIComponentArcListAutoScaleTest() {
  describe('uIComponentArcListAutoScaleTest', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        return;
      }

      Settings.windowClass.destroyWindow((err: BusinessError) => {
        if (err) {
          Logger.error('TEST', `Failed to destroy the window. Cause : ${JSON.stringify(err)}`)
          return;
        }
        Logger.info('TEST', `Succeeded in destroy the window.`);
      })
      await Utils.sleep(1000);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_ARCLIST_AUTOSCALE_0010
     * @tc.name   : Arclist autoscale
     * @tc.desc   : Verify arclist autoscale interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_ARCLIST_AUTOSCALE_0010', Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_ARCLIST_AUTOSCALE_0010';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/arc/ArcListAutoScale/UIComponentArcListAutoScale001');
      let driver: Driver = Driver.create();
      let arcList: Component = await driver.waitForComponent(ON.type('ArcList'), 1000);
      let point = await arcList.getBoundsCenter();
      console.info(`${caseName} point is ${JSON.stringify(point)}`);
      await driver.swipe(point.x, point.y + 30, point.x, point.y - 30);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ARCLIST_AUTOSCALE_0010');
      let button1: Component = await driver.waitForComponent(ON.id('false'), 1000);
      await button1.click();
      await driver.swipe(point.x, point.y + 30, point.x, point.y - 30);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ARCLIST_AUTOSCALE_0010_02');
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ARCLIST_AUTOSCALE_0010');
      let button2: Component = await driver.waitForComponent(ON.id('undefined'), 1000);
      await button2.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ARCLIST_AUTOSCALE_0010_03');
      await driver.swipe(point.x, point.y + 30, point.x, point.y - 30);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_ARCLIST_AUTOSCALE_0010');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });
  })
}