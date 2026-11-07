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
import { Driver, ON, Component } from '@kit.TestKit'
import { uiAppearance } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

export default function uIComponentMediaCounterLargeFontTest() {
  describe('uIComponentMediaCounterLargeFontTest', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        return;
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
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_COUNTER_LARGE_FONT_0010
     * @tc.name   : Media counter large font / aging font
     * @tc.desc   : Verify media counter large font / aging font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_COUNTER_LARGE_FONT_0010', Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_MEDIA_COUNTER_LARGE_FONT_0010';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/form/MediaCounterLargeFont/UIComponentMediaCounterLargeFont001');
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('click'), 1000);
      await button1.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_COUNTER_LARGE_FONT_0010_06');
      let button2: Component = await driver.waitForComponent(ON.id('click'), 1000);
      await button2.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_COUNTER_LARGE_FONT_0010_05');
      let button3: Component = await driver.waitForComponent(ON.id('click'), 1000);
      await button3.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_COUNTER_LARGE_FONT_0010_04');
      let button4: Component = await driver.waitForComponent(ON.id('click'), 1000);
      await button4.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_COUNTER_LARGE_FONT_0010_03');
      let button5: Component = await driver.waitForComponent(ON.id('click'), 1000);
      await button5.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_COUNTER_LARGE_FONT_0010_02');
      let button6: Component = await driver.waitForComponent(ON.id('click'), 1000);
      await button6.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_COUNTER_LARGE_FONT_0010');
      try {
        uiAppearance.setFontScale(1).then(() => {
          console.info(`${caseName} Set fontScale1 successfully.`);
        }).catch((error:Error) => {
          console.error(`${caseName} Set fontScale failed, message is ${error.message}` );
          done();
        });
      } catch (error) {
        let message = (error as BusinessError).message;
        console.error(`${caseName} Set fontScale failed, messages: ${message}`);
      }
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_COUNTER_LARGE_FONT_0018
     * @tc.name   : Media counter large font / aging font
     * @tc.desc   : Verify media counter large font / aging font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_COUNTER_LARGE_FONT_0018', Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'SUB_ACE_UI_COMPONENT_MEDIA_COUNTER_LARGE_FONT_0018';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/form/MediaCounterLargeFont/UIComponentMediaCounterLargeFont002');
      let driver: Driver = Driver.create();
      let button1: Component = await driver.waitForComponent(ON.id('click'), 1000);
      await button1.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_COUNTER_LARGE_FONT_0018_06');
      let button2: Component = await driver.waitForComponent(ON.id('click'), 1000);
      await button2.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_COUNTER_LARGE_FONT_0018_05');
      let button3: Component = await driver.waitForComponent(ON.id('click'), 1000);
      await button3.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_COUNTER_LARGE_FONT_0018_04');
      let button4: Component = await driver.waitForComponent(ON.id('click'), 1000);
      await button4.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_COUNTER_LARGE_FONT_0018_03');
      let button5: Component = await driver.waitForComponent(ON.id('click'), 1000);
      await button5.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_COUNTER_LARGE_FONT_0018_02');
      let button6: Component = await driver.waitForComponent(ON.id('click'), 1000);
      await button6.click();
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MEDIA_COUNTER_LARGE_FONT_0018');
      try {
        uiAppearance.setFontScale(1).then(() => {
          console.info(`${caseName} Set fontScale1 successfully.`);
        }).catch((error:Error) => {
          console.error(`${caseName} Set fontScale failed, message is ${error.message}` );
          done();
        });
      } catch (error) {
        let message = (error as BusinessError).message;
        console.error(`${caseName} Set fontScale failed, messages: ${message}`);
      }
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });
  })
}