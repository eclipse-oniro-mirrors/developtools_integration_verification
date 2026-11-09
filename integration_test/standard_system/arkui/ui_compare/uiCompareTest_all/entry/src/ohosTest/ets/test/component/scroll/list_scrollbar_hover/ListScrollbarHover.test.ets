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
import { BusinessError } from '@kit.BasicServicesKit'

export default function listScrollbarHoverTest () {

  describe('listScrollbarHoverTest', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        return
      }

      Settings.windowClass.destroyWindow((err:BusinessError) => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_LIST_SACROLLBAR_HOVER_0030
     * @tc.name   : List scrollbar hover test - change color
     * @tc.desc   : Verify list sacrollbar hover interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LIST_SACROLLBAR_HOVER_0030', Level.LEVEL3, async (done: Function) => {
      console.log('SUB_ACE_UI_COMPONENT_LIST_SACROLLBAR_HOVER_0030 start');
      Settings.createWindow('testability/pages/component/scroll/list_scrollbar_hover/listScrollbarHover01')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(200, 500);
      await driver.assertComponentExist(ON.text('List滚动条悬浮测试0030'));
      await windowSnap.snapShot('ListScrollbarHover0030_1');
      await Utils.sleep(1000);

      // 点击改变滚动条颜色按钮
      let colorButton: Component = await driver.waitForComponent(ON.id('change_color_button_03'), 1000);
      await colorButton.click();
      await driver.waitForIdle(500, 2000);
      await windowSnap.snapShot('ListScrollbarHover0030_2');
      await Utils.sleep(1000);

      // 再次点击改变颜色
      await colorButton.click();
      await driver.waitForIdle(500, 2000);
      await windowSnap.snapShot('ListScrollbarHover0030_3');
      await Utils.sleep(1000);

      console.log('SUB_ACE_UI_COMPONENT_LIST_SACROLLBAR_HOVER_0030 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LIST_SACROLLBAR_HOVER_0050
     * @tc.name   : List scrollbar hover test - change layout direction
     * @tc.desc   : Verify list sacrollbar hover interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LIST_SACROLLBAR_HOVER_0050', Level.LEVEL3, async (done: Function) => {
      console.log('SUB_ACE_UI_COMPONENT_LIST_SACROLLBAR_HOVER_0050 start');
      Settings.createWindow('testability/pages/component/scroll/list_scrollbar_hover/listScrollbarHover02')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(200, 500);
      await driver.assertComponentExist(ON.text('List滚动条悬浮测试0050'));
      await windowSnap.snapShot('ListScrollbarHover0050_1');
      await Utils.sleep(1000);

      // 点击改变布局方向按钮
      let directionButton: Component = await driver.waitForComponent(ON.id('change_direction_button_05'), 1000);
      await directionButton.click();
      await driver.waitForIdle(500, 2000);
      await windowSnap.snapShot('ListScrollbarHover0050_2');
      await Utils.sleep(1000);

      // 再次点击改变方向
      await directionButton.click();
      await driver.waitForIdle(500, 2000);
      await windowSnap.snapShot('ListScrollbarHover0050_3');
      await Utils.sleep(1000);

      console.log('SUB_ACE_UI_COMPONENT_LIST_SACROLLBAR_HOVER_0050 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LIST_SACROLLBAR_HOVER_0100
     * @tc.name   : List scrollbar hover test - Image component state change
     * @tc.desc   : Verify list sacrollbar hover interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LIST_SACROLLBAR_HOVER_0100', Level.LEVEL3, async (done: Function) => {
      console.log('SUB_ACE_UI_COMPONENT_LIST_SACROLLBAR_HOVER_0100 start');
      Settings.createWindow('testability/pages/component/scroll/list_scrollbar_hover/listScrollbarHover03')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(200, 500);
      await driver.assertComponentExist(ON.text('List滚动条悬浮测试0100'));
      await windowSnap.snapShot('ListScrollbarHover0100_1');
      await Utils.sleep(1000);

      // 点击改变滚动条状态按钮
      let stateButton: Component = await driver.waitForComponent(ON.id('change_state_button_10'), 1000);
      await stateButton.click();
      await driver.waitForIdle(500, 2000);
      await windowSnap.snapShot('ListScrollbarHover0100_2');
      await Utils.sleep(1000);

      // 再次点击改变状态
      await stateButton.click();
      await driver.waitForIdle(500, 2000);
      await windowSnap.snapShot('ListScrollbarHover0100_3');
      await Utils.sleep(1000);

      console.log('SUB_ACE_UI_COMPONENT_LIST_SACROLLBAR_HOVER_0100 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LIST_SACROLLBAR_HOVER_0040
     * @tc.name   : List scrollbar hover test - change width
     * @tc.desc   : Verify list sacrollbar hover interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LIST_SACROLLBAR_HOVER_0040', Level.LEVEL3, async (done: Function) => {
      console.log('SUB_ACE_UI_COMPONENT_LIST_SACROLLBAR_HOVER_0040 start');
      Settings.createWindow('testability/pages/component/scroll/list_scrollbar_hover/listScrollbarHover04')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(200, 500);
      await driver.assertComponentExist(ON.text('List滚动条悬浮测试0040'));
      await windowSnap.snapShot('ListScrollbarHover0040_1');
      await Utils.sleep(1000);

      // 点击改变滚动条宽度按钮
      let widthButton: Component = await driver.waitForComponent(ON.id('change_width_button_04'), 1000);
      await widthButton.click();
      await driver.waitForIdle(500, 2000);
      await windowSnap.snapShot('ListScrollbarHover0040_2');
      await Utils.sleep(1000);

      // 再次点击改变宽度
      await widthButton.click();
      await driver.waitForIdle(500, 2000);
      await windowSnap.snapShot('ListScrollbarHover0040_3');
      await Utils.sleep(1000);

      console.log('SUB_ACE_UI_COMPONENT_LIST_SACROLLBAR_HOVER_0040 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LIST_SACROLLBAR_HOVER_0060
     * @tc.name   : List scrollbar hover test - change direction
     * @tc.desc   : Verify list sacrollbar hover interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LIST_SACROLLBAR_HOVER_0060', Level.LEVEL3, async (done: Function) => {
      console.log('SUB_ACE_UI_COMPONENT_LIST_SACROLLBAR_HOVER_0060 start');
      Settings.createWindow('testability/pages/component/scroll/list_scrollbar_hover/listScrollbarHover05')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(200, 500);
      await driver.assertComponentExist(ON.text('List滚动条悬浮测试0060'));
      await windowSnap.snapShot('ListScrollbarHover0060_1');
      await Utils.sleep(1000);

      // 点击改变direction按钮
      let directionButton: Component = await driver.waitForComponent(ON.id('change_direction_button_06'), 1000);
      await directionButton.click();
      await driver.waitForIdle(500, 2000);
      await windowSnap.snapShot('ListScrollbarHover0060_2');
      await Utils.sleep(1000);

      // 再次点击改变direction
      await directionButton.click();
      await driver.waitForIdle(500, 2000);
      await windowSnap.snapShot('ListScrollbarHover0060_3');
      await Utils.sleep(1000);

      console.log('SUB_ACE_UI_COMPONENT_LIST_SACROLLBAR_HOVER_0060 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LIST_SACROLLBAR_HOVER_0080
     * @tc.name   : List scrollbar hover test - Text component state change
     * @tc.desc   : Verify list sacrollbar hover interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LIST_SACROLLBAR_HOVER_0080', Level.LEVEL3, async (done: Function) => {
      console.log('SUB_ACE_UI_COMPONENT_LIST_SACROLLBAR_HOVER_0080 start');
      Settings.createWindow('testability/pages/component/scroll/list_scrollbar_hover/listScrollbarHover06')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(200, 500);
      await driver.assertComponentExist(ON.text('List滚动条悬浮测试0080'));
      await windowSnap.snapShot('ListScrollbarHover0080_1');
      await Utils.sleep(1000);

      // 点击改变滚动条状态按钮
      let stateButton: Component = await driver.waitForComponent(ON.id('change_state_button_08'), 1000);
      await stateButton.click();
      await driver.waitForIdle(500, 2000);
      await windowSnap.snapShot('ListScrollbarHover0080_2');
      await Utils.sleep(1000);

      // 再次点击改变状态
      await stateButton.click();
      await driver.waitForIdle(500, 2000);
      await windowSnap.snapShot('ListScrollbarHover0080_3');
      await Utils.sleep(1000);

      console.log('SUB_ACE_UI_COMPONENT_LIST_SACROLLBAR_HOVER_0080 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LIST_SACROLLBAR_HOVER_0130
     * @tc.name   : List scrollbar hover test - Text component direction change
     * @tc.desc   : Verify list sacrollbar hover interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LIST_SACROLLBAR_HOVER_0130', Level.LEVEL3, async (done: Function) => {
      console.log('SUB_ACE_UI_COMPONENT_LIST_SACROLLBAR_HOVER_0130 start');
      Settings.createWindow('testability/pages/component/scroll/list_scrollbar_hover/listScrollbarHover07')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(200, 500);
      await driver.assertComponentExist(ON.text('List滚动条悬浮测试0130'));
      await windowSnap.snapShot('ListScrollbarHover0130_1');
      await Utils.sleep(1000);

      // 点击改变direction按钮
      let directionButton: Component = await driver.waitForComponent(ON.id('change_direction_button_13'), 1000);
      await directionButton.click();
      await driver.waitForIdle(500, 2000);
      await windowSnap.snapShot('ListScrollbarHover0130_2');
      await Utils.sleep(1000);

      // 再次点击改变direction
      await directionButton.click();
      await driver.waitForIdle(500, 2000);
      await windowSnap.snapShot('ListScrollbarHover0130_3');
      await Utils.sleep(1000);

      console.log('SUB_ACE_UI_COMPONENT_LIST_SACROLLBAR_HOVER_0130 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LIST_SACROLLBAR_HOVER_0110
     * @tc.name   : List scrollbar hover test - Text component layout direction change
     * @tc.desc   : Verify list sacrollbar hover interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LIST_SACROLLBAR_HOVER_0110', Level.LEVEL3, async (done: Function) => {
      console.log('SUB_ACE_UI_COMPONENT_LIST_SACROLLBAR_HOVER_0110 start');
      Settings.createWindow('testability/pages/component/scroll/list_scrollbar_hover/listScrollbarHover08')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(200, 500);
      await driver.assertComponentExist(ON.text('List滚动条悬浮测试0110'));
      await windowSnap.snapShot('ListScrollbarHover0110_1');
      await Utils.sleep(1000);

      // 点击改变布局方向按钮
      let directionButton: Component = await driver.waitForComponent(ON.id('change_direction_button_11'), 1000);
      await directionButton.click();
      await driver.waitForIdle(500, 2000);
      await windowSnap.snapShot('ListScrollbarHover0110_2');
      await Utils.sleep(1000);

      // 再次点击改变方向
      await directionButton.click();
      await driver.waitForIdle(500, 2000);
      await windowSnap.snapShot('ListScrollbarHover0110_3');
      await Utils.sleep(1000);

      console.log('SUB_ACE_UI_COMPONENT_LIST_SACROLLBAR_HOVER_0110 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LIST_SACROLLBAR_HOVER_0120
     * @tc.name   : List scrollbar hover test - Image component layout direction change
     * @tc.desc   : Verify list sacrollbar hover interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LIST_SACROLLBAR_HOVER_0120', Level.LEVEL3, async (done: Function) => {
      console.log('SUB_ACE_UI_COMPONENT_LIST_SACROLLBAR_HOVER_0120 start');
      Settings.createWindow('testability/pages/component/scroll/list_scrollbar_hover/listScrollbarHover09')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(200, 500);
      await driver.assertComponentExist(ON.text('List滚动条悬浮测试0120'));
      await windowSnap.snapShot('ListScrollbarHover0120_1');
      await Utils.sleep(1000);

      // 点击改变布局方向按钮
      let directionButton: Component = await driver.waitForComponent(ON.id('change_direction_button_12'), 1000);
      await directionButton.click();
      await driver.waitForIdle(500, 2000);
      await windowSnap.snapShot('ListScrollbarHover0120_2');
      await Utils.sleep(1000);

      // 再次点击改变方向
      await directionButton.click();
      await driver.waitForIdle(500, 2000);
      await windowSnap.snapShot('ListScrollbarHover0120_3');
      await Utils.sleep(1000);

      console.log('SUB_ACE_UI_COMPONENT_LIST_SACROLLBAR_HOVER_0120 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LIST_SACROLLBAR_HOVER_0140
     * @tc.name   : List scrollbar hover test - Image component direction change
     * @tc.desc   : Verify list sacrollbar hover interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_LIST_SACROLLBAR_HOVER_0140', Level.LEVEL3, async (done: Function) => {
      console.log('SUB_ACE_UI_COMPONENT_LIST_SACROLLBAR_HOVER_0140 start');
      Settings.createWindow('testability/pages/component/scroll/list_scrollbar_hover/listScrollbarHover10')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(200, 500);
      await driver.assertComponentExist(ON.text('List滚动条悬浮测试0140'));
      await windowSnap.snapShot('ListScrollbarHover0140_1');
      await Utils.sleep(1000);

      // 点击改变direction按钮
      let directionButton: Component = await driver.waitForComponent(ON.id('change_direction_button_14'), 1000);
      await directionButton.click();
      await driver.waitForIdle(500, 2000);
      await windowSnap.snapShot('ListScrollbarHover0140_2');
      await Utils.sleep(1000);

      // 再次点击改变direction
      await directionButton.click();
      await driver.waitForIdle(500, 2000);
      await windowSnap.snapShot('ListScrollbarHover0140_3');
      await Utils.sleep(1000);

      console.log('SUB_ACE_UI_COMPONENT_LIST_SACROLLBAR_HOVER_0140 end');
      done();
    });

  })
}