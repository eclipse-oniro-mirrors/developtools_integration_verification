/**
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Settings from '../../../model/Settings';
import windowSnap from '../../../model/snapShot';
import Logger from '../../../model/Logger';
import Utils from '../../../model/Utils';
import { Driver, ON, Component } from '@kit.TestKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { i18n } from '@kit.LocalizationKit';

export default function listMirrorTest() {
  describe('listMirrorTest', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        return;
      }
      Settings.windowClass.destroyWindow((err: BusinessError) => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MIRROR_0030
     * @tc.name   : List横向布局镜像测试，ListItemGroup和ListItem混合
     * @tc.desc   : Verify listandgrid list mirror layout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MIRROR_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MIRROR_0030 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listMirror01');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 切换阿拉伯语
      try {
        i18n.System.setSystemLanguage('ar');
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`call System.setSystemLanguage failed, error code: ${err.code}, message: ${err.message}.`);
      }
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MIRROR_0030');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MIRROR_0030 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MIRROR_0060
     * @tc.name   : 横向布局镜像下scrollTo接口正常
     * @tc.desc   : Verify listandgrid list mirror layout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MIRROR_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MIRROR_0060 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listMirror02');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 切换阿拉伯语
      try {
        i18n.System.setSystemLanguage('ar');
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`call System.setSystemLanguage failed, error code: ${err.code}, message: ${err.message}.`);
      }
      await driver.waitForIdle(1000, 2000);

      // 点击scrollTo按钮
      let scrollToButton: Component = await driver.waitForComponent(ON.id('scrollToButton_02'), 1000);
      await scrollToButton.click();
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MIRROR_0060');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MIRROR_0060 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MIRROR_0230
     * @tc.name   : 纵向布局镜像下scrollToIndex接口正常
     * @tc.desc   : Verify listandgrid list mirror layout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MIRROR_0230', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MIRROR_0230 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listMirror03');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 切换阿拉伯语
      try {
        i18n.System.setSystemLanguage('ar');
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`call System.setSystemLanguage failed, error code: ${err.code}, message: ${err.message}.`);
      }
      await driver.waitForIdle(1000, 2000);

      // 点击scrollToIndex按钮
      let scrollToIndexButton: Component = await driver.waitForComponent(ON.id('scrollToIndexButton_03'), 1000);
      await scrollToIndexButton.click();
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MIRROR_0230');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MIRROR_0230 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MIRROR_0240
     * @tc.name   : 纵向布局镜像下scrollBy接口正常
     * @tc.desc   : Verify listandgrid list mirror layout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MIRROR_0240', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MIRROR_0240 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listMirror04');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 切换阿拉伯语
      try {
        i18n.System.setSystemLanguage('ar');
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`call System.setSystemLanguage failed, error code: ${err.code}, message: ${err.message}.`);
      }
      await driver.waitForIdle(1000, 2000);

      // 点击scrollBy按钮
      let scrollByButton: Component = await driver.waitForComponent(ON.id('scrollByButton_04'), 1000);
      await scrollByButton.click();
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MIRROR_0240');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MIRROR_0240 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MIRROR_0280
     * @tc.name   : List竖向布局镜像测试，lanes为3
     * @tc.desc   : Verify listandgrid list mirror layout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MIRROR_0280', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MIRROR_0280 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listMirror05');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 切换阿拉伯语
      try {
        i18n.System.setSystemLanguage('ar');
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`call System.setSystemLanguage failed, error code: ${err.code}, message: ${err.message}.`);
      }
      await driver.waitForIdle(1000, 2000);

      // 点击lanes按钮
      let lanesButton: Component = await driver.waitForComponent(ON.id('lanesButton_05'), 1000);
      await lanesButton.click();
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MIRROR_0280');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MIRROR_0280 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MIRROR_0300
     * @tc.name   : List竖向布局镜像测试，alignListItem为Center
     * @tc.desc   : Verify listandgrid list mirror layout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MIRROR_0300', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MIRROR_0300 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listMirror06');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 切换阿拉伯语
      try {
        i18n.System.setSystemLanguage('ar');
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`call System.setSystemLanguage failed, error code: ${err.code}, message: ${err.message}.`);
      }
      await driver.waitForIdle(1000, 2000);

      // 点击alignListItem_Center按钮
      let alignButton: Component = await driver.waitForComponent(ON.id('alignListItem_Center_06'), 1000);
      await alignButton.click();
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MIRROR_0300');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MIRROR_0300 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MIRROR_0420
     * @tc.name   : List镜像测试，分割线颜色为黄色
     * @tc.desc   : Verify listandgrid list mirror layout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MIRROR_0420', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MIRROR_0420 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listMirror07');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 切换阿拉伯语
      try {
        i18n.System.setSystemLanguage('ar');
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`call System.setSystemLanguage failed, error code: ${err.code}, message: ${err.message}.`);
      }
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MIRROR_0420');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MIRROR_0420 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MIRROR_0430
     * @tc.name   : List镜像测试，scrollBar配置
     * @tc.desc   : Verify listandgrid list mirror layout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MIRROR_0430', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MIRROR_0430 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listMirror08');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 切换阿拉伯语
      try {
        i18n.System.setSystemLanguage('ar');
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`call System.setSystemLanguage failed, error code: ${err.code}, message: ${err.message}.`);
      }
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MIRROR_0430');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MIRROR_0430 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MIRROR_0480
     * @tc.name   : 验证List组件子组件为ListItemGroup的childrenMainSize属性的update接口正常
     * @tc.desc   : Verify listandgrid list mirror layout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MIRROR_0480', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MIRROR_0480 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listMirror09');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 切换阿拉伯语
      try {
        i18n.System.setSystemLanguage('ar');
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`call System.setSystemLanguage failed, error code: ${err.code}, message: ${err.message}.`);
      }
      await driver.waitForIdle(1000, 2000);

      // 点击update按钮
      let updateButton: Component = await driver.waitForComponent(ON.id('updateButton_09'), 1000);
      await updateButton.click();
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MIRROR_0480');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MIRROR_0480 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MIRROR_0490
     * @tc.name   : 验证List组件子组件为ListItemGroup的childrenMainSize属性的splice接口正常
     * @tc.desc   : Verify listandgrid list mirror layout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MIRROR_0490', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MIRROR_0490 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listMirror10');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 切换阿拉伯语
      try {
        i18n.System.setSystemLanguage('ar');
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`call System.setSystemLanguage failed, error code: ${err.code}, message: ${err.message}.`);
      }
      await driver.waitForIdle(1000, 2000);

      // 点击splice按钮
      let spliceButton: Component = await driver.waitForComponent(ON.id('spliceButton_10'), 1000);
      await spliceButton.click();
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MIRROR_0490');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MIRROR_0490 finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MIRROR_0710
     * @tc.name   : list组件镜像时切换横竖屏
     * @tc.desc   : Verify listandgrid list mirror layout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MIRROR_0710', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MIRROR_0710 start.`);
      Settings.createWindow('testability/pages/component/scroll/listAndGrid/listMirror11');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(1000, 2000);

      // 切换阿拉伯语
      try {
        i18n.System.setSystemLanguage('ar');
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        console.error(`call System.setSystemLanguage failed, error code: ${err.code}, message: ${err.message}.`);
      }
      await driver.waitForIdle(1000, 2000);

      // 切换横竖屏
      await Settings.changeWindowOrientation('landScape');
      await driver.waitForIdle(1000, 2000);
      await Settings.changeWindowOrientation('portrait');
      await driver.waitForIdle(1000, 2000);

      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MIRROR_0710');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_MIRROR_0710 finish.`);
      done();
    });
  });
}
