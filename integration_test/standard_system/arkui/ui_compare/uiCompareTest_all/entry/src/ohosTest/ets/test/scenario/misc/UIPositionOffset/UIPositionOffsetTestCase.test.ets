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

export default function uIPositionOffsetTest() {

  describe('uIPositionOffsetTest', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_POSITION_OFFSET_0080
     * @tc.name   : Position offset
     * @tc.desc   : Verify position offset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : SmallTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POSITION_OFFSET_0080',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POSITION_OFFSET_0080 start.`);
        Settings.createWindow('testability/pages/scenario/misc/UIPositionOffsetTestCase/UIPositionOffsetTestCase001');
        await Utils.sleep(1000);
        let driver1:Driver = Driver.create();
        let button1: Component = await driver1.findComponent(ON.id('Toggle Top'));
        for (let i = 0; i < 8; i++) {
          await button1.click();
          await Utils.sleep(300);
        }
        let driver2:Driver = Driver.create();
        let button2: Component = await driver2.findComponent(ON.id('Toggle Bottom'));
        for (let i = 0; i < 8; i++) {
          await button2.click();
          await Utils.sleep(300);
        }
        let driver3:Driver = Driver.create();
        let button3: Component = await driver3.findComponent(ON.id('Toggle Left'));
        for (let i = 0; i < 8; i++) {
          await button3.click();
          await Utils.sleep(300);
        }
        let driver4:Driver = Driver.create();
        let button4: Component = await driver4.findComponent(ON.id('Toggle Right'));
        for (let i = 0; i < 8; i++) {
          await button4.click();
          await Utils.sleep(300);
        }
        windowSnap.snapShot(`SUB_ACE_UI_COMPONENT_POSITION_OFFSET_0080`);
        await Utils.sleep(1000);
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POSITION_OFFSET_0080 finish.`);
        done();
      })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_POSITION_OFFSET_0370
     * @tc.name   : Position offset
     * @tc.desc   : Verify position offset interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : SmallTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_POSITION_OFFSET_0370',
      TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (done: Function) => {
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POSITION_OFFSET_0370 start.`);
        Settings.createWindow('testability/pages/scenario/misc/UIPositionOffsetTestCase/UIPositionOffsetTestCase002');
        await Utils.sleep(1000);
        let driver1:Driver = Driver.create();
        let button1: Component = await driver1.findComponent(ON.id('Toggle Top'));
        for (let i = 0; i < 8; i++) {
          await button1.click();
          await Utils.sleep(300);
        }
        let driver2:Driver = Driver.create();
        let button2: Component = await driver2.findComponent(ON.id('Toggle Bottom'));
        for (let i = 0; i < 8; i++) {
          await button2.click();
          await Utils.sleep(300);
        }
        let driver3:Driver = Driver.create();
        let button3: Component = await driver3.findComponent(ON.id('Toggle Left'));
        for (let i = 0; i < 8; i++) {
          await button3.click();
          await Utils.sleep(300);
        }
        let driver4:Driver = Driver.create();
        let button4: Component = await driver4.findComponent(ON.id('Toggle Right'));
        for (let i = 0; i < 8; i++) {
          await button4.click();
          await Utils.sleep(300);
        }
        windowSnap.snapShot(`SUB_ACE_UI_COMPONENT_POSITION_OFFSET_0370`);
        await Utils.sleep(1000);
        Logger.info('TEST', `SUB_ACE_UI_COMPONENT_POSITION_OFFSET_0370 finish.`);
        done();
      })
  })
}