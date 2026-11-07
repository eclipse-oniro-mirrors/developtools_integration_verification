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

export default function uiComponentMediaImageTest() {
  describe('uiComponentMediaImageTest', () => {
    let driver: Driver = Driver.create();

    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ARKTSCARD_0010
     * @tc.name   : ImageArktscard0010
     * @tc.desc   : Verify media Image arktscard interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ARKTSCARD_0010', 0, async (done: Function) => {
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ARKTSCARD_0010 start');
      await Settings.createWindow('testability/pages/component/image/MediaImageAlt/ImageArktscard0010');
      await driver.delayMs(1000);
      let img = await driver.findComponent(ON.id('image_arktscard'));
      expect(img !== null).assertTrue();
      await windowSnap.snapShot();
      await driver.delayMs(500);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ARKTSCARD_0011
     * @tc.name   : ImageArktscard0011
     * @tc.desc   : Verify media Image arktscard interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ARKTSCARD_0011', 0, async (done: Function) => {
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ARKTSCARD_0011 start');
      await Settings.createWindow('testability/pages/component/image/MediaImageAlt/ImageArktscard0011');
      await driver.delayMs(1000);
      let img = await driver.findComponent(ON.id('image_base64_card'));
      expect(img !== null).assertTrue();
      await windowSnap.snapShot();
      await driver.delayMs(500);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ARKTSCARD_0013
     * @tc.name   : ImageArktscard0013
     * @tc.desc   : Verify media Image arktscard interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ARKTSCARD_0013', 0, async (done: Function) => {
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ARKTSCARD_0013 start');
      await Settings.createWindow('testability/pages/component/image/MediaImageAlt/ImageArktscard0013');
      await driver.delayMs(1000);
      let img = await driver.findComponent(ON.id('image_mode_switch'));
      expect(img !== null).assertTrue();
      let btn = await driver.findComponent(ON.id('btn_toggle_mode'));
      if (btn) {
        await btn.click();
        await driver.delayMs(500);
      }
      await windowSnap.snapShot();
      await driver.delayMs(500);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_BASE64_0010
     * @tc.name   : ImageBase640010
     * @tc.desc   : Verify media Image base64 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_BASE64_0010', 0, async (done: Function) => {
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_BASE64_0010 start');
      await Settings.createWindow('testability/pages/component/image/MediaImageAlt/ImageBase640010');
      await driver.delayMs(1000);
      let img = await driver.findComponent(ON.id('image_base64_gif'));
      expect(img !== null).assertTrue();
      await windowSnap.snapShot();
      await driver.delayMs(500);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_FOREGROUND_0010
     * @tc.name   : ImageForeground0010
     * @tc.desc   : Verify media Image foreground interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_FOREGROUND_0010', 0, async (done: Function) => {
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_FOREGROUND_0010 start');
      await Settings.createWindow('testability/pages/component/image/MediaImageAlt/ImageForeground0010');
      await driver.delayMs(1000);
      let bg = await driver.findComponent(ON.id('background_img'));
      expect(bg !== null).assertTrue();
      let fg = await driver.findComponent(ON.id('foreground_img'));
      expect(fg !== null).assertTrue();
      await windowSnap.snapShot();
      await driver.delayMs(500);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_GIF_0011
     * @tc.name   : ImageGif0011
     * @tc.desc   : Verify the interface under test for scenario described by case 'SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_GIF_0011'.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_GIF_0011', 0, async (done: Function) => {
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_GIF_0011 start');
      await Settings.createWindow('testability/pages/component/image/MediaImageAlt/ImageGif0011');
      await driver.delayMs(1000);
      let list = await driver.findComponent(ON.id('gif_list'));
      expect(list !== null).assertTrue();
      await windowSnap.snapShot();
      await driver.delayMs(500);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_INTERFACE_0720
     * @tc.name   : ImageInterface0720
     * @tc.desc   : Verify media Image interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_INTERFACE_0720', 0, async (done: Function) => {
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_INTERFACE_0720 start');
      await Settings.createWindow('testability/pages/component/image/MediaImageAlt/ImageInterface0720');
      await driver.delayMs(1000);
      let img = await driver.findComponent(ON.id('cross_module_image'));
      expect(img !== null).assertTrue();
      await windowSnap.snapShot();
      await driver.delayMs(500);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OBJECTFIT_ALIGN_0035
     * @tc.name   : ImageObjectfitAlign0035
     * @tc.desc   : Verify media Image objectfit align interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OBJECTFIT_ALIGN_0035', 0, async (done: Function) => {
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OBJECTFIT_ALIGN_0035 start');
      await Settings.createWindow('testability/pages/component/image/MediaImageAlt/ImageObjectfitAlign0035');
      await driver.delayMs(1000);
      let img = await driver.findComponent(ON.id('image_objectfit'));
      expect(img !== null).assertTrue();
      let btn = await driver.findComponent(ON.id('btn_contain'));
      if (btn) {
        await btn.click();
        await driver.delayMs(300);
      }
      await windowSnap.snapShot();
      await driver.delayMs(500);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONERROR_0011
     * @tc.name   : ImageOnerror0011
     * @tc.desc   : Verify media Image onerror interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONERROR_0011', 0, async (done: Function) => {
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONERROR_0011 start');
      await Settings.createWindow('testability/pages/component/image/MediaImageAlt/ImageOnerror0011');
      await driver.delayMs(1500);
      let img = await driver.findComponent(ON.id('image_network_error'));
      expect(img !== null).assertTrue();
      await windowSnap.snapShot();
      await driver.delayMs(500);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONERROR_0012
     * @tc.name   : ImageOnerror0012
     * @tc.desc   : Verify media Image onerror interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONERROR_0012', 0, async (done: Function) => {
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONERROR_0012 start');
      await Settings.createWindow('testability/pages/component/image/MediaImageAlt/ImageOnerror0012');
      await driver.delayMs(1000);
      let img = await driver.findComponent(ON.id('image_resource_error'));
      expect(img !== null).assertTrue();
      await windowSnap.snapShot();
      await driver.delayMs(500);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONERROR_0013
     * @tc.name   : ImageOnerror0013
     * @tc.desc   : Verify media Image onerror interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONERROR_0013', 0, async (done: Function) => {
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONERROR_0013 start');
      await Settings.createWindow('testability/pages/component/image/MediaImageAlt/ImageOnerror0013');
      await driver.delayMs(1000);
      let img = await driver.findComponent(ON.id('image_base64_error'));
      expect(img !== null).assertTrue();
      await windowSnap.snapShot();
      await driver.delayMs(500);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONERROR_0014
     * @tc.name   : ImageOnerror0014
     * @tc.desc   : Verify media Image onerror interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONERROR_0014', 0, async (done: Function) => {
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONERROR_0014 start');
      await Settings.createWindow('testability/pages/component/image/MediaImageAlt/ImageOnerror0014');
      await driver.delayMs(1000);
      let img = await driver.findComponent(ON.id('image_pixelmap_error'));
      expect(img !== null).assertTrue();
      await windowSnap.snapShot();
      await driver.delayMs(500);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONERROR_0015
     * @tc.name   : ImageOnerror0015
     * @tc.desc   : Verify media Image onerror interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONERROR_0015', 0, async (done: Function) => {
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONERROR_0015 start');
      await Settings.createWindow('testability/pages/component/image/MediaImageAlt/ImageOnerror0015');
      await driver.delayMs(1000);
      let img = await driver.findComponent(ON.id('image_sandbox_error'));
      expect(img !== null).assertTrue();
      await windowSnap.snapShot();
      await driver.delayMs(500);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONERROR_0016
     * @tc.name   : ImageOnerror0016
     * @tc.desc   : Verify media Image onerror interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONERROR_0016', 0, async (done: Function) => {
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONERROR_0016 start');
      await Settings.createWindow('testability/pages/component/image/MediaImageAlt/ImageOnerror0016');
      await driver.delayMs(1000);
      let img = await driver.findComponent(ON.id('image_relative_error'));
      expect(img !== null).assertTrue();
      await windowSnap.snapShot();
      await driver.delayMs(500);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONERROR_0017
     * @tc.name   : ImageOnerror0017
     * @tc.desc   : Verify media Image onerror interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONERROR_0017', 0, async (done: Function) => {
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONERROR_0017 start');
      await Settings.createWindow('testability/pages/component/image/MediaImageAlt/ImageOnerror0017');
      await driver.delayMs(1000);
      let img = await driver.findComponent(ON.id('image_media_error'));
      expect(img !== null).assertTrue();
      await windowSnap.snapShot();
      await driver.delayMs(500);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONERROR_0018
     * @tc.name   : ImageOnerror0018
     * @tc.desc   : Verify media Image onerror interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONERROR_0018', 0, async (done: Function) => {
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONERROR_0018 start');
      await Settings.createWindow('testability/pages/component/image/MediaImageAlt/ImageOnerror0018');
      await driver.delayMs(1000);
      let img = await driver.findComponent(ON.id('image_thumbnail_error'));
      expect(img !== null).assertTrue();
      await windowSnap.snapShot();
      await driver.delayMs(500);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONERROR_0019
     * @tc.name   : ImageOnerror0019
     * @tc.desc   : Verify media Image onerror interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONERROR_0019', 0, async (done: Function) => {
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONERROR_0019 start');
      await Settings.createWindow('testability/pages/component/image/MediaImageAlt/ImageOnerror0019');
      await driver.delayMs(1000);
      let img = await driver.findComponent(ON.id('image_memory_error'));
      expect(img !== null).assertTrue();
      await windowSnap.snapShot();
      await driver.delayMs(500);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONERROR_0020
     * @tc.name   : ImageOnerror0020
     * @tc.desc   : Verify media Image onerror interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONERROR_0020', 0, async (done: Function) => {
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONERROR_0020 start');
      await Settings.createWindow('testability/pages/component/image/MediaImageAlt/ImageOnerror0020');
      await driver.delayMs(1000);
      let img = await driver.findComponent(ON.id('image_astc_error'));
      expect(img !== null).assertTrue();
      await windowSnap.snapShot();
      await driver.delayMs(500);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONERROR_0021
     * @tc.name   : ImageOnerror0021
     * @tc.desc   : Verify media Image onerror interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONERROR_0021', 0, async (done: Function) => {
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONERROR_0021 start');
      await Settings.createWindow('testability/pages/component/image/MediaImageAlt/ImageOnerror0021');
      await driver.delayMs(1000);
      let img = await driver.findComponent(ON.id('image_decode_error'));
      expect(img !== null).assertTrue();
      await windowSnap.snapShot();
      await driver.delayMs(500);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OPACITY_0011
     * @tc.name   : ImageOpacity0011
     * @tc.desc   : Verify media Image opacity interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OPACITY_0011', 0, async (done: Function) => {
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_OPACITY_0011 start');
      await Settings.createWindow('testability/pages/component/image/MediaImageAlt/ImageOpacity0011');
      await driver.delayMs(1000);
      let img = await driver.findComponent(ON.id('image_opacity'));
      expect(img !== null).assertTrue();
      let btn = await driver.findComponent(ON.id('btn_neg1'));
      if (btn) {
        await btn.click();
        await driver.delayMs(300);
      }
      await windowSnap.snapShot();
      await driver.delayMs(500);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SRC_0010
     * @tc.name   : ImageSrc0010
     * @tc.desc   : Verify media Image src interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SRC_0010', 0, async (done: Function) => {
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SRC_0010 start');
      await Settings.createWindow('testability/pages/component/image/MediaImageAlt/ImageSrc0010');
      await driver.delayMs(1500);
      let img = await driver.findComponent(ON.id('image_network_cache'));
      expect(img !== null).assertTrue();
      await windowSnap.snapShot();
      await driver.delayMs(500);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_NEW_0014
     * @tc.name   : ImageSvgNew0014
     * @tc.desc   : Verify media Image svg new interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_NEW_0014', 0, async (done: Function) => {
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_NEW_0014 start');
      await Settings.createWindow('testability/pages/component/image/MediaImageAlt/ImageSvgNew0014');
      await driver.delayMs(1000);
      let img = await driver.findComponent(ON.id('image_svg_animate'));
      expect(img !== null).assertTrue();
      await windowSnap.snapShot();
      await driver.delayMs(500);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_NEW_0018
     * @tc.name   : ImageSvgNew0018
     * @tc.desc   : Verify media Image svg new interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_NEW_0018', 0, async (done: Function) => {
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_NEW_0018 start');
      await Settings.createWindow('testability/pages/component/image/MediaImageAlt/ImageSvgNew0018');
      await driver.delayMs(1000);
      let img = await driver.findComponent(ON.id('image_svg_objectfit'));
      expect(img !== null).assertTrue();
      await windowSnap.snapShot();
      await driver.delayMs(500);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_NEW_0019
     * @tc.name   : ImageSvgNew0019
     * @tc.desc   : Verify media Image svg new interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_NEW_0019', 0, async (done: Function) => {
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_NEW_0019 start');
      await Settings.createWindow('testability/pages/component/image/MediaImageAlt/ImageSvgNew0019');
      await driver.delayMs(1000);
      let img = await driver.findComponent(ON.id('image_svg_objectrepeat'));
      expect(img !== null).assertTrue();
      await windowSnap.snapShot();
      await driver.delayMs(500);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_NEW_0020
     * @tc.name   : ImageSvgNew0020
     * @tc.desc   : Verify media Image svg new interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_NEW_0020', 0, async (done: Function) => {
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_NEW_0020 start');
      await Settings.createWindow('testability/pages/component/image/MediaImageAlt/ImageSvgNew0020');
      await driver.delayMs(1000);
      let img = await driver.findComponent(ON.id('image_svg_colorfilter'));
      expect(img !== null).assertTrue();
      let btn = await driver.findComponent(ON.id('btn_toggle_filter'));
      if (btn) {
        await btn.click();
        await driver.delayMs(300);
      }
      await windowSnap.snapShot();
      await driver.delayMs(500);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_NEW_0021
     * @tc.name   : ImageSvgNew0021
     * @tc.desc   : Verify media Image svg new interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_NEW_0021', 0, async (done: Function) => {
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_NEW_0021 start');
      await Settings.createWindow('testability/pages/component/image/MediaImageAlt/ImageSvgNew0021');
      await driver.delayMs(1000);
      let img = await driver.findComponent(ON.id('image_svg_obscured'));
      expect(img !== null).assertTrue();
      await windowSnap.snapShot();
      await driver.delayMs(500);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_NEW_0022
     * @tc.name   : ImageSvgNew0022
     * @tc.desc   : Verify media Image svg new interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_NEW_0022', 0, async (done: Function) => {
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_NEW_0022 start');
      await Settings.createWindow('testability/pages/component/image/MediaImageAlt/ImageSvgNew0022');
      await driver.delayMs(1000);
      let img = await driver.findComponent(ON.id('image_svg_padding'));
      expect(img !== null).assertTrue();
      await windowSnap.snapShot();
      await driver.delayMs(500);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_NEW_0023
     * @tc.name   : ImageSvgNew0023
     * @tc.desc   : Verify media Image svg new interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_NEW_0023', 0, async (done: Function) => {
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_NEW_0023 start');
      await Settings.createWindow('testability/pages/component/image/MediaImageAlt/ImageSvgNew0023');
      await driver.delayMs(1000);
      let img = await driver.findComponent(ON.id('image_svg_fillcolor'));
      expect(img !== null).assertTrue();
      await windowSnap.snapShot();
      await driver.delayMs(500);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_NEW_0024
     * @tc.name   : ImageSvgNew0024
     * @tc.desc   : Verify media Image svg new interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_NEW_0024', 0, async (done: Function) => {
      Logger.info('SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_SVG_NEW_0024 start');
      await Settings.createWindow('testability/pages/component/image/MediaImageAlt/ImageSvgNew0024');
      await driver.delayMs(1000);
      let img = await driver.findComponent(ON.id('image_svg_draggable'));
      expect(img !== null).assertTrue();
      await windowSnap.snapShot();
      await driver.delayMs(500);
      done();
    });
  });
}
