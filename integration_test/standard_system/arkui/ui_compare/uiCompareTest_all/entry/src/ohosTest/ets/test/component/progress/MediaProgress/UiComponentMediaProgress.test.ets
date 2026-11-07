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
 
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium'
import Settings from '../../../model/Settings'
import windowSnap from '../../../model/snapShot'
import Logger from '../../../model/Logger'
import Utils from '../../../model/Utils'
import { Driver, ON, Component, MouseButton } from '@kit.TestKit'
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

export default function uiComponentMediaProgress() {

  describe('uiComponentMediaProgress', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0018
     * @tc.name   : Linear Linear, Ring without scale, Eclipse circular,ScaleRing with scale,Capsule Style Progress component set the right border to 0,and private CapsuleStyleOptions.borderWidth is not set
     * @tc.desc   : Verify media Progress border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0018', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0018 start.`);
      Settings.createWindow('testability/pages/component/progress/MediaProgress/UiComponentMediaProgress01')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0018 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0036
     * @tc.name   : Linear Linear,Ring Circle,Eclipse Circular,ScaleRing Scale Progress,Capsule Style Progress components set the right border width to -10,and set the private CapsuleStyleOptions.borderWidth to 3
     * @tc.desc   : Verify media Progress border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0036', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0036 start.`);
      Settings.createWindow('testability/pages/component/progress/MediaProgress/UiComponentMediaProgress02')
      let driver:Driver=Driver.create();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0036 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0019
     * @tc.name   : Linear Linear,Ring Circle,Eclipse Circle,ScaleRing Scale Progress,and Capsule Style Progress components are set to -10 on the right border,and Private CapsuleStyleOptions.borderWidth is not set
     * @tc.desc   : Verify media Progress border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0019', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0019 start.`);
      Settings.createWindow('testability/pages/component/progress/MediaProgress/UiComponentMediaProgress03')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0019 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0038
     * @tc.name   : LinearLinear,Ring,Eclipse,ScaleRing,CapsuleStyleProgressComponent settingTop Border is less than component widthSetPrivate CapsuleStyleOptions.borderWidth is set to 3
     * @tc.desc   : Verify media Progress border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0038', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0038 start.`);
      Settings.createWindow('testability/pages/component/progress/MediaProgress/UiComponentMediaProgress04')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0038 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0014
     * @tc.name   : Linear Linear,Ring Circle,Eclipse Circle,ScaleRing Scale Progress,Capsule Style Progress component is set to -10 The left border is not set to Private CapsuleStyleOptions.borderWidth
     * @tc.desc   : Verify media Progress border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0014', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0014 start.`);
      Settings.createWindow('testability/pages/component/progress/MediaProgress/UiComponentMediaProgress05')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0014 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0033
     * @tc.name   : Linear Linear,Ring Circle,Eclipse Circle,ScaleRing Scale Progress,Capsule Style Progress component is set to -10 and borderWidth set to 3
     * @tc.desc   : Verify media Progress border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0033', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0033 start.`);
      Settings.createWindow('testability/pages/component/progress/MediaProgress/UiComponentMediaProgress06')
      let driver:Driver=Driver.create();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0033 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0024
     * @tc.name   : Linear Linear,Ring Circle,Eclipse Circle,ScaleRing Scale Progress,Capsule Style Progress component(topwidth) is set to -10 and not set borderWidth
     * @tc.desc   : Verify media Progress border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0024', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0024 start.`);
      Settings.createWindow('testability/pages/component/progress/MediaProgress/UiComponentMediaProgress07')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0024 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0039
     * @tc.name   : Linear Linear,Ring Circle,Eclipse Circle,ScaleRing Scale Progress,Capsule Style Progress component(topwidth) is set to -10 and set borderWidth to 3
     * @tc.desc   : Verify media Progress border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0039', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0039 start.`);
      Settings.createWindow('testability/pages/component/progress/MediaProgress/UiComponentMediaProgress08')
      let driver:Driver=Driver.create();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0039 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0023
     * @tc.name   : Linear Linear,Ring Circle,Eclipse Circle,ScaleRing Scale Progress,Capsule Style Progress component(topwidth) is set to 0 and not set borderWidth
     * @tc.desc   : Verify media Progress border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0023', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0023 start.`);
      Settings.createWindow('testability/pages/component/progress/MediaProgress/UiComponentMediaProgress09')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0023 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0021
     * @tc.name   : Linear Linear,Ring Circle,Eclipse Circle,ScaleRing Scale Progress,Capsule Style Progress component(topwidth) is set to percentage and not set borderWidth
     * @tc.desc   : Verify media Progress border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0021', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0021 start.`);
      Settings.createWindow('testability/pages/component/progress/MediaProgress/UiComponentMediaProgress10')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0021 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0077
     * @tc.name   : Linear Linear,Ring Circle,Eclipse Circle,ScaleRing Scale Progress,Capsule Style Progress component(LocalizedEdgeWidths bottom) is set to -10 and set borderWidth to 3
     * @tc.desc   : Verify media Progress border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0077', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0077 start.`);
      Settings.createWindow('testability/pages/component/progress/MediaProgress/UiComponentMediaProgress11')
      let driver:Driver=Driver.create();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0077 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0064
     * @tc.name   : Linear Linear,Ring Circle,Eclipse Circle,ScaleRing Scale Progress,Capsule Style Progress component(LocalizedEdgeWidths bottom) is set to -10 and not set borderWidth
     * @tc.desc   : Verify media Progress border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0064', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0064 start.`);
      Settings.createWindow('testability/pages/component/progress/MediaProgress/UiComponentMediaProgress12')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0064 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0063
     * @tc.name   : Linear Linear,Ring Circle,Eclipse Circle,ScaleRing Scale Progress,Capsule Style Progress component(LocalizedEdgeWidths bottom) is set to 0 and not set borderWidth
     * @tc.desc   : Verify media Progress border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0063', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0063 start.`);
      Settings.createWindow('testability/pages/component/progress/MediaProgress/UiComponentMediaProgress13')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0063 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0060
     * @tc.name   : Linear Linear,Ring Circle,Eclipse Circle,ScaleRing Scale Progress,Capsule Style Progress component(top) is set to -10 and not set borderWidth
     * @tc.desc   : Verify media Progress border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0060', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0060 start.`);
      Settings.createWindow('testability/pages/component/progress/MediaProgress/UiComponentMediaProgress14')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0074
     * @tc.name   : Linear Linear,Ring Circle,Eclipse Circle,ScaleRing Scale Progress,Capsule Style Progress component(top) is set to -10 and set borderWidth to 3
     * @tc.desc   : Verify media Progress border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0074', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0074 start.`);
      Settings.createWindow('testability/pages/component/progress/MediaProgress/UiComponentMediaProgress15')
      let driver:Driver=Driver.create();
      await Utils.sleep(1000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0074 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0087
     * @tc.name   : Linear Linear,Ring Circle,Eclipse Circle,ScaleRing Circle,Capsule Capsule Style Progress components are set to Dotted, Dashed, and Solid respectively
     * @tc.desc   : Verify media Progress border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0087', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0087 start.`);
      Settings.createWindow('testability/pages/component/progress/MediaProgress/UiComponentMediaProgress16')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentMediaProgress16'),1000);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button01.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button01.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0087 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0022
     * @tc.name   : Linear Linear,Ring Circle,Eclipse Circle,ScaleRing Scale Progress,Capsule Style Progress component(top) is set to 10 and not set borderWidth
     * @tc.desc   : Verify media Progress border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0022', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0022 start.`);
      Settings.createWindow('testability/pages/component/progress/MediaProgress/UiComponentMediaProgress17')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0022 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0013
     * @tc.name   : Linear Linear,Ring Circle,Eclipse Circle,ScaleRing Scale Progress,Capsule Style Progress component(leftwidth) is set to 0,not set borderWidth
     * @tc.desc   : Verify media Progress border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0013', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0013 start.`);
      Settings.createWindow('testability/pages/component/progress/MediaProgress/UiComponentMediaProgress18')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0013 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0088
     * @tc.name   : Linear Linear,Ring Circle,Eclipse Circle,ScaleRing Circle,Capsule Capsule Style Progress components(top) are set to Dotted, Dashed, and Solid respectively
     * @tc.desc   : Verify media Progress border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0088', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0088 start.`);
      Settings.createWindow('testability/pages/component/progress/MediaProgress/UiComponentMediaProgress19')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentMediaProgress19'),1000);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button01.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button01.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0088 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0086
     * @tc.name   : Linear Linear,Ring Circle,Eclipse Circle,ScaleRing Circle,Capsule Capsule Style Progress components(left) are set to Dotted, Dashed, and Solid respectively
     * @tc.desc   : Verify media Progress border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0086', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0086 start.`);
      Settings.createWindow('testability/pages/component/progress/MediaProgress/UiComponentMediaProgress20')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentMediaProgress20'),1000);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button01.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button01.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0086 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0089
     * @tc.name   : Linear Linear,Ring Circle,Eclipse Circle,ScaleRing Circle,Capsule Capsule Style Progress components(bottom) are set to Dotted, Dashed, and Solid respectively
     * @tc.desc   : Verify media Progress border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0089', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0089 start.`);
      Settings.createWindow('testability/pages/component/progress/MediaProgress/UiComponentMediaProgress21')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentMediaProgress21'),1000);
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button01.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button01.click();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0089 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0026
     * @tc.name   : Linear Linear,Ring Circle,Eclipse Circle,ScaleRing Scale Progress,Capsule Style Progress component(bottomwidth) is set to percentage and not set borderWidth
     * @tc.desc   : Verify media Progress border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0026', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0026 start.`);
      Settings.createWindow('testability/pages/component/progress/MediaProgress/UiComponentMediaProgress22')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0026 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0011
     * @tc.name   : Linear Linear,Ring Circle,Eclipse Circle,ScaleRing Scale Progress,Capsule Style Progress component(leftwidth) is set to percentage and not set borderWidth
     * @tc.desc   : Verify media Progress border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0011', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0011 start.`);
      Settings.createWindow('testability/pages/component/progress/MediaProgress/UiComponentMediaProgress23')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0011 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0016
     * @tc.name   : Linear Linear,Ring Circle,Eclipse Circle,ScaleRing Scale Progress,Capsule Style Progress component(rightwidth) is set to percentage and not set borderWidth
     * @tc.desc   : Verify media Progress border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0016', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0016 start.`);
      Settings.createWindow('testability/pages/component/progress/MediaProgress/UiComponentMediaProgress24')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0016 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0068
     * @tc.name   : Linear Linear,Ring Circle,Eclipse Circle,ScaleRing Scale Progress,Capsule Style Progress component(startwidth) is set to -10 and set borderWidth to 3
     * @tc.desc   : Verify media Progress border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0068', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0068 start.`);
      Settings.createWindow('testability/pages/component/progress/MediaProgress/UiComponentMediaProgress25')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0068 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0070
     * @tc.name   : Linear Linear,Ring Circle,Eclipse Circle,ScaleRing Scale Progress,Capsule Style Progress component(endwidth) is set to 10 and set borderWidth to 3
     * @tc.desc   : Verify media Progress border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0070', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0070 start.`);
      Settings.createWindow('testability/pages/component/progress/MediaProgress/UiComponentMediaProgress26')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0062
     * @tc.name   : Linear Linear,Ring Circle,Eclipse Circle,ScaleRing Scale Progress,Capsule Style Progress component(LocalizedEdgeWidths bottom) is set to 10 and not set borderWidth
     * @tc.desc   : Verify media Progress border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0062', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0062 start.`);
      Settings.createWindow('testability/pages/component/progress/MediaProgress/UiComponentMediaProgress27')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0062 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0058
     * @tc.name   : Linear Linear,Ring Circle,Eclipse Circle,ScaleRing Scale Progress,Capsule Style Progress component(top) is set to -10 and not set borderWidth
     * @tc.desc   : Verify media Progress border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0058', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0058 start.`);
      Settings.createWindow('testability/pages/component/progress/MediaProgress/UiComponentMediaProgress28')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0058 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0059
     * @tc.name   : Linear Linear,Ring Circle,Eclipse Circle,ScaleRing Scale Progress,Capsule Style Progress component(top) is set to 0 and not set borderWidth
     * @tc.desc   : Verify media Progress border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0059', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0059 start.`);
      Settings.createWindow('testability/pages/component/progress/MediaProgress/UiComponentMediaProgress29')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0059 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0071
     * @tc.name   : Linear Linear,Ring Circle,Eclipse Circle,ScaleRing Scale Progress,Capsule Style Progress component(end) is set to -10 and set borderWidth to 3
     * @tc.desc   : Verify media Progress border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0071', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0071 start.`);
      Settings.createWindow('testability/pages/component/progress/MediaProgress/UiComponentMediaProgress30')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0071 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0028
     * @tc.name   : Linear Linear,Ring Circle,Eclipse Circle,ScaleRing Scale Progress,Capsule Style Progress component(bottom) is set to 0 and not set borderWidth
     * @tc.desc   : Verify media Progress border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0028', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0028 start.`);
      Settings.createWindow('testability/pages/component/progress/MediaProgress/UiComponentMediaProgress31')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0028 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0029
     * @tc.name   : Linear Linear,Ring Circle,Eclipse Circle,ScaleRing Scale Progress,Capsule Style Progress component(bottom) is set to -10 and not set borderWidth
     * @tc.desc   : Verify media Progress border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0029', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0029 start.`);
      Settings.createWindow('testability/pages/component/progress/MediaProgress/UiComponentMediaProgress32')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0029 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0104
     * @tc.name   : Linear Linear,Ring Circle,Eclipse Circle,ScaleRing Scale Progress,Capsule Style Progress component not set LocalizedEdgeColors and borderColor
     * @tc.desc   : Verify media Progress border interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0104', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0104 start.`);
      Settings.createWindow('testability/pages/component/progress/MediaProgress/UiComponentMediaProgress33')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_BORDER_0104 finish.`);
      done()
    })

  })
}