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

export default function uiComponentTextFadingedge() {
  describe('uiComponentTextFadingedge', () => {
    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0010
     * @tc.name   : FadingedgeTv0010
     * @tc.desc   : Verify text fadingedge tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0010', 0, async () => {
      Logger.info('SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0010 begin');
      
      await Settings.createWindow('testability/pages/component/text/TextFadingedge/FadingedgeTv0010');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('Text_FadingEdge_TV_0010');
      Logger.info('SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0010 end');
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0090
     * @tc.name   : FadingedgeTv0090
     * @tc.desc   : Verify text fadingedge tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0090', 0, async () => {
      Logger.info('SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0090 begin');
      
      await Settings.createWindow('testability/pages/component/text/TextFadingedge/FadingedgeTv0090');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      const searchInput = await driver.findComponent(ON.id('searchLongText'));
      if (searchInput) {
        await searchInput.click();
        await driver.delayMs(500);
      }
      
      await windowSnap.snapShot('Text_FadingEdge_TV_0090');
      Logger.info('SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0090 end');
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0470
     * @tc.name   : FadingedgeTv0470
     * @tc.desc   : Verify text fadingedge tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0470', 0, async () => {
      Logger.info('SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0470 begin');
      
      await Settings.createWindow('testability/pages/component/text/TextFadingedge/FadingedgeTv0470');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      // 切换文本长度测试
      const longTextBtn = await driver.findComponent(ON.id('longTextBtn'));
      if (longTextBtn) {
        await longTextBtn.click();
        await driver.delayMs(500);
      }
      
      const shortTextBtn = await driver.findComponent(ON.id('shortTextBtn'));
      if (shortTextBtn) {
        await shortTextBtn.click();
        await driver.delayMs(500);
      }
      
      await windowSnap.snapShot('Text_FadingEdge_TV_0470');
      
      Logger.info('SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0470 end');
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0490
     * @tc.name   : FadingedgeTv0490
     * @tc.desc   : Verify text fadingedge tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0490', 0, async () => {
      Logger.info('SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0490 begin');
      
      await Settings.createWindow('testability/pages/component/text/TextFadingedge/FadingedgeTv0490');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      // 点击Search获取焦点
      const searchInput = await driver.findComponent(ON.id('searchInput'));
      if (searchInput) {
        await searchInput.click();
        await driver.delayMs(500);
      }
      
      // 点击其他区域失焦
      const blurBtn = await driver.findComponent(ON.id('blurBtn'));
      if (blurBtn) {
        await blurBtn.click();
        await driver.delayMs(500);
      }
      
      await windowSnap.snapShot('Text_FadingEdge_TV_0490');
      
      Logger.info('SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0490 end');
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0950
     * @tc.name   : FadingedgeTv0950
     * @tc.desc   : Verify text fadingedge tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0950', 0, async () => {
      Logger.info('SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0950 begin');
      
      await Settings.createWindow('testability/pages/component/text/TextFadingedge/FadingedgeTv0950');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      // 切换文本长度测试
      const longTextBtn = await driver.findComponent(ON.id('longTextBtn'));
      if (longTextBtn) {
        await longTextBtn.click();
        await driver.delayMs(500);
      }
      
      const shortTextBtn = await driver.findComponent(ON.id('shortTextBtn'));
      if (shortTextBtn) {
        await shortTextBtn.click();
        await driver.delayMs(500);
      }
      
      await windowSnap.snapShot('Text_FadingEdge_TV_0950');
      
      Logger.info('SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0950 end');
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0510
     * @tc.name   : FadingedgeTv0510
     * @tc.desc   : Verify text fadingedge tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0510', 0, async () => {
      Logger.info('SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0510 begin');
      
      await Settings.createWindow('testability/pages/component/text/TextFadingedge/FadingedgeTv0510');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('Text_FadingEdge_TV_0510');
      Logger.info('SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0510 end');
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0600
     * @tc.name   : FadingedgeTv0600
     * @tc.desc   : Verify text fadingedge tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0600', 0, async () => {
      Logger.info('SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0600 begin');
      
      await Settings.createWindow('testability/pages/component/text/TextFadingedge/FadingedgeTv0600');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      const textInput = await driver.findComponent(ON.id('textInputLong'));
      if (textInput) {
        await textInput.click();
        await driver.delayMs(500);
      }
      
      await windowSnap.snapShot('Text_FadingEdge_TV_0600');
      Logger.info('SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0600 end');
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0960
     * @tc.name   : FadingedgeTv0960
     * @tc.desc   : Verify text fadingedge tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0960', 0, async () => {
      Logger.info('SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0960 begin');
      
      await Settings.createWindow('testability/pages/component/text/TextFadingedge/FadingedgeTv0960');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      const textInput = await driver.findComponent(ON.id('textInputCursor'));
      if (textInput) {
        await textInput.click();
        await driver.delayMs(500);
      }
      
      await windowSnap.snapShot('Text_FadingEdge_TV_0960');
      Logger.info('SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0960 end');
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0970
     * @tc.name   : FadingedgeTv0970
     * @tc.desc   : Verify text fadingedge tv interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0970', 0, async () => {
      Logger.info('SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0970 begin');
      
      await Settings.createWindow('testability/pages/component/text/TextFadingedge/FadingedgeTv0970');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      // 点击TextInput获取焦点
      const textInput = await driver.findComponent(ON.id('textInput'));
      if (textInput) {
        await textInput.click();
        await driver.delayMs(500);
      }
      
      // 点击其他区域失焦
      const blurBtn = await driver.findComponent(ON.id('blurBtn'));
      if (blurBtn) {
        await blurBtn.click();
        await driver.delayMs(500);
      }
      
      await windowSnap.snapShot('Text_FadingEdge_TV_0970');
      
      Logger.info('SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0970 end');
    });
  });
}
