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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import Settings from '../../../model/Settings';
import windowSnap from '../../../model/snapShot';
import { Driver, ON, Component } from '@kit.TestKit';
import Logger from '../../../model/Logger';

export default function uiComponentNavNavdestinationNavdestinationsystemtransitio() {
  describe('uiComponentNavNavdestinationNavdestinationsystemtransitio', () => {
    let driver: Driver = Driver.create();

    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
        Settings.windowClass = undefined;
      }
      await driver.delayMs(2000);
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0010
     * @tc.name   : Navigation自定义转场动画能力增强（正常值测试）
     * @tc.desc   : Verify nav navdestination navdestinationsystemtransitio interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('testNavdestinationSystemtransitio0010', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/navigation/NavNavdestinationNavdestinationsystemtransitio/NavdestinationSystemtransitio0010');
      await driver.delayMs(2000);

      let btnNav: Component = await driver.findComponent(ON.id('btn_nav_transition'));
      expect(btnNav !== null).assertTrue();
      await btnNav.click();
      await driver.delayMs(500);

      let btnPageOne: Component = await driver.findComponent(ON.id('btn_push_pageOne'));
      expect(btnPageOne !== null).assertTrue();
      await btnPageOne.click();
      await driver.delayMs(1000);

      let btnPageTwo: Component = await driver.findComponent(ON.id('btn_push_pageTwo'));
      expect(btnPageTwo !== null).assertTrue();
      await btnPageTwo.click();
      await driver.delayMs(1000);

      await windowSnap.snapShot();
      await driver.delayMs(1000);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0020
     * @tc.name   : Navigation自定义转场动画能力增强（异常值测试）
     * @tc.desc   : Verify nav navdestination navdestinationsystemtransitio interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('testNavdestinationSystemtransitio0020', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/navigation/NavNavdestinationNavdestinationsystemtransitio/NavdestinationSystemtransitio0020');
      await driver.delayMs(2000);

      let btnNav: Component = await driver.findComponent(ON.id('btn_nav_transition'));
      expect(btnNav !== null).assertTrue();
      await btnNav.click();
      await driver.delayMs(500);

      let btnPageNine: Component = await driver.findComponent(ON.id('btn_push_pageNine'));
      expect(btnPageNine !== null).assertTrue();
      await btnPageNine.click();
      await driver.delayMs(1000);

      await windowSnap.snapShot();
      await driver.delayMs(1000);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0030
     * @tc.name   : Navigation自定义转场动画能力增强（push接口测试）
     * @tc.desc   : Verify nav navdestination navdestinationsystemtransitio interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('testNavdestinationSystemtransitio0030', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/navigation/NavNavdestinationNavdestinationsystemtransitio/NavdestinationSystemtransitio0030');
      await driver.delayMs(2000);

      let btnNav: Component = await driver.findComponent(ON.id('btn_nav_transition'));
      expect(btnNav !== null).assertTrue();
      await btnNav.click();
      await driver.delayMs(500);

      let btnPushPath: Component = await driver.findComponent(ON.id('btn_pushPath_pageThree'));
      expect(btnPushPath !== null).assertTrue();
      await btnPushPath.click();
      await driver.delayMs(1000);

      await windowSnap.snapShot();
      await driver.delayMs(1000);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0040
     * @tc.name   : Navigation自定义转场动画能力增强（push接口测试，带有页面栈的操作模式）
     * @tc.desc   : Verify nav navdestination navdestinationsystemtransitio interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('testNavdestinationSystemtransitio0040', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/navigation/NavNavdestinationNavdestinationsystemtransitio/NavdestinationSystemtransitio0040');
      await driver.delayMs(2000);

      let btnNav: Component = await driver.findComponent(ON.id('btn_nav_transition'));
      expect(btnNav !== null).assertTrue();
      await btnNav.click();
      await driver.delayMs(500);

      let btnPush: Component = await driver.findComponent(ON.id('btn_push_pageThree'));
      expect(btnPush !== null).assertTrue();
      await btnPush.click();
      await driver.delayMs(1000);

      await windowSnap.snapShot();
      await driver.delayMs(1000);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0050
     * @tc.name   : Navigation自定义转场动画能力增强（replace接口）
     * @tc.desc   : Verify nav navdestination navdestinationsystemtransitio interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('testNavdestinationSystemtransitio0050', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/navigation/NavNavdestinationNavdestinationsystemtransitio/NavdestinationSystemtransitio0050');
      await driver.delayMs(2000);

      let btnNav: Component = await driver.findComponent(ON.id('btn_nav_transition'));
      expect(btnNav !== null).assertTrue();
      await btnNav.click();
      await driver.delayMs(500);

      let btnPush: Component = await driver.findComponent(ON.id('btn_push_pageOne'));
      expect(btnPush !== null).assertTrue();
      await btnPush.click();
      await driver.delayMs(1000);

      await windowSnap.snapShot();
      await driver.delayMs(1000);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0060
     * @tc.name   : Navigation自定义转场动画能力增强（replace接口，带有页面栈的操作模式）
     * @tc.desc   : Verify nav navdestination navdestinationsystemtransitio interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('testNavdestinationSystemtransitio0060', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/navigation/NavNavdestinationNavdestinationsystemtransitio/NavdestinationSystemtransitio0060');
      await driver.delayMs(2000);

      let btnNav: Component = await driver.findComponent(ON.id('btn_nav_transition'));
      expect(btnNav !== null).assertTrue();
      await btnNav.click();
      await driver.delayMs(500);

      await windowSnap.snapShot();
      await driver.delayMs(1000);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0070
     * @tc.name   : Navigation自定义转场动画能力增强（pop、popToName接口）
     * @tc.desc   : Verify nav navdestination navdestinationsystemtransitio interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('testNavdestinationSystemtransitio0070', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/navigation/NavNavdestinationNavdestinationsystemtransitio/NavdestinationSystemtransitio0070');
      await driver.delayMs(2000);

      let btnNav: Component = await driver.findComponent(ON.id('btn_nav_transition'));
      expect(btnNav !== null).assertTrue();
      await btnNav.click();
      await driver.delayMs(500);

      let btnPush: Component = await driver.findComponent(ON.id('btn_push_pageThree'));
      expect(btnPush !== null).assertTrue();
      await btnPush.click();
      await driver.delayMs(1000);

      await windowSnap.snapShot();
      await driver.delayMs(1000);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0080
     * @tc.name   : Navigation自定义转场动画能力增强（popToIndex接口）
     * @tc.desc   : Verify nav navdestination navdestinationsystemtransitio interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('testNavdestinationSystemtransitio0080', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/navigation/NavNavdestinationNavdestinationsystemtransitio/NavdestinationSystemtransitio0080');
      await driver.delayMs(2000);

      let btnNav: Component = await driver.findComponent(ON.id('btn_nav_transition'));
      expect(btnNav !== null).assertTrue();
      await btnNav.click();
      await driver.delayMs(500);

      await windowSnap.snapShot();
      await driver.delayMs(1000);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0090
     * @tc.name   : Navigation自定义转场动画能力增强（remove接口）
     * @tc.desc   : Verify nav navdestination navdestinationsystemtransitio interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('testNavdestinationSystemtransitio0090', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/navigation/NavNavdestinationNavdestinationsystemtransitio/NavdestinationSystemtransitio0090');
      await driver.delayMs(2000);

      let btnNav: Component = await driver.findComponent(ON.id('btn_nav_transition'));
      expect(btnNav !== null).assertTrue();
      await btnNav.click();
      await driver.delayMs(500);

      await windowSnap.snapShot();
      await driver.delayMs(1000);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0100
     * @tc.name   : Navigation自定义转场动画能力增强（clear接口）
     * @tc.desc   : Verify nav navdestination navdestinationsystemtransitio interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('testNavdestinationSystemtransitio0100', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/navigation/NavNavdestinationNavdestinationsystemtransitio/NavdestinationSystemtransitio0100');
      await driver.delayMs(2000);

      let btnNav: Component = await driver.findComponent(ON.id('btn_nav_transition'));
      expect(btnNav !== null).assertTrue();
      await btnNav.click();
      await driver.delayMs(500);

      let btnClear: Component = await driver.findComponent(ON.id('btn_clear'));
      expect(btnClear !== null).assertTrue();
      await btnClear.click();
      await driver.delayMs(1000);

      await windowSnap.snapShot();
      await driver.delayMs(1000);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0110
     * @tc.name   : Navigation自定义转场动画能力增强（move接口）
     * @tc.desc   : Verify nav navdestination navdestinationsystemtransitio interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('testNavdestinationSystemtransitio0110', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/navigation/NavNavdestinationNavdestinationsystemtransitio/NavdestinationSystemtransitio0110');
      await driver.delayMs(2000);

      let btnNav: Component = await driver.findComponent(ON.id('btn_nav_transition'));
      expect(btnNav !== null).assertTrue();
      await btnNav.click();
      await driver.delayMs(500);

      await windowSnap.snapShot();
      await driver.delayMs(1000);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0120
     * @tc.name   : Navigation自定义转场动画能力增强（横竖屏切换场景）
     * @tc.desc   : Verify nav navdestination navdestinationsystemtransitio interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('testNavdestinationSystemtransitio0120', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/navigation/NavNavdestinationNavdestinationsystemtransitio/NavdestinationSystemtransitio0120');
      await driver.delayMs(2000);

      let btnNav: Component = await driver.findComponent(ON.id('btn_nav_transition'));
      expect(btnNav !== null).assertTrue();
      await btnNav.click();
      await driver.delayMs(500);

      await windowSnap.snapShot();
      await driver.delayMs(1000);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0130
     * @tc.name   : Navigation自定义转场动画能力增强（DIALOG页面场景）
     * @tc.desc   : Verify nav navdestination navdestinationsystemtransitio interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('testNavdestinationSystemtransitio0130', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/navigation/NavNavdestinationNavdestinationsystemtransitio/NavdestinationSystemtransitio0130');
      await driver.delayMs(2000);

      let btnNav: Component = await driver.findComponent(ON.id('btn_nav_transition'));
      expect(btnNav !== null).assertTrue();
      await btnNav.click();
      await driver.delayMs(500);

      let btnLandscape: Component = await driver.findComponent(ON.id('btn_landscape'));
      expect(btnLandscape !== null).assertTrue();
      await btnLandscape.click();
      await driver.delayMs(500);

      await windowSnap.snapShot();
      await driver.delayMs(1000);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0140
     * @tc.name   : Navigation自定义转场动画能力增强（DIALOG+STANDARD场景）
     * @tc.desc   : Verify nav navdestination navdestinationsystemtransitio interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('testNavdestinationSystemtransitio0140', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/navigation/NavNavdestinationNavdestinationsystemtransitio/NavdestinationSystemtransitio0140');
      await driver.delayMs(2000);

      let btnNav: Component = await driver.findComponent(ON.id('btn_nav_transition'));
      expect(btnNav !== null).assertTrue();
      await btnNav.click();
      await driver.delayMs(500);

      await windowSnap.snapShot();
      await driver.delayMs(1000);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0150
     * @tc.name   : Navigation自定义转场动画能力增强（DIALOG+STANDARD moveToTop场景）
     * @tc.desc   : Verify nav navdestination navdestinationsystemtransitio interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('testNavdestinationSystemtransitio0150', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/navigation/NavNavdestinationNavdestinationsystemtransitio/NavdestinationSystemtransitio0150');
      await driver.delayMs(2000);

      let btnNav: Component = await driver.findComponent(ON.id('btn_nav_transition'));
      expect(btnNav !== null).assertTrue();
      await btnNav.click();
      await driver.delayMs(500);

      await windowSnap.snapShot();
      await driver.delayMs(1000);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0160
     * @tc.name   : Navigation自定义转场动画能力增强（单双栏切换场景）
     * @tc.desc   : Verify nav navdestination navdestinationsystemtransitio interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('testNavdestinationSystemtransitio0160', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/navigation/NavNavdestinationNavdestinationsystemtransitio/NavdestinationSystemtransitio0160');
      await driver.delayMs(2000);

      let btnNav: Component = await driver.findComponent(ON.id('btn_nav_transition'));
      expect(btnNav !== null).assertTrue();
      await btnNav.click();
      await driver.delayMs(500);

      let btnMode: Component = await driver.findComponent(ON.id('btn_nav_mode'));
      expect(btnMode !== null).assertTrue();
      await btnMode.click();
      await driver.delayMs(500);

      await windowSnap.snapShot();
      await driver.delayMs(1000);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0170
     * @tc.name   : Navigation自定义转场动画能力增强（子窗口场景）
     * @tc.desc   : Verify nav navdestination navdestinationsystemtransitio interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('testNavdestinationSystemtransitio0170', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/navigation/NavNavdestinationNavdestinationsystemtransitio/NavdestinationSystemtransitio0170');
      await driver.delayMs(2000);

      let btnNav: Component = await driver.findComponent(ON.id('btn_nav_transition'));
      expect(btnNav !== null).assertTrue();
      await btnNav.click();
      await driver.delayMs(500);

      let btnSub: Component = await driver.findComponent(ON.id('btn_sub_window'));
      expect(btnSub !== null).assertTrue();
      await btnSub.click();
      await driver.delayMs(500);

      await windowSnap.snapShot();
      await driver.delayMs(1000);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0180
     * @tc.name   : Navigation自定义转场动画能力增强（NavDestination隐藏标题栏场景）
     * @tc.desc   : Verify nav navdestination navdestinationsystemtransitio interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('testNavdestinationSystemtransitio0180', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/navigation/NavNavdestinationNavdestinationsystemtransitio/NavdestinationSystemtransitio0180');
      await driver.delayMs(2000);

      let btnNav: Component = await driver.findComponent(ON.id('btn_nav_transition'));
      expect(btnNav !== null).assertTrue();
      await btnNav.click();
      await driver.delayMs(500);

      let btnPush: Component = await driver.findComponent(ON.id('btn_push_page11'));
      expect(btnPush !== null).assertTrue();
      await btnPush.click();
      await driver.delayMs(1000);

      await windowSnap.snapShot();
      await driver.delayMs(1000);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0190
     * @tc.name   : Navigation自定义转场动画能力增强（navBarPosition场景）
     * @tc.desc   : Verify nav navdestination navdestinationsystemtransitio interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('testNavdestinationSystemtransitio0190', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/navigation/NavNavdestinationNavdestinationsystemtransitio/NavdestinationSystemtransitio0190');
      await driver.delayMs(2000);

      let btnNav: Component = await driver.findComponent(ON.id('btn_nav_transition'));
      expect(btnNav !== null).assertTrue();
      await btnNav.click();
      await driver.delayMs(500);

      await windowSnap.snapShot();
      await driver.delayMs(1000);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0200
     * @tc.name   : Navigation自定义转场动画能力增强（镜像场景）
     * @tc.desc   : Verify nav navdestination navdestinationsystemtransitio interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('testNavdestinationSystemtransitio0200', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/navigation/NavNavdestinationNavdestinationsystemtransitio/NavdestinationSystemtransitio0200');
      await driver.delayMs(2000);

      let btnNav: Component = await driver.findComponent(ON.id('btn_nav_transition'));
      expect(btnNav !== null).assertTrue();
      await btnNav.click();
      await driver.delayMs(500);

      await windowSnap.snapShot();
      await driver.delayMs(1000);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0210
     * @tc.name   : Navigation自定义转场动画能力增强（disableAnimation场景）
     * @tc.desc   : Verify nav navdestination navdestinationsystemtransitio interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('testNavdestinationSystemtransitio0210', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/navigation/NavNavdestinationNavdestinationsystemtransitio/NavdestinationSystemtransitio0210');
      await driver.delayMs(2000);

      let btnNav: Component = await driver.findComponent(ON.id('btn_nav_transition'));
      expect(btnNav !== null).assertTrue();
      await btnNav.click();
      await driver.delayMs(500);

      let btnDisable: Component = await driver.findComponent(ON.id('btn_disable_animation'));
      expect(btnDisable !== null).assertTrue();
      await btnDisable.click();
      await driver.delayMs(500);

      await windowSnap.snapShot();
      await driver.delayMs(1000);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0220
     * @tc.name   : Navigation自定义转场动画能力增强（animated场景）
     * @tc.desc   : Verify nav navdestination navdestinationsystemtransitio interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('testNavdestinationSystemtransitio0220', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/navigation/NavNavdestinationNavdestinationsystemtransitio/NavdestinationSystemtransitio0220');
      await driver.delayMs(2000);

      let btnNav: Component = await driver.findComponent(ON.id('btn_nav_transition'));
      expect(btnNav !== null).assertTrue();
      await btnNav.click();
      await driver.delayMs(500);

      await windowSnap.snapShot();
      await driver.delayMs(1000);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0230
     * @tc.name   : Navigation自定义转场动画能力增强（NavPathStack操作开发者自定义场景）
     * @tc.desc   : Verify nav navdestination navdestinationsystemtransitio interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('testNavdestinationSystemtransitio0230', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/navigation/NavNavdestinationNavdestinationsystemtransitio/NavdestinationSystemtransitio0230');
      await driver.delayMs(2000);

      let btnNav: Component = await driver.findComponent(ON.id('btn_custom_nav'));
      expect(btnNav !== null).assertTrue();
      await btnNav.click();
      await driver.delayMs(500);

      await windowSnap.snapShot();
      await driver.delayMs(1000);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0240
     * @tc.name   : Navigation自定义转场动画能力增强（调用queryNavigationInfo场景）
     * @tc.desc   : Verify nav navdestination navdestinationsystemtransitio interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('testNavdestinationSystemtransitio0240', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/navigation/NavNavdestinationNavdestinationsystemtransitio/NavdestinationSystemtransitio0240');
      await driver.delayMs(2000);

      let btnNav: Component = await driver.findComponent(ON.id('btn_query_nav'));
      expect(btnNav !== null).assertTrue();
      await btnNav.click();
      await driver.delayMs(500);

      await windowSnap.snapShot();
      await driver.delayMs(1000);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0250
     * @tc.name   : Navigation自定义转场动画能力增强（调用OnReady场景）
     * @tc.desc   : Verify nav navdestination navdestinationsystemtransitio interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('testNavdestinationSystemtransitio0250', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/navigation/NavNavdestinationNavdestinationsystemtransitio/NavdestinationSystemtransitio0250');
      await driver.delayMs(2000);

      let btnNav: Component = await driver.findComponent(ON.id('btn_onready_test'));
      expect(btnNav !== null).assertTrue();
      await btnNav.click();
      await driver.delayMs(500);

      await windowSnap.snapShot();
      await driver.delayMs(1000);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0260
     * @tc.name   : Navigation自定义转场动画能力增强（自定义动画场景）
     * @tc.desc   : Verify nav navdestination navdestinationsystemtransitio interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('testNavdestinationSystemtransitio0260', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/navigation/NavNavdestinationNavdestinationsystemtransitio/NavdestinationSystemtransitio0260');
      await driver.delayMs(2000);

      let btnNav: Component = await driver.findComponent(ON.id('btn_nav_transition'));
      expect(btnNav !== null).assertTrue();
      await btnNav.click();
      await driver.delayMs(500);

      let btnPush: Component = await driver.findComponent(ON.id('btn_push_page12'));
      expect(btnPush !== null).assertTrue();
      await btnPush.click();
      await driver.delayMs(1000);

      await windowSnap.snapShot();
      await driver.delayMs(1000);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0280
     * @tc.name   : Navigation自定义转场动画能力增强（跳转HSP场景）
     * @tc.desc   : Verify nav navdestination navdestinationsystemtransitio interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('testNavdestinationSystemtransitio0280', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/navigation/NavNavdestinationNavdestinationsystemtransitio/NavdestinationSystemtransitio0280');
      await driver.delayMs(2000);

      let btnTest6: Component = await driver.findComponent(ON.id('btn_test6'));
      expect(btnTest6 !== null).assertTrue();
      await btnTest6.click();
      await driver.delayMs(500);

      await windowSnap.snapShot();
      await driver.delayMs(1000);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0290
     * @tc.name   : Navigation自定义转场动画能力增强（跳转HAR场景）
     * @tc.desc   : Verify nav navdestination navdestinationsystemtransitio interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('testNavdestinationSystemtransitio0290', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/navigation/NavNavdestinationNavdestinationsystemtransitio/NavdestinationSystemtransitio0290');
      await driver.delayMs(2000);

      let btnTest6: Component = await driver.findComponent(ON.id('btn_test6'));
      expect(btnTest6 !== null).assertTrue();
      await btnTest6.click();
      await driver.delayMs(500);

      await windowSnap.snapShot();
      await driver.delayMs(1000);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0300
     * @tc.name   : Navigation自定义转场动画能力增强（一次push DIALOG+STANDARD页面场景）
     * @tc.desc   : Verify nav navdestination navdestinationsystemtransitio interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('testNavdestinationSystemtransitio0300', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/navigation/NavNavdestinationNavdestinationsystemtransitio/NavdestinationSystemtransitio0300');
      await driver.delayMs(2000);

      let btnNav: Component = await driver.findComponent(ON.id('btn_nav_transition'));
      expect(btnNav !== null).assertTrue();
      await btnNav.click();
      await driver.delayMs(500);

      let btnPush: Component = await driver.findComponent(ON.id('btn_push_sd_content'));
      expect(btnPush !== null).assertTrue();
      await btnPush.click();
      await driver.delayMs(1000);

      await windowSnap.snapShot();
      await driver.delayMs(1000);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0310
     * @tc.name   : Navigation自定义转场动画能力增强（一次push DIALOG页面场景）
     * @tc.desc   : Verify nav navdestination navdestinationsystemtransitio interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('testNavdestinationSystemtransitio0310', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/navigation/NavNavdestinationNavdestinationsystemtransitio/NavdestinationSystemtransitio0310');
      await driver.delayMs(2000);

      let btnNav: Component = await driver.findComponent(ON.id('btn_nav_transition'));
      expect(btnNav !== null).assertTrue();
      await btnNav.click();
      await driver.delayMs(500);

      let btnPush: Component = await driver.findComponent(ON.id('btn_push_dialogs'));
      expect(btnPush !== null).assertTrue();
      await btnPush.click();
      await driver.delayMs(1000);

      await windowSnap.snapShot();
      await driver.delayMs(1000);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0320
     * @tc.name   : Navigation自定义转场动画能力增强（一次push STANDARD页面场景）
     * @tc.desc   : Verify nav navdestination navdestinationsystemtransitio interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('testNavdestinationSystemtransitio0320', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/navigation/NavNavdestinationNavdestinationsystemtransitio/NavdestinationSystemtransitio0320');
      await driver.delayMs(2000);

      let btnNav: Component = await driver.findComponent(ON.id('btn_nav_transition'));
      expect(btnNav !== null).assertTrue();
      await btnNav.click();
      await driver.delayMs(500);

      let btnPush: Component = await driver.findComponent(ON.id('btn_push_standards'));
      expect(btnPush !== null).assertTrue();
      await btnPush.click();
      await driver.delayMs(1000);

      await windowSnap.snapShot();
      await driver.delayMs(1000);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0330
     * @tc.name   : Navigation自定义转场动画能力增强（一次push STANDARD页面异常值场景）
     * @tc.desc   : Verify nav navdestination navdestinationsystemtransitio interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('testNavdestinationSystemtransitio0330', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/navigation/NavNavdestinationNavdestinationsystemtransitio/NavdestinationSystemtransitio0330');
      await driver.delayMs(2000);

      let btnNav: Component = await driver.findComponent(ON.id('btn_nav_transition'));
      expect(btnNav !== null).assertTrue();
      await btnNav.click();
      await driver.delayMs(500);

      let btnPush: Component = await driver.findComponent(ON.id('btn_push_abnormal_standard'));
      expect(btnPush !== null).assertTrue();
      await btnPush.click();
      await driver.delayMs(1000);

      await windowSnap.snapShot();
      await driver.delayMs(1000);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0340
     * @tc.name   : Navigation自定义转场动画能力增强（一次push DIALOG页面异常值场景）
     * @tc.desc   : Verify nav navdestination navdestinationsystemtransitio interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('testNavdestinationSystemtransitio0340', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/navigation/NavNavdestinationNavdestinationsystemtransitio/NavdestinationSystemtransitio0340');
      await driver.delayMs(2000);

      let btnNav: Component = await driver.findComponent(ON.id('btn_nav_transition'));
      expect(btnNav !== null).assertTrue();
      await btnNav.click();
      await driver.delayMs(500);

      let btnPush: Component = await driver.findComponent(ON.id('btn_push_abnormal_dialog'));
      expect(btnPush !== null).assertTrue();
      await btnPush.click();
      await driver.delayMs(1000);

      await windowSnap.snapShot();
      await driver.delayMs(1000);
      done();
    });
  });
}
