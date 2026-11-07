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

export default function uTransformationTest() {

  describe('uTransformationTest', () => {
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
     * @tc.number : SUB_ACE_UI_ATTRIBUTES_GRAPHICTRANSFORMATION_INTERFACE_0280
     * @tc.name   : Attributes graphictransformation interface
     * @tc.desc   : Verify attributes graphictransformation interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : SmallTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_ATTRIBUTES_GRAPHICTRANSFORMATION_INTERFACE_0280',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_GRAPHICTRANSFORMATION_INTERFACE_0280 start.`);
      Settings.createWindow('testability/pages/scenario/misc/UITransformationTestCase/UITransformationTestCase001');
      await Utils.sleep(6000);
      windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES_GRAPHICTRANSFORMATION_INTERFACE_0280');
      await Utils.sleep(2000);
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_GRAPHICTRANSFORMATION_INTERFACE_0280 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES_GRAPHICTRANSFORMATION_INTERFACE_0330
     * @tc.name   : Attributes graphictransformation interface
     * @tc.desc   : Verify attributes graphictransformation interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : SmallTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_ATTRIBUTES_GRAPHICTRANSFORMATION_INTERFACE_0330',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
        Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_GRAPHICTRANSFORMATION_INTERFACE_0330 start.`);
        Settings.createWindow('testability/pages/scenario/misc/UITransformationTestCase/UITransformationTestCase002');
        await Utils.sleep(6000);
        windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES_GRAPHICTRANSFORMATION_INTERFACE_0330');
        await Utils.sleep(2000);
        Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_GRAPHICTRANSFORMATION_INTERFACE_0330 finish.`);
        done();
      })

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES_GRAPHICTRANSFORMATION_INTERFACE_0110
     * @tc.name   : Attributes graphictransformation interface
     * @tc.desc   : Verify attributes graphictransformation interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : SmallTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_ATTRIBUTES_GRAPHICTRANSFORMATION_INTERFACE_0110',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
        Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_GRAPHICTRANSFORMATION_INTERFACE_0110 start.`);
        Settings.createWindow('testability/pages/scenario/misc/UITransformationTestCase/UITransformationTestCase003');
        await Utils.sleep(6000);
        windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES_GRAPHICTRANSFORMATION_INTERFACE_0110');
        await Utils.sleep(2000);
        Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_GRAPHICTRANSFORMATION_INTERFACE_0110 finish.`);
        done();
      })

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES_GRAPHICTRANSFORMATION_INTERFACE_0170
     * @tc.name   : Attributes graphictransformation interface
     * @tc.desc   : Verify attributes graphictransformation interface interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : SmallTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_ATTRIBUTES_GRAPHICTRANSFORMATION_INTERFACE_0170',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
        Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_GRAPHICTRANSFORMATION_INTERFACE_0170 start.`);
        Settings.createWindow('testability/pages/scenario/misc/UITransformationTestCase/UITransformationTestCase004');
        await Utils.sleep(6000);
        windowSnap.snapShot('SUB_ACE_UI_ATTRIBUTES_GRAPHICTRANSFORMATION_INTERFACE_0170');
        await Utils.sleep(2000);
        Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_GRAPHICTRANSFORMATION_INTERFACE_0170 finish.`);
        done();
      })
  })
}