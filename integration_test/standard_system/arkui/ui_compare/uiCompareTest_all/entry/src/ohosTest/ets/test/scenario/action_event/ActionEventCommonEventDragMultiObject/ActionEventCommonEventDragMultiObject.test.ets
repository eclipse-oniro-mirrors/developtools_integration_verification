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


export default function actionEventCommonEventDragMultiObject() {

  describe('actionEventCommonEventDragMultiObject', () => {
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
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MULTIOBJECT_0140
     * @tc.name   : Action event commonevent drag multiobject
     * @tc.desc   : Verify action event commonevent drag multiobject interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MULTIOBJECT_0140', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MULTIOBJECT_0140 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventDragMultiObject/ActionEventCommonEventDragMultiObject0140')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MULTIOBJECT_0140 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MULTIOBJECT_0090
     * @tc.name   : Action event commonevent drag multiobject
     * @tc.desc   : Verify action event commonevent drag multiobject interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MULTIOBJECT_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MULTIOBJECT_0090 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventDragMultiObject/ActionEventCommonEventDragMultiObject0090')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MULTIOBJECT_0090 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MULTIOBJECT_0100
     * @tc.name   : Action event commonevent drag multiobject
     * @tc.desc   : Verify action event commonevent drag multiobject interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MULTIOBJECT_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MULTIOBJECT_0100 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventDragMultiObject/ActionEventCommonEventDragMultiObject0100')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MULTIOBJECT_0100 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MULTIOBJECT_0130
     * @tc.name   : Action event commonevent drag multiobject
     * @tc.desc   : Verify action event commonevent drag multiobject interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MULTIOBJECT_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MULTIOBJECT_0130 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventDragMultiObject/ActionEventCommonEventDragMultiObject0130')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MULTIOBJECT_0130 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MULTIOBJECT_0080
     * @tc.name   : Action event commonevent drag multiobject
     * @tc.desc   : Verify action event commonevent drag multiobject interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MULTIOBJECT_0080', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MULTIOBJECT_0080 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventDragMultiObject/ActionEventCommonEventDragMultiObject0080')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MULTIOBJECT_0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MULTIOBJECT_0110
     * @tc.name   : Action event commonevent drag multiobject
     * @tc.desc   : Verify action event commonevent drag multiobject interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MULTIOBJECT_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MULTIOBJECT_0110 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventDragMultiObject/ActionEventCommonEventDragMultiObject0110')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MULTIOBJECT_0110 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MULTIOBJECT_0120
     * @tc.name   : Action event commonevent drag multiobject
     * @tc.desc   : Verify action event commonevent drag multiobject interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MULTIOBJECT_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MULTIOBJECT_0120 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventDragMultiObject/ActionEventCommonEventDragMultiObject0120')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MULTIOBJECT_0120 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MULTIOBJECT_0150
     * @tc.name   : Action event commonevent drag multiobject
     * @tc.desc   : Verify action event commonevent drag multiobject interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MULTIOBJECT_0150', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MULTIOBJECT_0150 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ActionEventCommonEventDragMultiObject/ActionEventCommonEventDragMultiObject0150')
      let driver:Driver = Driver.create();
      await driver.waitForIdle(5000,8000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_ACTION_EVENT_COMMONEVENT_DRAG_MULTIOBJECT_0150 finish.`);
      done()
    })




  })
}