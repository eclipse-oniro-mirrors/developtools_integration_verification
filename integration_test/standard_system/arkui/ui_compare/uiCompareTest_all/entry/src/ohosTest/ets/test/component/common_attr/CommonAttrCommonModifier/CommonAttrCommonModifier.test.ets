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

export default function commonAttrCommonModifier() {

  describe('commonAttrCommonModifier', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0010
     * @tc.name   : Commonattr commonmodifier
     * @tc.desc   : Verify commonattr commonmodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0010 start.`);

      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrCommonModifier/CommonAttrCommonModifier0010')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 查找组件
      let shared_component = await driver.waitForComponent(ON.id('shared_component_commonmodifier_0010'), 500)
      let index_increase_button = await driver.waitForComponent(ON.id('index_increase_button_commonmodifier_0010'), 500)
      let index_decrease_button = await driver.waitForComponent(ON.id('index_decrease_button_commonmodifier_0010'), 500)
      let toggle_page_button = await driver.waitForComponent(ON.id('toggle_page_button_commonmodifier_0010'), 500)

      // 步骤2：按下index++或index--按钮轮巡测试用例
      // 测试几个关键的sharedTransition属性值
      for (let i = 0; i < 3; i++) {
        // 点击Toggle Page按钮测试共享元素转换
        await toggle_page_button.click()
        await Utils.sleep(200)

        // 再次点击返回
        await toggle_page_button.click()
        await Utils.sleep(200)

        // 点击index++按钮切换到下一个配置
        await index_increase_button.click()
        await Utils.sleep(100)
      }

      // 测试边界值：跳转到null和undefined配置
      for (let i = 0; i < 11; i++) {
        await index_increase_button.click()
        await Utils.sleep(50)
      }

      // 测试null配置
      await toggle_page_button.click()
      await Utils.sleep(200)
      await toggle_page_button.click()
      await Utils.sleep(200)

      // 切换到undefined配置
      await index_increase_button.click()
      await Utils.sleep(100)

      // 测试undefined配置
      await toggle_page_button.click()
      await Utils.sleep(200)
      await toggle_page_button.click()
      await Utils.sleep(200)

      // 步骤3：对比是否与原生效果是否一致
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0020
     * @tc.name   : Commonattr commonmodifier
     * @tc.desc   : Verify commonattr commonmodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0020 start.`);

      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrCommonModifier/CommonAttrCommonModifier0020')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 查找组件
      let zindex_component = await driver.waitForComponent(ON.id('zindex_component_commonmodifier_0020'), 500)
      let index_increase_button = await driver.waitForComponent(ON.id('index_increase_button_commonmodifier_0020'), 500)
      let index_decrease_button = await driver.waitForComponent(ON.id('index_decrease_button_commonmodifier_0020'), 500)

      // 步骤2：按下index++或index--按钮轮巡测试用例
      // 测试所有zIndex属性值
      for (let i = 0; i < 6; i++) {
        await Utils.sleep(200)

        // 点击index++按钮切换到下一个配置
        await index_increase_button.click()
        await Utils.sleep(100)
      }

      // 测试回退功能
      for (let i = 0; i < 3; i++) {
        await index_decrease_button.click()
        await Utils.sleep(100)
      }

      // 步骤3：对比是否与原生效果是否一致
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0030
     * @tc.name   : Commonattr commonmodifier
     * @tc.desc   : Verify commonattr commonmodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0030 start.`);

      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrCommonModifier/CommonAttrCommonModifier0030')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 查找组件
      let displaypriority_component =
        await driver.waitForComponent(ON.id('displaypriority_component_commonmodifier_0030'), 500)
      let index_increase_button = await driver.waitForComponent(ON.id('index_increase_button_commonmodifier_0030'), 500)
      let index_decrease_button = await driver.waitForComponent(ON.id('index_decrease_button_commonmodifier_0030'), 500)
      let simulate_constraint_button =
        await driver.waitForComponent(ON.id('simulate_constraint_button_commonmodifier_0030'), 500)

      // 步骤2：按下index++或index--按钮轮巡测试用例
      // 测试所有displayPriority属性值
      for (let i = 0; i < 6; i++) {
        await Utils.sleep(200)

        // 点击模拟空间约束按钮测试displayPriority效果
        await simulate_constraint_button.click()
        await Utils.sleep(100)

        // 点击index++按钮切换到下一个配置
        await index_increase_button.click()
        await Utils.sleep(100)
      }

      // 测试回退功能
      for (let i = 0; i < 3; i++) {
        await index_decrease_button.click()
        await Utils.sleep(100)

        await simulate_constraint_button.click()
        await Utils.sleep(100)
      }

      // 步骤3：对比是否与原生效果是否一致
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0040
     * @tc.name   : Commonattr commonmodifier
     * @tc.desc   : Verify commonattr commonmodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0040 start.`);

      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrCommonModifier/CommonAttrCommonModifier0040')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 查找组件
      let alignself_component = await driver.waitForComponent(ON.id('alignself_component_commonmodifier_0040'), 500)
      let index_increase_button = await driver.waitForComponent(ON.id('index_increase_button_commonmodifier_0040'), 500)
      let index_decrease_button = await driver.waitForComponent(ON.id('index_decrease_button_commonmodifier_0040'), 500)

      // 步骤2：按下index++或index--按钮轮巡测试用例
      // 测试所有alignSelf属性值
      for (let i = 0; i < 7; i++) {
        await Utils.sleep(200)

        // 点击index++按钮切换到下一个配置
        await index_increase_button.click()
        await Utils.sleep(100)
      }

      // 测试回退功能
      for (let i = 0; i < 4; i++) {
        await index_decrease_button.click()
        await Utils.sleep(100)
      }

      // 再次前进测试
      for (let i = 0; i < 2; i++) {
        await index_increase_button.click()
        await Utils.sleep(100)
      }

      // 步骤3：对比是否与原生效果是否一致
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0050
     * @tc.name   : Commonattr commonmodifier
     * @tc.desc   : Verify commonattr commonmodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0050 start.`);

      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrCommonModifier/CommonAttrCommonModifier0050')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 查找组件
      let flexbasis_component = await driver.waitForComponent(ON.id('flexbasis_component_commonmodifier_0050'), 500)
      let index_increase_button = await driver.waitForComponent(ON.id('index_increase_button_commonmodifier_0050'), 500)
      let index_decrease_button = await driver.waitForComponent(ON.id('index_decrease_button_commonmodifier_0050'), 500)

      // 步骤2：按下index++或index--按钮轮巡测试用例
      // 测试所有flexBasis属性值
      for (let i = 0; i < 6; i++) {
        await Utils.sleep(200)

        // 点击index++按钮切换到下一个配置
        await index_increase_button.click()
        await Utils.sleep(100)
      }

      // 测试回退功能
      for (let i = 0; i < 3; i++) {
        await index_decrease_button.click()
        await Utils.sleep(100)
      }

      // 再次前进测试特殊值
      for (let i = 0; i < 2; i++) {
        await index_increase_button.click()
        await Utils.sleep(100)
      }

      // 步骤3：对比是否与原生效果是否一致
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0060
     * @tc.name   : Commonattr commonmodifier
     * @tc.desc   : Verify commonattr commonmodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0060 start.`);

      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrCommonModifier/CommonAttrCommonModifier0060')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 查找组件
      let flexgrow_component = await driver.waitForComponent(ON.id('flexgrow_component_commonmodifier_0060'), 500)
      let index_increase_button = await driver.waitForComponent(ON.id('index_increase_button_commonmodifier_0060'), 500)
      let index_decrease_button = await driver.waitForComponent(ON.id('index_decrease_button_commonmodifier_0060'), 500)

      // 步骤2：按下index++或index--按钮轮巡测试用例
      // 测试所有flexGrow属性值
      for (let i = 0; i < 6; i++) {
        await Utils.sleep(200)

        // 点击index++按钮切换到下一个配置
        await index_increase_button.click()
        await Utils.sleep(100)
      }

      // 测试回退功能
      for (let i = 0; i < 3; i++) {
        await index_decrease_button.click()
        await Utils.sleep(100)
      }

      // 再次前进测试异常值
      for (let i = 0; i < 2; i++) {
        await index_increase_button.click()
        await Utils.sleep(100)
      }

      // 步骤3：对比是否与原生效果是否一致
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0060 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0070
     * @tc.name   : Commonattr commonmodifier
     * @tc.desc   : Verify commonattr commonmodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0070 start.`);

      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrCommonModifier/CommonAttrCommonModifier0070')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 查找组件
      let flexshrink_component = await driver.waitForComponent(ON.id('flexshrink_component_commonmodifier_0070'), 500)
      let index_increase_button = await driver.waitForComponent(ON.id('index_increase_button_commonmodifier_0070'), 500)
      let index_decrease_button = await driver.waitForComponent(ON.id('index_decrease_button_commonmodifier_0070'), 500)

      // 步骤2：按下index++或index--按钮轮巡测试用例
      // 测试所有flexShrink属性值
      for (let i = 0; i < 6; i++) {
        await Utils.sleep(200)

        // 点击index++按钮切换到下一个配置
        await index_increase_button.click()
        await Utils.sleep(100)
      }

      // 测试回退功能
      for (let i = 0; i < 3; i++) {
        await index_decrease_button.click()
        await Utils.sleep(100)
      }

      // 再次前进测试异常值
      for (let i = 0; i < 2; i++) {
        await index_increase_button.click()
        await Utils.sleep(100)
      }

      // 步骤3：对比是否与原生效果是否一致
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0080
     * @tc.name   : Commonattr commonmodifier
     * @tc.desc   : Verify commonattr commonmodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0080 start.`);

      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrCommonModifier/CommonAttrCommonModifier0080')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 查找组件
      let transform_component = await driver.waitForComponent(ON.id('transform_component_commonmodifier_0080'), 500)
      let index_increase_button = await driver.waitForComponent(ON.id('index_increase_button_commonmodifier_0080'), 500)
      let index_decrease_button = await driver.waitForComponent(ON.id('index_decrease_button_commonmodifier_0080'), 500)

      // 步骤2：按下index++或index--按钮轮巡测试用例
      // 测试所有transform属性值
      for (let i = 0; i < 3; i++) {
        await Utils.sleep(300)

        // 点击index++按钮切换到下一个配置
        await index_increase_button.click()
        await Utils.sleep(200)
      }

      // 测试回退功能
      for (let i = 0; i < 2; i++) {
        await index_decrease_button.click()
        await Utils.sleep(200)
      }

      // 再次前进测试边界值
      await index_increase_button.click()
      await Utils.sleep(200)

      // 步骤3：对比是否与原生效果是否一致
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0090
     * @tc.name   : Commonattr commonmodifier
     * @tc.desc   : Verify commonattr commonmodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0090 start.`);

      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrCommonModifier/CommonAttrCommonModifier0090')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 查找组件
      let rotate_component = await driver.waitForComponent(ON.id('rotate_component_commonmodifier_0090'), 500)
      let index_increase_button = await driver.waitForComponent(ON.id('index_increase_button_commonmodifier_0090'), 500)
      let index_decrease_button = await driver.waitForComponent(ON.id('index_decrease_button_commonmodifier_0090'), 500)

      // 步骤2：按下index++或index--按钮轮巡测试用例
      // 测试所有rotate属性值
      for (let i = 0; i < 3; i++) {
        await Utils.sleep(300)

        // 点击index++按钮切换到下一个配置
        await index_increase_button.click()
        await Utils.sleep(200)
      }

      // 测试回退功能
      for (let i = 0; i < 2; i++) {
        await index_decrease_button.click()
        await Utils.sleep(200)
      }

      // 再次前进测试边界值
      await index_increase_button.click()
      await Utils.sleep(200)

      // 步骤3：对比是否与原生效果是否一致
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0100
     * @tc.name   : Commonattr commonmodifier
     * @tc.desc   : Verify commonattr commonmodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0100 start.`);

      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrCommonModifier/CommonAttrCommonModifier0100')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 查找组件
      let gridoffset_component = await driver.waitForComponent(ON.id('gridoffset_component_commonmodifier_0100'), 500)
      let index_increase_button = await driver.waitForComponent(ON.id('index_increase_button_commonmodifier_0100'), 500)
      let index_decrease_button = await driver.waitForComponent(ON.id('index_decrease_button_commonmodifier_0100'), 500)

      // 步骤2：按下index++或index--按钮轮巡测试用例
      // 测试所有gridOffset属性值
      for (let i = 0; i < 4; i++) {
        await Utils.sleep(200)

        // 点击index++按钮切换到下一个配置
        await index_increase_button.click()
        await Utils.sleep(100)
      }

      // 测试回退功能
      for (let i = 0; i < 2; i++) {
        await index_decrease_button.click()
        await Utils.sleep(100)
      }

      // 再次前进测试异常值
      await index_increase_button.click()
      await Utils.sleep(100)

      // 步骤3：对比是否与原生效果是否一致
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0100 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0110
     * @tc.name   : Commonattr commonmodifier
     * @tc.desc   : Verify commonattr commonmodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0110 start.`);

      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrCommonModifier/CommonAttrCommonModifier0110')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 查找组件
      let gridspan_component = await driver.waitForComponent(ON.id('gridspan_component_commonmodifier_0110'), 500)
      let index_increase_button = await driver.waitForComponent(ON.id('index_increase_button_commonmodifier_0110'), 500)
      let index_decrease_button = await driver.waitForComponent(ON.id('index_decrease_button_commonmodifier_0110'), 500)

      // 步骤2：按下index++或index--按钮轮巡测试用例
      // 测试所有gridSpan属性值
      for (let i = 0; i < 4; i++) {
        await Utils.sleep(200)

        // 点击index++按钮切换到下一个配置
        await index_increase_button.click()
        await Utils.sleep(100)
      }

      // 测试回退功能
      for (let i = 0; i < 2; i++) {
        await index_decrease_button.click()
        await Utils.sleep(100)
      }

      // 再次前进测试异常值
      await index_increase_button.click()
      await Utils.sleep(100)

      // 步骤3：对比是否与原生效果是否一致
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0120
     * @tc.name   : Commonattr commonmodifier
     * @tc.desc   : Verify commonattr commonmodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0120 start.`);

      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrCommonModifier/CommonAttrCommonModifier0120')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 查找组件
      let scale_component = await driver.waitForComponent(ON.id('scale_component_commonmodifier_0120'), 500)
      let index_increase_button = await driver.waitForComponent(ON.id('index_increase_button_commonmodifier_0120'), 500)
      let index_decrease_button = await driver.waitForComponent(ON.id('index_decrease_button_commonmodifier_0120'), 500)

      // 步骤2：按下index++或index--按钮轮巡测试用例
      // 测试所有scale属性值
      for (let i = 0; i < 3; i++) {
        await Utils.sleep(300)

        // 点击index++按钮切换到下一个配置
        await index_increase_button.click()
        await Utils.sleep(200)
      }

      // 测试回退功能
      for (let i = 0; i < 2; i++) {
        await index_decrease_button.click()
        await Utils.sleep(200)
      }

      // 再次前进测试边界值
      await index_increase_button.click()
      await Utils.sleep(200)

      // 步骤3：对比是否与原生效果是否一致
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0130
     * @tc.name   : Commonattr commonmodifier
     * @tc.desc   : Verify commonattr commonmodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0130 start.`);

      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrCommonModifier/CommonAttrCommonModifier0130')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 查找组件
      let translate_component = await driver.waitForComponent(ON.id('translate_component_commonmodifier_0130'), 500)
      let index_increase_button = await driver.waitForComponent(ON.id('index_increase_button_commonmodifier_0130'), 500)
      let index_decrease_button = await driver.waitForComponent(ON.id('index_decrease_button_commonmodifier_0130'), 500)

      // 步骤2：按下index++或index--按钮轮巡测试用例
      // 测试所有translate属性值
      for (let i = 0; i < 3; i++) {
        await Utils.sleep(300)

        // 点击index++按钮切换到下一个配置
        await index_increase_button.click()
        await Utils.sleep(200)
      }

      // 测试回退功能
      for (let i = 0; i < 2; i++) {
        await index_decrease_button.click()
        await Utils.sleep(200)
      }

      // 再次前进测试边界值
      await index_increase_button.click()
      await Utils.sleep(200)

      // 步骤3：对比是否与原生效果是否一致
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0130 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0140
     * @tc.name   : Commonattr commonmodifier
     * @tc.desc   : Verify commonattr commonmodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0140 start.`);

      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrCommonModifier/CommonAttrCommonModifier0140')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 查找组件
      let rendergroup_component = await driver.waitForComponent(ON.id('rendergroup_component_commonmodifier_0140'), 500)
      let index_increase_button = await driver.waitForComponent(ON.id('index_increase_button_commonmodifier_0140'), 500)
      let index_decrease_button = await driver.waitForComponent(ON.id('index_decrease_button_commonmodifier_0140'), 500)

      // 步骤2：按下index++或index--按钮轮巡测试用例
      // 测试renderGroup属性值
      await Utils.sleep(200)

      // 点击index++按钮切换到false
      await index_increase_button.click()
      await Utils.sleep(200)

      // 测试回退功能
      await index_decrease_button.click()
      await Utils.sleep(200)

      // 再次前进测试
      await index_increase_button.click()
      await Utils.sleep(200)

      // 步骤3：对比是否与原生效果是否一致
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0140 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0150
     * @tc.name   : Commonattr commonmodifier
     * @tc.desc   : Verify commonattr commonmodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0150 start.`);

      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrCommonModifier/CommonAttrCommonModifier0150')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 查找组件
      let huerotate_component = await driver.waitForComponent(ON.id('huerotate_component_commonmodifier_0150'), 500)
      let index_increase_button = await driver.waitForComponent(ON.id('index_increase_button_commonmodifier_0150'), 500)
      let index_decrease_button = await driver.waitForComponent(ON.id('index_decrease_button_commonmodifier_0150'), 500)

      // 步骤2：按下index++或index--按钮轮巡测试用例
      // 测试所有hueRotate属性值
      for (let i = 0; i < 7; i++) {
        await Utils.sleep(200)

        // 点击index++按钮切换到下一个配置
        await index_increase_button.click()
        await Utils.sleep(100)
      }

      // 测试回退功能
      for (let i = 0; i < 3; i++) {
        await index_decrease_button.click()
        await Utils.sleep(100)
      }

      // 再次前进测试异常值
      for (let i = 0; i < 2; i++) {
        await index_increase_button.click()
        await Utils.sleep(100)
      }

      // 步骤3：对比是否与原生效果是否一致
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0150 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0160
     * @tc.name   : Commonattr commonmodifier
     * @tc.desc   : Verify commonattr commonmodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0160', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0160 start.`);

      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrCommonModifier/CommonAttrCommonModifier0160')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 查找组件
      let sepia_component = await driver.waitForComponent(ON.id('sepia_component_commonmodifier_0160'), 500)
      let index_increase_button = await driver.waitForComponent(ON.id('index_increase_button_commonmodifier_0160'), 500)
      let index_decrease_button = await driver.waitForComponent(ON.id('index_decrease_button_commonmodifier_0160'), 500)

      // 步骤2：按下index++或index--按钮轮巡测试用例
      // 测试所有sepia属性值
      for (let i = 0; i < 5; i++) {
        await Utils.sleep(200)

        // 点击index++按钮切换到下一个配置
        await index_increase_button.click()
        await Utils.sleep(100)
      }

      // 测试回退功能
      for (let i = 0; i < 3; i++) {
        await index_decrease_button.click()
        await Utils.sleep(100)
      }

      // 再次前进测试异常值
      for (let i = 0; i < 2; i++) {
        await index_increase_button.click()
        await Utils.sleep(100)
      }

      // 步骤3：对比是否与原生效果是否一致
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0160 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0170
     * @tc.name   : Commonattr commonmodifier
     * @tc.desc   : Verify commonattr commonmodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0170 start.`);

      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrCommonModifier/CommonAttrCommonModifier0170')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 查找组件
      let align_component = await driver.waitForComponent(ON.id('align_component_commonmodifier_0170'), 500)
      let index_increase_button = await driver.waitForComponent(ON.id('index_increase_button_commonmodifier_0170'), 500)
      let index_decrease_button = await driver.waitForComponent(ON.id('index_decrease_button_commonmodifier_0170'), 500)

      // 步骤2：按下index++或index--按钮轮巡测试用例
      // 测试所有align属性值
      for (let i = 0; i < 9; i++) {
        await Utils.sleep(200)

        // 点击index++按钮切换到下一个配置
        await index_increase_button.click()
        await Utils.sleep(100)
      }

      // 测试回退功能
      for (let i = 0; i < 5; i++) {
        await index_decrease_button.click()
        await Utils.sleep(100)
      }

      // 再次前进测试
      for (let i = 0; i < 3; i++) {
        await index_increase_button.click()
        await Utils.sleep(100)
      }

      // 步骤3：对比是否与原生效果是否一致
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0180
     * @tc.name   : Commonattr commonmodifier
     * @tc.desc   : Verify commonattr commonmodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0180 start.`);

      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrCommonModifier/CommonAttrCommonModifier0180')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 查找组件
      let direction_component = await driver.waitForComponent(ON.id('direction_component_commonmodifier_0180'), 500)
      let index_increase_button = await driver.waitForComponent(ON.id('index_increase_button_commonmodifier_0180'), 500)
      let index_decrease_button = await driver.waitForComponent(ON.id('index_decrease_button_commonmodifier_0180'), 500)

      // 步骤2：按下index++或index--按钮轮巡测试用例
      // 测试所有direction属性值
      for (let i = 0; i < 2; i++) {
        await Utils.sleep(200)

        // 点击index++按钮切换到下一个配置
        await index_increase_button.click()
        await Utils.sleep(100)
      }

      // 测试回退功能
      await index_decrease_button.click()
      await Utils.sleep(100)

      // 再次前进测试
      await index_increase_button.click()
      await Utils.sleep(100)

      // 步骤3：对比是否与原生效果是否一致
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0180 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0190
     * @tc.name   : Commonattr commonmodifier
     * @tc.desc   : Verify commonattr commonmodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0190 start.`);

      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrCommonModifier/CommonAttrCommonModifier0190')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 查找组件
      let position_component = await driver.waitForComponent(ON.id('position_component_commonmodifier_0190'), 500)
      let index_increase_button = await driver.waitForComponent(ON.id('index_increase_button_commonmodifier_0190'), 500)
      let index_decrease_button = await driver.waitForComponent(ON.id('index_decrease_button_commonmodifier_0190'), 500)

      // 步骤2：按下index++或index--按钮轮巡测试用例
      // 测试所有position属性值
      for (let i = 0; i < 8; i++) {
        await Utils.sleep(200)

        // 点击index++按钮切换到下一个配置
        await index_increase_button.click()
        await Utils.sleep(100)
      }

      // 测试回退功能
      for (let i = 0; i < 4; i++) {
        await index_decrease_button.click()
        await Utils.sleep(100)
      }

      // 再次前进测试
      for (let i = 0; i < 2; i++) {
        await index_increase_button.click()
        await Utils.sleep(100)
      }

      // 步骤3：对比是否与原生效果是否一致
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0190 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0200
     * @tc.name   : Commonattr commonmodifier
     * @tc.desc   : Verify commonattr commonmodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0200', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0200 start.`);

      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrCommonModifier/CommonAttrCommonModifier0200')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 查找组件
      let markanchor_component = await driver.waitForComponent(ON.id('markanchor_component_commonmodifier_0200'), 500)
      let index_increase_button = await driver.waitForComponent(ON.id('index_increase_button_commonmodifier_0200'), 500)
      let index_decrease_button = await driver.waitForComponent(ON.id('index_decrease_button_commonmodifier_0200'), 500)

      // 步骤2：按下index++或index--按钮轮巡测试用例
      // 测试所有markAnchor属性值
      for (let i = 0; i < 8; i++) {
        await Utils.sleep(200)

        // 点击index++按钮切换到下一个配置
        await index_increase_button.click()
        await Utils.sleep(100)
      }

      // 测试回退功能
      for (let i = 0; i < 4; i++) {
        await index_decrease_button.click()
        await Utils.sleep(100)
      }

      // 再次前进测试
      for (let i = 0; i < 2; i++) {
        await index_increase_button.click()
        await Utils.sleep(100)
      }

      // 步骤3：对比是否与原生效果是否一致
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0200 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0210
     * @tc.name   : Commonattr commonmodifier
     * @tc.desc   : Verify commonattr commonmodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0210', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0210 start.`);

      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrCommonModifier/CommonAttrCommonModifier0210')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 查找组件
      let offset_component = await driver.waitForComponent(ON.id('offset_component_commonmodifier_0210'), 500)
      let index_increase_button = await driver.waitForComponent(ON.id('index_increase_button_commonmodifier_0210'), 500)
      let index_decrease_button = await driver.waitForComponent(ON.id('index_decrease_button_commonmodifier_0210'), 500)

      // 步骤2：按下index++或index--按钮轮巡测试用例
      // 测试所有offset属性值
      for (let i = 0; i < 8; i++) {
        await Utils.sleep(200)

        // 点击index++按钮切换到下一个配置
        await index_increase_button.click()
        await Utils.sleep(100)
      }

      // 测试回退功能
      for (let i = 0; i < 4; i++) {
        await index_decrease_button.click()
        await Utils.sleep(100)
      }

      // 再次前进测试
      for (let i = 0; i < 2; i++) {
        await index_increase_button.click()
        await Utils.sleep(100)
      }

      // 步骤3：对比是否与原生效果是否一致
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0210 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0220
     * @tc.name   : Commonattr commonmodifier
     * @tc.desc   : Verify commonattr commonmodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0220', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0220 start.`);

      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrCommonModifier/CommonAttrCommonModifier0220')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 查找组件
      let markanchor_component = await driver.waitForComponent(ON.id('markanchor_component_commonmodifier_0220'), 500)
      let index_increase_button = await driver.waitForComponent(ON.id('index_increase_button_commonmodifier_0220'), 500)
      let index_decrease_button = await driver.waitForComponent(ON.id('index_decrease_button_commonmodifier_0220'), 500)

      // 步骤2：按下index++或index--按钮轮巡测试用例
      // 测试所有markAnchor属性值
      for (let i = 0; i < 8; i++) {
        await Utils.sleep(200)

        // 点击index++按钮切换到下一个配置
        await index_increase_button.click()
        await Utils.sleep(100)
      }

      // 测试回退功能
      for (let i = 0; i < 4; i++) {
        await index_decrease_button.click()
        await Utils.sleep(100)
      }

      // 再次前进测试
      for (let i = 0; i < 2; i++) {
        await index_increase_button.click()
        await Utils.sleep(100)
      }

      // 步骤3：对比是否与原生效果是否一致
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0220 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0230
     * @tc.name   : Commonattr commonmodifier
     * @tc.desc   : Verify commonattr commonmodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0230', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0230 start.`);

      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrCommonModifier/CommonAttrCommonModifier0230')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 查找组件
      let saturate_component = await driver.waitForComponent(ON.id('saturate_component_commonmodifier_0230'), 500)
      let index_increase_button = await driver.waitForComponent(ON.id('index_increase_button_commonmodifier_0230'), 500)
      let index_decrease_button = await driver.waitForComponent(ON.id('index_decrease_button_commonmodifier_0230'), 500)

      // 步骤2：按下index++或index--按钮轮巡测试用例
      // 由于只有一个saturate值(0.7)，测试按钮功能
      await Utils.sleep(200)

      // 尝试点击index++按钮（应该没有变化，因为只有一个值）
      await index_increase_button.click()
      await Utils.sleep(100)

      // 尝试点击index--按钮（应该没有变化，因为已经是第一个值）
      await index_decrease_button.click()
      await Utils.sleep(100)

      // 再次点击确保功能稳定
      await index_increase_button.click()
      await Utils.sleep(100)

      // 步骤3：对比是否与原生效果是否一致
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0230 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0240
     * @tc.name   : Commonattr commonmodifier
     * @tc.desc   : Verify commonattr commonmodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0240', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0240 start.`);

      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrCommonModifier/CommonAttrCommonModifier0240')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 查找组件
      let saturate_component = await driver.waitForComponent(ON.id('saturate_component_commonmodifier_0240'), 500)
      let index_increase_button = await driver.waitForComponent(ON.id('index_increase_button_commonmodifier_0240'), 500)
      let index_decrease_button = await driver.waitForComponent(ON.id('index_decrease_button_commonmodifier_0240'), 500)

      // 步骤2：按下index++或index--按钮轮巡测试用例
      // 由于只有一个saturate值(0.2)，测试按钮功能
      await Utils.sleep(200)

      // 尝试点击index++按钮（应该没有变化，因为只有一个值）
      await index_increase_button.click()
      await Utils.sleep(100)

      // 尝试点击index--按钮（应该没有变化，因为已经是第一个值）
      await index_decrease_button.click()
      await Utils.sleep(100)

      // 再次点击确保功能稳定
      await index_increase_button.click()
      await Utils.sleep(100)

      // 步骤3：对比是否与原生效果是否一致
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0240 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0250
     * @tc.name   : Commonattr commonmodifier
     * @tc.desc   : Verify commonattr commonmodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0250', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0250 start.`);

      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrCommonModifier/CommonAttrCommonModifier0250')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 查找组件
      let saturate_component = await driver.waitForComponent(ON.id('saturate_component_commonmodifier_0250'), 500)
      let index_increase_button = await driver.waitForComponent(ON.id('index_increase_button_commonmodifier_0250'), 500)
      let index_decrease_button = await driver.waitForComponent(ON.id('index_decrease_button_commonmodifier_0250'), 500)

      // 步骤2：按下index++或index--按钮轮巡测试用例
      // 由于只有一个saturate值(1.0)，测试按钮功能
      await Utils.sleep(200)

      // 尝试点击index++按钮（应该没有变化，因为只有一个值）
      await index_increase_button.click()
      await Utils.sleep(100)

      // 尝试点击index--按钮（应该没有变化，因为已经是第一个值）
      await index_decrease_button.click()
      await Utils.sleep(100)

      // 再次点击确保功能稳定
      await index_increase_button.click()
      await Utils.sleep(100)

      // 步骤3：对比是否与原生效果是否一致
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0250 finish.`);
      done()
    })


    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0260
     * @tc.name   : Commonattr commonmodifier
     * @tc.desc   : Verify commonattr commonmodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0260', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0260 start.`);

      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrCommonModifier/CommonAttrCommonModifier0260')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 查找组件
      let picker_component = await driver.waitForComponent(ON.id('picker_component_commonmodifier_0260'), 500)
      let index_increase_button = await driver.waitForComponent(ON.id('index_increase_button_commonmodifier_0260'), 500)
      let index_decrease_button = await driver.waitForComponent(ON.id('index_decrease_button_commonmodifier_0260'), 500)

      // 步骤2：按下index++或index--按钮轮巡测试用例
      // 由于只有一个配置，测试按钮功能
      await Utils.sleep(200)

      // 尝试点击index++按钮（应该没有变化，因为只有一个配置）
      await index_increase_button.click()
      await Utils.sleep(100)

      // 尝试点击index--按钮（应该没有变化，因为已经是第一个配置）
      await index_decrease_button.click()
      await Utils.sleep(100)

      // 再次点击确保功能稳定
      await index_increase_button.click()
      await Utils.sleep(100)

      // 步骤3：对比是否与原生效果是否一致
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0260 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0270
     * @tc.name   : Commonattr commonmodifier
     * @tc.desc   : Verify commonattr commonmodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0270', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0270 start.`);

      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrCommonModifier/CommonAttrCommonModifier0270')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 查找组件
      let saturate_component = await driver.waitForComponent(ON.id('saturate_component_commonmodifier_0270'), 500)
      let index_increase_button = await driver.waitForComponent(ON.id('index_increase_button_commonmodifier_0270'), 500)
      let index_decrease_button = await driver.waitForComponent(ON.id('index_decrease_button_commonmodifier_0270'), 500)

      // 步骤2：按下index++或index--按钮轮巡测试用例
      // 由于只有一个saturate值(100)，测试按钮功能
      await Utils.sleep(200)

      // 尝试点击index++按钮（应该没有变化，因为只有一个值）
      await index_increase_button.click()
      await Utils.sleep(100)

      // 尝试点击index--按钮（应该没有变化，因为已经是第一个值）
      await index_decrease_button.click()
      await Utils.sleep(100)

      // 再次点击确保功能稳定
      await index_increase_button.click()
      await Utils.sleep(100)

      // 步骤3：对比是否与原生效果是否一致
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0270 finish.`);
      done()
    })
 /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0280
     * @tc.name   : SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0280
     * @tc.type   : function
     * @tc.desc   : Test setting the saturate property with negative boundary value (-1).
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0280', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0280 start.`);

      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrCommonModifier/CommonAttrCommonModifier0280')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 查找组件
      let saturate_component = await driver.waitForComponent(ON.id('saturate_component_commonmodifier_0280'), 500)
      let index_increase_button = await driver.waitForComponent(ON.id('index_increase_button_commonmodifier_0280'), 500)
      let index_decrease_button = await driver.waitForComponent(ON.id('index_decrease_button_commonmodifier_0280'), 500)

      // 步骤2：按下index++或index--按钮轮巡测试用例
      // 由于只有一个saturate值(-1)，测试按钮功能
      await Utils.sleep(200)

      // 尝试点击index++按钮（应该没有变化，因为只有一个值）
      await index_increase_button.click()
      await Utils.sleep(100)

      // 尝试点击index--按钮（应该没有变化，因为已经是第一个值）
      await index_decrease_button.click()
      await Utils.sleep(100)

      // 再次点击确保功能稳定
      await index_increase_button.click()
      await Utils.sleep(100)

      // 步骤3：对比是否与原生效果是否一致
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0280 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0290
     * @tc.name   : Commonattr commonmodifier
     * @tc.desc   : Verify commonattr commonmodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0290', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0290 start.`);

      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrCommonModifier/CommonAttrCommonModifier0290')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 查找组件
      let saturate_component = await driver.waitForComponent(ON.id('saturate_component_commonmodifier_0290'), 500)
      let index_increase_button = await driver.waitForComponent(ON.id('index_increase_button_commonmodifier_0290'), 500)
      let index_decrease_button = await driver.waitForComponent(ON.id('index_decrease_button_commonmodifier_0290'), 500)

      // 步骤2：按下index++或index--按钮轮巡测试用例
      // 由于只有一个saturate值(0)，测试按钮功能
      await Utils.sleep(200)

      // 尝试点击index++按钮（应该没有变化，因为只有一个值）
      await index_increase_button.click()
      await Utils.sleep(100)

      // 尝试点击index--按钮（应该没有变化，因为已经是第一个值）
      await index_decrease_button.click()
      await Utils.sleep(100)

      // 再次点击确保功能稳定
      await index_increase_button.click()
      await Utils.sleep(100)

      // 步骤3：对比是否与原生效果是否一致
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0290 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0300
     * @tc.name   : Commonattr commonmodifier
     * @tc.desc   : Verify commonattr commonmodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0300', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0300 start.`);

      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrCommonModifier/CommonAttrCommonModifier0300')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 查找组件
      let saturate_component = await driver.waitForComponent(ON.id('saturate_component_commonmodifier_0300'), 500)
      let index_increase_button = await driver.waitForComponent(ON.id('index_increase_button_commonmodifier_0300'), 500)
      let index_decrease_button = await driver.waitForComponent(ON.id('index_decrease_button_commonmodifier_0300'), 500)

      // 步骤2：按下index++或index--按钮轮巡测试用例
      // 由于只有一个saturate值(2.0)，测试按钮功能
      await Utils.sleep(200)

      // 尝试点击index++按钮（应该没有变化，因为只有一个值）
      await index_increase_button.click()
      await Utils.sleep(100)

      // 尝试点击index--按钮（应该没有变化，因为已经是第一个值）
      await index_decrease_button.click()
      await Utils.sleep(100)

      // 再次点击确保功能稳定
      await index_increase_button.click()
      await Utils.sleep(100)

      // 步骤3：对比是否与原生效果是否一致
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0300 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0310
     * @tc.name   : Commonattr commonmodifier
     * @tc.desc   : Verify commonattr commonmodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0310', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0310 start.`);

      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrCommonModifier/CommonAttrCommonModifier0310')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 查找组件
      let colorblend_component = await driver.waitForComponent(ON.id('colorblend_component_commonmodifier_0310'), 500)
      let index_increase_button = await driver.waitForComponent(ON.id('index_increase_button_commonmodifier_0310'), 500)
      let index_decrease_button = await driver.waitForComponent(ON.id('index_decrease_button_commonmodifier_0310'), 500)

      // 步骤2：按下index++或index--按钮轮巡测试用例
      // 由于只有一个colorBlend值(Color.Orange)，测试按钮功能
      await Utils.sleep(200)

      // 尝试点击index++按钮（应该没有变化，因为只有一个值）
      await index_increase_button.click()
      await Utils.sleep(100)

      // 尝试点击index--按钮（应该没有变化，因为已经是第一个值）
      await index_decrease_button.click()
      await Utils.sleep(100)

      // 再次点击确保功能稳定
      await index_increase_button.click()
      await Utils.sleep(100)

      // 步骤3：对比是否与原生效果是否一致
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0310 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0320
     * @tc.name   : Commonattr commonmodifier
     * @tc.desc   : Verify commonattr commonmodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0320', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0320 start.`);

      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrCommonModifier/CommonAttrCommonModifier0320')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 查找组件
      let colorblend_component = await driver.waitForComponent(ON.id('colorblend_component_commonmodifier_0320'), 500)
      let index_increase_button = await driver.waitForComponent(ON.id('index_increase_button_commonmodifier_0320'), 500)
      let index_decrease_button = await driver.waitForComponent(ON.id('index_decrease_button_commonmodifier_0320'), 500)

      // 步骤2：按下index++或index--按钮轮巡测试用例
      // 由于只有一个colorBlend值("green")，测试按钮功能
      await Utils.sleep(200)

      // 尝试点击index++按钮（应该没有变化，因为只有一个值）
      await index_increase_button.click()
      await Utils.sleep(100)

      // 尝试点击index--按钮（应该没有变化，因为已经是第一个值）
      await index_decrease_button.click()
      await Utils.sleep(100)

      // 再次点击确保功能稳定
      await index_increase_button.click()
      await Utils.sleep(100)

      // 步骤3：对比是否与原生效果是否一致
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0320 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0330
     * @tc.name   : Commonattr commonmodifier
     * @tc.desc   : Verify commonattr commonmodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0330', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0330 start.`);

      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrCommonModifier/CommonAttrCommonModifier0330')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 查找组件
      let colorblend_component = await driver.waitForComponent(ON.id('colorblend_component_commonmodifier_0330'), 500)
      let index_increase_button = await driver.waitForComponent(ON.id('index_increase_button_commonmodifier_0330'), 500)
      let index_decrease_button = await driver.waitForComponent(ON.id('index_decrease_button_commonmodifier_0330'), 500)

      // 步骤2：按下index++或index--按钮轮巡测试用例
      // 由于只有一个colorBlend值(Color.Orange)，测试按钮功能
      await Utils.sleep(200)

      // 尝试点击index++按钮（应该没有变化，因为只有一个值）
      await index_increase_button.click()
      await Utils.sleep(100)

      // 尝试点击index--按钮（应该没有变化，因为已经是第一个值）
      await index_decrease_button.click()
      await Utils.sleep(100)

      // 再次点击确保功能稳定
      await index_increase_button.click()
      await Utils.sleep(100)

      // 步骤3：对比是否与原生效果是否一致
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0330 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0340
     * @tc.name   : Commonattr commonmodifier
     * @tc.desc   : Verify commonattr commonmodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0340', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0340 start.`);

      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrCommonModifier/CommonAttrCommonModifier0340')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 查找组件
      let colorblend_component = await driver.waitForComponent(ON.id('colorblend_component_commonmodifier_0340'), 500)
      let index_increase_button = await driver.waitForComponent(ON.id('index_increase_button_commonmodifier_0340'), 500)
      let index_decrease_button = await driver.waitForComponent(ON.id('index_decrease_button_commonmodifier_0340'), 500)

      // 步骤2：按下index++或index--按钮轮巡测试用例
      // 由于只有一个colorBlend值("rgba(255, 100, 100, 0.5)")，测试按钮功能
      await Utils.sleep(200)

      // 尝试点击index++按钮（应该没有变化，因为只有一个值）
      await index_increase_button.click()
      await Utils.sleep(100)

      // 尝试点击index--按钮（应该没有变化，因为已经是第一个值）
      await index_decrease_button.click()
      await Utils.sleep(100)

      // 再次点击确保功能稳定
      await index_increase_button.click()
      await Utils.sleep(100)

      // 步骤3：对比是否与原生效果是否一致
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0340 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0350
     * @tc.name   : Commonattr commonmodifier
     * @tc.desc   : Verify commonattr commonmodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0350', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0350 start.`);

      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrCommonModifier/CommonAttrCommonModifier0350')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 查找组件
      let colorblend_component = await driver.waitForComponent(ON.id('colorblend_component_commonmodifier_0350'), 500)
      let index_increase_button = await driver.waitForComponent(ON.id('index_increase_button_commonmodifier_0350'), 500)
      let index_decrease_button = await driver.waitForComponent(ON.id('index_decrease_button_commonmodifier_0350'), 500)

      // 步骤2：按下index++或index--按钮轮巡测试用例
      // 由于只有一个colorBlend值(Color.Red)，测试按钮功能
      await Utils.sleep(200)

      // 尝试点击index++按钮（应该没有变化，因为只有一个值）
      await index_increase_button.click()
      await Utils.sleep(100)

      // 尝试点击index--按钮（应该没有变化，因为已经是第一个值）
      await index_decrease_button.click()
      await Utils.sleep(100)

      // 再次点击确保功能稳定
      await index_increase_button.click()
      await Utils.sleep(100)

      // 步骤3：对比是否与原生效果是否一致
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0350 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0360
     * @tc.name   : Commonattr commonmodifier
     * @tc.desc   : Verify commonattr commonmodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0360', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0360 start.`);

      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrCommonModifier/CommonAttrCommonModifier0360')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 查找组件
      let colorblend_component = await driver.waitForComponent(ON.id('colorblend_component_commonmodifier_0360'), 500)
      let index_increase_button = await driver.waitForComponent(ON.id('index_increase_button_commonmodifier_0360'), 500)
      let index_decrease_button = await driver.waitForComponent(ON.id('index_decrease_button_commonmodifier_0360'), 500)

      // 步骤2：按下index++或index--按钮轮巡测试用例
      // 由于只有一个colorBlend值(Color.Red)，测试按钮功能
      await Utils.sleep(200)

      // 尝试点击index++按钮（应该没有变化，因为只有一个值）
      await index_increase_button.click()
      await Utils.sleep(100)

      // 尝试点击index--按钮（应该没有变化，因为已经是第一个值）
      await index_decrease_button.click()
      await Utils.sleep(100)

      // 再次点击确保功能稳定
      await index_increase_button.click()
      await Utils.sleep(100)

      // 步骤3：对比是否与原生效果是否一致
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0360 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0370
     * @tc.name   : Commonattr commonmodifier
     * @tc.desc   : Verify commonattr commonmodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0370', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0370 start.`);

      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrCommonModifier/CommonAttrCommonModifier0370')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 查找组件
      let colorblend_component = await driver.waitForComponent(ON.id('colorblend_component_commonmodifier_0370'), 500)
      let index_increase_button = await driver.waitForComponent(ON.id('index_increase_button_commonmodifier_0370'), 500)
      let index_decrease_button = await driver.waitForComponent(ON.id('index_decrease_button_commonmodifier_0370'), 500)

      // 步骤2：按下index++或index--按钮轮巡测试用例
      // 由于只有一个colorBlend值("")，测试按钮功能
      await Utils.sleep(200)

      // 尝试点击index++按钮（应该没有变化，因为只有一个值）
      await index_increase_button.click()
      await Utils.sleep(100)

      // 尝试点击index--按钮（应该没有变化，因为已经是第一个值）
      await index_decrease_button.click()
      await Utils.sleep(100)

      // 再次点击确保功能稳定
      await index_increase_button.click()
      await Utils.sleep(100)

      // 步骤3：对比是否与原生效果是否一致
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0370 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0380
     * @tc.name   : Commonattr commonmodifier
     * @tc.desc   : Verify commonattr commonmodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0380', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0380 start.`);

      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrCommonModifier/CommonAttrCommonModifier0380')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 查找组件
      let colorblend_component = await driver.waitForComponent(ON.id('colorblend_component_commonmodifier_0380'), 500)
      let index_increase_button = await driver.waitForComponent(ON.id('index_increase_button_commonmodifier_0380'), 500)
      let index_decrease_button = await driver.waitForComponent(ON.id('index_decrease_button_commonmodifier_0380'), 500)

      // 步骤2：按下index++或index--按钮轮巡测试用例
      // 由于只有一个colorBlend值(undefined)，测试按钮功能
      await Utils.sleep(200)

      // 尝试点击index++按钮（应该没有变化，因为只有一个值）
      await index_increase_button.click()
      await Utils.sleep(100)

      // 尝试点击index--按钮（应该没有变化，因为已经是第一个值）
      await index_decrease_button.click()
      await Utils.sleep(100)

      // 再次点击确保功能稳定
      await index_increase_button.click()
      await Utils.sleep(100)

      // 步骤3：对比是否与原生效果是否一致
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0380 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0390
     * @tc.name   : Commonattr commonmodifier
     * @tc.desc   : Verify commonattr commonmodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0390', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0390 start.`);

      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrCommonModifier/CommonAttrCommonModifier0390')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 查找组件
      let colorblend_component = await driver.waitForComponent(ON.id('colorblend_component_commonmodifier_0390'), 500)
      let index_increase_button = await driver.waitForComponent(ON.id('index_increase_button_commonmodifier_0390'), 500)
      let index_decrease_button = await driver.waitForComponent(ON.id('index_decrease_button_commonmodifier_0390'), 500)

      // 步骤2：按下index++或index--按钮轮巡测试用例
      // 由于只有一个colorBlend值(Color.Blue)，测试按钮功能
      await Utils.sleep(200)

      // 尝试点击index++按钮（应该没有变化，因为只有一个值）
      await index_increase_button.click()
      await Utils.sleep(100)

      // 尝试点击index--按钮（应该没有变化，因为已经是第一个值）
      await index_decrease_button.click()
      await Utils.sleep(100)

      // 再次点击确保功能稳定
      await index_increase_button.click()
      await Utils.sleep(100)

      // 步骤3：对比是否与原生效果是否一致
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0390 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0400
     * @tc.name   : Commonattr commonmodifier
     * @tc.desc   : Verify commonattr commonmodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0400', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0400 start.`);

      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrCommonModifier/CommonAttrCommonModifier0400')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 查找组件
      let grayscale_component = await driver.waitForComponent(ON.id('grayscale_component_commonmodifier_0400'), 500)
      let index_increase_button = await driver.waitForComponent(ON.id('index_increase_button_commonmodifier_0400'), 500)
      let index_decrease_button = await driver.waitForComponent(ON.id('index_decrease_button_commonmodifier_0400'), 500)

      // 步骤2：按下index++或index--按钮轮巡测试用例
      // 由于只有一个grayscale值(0.3)，测试按钮功能
      await Utils.sleep(200)

      // 尝试点击index++按钮（应该没有变化，因为只有一个值）
      await index_increase_button.click()
      await Utils.sleep(100)

      // 尝试点击index--按钮（应该没有变化，因为已经是第一个值）
      await index_decrease_button.click()
      await Utils.sleep(100)

      // 再次点击确保功能稳定
      await index_increase_button.click()
      await Utils.sleep(100)

      // 步骤3：对比是否与原生效果是否一致
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0400 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0410
     * @tc.name   : Commonattr commonmodifier
     * @tc.desc   : Verify commonattr commonmodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0410', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0410 start.`);

      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrCommonModifier/CommonAttrCommonModifier0410')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 查找组件
      let grayscale_component = await driver.waitForComponent(ON.id('grayscale_component_commonmodifier_0410'), 500)
      let index_increase_button = await driver.waitForComponent(ON.id('index_increase_button_commonmodifier_0410'), 500)
      let index_decrease_button = await driver.waitForComponent(ON.id('index_decrease_button_commonmodifier_0410'), 500)

      // 步骤2：按下index++或index--按钮轮巡测试用例
      // 由于只有一个grayscale值(0.8)，测试按钮功能
      await Utils.sleep(200)

      // 尝试点击index++按钮（应该没有变化，因为只有一个值）
      await index_increase_button.click()
      await Utils.sleep(100)

      // 尝试点击index--按钮（应该没有变化，因为已经是第一个值）
      await index_decrease_button.click()
      await Utils.sleep(100)

      // 再次点击确保功能稳定
      await index_increase_button.click()
      await Utils.sleep(100)

      // 步骤3：对比是否与原生效果是否一致
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0410 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0420
     * @tc.name   : Commonattr commonmodifier
     * @tc.desc   : Verify commonattr commonmodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0420', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0420 start.`);

      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrCommonModifier/CommonAttrCommonModifier0420')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 查找组件
      let grayscale_component = await driver.waitForComponent(ON.id('grayscale_component_commonmodifier_0420'), 500)
      let index_increase_button = await driver.waitForComponent(ON.id('index_increase_button_commonmodifier_0420'), 500)
      let index_decrease_button = await driver.waitForComponent(ON.id('index_decrease_button_commonmodifier_0420'), 500)

      // 步骤2：按下index++或index--按钮轮巡测试用例
      // 由于只有一个grayscale值(1)，测试按钮功能
      await Utils.sleep(200)

      // 尝试点击index++按钮（应该没有变化，因为只有一个值）
      await index_increase_button.click()
      await Utils.sleep(100)

      // 尝试点击index--按钮（应该没有变化，因为已经是第一个值）
      await index_decrease_button.click()
      await Utils.sleep(100)

      // 再次点击确保功能稳定
      await index_increase_button.click()
      await Utils.sleep(100)

      // 步骤3：对比是否与原生效果是否一致
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0420 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0430
     * @tc.name   : Commonattr commonmodifier
     * @tc.desc   : Verify commonattr commonmodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0430', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0430 start.`);

      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrCommonModifier/CommonAttrCommonModifier0430')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 查找组件
      let grayscale_component = await driver.waitForComponent(ON.id('grayscale_component_commonmodifier_0430'), 500)
      let index_increase_button = await driver.waitForComponent(ON.id('index_increase_button_commonmodifier_0430'), 500)
      let index_decrease_button = await driver.waitForComponent(ON.id('index_decrease_button_commonmodifier_0430'), 500)

      // 步骤2：按下index++或index--按钮轮巡测试用例
      // 由于只有一个grayscale值(-1)，测试按钮功能
      await Utils.sleep(200)

      // 尝试点击index++按钮（应该没有变化，因为只有一个值）
      await index_increase_button.click()
      await Utils.sleep(100)

      // 尝试点击index--按钮（应该没有变化，因为已经是第一个值）
      await index_decrease_button.click()
      await Utils.sleep(100)

      // 再次点击确保功能稳定
      await index_increase_button.click()
      await Utils.sleep(100)

      // 步骤3：对比是否与原生效果是否一致
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0430 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0440
     * @tc.name   : Commonattr commonmodifier
     * @tc.desc   : Verify commonattr commonmodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0440', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0440 start.`);

      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrCommonModifier/CommonAttrCommonModifier0440')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 查找组件
      let grayscale_component = await driver.waitForComponent(ON.id('grayscale_component_commonmodifier_0440'), 500)
      let index_increase_button = await driver.waitForComponent(ON.id('index_increase_button_commonmodifier_0440'), 500)
      let index_decrease_button = await driver.waitForComponent(ON.id('index_decrease_button_commonmodifier_0440'), 500)

      // 步骤2：按下index++或index--按钮轮巡测试用例
      // 由于只有一个grayscale值(10)，测试按钮功能
      await Utils.sleep(200)

      // 尝试点击index++按钮（应该没有变化，因为只有一个值）
      await index_increase_button.click()
      await Utils.sleep(100)

      // 尝试点击index--按钮（应该没有变化，因为已经是第一个值）
      await index_decrease_button.click()
      await Utils.sleep(100)

      // 再次点击确保功能稳定
      await index_increase_button.click()
      await Utils.sleep(100)

      // 步骤3：对比是否与原生效果是否一致
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0440 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0450
     * @tc.name   : Commonattr commonmodifier
     * @tc.desc   : Verify commonattr commonmodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0450', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0450 start.`);

      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrCommonModifier/CommonAttrCommonModifier0450')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 查找组件
      let grayscale_component = await driver.waitForComponent(ON.id('grayscale_component_commonmodifier_0450'), 500)
      let index_increase_button = await driver.waitForComponent(ON.id('index_increase_button_commonmodifier_0450'), 500)
      let index_decrease_button = await driver.waitForComponent(ON.id('index_decrease_button_commonmodifier_0450'), 500)

      // 步骤2：按下index++或index--按钮轮巡测试用例
      // 由于只有一个grayscale值(0.05)，测试按钮功能
      await Utils.sleep(200)

      // 尝试点击index++按钮（应该没有变化，因为只有一个值）
      await index_increase_button.click()
      await Utils.sleep(100)

      // 尝试点击index--按钮（应该没有变化，因为已经是第一个值）
      await index_decrease_button.click()
      await Utils.sleep(100)

      // 再次点击确保功能稳定
      await index_increase_button.click()
      await Utils.sleep(100)

      // 步骤3：对比是否与原生效果是否一致
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0450 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0460
     * @tc.name   : Commonattr commonmodifier
     * @tc.desc   : Verify commonattr commonmodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0460', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0460 start.`);

      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrCommonModifier/CommonAttrCommonModifier0460')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 查找组件
      let grayscale_component = await driver.waitForComponent(ON.id('grayscale_component_commonmodifier_0460'), 500)
      let index_increase_button = await driver.waitForComponent(ON.id('index_increase_button_commonmodifier_0460'), 500)
      let index_decrease_button = await driver.waitForComponent(ON.id('index_decrease_button_commonmodifier_0460'), 500)

      // 步骤2：按下index++或index--按钮轮巡测试用例
      // 由于只有一个grayscale值(-10000)，测试按钮功能
      await Utils.sleep(200)

      // 尝试点击index++按钮（应该没有变化，因为只有一个值）
      await index_increase_button.click()
      await Utils.sleep(100)

      // 尝试点击index--按钮（应该没有变化，因为已经是第一个值）
      await index_decrease_button.click()
      await Utils.sleep(100)

      // 再次点击确保功能稳定
      await index_increase_button.click()
      await Utils.sleep(100)

      // 步骤3：对比是否与原生效果是否一致
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0460 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0470
     * @tc.name   : Commonattr commonmodifier
     * @tc.desc   : Verify commonattr commonmodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0470', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0470 start.`);

      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrCommonModifier/CommonAttrCommonModifier0470')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 查找组件
      let grayscale_component = await driver.waitForComponent(ON.id('grayscale_component_commonmodifier_0470'), 500)
      let index_increase_button = await driver.waitForComponent(ON.id('index_increase_button_commonmodifier_0470'), 500)
      let index_decrease_button = await driver.waitForComponent(ON.id('index_decrease_button_commonmodifier_0470'), 500)

      // 步骤2：按下index++或index--按钮轮巡测试用例
      // 由于只有一个grayscale值(undefined)，测试按钮功能
      await Utils.sleep(200)

      // 尝试点击index++按钮（应该没有变化，因为只有一个值）
      await index_increase_button.click()
      await Utils.sleep(100)

      // 尝试点击index--按钮（应该没有变化，因为已经是第一个值）
      await index_decrease_button.click()
      await Utils.sleep(100)

      // 再次点击确保功能稳定
      await index_increase_button.click()
      await Utils.sleep(100)

      // 步骤3：对比是否与原生效果是否一致
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0470 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0480
     * @tc.name   : Commonattr commonmodifier
     * @tc.desc   : Verify commonattr commonmodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0480', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0480 start.`);

      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrCommonModifier/CommonAttrCommonModifier0480')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 查找组件
      let grayscale_component = await driver.waitForComponent(ON.id('grayscale_component_commonmodifier_0480'), 500)
      let index_increase_button = await driver.waitForComponent(ON.id('index_increase_button_commonmodifier_0480'), 500)
      let index_decrease_button = await driver.waitForComponent(ON.id('index_decrease_button_commonmodifier_0480'), 500)

      // 步骤2：按下index++或index--按钮轮巡测试用例
      // 由于只有一个grayscale值(10000)，测试按钮功能
      await Utils.sleep(200)

      // 尝试点击index++按钮（应该没有变化，因为只有一个值）
      await index_increase_button.click()
      await Utils.sleep(100)

      // 尝试点击index--按钮（应该没有变化，因为已经是第一个值）
      await index_decrease_button.click()
      await Utils.sleep(100)

      // 再次点击确保功能稳定
      await index_increase_button.click()
      await Utils.sleep(100)

      // 步骤3：对比是否与原生效果是否一致
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0480 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0490
     * @tc.name   : Commonattr commonmodifier
     * @tc.desc   : Verify commonattr commonmodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0490', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0490 start.`);

      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrCommonModifier/CommonAttrCommonModifier0490')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 查找组件
      let contrast_component = await driver.waitForComponent(ON.id('contrast_component_commonmodifier_0490'), 500)
      let index_increase_button = await driver.waitForComponent(ON.id('index_increase_button_commonmodifier_0490'), 500)
      let index_decrease_button = await driver.waitForComponent(ON.id('index_decrease_button_commonmodifier_0490'), 500)

      // 步骤2：按下index++或index--按钮轮巡测试用例
      // 由于只有一个contrast值(0.3)，测试按钮功能
      await Utils.sleep(200)

      // 尝试点击index++按钮（应该没有变化，因为只有一个值）
      await index_increase_button.click()
      await Utils.sleep(100)

      // 尝试点击index--按钮（应该没有变化，因为已经是第一个值）
      await index_decrease_button.click()
      await Utils.sleep(100)

      // 再次点击确保功能稳定
      await index_increase_button.click()
      await Utils.sleep(100)

      // 步骤3：对比是否与原生效果是否一致
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0490 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0500
     * @tc.name   : Commonattr commonmodifier
     * @tc.desc   : Verify commonattr commonmodifier interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0500', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0500 start.`);

      // 步骤1：启动应用
      Settings.createWindow('testability/pages/component/common_attr/CommonAttrCommonModifier/CommonAttrCommonModifier0500')
      let driver = await Driver.create()
      await Utils.sleep(500)

      // 查找组件
      let contrast_component = await driver.waitForComponent(ON.id('contrast_component_commonmodifier_0500'), 500)
      let index_increase_button = await driver.waitForComponent(ON.id('index_increase_button_commonmodifier_0500'), 500)
      let index_decrease_button = await driver.waitForComponent(ON.id('index_decrease_button_commonmodifier_0500'), 500)

      // 步骤2：按下index++或index--按钮轮巡测试用例
      // 由于只有一个contrast值(0.8)，测试按钮功能
      await Utils.sleep(200)

      // 尝试点击index++按钮（应该没有变化，因为只有一个值）
      await index_increase_button.click()
      await Utils.sleep(100)

      // 尝试点击index--按钮（应该没有变化，因为已经是第一个值）
      await index_decrease_button.click()
      await Utils.sleep(100)

      // 再次点击确保功能稳定
      await index_increase_button.click()
      await Utils.sleep(100)

      // 步骤3：对比是否与原生效果是否一致
      await windowSnap.snapShot()
      await Utils.sleep(1000)

      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COMMONATTR_COMMONMODIFIER_0500 finish.`);
      done()
    })
  })
}
   