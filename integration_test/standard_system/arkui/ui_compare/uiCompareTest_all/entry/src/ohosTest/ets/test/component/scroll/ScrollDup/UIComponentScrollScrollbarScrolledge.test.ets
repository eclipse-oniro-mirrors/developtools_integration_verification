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
 
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import Settings from '../../../model/Settings'
import windowSnap from '../../../model/snapShot'
import Logger from '../../../model/Logger'
import Utils from '../../../model/Utils'
import { Driver, Component, ON } from '@kit.TestKit'

export default function uIComponentScrollScrollbarScrolledge() {

  describe('uIComponentScrollScrollbarScrolledge', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_SCROLLEDGE_0150
     * @tc.name   : Scroll scrollbar scrolledge
     * @tc.desc   : Verify scroll scrollbar scrolledge interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_SCROLLEDGE_0150', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_SCROLLEDGE_0150 start.`);
      let caseName = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_SCROLLEDGE_0150';
      Settings.createWindow('testability/pages/component/scroll/ScrollDup/UIComponentScrollScrollbarScrolledge001')
      await Utils.sleep(3000)
      let driver: Driver = Driver.create()
      let component: Component = await driver.findComponent(ON.id('ScrollbarScrollEdge001'))
      await component.click();
      await Utils.sleep(3000)
      windowSnap.snapShot(caseName);
      await Utils.sleep(3000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_SCROLLEDGE_0150 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_SCROLLEDGE_0380
     * @tc.name   : Scroll scrollbar scrolledge
     * @tc.desc   : Verify scroll scrollbar scrolledge interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_SCROLLEDGE_0380', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_SCROLLEDGE_0380 start.`);
      let caseName = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_SCROLLEDGE_0380'
      Settings.createWindow('testability/pages/component/scroll/ScrollDup/UIComponentScrollScrollbarScrolledge002')
      await Utils.sleep(3000)
      let driver: Driver = Driver.create()
      let component: Component = await driver.findComponent(ON.id('ScrollbarScrollEdge002'))
      await component.click();
      await Utils.sleep(3000)
      windowSnap.snapShot(caseName);
      await Utils.sleep(3000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_SCROLLEDGE_0380 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_SCROLLEDGE_0030
     * @tc.name   : Scroll scrollbar scrolledge
     * @tc.desc   : Verify scroll scrollbar scrolledge interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_SCROLLEDGE_0030', 0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_SCROLLEDGE_0030 start.`);
      let caseName = 'SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_SCROLLEDGE_0030'
      Settings.createWindow('testability/pages/component/scroll/ScrollDup/UIComponentScrollScrollbarScrolledge003')
      await Utils.sleep(3000)
      let driver: Driver = Driver.create()
      let component: Component = await driver.findComponent(ON.id('ScrollbarScrollEdge003'))
      await component.click();
      await Utils.sleep(3000)
      windowSnap.snapShot(caseName);
      await Utils.sleep(3000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_SCROLL_SCROLLBAR_SCROLLEDGE_0030 finish.`);
      done()
    })
  })
}