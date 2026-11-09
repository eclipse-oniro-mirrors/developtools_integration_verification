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

export default function uIFocusOptimizationTest() {

  describe('uIFocusOptimizationTest', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_156
     * @tc.name   : Commonattr focusoptimization
     * @tc.desc   : Verify commonattr focusoptimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : SmallTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_156',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_156 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/UIFocusOptimizationTestCase/UIFocusOptimizationTestCase001',);
      let driver: Driver = Driver.create();
      await Utils.sleep(1000);
      windowSnap.snapShot(`SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_156`);
      await Utils.sleep(500);
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_156 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_169
     * @tc.name   : Commonattr focusoptimization
     * @tc.desc   : Verify commonattr focusoptimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : SmallTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_169',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_169 start.`);
        Settings.createWindow('testability/pages/scenario/action_event/UIFocusOptimizationTestCase/UIFocusOptimizationTestCase002',);
        let driver: Driver = Driver.create();
        await Utils.sleep(1000);
        windowSnap.snapShot(`SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_169`);
        await Utils.sleep(500);
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_169 finish.`);
        done();
      })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_147
     * @tc.name   : Commonattr focusoptimization
     * @tc.desc   : Verify commonattr focusoptimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : SmallTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_147',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_147 start.`);
        Settings.createWindow('testability/pages/scenario/action_event/UIFocusOptimizationTestCase/UIFocusOptimizationTestCase003',);
        let driver: Driver = Driver.create();
        await Utils.sleep(1000);
        windowSnap.snapShot(`SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_147`);
        await Utils.sleep(500);
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_147 finish.`);
        done();
      })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_145
     * @tc.name   : Commonattr focusoptimization
     * @tc.desc   : Verify commonattr focusoptimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : SmallTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_145',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_145 start.`);
        Settings.createWindow('testability/pages/scenario/action_event/UIFocusOptimizationTestCase/UIFocusOptimizationTestCase004',);
        let driver: Driver = Driver.create();
        await Utils.sleep(1000);
        windowSnap.snapShot(`SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_145`);
        await Utils.sleep(500);
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_145 finish.`);
        done();
      })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_176
     * @tc.name   : Commonattr focusoptimization
     * @tc.desc   : Verify commonattr focusoptimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : SmallTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_176',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_176 start.`);
        Settings.createWindow('testability/pages/scenario/action_event/UIFocusOptimizationTestCase/UIFocusOptimizationTestCase005',);
        let driver: Driver = Driver.create();
        await Utils.sleep(1000);
        windowSnap.snapShot(`SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_176`);
        await Utils.sleep(500);
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_176 finish.`);
        done();
      })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_148
     * @tc.name   : Commonattr focusoptimization
     * @tc.desc   : Verify commonattr focusoptimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : SmallTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_148',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_148 start.`);
        Settings.createWindow('testability/pages/scenario/action_event/UIFocusOptimizationTestCase/UIFocusOptimizationTestCase006',);
        let driver: Driver = Driver.create();
        await Utils.sleep(1000);
        windowSnap.snapShot(`SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_148`);
        await Utils.sleep(500);
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_148 finish.`);
        done();
      })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_163
     * @tc.name   : Commonattr focusoptimization
     * @tc.desc   : Verify commonattr focusoptimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : SmallTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_163',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_163 start.`);
        Settings.createWindow('testability/pages/scenario/action_event/UIFocusOptimizationTestCase/UIFocusOptimizationTestCase007',);
        let driver: Driver = Driver.create();
        await Utils.sleep(1000);
        windowSnap.snapShot(`SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_163`);
        await Utils.sleep(500);
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_163 finish.`);
        done();
      })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_131
     * @tc.name   : Commonattr focusoptimization
     * @tc.desc   : Verify commonattr focusoptimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : SmallTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_131',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_131 start.`);
        Settings.createWindow('testability/pages/scenario/action_event/UIFocusOptimizationTestCase/UIFocusOptimizationTestCase008',);
        let driver: Driver = Driver.create();
        await Utils.sleep(1000);
        windowSnap.snapShot(`SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_131`);
        await Utils.sleep(500);
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_131 finish.`);
        done();
      })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_144
     * @tc.name   : Commonattr focusoptimization
     * @tc.desc   : Verify commonattr focusoptimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : SmallTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_144',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_144 start.`);
        Settings.createWindow('testability/pages/scenario/action_event/UIFocusOptimizationTestCase/UIFocusOptimizationTestCase009',);
        let driver: Driver = Driver.create();
        await Utils.sleep(1000);
        windowSnap.snapShot(`SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_144`);
        await Utils.sleep(500);
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_144 finish.`);
        done();
      })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_129
     * @tc.name   : Commonattr focusoptimization
     * @tc.desc   : Verify commonattr focusoptimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : SmallTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_129',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_129 start.`);
        Settings.createWindow('testability/pages/scenario/action_event/UIFocusOptimizationTestCase/UIFocusOptimizationTestCase010',);
        let driver: Driver = Driver.create();
        await Utils.sleep(1000);
        windowSnap.snapShot(`SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_129`);
        await Utils.sleep(500);
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_129 finish.`);
        done();
      })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_171
     * @tc.name   : Commonattr focusoptimization
     * @tc.desc   : Verify commonattr focusoptimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : SmallTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_171',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_171 start.`);
        Settings.createWindow('testability/pages/scenario/action_event/UIFocusOptimizationTestCase/UIFocusOptimizationTestCase011',);
        let driver: Driver = Driver.create();
        await Utils.sleep(1000);
        windowSnap.snapShot(`SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_171`);
        await Utils.sleep(500);
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_171 finish.`);
        done();
      })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_177
     * @tc.name   : Commonattr focusoptimization
     * @tc.desc   : Verify commonattr focusoptimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : SmallTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_177',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_177 start.`);
        Settings.createWindow('testability/pages/scenario/action_event/UIFocusOptimizationTestCase/UIFocusOptimizationTestCase012',);
        let driver: Driver = Driver.create();
        await Utils.sleep(1000);
        windowSnap.snapShot(`SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_177`);
        await Utils.sleep(500);
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_177 finish.`);
        done();
      })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_172
     * @tc.name   : Commonattr focusoptimization
     * @tc.desc   : Verify commonattr focusoptimization interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : SmallTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_172',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_172 start.`);
        Settings.createWindow('testability/pages/scenario/action_event/UIFocusOptimizationTestCase/UIFocusOptimizationTestCase013',);
        let driver: Driver = Driver.create();
        await Utils.sleep(1000);
        windowSnap.snapShot(`SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_172`);
        await Utils.sleep(500);
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSOPTIMIZATION_172 finish.`);
        done();
      })
  })
}