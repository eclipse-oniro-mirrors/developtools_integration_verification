/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import Settings from '../../../model/Settings'
import windowSnap from '../../../model/snapShot'
import Logger from '../../../model/Logger'
import Utils from '../../../model/Utils'
import { Driver, ON, Component } from '@kit.TestKit';

export default function counterLargeFont() {

  describe('counterLargeFont', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_COUNTER_LARGE_FONT_0016
     * @tc.name   : CounterType.LIST创建组件，使用设置公共组件字体大小设置
     * @tc.desc   : Verify media counter large font / aging font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_COUNTER_LARGE_FONT_0016', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_COUNTER_LARGE_FONT_0016 start.`);
      // 步骤1：添加CounterType.LIST组件，通过公共组件的fontSize设置字体大小
      Settings.createWindow('testability/pages/component/form/CounterLargeFont/CounterLargeFont0016')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：编译运行代码
      // 步骤3：分别设置系统字体1，1.15，1.3，1.45，1.75，2倍
      let counter_largefont_0016_btn_1 = await driver.waitForComponent(ON.id('counter_largefont_0016_btn_1'), 500)
      await counter_largefont_0016_btn_1.click()
      await Utils.sleep(500)
      let counter_largefont_0016_btn_1_15 = await driver.waitForComponent(ON.id('counter_largefont_0016_btn_1_15'), 500)
      await counter_largefont_0016_btn_1_15.click()
      await Utils.sleep(500)
      let counter_largefont_0016_btn_1_3 = await driver.waitForComponent(ON.id('counter_largefont_0016_btn_1_3'), 500)
      await counter_largefont_0016_btn_1_3.click()
      await Utils.sleep(500)
      let counter_largefont_0016_btn_1_45 = await driver.waitForComponent(ON.id('counter_largefont_0016_btn_1_45'), 500)
      await counter_largefont_0016_btn_1_45.click()
      await Utils.sleep(500)
      let counter_largefont_0016_btn_1_75 = await driver.waitForComponent(ON.id('counter_largefont_0016_btn_1_75'), 500)
      await counter_largefont_0016_btn_1_75.click()
      await Utils.sleep(500)
      let counter_largefont_0016_btn_2 = await driver.waitForComponent(ON.id('counter_largefont_0016_btn_2'), 500)
      await counter_largefont_0016_btn_2.click()
      await Utils.sleep(500)
      // 预期结果：组件label不受公共组件字体的控制，文本跟随系统设置改变
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_COUNTER_LARGE_FONT_0016 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_COUNTER_LARGE_FONT_0017
     * @tc.name   : CounterType.LIST创建组件，动态切换跟随系统字体大小设置
     * @tc.desc   : Verify media counter large font / aging font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_COUNTER_LARGE_FONT_0017', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_COUNTER_LARGE_FONT_0017 start.`);
      // 步骤1：添加CounterType.LIST组件
      Settings.createWindow('testability/pages/component/form/CounterLargeFont/CounterLargeFont0017')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：编译运行代码
      // 步骤3：动态切换系统字体0.85，1，1.15，1.3，1.45，1.75，2，3.2倍
      let counter_largefont_0017_btn_0_85 = await driver.waitForComponent(ON.id('counter_largefont_0017_btn_0_85'), 500)
      await counter_largefont_0017_btn_0_85.click()
      await Utils.sleep(500)
      let counter_largefont_0017_btn_1 = await driver.waitForComponent(ON.id('counter_largefont_0017_btn_1'), 500)
      await counter_largefont_0017_btn_1.click()
      await Utils.sleep(500)
      let counter_largefont_0017_btn_1_15 = await driver.waitForComponent(ON.id('counter_largefont_0017_btn_1_15'), 500)
      await counter_largefont_0017_btn_1_15.click()
      await Utils.sleep(500)
      let counter_largefont_0017_btn_1_3 = await driver.waitForComponent(ON.id('counter_largefont_0017_btn_1_3'), 500)
      await counter_largefont_0017_btn_1_3.click()
      await Utils.sleep(500)
      let counter_largefont_0017_btn_1_45 = await driver.waitForComponent(ON.id('counter_largefont_0017_btn_1_45'), 500)
      await counter_largefont_0017_btn_1_45.click()
      await Utils.sleep(500)
      let counter_largefont_0017_btn_1_75 = await driver.waitForComponent(ON.id('counter_largefont_0017_btn_1_75'), 500)
      await counter_largefont_0017_btn_1_75.click()
      await Utils.sleep(500)
      let counter_largefont_0017_btn_2 = await driver.waitForComponent(ON.id('counter_largefont_0017_btn_2'), 500)
      await counter_largefont_0017_btn_2.click()
      await Utils.sleep(500)
      let counter_largefont_0017_btn_3_2 = await driver.waitForComponent(ON.id('counter_largefont_0017_btn_3_2'), 500)
      await counter_largefont_0017_btn_3_2.click()
      await Utils.sleep(500)
      // 预期结果：应用不做跟随设置能够跟随系统字体大小设置，1倍以上时label文本跟随系统设置，0.85倍时label和value跟随系统设置变小
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_COUNTER_LARGE_FONT_0017 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_COUNTER_LARGE_FONT_0024
     * @tc.name   : CounterType.COMPACT创建组件，使用设置公共组件字体大小设置
     * @tc.desc   : Verify media counter large font / aging font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_COUNTER_LARGE_FONT_0024', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_COUNTER_LARGE_FONT_0024 start.`);
      // 步骤1：添加CounterType.COMPACT组件，通过公共组件的fontSize设置字体大小
      Settings.createWindow('testability/pages/component/form/CounterLargeFont/CounterLargeFont0024')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：编译运行代码
      // 步骤3：分别设置系统字体1，1.15，1.3，1.45，1.75，2倍
      let counter_largefont_0024_btn_1 = await driver.waitForComponent(ON.id('counter_largefont_0024_btn_1'), 500)
      await counter_largefont_0024_btn_1.click()
      await Utils.sleep(500)
      let counter_largefont_0024_btn_1_15 = await driver.waitForComponent(ON.id('counter_largefont_0024_btn_1_15'), 500)
      await counter_largefont_0024_btn_1_15.click()
      await Utils.sleep(500)
      let counter_largefont_0024_btn_1_3 = await driver.waitForComponent(ON.id('counter_largefont_0024_btn_1_3'), 500)
      await counter_largefont_0024_btn_1_3.click()
      await Utils.sleep(500)
      let counter_largefont_0024_btn_1_45 = await driver.waitForComponent(ON.id('counter_largefont_0024_btn_1_45'), 500)
      await counter_largefont_0024_btn_1_45.click()
      await Utils.sleep(500)
      let counter_largefont_0024_btn_1_75 = await driver.waitForComponent(ON.id('counter_largefont_0024_btn_1_75'), 500)
      await counter_largefont_0024_btn_1_75.click()
      await Utils.sleep(500)
      let counter_largefont_0024_btn_2 = await driver.waitForComponent(ON.id('counter_largefont_0024_btn_2'), 500)
      await counter_largefont_0024_btn_2.click()
      await Utils.sleep(500)
      // 预期结果：组件label不受公共组件字体的控制，文本跟随系统设置改变
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_COUNTER_LARGE_FONT_0024 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_COUNTER_LARGE_FONT_0025
     * @tc.name   : CounterType.COMPACT创建组件，动态切换跟随系统字体大小设置
     * @tc.desc   : Verify media counter large font / aging font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_COUNTER_LARGE_FONT_0025', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_COUNTER_LARGE_FONT_0025 start.`);
      // 步骤1：添加CounterType.COMPACT组件
      Settings.createWindow('testability/pages/component/form/CounterLargeFont/CounterLargeFont0025')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：编译运行代码
      // 步骤3：动态切换系统字体0.85，1，1.15，1.3，1.45，1.75，2，3.2倍
      let counter_largefont_0025_btn_0_85 = await driver.waitForComponent(ON.id('counter_largefont_0025_btn_0_85'), 500)
      await counter_largefont_0025_btn_0_85.click()
      await Utils.sleep(500)
      let counter_largefont_0025_btn_1 = await driver.waitForComponent(ON.id('counter_largefont_0025_btn_1'), 500)
      await counter_largefont_0025_btn_1.click()
      await Utils.sleep(500)
      let counter_largefont_0025_btn_1_15 = await driver.waitForComponent(ON.id('counter_largefont_0025_btn_1_15'), 500)
      await counter_largefont_0025_btn_1_15.click()
      await Utils.sleep(500)
      let counter_largefont_0025_btn_1_3 = await driver.waitForComponent(ON.id('counter_largefont_0025_btn_1_3'), 500)
      await counter_largefont_0025_btn_1_3.click()
      await Utils.sleep(500)
      let counter_largefont_0025_btn_1_45 = await driver.waitForComponent(ON.id('counter_largefont_0025_btn_1_45'), 500)
      await counter_largefont_0025_btn_1_45.click()
      await Utils.sleep(500)
      let counter_largefont_0025_btn_1_75 = await driver.waitForComponent(ON.id('counter_largefont_0025_btn_1_75'), 500)
      await counter_largefont_0025_btn_1_75.click()
      await Utils.sleep(500)
      let counter_largefont_0025_btn_2 = await driver.waitForComponent(ON.id('counter_largefont_0025_btn_2'), 500)
      await counter_largefont_0025_btn_2.click()
      await Utils.sleep(500)
      let counter_largefont_0025_btn_3_2 = await driver.waitForComponent(ON.id('counter_largefont_0025_btn_3_2'), 500)
      await counter_largefont_0025_btn_3_2.click()
      await Utils.sleep(500)
      // 预期结果：应用不做跟随设置能够跟随系统字体大小设置，1倍以上时label文本跟随系统设置，0.85倍时label和value跟随系统设置变小
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_COUNTER_LARGE_FONT_0025 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_COUNTER_LARGE_FONT_0029
     * @tc.name   : CounterType.INLINE创建组件，使用设置公共组件字体大小设置
     * @tc.desc   : Verify media counter large font / aging font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_COUNTER_LARGE_FONT_0029', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_COUNTER_LARGE_FONT_0029 start.`);
      // 步骤1：添加CounterType.INLINE组件，通过公共组件的fontSize设置字体大小
      Settings.createWindow('testability/pages/component/form/CounterLargeFont/CounterLargeFont0029')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：编译运行代码
      // 步骤3：分别设置系统字体0.85，1，1.15，1.3，1.45，1.75，2，3.2倍
      let counter_largefont_0029_btn_0_85 = await driver.waitForComponent(ON.id('counter_largefont_0029_btn_0_85'), 500)
      await counter_largefont_0029_btn_0_85.click()
      await Utils.sleep(500)
      let counter_largefont_0029_btn_1 = await driver.waitForComponent(ON.id('counter_largefont_0029_btn_1'), 500)
      await counter_largefont_0029_btn_1.click()
      await Utils.sleep(500)
      let counter_largefont_0029_btn_1_15 = await driver.waitForComponent(ON.id('counter_largefont_0029_btn_1_15'), 500)
      await counter_largefont_0029_btn_1_15.click()
      await Utils.sleep(500)
      let counter_largefont_0029_btn_1_3 = await driver.waitForComponent(ON.id('counter_largefont_0029_btn_1_3'), 500)
      await counter_largefont_0029_btn_1_3.click()
      await Utils.sleep(500)
      let counter_largefont_0029_btn_1_45 = await driver.waitForComponent(ON.id('counter_largefont_0029_btn_1_45'), 500)
      await counter_largefont_0029_btn_1_45.click()
      await Utils.sleep(500)
      let counter_largefont_0029_btn_1_75 = await driver.waitForComponent(ON.id('counter_largefont_0029_btn_1_75'), 500)
      await counter_largefont_0029_btn_1_75.click()
      await Utils.sleep(500)
      let counter_largefont_0029_btn_2 = await driver.waitForComponent(ON.id('counter_largefont_0029_btn_2'), 500)
      await counter_largefont_0029_btn_2.click()
      await Utils.sleep(500)
      let counter_largefont_0029_btn_3_2 = await driver.waitForComponent(ON.id('counter_largefont_0029_btn_3_2'), 500)
      await counter_largefont_0029_btn_3_2.click()
      await Utils.sleep(500)
      // 预期结果：组件不受公共组件字体的控制，value字体大小在0.85倍以上跟随系统设置变小，放大后不跟随系统设置生效
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_COUNTER_LARGE_FONT_0029 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_COUNTER_LARGE_FONT_0033
     * @tc.name   : CounterType.INLINE_DATE创建组件，使用设置公共组件字体大小设置
     * @tc.desc   : Verify media counter large font / aging font interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_COUNTER_LARGE_FONT_0033', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_COUNTER_LARGE_FONT_0033 start.`);
      // 步骤1：添加CounterType.INLINE_DATE组件，通过公共组件的fontSize设置字体大小
      Settings.createWindow('testability/pages/component/form/CounterLargeFont/CounterLargeFont0033')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      // 步骤2：编译运行代码
      // 步骤3：分别设置系统字体0.85，1，1.15，1.3，1.45，1.75，2，3.2倍
      let counter_largefont_0033_btn_0_85 = await driver.waitForComponent(ON.id('counter_largefont_0033_btn_0_85'), 500)
      await counter_largefont_0033_btn_0_85.click()
      await Utils.sleep(500)
      let counter_largefont_0033_btn_1 = await driver.waitForComponent(ON.id('counter_largefont_0033_btn_1'), 500)
      await counter_largefont_0033_btn_1.click()
      await Utils.sleep(500)
      let counter_largefont_0033_btn_1_15 = await driver.waitForComponent(ON.id('counter_largefont_0033_btn_1_15'), 500)
      await counter_largefont_0033_btn_1_15.click()
      await Utils.sleep(500)
      let counter_largefont_0033_btn_1_3 = await driver.waitForComponent(ON.id('counter_largefont_0033_btn_1_3'), 500)
      await counter_largefont_0033_btn_1_3.click()
      await Utils.sleep(500)
      let counter_largefont_0033_btn_1_45 = await driver.waitForComponent(ON.id('counter_largefont_0033_btn_1_45'), 500)
      await counter_largefont_0033_btn_1_45.click()
      await Utils.sleep(500)
      let counter_largefont_0033_btn_1_75 = await driver.waitForComponent(ON.id('counter_largefont_0033_btn_1_75'), 500)
      await counter_largefont_0033_btn_1_75.click()
      await Utils.sleep(500)
      let counter_largefont_0033_btn_2 = await driver.waitForComponent(ON.id('counter_largefont_0033_btn_2'), 500)
      await counter_largefont_0033_btn_2.click()
      await Utils.sleep(500)
      let counter_largefont_0033_btn_3_2 = await driver.waitForComponent(ON.id('counter_largefont_0033_btn_3_2'), 500)
      await counter_largefont_0033_btn_3_2.click()
      await Utils.sleep(500)
      // 预期结果：组件不受公共组件字体的控制，value字体大小在0.85倍以上跟随系统设置变小，放大后不跟随系统设置生效
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_COUNTER_LARGE_FONT_0033 finish.`);
      done()
    })


  })
}