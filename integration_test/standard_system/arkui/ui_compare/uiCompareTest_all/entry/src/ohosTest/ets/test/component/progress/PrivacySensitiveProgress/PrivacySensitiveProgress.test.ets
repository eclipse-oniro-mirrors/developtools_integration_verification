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

export default function privacySensitiveProgress() {

  describe('privacySensitiveProgress', () => {
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
     * @tc.number : SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0010
     * @tc.name   : ArkUI privacysensitive Progress
     * @tc.desc   : Verify ArkUI privacysensitive Progress interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0010', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0010 start.`);
      // 步骤1: 页面初始化
      Settings.createWindow('testability/pages/component/progress/PrivacySensitiveProgress/PrivacySensitiveProgress0010')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2: 验证不同type的Progress组件都设置了privacySensitive
      let progress_linear = await driver.waitForComponent(ON.id('progress_linear_0010'), 500)
      let progress_ring = await driver.waitForComponent(ON.id('progress_ring_0010'), 500)
      let progress_eclipse = await driver.waitForComponent(ON.id('progress_eclipse_0010'), 500)
      let progress_scalering = await driver.waitForComponent(ON.id('progress_scalering_0010'), 500)
      let progress_capsule = await driver.waitForComponent(ON.id('progress_capsule_0010'), 500)

      // 预期结果: 截图验证样式保持原有的样式
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0020
     * @tc.name   : ArkUI privacysensitive Progress
     * @tc.desc   : Verify ArkUI privacysensitive Progress interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0020', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0020 start.`);
      // 步骤1: 页面初始化
      Settings.createWindow('testability/pages/component/progress/PrivacySensitiveProgress/PrivacySensitiveProgress0020')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2: 验证不同type的Progress组件都设置了privacySensitive为false
      let progress_linear = await driver.waitForComponent(ON.id('progress_linear_0020'), 500)
      let progress_ring = await driver.waitForComponent(ON.id('progress_ring_0020'), 500)
      let progress_eclipse = await driver.waitForComponent(ON.id('progress_eclipse_0020'), 500)
      let progress_scalering = await driver.waitForComponent(ON.id('progress_scalering_0020'), 500)
      let progress_capsule = await driver.waitForComponent(ON.id('progress_capsule_0020'), 500)

      // 预期结果: 截图验证样式保持原有的样式
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0030
     * @tc.name   : ArkUI privacysensitive Progress
     * @tc.desc   : Verify ArkUI privacysensitive Progress interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0030', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0030 start.`);
      // 步骤1: 页面初始化
      Settings.createWindow('testability/pages/component/progress/PrivacySensitiveProgress/PrivacySensitiveProgress0030')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2: 验证不同type的Progress组件都设置了privacySensitive为true
      let progress_linear = await driver.waitForComponent(ON.id('progress_linear_0030'), 500)
      let progress_ring = await driver.waitForComponent(ON.id('progress_ring_0030'), 500)
      let progress_eclipse = await driver.waitForComponent(ON.id('progress_eclipse_0030'), 500)
      let progress_scalering = await driver.waitForComponent(ON.id('progress_scalering_0030'), 500)
      let progress_capsule = await driver.waitForComponent(ON.id('progress_capsule_0030'), 500)

      // 预期结果: 截图验证背景色和进度都是灰色，刻度归零
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0040
     * @tc.name   : ArkUI privacysensitive Progress
     * @tc.desc   : Verify ArkUI privacysensitive Progress interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0040', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0040 start.`);
      // 步骤1: 页面初始化
      Settings.createWindow('testability/pages/component/progress/PrivacySensitiveProgress/PrivacySensitiveProgress0040')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2: 验证不同type和color的Progress组件都设置了privacySensitive为false
      let progress_linear_red = await driver.waitForComponent(ON.id('progress_linear_red_0040'), 500)
      let progress_ring_rgb = await driver.waitForComponent(ON.id('progress_ring_rgb_0040'), 500)
      let progress_eclipse_rgba = await driver.waitForComponent(ON.id('progress_eclipse_rgba_0040'), 500)
      let progress_scalering_hex = await driver.waitForComponent(ON.id('progress_scalering_hex_0040'), 500)
      let progress_capsule_gray = await driver.waitForComponent(ON.id('progress_capsule_gray_0040'), 500)


      // 预期结果: 截图验证样式为对应样式，背景色为对应颜色，刻度默认0
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0050
     * @tc.name   : ArkUI privacysensitive Progress
     * @tc.desc   : Verify ArkUI privacysensitive Progress interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0050', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0050 start.`);
      // 步骤1: 页面初始化
      Settings.createWindow('testability/pages/component/progress/PrivacySensitiveProgress/PrivacySensitiveProgress0050')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2: 验证不同type的Progress组件都设置了privacySensitive为false，使用color number
      let progress_linear_1010010 = await driver.waitForComponent(ON.id('progress_linear_1010010_0050'), 500)
      let progress_linear_344556 = await driver.waitForComponent(ON.id('progress_linear_344556_0050'), 500)
      let progress_ring_1010010 = await driver.waitForComponent(ON.id('progress_ring_1010010_0050'), 500)
      let progress_ring_344556 = await driver.waitForComponent(ON.id('progress_ring_344556_0050'), 500)
      let progress_eclipse_1010010 = await driver.waitForComponent(ON.id('progress_eclipse_1010010_0050'), 500)
      let progress_eclipse_344556 = await driver.waitForComponent(ON.id('progress_eclipse_344556_0050'), 500)
      let progress_scalering_1010010 = await driver.waitForComponent(ON.id('progress_scalering_1010010_0050'), 500)
      let progress_scalering_344556 = await driver.waitForComponent(ON.id('progress_scalering_344556_0050'), 500)
      let progress_capsule_1010010 = await driver.waitForComponent(ON.id('progress_capsule_1010010_0050'), 500)
      let progress_capsule_344556 = await driver.waitForComponent(ON.id('progress_capsule_344556_0050'), 500)

      // 预期结果: 截图验证样式为对应样式，背景色为对应颜色，刻度默认0，进度为对应颜色
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0060
     * @tc.name   : ArkUI privacysensitive Progress
     * @tc.desc   : Verify ArkUI privacysensitive Progress interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0060', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0060 start.`);
      // 步骤1: 页面初始化
      Settings.createWindow('testability/pages/component/progress/PrivacySensitiveProgress/PrivacySensitiveProgress0060')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2: 验证不同type的Progress组件都设置了privacySensitive为true，使用color number
      let progress_linear_1010010 = await driver.waitForComponent(ON.id('progress_linear_1010010_0060'), 500)
      let progress_linear_344556 = await driver.waitForComponent(ON.id('progress_linear_344556_0060'), 500)
      let progress_ring_1010010 = await driver.waitForComponent(ON.id('progress_ring_1010010_0060'), 500)
      let progress_ring_344556 = await driver.waitForComponent(ON.id('progress_ring_344556_0060'), 500)
      let progress_eclipse_1010010 = await driver.waitForComponent(ON.id('progress_eclipse_1010010_0060'), 500)
      let progress_eclipse_344556 = await driver.waitForComponent(ON.id('progress_eclipse_344556_0060'), 500)
      let progress_scalering_1010010 = await driver.waitForComponent(ON.id('progress_scalering_1010010_0060'), 500)
      let progress_scalering_344556 = await driver.waitForComponent(ON.id('progress_scalering_344556_0060'), 500)
      let progress_capsule_1010010 = await driver.waitForComponent(ON.id('progress_capsule_1010010_0060'), 500)
      let progress_capsule_344556 = await driver.waitForComponent(ON.id('progress_capsule_344556_0060'), 500)

      // 预期结果: 截图验证背景色和进度都是灰色，刻度归零
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0070
     * @tc.name   : ArkUI privacysensitive Progress
     * @tc.desc   : Verify ArkUI privacysensitive Progress interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0070', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0070 start.`);
      // 步骤1: 页面初始化
      Settings.createWindow('testability/pages/component/progress/PrivacySensitiveProgress/PrivacySensitiveProgress0070')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2: 验证不同type的Progress组件都设置了privacySensitive为false，使用color string
      let progress_linear_hex = await driver.waitForComponent(ON.id('progress_linear_hex_0070'), 500)
      let progress_linear_rgba = await driver.waitForComponent(ON.id('progress_linear_rgba_0070'), 500)
      let progress_ring_black = await driver.waitForComponent(ON.id('progress_ring_black_0070'), 500)
      let progress_ring_rgba = await driver.waitForComponent(ON.id('progress_ring_rgba_0070'), 500)
      let progress_eclipse_hex = await driver.waitForComponent(ON.id('progress_eclipse_hex_0070'), 500)
      let progress_eclipse_rgba = await driver.waitForComponent(ON.id('progress_eclipse_rgba_0070'), 500)
      let progress_scalering_black = await driver.waitForComponent(ON.id('progress_scalering_black_0070'), 500)
      let progress_scalering_rgb = await driver.waitForComponent(ON.id('progress_scalering_rgb_0070'), 500)
      let progress_capsule_hex = await driver.waitForComponent(ON.id('progress_capsule_hex_0070'), 500)
      let progress_capsule_rgba = await driver.waitForComponent(ON.id('progress_capsule_rgba_0070'), 500)

      // 预期结果: 截图验证进度为对应颜色
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0080
     * @tc.name   : ArkUI privacysensitive Progress
     * @tc.desc   : Verify ArkUI privacysensitive Progress interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0080', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0080 start.`);
      // 步骤1: 页面初始化
      Settings.createWindow('testability/pages/component/progress/PrivacySensitiveProgress/PrivacySensitiveProgress0080')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2: 验证不同type的Progress组件都设置了privacySensitive为true，使用color string
      let progress_linear_hex = await driver.waitForComponent(ON.id('progress_linear_hex_0080'), 500)
      let progress_linear_rgba = await driver.waitForComponent(ON.id('progress_linear_rgba_0080'), 500)
      let progress_ring_black = await driver.waitForComponent(ON.id('progress_ring_black_0080'), 500)
      let progress_ring_rgba = await driver.waitForComponent(ON.id('progress_ring_rgba_0080'), 500)
      let progress_eclipse_hex = await driver.waitForComponent(ON.id('progress_eclipse_hex_0080'), 500)
      let progress_eclipse_rgba = await driver.waitForComponent(ON.id('progress_eclipse_rgba_0080'), 500)
      let progress_scalering_black = await driver.waitForComponent(ON.id('progress_scalering_black_0080'), 500)
      let progress_scalering_rgb = await driver.waitForComponent(ON.id('progress_scalering_rgb_0080'), 500)
      let progress_capsule_hex = await driver.waitForComponent(ON.id('progress_capsule_hex_0080'), 500)
      let progress_capsule_rgba = await driver.waitForComponent(ON.id('progress_capsule_rgba_0080'), 500)

      // 预期结果: 截图验证背景色和进度都是灰色，刻度归零
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0090
     * @tc.name   : ArkUI privacysensitive Progress
     * @tc.desc   : Verify ArkUI privacysensitive Progress interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0090', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0090 start.`);
      // 步骤1: 页面初始化
      Settings.createWindow('testability/pages/component/progress/PrivacySensitiveProgress/PrivacySensitiveProgress0090')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2: 验证不同type的Progress组件都设置了privacySensitive为false，使用资源引用
      let progress_linear_resource = await driver.waitForComponent(ON.id('progress_linear_resource_0090'), 500)
      let progress_linear_invalid = await driver.waitForComponent(ON.id('progress_linear_invalid_0090'), 500)
      let progress_ring_resource2 = await driver.waitForComponent(ON.id('progress_ring_resource2_0090'), 500)
      let progress_ring_invalid = await driver.waitForComponent(ON.id('progress_ring_invalid_0090'), 500)
      let progress_eclipse_resource = await driver.waitForComponent(ON.id('progress_eclipse_resource_0090'), 500)
      let progress_eclipse_invalid = await driver.waitForComponent(ON.id('progress_eclipse_invalid_0090'), 500)
      let progress_scalering_resource2 = await driver.waitForComponent(ON.id('progress_scalering_resource2_0090'), 500)
      let progress_scalering_invalid = await driver.waitForComponent(ON.id('progress_scalering_invalid_0090'), 500)
      let progress_capsule_resource = await driver.waitForComponent(ON.id('progress_capsule_resource_0090'), 500)
      let progress_capsule_invalid = await driver.waitForComponent(ON.id('progress_capsule_invalid_0090'), 500)

      // 预期结果: 截图验证进度条正常颜色引用正常显示，异常颜色显示默认灰色
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0100
     * @tc.name   : ArkUI privacysensitive Progress
     * @tc.desc   : Verify ArkUI privacysensitive Progress interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0100', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0100 start.`);
      // 步骤1: 页面初始化
      Settings.createWindow('testability/pages/component/progress/PrivacySensitiveProgress/PrivacySensitiveProgress0100')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2: 验证不同type的Progress组件都设置了privacySensitive为true，使用资源引用
      let progress_linear_resource = await driver.waitForComponent(ON.id('progress_linear_resource_0100'), 500)
      let progress_linear_invalid = await driver.waitForComponent(ON.id('progress_linear_invalid_0100'), 500)
      let progress_ring_resource2 = await driver.waitForComponent(ON.id('progress_ring_resource2_0100'), 500)
      let progress_ring_invalid = await driver.waitForComponent(ON.id('progress_ring_invalid_0100'), 500)
      let progress_eclipse_resource = await driver.waitForComponent(ON.id('progress_eclipse_resource_0100'), 500)
      let progress_eclipse_invalid = await driver.waitForComponent(ON.id('progress_eclipse_invalid_0100'), 500)
      let progress_scalering_resource2 = await driver.waitForComponent(ON.id('progress_scalering_resource2_0100'), 500)
      let progress_scalering_invalid = await driver.waitForComponent(ON.id('progress_scalering_invalid_0100'), 500)
      let progress_capsule_resource = await driver.waitForComponent(ON.id('progress_capsule_resource_0100'), 500)
      let progress_capsule_invalid = await driver.waitForComponent(ON.id('progress_capsule_invalid_0100'), 500)

      // 预期结果: 截图验证背景色和进度都是灰色，刻度归零
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0100 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0110
     * @tc.name   : ArkUI privacysensitive Progress
     * @tc.desc   : Verify ArkUI privacysensitive Progress interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0110', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0110 start.`);
      // 步骤1: 页面初始化
      Settings.createWindow('testability/pages/component/progress/PrivacySensitiveProgress/PrivacySensitiveProgress0110')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2: 验证不同type的Progress组件都设置了privacySensitive为false，使用LinearGradient
      let progress_linear_gradient1 = await driver.waitForComponent(ON.id('progress_linear_gradient1_0110'), 500)
      let progress_linear_gradient2 = await driver.waitForComponent(ON.id('progress_linear_gradient2_0110'), 500)
      let progress_ring_gradient1 = await driver.waitForComponent(ON.id('progress_ring_gradient1_0110'), 500)
      let progress_ring_gradient2 = await driver.waitForComponent(ON.id('progress_ring_gradient2_0110'), 500)
      let progress_eclipse_gradient1 = await driver.waitForComponent(ON.id('progress_eclipse_gradient1_0110'), 500)
      let progress_eclipse_gradient2 = await driver.waitForComponent(ON.id('progress_eclipse_gradient2_0110'), 500)
      let progress_scalering_gradient1 = await driver.waitForComponent(ON.id('progress_scalering_gradient1_0110'), 500)
      let progress_scalering_gradient2 = await driver.waitForComponent(ON.id('progress_scalering_gradient2_0110'), 500)
      let progress_capsule_gradient1 = await driver.waitForComponent(ON.id('progress_capsule_gradient1_0110'), 500)
      let progress_capsule_gradient2 = await driver.waitForComponent(ON.id('progress_capsule_gradient2_0110'), 500)

      // 预期结果: 截图验证进度条呈现设置的渐变色
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0120
     * @tc.name   : ArkUI privacysensitive Progress
     * @tc.desc   : Verify ArkUI privacysensitive Progress interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0120', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0120 start.`);
      // 步骤1: 页面初始化
      Settings.createWindow('testability/pages/component/progress/PrivacySensitiveProgress/PrivacySensitiveProgress0120')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2: 验证不同type的Progress组件都设置了privacySensitive为true，使用LinearGradient
      let progress_linear_gradient1 = await driver.waitForComponent(ON.id('progress_linear_gradient1_0120'), 500)
      let progress_linear_gradient2 = await driver.waitForComponent(ON.id('progress_linear_gradient2_0120'), 500)
      let progress_ring_gradient1 = await driver.waitForComponent(ON.id('progress_ring_gradient1_0120'), 500)
      let progress_ring_gradient2 = await driver.waitForComponent(ON.id('progress_ring_gradient2_0120'), 500)
      let progress_eclipse_gradient1 = await driver.waitForComponent(ON.id('progress_eclipse_gradient1_0120'), 500)
      let progress_eclipse_gradient2 = await driver.waitForComponent(ON.id('progress_eclipse_gradient2_0120'), 500)
      let progress_scalering_gradient1 = await driver.waitForComponent(ON.id('progress_scalering_gradient1_0120'), 500)
      let progress_scalering_gradient2 = await driver.waitForComponent(ON.id('progress_scalering_gradient2_0120'), 500)
      let progress_capsule_gradient1 = await driver.waitForComponent(ON.id('progress_capsule_gradient1_0120'), 500)
      let progress_capsule_gradient2 = await driver.waitForComponent(ON.id('progress_capsule_gradient2_0120'), 500)

      // 预期结果: 截图验证背景色和进度都是灰色，刻度归零
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0130
     * @tc.name   : ArkUI privacysensitive Progress
     * @tc.desc   : Verify ArkUI privacysensitive Progress interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0130', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0130 start.`);
      // 步骤1: 页面初始化
      Settings.createWindow('testability/pages/component/progress/PrivacySensitiveProgress/PrivacySensitiveProgress0130')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2: 验证不同type的Progress组件都设置了privacySensitive为false，使用backgroundColor枚举
      let progress_linear_red_bg = await driver.waitForComponent(ON.id('progress_linear_red_bg_0130'), 500)
      let progress_ring_green_bg = await driver.waitForComponent(ON.id('progress_ring_green_bg_0130'), 500)
      let progress_eclipse_pink_bg = await driver.waitForComponent(ON.id('progress_eclipse_pink_bg_0130'), 500)
      let progress_scalering_gray_bg = await driver.waitForComponent(ON.id('progress_scalering_gray_bg_0130'), 500)
      let progress_capsule_blue_bg = await driver.waitForComponent(ON.id('progress_capsule_blue_bg_0130'), 500)

      // 预期结果: 截图验证背景色显示为对应颜色
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0130 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0140
     * @tc.name   : ArkUI privacysensitive Progress
     * @tc.desc   : Verify ArkUI privacysensitive Progress interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0140', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0140 start.`);
      // 步骤1: 页面初始化
      Settings.createWindow('testability/pages/component/progress/PrivacySensitiveProgress/PrivacySensitiveProgress0140')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2: 验证不同type的Progress组件都设置了privacySensitive为true，使用backgroundColor枚举
      let progress_linear_red_bg = await driver.waitForComponent(ON.id('progress_linear_red_bg_0140'), 500)
      let progress_ring_green_bg = await driver.waitForComponent(ON.id('progress_ring_green_bg_0140'), 500)
      let progress_eclipse_pink_bg = await driver.waitForComponent(ON.id('progress_eclipse_pink_bg_0140'), 500)
      let progress_scalering_gray_bg = await driver.waitForComponent(ON.id('progress_scalering_gray_bg_0140'), 500)
      let progress_capsule_blue_bg = await driver.waitForComponent(ON.id('progress_capsule_blue_bg_0140'), 500)

      // 预期结果: 截图验证背景色和进度都是灰色，刻度归零
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0140 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0150
     * @tc.name   : ArkUI privacysensitive Progress
     * @tc.desc   : Verify ArkUI privacysensitive Progress interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0150', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0150 start.`);
      // 步骤1: 页面初始化
      Settings.createWindow('testability/pages/component/progress/PrivacySensitiveProgress/PrivacySensitiveProgress0150')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2: 验证不同type的Progress组件都设置了privacySensitive为false，使用backgroundColor number
      let progress_linear_1010010_bg = await driver.waitForComponent(ON.id('progress_linear_1010010_bg_0150'), 500)
      let progress_linear_344556_bg = await driver.waitForComponent(ON.id('progress_linear_344556_bg_0150'), 500)
      let progress_ring_1010010_bg = await driver.waitForComponent(ON.id('progress_ring_1010010_bg_0150'), 500)
      let progress_ring_344556_bg = await driver.waitForComponent(ON.id('progress_ring_344556_bg_0150'), 500)
      let progress_eclipse_1010010_bg = await driver.waitForComponent(ON.id('progress_eclipse_1010010_bg_0150'), 500)
      let progress_eclipse_344556_bg = await driver.waitForComponent(ON.id('progress_eclipse_344556_bg_0150'), 500)
      let progress_scalering_1010010_bg = await driver.waitForComponent(ON.id('progress_scalering_1010010_bg_0150'), 500)
      let progress_scalering_344556_bg = await driver.waitForComponent(ON.id('progress_scalering_344556_bg_0150'), 500)
      let progress_capsule_1010010_bg = await driver.waitForComponent(ON.id('progress_capsule_1010010_bg_0150'), 500)
      let progress_capsule_344556_bg = await driver.waitForComponent(ON.id('progress_capsule_344556_bg_0150'), 500)

      // 预期结果: 截图验证背景色显示为对应颜色
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0150 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0160
     * @tc.name   : ArkUI privacysensitive Progress
     * @tc.desc   : Verify ArkUI privacysensitive Progress interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0160', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0160 start.`);
      // 步骤1: 页面初始化
      Settings.createWindow('testability/pages/component/progress/PrivacySensitiveProgress/PrivacySensitiveProgress0160')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2: 验证不同type的Progress组件都设置了privacySensitive为false，使用backgroundColor string
      let progress_linear_hex_bg = await driver.waitForComponent(ON.id('progress_linear_hex_bg_0160'), 500)
      let progress_linear_rgba_bg = await driver.waitForComponent(ON.id('progress_linear_rgba_bg_0160'), 500)
      let progress_ring_black_bg = await driver.waitForComponent(ON.id('progress_ring_black_bg_0160'), 500)
      let progress_ring_rgb_bg = await driver.waitForComponent(ON.id('progress_ring_rgb_bg_0160'), 500)
      let progress_eclipse_hex_bg = await driver.waitForComponent(ON.id('progress_eclipse_hex_bg_0160'), 500)
      let progress_eclipse_rgba_bg = await driver.waitForComponent(ON.id('progress_eclipse_rgba_bg_0160'), 500)
      let progress_scalering_black_bg = await driver.waitForComponent(ON.id('progress_scalering_black_bg_0160'), 500)
      let progress_scalering_rgb_bg = await driver.waitForComponent(ON.id('progress_scalering_rgb_bg_0160'), 500)
      let progress_capsule_hex_bg = await driver.waitForComponent(ON.id('progress_capsule_hex_bg_0160'), 500)
      let progress_capsule_rgba_bg = await driver.waitForComponent(ON.id('progress_capsule_rgba_bg_0160'), 500)

      // 预期结果: 截图验证背景色显示为对应颜色
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0160 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0170
     * @tc.name   : ArkUI privacysensitive Progress
     * @tc.desc   : Verify ArkUI privacysensitive Progress interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0170', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0170 start.`);
      // 步骤1: 页面初始化
      Settings.createWindow('testability/pages/component/progress/PrivacySensitiveProgress/PrivacySensitiveProgress0170')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2: 验证不同type的Progress组件都设置了privacySensitive为true，使用backgroundColor string
      let progress_linear_hex_bg = await driver.waitForComponent(ON.id('progress_linear_hex_bg_0170'), 500)
      let progress_linear_rgba_bg = await driver.waitForComponent(ON.id('progress_linear_rgba_bg_0170'), 500)
      let progress_ring_black_bg = await driver.waitForComponent(ON.id('progress_ring_black_bg_0170'), 500)
      let progress_ring_rgb_bg = await driver.waitForComponent(ON.id('progress_ring_rgb_bg_0170'), 500)
      let progress_eclipse_hex_bg = await driver.waitForComponent(ON.id('progress_eclipse_hex_bg_0170'), 500)
      let progress_eclipse_rgba_bg = await driver.waitForComponent(ON.id('progress_eclipse_rgba_bg_0170'), 500)
      let progress_scalering_black_bg = await driver.waitForComponent(ON.id('progress_scalering_black_bg_0170'), 500)
      let progress_scalering_rgb_bg = await driver.waitForComponent(ON.id('progress_scalering_rgb_bg_0170'), 500)
      let progress_capsule_hex_bg = await driver.waitForComponent(ON.id('progress_capsule_hex_bg_0170'), 500)
      let progress_capsule_rgba_bg = await driver.waitForComponent(ON.id('progress_capsule_rgba_bg_0170'), 500)

      // 预期结果: 截图验证背景色和进度都是灰色，刻度归零
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0180
     * @tc.name   : ArkUI privacysensitive Progress
     * @tc.desc   : Verify ArkUI privacysensitive Progress interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0180', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0180 start.`);
      // 步骤1: 页面初始化
      Settings.createWindow('testability/pages/component/progress/PrivacySensitiveProgress/PrivacySensitiveProgress0180')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2: 验证不同type的Progress组件都设置了privacySensitive为false，使用backgroundColor资源引用
      let progress_linear_resource_bg = await driver.waitForComponent(ON.id('progress_linear_resource_bg_0180'), 500)
      let progress_linear_invalid_bg = await driver.waitForComponent(ON.id('progress_linear_invalid_bg_0180'), 500)
      let progress_ring_resource2_bg = await driver.waitForComponent(ON.id('progress_ring_resource2_bg_0180'), 500)
      let progress_ring_invalid_bg = await driver.waitForComponent(ON.id('progress_ring_invalid_bg_0180'), 500)
      let progress_eclipse_resource_bg = await driver.waitForComponent(ON.id('progress_eclipse_resource_bg_0180'), 500)
      let progress_eclipse_invalid_bg = await driver.waitForComponent(ON.id('progress_eclipse_invalid_bg_0180'), 500)
      let progress_scalering_resource2_bg = await driver.waitForComponent(ON.id('progress_scalering_resource2_bg_0180'), 500)
      let progress_scalering_invalid_bg = await driver.waitForComponent(ON.id('progress_scalering_invalid_bg_0180'), 500)
      let progress_capsule_resource_bg = await driver.waitForComponent(ON.id('progress_capsule_resource_bg_0180'), 500)
      let progress_capsule_invalid_bg = await driver.waitForComponent(ON.id('progress_capsule_invalid_bg_0180'), 500)

      // 预期结果: 截图验证正常颜色引用正常显示背景色，异常颜色显示默认背景灰色
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0180 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0190
     * @tc.name   : ArkUI privacysensitive Progress
     * @tc.desc   : Verify ArkUI privacysensitive Progress interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0190', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0190 start.`);
      // 步骤1: 页面初始化
      Settings.createWindow('testability/pages/component/progress/PrivacySensitiveProgress/PrivacySensitiveProgress0190')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2: 验证不同type的Progress组件都设置了privacySensitive为true，使用backgroundColor资源引用
      let progress_linear_resource_bg = await driver.waitForComponent(ON.id('progress_linear_resource_bg_0190'), 500)
      let progress_linear_invalid_bg = await driver.waitForComponent(ON.id('progress_linear_invalid_bg_0190'), 500)
      let progress_ring_resource2_bg = await driver.waitForComponent(ON.id('progress_ring_resource2_bg_0190'), 500)
      let progress_ring_invalid_bg = await driver.waitForComponent(ON.id('progress_ring_invalid_bg_0190'), 500)
      let progress_eclipse_resource_bg = await driver.waitForComponent(ON.id('progress_eclipse_resource_bg_0190'), 500)
      let progress_eclipse_invalid_bg = await driver.waitForComponent(ON.id('progress_eclipse_invalid_bg_0190'), 500)
      let progress_scalering_resource2_bg = await driver.waitForComponent(ON.id('progress_scalering_resource2_bg_0190'), 500)
      let progress_scalering_invalid_bg = await driver.waitForComponent(ON.id('progress_scalering_invalid_bg_0190'), 500)
      let progress_capsule_resource_bg = await driver.waitForComponent(ON.id('progress_capsule_resource_bg_0190'), 500)
      let progress_capsule_invalid_bg = await driver.waitForComponent(ON.id('progress_capsule_invalid_bg_0190'), 500)

      // 预期结果: 截图验证背景色和进度都是灰色，刻度归零
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0190 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0200
     * @tc.name   : ArkUI privacysensitive Progress
     * @tc.desc   : Verify ArkUI privacysensitive Progress interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0200', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0200 start.`);
      // 步骤1: 页面初始化
      Settings.createWindow('testability/pages/component/progress/PrivacySensitiveProgress/PrivacySensitiveProgress0200')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2: 验证不同value和total组合的Progress组件
      let progress_total_neg1_value_neg1 = await driver.waitForComponent(ON.id('progress_total_neg1_value_neg1_0200'), 500)
      let progress_total_neg1_value_0 = await driver.waitForComponent(ON.id('progress_total_neg1_value_0_0200'), 500)
      let progress_total_neg1_value_10 = await driver.waitForComponent(ON.id('progress_total_neg1_value_10_0200'), 500)
      let progress_total_neg1_value_50 = await driver.waitForComponent(ON.id('progress_total_neg1_value_50_0200'), 500)
      let progress_total_0_value_neg1 = await driver.waitForComponent(ON.id('progress_total_0_value_neg1_0200'), 500)
      let progress_total_0_value_50 = await driver.waitForComponent(ON.id('progress_total_0_value_50_0200'), 500)
      let progress_total_0_value_100 = await driver.waitForComponent(ON.id('progress_total_0_value_100_0200'), 500)
      let progress_total_0_value_120 = await driver.waitForComponent(ON.id('progress_total_0_value_120_0200'), 500)
      let progress_eclipse_value_neg1 = await driver.waitForComponent(ON.id('progress_eclipse_value_neg1_0200'), 500)
      let progress_eclipse_value_0 = await driver.waitForComponent(ON.id('progress_eclipse_value_0_0200'), 500)
      let progress_eclipse_value_120 = await driver.waitForComponent(ON.id('progress_eclipse_value_120_0200'), 500)
      let progress_scalering_value_neg1 = await driver.waitForComponent(ON.id('progress_scalering_value_neg1_0200'), 500)
      let progress_scalering_value_50 = await driver.waitForComponent(ON.id('progress_scalering_value_50_0200'), 500)
      let progress_scalering_value_120 = await driver.waitForComponent(ON.id('progress_scalering_value_120_0200'), 500)
      let progress_capsule_value_neg1 = await driver.waitForComponent(ON.id('progress_capsule_value_neg1_0200'), 500)
      let progress_capsule_value_50 = await driver.waitForComponent(ON.id('progress_capsule_value_50_0200'), 500)
      let progress_capsule_value_120 = await driver.waitForComponent(ON.id('progress_capsule_value_120_0200'), 500)

      // 预期结果: 截图验证total默认为100，进度负数显示0，超过50的显示50，不超过50显示比例刻度
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0200 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0210
     * @tc.name   : ArkUI privacysensitive Progress
     * @tc.desc   : Verify ArkUI privacysensitive Progress interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0210', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0210 start.`);
      // 步骤1: 页面初始化
      Settings.createWindow('testability/pages/component/progress/PrivacySensitiveProgress/PrivacySensitiveProgress0210')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2: 验证不同value和total组合的Progress组件，privacySensitive为false
      let progress_total_50_value_neg1 = await driver.waitForComponent(ON.id('progress_total_50_value_neg1_0210'), 500)
      let progress_total_50_value_0 = await driver.waitForComponent(ON.id('progress_total_50_value_0_0210'), 500)
      let progress_total_50_value_10 = await driver.waitForComponent(ON.id('progress_total_50_value_10_0210'), 500)
      let progress_total_100_value_neg1 = await driver.waitForComponent(ON.id('progress_total_100_value_neg1_0210'), 500)
      let progress_total_100_value_0 = await driver.waitForComponent(ON.id('progress_total_100_value_0_0210'), 500)
      let progress_total_100_value_100 = await driver.waitForComponent(ON.id('progress_total_100_value_100_0210'), 500)
      let progress_total_100_value_120 = await driver.waitForComponent(ON.id('progress_total_100_value_120_0210'), 500)
      let progress_eclipse_total_50_value_neg1 = await driver.waitForComponent(ON.id('progress_eclipse_total_50_value_neg1_0210'), 500)
      let progress_eclipse_total_50_value_120 = await driver.waitForComponent(ON.id('progress_eclipse_total_50_value_120_0210'), 500)
      let progress_scalering_total_100_value_neg1 = await driver.waitForComponent(ON.id('progress_scalering_total_100_value_neg1_0210'), 500)
      let progress_scalering_total_100_value_50 = await driver.waitForComponent(ON.id('progress_scalering_total_100_value_50_0210'), 500)
      let progress_capsule_total_50_value_neg1 = await driver.waitForComponent(ON.id('progress_capsule_total_50_value_neg1_0210'), 500)
      let progress_capsule_total_50_value_50 = await driver.waitForComponent(ON.id('progress_capsule_total_50_value_50_0210'), 500)

      // 预期结果: 截图验证进度负数显示0，超过50的显示50，不超过50显示比例刻度
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0210 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0220
     * @tc.name   : ArkUI privacysensitive Progress
     * @tc.desc   : Verify ArkUI privacysensitive Progress interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0220', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0220 start.`);
      // 步骤1: 页面初始化
      Settings.createWindow('testability/pages/component/progress/PrivacySensitiveProgress/PrivacySensitiveProgress0220')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2: 验证不同value和total组合的Progress组件，privacySensitive为true
      let progress_total_200_value_neg1 = await driver.waitForComponent(ON.id('progress_total_200_value_neg1_0220'), 500)
      let progress_total_200_value_0 = await driver.waitForComponent(ON.id('progress_total_200_value_0_0220'), 500)
      let progress_total_200_value_10 = await driver.waitForComponent(ON.id('progress_total_200_value_10_0220'), 500)
      let progress_total_100_value_neg1 = await driver.waitForComponent(ON.id('progress_total_100_value_neg1_0220'), 500)
      let progress_total_100_value_0 = await driver.waitForComponent(ON.id('progress_total_100_value_0_0220'), 500)
      let progress_total_100_value_120 = await driver.waitForComponent(ON.id('progress_total_100_value_120_0220'), 500)
      let progress_total_50_value_neg1 = await driver.waitForComponent(ON.id('progress_total_50_value_neg1_0220'), 500)
      let progress_total_50_value_0 = await driver.waitForComponent(ON.id('progress_total_50_value_0_0220'), 500)
      let progress_total_50_value_10 = await driver.waitForComponent(ON.id('progress_total_50_value_10_0220'), 500)
      let progress_total_50_value_50 = await driver.waitForComponent(ON.id('progress_total_50_value_50_0220'), 500)
      let progress_total_neg1_value_neg1 = await driver.waitForComponent(ON.id('progress_total_neg1_value_neg1_0220'), 500)
      let progress_total_neg1_value_50 = await driver.waitForComponent(ON.id('progress_total_neg1_value_50_0220'), 500)
      let progress_total_neg1_value_100 = await driver.waitForComponent(ON.id('progress_total_neg1_value_100_0220'), 500)
      let progress_total_neg1_value_120 = await driver.waitForComponent(ON.id('progress_total_neg1_value_120_0220'), 500)
      let progress_total_0_value_neg1 = await driver.waitForComponent(ON.id('progress_total_0_value_neg1_0220'), 500)
      let progress_total_0_value_0 = await driver.waitForComponent(ON.id('progress_total_0_value_0_0220'), 500)
      let progress_total_0_value_10 = await driver.waitForComponent(ON.id('progress_total_0_value_10_0220'), 500)
      let progress_total_0_value_120 = await driver.waitForComponent(ON.id('progress_total_0_value_120_0220'), 500)

      // 预期结果: 截图验证背景色和进度都是灰色，刻度归零
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0220 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0230
     * @tc.name   : ArkUI privacysensitive Progress
     * @tc.desc   : Verify ArkUI privacysensitive Progress interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0230', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0230 start.`);
      // 步骤1: 页面初始化
      Settings.createWindow('testability/pages/component/progress/PrivacySensitiveProgress/PrivacySensitiveProgress0230')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2: 验证不同场景下privacySensitive为false的Progress组件
      // 卡片场景
      let progress_card_linear = await driver.waitForComponent(ON.id('progress_card_linear_0230'), 500)
      let progress_card_ring = await driver.waitForComponent(ON.id('progress_card_ring_0230'), 500)
      let progress_card_capsule = await driver.waitForComponent(ON.id('progress_card_capsule_0230'), 500)
      
      // 锁屏场景
      let progress_lockscreen_linear = await driver.waitForComponent(ON.id('progress_lockscreen_linear_0230'), 500)
      let progress_lockscreen_eclipse = await driver.waitForComponent(ON.id('progress_lockscreen_eclipse_0230'), 500)
      let progress_lockscreen_scalering = await driver.waitForComponent(ON.id('progress_lockscreen_scalering_0230'), 500)
      
      // 应用内场景
      let progress_app_linear = await driver.waitForComponent(ON.id('progress_app_linear_0230'), 500)
      let progress_app_ring = await driver.waitForComponent(ON.id('progress_app_ring_0230'), 500)
      let progress_app_eclipse = await driver.waitForComponent(ON.id('progress_app_eclipse_0230'), 500)
      let progress_app_scalering = await driver.waitForComponent(ON.id('progress_app_scalering_0230'), 500)
      let progress_app_capsule = await driver.waitForComponent(ON.id('progress_app_capsule_0230'), 500)
      
      // 综合场景
      let progress_comprehensive_linear = await driver.waitForComponent(ON.id('progress_comprehensive_linear_0230'), 500)
      let progress_comprehensive_ring = await driver.waitForComponent(ON.id('progress_comprehensive_ring_0230'), 500)
      let progress_comprehensive_eclipse = await driver.waitForComponent(ON.id('progress_comprehensive_eclipse_0230'), 500)
      let progress_comprehensive_scalering = await driver.waitForComponent(ON.id('progress_comprehensive_scalering_0230'), 500)
      let progress_comprehensive_capsule = await driver.waitForComponent(ON.id('progress_comprehensive_capsule_0230'), 500)

      // 预期结果: 截图验证展示样式和原有保持一致
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0230 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0240
     * @tc.name   : ArkUI privacysensitive Progress
     * @tc.desc   : Verify ArkUI privacysensitive Progress interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 2
     */
    it('SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0240', Level.LEVEL2, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0240 start.`);
      // 步骤1: 页面初始化
      Settings.createWindow('testability/pages/component/progress/PrivacySensitiveProgress/PrivacySensitiveProgress0240')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 步骤2: 验证不同场景下privacySensitive为true的Progress组件
      // 卡片场景
      let progress_card_linear = await driver.waitForComponent(ON.id('progress_card_linear_0240'), 500)
      let progress_card_ring = await driver.waitForComponent(ON.id('progress_card_ring_0240'), 500)
      let progress_card_capsule = await driver.waitForComponent(ON.id('progress_card_capsule_0240'), 500)
      
      // 锁屏场景
      let progress_lockscreen_linear = await driver.waitForComponent(ON.id('progress_lockscreen_linear_0240'), 500)
      let progress_lockscreen_eclipse = await driver.waitForComponent(ON.id('progress_lockscreen_eclipse_0240'), 500)
      let progress_lockscreen_scalering = await driver.waitForComponent(ON.id('progress_lockscreen_scalering_0240'), 500)
      
      // 应用内场景
      let progress_app_linear = await driver.waitForComponent(ON.id('progress_app_linear_0240'), 500)
      let progress_app_ring = await driver.waitForComponent(ON.id('progress_app_ring_0240'), 500)
      let progress_app_eclipse = await driver.waitForComponent(ON.id('progress_app_eclipse_0240'), 500)
      let progress_app_scalering = await driver.waitForComponent(ON.id('progress_app_scalering_0240'), 500)
      let progress_app_capsule = await driver.waitForComponent(ON.id('progress_app_capsule_0240'), 500)
      
      // 综合场景
      let progress_comprehensive_linear = await driver.waitForComponent(ON.id('progress_comprehensive_linear_0240'), 500)
      let progress_comprehensive_ring = await driver.waitForComponent(ON.id('progress_comprehensive_ring_0240'), 500)
      let progress_comprehensive_eclipse = await driver.waitForComponent(ON.id('progress_comprehensive_eclipse_0240'), 500)
      let progress_comprehensive_scalering = await driver.waitForComponent(ON.id('progress_comprehensive_scalering_0240'), 500)
      let progress_comprehensive_capsule = await driver.waitForComponent(ON.id('progress_comprehensive_capsule_0240'), 500)
      
      // 特殊场景
      let progress_special_high_value = await driver.waitForComponent(ON.id('progress_special_high_value_0240'), 500)
      let progress_special_zero_value = await driver.waitForComponent(ON.id('progress_special_zero_value_0240'), 500)
      let progress_special_negative_value = await driver.waitForComponent(ON.id('progress_special_negative_value_0240'), 500)

      // 预期结果: 截图验证样式和应用内一样背景色变灰，刻度归零
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_ARKUI_PRIVACYSENSITIVE_PROGRESS_0240 finish.`);
      done()
    })


  })
}