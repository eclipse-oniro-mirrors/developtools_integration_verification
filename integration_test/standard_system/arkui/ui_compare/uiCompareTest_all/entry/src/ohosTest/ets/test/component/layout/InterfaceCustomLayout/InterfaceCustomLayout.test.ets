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

export default function interfaceCustomLayout() {

  describe('interfaceCustomLayout', () => {
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
     * @tc.number : SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0010
     * @tc.name   : Attributes statestyles interface customlayout
     * @tc.desc   : Verify attributes statestyles interface customlayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0010 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/layout/InterfaceCustomLayout/InterfaceCustomLayout0010')
      let driver = await Driver.create()
      await Utils.sleep(500)
      
      // 步骤2：查找自定义组件
      let custom_layout_component_0010 = await driver.waitForComponent(ON.id('custom_layout_component_0010'), 500)
      
      // 步骤3：等待onMeasureSize执行并显示margin信息
      await Utils.sleep(1000)
      
      // 步骤4：验证margin信息显示
      let rich_editor_customlayout_0010 = await driver.waitForComponent(ON.id('rich_editor_customlayout_0010'), 500)
      
      // 预期结果：截图验证margin信息正确显示
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0010 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0020
     * @tc.name   : Attributes statestyles interface customlayout
     * @tc.desc   : Verify attributes statestyles interface customlayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0020 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/layout/InterfaceCustomLayout/InterfaceCustomLayout0020')
      let driver = await Driver.create()
      await Utils.sleep(500)
      
      // 步骤2：查找自定义组件
      let custom_layout_padding_component_0020 = await driver.waitForComponent(ON.id('custom_layout_padding_component_0020'), 500)
      
      // 步骤3：等待onMeasureSize执行并显示padding信息
      await Utils.sleep(1000)
      
      // 步骤4：验证padding信息显示
      let rich_editor_customlayout_0020 = await driver.waitForComponent(ON.id('rich_editor_customlayout_0020'), 500)
      
      // 预期结果：截图验证padding信息正确显示
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0030
     * @tc.name   : Attributes statestyles interface customlayout
     * @tc.desc   : Verify attributes statestyles interface customlayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0030 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/layout/InterfaceCustomLayout/InterfaceCustomLayout0030')
      let driver = await Driver.create()
      await Utils.sleep(500)
      
      // 步骤2：查找自定义组件
      let custom_layout_borderwidth_component_0030 = await driver.waitForComponent(ON.id('custom_layout_borderwidth_component_0030'), 500)
      
      // 步骤3：等待onMeasureSize执行并显示borderWidth信息
      await Utils.sleep(1000)
      
      // 步骤4：验证borderWidth信息显示
      let rich_editor_customlayout_0030 = await driver.waitForComponent(ON.id('rich_editor_customlayout_0030'), 500)
      
      // 预期结果：截图验证borderWidth信息正确显示
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0050
     * @tc.name   : Attributes statestyles interface customlayout
     * @tc.desc   : Verify attributes statestyles interface customlayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0050 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/layout/InterfaceCustomLayout/InterfaceCustomLayout0050')
      let driver = await Driver.create()
      await Utils.sleep(500)
      
      // 步骤2：查找自定义组件
      let custom_layout_default_component_0050 = await driver.waitForComponent(ON.id('custom_layout_default_component_0050'), 500)
      
      // 步骤3：等待页面渲染完成
      await Utils.sleep(1000)
      
      // 步骤4：验证子组件默认布局效果
      let rich_editor_customlayout_0050 = await driver.waitForComponent(ON.id('rich_editor_customlayout_0050'), 500)
      
      // 预期结果：截图验证子组件按默认布局能力布局
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0050 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0070
     * @tc.name   : Attributes statestyles interface customlayout
     * @tc.desc   : Verify attributes statestyles interface customlayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0070 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/layout/InterfaceCustomLayout/InterfaceCustomLayout0070')
      let driver = await Driver.create()
      await Utils.sleep(500)
      
      // 步骤2：查找自定义组件
      let custom_layout_minwidth_component_0070 = await driver.waitForComponent(ON.id('custom_layout_minwidth_component_0070'), 500)
      
      // 步骤3：等待onMeasureSize执行并显示constraint信息
      await Utils.sleep(1000)
      
      // 步骤4：验证constraint.minWidth信息显示
      let rich_editor_customlayout_0070 = await driver.waitForComponent(ON.id('rich_editor_customlayout_0070'), 500)
      
      // 预期结果：截图验证constraint.minWidth值与父组件约束相同
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0070 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0080
     * @tc.name   : Attributes statestyles interface customlayout
     * @tc.desc   : Verify attributes statestyles interface customlayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0080 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/layout/InterfaceCustomLayout/InterfaceCustomLayout0080')
      let driver = await Driver.create()
      await Utils.sleep(500)
      
      // 步骤2：查找自定义组件
      let custom_layout_maxwidth_component_0080 = await driver.waitForComponent(ON.id('custom_layout_maxwidth_component_0080'), 500)
      
      // 步骤3：等待onMeasureSize执行并显示constraint信息
      await Utils.sleep(1000)
      
      // 步骤4：验证constraint.maxWidth信息显示
      let rich_editor_customlayout_0080 = await driver.waitForComponent(ON.id('rich_editor_customlayout_0080'), 500)
      
      // 预期结果：截图验证constraint.maxWidth值与父组件约束相同
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0090
     * @tc.name   : Attributes statestyles interface customlayout
     * @tc.desc   : Verify attributes statestyles interface customlayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0090 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/layout/InterfaceCustomLayout/InterfaceCustomLayout0090')
      let driver = await Driver.create()
      await Utils.sleep(500)
      
      // 步骤2：查找自定义组件
      let custom_layout_minheight_component_0090 = await driver.waitForComponent(ON.id('custom_layout_minheight_component_0090'), 500)
      
      // 步骤3：等待onMeasureSize执行并显示constraint信息
      await Utils.sleep(1000)
      
      // 步骤4：验证constraint.minHeight信息显示
      let rich_editor_customlayout_0090 = await driver.waitForComponent(ON.id('rich_editor_customlayout_0090'), 500)
      
      // 预期结果：截图验证constraint.minHeight值与父组件约束相同
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0100
     * @tc.name   : Attributes statestyles interface customlayout
     * @tc.desc   : Verify attributes statestyles interface customlayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0100 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/layout/InterfaceCustomLayout/InterfaceCustomLayout0100')
      let driver = await Driver.create()
      await Utils.sleep(500)
      
      // 步骤2：查找自定义组件
      let custom_layout_maxheight_component_0100 = await driver.waitForComponent(ON.id('custom_layout_maxheight_component_0100'), 500)
      
      // 步骤3：等待onMeasureSize执行并显示constraint信息
      await Utils.sleep(1000)
      
      // 步骤4：验证constraint.maxHeight信息显示
      let rich_editor_customlayout_0100 = await driver.waitForComponent(ON.id('rich_editor_customlayout_0100'), 500)
      
      // 预期结果：截图验证constraint.maxHeight值与父组件约束相同
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0100 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0110
     * @tc.name   : Attributes statestyles interface customlayout
     * @tc.desc   : Verify attributes statestyles interface customlayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0110 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/layout/InterfaceCustomLayout/InterfaceCustomLayout0110')
      let driver = await Driver.create()
      await Utils.sleep(500)
      
      // 步骤2：查找自定义组件
      let custom_layout_placechildren_margin_component_0110 = await driver.waitForComponent(ON.id('custom_layout_placechildren_margin_component_0110'), 500)
      
      // 步骤3：等待onPlaceChildren执行并显示margin信息
      await Utils.sleep(1000)
      
      // 步骤4：验证margin信息显示
      let rich_editor_customlayout_0110 = await driver.waitForComponent(ON.id('rich_editor_customlayout_0110'), 500)
      
      // 预期结果：截图验证onPlaceChildren中margin信息正确显示
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0120
     * @tc.name   : Attributes statestyles interface customlayout
     * @tc.desc   : Verify attributes statestyles interface customlayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0120 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/layout/InterfaceCustomLayout/InterfaceCustomLayout0120')
      let driver = await Driver.create()
      await Utils.sleep(500)
      
      // 步骤2：查找自定义组件
      let custom_layout_placechildren_padding_component_0120 = await driver.waitForComponent(ON.id('custom_layout_placechildren_padding_component_0120'), 500)
      
      // 步骤3：等待onPlaceChildren执行并显示padding信息
      await Utils.sleep(1000)
      
      // 步骤4：验证padding信息显示
      let rich_editor_customlayout_0120 = await driver.waitForComponent(ON.id('rich_editor_customlayout_0120'), 500)
      
      // 预期结果：截图验证onPlaceChildren中padding信息正确显示
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0130
     * @tc.name   : Attributes statestyles interface customlayout
     * @tc.desc   : Verify attributes statestyles interface customlayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0130 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/layout/InterfaceCustomLayout/InterfaceCustomLayout0130')
      let driver = await Driver.create()
      await Utils.sleep(500)
      
      // 步骤2：查找自定义组件
      let custom_layout_placechildren_borderwidth_component_0130 = await driver.waitForComponent(ON.id('custom_layout_placechildren_borderwidth_component_0130'), 500)
      
      // 步骤3：等待onPlaceChildren执行并显示borderWidth信息
      await Utils.sleep(1000)
      
      // 步骤4：验证borderWidth信息显示
      let rich_editor_customlayout_0130 = await driver.waitForComponent(ON.id('rich_editor_customlayout_0130'), 500)
      
      // 预期结果：截图验证onPlaceChildren中borderWidth信息正确显示
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0130 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0150
     * @tc.name   : Attributes statestyles interface customlayout
     * @tc.desc   : Verify attributes statestyles interface customlayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0150 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/layout/InterfaceCustomLayout/InterfaceCustomLayout0150')
      let driver = await Driver.create()
      await Utils.sleep(500)
      
      // 步骤2：查找自定义组件
      let custom_layout_placechildren_default_component_0150 = await driver.waitForComponent(ON.id('custom_layout_placechildren_default_component_0150'), 500)
      
      // 步骤3：等待页面渲染完成
      await Utils.sleep(1000)
      
      // 步骤4：验证子组件默认布局效果
      let rich_editor_customlayout_0150 = await driver.waitForComponent(ON.id('rich_editor_customlayout_0150'), 500)
      
      // 预期结果：截图验证子组件按默认布局能力布局
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0150 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0170
     * @tc.name   : Attributes statestyles interface customlayout
     * @tc.desc   : Verify attributes statestyles interface customlayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0170', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0170 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/layout/InterfaceCustomLayout/InterfaceCustomLayout0170')
      let driver = await Driver.create()
      await Utils.sleep(500)
      
      // 步骤2：查找自定义组件
      let custom_layout_children_width_component_0170 = await driver.waitForComponent(ON.id('custom_layout_children_width_component_0170'), 500)
      
      // 步骤3：等待onPlaceChildren执行并显示子组件宽度信息
      await Utils.sleep(1000)
      
      // 步骤4：验证子组件测量后宽度信息显示
      let rich_editor_customlayout_0170 = await driver.waitForComponent(ON.id('rich_editor_customlayout_0170'), 500)
      
      // 预期结果：截图验证Children.MeasureResult.width值符合子组件测量后宽度值
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0170 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0180
     * @tc.name   : Attributes statestyles interface customlayout
     * @tc.desc   : Verify attributes statestyles interface customlayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0180', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0180 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/layout/InterfaceCustomLayout/InterfaceCustomLayout0180')
      let driver = await Driver.create()
      await Utils.sleep(500)
      
      // 步骤2：查找自定义组件
      let custom_layout_children_height_component_0180 = await driver.waitForComponent(ON.id('custom_layout_children_height_component_0180'), 500)
      
      // 步骤3：等待onPlaceChildren执行并显示子组件高度信息
      await Utils.sleep(1000)
      
      // 步骤4：验证子组件测量后高度信息显示
      let rich_editor_customlayout_0180 = await driver.waitForComponent(ON.id('rich_editor_customlayout_0180'), 500)
      
      // 预期结果：截图验证Children.MeasureResult.height值符合子组件测量后高度值
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0180 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0190
     * @tc.name   : Attributes statestyles interface customlayout
     * @tc.desc   : Verify attributes statestyles interface customlayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0190', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0190 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/layout/InterfaceCustomLayout/InterfaceCustomLayout0190')
      let driver = await Driver.create()
      await Utils.sleep(500)
      
      // 步骤2：查找自定义组件
      let custom_layout_placechildren_minwidth_component_0190 = await driver.waitForComponent(ON.id('custom_layout_placechildren_minwidth_component_0190'), 500)
      
      // 步骤3：等待onPlaceChildren执行并显示constraint信息
      await Utils.sleep(1000)
      
      // 步骤4：验证constraint.minWidth信息显示
      let rich_editor_customlayout_0190 = await driver.waitForComponent(ON.id('rich_editor_customlayout_0190'), 500)
      
      // 预期结果：截图验证onPlaceChildren中constraint.minWidth值与父组件约束相同
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0190 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0200
     * @tc.name   : Attributes statestyles interface customlayout
     * @tc.desc   : Verify attributes statestyles interface customlayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0200', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0200 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/layout/InterfaceCustomLayout/InterfaceCustomLayout0200')
      let driver = await Driver.create()
      await Utils.sleep(500)
      
      // 步骤2：查找自定义组件
      let custom_layout_placechildren_maxwidth_component_0200 = await driver.waitForComponent(ON.id('custom_layout_placechildren_maxwidth_component_0200'), 500)
      
      // 步骤3：等待onPlaceChildren执行并显示constraint信息
      await Utils.sleep(1000)
      
      // 步骤4：验证constraint.maxWidth信息显示
      let rich_editor_customlayout_0200 = await driver.waitForComponent(ON.id('rich_editor_customlayout_0200'), 500)
      
      // 预期结果：截图验证onPlaceChildren中constraint.maxWidth值与父组件约束相同
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0200 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0210
     * @tc.name   : Attributes statestyles interface customlayout
     * @tc.desc   : Verify attributes statestyles interface customlayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0210', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0210 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/layout/InterfaceCustomLayout/InterfaceCustomLayout0210')
      let driver = await Driver.create()
      await Utils.sleep(500)
      
      // 步骤2：查找自定义组件
      let custom_layout_placechildren_minheight_component_0210 = await driver.waitForComponent(ON.id('custom_layout_placechildren_minheight_component_0210'), 500)
      
      // 步骤3：等待onPlaceChildren执行并显示constraint信息
      await Utils.sleep(1000)
      
      // 步骤4：验证constraint.minHeight信息显示
      let rich_editor_customlayout_0210 = await driver.waitForComponent(ON.id('rich_editor_customlayout_0210'), 500)
      
      // 预期结果：截图验证onPlaceChildren中constraint.minHeight值与父组件约束相同
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0210 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0220
     * @tc.name   : Attributes statestyles interface customlayout
     * @tc.desc   : Verify attributes statestyles interface customlayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0220', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0220 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/layout/InterfaceCustomLayout/InterfaceCustomLayout0220')
      let driver = await Driver.create()
      await Utils.sleep(500)
      
      // 步骤2：查找自定义组件
      let custom_layout_placechildren_maxheight_component_0220 = await driver.waitForComponent(ON.id('custom_layout_placechildren_maxheight_component_0220'), 500)
      
      // 步骤3：等待onPlaceChildren执行并显示constraint信息
      await Utils.sleep(1000)
      
      // 步骤4：验证constraint.maxHeight信息显示
      let rich_editor_customlayout_0220 = await driver.waitForComponent(ON.id('rich_editor_customlayout_0220'), 500)
      
      // 预期结果：截图验证onPlaceChildren中constraint.maxHeight值与父组件约束相同
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0220 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0250
     * @tc.name   : Attributes statestyles interface customlayout
     * @tc.desc   : Verify attributes statestyles interface customlayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0250', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0250 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/layout/InterfaceCustomLayout/InterfaceCustomLayout0250')
      let driver = await Driver.create()
      await Utils.sleep(500)
      
      // 步骤2：查找自定义组件（传入宽度为50%）
      let custom_layout_percentage_component_0250 = await driver.waitForComponent(ON.id('custom_layout_percentage_component_0250'), 500)
      
      // 步骤3：等待onMeasureSize和onPlaceChildren执行并显示宽高信息
      await Utils.sleep(1000)
      
      // 步骤4：验证百分比宽高的实际值信息显示
      let rich_editor_customlayout_0250 = await driver.waitForComponent(ON.id('rich_editor_customlayout_0250'), 500)
      
      // 预期结果：截图验证百分比宽高属性返回的是实际宽高值
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0250 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0260
     * @tc.name   : Attributes statestyles interface customlayout
     * @tc.desc   : Verify attributes statestyles interface customlayout interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0260', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0260 start.`);
      // 步骤1：页面初始化
      Settings.createWindow('testability/pages/component/layout/InterfaceCustomLayout/InterfaceCustomLayout0260')
      let driver = await Driver.create()
      await Utils.sleep(500)
      
      // 步骤2：查找自定义组件
      let custom_layout_unit_consistency_component_0260 = await driver.waitForComponent(ON.id('custom_layout_unit_consistency_component_0260'), 500)
      
      // 步骤3：等待onPlaceChildren执行并显示各参数信息
      await Utils.sleep(1000)
      
      // 步骤4：验证各参数单位一致性信息显示
      let rich_editor_customlayout_0260 = await driver.waitForComponent(ON.id('rich_editor_customlayout_0260'), 500)
      
      // 预期结果：截图验证selfLayoutInfo打印值的单位与MeasureResult、constraint保持一致
      await windowSnap.snapShot()
      await Utils.sleep(1000)
      
      Logger.info('TEST', `SUB_ACE_UI_ATTRIBUTES_STATESTYLES_INTERFACE__CUSTOMLAYOUT_0260 finish.`);
      done()
    })



  })
}