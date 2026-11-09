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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import Settings from '../../../model/Settings'
import windowSnap from '../../../model/snapShot'
import Logger from '../../../model/Logger'
import Utils from '../../../model/Utils'
import { Driver, ON, Component } from '@kit.TestKit';
import { displaySync } from '@kit.ArkGraphics2D'
import { BusinessError } from '@kit.BasicServicesKit'

export default function columnTest() {

  describe('columnTest', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        return
      }

      Settings.windowClass.destroyWindow((err:BusinessError) => {
        if (err.code) {
          Logger.error('TEST', `Failed to destroy the window. Cause : ${JSON.stringify(err)}`)
          return;
        }
        Logger.info('TEST', `Succeeded in destroy the window.`);
      })
      await Utils.sleep(1000);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0040
     * @tc.name   : A column nests a column1 component. The column sets width 100 and height 200. The column1 first
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0040 start.`);
      Settings.createWindow('testability/pages/component/layout/column_matchParent/column01')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0040')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0080
     * @tc.name   : A column nests a column1 component. The column does not set width and height. The column1 first
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0080 start.`);
      Settings.createWindow('testability/pages/component/layout/column_matchParent/column02')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0080')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0150
     * @tc.name   : A row nests a row1 component. The row does not set width and height. The row1 sets width to
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0150 start.`);
      Settings.createWindow('testability/pages/component/layout/column_matchParent/row01')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0150')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0150 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0160
     * @tc.name   : A row nests a row1 component. The row does not set width and height. The row1 first sets width 100
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0160 start.`);
      Settings.createWindow('testability/pages/component/layout/column_matchParent/row02')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0160')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0160 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0120
     * @tc.name   : A row nests a row1 component. The row sets width 100 and height 200. The row1 first sets width 100
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0120 start.`);
      Settings.createWindow('testability/pages/component/layout/column_matchParent/row03')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0120')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0140
     * @tc.name   : A row nests a row1 component. The row does not set width and height. The row1 sets height to
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0140 start.`);
      Settings.createWindow('testability/pages/component/layout/column_matchParent/row04')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0140')
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0140 finish.`);
      done()
    })
  })
}
