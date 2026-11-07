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

export default function columnMatchParent0070() {

  describe('columnMatchParent0070', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        return
      }

      Settings.windowClass.destroyWindow((err) => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0070
     * @tc.name   : Column matchparent
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : A Column component nests a Column1 component. The outer Column has no width or height set, while the Column1 component sets width(AdaptiveLayoutModePolicy.MATCH_PARENT) and height(AdaptiveLayoutModePolicy.MATCH_PARENT).
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0070', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0070 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParent/ColumnMatchParent0070')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0060
     * @tc.name   : Column matchparent
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : The Column component nests a Column1 component. The outer Column does not have its width or height explicitly set, while the inner Column1 component sets its height using height(AdaptiveLayoutModePolicy.MATCH_PARENT).
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0060', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0060 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParent/ColumnMatchParent0060')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0010
     * @tc.name   : Column matchparent
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : A Column component nests a Column1 component. The outer Column is set with width 100 and height 200 (width: 100, height: 200), while the inner Column1 component sets its width using width(AdaptiveLayoutModePolicy.MATCH_PARENT).
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0010', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0010 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParent/ColumnMatchParent0010')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0050
     * @tc.name   : Column matchparent
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : The Column component nests a Column1 component. The outer Column does not have its width or height explicitly set, while the inner Column1 component sets its width using width(AdaptiveLayoutModePolicy.MATCH_PARENT).
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0050', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0050 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParent/ColumnMatchParent0050')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0090
     * @tc.name   : Column matchparent
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : The Row component nests a Row1 component. The outer Row is set with width 100 and height 200 (width: 100, height: 200), while the inner Row1 component sets its width using width(AdaptiveLayoutModePolicy.MATCH_PARENT).
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0090', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0090 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParent/ColumnMatchParent0090')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0020
     * @tc.name   : Column matchparent
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : The Column component nests a Column1 component. The outer Column is set with a width of 100 and a height of 200 (width: 100, height: 200), while the inner Column1 component sets its height using height(AdaptiveLayoutModePolicy.MATCH_PARENT).
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0020', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0020 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParent/ColumnMatchParent0020')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0030
     * @tc.name   : Column matchparent
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : A Column component nests a Column1 component. The outer Column is set with width 100 and height 200 (width: 100, height: 200), while the inner Column1 component sets its width and height using AdaptiveLayoutModePolicy.MATCH_PARENT.
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0030', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0030 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParent/ColumnMatchParent0030')
      let driver:Driver = Driver.create();
     await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0130
     * @tc.name   : Column matchparent
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : A Row component nests a Row1 component. The outer Row has no width or height set, while the Row1 component sets its width using AdaptiveLayoutModePolicy.MATCH_PARENT.
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0130', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0130 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParent/ColumnMatchParent0130')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0130 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0100
     * @tc.name   : Column matchparent
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : A Row component nests a Row1 component. The outer Row is configured with a width of 100 and a height of 200 (width: 100, height: 200), while the inner Row1 component sets its height using AdaptiveLayoutModePolicy.MATCH_PARENT.
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0100', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0100 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParent/ColumnMatchParent0100')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0100 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0110
     * @tc.name   : Column matchparent
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : A Row component nests a Row1 component. The outer Row is set with width 100 and height 200 (width: 100, height: 200), while the inner Row1 component sets its width and height using AdaptiveLayoutModePolicy.MATCH_PARENT.
     * @tc.size   : MediumTest
     * @tc.level  : 1
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0110', Level.LEVEL1, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0110 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParent/ColumnMatchParent0110')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0110 finish.`);
      done()
    })

  })
}