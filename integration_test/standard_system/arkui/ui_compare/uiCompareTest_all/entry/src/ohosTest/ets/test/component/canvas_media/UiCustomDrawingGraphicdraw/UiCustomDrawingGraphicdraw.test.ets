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

import { describe, it, afterEach } from '@ohos/hypium';
import Settings from '../../../model/Settings';
import windowSnap from '../../../model/snapShot';
import Logger from '../../../model/Logger';
import Utils from '../../../model/Utils';
import { Driver, ON, Component } from '@kit.TestKit';

export default function uiCustomDrawingGraphicdrawTest() {
  describe('uiCustomDrawingGraphicdrawTest', () => {
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
     * @tc.number : SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0530
     * @tc.name   : Custom drawing graphicdraw
     * @tc.desc   : Verify custom drawing graphicdraw interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0530', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0530 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/UiCustomDrawingGraphicdraw/UiCustomDrawingGraphicdraw0530');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0530 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0540
     * @tc.name   : Custom drawing graphicdraw
     * @tc.desc   : Verify custom drawing graphicdraw interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0540', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0540 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/UiCustomDrawingGraphicdraw/UiCustomDrawingGraphicdraw0540');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0540 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0550
     * @tc.name   : Custom drawing graphicdraw
     * @tc.desc   : Verify custom drawing graphicdraw interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0550', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0550 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/UiCustomDrawingGraphicdraw/UiCustomDrawingGraphicdraw0550');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0550 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0560
     * @tc.name   : Custom drawing graphicdraw
     * @tc.desc   : Verify custom drawing graphicdraw interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0560', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0560 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/UiCustomDrawingGraphicdraw/UiCustomDrawingGraphicdraw0560');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0560 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0570
     * @tc.name   : Custom drawing graphicdraw
     * @tc.desc   : Verify custom drawing graphicdraw interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0570', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0570 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/UiCustomDrawingGraphicdraw/UiCustomDrawingGraphicdraw0570');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0570 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0580
     * @tc.name   : Custom drawing graphicdraw
     * @tc.desc   : Verify custom drawing graphicdraw interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0580', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0580 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/UiCustomDrawingGraphicdraw/UiCustomDrawingGraphicdraw0580');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0580 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0590
     * @tc.name   : Custom drawing graphicdraw
     * @tc.desc   : Verify custom drawing graphicdraw interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0590', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0590 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/UiCustomDrawingGraphicdraw/UiCustomDrawingGraphicdraw0590');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0590 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0600
     * @tc.name   : Custom drawing graphicdraw
     * @tc.desc   : Verify custom drawing graphicdraw interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0600', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0600 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/UiCustomDrawingGraphicdraw/UiCustomDrawingGraphicdraw0600');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0600 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0610
     * @tc.name   : Custom drawing graphicdraw
     * @tc.desc   : Verify custom drawing graphicdraw interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0610', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0610 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/UiCustomDrawingGraphicdraw/UiCustomDrawingGraphicdraw0610');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0610 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0620
     * @tc.name   : Custom drawing graphicdraw
     * @tc.desc   : Verify custom drawing graphicdraw interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0620', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0620 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/UiCustomDrawingGraphicdraw/UiCustomDrawingGraphicdraw0620');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0620 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0630
     * @tc.name   : Custom drawing graphicdraw
     * @tc.desc   : Verify custom drawing graphicdraw interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0630', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0630 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/UiCustomDrawingGraphicdraw/UiCustomDrawingGraphicdraw0630');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0630 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0640
     * @tc.name   : Custom drawing graphicdraw
     * @tc.desc   : Verify custom drawing graphicdraw interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0640', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0640 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/UiCustomDrawingGraphicdraw/UiCustomDrawingGraphicdraw0640');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0640 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0650
     * @tc.name   : Custom drawing graphicdraw
     * @tc.desc   : Verify custom drawing graphicdraw interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0650', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0650 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/UiCustomDrawingGraphicdraw/UiCustomDrawingGraphicdraw0650');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0650 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0660
     * @tc.name   : Custom drawing graphicdraw
     * @tc.desc   : Verify custom drawing graphicdraw interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0660', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0660 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/UiCustomDrawingGraphicdraw/UiCustomDrawingGraphicdraw0660');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0660 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0670
     * @tc.name   : Custom drawing graphicdraw
     * @tc.desc   : Verify custom drawing graphicdraw interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0670', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0670 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/UiCustomDrawingGraphicdraw/UiCustomDrawingGraphicdraw0670');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0670 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0680
     * @tc.name   : Custom drawing graphicdraw
     * @tc.desc   : Verify custom drawing graphicdraw interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0680', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0680 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/UiCustomDrawingGraphicdraw/UiCustomDrawingGraphicdraw0680');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0680 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0690
     * @tc.name   : Custom drawing graphicdraw
     * @tc.desc   : Verify custom drawing graphicdraw interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0690', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0690 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/UiCustomDrawingGraphicdraw/UiCustomDrawingGraphicdraw0690');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0690 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0700
     * @tc.name   : Custom drawing graphicdraw
     * @tc.desc   : Verify custom drawing graphicdraw interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0700', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0700 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/UiCustomDrawingGraphicdraw/UiCustomDrawingGraphicdraw0700');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0700 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0710
     * @tc.name   : Custom drawing graphicdraw
     * @tc.desc   : Verify custom drawing graphicdraw interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0710', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0710 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/UiCustomDrawingGraphicdraw/UiCustomDrawingGraphicdraw0710');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0710 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0720
     * @tc.name   : Custom drawing graphicdraw
     * @tc.desc   : Verify custom drawing graphicdraw interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0720', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0720 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/UiCustomDrawingGraphicdraw/UiCustomDrawingGraphicdraw0720');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0720 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0730
     * @tc.name   : Custom drawing graphicdraw
     * @tc.desc   : Verify custom drawing graphicdraw interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0730', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0730 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/UiCustomDrawingGraphicdraw/UiCustomDrawingGraphicdraw0730');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0730 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0740
     * @tc.name   : Custom drawing graphicdraw
     * @tc.desc   : Verify custom drawing graphicdraw interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0740', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0740 start.`);
      Settings.createWindow('testability/pages/component/canvas_media/UiCustomDrawingGraphicdraw/UiCustomDrawingGraphicdraw0740');
      let driver: Driver = Driver.create();
      let component = await driver.waitForComponent(ON.id('btn'), 1000);
      await component.click();
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot();
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_CUSTOM_DRAWING_GRAPHICDRAW_0740 finish.`);
      done();
    });

  });
}