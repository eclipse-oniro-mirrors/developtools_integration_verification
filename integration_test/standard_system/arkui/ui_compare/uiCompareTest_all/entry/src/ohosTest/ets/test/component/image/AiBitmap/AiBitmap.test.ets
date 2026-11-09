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

import { describe, it, afterEach } from '@ohos/hypium';
import { Driver, ON } from '@kit.TestKit';
import Settings from '../../../model/Settings';
import windowSnap from '../../../model/snapShot';
import Logger from '../../../model/Logger';

export default function aiBitmap() {
  describe('aiBitmap', () => {
    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : SUB_ACE_AI_BITMAP_0010
     * @tc.name   : 页面中无Image加载的位图
     * @tc.desc   : Verify ai bitmap interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_AI_BITMAP_0010', 0, async () => {
      Logger.info('SUB_ACE_AI_BITMAP_0010 begin');
      
      await Settings.createWindow('testability/pages/component/image/AiBitmap/Bitmap0010');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('AI_BITMAP_0010');
      
      Logger.info('SUB_ACE_AI_BITMAP_0010 end');
    });

    /*
     * @tc.number : SUB_ACE_AI_BITMAP_0020
     * @tc.name   : 页面中有Image加载的位图及矢量图
     * @tc.desc   : Verify ai bitmap interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_AI_BITMAP_0020', 0, async () => {
      Logger.info('SUB_ACE_AI_BITMAP_0020 begin');
      
      await Settings.createWindow('testability/pages/component/image/AiBitmap/Bitmap0020');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('AI_BITMAP_0020');
      
      Logger.info('SUB_ACE_AI_BITMAP_0020 end');
    });

    /*
     * @tc.number : SUB_ACE_AI_BITMAP_0030
     * @tc.name   : 页面中有Image加载的位图(隐藏)
     * @tc.desc   : Verify ai bitmap interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_AI_BITMAP_0030', 0, async () => {
      Logger.info('SUB_ACE_AI_BITMAP_0030 begin');
      
      await Settings.createWindow('testability/pages/component/image/AiBitmap/Bitmap0030');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      // 点击隐藏Gif图片
      const btnHideGif = await driver.findComponent(ON.id('btn_hide_gif'));
      await btnHideGif.click();
      await driver.delayMs(500);
      
      // 点击隐藏JPG图片
      const btnHideJpg = await driver.findComponent(ON.id('btn_hide_jpg'));
      await btnHideJpg.click();
      await driver.delayMs(500);
      
      await windowSnap.snapShot('AI_BITMAP_0030');
      
      Logger.info('SUB_ACE_AI_BITMAP_0030 end');
    });

    /*
     * @tc.number : SUB_ACE_AI_BITMAP_0040
     * @tc.name   : 页面中有Image加载的位图(不上树)
     * @tc.desc   : Verify ai bitmap interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_AI_BITMAP_0040', 0, async () => {
      Logger.info('SUB_ACE_AI_BITMAP_0040 begin');
      
      await Settings.createWindow('testability/pages/component/image/AiBitmap/Bitmap0040');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      // 点击按钮使图片下树
      const btn = await driver.findComponent(ON.id('btn'));
      await btn.click();
      await driver.delayMs(500);
      
      await windowSnap.snapShot('AI_BITMAP_0040');
      
      Logger.info('SUB_ACE_AI_BITMAP_0040 end');
    });

    /*
     * @tc.number : SUB_ACE_AI_BITMAP_0050
     * @tc.name   : 页面中有Image加载的位图(图片很多)
     * @tc.desc   : Verify ai bitmap interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_AI_BITMAP_0050', 0, async () => {
      Logger.info('SUB_ACE_AI_BITMAP_0050 begin');
      
      await Settings.createWindow('testability/pages/component/image/AiBitmap/Bitmap0050');
      const driver = Driver.create();
      await driver.delayMs(2000); // 等待多图加载
      
      await windowSnap.snapShot('AI_BITMAP_0050');
      
      Logger.info('SUB_ACE_AI_BITMAP_0050 end');
    });

    /*
     * @tc.number : SUB_ACE_AI_BITMAP_0060
     * @tc.name   : 页面中有Image加载的位图，频繁进行抠图
     * @tc.desc   : Verify ai bitmap interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_AI_BITMAP_0060', 0, async () => {
      Logger.info('SUB_ACE_AI_BITMAP_0060 begin');
      
      await Settings.createWindow('testability/pages/component/image/AiBitmap/Bitmap0060');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('AI_BITMAP_0060');
      
      Logger.info('SUB_ACE_AI_BITMAP_0060 end');
      Logger.info('Note: Manual frequent extraction test should be performed');
    });

    /*
     * @tc.number : SUB_ACE_AI_BITMAP_0070
     * @tc.name   : XComponent页面自绘制内容，可进行抠图
     * @tc.desc   : Verify ai bitmap interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_AI_BITMAP_0070', 0, async () => {
      Logger.info('SUB_ACE_AI_BITMAP_0070 begin');
      
      await Settings.createWindow('testability/pages/component/image/AiBitmap/Bitmap0070');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('AI_BITMAP_0070');
      
      Logger.info('SUB_ACE_AI_BITMAP_0070 end');
    });

    /*
     * @tc.number : SUB_ACE_AI_BITMAP_0080
     * @tc.name   : WebView页面自绘制内容，可进行抠图
     * @tc.desc   : Verify ai bitmap interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_AI_BITMAP_0080', 0, async () => {
      Logger.info('SUB_ACE_AI_BITMAP_0080 begin');
      
      await Settings.createWindow('testability/pages/component/image/AiBitmap/Bitmap0080');
      const driver = Driver.create();
      await driver.delayMs(2000); // 等待WebView加载
      
      await windowSnap.snapShot('AI_BITMAP_0080');
      
      Logger.info('SUB_ACE_AI_BITMAP_0080 end');
    });
  });
}
