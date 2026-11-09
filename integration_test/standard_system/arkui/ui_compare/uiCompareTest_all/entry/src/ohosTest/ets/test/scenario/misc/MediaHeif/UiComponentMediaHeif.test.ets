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

export default function uiComponentMediaHeifTest() {
  describe('uiComponentMediaHeifTest', () => {
    let driver: Driver = Driver.create();

    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0010
     * @tc.name   : Heif0010
     * @tc.desc   : Verify media heif interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0010', 0, async (done: Function) => {
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0010 start');
      await Settings.createWindow('testability/pages/scenario/misc/MediaHeif/Heif0010');
      await driver.delayMs(1000);

      let resourceImg = await driver.findComponent(ON.id('heif_resource'));
      expect(resourceImg !== null).assertTrue();

      let localImg = await driver.findComponent(ON.id('heif_local'));
      expect(localImg !== null).assertTrue();

      await windowSnap.snapShot();
      await driver.delayMs(500);
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0010 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0020
     * @tc.name   : Heif0020
     * @tc.desc   : Verify media heif interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0020', 0, async (done: Function) => {
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0020 start');
      await Settings.createWindow('testability/pages/scenario/misc/MediaHeif/Heif0020');
      await driver.delayMs(1000);

      let altResource = await driver.findComponent(ON.id('heif_alt_resource'));
      expect(altResource !== null).assertTrue();

      await windowSnap.snapShot();
      await driver.delayMs(500);
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0020 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0030
     * @tc.name   : Heif0030
     * @tc.desc   : Verify media heif interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0030', 0, async (done: Function) => {
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0030 start');
      await Settings.createWindow('testability/pages/scenario/misc/MediaHeif/Heif0030');
      await driver.delayMs(1000);

      let coverImg = await driver.findComponent(ON.id('heif_cover'));
      expect(coverImg !== null).assertTrue();

      let containImg = await driver.findComponent(ON.id('heif_contain'));
      expect(containImg !== null).assertTrue();

      let scaledownImg = await driver.findComponent(ON.id('heif_scaledown'));
      expect(scaledownImg !== null).assertTrue();

      await windowSnap.snapShot();
      await driver.delayMs(500);
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0030 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0040
     * @tc.name   : Heif0040
     * @tc.desc   : Verify media heif interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0040', 0, async (done: Function) => {
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0040 start');
      await Settings.createWindow('testability/pages/scenario/misc/MediaHeif/Heif0040');
      await driver.delayMs(1000);

      let repeatImg = await driver.findComponent(ON.id('heif_repeat_y'));
      expect(repeatImg !== null).assertTrue();

      await windowSnap.snapShot();
      await driver.delayMs(500);
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0040 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0050
     * @tc.name   : Heif0050
     * @tc.desc   : Verify media heif interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0050', 0, async (done: Function) => {
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0050 start');
      await Settings.createWindow('testability/pages/scenario/misc/MediaHeif/Heif0050');
      await driver.delayMs(1000);

      let originalImg = await driver.findComponent(ON.id('heif_render_original'));
      expect(originalImg !== null).assertTrue();

      let templateImg = await driver.findComponent(ON.id('heif_render_template'));
      expect(templateImg !== null).assertTrue();

      await windowSnap.snapShot();
      await driver.delayMs(500);
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0050 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0070
     * @tc.name   : Heif0070
     * @tc.desc   : Verify media heif interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0070', 0, async (done: Function) => {
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0070 start');
      await Settings.createWindow('testability/pages/scenario/misc/MediaHeif/Heif0070');
      await driver.delayMs(1000);

      let copyImg = await driver.findComponent(ON.id('heif_copy_inapp'));
      expect(copyImg !== null).assertTrue();

      await windowSnap.snapShot();
      await driver.delayMs(500);
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0070 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0090
     * @tc.name   : Heif0090
     * @tc.desc   : Verify media heif interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0090', 0, async (done: Function) => {
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0090 start');
      await Settings.createWindow('testability/pages/scenario/misc/MediaHeif/Heif0090');
      await driver.delayMs(1000);

      let resourceSpan = await driver.findComponent(ON.id('imagespan_resource'));
      expect(resourceSpan !== null).assertTrue();

      await windowSnap.snapShot();
      await driver.delayMs(500);
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0090 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0100
     * @tc.name   : Heif0100
     * @tc.desc   : Verify media heif interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0100', 0, async (done: Function) => {
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0100 start');
      await Settings.createWindow('testability/pages/scenario/misc/MediaHeif/Heif0100');
      await driver.delayMs(1000);

      let coverSpan = await driver.findComponent(ON.id('imagespan_cover'));
      expect(coverSpan !== null).assertTrue();

      await windowSnap.snapShot();
      await driver.delayMs(500);
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0100 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0120
     * @tc.name   : Heif0120
     * @tc.desc   : Verify media heif interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0120', 0, async (done: Function) => {
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0120 start');
      await Settings.createWindow('testability/pages/scenario/misc/MediaHeif/Heif0120');
      await driver.delayMs(1000);

      let animator = await driver.findComponent(ON.id('heif_animator'));
      expect(animator !== null).assertTrue();

      let playBtn = await driver.findComponent(ON.id('btn_play'));
      if (playBtn) {
        await playBtn.click();
        await driver.delayMs(500);
      }

      await windowSnap.snapShot();
      await driver.delayMs(500);
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0120 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0130
     * @tc.name   : Heif0130
     * @tc.desc   : Verify media heif interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0130', 0, async (done: Function) => {
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0130 start');
      await Settings.createWindow('testability/pages/scenario/misc/MediaHeif/Heif0130');
      await driver.delayMs(2000);

      let animator = await driver.findComponent(ON.id('heif_animator_1s'));
      expect(animator !== null).assertTrue();

      await windowSnap.snapShot();
      await driver.delayMs(500);
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0130 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0140
     * @tc.name   : Heif0140
     * @tc.desc   : Verify media heif interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0140', 0, async (done: Function) => {
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0140 start');
      await Settings.createWindow('testability/pages/scenario/misc/MediaHeif/Heif0140');
      await driver.delayMs(1000);

      let bgResource = await driver.findComponent(ON.id('bg_resource'));
      expect(bgResource !== null).assertTrue();

      let bgLocal = await driver.findComponent(ON.id('bg_local'));
      expect(bgLocal !== null).assertTrue();

      await windowSnap.snapShot();
      await driver.delayMs(500);
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0140 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0150
     * @tc.name   : Heif0150
     * @tc.desc   : Verify media heif interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0150', 0, async (done: Function) => {
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0150 start');
      await Settings.createWindow('testability/pages/scenario/misc/MediaHeif/Heif0150');
      await driver.delayMs(1000);

      let borderResource = await driver.findComponent(ON.id('border_resource'));
      expect(borderResource !== null).assertTrue();

      await windowSnap.snapShot();
      await driver.delayMs(500);
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0150 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0160
     * @tc.name   : Heif0160
     * @tc.desc   : Verify media heif interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0160', 0, async (done: Function) => {
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0160 start');
      await Settings.createWindow('testability/pages/scenario/misc/MediaHeif/Heif0160');
      await driver.delayMs(1500);

      let ecoImg1 = await driver.findComponent(ON.id('eco_img_1'));
      expect(ecoImg1 !== null).assertTrue();

      let ecoImg6 = await driver.findComponent(ON.id('eco_img_6'));
      expect(ecoImg6 !== null).assertTrue();

      await windowSnap.snapShot();
      await driver.delayMs(500);
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_HEIF_0160 end');
      done();
    });
  });
}
