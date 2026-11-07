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

export default function nodecontainerRender() {

  describe('nodecontainerRender', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_RENDER_0360
     * @tc.name   : getChild attempts to retrieve a child node under renderNode that does not exist (index greater than the maximum).
     * @tc.desc   : Verify graphic nodecontainer render interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_RENDER_0360', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_RENDER_0360 start.`);
      Settings.createWindow('testability/pages/component/frame_node/NodecontainerRender/NodecontainerRender0360')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000,3000)
      // 步骤1：点击renderNode补充按钮
      let renderNode = await driver.waitForComponent(ON.id('button_render_node_0360'), 2000)
      await renderNode.click()
      await Utils.sleep(500)
      // 步骤2：点击Test++按钮，直至index变为5
      let textindex = await driver.waitForComponent(ON.id('button_test_plus_0360'), 2000)
      for (let i = 0 ; i < 5 ; i++){
        await textindex.click()
        await Utils.sleep(500)
      }
      // 步骤3：点击getChild按钮
      let getChild = await driver.waitForComponent(ON.id('button_get_child_0360'), 2000)
      await getChild.click()
      await Utils.sleep(500)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_GRAPHIC_NODECONTAINER_RENDER_0360 finish.`);
      done()
    })




  })
}