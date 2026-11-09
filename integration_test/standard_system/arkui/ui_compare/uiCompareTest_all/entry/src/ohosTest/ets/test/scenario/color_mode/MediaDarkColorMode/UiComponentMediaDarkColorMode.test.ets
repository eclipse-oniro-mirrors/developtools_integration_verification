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

import { describe, it, expect, afterEach } from '@ohos/hypium';
import { Driver, ON } from '@kit.TestKit';
import Settings from '../../../model/Settings';
import windowSnap from '../../../model/snapShot';
import Logger from '../../../model/Logger';

export default function uiComponentMediaDarkColorModeTest() {
  describe('uiComponentMediaDarkColorModeTest', () => {
    afterEach(async () => {
      if (Settings.windowClass) {
        Settings.destroyWindow(Settings.windowClass);
      }
      let driver = Driver.create();
      await driver.delayMs(500);
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_Dark_COLOR_MODE_0012
     * @tc.name   : Image ColorFilter深色模式测试
     * @tc.desc   : Verify media dark color mode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_Dark_COLOR_MODE_0012', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/scenario/color_mode/MediaDarkColorMode/DarkColorMode0012');
      let driver = Driver.create();
      await driver.delayMs(1000);
      let image = await driver.findComponent(ON.id('image_filtered'));
      expect(image !== null).assertTrue();
      await windowSnap.snapShot();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_Dark_COLOR_MODE_0014
     * @tc.name   : ImageAnimator深色模式测试
     * @tc.desc   : Verify media dark color mode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_Dark_COLOR_MODE_0014', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/scenario/color_mode/MediaDarkColorMode/DarkColorMode0014');
      let driver = Driver.create();
      await driver.delayMs(1000);
      let animator = await driver.findComponent(ON.id('image_animator'));
      expect(animator !== null).assertTrue();
      await windowSnap.snapShot();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_Dark_COLOR_MODE_0017
     * @tc.name   : ImageSpan颜色滤镜深色模式测试
     * @tc.desc   : Verify media dark color mode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_Dark_COLOR_MODE_0017', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/scenario/color_mode/MediaDarkColorMode/DarkColorMode0017');
      let driver = Driver.create();
      await driver.delayMs(1000);
      await windowSnap.snapShot();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_Dark_COLOR_MODE_0018
     * @tc.name   : DataPanel深色模式测试
     * @tc.desc   : Verify media dark color mode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_Dark_COLOR_MODE_0018', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/scenario/color_mode/MediaDarkColorMode/DarkColorMode0018');
      let driver = Driver.create();
      await driver.delayMs(1000);
      let dataPanel = await driver.findComponent(ON.id('data_panel'));
      expect(dataPanel !== null).assertTrue();
      await windowSnap.snapShot();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_Dark_COLOR_MODE_0020
     * @tc.name   : DataPanel底板颜色深色模式测试
     * @tc.desc   : Verify media dark color mode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_Dark_COLOR_MODE_0020', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/scenario/color_mode/MediaDarkColorMode/DarkColorMode0020');
      let driver = Driver.create();
      await driver.delayMs(1000);
      let dataPanel = await driver.findComponent(ON.id('data_panel'));
      expect(dataPanel !== null).assertTrue();
      await windowSnap.snapShot();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_Dark_COLOR_MODE_0021
     * @tc.name   : Gauge圆环深色模式测试
     * @tc.desc   : Verify media dark color mode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_Dark_COLOR_MODE_0021', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/scenario/color_mode/MediaDarkColorMode/DarkColorMode0021');
      let driver = Driver.create();
      await driver.delayMs(1000);
      let gauge = await driver.findComponent(ON.id('gauge'));
      expect(gauge !== null).assertTrue();
      await windowSnap.snapShot();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_Dark_COLOR_MODE_0022
     * @tc.name   : set dark color mode，loadingProgress scenario
     * @tc.desc   : Verify the interface under test: set dark color mode，loadingProgress scenario.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_Dark_COLOR_MODE_0022', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/scenario/color_mode/MediaDarkColorMode/DarkColorMode0022');
      let driver = Driver.create();
      await driver.delayMs(1000);
      let loading = await driver.findComponent(ON.id('loading_progress'));
      expect(loading !== null).assertTrue();
      await windowSnap.snapShot();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_Dark_COLOR_MODE_0023
     * @tc.name   : LoadingProgress设置颜色深色模式测试
     * @tc.desc   : Verify media dark color mode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_Dark_COLOR_MODE_0023', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/scenario/color_mode/MediaDarkColorMode/DarkColorMode0023');
      let driver = Driver.create();
      await driver.delayMs(1000);
      let loading = await driver.findComponent(ON.id('loading_progress'));
      expect(loading !== null).assertTrue();
      await windowSnap.snapShot();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_Dark_COLOR_MODE_0026
     * @tc.name   : set dark color mode，Progress
     * @tc.desc   : Verify the interface under test: set dark color mode，Progress.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_Dark_COLOR_MODE_0026', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/scenario/color_mode/MediaDarkColorMode/DarkColorMode0026');
      let driver = Driver.create();
      await driver.delayMs(1000);
      let progress = await driver.findComponent(ON.id('progress_linear'));
      expect(progress !== null).assertTrue();
      await windowSnap.snapShot();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_Dark_COLOR_MODE_0027
     * @tc.name   : QRCode深色模式测试
     * @tc.desc   : Verify media dark color mode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_Dark_COLOR_MODE_0027', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/scenario/color_mode/MediaDarkColorMode/DarkColorMode0027');
      let driver = Driver.create();
      await driver.delayMs(1000);
      let qrCode = await driver.findComponent(ON.id('qr_code'));
      expect(qrCode !== null).assertTrue();
      await windowSnap.snapShot();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_Dark_COLOR_MODE_0028
     * @tc.name   : QRCode应用场景深色模式测试
     * @tc.desc   : Verify media dark color mode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_Dark_COLOR_MODE_0028', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/scenario/color_mode/MediaDarkColorMode/DarkColorMode0028');
      let driver = Driver.create();
      await driver.delayMs(1000);
      let qrCode = await driver.findComponent(ON.id('qr_code'));
      expect(qrCode !== null).assertTrue();
      await windowSnap.snapShot();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_Dark_COLOR_MODE_0029
     * @tc.name   : Badge深色模式测试
     * @tc.desc   : Verify media dark color mode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_Dark_COLOR_MODE_0029', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/scenario/color_mode/MediaDarkColorMode/DarkColorMode0029');
      let driver = Driver.create();
      await driver.delayMs(1000);
      let badge = await driver.findComponent(ON.id('badge'));
      expect(badge !== null).assertTrue();
      await windowSnap.snapShot();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_Dark_COLOR_MODE_0030
     * @tc.name   : Badge应用场景深色模式测试
     * @tc.desc   : Verify media dark color mode interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_Dark_COLOR_MODE_0030', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/scenario/color_mode/MediaDarkColorMode/DarkColorMode0030');
      let driver = Driver.create();
      await driver.delayMs(1000);
      let badge = await driver.findComponent(ON.id('badge_app'));
      expect(badge !== null).assertTrue();
      await windowSnap.snapShot();
      done();
    });
  });
}
