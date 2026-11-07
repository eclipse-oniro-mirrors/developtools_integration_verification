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

import { describe, it, expect, beforeEach, afterEach } from '@ohos/hypium';
import { Driver, ON } from '@kit.TestKit';
import Settings from '../../../model/Settings';
import windowSnap from '../../../model/snapShot';
import Logger from '../../../model/Logger';

export default function uiComponentMediaImageAnimateDisplayTest() {
  describe('uiComponentMediaImageAnimateDisplayTest', () => {
    let driver: Driver = Driver.create();

    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ANIMATE_DISPLAY_0010
     * @tc.name   : ImageAnimateDisplay0010
     * @tc.desc   : Verify media Image animate display interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ANIMATE_DISPLAY_0010', 0, async (done: Function) => {
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ANIMATE_DISPLAY_0010 start');
      await Settings.createWindow('testability/pages/component/image/MediaImageAnimateDisplay/ImageAnimateDisplay0010');
      await driver.delayMs(1000);

      let staticBg = await driver.findComponent(ON.id('static_bg'));
      expect(staticBg !== null).assertTrue();

      let toggleBtn = await driver.findComponent(ON.id('btn_toggle'));
      if (toggleBtn) {
        await toggleBtn.click();
        await driver.delayMs(500);
      }

      await windowSnap.snapShot();
      await driver.delayMs(500);
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ANIMATE_DISPLAY_0010 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ANIMATE_DISPLAY_0011
     * @tc.name   : ImageAnimateDisplay0011
     * @tc.desc   : Verify media Image animate display interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ANIMATE_DISPLAY_0011', 0, async (done: Function) => {
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ANIMATE_DISPLAY_0011 start');
      await Settings.createWindow('testability/pages/component/image/MediaImageAnimateDisplay/ImageAnimateDisplay0011');
      await driver.delayMs(1000);

      let staticBg = await driver.findComponent(ON.id('static_bg'));
      expect(staticBg !== null).assertTrue();

      let landscapeBtn = await driver.findComponent(ON.id('btn_landscape'));
      if (landscapeBtn) {
        await landscapeBtn.click();
        await driver.delayMs(500);
      }

      await windowSnap.snapShot();
      await driver.delayMs(500);
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ANIMATE_DISPLAY_0011 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ANIMATE_DISPLAY_0012
     * @tc.name   : ImageAnimateDisplay0012
     * @tc.desc   : Verify media Image animate display interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ANIMATE_DISPLAY_0012', 0, async (done: Function) => {
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ANIMATE_DISPLAY_0012 start');
      await Settings.createWindow('testability/pages/component/image/MediaImageAnimateDisplay/ImageAnimateDisplay0012');
      await driver.delayMs(1000);

      let staticSingle = await driver.findComponent(ON.id('static_single'));
      expect(staticSingle !== null).assertTrue();

      let reenterBtn = await driver.findComponent(ON.id('btn_simulate_reenter'));
      if (reenterBtn) {
        await reenterBtn.click();
        await driver.delayMs(500);
      }

      await windowSnap.snapShot();
      await driver.delayMs(500);
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ANIMATE_DISPLAY_0012 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ANIMATE_DISPLAY_0013
     * @tc.name   : ImageAnimateDisplay0013
     * @tc.desc   : Verify media Image animate display interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ANIMATE_DISPLAY_0013', 0, async (done: Function) => {
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ANIMATE_DISPLAY_0013 start');
      await Settings.createWindow('testability/pages/component/image/MediaImageAnimateDisplay/ImageAnimateDisplay0013');
      await driver.delayMs(1000);

      let staticSingle = await driver.findComponent(ON.id('static_single'));
      expect(staticSingle !== null).assertTrue();

      let simulateBtn = await driver.findComponent(ON.id('btn_simulate'));
      if (simulateBtn) {
        await simulateBtn.click();
        await driver.delayMs(500);
      }

      await windowSnap.snapShot();
      await driver.delayMs(500);
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ANIMATE_DISPLAY_0013 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ANIMATE_DISPLAY_0014
     * @tc.name   : ImageAnimateDisplay0014
     * @tc.desc   : Verify media Image animate display interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ANIMATE_DISPLAY_0014', 0, async (done: Function) => {
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ANIMATE_DISPLAY_0014 start');
      await Settings.createWindow('testability/pages/component/image/MediaImageAnimateDisplay/ImageAnimateDisplay0014');
      await driver.delayMs(1000);

      let dynamicSingle = await driver.findComponent(ON.id('dynamic_single'));
      expect(dynamicSingle !== null).assertTrue();

      let reenterBtn = await driver.findComponent(ON.id('btn_simulate_reenter'));
      if (reenterBtn) {
        await reenterBtn.click();
        await driver.delayMs(500);
      }

      await windowSnap.snapShot();
      await driver.delayMs(500);
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ANIMATE_DISPLAY_0014 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ANIMATE_DISPLAY_0015
     * @tc.name   : ImageAnimateDisplay0015
     * @tc.desc   : Verify media Image animate display interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ANIMATE_DISPLAY_0015', 0, async (done: Function) => {
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ANIMATE_DISPLAY_0015 start');
      await Settings.createWindow('testability/pages/component/image/MediaImageAnimateDisplay/ImageAnimateDisplay0015');
      await driver.delayMs(1000);

      let dynamicSingle = await driver.findComponent(ON.id('dynamic_single'));
      expect(dynamicSingle !== null).assertTrue();

      let simulateBtn = await driver.findComponent(ON.id('btn_simulate'));
      if (simulateBtn) {
        await simulateBtn.click();
        await driver.delayMs(500);
      }

      await windowSnap.snapShot();
      await driver.delayMs(500);
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ANIMATE_DISPLAY_0015 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ANIMATE_DISPLAY_0016
     * @tc.name   : ImageAnimateDisplay0016
     * @tc.desc   : Verify media Image animate display interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ANIMATE_DISPLAY_0016', 0, async (done: Function) => {
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ANIMATE_DISPLAY_0016 start');
      await Settings.createWindow('testability/pages/component/image/MediaImageAnimateDisplay/ImageAnimateDisplay0016');
      await driver.delayMs(1500);

      let taskImg1 = await driver.findComponent(ON.id('task_img_1'));
      expect(taskImg1 !== null).assertTrue();

      let taskImg4 = await driver.findComponent(ON.id('task_img_4'));
      expect(taskImg4 !== null).assertTrue();

      let reenterBtn = await driver.findComponent(ON.id('btn_reenter'));
      if (reenterBtn) {
        await reenterBtn.click();
        await driver.delayMs(500);
      }

      await windowSnap.snapShot();
      await driver.delayMs(500);
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ANIMATE_DISPLAY_0016 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ANIMATE_DISPLAY_0017
     * @tc.name   : ImageAnimateDisplay0017
     * @tc.desc   : Verify media Image animate display interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ANIMATE_DISPLAY_0017', 0, async (done: Function) => {
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ANIMATE_DISPLAY_0017 start');
      await Settings.createWindow('testability/pages/component/image/MediaImageAnimateDisplay/ImageAnimateDisplay0017');
      await driver.delayMs(1500);

      let taskImg1 = await driver.findComponent(ON.id('task_img_1'));
      expect(taskImg1 !== null).assertTrue();

      let landscapeBtn = await driver.findComponent(ON.id('btn_landscape'));
      if (landscapeBtn) {
        await landscapeBtn.click();
        await driver.delayMs(500);
      }

      let reenterBtn = await driver.findComponent(ON.id('btn_reenter'));
      if (reenterBtn) {
        await reenterBtn.click();
        await driver.delayMs(500);
      }

      await windowSnap.snapShot();
      await driver.delayMs(500);
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ANIMATE_DISPLAY_0017 end');
      done();
    });
  });
}
