/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { describe, afterEach, it, TestType, Size, Level } from '@ohos/hypium'
import { Driver, ON, Component } from '@kit.TestKit';
import Settings from '../../../model/Settings'
import windowSnap from '../../../model/snapShot'
import Logger from '../../../model/Logger'
import Utils from '../../../model/Utils'

/*
 * SUB_ACE_UI_ATTRIBUTES_FONT_INTERFACE_0010:设置文本颜色
 *
 * Settings.createWindow(config.url)：
 *  创建窗口，更改窗口基本配置，更改方式详见model/Settings createWindow方法
 *
 * windowSnap.snapShot(globalThis.context)：
 *  窗口截屏&图片文件保存，存储在设备端
 *  存储文件固定，单挑用例执行后覆盖，用于自动化UI对比
 *  支持调试更改文件名为时间戳格式，更改model/snapShot createAndGetFile方法 注释L35，放开L32，L33
 *
 * Logger日志使用方法：
 *  import Logger form './model/Logger'
 *  Logger.info(TAG,`config = ${config}, err = ${JSON.stringify(exception)}`)
 * */

export default function uIFrameworkTest() {

  describe('uIFrameworkTest', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        return
      }

      Settings.windowClass.destroyWindow((err) => {
        if (err.code) {
          Logger.error('TEST', `Failed to destroy the window. Cause : ${JSON.stringify(err)}`)
          return;
        }
        Logger.info('TEST', `Succeeded in destroy the window.`);
      })
      await Utils.sleep(1000);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_NODECONTAINER_0240
     * @tc.name   : Graphic nodecontainer
     * @tc.desc   : Verify graphic nodecontainer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : SmallTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_NODECONTAINER_0240',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_NODECONTAINER_0240 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UIFrameworkTestCase/UIFrameworkTestCase001');
      await Utils.sleep(1000);
      let driver:Driver = Driver.create();
      let NodeContainer: Component = await driver.findComponent(ON.id('NodeContainer'));
      await NodeContainer.click();
      await Utils.sleep(1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_NODECONTAINER_0240_1');
      await Utils.sleep(2000);
      await NodeContainer.click();
      await Utils.sleep(1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_NODECONTAINER_0240_2');
      await Utils.sleep(2000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_NODECONTAINER_0240 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_NODECONTAINER_0150
     * @tc.name   : Graphic nodecontainer
     * @tc.desc   : Verify graphic nodecontainer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : SmallTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_NODECONTAINER_0150',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_NODECONTAINER_0150 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UIFrameworkTestCase/UIFrameworkTestCase002');
      await Utils.sleep(500);
      windowSnap.snapShot(`SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_NODECONTAINER_0150_1`);
      await Utils.sleep(500);
      let driver:Driver = Driver.create();
      let NodeContainer: Component = await driver.findComponent(ON.id('NodeContainer'));
      for (let i = 1; i < 9; i++) {
        await NodeContainer.click();
        await Utils.sleep(500);
        windowSnap.snapShot(`SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_NODECONTAINER_0150_${i+1}`);
        await Utils.sleep(500);
      }
      await Utils.sleep(500);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_NODECONTAINER_0150 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_NODECONTAINER_0160
     * @tc.name   : Graphic nodecontainer
     * @tc.desc   : Verify graphic nodecontainer interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : SmallTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_NODECONTAINER_0160',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_NODECONTAINER_0160 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UIFrameworkTestCase/UIFrameworkTestCase003');
      await Utils.sleep(1000);
      let driver:Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('setEnabled'));
      await button.click();
      await Utils.sleep(1000);
      let NodeContainer: Component = await driver.findComponent(ON.id('NodeContainer'));
      await NodeContainer.click();
      await Utils.sleep(1000);
      await button.click();
      await Utils.sleep(1000);
      await NodeContainer.click();
      await Utils.sleep(1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_NODECONTAINER_0160');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_NODECONTAINER_0160 finish.`);
      done();
      })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_RENDER_0240
     * @tc.name   : Graphic nodecontainer render
     * @tc.desc   : Verify graphic nodecontainer render interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : SmallTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_RENDER_0240',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_RENDER_0240 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UIFrameworkTestCase/UIFrameworkTestCase004');
      await Utils.sleep(500);
      let driver:Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('setShadow'));
      await button.click();
      await Utils.sleep(500);
      windowSnap.snapShot(`SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_RENDER_0240`);
      await Utils.sleep(500);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_RENDER_0240 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_RENDER_3180
     * @tc.name   : Graphic nodecontainer render
     * @tc.desc   : Verify graphic nodecontainer render interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : SmallTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_RENDER_3180',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_RENDER_3180 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UIFrameworkTestCase/UIFrameworkTestCase005');
      await Utils.sleep(500);
      let driver:Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('setRotation'));
      await button.click();
      await Utils.sleep(500);
      windowSnap.snapShot(`SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_RENDER_3180`);
      await Utils.sleep(500);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_RENDER_3180 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_RENDER_3210
     * @tc.name   : Graphic nodecontainer render
     * @tc.desc   : Verify graphic nodecontainer render interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : SmallTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_RENDER_3210',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_RENDER_3210 start.`);
        Settings.createWindow('testability/pages/scenario/misc/UIFrameworkTestCase/UIFrameworkTestCase006');
        await Utils.sleep(500);
        let driver:Driver = Driver.create();
        let button: Component = await driver.findComponent(ON.id('setRotation'));
        await button.click();
        await Utils.sleep(500);
        windowSnap.snapShot(`SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_RENDER_3210`);
        await Utils.sleep(500);
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_RENDER_3210 finish.`);
        done();
      })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_RENDER_3220
     * @tc.name   : Graphic nodecontainer render
     * @tc.desc   : Verify graphic nodecontainer render interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : SmallTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_RENDER_3220',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_RENDER_3220 start.`);
        Settings.createWindow('testability/pages/scenario/misc/UIFrameworkTestCase/UIFrameworkTestCase007');
        await Utils.sleep(500);
        let driver:Driver = Driver.create();
        let button: Component = await driver.findComponent(ON.id('setRotation'));
        await button.click();
        await Utils.sleep(500);
        windowSnap.snapShot(`SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_RENDER_3220`);
        await Utils.sleep(500);
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_RENDER_3220 finish.`);
        done();
      })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_RENDER_3250
     * @tc.name   : Graphic nodecontainer render
     * @tc.desc   : Verify graphic nodecontainer render interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : SmallTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_RENDER_3250',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_RENDER_3250 start.`);
        Settings.createWindow('testability/pages/scenario/misc/UIFrameworkTestCase/UIFrameworkTestCase008');
        await Utils.sleep(500);
        let driver:Driver = Driver.create();
        let button: Component = await driver.findComponent(ON.id('setRotation'));
        await button.click();
        await Utils.sleep(500);
        windowSnap.snapShot(`SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_RENDER_3250`);
        await Utils.sleep(500);
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_RENDER_3250 finish.`);
        done();
      })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_RENDER_3190
     * @tc.name   : Graphic nodecontainer render
     * @tc.desc   : Verify graphic nodecontainer render interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : SmallTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_RENDER_3190',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_RENDER_3190 start.`);
        Settings.createWindow('testability/pages/scenario/misc/UIFrameworkTestCase/UIFrameworkTestCase009');
        await Utils.sleep(500);
        let driver:Driver = Driver.create();
        let button: Component = await driver.findComponent(ON.id('setRotation'));
        await button.click();
        await Utils.sleep(500);
        windowSnap.snapShot(`SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_RENDER_3190`);
        await Utils.sleep(500);
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_RENDER_3190 finish.`);
        done();
      })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_RENDER_3200
     * @tc.name   : Graphic nodecontainer render
     * @tc.desc   : Verify graphic nodecontainer render interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : SmallTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_RENDER_3200',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_RENDER_3200 start.`);
        Settings.createWindow('testability/pages/scenario/misc/UIFrameworkTestCase/UIFrameworkTestCase010');
        await Utils.sleep(500);
        let driver:Driver = Driver.create();
        let button: Component = await driver.findComponent(ON.id('setRotation'));
        await button.click();
        await Utils.sleep(500);
        windowSnap.snapShot(`SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_RENDER_3200`);
        await Utils.sleep(500);
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_RENDER_3200 finish.`);
        done();
      })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_RENDER_3240
     * @tc.name   : Graphic nodecontainer render
     * @tc.desc   : Verify graphic nodecontainer render interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : SmallTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_RENDER_3240',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_RENDER_3240 start.`);
        Settings.createWindow('testability/pages/scenario/misc/UIFrameworkTestCase/UIFrameworkTestCase011');
        await Utils.sleep(500);
        let driver:Driver = Driver.create();
        let button: Component = await driver.findComponent(ON.id('setRotation'));
        await button.click();
        await Utils.sleep(500);
        windowSnap.snapShot(`SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_RENDER_3240`);
        await Utils.sleep(500);
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_RENDER_3240 finish.`);
        done();
      })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_ONTOUCH_0050
     * @tc.name   : Graphic nodecontainer ontouch
     * @tc.desc   : Verify graphic nodecontainer ontouch interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : SmallTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_ONTOUCH_0050',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_ONTOUCH_0050 start.`);
        Settings.createWindow('testability/pages/scenario/misc/UIFrameworkTestCase/UIFrameworkTestCase012');
        await Utils.sleep(500);
        let driver:Driver = Driver.create();
        let button: Component = await driver.findComponent(ON.id('NodeContainer'));
        await button.click();
        await Utils.sleep(500);
        let driver1:Driver = Driver.create();
        let button1: Component = await driver1.findComponent(ON.id('onTouch'));
        await button1.click();
        await Utils.sleep(500);
        windowSnap.snapShot(`SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_ONTOUCH_0050`);
        await Utils.sleep(500);
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_ONTOUCH_0050 finish.`);
        done();
      })
  })
}