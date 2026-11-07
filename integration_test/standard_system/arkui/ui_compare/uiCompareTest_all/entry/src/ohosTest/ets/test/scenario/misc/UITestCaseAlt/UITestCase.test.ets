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

export default function uITestCaseTest() {

  describe('uITestCaseTest', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_100
     * @tc.name   : Matrix setpoly
     * @tc.desc   : Verify matrix setpoly interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : SmallTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_100 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UITestCaseAlt/UITestCase001');
      await Utils.sleep(1000);
      let driver:Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('PointCount_0'));
      await button.click();
      await Utils.sleep(2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_100');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_100 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_200
     * @tc.name   : Matrix setpoly
     * @tc.desc   : Verify matrix setpoly interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : SmallTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_200 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UITestCaseAlt/UITestCase002');
      await Utils.sleep(1000);
      let driver:Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('SrcLong'));
      await button.click();
      await Utils.sleep(2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_200');
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_200 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_300
     * @tc.name   : Matrix setpoly
     * @tc.desc   : Verify matrix setpoly interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : SmallTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_300 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UITestCaseAlt/UITestCase003');
      await Utils.sleep(1000);
      let driver:Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('SrcIndex_2'));
      await button.click();
      await Utils.sleep(2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_300');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_300 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_400
     * @tc.name   : Matrix setpoly
     * @tc.desc   : Verify matrix setpoly interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : SmallTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_400 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UITestCaseAlt/UITestCase004');
      await Utils.sleep(1000);
      let driver:Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('SrcArray_005'));
      await button.click();
      await Utils.sleep(2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_400');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_400 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_500
     * @tc.name   : Matrix setpoly
     * @tc.desc   : Verify matrix setpoly interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : SmallTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_500 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UITestCaseAlt/UITestCase005');
      await Utils.sleep(1000);
      let driver:Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('SrcIndex'));
      await button.click();
      await Utils.sleep(2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_500');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_500 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_600
     * @tc.name   : Matrix setpoly
     * @tc.desc   : Verify matrix setpoly interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : SmallTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_600 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UITestCaseAlt/UITestCase006');
      await Utils.sleep(1000);
      let driver:Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('DstArray_001'));
      await button.click();
      await Utils.sleep(2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_600');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_600 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_700
     * @tc.name   : Matrix setpoly
     * @tc.desc   : Verify matrix setpoly interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : SmallTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_700 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UITestCaseAlt/UITestCase007');
      await Utils.sleep(1000);
      let driver:Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('PointCount_Negative1'));
      await button.click();
      await Utils.sleep(2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_700');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_700 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_800
     * @tc.name   : Matrix setpoly
     * @tc.desc   : Verify matrix setpoly interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : SmallTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0,
      async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_800 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UITestCaseAlt/UITestCase008');
      await Utils.sleep(1000);
      let driver:Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('SrcArray_006'));
      await button.click();
      await Utils.sleep(2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_800');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_800 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_900
     * @tc.name   : Matrix setpoly
     * @tc.desc   : Verify matrix setpoly interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : SmallTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_900', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_900 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UITestCaseAlt/UITestCase009');
      await Utils.sleep(1000);
      let driver:Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('DstIndex'));
      await button.click();
      await Utils.sleep(2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_900');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_900 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_1000
     * @tc.name   : Matrix setpoly
     * @tc.desc   : Verify matrix setpoly interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : SmallTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_1000', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_1000 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UITestCaseAlt/UITestCase010');
      await Utils.sleep(1000);
      let driver:Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('SrcArray_002'));
      await button.click();
      await Utils.sleep(2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_1000');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_1000 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_1100
     * @tc.name   : Matrix setpoly
     * @tc.desc   : Verify matrix setpoly interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : SmallTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_1100', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_1100 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UITestCaseAlt/UITestCase011');
      await Utils.sleep(1000);
      let driver:Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('SrcArray_001'));
      await button.click();
      await Utils.sleep(2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_1100');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_1100 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_1200
     * @tc.name   : Matrix setpoly
     * @tc.desc   : Verify matrix setpoly interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : SmallTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_1200', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_1200 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UITestCaseAlt/UITestCase012');
      await Utils.sleep(1000);
      let driver:Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('DstIndex_2'));
      await button.click();
      await Utils.sleep(2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_1200');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_1200 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_1300
     * @tc.name   : Matrix setpoly
     * @tc.desc   : Verify matrix setpoly interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : SmallTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_1300', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_1300 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UITestCaseAlt/UITestCase013');
      await Utils.sleep(1000);
      let driver:Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('PointCount_none'));
      await button.click();
      await Utils.sleep(2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_1300');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_1300 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_1400
     * @tc.name   : Matrix setpoly
     * @tc.desc   : Verify matrix setpoly interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : SmallTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_1400', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_1400 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UITestCaseAlt/UITestCase014');
      await Utils.sleep(1000);
      let driver:Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('PointCount_1'));
      await button.click();
      await Utils.sleep(2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_1400');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_1400 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_1500
     * @tc.name   : Matrix setpoly
     * @tc.desc   : Verify matrix setpoly interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : SmallTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_1500', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_1500 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UITestCaseAlt/UITestCase015');
      await Utils.sleep(1000);
      let driver:Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('DstLong'));
      await button.click();
      await Utils.sleep(2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_1500');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_1500 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_1600
     * @tc.name   : Matrix setpoly
     * @tc.desc   : Verify matrix setpoly interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : SmallTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_1600', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_1600 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UITestCaseAlt/UITestCase016');
      await Utils.sleep(1000);
      let driver:Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('SrcArray_004'));
      await button.click();
      await Utils.sleep(2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_1600');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_1600 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_1700
     * @tc.name   : Matrix setpoly
     * @tc.desc   : Verify matrix setpoly interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : SmallTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_1700', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_1700 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UITestCaseAlt/UITestCase017');
      await Utils.sleep(1000);
      let driver:Driver = Driver.create();
      let button: Component = await driver.findComponent(ON.id('SrcArray_003'));
      await button.click();
      await Utils.sleep(2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_1700');
      await Utils.sleep(1000);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MATRIX_SETPOLY_1700 finish.`);
      done();
    })
  })
}