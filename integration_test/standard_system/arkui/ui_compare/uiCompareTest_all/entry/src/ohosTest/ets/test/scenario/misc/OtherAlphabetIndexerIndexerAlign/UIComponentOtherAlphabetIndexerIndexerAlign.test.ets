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
import { i18n } from '@kit.LocalizationKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { Driver, ON, Component, MouseButton } from '@kit.TestKit'

export default function uIComponentOtherAlphabetIndexerIndexerAlign() {
  describe('uIComponentOtherAlphabetIndexerIndexerAlign', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_INDEXERALIGN_0090
     * @tc.name   : In Chinese mode, in the AlphabetIndexer container, set offset to 5 and do not set popupPosition
     * @tc.desc   : Verify other alphabetindexer indexeralign interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_INDEXERALIGN_0090', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_INDEXERALIGN_0090 start.`);
      try {
        i18n.System.setAppPreferredLanguage('zh');
      } catch(error) {
        let err: BusinessError = error as BusinessError;
        console.error(`call System.setAppPreferredLanguage failed, error code: ${err.code}, message: ${err.message}.`);
      }
      Settings.createWindow('testability/pages/scenario/misc/OtherAlphabetIndexerIndexerAlign/UIComponentOtherAlphabetIndexerIndexerAlign001');
      let driver: Driver = Driver.create();
      let alphabetIndexer: Component = await driver.waitForComponent(ON.type('AlphabetIndexer'), 1000);
      let point = await alphabetIndexer.getBoundsCenter();
      await driver.mouseClick({x:point.x, y: point.y - 150}, MouseButton.MOUSE_BUTTON_LEFT);
      await driver.waitForIdle(500, 1000);
      await driver.mouseLongClick({x:point.x - 70, y: point.y + 50}, MouseButton.MOUSE_BUTTON_LEFT);
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_INDEXERALIGN_0090');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_INDEXERALIGN_0090 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_INDEXERALIGN_0320
     * @tc.name   : Tibetan mode, in the AlphabetIndexer container, set offset to 5 and popupPosition
     * @tc.desc   : Verify other alphabetindexer indexeralign interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_INDEXERALIGN_0320', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_INDEXERALIGN_0320 start.`);
      try {
        i18n.System.setAppPreferredLanguage('bo');
      } catch(error) {
        let err: BusinessError = error as BusinessError;
        console.error(`call System.setAppPreferredLanguage failed, error code: ${err.code}, message: ${err.message}.`);
      }
      Settings.createWindow('testability/pages/scenario/misc/OtherAlphabetIndexerIndexerAlign/UIComponentOtherAlphabetIndexerIndexerAlign002');
      let driver: Driver = Driver.create();
      let alphabetIndexer: Component = await driver.waitForComponent(ON.type('AlphabetIndexer'), 1000);
      let point = await alphabetIndexer.getBoundsCenter();
      await driver.mouseClick({x:point.x, y: point.y - 150}, MouseButton.MOUSE_BUTTON_LEFT);
      await driver.waitForIdle(500, 1000);
      await driver.mouseLongClick({x:point.x - 70, y: point.y + 50}, MouseButton.MOUSE_BUTTON_LEFT);
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_INDEXERALIGN_0320');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_OTHER_ALPHABETINDEXER_INDEXERALIGN_0320 finish.`);
      done();
    });
  })
}