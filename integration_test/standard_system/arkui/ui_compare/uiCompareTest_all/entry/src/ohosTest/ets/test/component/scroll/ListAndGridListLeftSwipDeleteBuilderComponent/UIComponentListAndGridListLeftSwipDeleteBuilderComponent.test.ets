/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

export default function uIComponentListAndGridListLeftSwipDeleteBuilderComponentTest() {
  describe('uIComponentListAndGridListLeftSwipDeleteBuilderComponentTest', () => {
    afterEach(async (done: Function) => {
      if (Settings.windowClass == undefined) {
        return;
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
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSWIPEDELETE_BUILDERCOMPONENT_0100
     * @tc.name   : Listandgrid list leftswipedelete buildercomponent
     * @tc.desc   : Verify listandgrid list leftswipedelete buildercomponent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSWIPEDELETE_BUILDERCOMPONENT_0100', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSWIPEDELETE_BUILDERCOMPONENT_0100';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListLeftSwipDeleteBuilderComponent/UIComponentListAndGridListLeftSwipDeleteBuilderComponent001');
      let driver: Driver = Driver.create();
      let list: Component = await driver.waitForComponent(ON.type('List'), 1000);
      let point = await list.getBoundsCenter();
      console.log(`${caseName} point of List is ${JSON.stringify(point)}`);
      await driver.mouseDrag({x: point.x + 300, y: point.y}, {x: point.x - 300, y: point.y}, 1000);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSWIPEDELETE_BUILDERCOMPONENT_0100');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSWIPEDELETE_BUILDERCOMPONENT_0090
     * @tc.name   : Listandgrid list leftswipedelete buildercomponent
     * @tc.desc   : Verify listandgrid list leftswipedelete buildercomponent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSWIPEDELETE_BUILDERCOMPONENT_0090', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSWIPEDELETE_BUILDERCOMPONENT_0090';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListLeftSwipDeleteBuilderComponent/UIComponentListAndGridListLeftSwipDeleteBuilderComponent002');
      let driver: Driver = Driver.create();
      let list: Component = await driver.waitForComponent(ON.type('List'), 1000);
      let point = await list.getBoundsCenter();
      console.log(`${caseName} point of List is ${JSON.stringify(point)}`);
      await driver.mouseDrag({x: point.x - 300, y: point.y}, {x: point.x + 300, y: point.y}, 1000);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSWIPEDELETE_BUILDERCOMPONENT_0090');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSWIPEDELETE_BUILDERCOMPONENT_0040
     * @tc.name   : Listandgrid list leftswipedelete buildercomponent
     * @tc.desc   : Verify listandgrid list leftswipedelete buildercomponent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSWIPEDELETE_BUILDERCOMPONENT_0040', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSWIPEDELETE_BUILDERCOMPONENT_0040';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListLeftSwipDeleteBuilderComponent/UIComponentListAndGridListLeftSwipDeleteBuilderComponent003');
      let driver: Driver = Driver.create();
      let list: Component = await driver.waitForComponent(ON.type('List'), 1000);
      let point = await list.getBoundsCenter();
      console.log(`${caseName} point of List is ${JSON.stringify(point)}`);
      await driver.mouseDrag({x: point.x + 300, y: point.y}, {x: point.x - 300, y: point.y}, 1000);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSWIPEDELETE_BUILDERCOMPONENT_0040');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSWIPEDELETE_BUILDERCOMPONENT_0180
     * @tc.name   : Listandgrid list leftswipedelete buildercomponent
     * @tc.desc   : Verify listandgrid list leftswipedelete buildercomponent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSWIPEDELETE_BUILDERCOMPONENT_0180', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSWIPEDELETE_BUILDERCOMPONENT_0180';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListLeftSwipDeleteBuilderComponent/UIComponentListAndGridListLeftSwipDeleteBuilderComponent004');
      let driver: Driver = Driver.create();
      let list: Component = await driver.waitForComponent(ON.type('List'), 1000);
      let point = await list.getBoundsCenter();
      console.log(`${caseName} point of List is ${JSON.stringify(point)}`);
      await driver.mouseDrag({x: point.x + 300, y: point.y}, {x: point.x - 300, y: point.y}, 1000);
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSWIPEDELETE_BUILDERCOMPONENT_0180_02');
      let button: Component = await driver.waitForComponent(ON.id('change'), 1000);
      await button.click();
      await driver.waitForIdle(500, 1000);
      await driver.mouseDrag({x: point.x + 300, y: point.y}, {x: point.x - 300, y: point.y}, 1000);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSWIPEDELETE_BUILDERCOMPONENT_0180');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSWIPEDELETE_BUILDERCOMPONENT_0080
     * @tc.name   : Listandgrid list leftswipedelete buildercomponent
     * @tc.desc   : Verify listandgrid list leftswipedelete buildercomponent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSWIPEDELETE_BUILDERCOMPONENT_0080', Level.LEVEL0, async (done: Function) => {
      let caseName: string = 'SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSWIPEDELETE_BUILDERCOMPONENT_0080';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/component/scroll/ListAndGridListLeftSwipDeleteBuilderComponent/UIComponentListAndGridListLeftSwipDeleteBuilderComponent005');
      let driver: Driver = Driver.create();
      let list: Component = await driver.waitForComponent(ON.type('List'), 1000);
      let point = await list.getBoundsCenter();
      console.log(`${caseName} point of List is ${JSON.stringify(point)}`);
      await driver.mouseDrag({x: point.x + 300, y: point.y}, {x: point.x - 300, y: point.y}, 1000);
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSWIPEDELETE_BUILDERCOMPONENT_0080_02');
      await driver.mouseClick({x: point.x, y: point.y + 400}, MouseButton.MOUSE_BUTTON_LEFT);
      let button: Component = await driver.waitForComponent(ON.id('change'), 1000);
      await button.click();
      await driver.mouseDrag({x: point.x + 300, y: point.y}, {x: point.x - 300, y: point.y}, 1000);
      await driver.waitForIdle(500, 1000);
      windowSnap.snapShot('SUB_ACE_UI_COMPONENT_LISTANDGRID_LIST_LEFTSWIPEDELETE_BUILDERCOMPONENT_0080');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });
  })
}