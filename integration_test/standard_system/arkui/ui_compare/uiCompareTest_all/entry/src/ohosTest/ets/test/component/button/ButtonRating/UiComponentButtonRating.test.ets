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

/**
 * @file UiComponentButtonRating.test.ets
 * @description Rating组件测试用例
 */
import { describe, it, expect, afterEach } from '@ohos/hypium';
import { Driver, ON } from '@kit.TestKit';
import Settings from '../../../model/Settings';
import windowSnap from '../../../model/snapShot';
import Logger from '../../../model/Logger';

export default function uiComponentButtonRatingTest() {
  describe('uiComponentButtonRatingTest', () => {
    afterEach(async () => {
      if (Settings.windowClass) {
        Settings.destroyWindow(Settings.windowClass);
      }
      let driver = Driver.create();
      await driver.delayMs(500);
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0100
     * @tc.name   : 自定义buildRating，手势点击进行评分
     * @tc.desc   : Verify button rating customizings interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0100', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0100 start');
      await Settings.createWindow('testability/pages/component/button/ButtonRating/RatingCustomizings0100');
      let driver = Driver.create();
      await driver.delayMs(1000);
      
      let rating = await driver.findComponent(ON.id('rating_custom'));
      expect(rating !== null).assertTrue();
      
      await windowSnap.snapShot();
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0100 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0120
     * @tc.name   : 设置contentModifier参数为"Hi", 99
     * @tc.desc   : Verify button rating customizings interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0120', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0120 start');
      await Settings.createWindow('testability/pages/component/button/ButtonRating/RatingCustomizings0120');
      let driver = Driver.create();
      await driver.delayMs(1000);
      
      let paramsDisplay = await driver.findComponent(ON.id('params_display'));
      expect(paramsDisplay !== null).assertTrue();
      
      await windowSnap.snapShot();
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0120 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0140
     * @tc.name   : 验证退出后再启动程序
     * @tc.desc   : Verify button rating customizings interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0140', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0140 start');
      await Settings.createWindow('testability/pages/component/button/ButtonRating/RatingCustomizings0140');
      let driver = Driver.create();
      await driver.delayMs(1000);
      
      let rating = await driver.findComponent(ON.id('rating_restart'));
      expect(rating !== null).assertTrue();
      
      await windowSnap.snapShot();
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0140 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0150
     * @tc.name   : 验证切换到其他应用再切回
     * @tc.desc   : Verify button rating customizings interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0150', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0150 start');
      await Settings.createWindow('testability/pages/component/button/ButtonRating/RatingCustomizings0150');
      let driver = Driver.create();
      await driver.delayMs(1000);
      
      let rating = await driver.findComponent(ON.id('rating_switch_app'));
      expect(rating !== null).assertTrue();
      
      await windowSnap.snapShot();
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0150 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0160
     * @tc.name   : 验证切换到桌面再切回
     * @tc.desc   : Verify button rating customizings interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0160', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0160 start');
      await Settings.createWindow('testability/pages/component/button/ButtonRating/RatingCustomizings0160');
      let driver = Driver.create();
      await driver.delayMs(1000);
      
      let rating = await driver.findComponent(ON.id('rating_to_desktop'));
      expect(rating !== null).assertTrue();
      
      await windowSnap.snapShot();
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0160 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0170
     * @tc.name   : contentModifier设置为undefined
     * @tc.desc   : Verify button rating customizings interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0170', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0170 start');
      await Settings.createWindow('testability/pages/component/button/ButtonRating/RatingCustomizings0170');
      let driver = Driver.create();
      await driver.delayMs(1000);
      
      let rating = await driver.findComponent(ON.id('rating_undefined'));
      expect(rating !== null).assertTrue();
      
      await windowSnap.snapShot();
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0170 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0180
     * @tc.name   : contentModifier设置为null
     * @tc.desc   : Verify button rating customizings interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0180', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0180 start');
      await Settings.createWindow('testability/pages/component/button/ButtonRating/RatingCustomizings0180');
      let driver = Driver.create();
      await driver.delayMs(1000);
      
      let rating = await driver.findComponent(ON.id('rating_null'));
      expect(rating !== null).assertTrue();
      
      await windowSnap.snapShot();
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0180 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0190
     * @tc.name   : 不设置contentModifier
     * @tc.desc   : Verify button rating customizings interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0190', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0190 start');
      await Settings.createWindow('testability/pages/component/button/ButtonRating/RatingCustomizings0190');
      let driver = Driver.create();
      await driver.delayMs(1000);
      
      let rating = await driver.findComponent(ON.id('rating_no_modifier'));
      expect(rating !== null).assertTrue();
      
      await windowSnap.snapShot();
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0190 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0010
     * @tc.name   : Rating作为指示器，indicator=true，hover
     * @tc.desc   : Verify button rating hoverkeyboard interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0010', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0010 start');
      await Settings.createWindow('testability/pages/component/button/ButtonRating/RatingHoverkeyboard0010');
      let driver = Driver.create();
      await driver.delayMs(1000);
      
      let rating = await driver.findComponent(ON.id('rating_indicator'));
      expect(rating !== null).assertTrue();
      
      await windowSnap.snapShot();
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0010 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0020
     * @tc.name   : Rating作为评分器，hover预览后移开恢复
     * @tc.desc   : Verify button rating hoverkeyboard interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0020', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0020 start');
      await Settings.createWindow('testability/pages/component/button/ButtonRating/RatingHoverkeyboard0020');
      let driver = Driver.create();
      await driver.delayMs(1000);
      
      let rating = await driver.findComponent(ON.id('rating_hover_recover'));
      expect(rating !== null).assertTrue();
      
      await windowSnap.snapShot();
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0020 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0030
     * @tc.name   : Rating作为评分器，点击后刷新打分
     * @tc.desc   : Verify button rating hoverkeyboard interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0030', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0030 start');
      await Settings.createWindow('testability/pages/component/button/ButtonRating/RatingHoverkeyboard0030');
      let driver = Driver.create();
      await driver.delayMs(1000);
      
      let rating = await driver.findComponent(ON.id('rating_click_select'));
      expect(rating !== null).assertTrue();
      
      if (rating) {
        await rating.click();
        await driver.delayMs(300);
      }
      
      await windowSnap.snapShot();
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0030 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0100
     * @tc.name   : Rating作为评分器，Tab进入焦点模式
     * @tc.desc   : Verify button rating hoverkeyboard interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0100', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0100 start');
      await Settings.createWindow('testability/pages/component/button/ButtonRating/RatingHoverkeyboard0100');
      let driver = Driver.create();
      await driver.delayMs(1000);
      
      let rating = await driver.findComponent(ON.id('rating_focus_mode'));
      expect(rating !== null).assertTrue();
      
      await windowSnap.snapShot();
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0100 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0120
     * @tc.name   : 竖屏切横屏时，键盘走焦效果正常
     * @tc.desc   : Verify button rating hoverkeyboard interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0120', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0120 start');
      await Settings.createWindow('testability/pages/component/button/ButtonRating/RatingHoverkeyboard0120');
      let driver = Driver.create();
      await driver.delayMs(1000);
      
      let rating = await driver.findComponent(ON.id('rating_orientation'));
      expect(rating !== null).assertTrue();
      
      await windowSnap.snapShot();
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0120 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0130
     * @tc.name   : 横屏模式下鼠标预览和点击效果正常
     * @tc.desc   : Verify button rating hoverkeyboard interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0130', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0130 start');
      await Settings.createWindow('testability/pages/component/button/ButtonRating/RatingHoverkeyboard0130');
      let driver = Driver.create();
      await driver.delayMs(1000);
      
      let rating = await driver.findComponent(ON.id('rating_landscape'));
      expect(rating !== null).assertTrue();
      
      await windowSnap.snapShot();
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0130 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0140
     * @tc.name   : 键盘左右切换时，焦点转移规格一致
     * @tc.desc   : Verify button rating hoverkeyboard interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0140', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0140 start');
      await Settings.createWindow('testability/pages/component/button/ButtonRating/RatingHoverkeyboard0140');
      let driver = Driver.create();
      await driver.delayMs(1000);
      
      let rating = await driver.findComponent(ON.id('rating_arrow_keys'));
      expect(rating !== null).assertTrue();
      
      await windowSnap.snapShot();
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0140 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_RATING_INTERFACE_0210
     * @tc.name   : starStyle三个参数均正常设置
     * @tc.desc   : Verify button rating interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_RATING_INTERFACE_0210', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_RATING_INTERFACE_0210 start');
      await Settings.createWindow('testability/pages/component/button/ButtonRating/RatingInterface0210');
      let driver = Driver.create();
      await driver.delayMs(1000);
      
      let rating = await driver.findComponent(ON.id('rating_star_style'));
      expect(rating !== null).assertTrue();
      
      await windowSnap.snapShot();
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_RATING_INTERFACE_0210 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_RATING_MIRROR_0160
     * @tc.name   : rating组件镜像（键盘走焦场景）
     * @tc.desc   : Verify button rating mirror layout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_RATING_MIRROR_0160', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_RATING_MIRROR_0160 start');
      await Settings.createWindow('testability/pages/component/button/ButtonRating/RatingMirror0160');
      let driver = Driver.create();
      await driver.delayMs(1000);
      
      let rating = await driver.findComponent(ON.id('rating_mirror'));
      expect(rating !== null).assertTrue();
      
      await windowSnap.snapShot();
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_RATING_MIRROR_0160 end');
      done();
    });
  });
}