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

export default function uIComponentListAndGridListClipContentTest() {
  describe('uIComponentListAndGridListClipContentTest', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_CLIPCONTENT_0040
     * @tc.name   : Listandgrid list clipcontent
     * @tc.desc   : Verify listandgrid list clipcontent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_CLIPCONTENT_0040', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_CLIPCONTENT_0040 start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListClipContent/UIComponentListAndGridListClipContent001');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_CLIPCONTENT_0040');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_CLIPCONTENT_0040 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_CLIPCONTENT_0050
     * @tc.name   : Listandgrid list clipcontent
     * @tc.desc   : Verify listandgrid list clipcontent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_CLIPCONTENT_0050', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_CLIPCONTENT_0050 start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListClipContent/UIComponentListAndGridListClipContent002');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_CLIPCONTENT_0050');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_CLIPCONTENT_0050 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_CLIPCONTENT_0070
     * @tc.name   : Listandgrid list clipcontent
     * @tc.desc   : Verify listandgrid list clipcontent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_CLIPCONTENT_0070', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_CLIPCONTENT_0070 start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListClipContent/UIComponentListAndGridListClipContent003');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_CLIPCONTENT_0070_05');
      let button1: Component = await driver.waitForComponent(ON.id('-1'), 1000);
      await button1.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_CLIPCONTENT_0070_04');
      let button2: Component = await driver.waitForComponent(ON.id('undefined'), 1000);
      await button2.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_CLIPCONTENT_0070_03');
      let button3: Component = await driver.waitForComponent(ON.id('null'), 1000);
      await button3.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_CLIPCONTENT_0070_02');
      let button4: Component = await driver.waitForComponent(ON.id('70000'), 1000);
      await button4.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_CLIPCONTENT_0070');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_CLIPCONTENT_0070 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_CLIPCONTENT_0020
     * @tc.name   : Listandgrid list clipcontent
     * @tc.desc   : Verify listandgrid list clipcontent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_CLIPCONTENT_0020', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_CLIPCONTENT_0020 start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListClipContent/UIComponentListAndGridListClipContent004');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_CLIPCONTENT_0020');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_CLIPCONTENT_0020 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_CLIPCONTENT_0060
     * @tc.name   : Listandgrid list clipcontent
     * @tc.desc   : Verify listandgrid list clipcontent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_CLIPCONTENT_0060', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_CLIPCONTENT_0060 start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListClipContent/UIComponentListAndGridListClipContent005');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_CLIPCONTENT_0060');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_CLIPCONTENT_0060 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_CLIPCONTENT_0030
     * @tc.name   : Listandgrid list clipcontent
     * @tc.desc   : Verify listandgrid list clipcontent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_CLIPCONTENT_0030', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_CLIPCONTENT_0030 start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListClipContent/UIComponentListAndGridListClipContent006');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_CLIPCONTENT_0030_05');
      let button1: Component = await driver.waitForComponent(ON.id('-1'), 1000);
      await button1.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_CLIPCONTENT_0030_04');
      let button2: Component = await driver.waitForComponent(ON.id('undefined'), 1000);
      await button2.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_CLIPCONTENT_0030_03');
      let button3: Component = await driver.waitForComponent(ON.id('null'), 1000);
      await button3.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_CLIPCONTENT_0030_02');
      let button4: Component = await driver.waitForComponent(ON.id('200%'), 1000);
      await button4.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_CLIPCONTENT_0030');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_CLIPCONTENT_0030 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_CLIPCONTENT_0080
     * @tc.name   : Listandgrid list clipcontent
     * @tc.desc   : Verify listandgrid list clipcontent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_CLIPCONTENT_0080', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_CLIPCONTENT_0080 start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListClipContent/UIComponentListAndGridListClipContent007');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_CLIPCONTENT_0080');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_CLIPCONTENT_0080 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_CLIPCONTENT_0090
     * @tc.name   : Listandgrid list clipcontent
     * @tc.desc   : Verify listandgrid list clipcontent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_CLIPCONTENT_0090', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_CLIPCONTENT_0090 start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListClipContent/UIComponentListAndGridListClipContent009');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_CLIPCONTENT_0090_05');
      let button1: Component = await driver.waitForComponent(ON.id('-1'), 1000);
      await button1.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_CLIPCONTENT_0090_04');
      let button2: Component = await driver.waitForComponent(ON.id('undefined'), 1000);
      await button2.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_CLIPCONTENT_0090_03');
      let button3: Component = await driver.waitForComponent(ON.id('null'), 1000);
      await button3.click();
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_CLIPCONTENT_0090_02');
      let button4: Component = await driver.waitForComponent(ON.id('70000'), 1000);
      await button4.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_CLIPCONTENT_0090');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_CLIPCONTENT_0090 finish.`);
      done();
    });
  })
}