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
import { Driver, MouseButton, ON, Component } from '@kit.TestKit'

export default function uIComponentOtherAlphabetIndexerVibration() {
  describe('uIComponentOtherAlphabetIndexerVibration', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_VIBRATION_0180
     * @tc.name   : Enable HapticFeedback to true, set the height of item to 10, click on the index bar letter
     * @tc.desc   : Verify other alphabetindexer vibration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_VIBRATION_0180', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_VIBRATION_0180 start.`);
      Settings.createWindow('testability/pages/scenario/misc/OtherAlphabetIndexerVibration/UIComponentOtherAlphabetIndexerVibration001');
      let driver: Driver = Driver.create();
      let alphabetIndexer: Component = await driver.waitForComponent(ON.type('AlphabetIndexer'), 1000);
      let point = await alphabetIndexer.getBoundsCenter();
      await driver.mouseClick({x:point.x, y: point.y - 150}, MouseButton.MOUSE_BUTTON_LEFT);
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_VIBRATION_0180');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_VIBRATION_0180 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_VIBRATION_0010
     * @tc.name   : EnableHapticFeedback is not set, default value is true, click on the index bar letter
     * @tc.desc   : Verify other alphabetindexer vibration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_VIBRATION_0010', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_VIBRATION_0010 start.`);
      Settings.createWindow('testability/pages/scenario/misc/OtherAlphabetIndexerVibration/UIComponentOtherAlphabetIndexerVibration002');
      let driver: Driver = Driver.create();
      let alphabetIndexer: Component = await driver.waitForComponent(ON.type('AlphabetIndexer'), 1000);
      let point = await alphabetIndexer.getBoundsCenter();
      await driver.mouseClick({x:point.x, y: point.y - 150}, MouseButton.MOUSE_BUTTON_LEFT);
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_VIBRATION_0010');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_VIBRATION_0010 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_VIBRATION_0100
     * @tc.name   : EnableHapticFeedback set to true, long press the index bar letter
     * @tc.desc   : Verify other alphabetindexer vibration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_VIBRATION_0100', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_VIBRATION_0100 start.`);
      Settings.createWindow('testability/pages/scenario/misc/OtherAlphabetIndexerVibration/UIComponentOtherAlphabetIndexerVibration003');
      let driver: Driver = Driver.create();
      let alphabetIndexer: Component = await driver.waitForComponent(ON.type('AlphabetIndexer'), 1000);
      let point = await alphabetIndexer.getBoundsCenter();
      await driver.mouseLongClick({x:point.x, y: point.y - 150}, MouseButton.MOUSE_BUTTON_LEFT);
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_VIBRATION_0100');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_VIBRATION_0100 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_VIBRATION_0110
     * @tc.name   : EnableHapticFeedback set to true, release and switch index bar letters
     * @tc.desc   : Verify other alphabetindexer vibration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_VIBRATION_0110', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_VIBRATION_0110 start.`);
      Settings.createWindow('testability/pages/scenario/misc/OtherAlphabetIndexerVibration/UIComponentOtherAlphabetIndexerVibration004');
      let driver: Driver = Driver.create();
      let alphabetIndexer: Component = await driver.waitForComponent(ON.type('AlphabetIndexer'), 1000);
      let point = await alphabetIndexer.getBoundsCenter();
      await driver.fling({x: point.x, y: point.y - 40}, {x: point.x, y: point.y}, 5, 600);
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_VIBRATION_0110');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_VIBRATION_0110 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_VIBRATION_0030
     * @tc.name   : EnableHapticFeedback set to true, release and switch index bar letters
     * @tc.desc   : Verify other alphabetindexer vibration interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_VIBRATION_0030', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_VIBRATION_0030 start.`);
      Settings.createWindow('testability/pages/scenario/misc/OtherAlphabetIndexerVibration/UIComponentOtherAlphabetIndexerVibration005');
      let driver: Driver = Driver.create();
      let alphabetIndexer: Component = await driver.waitForComponent(ON.type('AlphabetIndexer'), 1000);
      let point = await alphabetIndexer.getBoundsCenter();
      await driver.fling({x: point.x, y: point.y - 40}, {x: point.x, y: point.y}, 5, 600);
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_VIBRATION_0030');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_VIBRATION_0030 finish.`);
      done();
    });
  })
}