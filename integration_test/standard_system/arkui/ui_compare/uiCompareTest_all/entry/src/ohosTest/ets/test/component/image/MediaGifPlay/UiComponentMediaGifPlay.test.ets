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

export default function uiComponentMediaGifPlayTest() {
  describe('uiComponentMediaGifPlayTest', () => {
    afterEach(async () => {
      if (Settings.windowClass) {
        Settings.destroyWindow(Settings.windowClass);
      }
      let driver = Driver.create();
      await driver.delayMs(500);
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_GIF_PLAY_0010
     * @tc.name   : 静图切换动图再切静图
     * @tc.desc   : Verify media gif play interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_GIF_PLAY_0010', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/image/MediaGifPlay/GifPlay0010');
      let driver = Driver.create();
      await driver.delayMs(1000);
      let image = await driver.findComponent(ON.id('image_display'));
      expect(image !== null).assertTrue();
      let btnGif = await driver.findComponent(ON.id('btn_gif'));
      if (btnGif) {
        await btnGif.click();
        await driver.delayMs(500);
      }
      await windowSnap.snapShot();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_GIF_PLAY_0011
     * @tc.name   : 动图切换静图再切动图
     * @tc.desc   : Verify media gif play interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_GIF_PLAY_0011', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/image/MediaGifPlay/GifPlay0011');
      let driver = Driver.create();
      await driver.delayMs(1000);
      let image = await driver.findComponent(ON.id('image_display'));
      expect(image !== null).assertTrue();
      await windowSnap.snapShot();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_GIF_PLAY_0012
     * @tc.name   : 多单动图来回切换
     * @tc.desc   : Verify media gif play interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_GIF_PLAY_0012', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/image/MediaGifPlay/GifPlay0012');
      let driver = Driver.create();
      await driver.delayMs(1000);
      let gif = await driver.findComponent(ON.id('gif_display'));
      expect(gif !== null).assertTrue();
      await windowSnap.snapShot();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_GIF_PLAY_0013
     * @tc.name   : 多动图切换单动图
     * @tc.desc   : Verify media gif play interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_GIF_PLAY_0013', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/image/MediaGifPlay/GifPlay0013');
      let driver = Driver.create();
      await driver.delayMs(1000);
      let btnSingle = await driver.findComponent(ON.id('btn_single'));
      if (btnSingle) {
        await btnSingle.click();
        await driver.delayMs(500);
      }
      await windowSnap.snapShot();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_GIF_PLAY_0014
     * @tc.name   : 多动图组切换
     * @tc.desc   : Verify media gif play interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_GIF_PLAY_0014', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/image/MediaGifPlay/GifPlay0014');
      let driver = Driver.create();
      await driver.delayMs(1000);
      let gif = await driver.findComponent(ON.id('gif_a'));
      expect(gif !== null).assertTrue();
      await windowSnap.snapShot();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_GIF_PLAY_0015
     * @tc.name   : 瀑布流动图播放
     * @tc.desc   : Verify media gif play interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_GIF_PLAY_0015', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/image/MediaGifPlay/GifPlay0015');
      let driver = Driver.create();
      await driver.delayMs(1000);
      let scroll = await driver.findComponent(ON.id('scroll_waterfall'));
      expect(scroll !== null).assertTrue();
      await windowSnap.snapShot();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_GIF_PLAY_0016
     * @tc.name   : 不同src类型播放
     * @tc.desc   : Verify media gif play interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_GIF_PLAY_0016', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/image/MediaGifPlay/GifPlay0016');
      let driver = Driver.create();
      await driver.delayMs(1000);
      let gif = await driver.findComponent(ON.id('gif_display'));
      expect(gif !== null).assertTrue();
      await windowSnap.snapShot();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_GIF_PLAY_0017
     * @tc.name   : 清空图源再恢复
     * @tc.desc   : Verify media gif play interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_GIF_PLAY_0017', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/image/MediaGifPlay/GifPlay0017');
      let driver = Driver.create();
      await driver.delayMs(1000);
      let gif = await driver.findComponent(ON.id('gif_display'));
      expect(gif !== null).assertTrue();
      let btnClear = await driver.findComponent(ON.id('btn_clear'));
      if (btnClear) {
        await btnClear.click();
        await driver.delayMs(500);
      }
      await windowSnap.snapShot();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_GIF_PLAY_0018
     * @tc.name   : 组件区域可变设置
     * @tc.desc   : Verify media gif play interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_GIF_PLAY_0018', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/image/MediaGifPlay/GifPlay0018');
      let driver = Driver.create();
      await driver.delayMs(1000);
      await windowSnap.snapShot();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_GIF_PLAY_0019
     * @tc.name   : 隐私隐藏测试
     * @tc.desc   : Verify media gif play interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_GIF_PLAY_0019', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/image/MediaGifPlay/GifPlay0019');
      let driver = Driver.create();
      await driver.delayMs(1000);
      let gif = await driver.findComponent(ON.id('gif_privacy'));
      expect(gif !== null).assertTrue();
      await windowSnap.snapShot();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_GIF_PLAY_0020
     * @tc.name   : ImageAnimator PixelMap测试
     * @tc.desc   : Verify media gif play interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_GIF_PLAY_0020', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/image/MediaGifPlay/GifPlay0020');
      let driver = Driver.create();
      await driver.delayMs(1000);
      let animator = await driver.findComponent(ON.id('image_animator'));
      expect(animator !== null).assertTrue();
      await windowSnap.snapShot();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_GIF_PLAY_0021
     * @tc.name   : 固定播放次数测试
     * @tc.desc   : Verify media gif play interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_GIF_PLAY_0021', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/image/MediaGifPlay/GifPlay0021');
      let driver = Driver.create();
      await driver.delayMs(1000);
      let animator = await driver.findComponent(ON.id('image_animator'));
      expect(animator !== null).assertTrue();
      await windowSnap.snapShot();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_GIF_PLAY_0022
     * @tc.name   : 高帧数短时长GIF测试
     * @tc.desc   : Verify media gif play interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_GIF_PLAY_0022', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/image/MediaGifPlay/GifPlay0022');
      let driver = Driver.create();
      await driver.delayMs(1000);
      let gif = await driver.findComponent(ON.id('gif_high_fps'));
      expect(gif !== null).assertTrue();
      await windowSnap.snapShot();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_GIF_PLAY_0023
     * @tc.name   : 挂载卸载事件测试
     * @tc.desc   : Verify media gif play interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_GIF_PLAY_0023', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/image/MediaGifPlay/GifPlay0023');
      let driver = Driver.create();
      await driver.delayMs(1000);
      let gif = await driver.findComponent(ON.id('gif_mount'));
      expect(gif !== null).assertTrue();
      let btnUnmount = await driver.findComponent(ON.id('btn_unmount'));
      if (btnUnmount) {
        await btnUnmount.click();
        await driver.delayMs(500);
      }
      await windowSnap.snapShot();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_GIF_PLAY_0024
     * @tc.name   : 浮层GIF测试
     * @tc.desc   : Verify media gif play interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_GIF_PLAY_0024', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/image/MediaGifPlay/GifPlay0024');
      let driver = Driver.create();
      await driver.delayMs(1000);
      let gifBottom = await driver.findComponent(ON.id('gif_bottom'));
      let gifOverlay = await driver.findComponent(ON.id('gif_overlay'));
      expect(gifBottom !== null).assertTrue();
      expect(gifOverlay !== null).assertTrue();
      await windowSnap.snapShot();
      done();
    });
  });
}
