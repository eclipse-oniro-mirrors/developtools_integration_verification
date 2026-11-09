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
import { Driver, ON, Component, MouseButton, PointerMatrix } from '@kit.TestKit'

export default function aCEActionGestureFingersLimit() {

  describe('aCEActionGestureFingersLimit', () => {
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
     * @tc.number : SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0010
     * @tc.name   : TapGesture, fingers = 1, isFingerCountLimited is true
     * @tc.desc   : Verify action gesture fingers limite interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0010', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0010 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ACEActionGestureFingersLimit/ACEActionGestureFingersLimit01')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.type('Button'),1000);
      let point = await button.getBoundsCenter()
      await button.click()
      await Utils.sleep(1000);
      windowSnap.snapShot()
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x:point.x,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y});
      pointers.setPoint(1,0,{x:point.x,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0010 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0020
     * @tc.name   : TapGesture, fingers = 1, isFingerCountLimited is false
     * @tc.desc   : Verify action gesture fingers limite interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0020 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ACEActionGestureFingersLimit/ACEActionGestureFingersLimit02')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.type('Button'),1000);
      let point = await button.getBoundsCenter()
      await button.click()
      await Utils.sleep(1000);
      windowSnap.snapShot()
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x:point.x,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y});
      pointers.setPoint(1,0,{x:point.x,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0020 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0030
     * @tc.name   : TapGesture, fingers = 1, isFingerCountLimited is undefined
     * @tc.desc   : Verify action gesture fingers limite interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0030 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ACEActionGestureFingersLimit/ACEActionGestureFingersLimit03')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.type('Button'),1000);
      let point = await button.getBoundsCenter()
      await button.click()
      await Utils.sleep(1000);
      windowSnap.snapShot()
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x:point.x,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y});
      pointers.setPoint(1,0,{x:point.x,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0030 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0040
     * @tc.name   : TapGesture, fingers = 2, isFingerCountLimited is true
     * @tc.desc   : Verify action gesture fingers limite interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0040 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ACEActionGestureFingersLimit/ACEActionGestureFingersLimit04')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.type('Button'),1000);
      let point = await button.getBoundsCenter()
      await button.click()
      await Utils.sleep(1000);
      windowSnap.snapShot()
      let pointers2: PointerMatrix = PointerMatrix.create(2,2);
      pointers2.setPoint(0,0,{x:point.x,y:point.y});
      pointers2.setPoint(0,1,{x:point.x,y:point.y});
      pointers2.setPoint(1,0,{x:point.x,y:point.y});
      pointers2.setPoint(1,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers2);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      let pointers: PointerMatrix = PointerMatrix.create(3,2);
      pointers.setPoint(0,0,{x:point.x,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y});
      pointers.setPoint(1,0,{x:point.x,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y});
      pointers.setPoint(2,0,{x:point.x,y:point.y});
      pointers.setPoint(2,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0040 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0050
     * @tc.name   : TapGesture, fingers = 2, isFingerCountLimited is false
     * @tc.desc   : Verify action gesture fingers limite interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0050 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ACEActionGestureFingersLimit/ACEActionGestureFingersLimit05')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.type('Button'),1000);
      let point = await button.getBoundsCenter()
      await button.click()
      await Utils.sleep(1000);
      windowSnap.snapShot()
      let pointers2: PointerMatrix = PointerMatrix.create(2,2);
      pointers2.setPoint(0,0,{x:point.x,y:point.y});
      pointers2.setPoint(0,1,{x:point.x,y:point.y});
      pointers2.setPoint(1,0,{x:point.x,y:point.y});
      pointers2.setPoint(1,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers2);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      let pointers: PointerMatrix = PointerMatrix.create(3,2);
      pointers.setPoint(0,0,{x:point.x,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y});
      pointers.setPoint(1,0,{x:point.x,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y});
      pointers.setPoint(2,0,{x:point.x,y:point.y});
      pointers.setPoint(2,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0050 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0060
     * @tc.name   : TapGesture, fingers = 2, isFingerCountLimited is undefined
     * @tc.desc   : Verify action gesture fingers limite interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0060', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0060 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ACEActionGestureFingersLimit/ACEActionGestureFingersLimit06')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.type('Button'),1000);
      let point = await button.getBoundsCenter()
      await button.click()
      await Utils.sleep(1000);
      windowSnap.snapShot()
      let pointers2: PointerMatrix = PointerMatrix.create(2,2);
      pointers2.setPoint(0,0,{x:point.x,y:point.y});
      pointers2.setPoint(0,1,{x:point.x,y:point.y});
      pointers2.setPoint(1,0,{x:point.x,y:point.y});
      pointers2.setPoint(1,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers2);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      let pointers: PointerMatrix = PointerMatrix.create(3,2);
      pointers.setPoint(0,0,{x:point.x,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y});
      pointers.setPoint(1,0,{x:point.x,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y});
      pointers.setPoint(2,0,{x:point.x,y:point.y});
      pointers.setPoint(2,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0060 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0070
     * @tc.name   : TapGesture, fingers = 3, isFingerCountLimited is true
     * @tc.desc   : Verify action gesture fingers limite interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0070', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0070 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ACEActionGestureFingersLimit/ACEActionGestureFingersLimit07')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.type('Button'),1000);
      let point = await button.getBoundsCenter()
      await button.click()
      await Utils.sleep(1000);
      windowSnap.snapShot()
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x:point.x,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y});
      pointers.setPoint(1,0,{x:point.x,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      let pointers2: PointerMatrix = PointerMatrix.create(3,2);
      pointers2.setPoint(0,0,{x:point.x,y:point.y});
      pointers2.setPoint(0,1,{x:point.x,y:point.y});
      pointers2.setPoint(1,0,{x:point.x,y:point.y});
      pointers2.setPoint(1,1,{x:point.x,y:point.y});
      pointers2.setPoint(2,0,{x:point.x,y:point.y});
      pointers2.setPoint(2,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers2);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      let pointers3: PointerMatrix = PointerMatrix.create(4,2);
      pointers3.setPoint(0,0,{x:point.x,y:point.y});
      pointers3.setPoint(0,1,{x:point.x,y:point.y});
      pointers3.setPoint(1,0,{x:point.x,y:point.y});
      pointers3.setPoint(1,1,{x:point.x,y:point.y});
      pointers3.setPoint(2,0,{x:point.x,y:point.y});
      pointers3.setPoint(2,1,{x:point.x,y:point.y});
      pointers3.setPoint(3,0,{x:point.x,y:point.y});
      pointers3.setPoint(3,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers3);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0070 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0090
     * @tc.name   : TapGesture, fingers = 3, isFingerCountLimited is undefined
     * @tc.desc   : Verify action gesture fingers limite interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0090', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0090 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ACEActionGestureFingersLimit/ACEActionGestureFingersLimit08')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.type('Button'),1000);
      let point = await button.getBoundsCenter()
      await button.click()
      await Utils.sleep(1000);
      windowSnap.snapShot()
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x:point.x,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y});
      pointers.setPoint(1,0,{x:point.x,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      let pointers2: PointerMatrix = PointerMatrix.create(3,2);
      pointers2.setPoint(0,0,{x:point.x,y:point.y});
      pointers2.setPoint(0,1,{x:point.x,y:point.y});
      pointers2.setPoint(1,0,{x:point.x,y:point.y});
      pointers2.setPoint(1,1,{x:point.x,y:point.y});
      pointers2.setPoint(2,0,{x:point.x,y:point.y});
      pointers2.setPoint(2,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers2);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      let pointers3: PointerMatrix = PointerMatrix.create(4,2);
      pointers3.setPoint(0,0,{x:point.x,y:point.y});
      pointers3.setPoint(0,1,{x:point.x,y:point.y});
      pointers3.setPoint(1,0,{x:point.x,y:point.y});
      pointers3.setPoint(1,1,{x:point.x,y:point.y});
      pointers3.setPoint(2,0,{x:point.x,y:point.y});
      pointers3.setPoint(2,1,{x:point.x,y:point.y});
      pointers3.setPoint(3,0,{x:point.x,y:point.y});
      pointers3.setPoint(3,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers3);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0090 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0100
     * @tc.name   : TapGesture, fingers = 4, isFingerCountLimited is true
     * @tc.desc   : Verify action gesture fingers limite interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0100', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0100 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ACEActionGestureFingersLimit/ACEActionGestureFingersLimit09')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.type('Button'),1000);
      let point = await button.getBoundsCenter()
      await button.click()
      await Utils.sleep(1000);
      windowSnap.snapShot()
      let pointers4: PointerMatrix = PointerMatrix.create(2,2);
      pointers4.setPoint(0,0,{x:point.x,y:point.y});
      pointers4.setPoint(0,1,{x:point.x,y:point.y});
      pointers4.setPoint(1,0,{x:point.x,y:point.y});
      pointers4.setPoint(1,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers4);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      let pointers2: PointerMatrix = PointerMatrix.create(3,2);
      pointers2.setPoint(0,0,{x:point.x,y:point.y});
      pointers2.setPoint(0,1,{x:point.x,y:point.y});
      pointers2.setPoint(1,0,{x:point.x,y:point.y});
      pointers2.setPoint(1,1,{x:point.x,y:point.y});
      pointers2.setPoint(2,0,{x:point.x,y:point.y});
      pointers2.setPoint(2,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers2);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      let pointers3: PointerMatrix = PointerMatrix.create(4,2);
      pointers3.setPoint(0,0,{x:point.x,y:point.y});
      pointers3.setPoint(0,1,{x:point.x,y:point.y});
      pointers3.setPoint(1,0,{x:point.x,y:point.y});
      pointers3.setPoint(1,1,{x:point.x,y:point.y});
      pointers3.setPoint(2,0,{x:point.x,y:point.y});
      pointers3.setPoint(2,1,{x:point.x,y:point.y});
      pointers3.setPoint(3,0,{x:point.x,y:point.y});
      pointers3.setPoint(3,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers3);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      let pointers: PointerMatrix = PointerMatrix.create(5,2);
      pointers.setPoint(0,0,{x:point.x,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y});
      pointers.setPoint(1,0,{x:point.x,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y});
      pointers.setPoint(2,0,{x:point.x,y:point.y});
      pointers.setPoint(2,1,{x:point.x,y:point.y});
      pointers.setPoint(3,0,{x:point.x,y:point.y});
      pointers.setPoint(3,1,{x:point.x,y:point.y});
      pointers.setPoint(4,0,{x:point.x,y:point.y});
      pointers.setPoint(4,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0100 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0110
     * @tc.name   : TapGesture, fingers = 4, isFingerCountLimited is false
     * @tc.desc   : Verify action gesture fingers limite interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0110', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0110 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ACEActionGestureFingersLimit/ACEActionGestureFingersLimit10')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.type('Button'),1000);
      let point = await button.getBoundsCenter()
      await button.click()
      await Utils.sleep(1000);
      windowSnap.snapShot()
      let pointers4: PointerMatrix = PointerMatrix.create(2,2);
      pointers4.setPoint(0,0,{x:point.x,y:point.y});
      pointers4.setPoint(0,1,{x:point.x,y:point.y});
      pointers4.setPoint(1,0,{x:point.x,y:point.y});
      pointers4.setPoint(1,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers4);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      let pointers2: PointerMatrix = PointerMatrix.create(3,2);
      pointers2.setPoint(0,0,{x:point.x,y:point.y});
      pointers2.setPoint(0,1,{x:point.x,y:point.y});
      pointers2.setPoint(1,0,{x:point.x,y:point.y});
      pointers2.setPoint(1,1,{x:point.x,y:point.y});
      pointers2.setPoint(2,0,{x:point.x,y:point.y});
      pointers2.setPoint(2,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers2);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      let pointers3: PointerMatrix = PointerMatrix.create(4,2);
      pointers3.setPoint(0,0,{x:point.x,y:point.y});
      pointers3.setPoint(0,1,{x:point.x,y:point.y});
      pointers3.setPoint(1,0,{x:point.x,y:point.y});
      pointers3.setPoint(1,1,{x:point.x,y:point.y});
      pointers3.setPoint(2,0,{x:point.x,y:point.y});
      pointers3.setPoint(2,1,{x:point.x,y:point.y});
      pointers3.setPoint(3,0,{x:point.x,y:point.y});
      pointers3.setPoint(3,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers3);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      let pointers: PointerMatrix = PointerMatrix.create(5,2);
      pointers.setPoint(0,0,{x:point.x,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y});
      pointers.setPoint(1,0,{x:point.x,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y});
      pointers.setPoint(2,0,{x:point.x,y:point.y});
      pointers.setPoint(2,1,{x:point.x,y:point.y});
      pointers.setPoint(3,0,{x:point.x,y:point.y});
      pointers.setPoint(3,1,{x:point.x,y:point.y});
      pointers.setPoint(4,0,{x:point.x,y:point.y});
      pointers.setPoint(4,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0110 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0120
     * @tc.name   : TapGesture, fingers is default, isFingerCountLimited is true
     * @tc.desc   : Verify action gesture fingers limite interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0120', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0120 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ACEActionGestureFingersLimit/ACEActionGestureFingersLimit11')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.type('Button'),1000);
      let point = await button.getBoundsCenter()
      await button.click()
      await Utils.sleep(1000);
      windowSnap.snapShot()
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x:point.x,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y});
      pointers.setPoint(1,0,{x:point.x,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0120 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0130
     * @tc.name   : TapGesture, not set fingers, isFingerCountLimited is true
     * @tc.desc   : Verify action gesture fingers limite interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0130', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0130 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ACEActionGestureFingersLimit/ACEActionGestureFingersLimit12')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.type('Button'),1000);
      let point = await button.getBoundsCenter()
      await button.click()
      await Utils.sleep(1000);
      windowSnap.snapShot()
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x:point.x,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y});
      pointers.setPoint(1,0,{x:point.x,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0130 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0080
     * @tc.name   : TapGesture, fingers = 3, isFingerCountLimited is false
     * @tc.desc   : Verify action gesture fingers limite interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0080', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0080 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ACEActionGestureFingersLimit/ACEActionGestureFingersLimit13')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.type('Button'),1000);
      let point = await button.getBoundsCenter()
      await button.click()
      await Utils.sleep(1000);
      windowSnap.snapShot()
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x:point.x,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y});
      pointers.setPoint(1,0,{x:point.x,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      let pointers2: PointerMatrix = PointerMatrix.create(3,2);
      pointers2.setPoint(0,0,{x:point.x,y:point.y});
      pointers2.setPoint(0,1,{x:point.x,y:point.y});
      pointers2.setPoint(1,0,{x:point.x,y:point.y});
      pointers2.setPoint(1,1,{x:point.x,y:point.y});
      pointers2.setPoint(2,0,{x:point.x,y:point.y});
      pointers2.setPoint(2,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers2);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      let pointers3: PointerMatrix = PointerMatrix.create(4,2);
      pointers3.setPoint(0,0,{x:point.x,y:point.y});
      pointers3.setPoint(0,1,{x:point.x,y:point.y});
      pointers3.setPoint(1,0,{x:point.x,y:point.y});
      pointers3.setPoint(1,1,{x:point.x,y:point.y});
      pointers3.setPoint(2,0,{x:point.x,y:point.y});
      pointers3.setPoint(2,1,{x:point.x,y:point.y});
      pointers3.setPoint(3,0,{x:point.x,y:point.y});
      pointers3.setPoint(3,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers3);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0080 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0530
     * @tc.name   : PinchGesture, fingers = 1, isFingerCountLimited is true
     * @tc.desc   : Verify action gesture fingers limite interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0530', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0530 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ACEActionGestureFingersLimit/ACEActionGestureFingersLimit14')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('ACEActionGestureFingersLimit14'),1000);
      let point = await button.getBoundsCenter()
      let pointers: PointerMatrix = PointerMatrix.create(1,2);
      pointers.setPoint(0,0,{x:point.x-10,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      let pointers1: PointerMatrix = PointerMatrix.create(2,2);
      pointers1.setPoint(0,0,{x:point.x-10,y:point.y});
      pointers1.setPoint(0,1,{x:point.x,y:point.y});
      pointers1.setPoint(1,0,{x:point.x+10,y:point.y});
      pointers1.setPoint(1,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers1);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      let pointers2: PointerMatrix = PointerMatrix.create(3,2);
      pointers2.setPoint(0,0,{x:point.x-10,y:point.y});
      pointers2.setPoint(0,1,{x:point.x,y:point.y});
      pointers2.setPoint(1,0,{x:point.x+10,y:point.y});
      pointers2.setPoint(1,1,{x:point.x,y:point.y});
      pointers2.setPoint(2,0,{x:point.x,y:point.y-10});
      pointers2.setPoint(2,1,{x:point.x,y:point.y+10});
      await driver.injectMultiPointerAction(pointers2);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0530 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0580
     * @tc.name   : PinchGesture, fingers = 2, isFingerCountLimited is false
     * @tc.desc   : Verify action gesture fingers limite interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0580', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0580 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ACEActionGestureFingersLimit/ACEActionGestureFingersLimit15')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('ACEActionGestureFingersLimit15'),1000);
      let point = await button.getBoundsCenter()
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x:point.x-10,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y});
      pointers.setPoint(1,0,{x:point.x+10,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      let pointers1: PointerMatrix = PointerMatrix.create(3,2);
      pointers1.setPoint(0,0,{x:point.x-10,y:point.y});
      pointers1.setPoint(0,1,{x:point.x,y:point.y});
      pointers1.setPoint(1,0,{x:point.x+10,y:point.y});
      pointers1.setPoint(1,1,{x:point.x,y:point.y});
      pointers1.setPoint(2,0,{x:point.x,y:point.y-10});
      pointers1.setPoint(2,1,{x:point.x,y:point.y+10});
      await driver.injectMultiPointerAction(pointers1);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0580 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0590
     * @tc.name   : PinchGesture, fingers = 2, isFingerCountLimited is undefined
     * @tc.desc   : Verify action gesture fingers limite interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0590', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0590 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ACEActionGestureFingersLimit/ACEActionGestureFingersLimit16')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('ACEActionGestureFingersLimit16'),1000);
      let point = await button.getBoundsCenter()
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x:point.x-10,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y});
      pointers.setPoint(1,0,{x:point.x+10,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      let pointers1: PointerMatrix = PointerMatrix.create(3,2);
      pointers1.setPoint(0,0,{x:point.x-10,y:point.y});
      pointers1.setPoint(0,1,{x:point.x,y:point.y});
      pointers1.setPoint(1,0,{x:point.x+10,y:point.y});
      pointers1.setPoint(1,1,{x:point.x,y:point.y});
      pointers1.setPoint(2,0,{x:point.x,y:point.y-10});
      pointers1.setPoint(2,1,{x:point.x,y:point.y+10});
      await driver.injectMultiPointerAction(pointers1);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0590 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0600
     * @tc.name   : PinchGesture, fingers is default, isFingerCountLimited is true
     * @tc.desc   : Verify action gesture fingers limite interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0600', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0600 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ACEActionGestureFingersLimit/ACEActionGestureFingersLimit17')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('ACEActionGestureFingersLimit17'),1000);
      let point = await button.getBoundsCenter()
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x:point.x-10,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y});
      pointers.setPoint(1,0,{x:point.x+10,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      let pointers1: PointerMatrix = PointerMatrix.create(3,2);
      pointers1.setPoint(0,0,{x:point.x-10,y:point.y});
      pointers1.setPoint(0,1,{x:point.x,y:point.y});
      pointers1.setPoint(1,0,{x:point.x+10,y:point.y});
      pointers1.setPoint(1,1,{x:point.x,y:point.y});
      pointers1.setPoint(2,0,{x:point.x,y:point.y-10});
      pointers1.setPoint(2,1,{x:point.x,y:point.y+10});
      await driver.injectMultiPointerAction(pointers1);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0600 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0610
     * @tc.name   : PinchGesture, fingers is not set, isFingerCountLimited is true
     * @tc.desc   : Verify action gesture fingers limite interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0610', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0610 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ACEActionGestureFingersLimit/ACEActionGestureFingersLimit18')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('ACEActionGestureFingersLimit18'),1000);
      let point = await button.getBoundsCenter()
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x:point.x-10,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y});
      pointers.setPoint(1,0,{x:point.x+10,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      let pointers1: PointerMatrix = PointerMatrix.create(3,2);
      pointers1.setPoint(0,0,{x:point.x-10,y:point.y});
      pointers1.setPoint(0,1,{x:point.x,y:point.y});
      pointers1.setPoint(1,0,{x:point.x+10,y:point.y});
      pointers1.setPoint(1,1,{x:point.x,y:point.y});
      pointers1.setPoint(2,0,{x:point.x,y:point.y-10});
      pointers1.setPoint(2,1,{x:point.x,y:point.y+10});
      await driver.injectMultiPointerAction(pointers1);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0610 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0620
     * @tc.name   : PinchGesture, fingers = 3, isFingerCountLimited is true
     * @tc.desc   : Verify action gesture fingers limite interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0620', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0620 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ACEActionGestureFingersLimit/ACEActionGestureFingersLimit19')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('ACEActionGestureFingersLimit19'),1000);
      let point = await button.getBoundsCenter()
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x:point.x-10,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y});
      pointers.setPoint(1,0,{x:point.x+10,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      let pointers1: PointerMatrix = PointerMatrix.create(3, 3);
      pointers1.setPoint(0, 0, {x: point.x - 40, y: point.y - 40});
      pointers1.setPoint(1, 0, {x: point.x + 40, y: point.y - 40});
      pointers1.setPoint(2, 0, {x: point.x, y: point.y + 40});
      pointers1.setPoint(0, 1, {x: point.x - 20, y: point.y - 20});
      pointers1.setPoint(1, 1, {x: point.x + 20, y: point.y - 20});
      pointers1.setPoint(2, 1, {x: point.x, y: point.y + 20});
      pointers1.setPoint(0, 2, {x: point.x - 10, y: point.y - 10});
      pointers1.setPoint(1, 2, {x: point.x + 10, y: point.y - 10});
      pointers1.setPoint(2, 2, {x: point.x, y: point.y + 10});
      await driver.injectMultiPointerAction(pointers1);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0620 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0680
     * @tc.name   : RotationGesture, fingers = 2, isFingerCountLimited is false
     * @tc.desc   : Verify action gesture fingers limite interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0680', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0680 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ACEActionGestureFingersLimit/ACEActionGestureFingersLimit20')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('ACEActionGestureFingersLimit20'),1000);
      let point = await button.getBoundsCenter()
      let pointers1: PointerMatrix = PointerMatrix.create(3,2);
      pointers1.setPoint(0,0,{x:point.x-10,y:point.y});
      pointers1.setPoint(0,1,{x:point.x,y:point.y});
      pointers1.setPoint(1,0,{x:point.x+10,y:point.y});
      pointers1.setPoint(1,1,{x:point.x,y:point.y});
      pointers1.setPoint(2,0,{x:point.x,y:point.y-10});
      pointers1.setPoint(2,1,{x:point.x,y:point.y+10});
      await driver.injectMultiPointerAction(pointers1);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x:point.x-10,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y});
      pointers.setPoint(1,0,{x:point.x+10,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0680 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0630
     * @tc.name   : RotationGesture, fingers = 1, isFingerCountLimited is true
     * @tc.desc   : Verify action gesture fingers limite interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0630', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0630 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ACEActionGestureFingersLimit/ACEActionGestureFingersLimit21')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('ACEActionGestureFingersLimit21'),1000);
      let point = await button.getBoundsCenter()
      let pointers: PointerMatrix = PointerMatrix.create(1,2);
      pointers.setPoint(0,0,{x:point.x-10,y:point.y});
      pointers.setPoint(0,1,{x:point.x+10,y:point.y});
      await driver.injectMultiPointerAction(pointers);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      let pointers1: PointerMatrix = PointerMatrix.create(2,2);
      pointers1.setPoint(0,0,{x:point.x-10,y:point.y});
      pointers1.setPoint(0,1,{x:point.x,y:point.y});
      pointers1.setPoint(1,0,{x:point.x+10,y:point.y});
      pointers1.setPoint(1,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers1);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      let pointers2: PointerMatrix = PointerMatrix.create(3,2);
      pointers2.setPoint(0,0,{x:point.x-10,y:point.y});
      pointers2.setPoint(0,1,{x:point.x,y:point.y});
      pointers2.setPoint(1,0,{x:point.x+10,y:point.y});
      pointers2.setPoint(1,1,{x:point.x,y:point.y});
      pointers2.setPoint(2,0,{x:point.x,y:point.y-10});
      pointers2.setPoint(2,1,{x:point.x,y:point.y+10});
      await driver.injectMultiPointerAction(pointers2);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0630 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0690
     * @tc.name   : RotationGesture, fingers = 2, isFingerCountLimited is undefined
     * @tc.desc   : Verify action gesture fingers limite interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0690', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0690 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ACEActionGestureFingersLimit/ACEActionGestureFingersLimit22')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('ACEActionGestureFingersLimit22'),1000);
      let point = await button.getBoundsCenter()
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x:point.x-10,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y});
      pointers.setPoint(1,0,{x:point.x+10,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      let pointers1: PointerMatrix = PointerMatrix.create(3,2);
      pointers1.setPoint(0,0,{x:point.x-10,y:point.y});
      pointers1.setPoint(0,1,{x:point.x,y:point.y});
      pointers1.setPoint(1,0,{x:point.x+10,y:point.y});
      pointers1.setPoint(1,1,{x:point.x,y:point.y});
      pointers1.setPoint(2,0,{x:point.x,y:point.y-10});
      pointers1.setPoint(2,1,{x:point.x,y:point.y+10});
      await driver.injectMultiPointerAction(pointers1);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0690 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0710
     * @tc.name   : RotationGesture, fingers is not set, isFingerCountLimited is true
     * @tc.desc   : Verify action gesture fingers limite interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0710', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0710 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ACEActionGestureFingersLimit/ACEActionGestureFingersLimit23')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('ACEActionGestureFingersLimit23'),1000);
      let point = await button.getBoundsCenter()
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x:point.x-10,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y});
      pointers.setPoint(1,0,{x:point.x+10,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      let pointers1: PointerMatrix = PointerMatrix.create(3,2);
      pointers1.setPoint(0,0,{x:point.x-10,y:point.y});
      pointers1.setPoint(0,1,{x:point.x,y:point.y});
      pointers1.setPoint(1,0,{x:point.x+10,y:point.y});
      pointers1.setPoint(1,1,{x:point.x,y:point.y});
      pointers1.setPoint(2,0,{x:point.x,y:point.y-10});
      pointers1.setPoint(2,1,{x:point.x,y:point.y+10});
      await driver.injectMultiPointerAction(pointers1);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0710 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0720
     * @tc.name   : RotationGesture, fingers = 3, isFingerCountLimited is true
     * @tc.desc   : Verify action gesture fingers limite interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0720', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0720 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ACEActionGestureFingersLimit/ACEActionGestureFingersLimit24')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('ACEActionGestureFingersLimit24'),1000);
      let point = await button.getBoundsCenter()
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x:point.x-10,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y});
      pointers.setPoint(1,0,{x:point.x+10,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      let pointers1: PointerMatrix = PointerMatrix.create(3,2);
      pointers1.setPoint(0,0,{x:point.x-10,y:point.y});
      pointers1.setPoint(0,1,{x:point.x,y:point.y});
      pointers1.setPoint(1,0,{x:point.x+10,y:point.y});
      pointers1.setPoint(1,1,{x:point.x,y:point.y});
      pointers1.setPoint(2,0,{x:point.x,y:point.y-10});
      pointers1.setPoint(2,1,{x:point.x,y:point.y+10});
      await driver.injectMultiPointerAction(pointers1);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0720 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0700
     * @tc.name   : RotationGesture, fingers is default, isFingerCountLimited is true
     * @tc.desc   : Verify action gesture fingers limite interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0700', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0700 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ACEActionGestureFingersLimit/ACEActionGestureFingersLimit25')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('ACEActionGestureFingersLimit25'),1000);
      let point = await button.getBoundsCenter()
      let pointers: PointerMatrix = PointerMatrix.create(2,2);
      pointers.setPoint(0,0,{x:point.x-10,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y});
      pointers.setPoint(1,0,{x:point.x+10,y:point.y});
      pointers.setPoint(1,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      let pointers1: PointerMatrix = PointerMatrix.create(3,2);
      pointers1.setPoint(0,0,{x:point.x-10,y:point.y});
      pointers1.setPoint(0,1,{x:point.x,y:point.y});
      pointers1.setPoint(1,0,{x:point.x+10,y:point.y});
      pointers1.setPoint(1,1,{x:point.x,y:point.y});
      pointers1.setPoint(2,0,{x:point.x,y:point.y-10});
      pointers1.setPoint(2,1,{x:point.x,y:point.y+10});
      await driver.injectMultiPointerAction(pointers1);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0700 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0520
     * @tc.name   : SwipeGesture, without setting fingers, isFingerCountLimited is true
     * @tc.desc   : Verify action gesture fingers limite interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0520', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0520 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ACEActionGestureFingersLimit/ACEActionGestureFingersLimit26')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('ACEActionGestureFingersLimit26'),1000);
      let point = await button.getBoundsCenter()
      let pointers: PointerMatrix = PointerMatrix.create(1,2);
      pointers.setPoint(0,0,{x:point.x-100,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      let pointers1: PointerMatrix = PointerMatrix.create(2, 3);
      pointers1.setPoint(0, 0, {x: point.x - 100, y: point.y - 20});
      pointers1.setPoint(1, 0, {x: point.x - 100, y: point.y + 20});
      pointers1.setPoint(0, 1, {x: point.x - 50, y: point.y - 20});
      pointers1.setPoint(1, 1, {x: point.x - 50, y: point.y + 20});
      pointers1.setPoint(0, 2, {x: point.x, y: point.y - 20});
      pointers1.setPoint(1, 2, {x: point.x, y: point.y + 20});
      await driver.injectMultiPointerAction(pointers1);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0520 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0440
     * @tc.name   : SwipeGesture, fingers = 1, isFingerCountLimited is true
     * @tc.desc   : Verify action gesture fingers limite interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0440', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0440 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ACEActionGestureFingersLimit/ACEActionGestureFingersLimit27')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('ACEActionGestureFingersLimit27'),1000);
      let point = await button.getBoundsCenter()
      let pointers: PointerMatrix = PointerMatrix.create(1,2);
      pointers.setPoint(0,0,{x:point.x-100,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      let pointers1: PointerMatrix = PointerMatrix.create(2, 3);
      pointers1.setPoint(0, 0, {x: point.x - 100, y: point.y - 20});
      pointers1.setPoint(1, 0, {x: point.x - 100, y: point.y + 20});
      pointers1.setPoint(0, 1, {x: point.x - 50, y: point.y - 20});
      pointers1.setPoint(1, 1, {x: point.x - 50, y: point.y + 20});
      pointers1.setPoint(0, 2, {x: point.x, y: point.y - 20});
      pointers1.setPoint(1, 2, {x: point.x, y: point.y + 20});
      await driver.injectMultiPointerAction(pointers1);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0440 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0460
     * @tc.name   : SwipeGesture, fingers = 2, isFingerCountLimited is true
     * @tc.desc   : Verify action gesture fingers limite interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0460', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0460 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ACEActionGestureFingersLimit/ACEActionGestureFingersLimit28')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('ACEActionGestureFingersLimit28'),1000);
      let point = await button.getBoundsCenter()
      let pointers: PointerMatrix = PointerMatrix.create(1,2);
      pointers.setPoint(0,0,{x:point.x-100,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      let pointers1: PointerMatrix = PointerMatrix.create(2, 3);
      pointers1.setPoint(0, 0, {x: point.x - 100, y: point.y - 20});
      pointers1.setPoint(1, 0, {x: point.x - 100, y: point.y + 20});
      pointers1.setPoint(0, 1, {x: point.x - 50, y: point.y - 20});
      pointers1.setPoint(1, 1, {x: point.x - 50, y: point.y + 20});
      pointers1.setPoint(0, 2, {x: point.x, y: point.y - 20});
      pointers1.setPoint(1, 2, {x: point.x, y: point.y + 20});
      await driver.injectMultiPointerAction(pointers1);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      let pointers2: PointerMatrix = PointerMatrix.create(3, 3);
      pointers2.setPoint(0, 0, {x: point.x - 100, y: point.y - 30});
      pointers2.setPoint(1, 0, {x: point.x - 100, y: point.y});
      pointers2.setPoint(2, 0, {x: point.x - 100, y: point.y + 30});
      pointers2.setPoint(0, 1, {x: point.x - 50, y: point.y - 30});
      pointers2.setPoint(1, 1, {x: point.x - 50, y: point.y});
      pointers2.setPoint(2, 1, {x: point.x - 50, y: point.y + 30});
      pointers2.setPoint(0, 2, {x: point.x, y: point.y - 30});
      pointers2.setPoint(1, 2, {x: point.x, y: point.y});
      pointers2.setPoint(2, 2, {x: point.x, y: point.y + 30});
      await driver.injectMultiPointerAction(pointers2);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0460 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0470
     * @tc.name   : SwipeGesture, fingers = 3, isFingerCountLimited is true
     * @tc.desc   : Verify action gesture fingers limite interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0470', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0470 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ACEActionGestureFingersLimit/ACEActionGestureFingersLimit29')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('ACEActionGestureFingersLimit29'),1000);
      let point = await button.getBoundsCenter()
      let pointers: PointerMatrix = PointerMatrix.create(3, 5);
      pointers.setPoint(0, 0, {x: point.x - 180, y: point.y - 50});
      pointers.setPoint(1, 0, {x: point.x - 150, y: point.y + 10});
      pointers.setPoint(2, 0, {x: point.x - 180, y: point.y + 70});
      pointers.setPoint(0, 1, {x: point.x - 120, y: point.y - 50});
      pointers.setPoint(1, 1, {x: point.x - 90, y: point.y + 10});
      pointers.setPoint(2, 1, {x: point.x - 120, y: point.y + 70});
      pointers.setPoint(0, 2, {x: point.x - 60, y: point.y - 50});
      pointers.setPoint(1, 2, {x: point.x - 30, y: point.y + 10});
      pointers.setPoint(2, 2, {x: point.x - 60, y: point.y + 70});
      pointers.setPoint(0, 3, {x: point.x - 20, y: point.y - 50});
      pointers.setPoint(1, 3, {x: point.x + 10, y: point.y + 10});
      pointers.setPoint(2, 3, {x: point.x - 20, y: point.y + 70});
      pointers.setPoint(0, 4, {x: point.x + 40, y: point.y - 50});
      pointers.setPoint(1, 4, {x: point.x + 70, y: point.y + 10});
      pointers.setPoint(2, 4, {x: point.x + 40, y: point.y + 70});
      await driver.injectMultiPointerAction(pointers);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0470 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0480
     * @tc.name   : SwipeGesture, fingers = 1, isFingerCountLimited is false
     * @tc.desc   : Verify action gesture fingers limite interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0480', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0480 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ACEActionGestureFingersLimit/ACEActionGestureFingersLimit30')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('ACEActionGestureFingersLimit30'),1000);
      let point = await button.getBoundsCenter()
      let pointers: PointerMatrix = PointerMatrix.create(1,2);
      pointers.setPoint(0,0,{x:point.x-100,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      let pointers1: PointerMatrix = PointerMatrix.create(2, 3);
      pointers1.setPoint(0, 0, {x: point.x - 100, y: point.y - 20});
      pointers1.setPoint(1, 0, {x: point.x - 100, y: point.y + 20});
      pointers1.setPoint(0, 1, {x: point.x - 50, y: point.y - 20});
      pointers1.setPoint(1, 1, {x: point.x - 50, y: point.y + 20});
      pointers1.setPoint(0, 2, {x: point.x, y: point.y - 20});
      pointers1.setPoint(1, 2, {x: point.x, y: point.y + 20});
      await driver.injectMultiPointerAction(pointers1);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0480 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0490
     * @tc.name   : SwipeGesture, fingers = 2, isFingerCountLimited is false
     * @tc.desc   : Verify action gesture fingers limite interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0490', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0490 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ACEActionGestureFingersLimit/ACEActionGestureFingersLimit31')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('ACEActionGestureFingersLimit31'),1000);
      let point = await button.getBoundsCenter()
      let pointers2: PointerMatrix = PointerMatrix.create(1,2);
      pointers2.setPoint(0,0,{x:point.x-100,y:point.y});
      pointers2.setPoint(0,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers2);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      let pointers1: PointerMatrix = PointerMatrix.create(2, 3);
      pointers1.setPoint(0, 0, {x: point.x - 100, y: point.y - 20});
      pointers1.setPoint(1, 0, {x: point.x - 100, y: point.y + 20});
      pointers1.setPoint(0, 1, {x: point.x - 50, y: point.y - 20});
      pointers1.setPoint(1, 1, {x: point.x - 50, y: point.y + 20});
      pointers1.setPoint(0, 2, {x: point.x, y: point.y - 20});
      pointers1.setPoint(1, 2, {x: point.x, y: point.y + 20});
      await driver.injectMultiPointerAction(pointers1);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      let pointers: PointerMatrix = PointerMatrix.create(3, 5);
      pointers.setPoint(0, 0, {x: point.x - 180, y: point.y - 50});
      pointers.setPoint(1, 0, {x: point.x - 150, y: point.y + 10});
      pointers.setPoint(2, 0, {x: point.x - 180, y: point.y + 70});
      pointers.setPoint(0, 1, {x: point.x - 120, y: point.y - 50});
      pointers.setPoint(1, 1, {x: point.x - 90, y: point.y + 10});
      pointers.setPoint(2, 1, {x: point.x - 120, y: point.y + 70});
      pointers.setPoint(0, 2, {x: point.x - 60, y: point.y - 50});
      pointers.setPoint(1, 2, {x: point.x - 30, y: point.y + 10});
      pointers.setPoint(2, 2, {x: point.x - 60, y: point.y + 70});
      pointers.setPoint(0, 3, {x: point.x - 20, y: point.y - 50});
      pointers.setPoint(1, 3, {x: point.x + 10, y: point.y + 10});
      pointers.setPoint(2, 3, {x: point.x - 20, y: point.y + 70});
      pointers.setPoint(0, 4, {x: point.x + 40, y: point.y - 50});
      pointers.setPoint(1, 4, {x: point.x + 70, y: point.y + 10});
      pointers.setPoint(2, 4, {x: point.x + 40, y: point.y + 70});
      await driver.injectMultiPointerAction(pointers);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0490 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0500
     * @tc.name   : SwipeGesture, fingers = 1, isFingerCountLimited is undefined
     * @tc.desc   : Verify action gesture fingers limite interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0500', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0500 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ACEActionGestureFingersLimit/ACEActionGestureFingersLimit32')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('ACEActionGestureFingersLimit32'),1000);
      let point = await button.getBoundsCenter()
      let pointers: PointerMatrix = PointerMatrix.create(1,2);
      pointers.setPoint(0,0,{x:point.x-100,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      let pointers1: PointerMatrix = PointerMatrix.create(2, 3);
      pointers1.setPoint(0, 0, {x: point.x - 100, y: point.y - 20});
      pointers1.setPoint(1, 0, {x: point.x - 100, y: point.y + 20});
      pointers1.setPoint(0, 1, {x: point.x - 50, y: point.y - 20});
      pointers1.setPoint(1, 1, {x: point.x - 50, y: point.y + 20});
      pointers1.setPoint(0, 2, {x: point.x, y: point.y - 20});
      pointers1.setPoint(1, 2, {x: point.x, y: point.y + 20});
      await driver.injectMultiPointerAction(pointers1);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0500 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0510
     * @tc.name   : SwipeGesture, fingers is default, isFingerCountLimited is true
     * @tc.desc   : Verify action gesture fingers limite interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0510', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0510 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ACEActionGestureFingersLimit/ACEActionGestureFingersLimit33')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('ACEActionGestureFingersLimit33'),1000);
      let point = await button.getBoundsCenter()
      let pointers: PointerMatrix = PointerMatrix.create(1,2);
      pointers.setPoint(0,0,{x:point.x-100,y:point.y});
      pointers.setPoint(0,1,{x:point.x,y:point.y});
      await driver.injectMultiPointerAction(pointers);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      let pointers1: PointerMatrix = PointerMatrix.create(2, 3);
      pointers1.setPoint(0, 0, {x: point.x - 100, y: point.y - 20});
      pointers1.setPoint(1, 0, {x: point.x - 100, y: point.y + 20});
      pointers1.setPoint(0, 1, {x: point.x - 50, y: point.y - 20});
      pointers1.setPoint(1, 1, {x: point.x - 50, y: point.y + 20});
      pointers1.setPoint(0, 2, {x: point.x, y: point.y - 20});
      pointers1.setPoint(1, 2, {x: point.x, y: point.y + 20});
      await driver.injectMultiPointerAction(pointers1);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0510 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0450
     * @tc.name   : SwipeGesture, fingers = 2, isFingerCountLimited is false
     * @tc.desc   : Verify action gesture fingers limite interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0450', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0450 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ACEActionGestureFingersLimit/ACEActionGestureFingersLimit34')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('ACEActionGestureFingersLimit34'),1000);
      let point = await button.getBoundsCenter()
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      let pointers: PointerMatrix = PointerMatrix.create(2, 9);
      // 1. 单指滑动（手指0移动，手指1未加入→固定在初始位，时间点0-2）
      pointers.setPoint(0, 0, {x: point.x - 220, y: point.y - 30});
      pointers.setPoint(1, 0, {x: point.x - 220, y: point.y + 50});
      pointers.setPoint(0, 1, {x: point.x - 170, y: point.y - 30});
      pointers.setPoint(1, 1, {x: point.x - 220, y: point.y + 50});
      pointers.setPoint(0, 2, {x: point.x - 120, y: point.y - 30});
      pointers.setPoint(1, 2, {x: point.x - 220, y: point.y + 50});
      // 2. 增加一根手指（手指1开始同步滑动，双指同方向同速度，时间点3-5）
      pointers.setPoint(0, 3, {x: point.x - 70, y: point.y - 30});
      pointers.setPoint(1, 3, {x: point.x - 170, y: point.y + 50});
      pointers.setPoint(0, 4, {x: point.x - 20, y: point.y - 30});
      pointers.setPoint(1, 4, {x: point.x - 120, y: point.y + 50});
      pointers.setPoint(0, 5, {x: point.x + 30, y: point.y - 30});
      pointers.setPoint(1, 5, {x: point.x - 70, y: point.y + 50});
      // 3. 减少一根手指（手指1停止移动，仅手指0继续滑动，时间点6-7）
      pointers.setPoint(0, 6, {x: point.x + 80, y: point.y - 30});
      pointers.setPoint(1, 6, {x: point.x - 70, y: point.y + 50});
      pointers.setPoint(0, 7, {x: point.x + 130, y: point.y - 30});
      pointers.setPoint(1, 7, {x: point.x - 70, y: point.y + 50});
      // 4. 抬手（手指0停止，模拟结束滑动，时间点8）
      pointers.setPoint(0, 8, {x: point.x + 130, y: point.y - 30});
      pointers.setPoint(1, 8, {x: point.x - 70, y: point.y + 50});
      await driver.injectMultiPointerAction(pointers);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0450 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0320
     * @tc.name   : PanGesture, fingers = 2, isFingerCountLimited is true (1)
     * @tc.desc   : Verify action gesture fingers limite interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0320', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0320 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ACEActionGestureFingersLimit/ACEActionGestureFingersLimit37')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('ACEActionGestureFingersLimit37'),1000);
      let point = await button.getBoundsCenter()
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      let pointers: PointerMatrix = PointerMatrix.create(2, 7);
      // 1. 单指滑动（时间点0-1）
      pointers.setPoint(0, 0, {x: point.x - 150, y: point.y});
      pointers.setPoint(1, 0, {x: point.x - 150, y: point.y + 80});
      pointers.setPoint(0, 1, {x: point.x - 100, y: point.y});
      pointers.setPoint(1, 1, {x: point.x - 150, y: point.y + 80});
      // 2. 增加一根手指（时间点2-4）
      pointers.setPoint(0, 2, {x: point.x - 50, y: point.y});
      pointers.setPoint(1, 2, {x: point.x - 100, y: point.y + 80});
      pointers.setPoint(0, 3, {x: point.x, y: point.y});
      pointers.setPoint(1, 3, {x: point.x - 50, y: point.y + 80});
      pointers.setPoint(0, 4, {x: point.x + 50, y: point.y});
      pointers.setPoint(1, 4, {x: point.x, y: point.y + 80});
      // 3. 减少一根手指（时间点5-6）
      pointers.setPoint(0, 5, {x: point.x + 100, y: point.y});
      pointers.setPoint(1, 5, {x: point.x, y: point.y + 80});
      pointers.setPoint(0, 6, {x: point.x + 100, y: point.y});
      pointers.setPoint(1, 6, {x: point.x, y: point.y + 80});
      await driver.injectMultiPointerAction(pointers);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0320 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0330
     * @tc.name   : PanGesture, fingers = 2, isFingerCountLimited is true (2)
     * @tc.desc   : Verify action gesture fingers limite interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0330', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0330 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ACEActionGestureFingersLimit/ACEActionGestureFingersLimit38')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('ACEActionGestureFingersLimit38'),1000);
      let point = await button.getBoundsCenter()
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      let pointers: PointerMatrix = PointerMatrix.create(2, 5);
      // 1. 双指滑动（时间点0-2）
      pointers.setPoint(0, 0, {x: point.x - 150, y: point.y - 20});
      pointers.setPoint(1, 0, {x: point.x - 150, y: point.y + 20});
      pointers.setPoint(0, 1, {x: point.x - 100, y: point.y - 20});
      pointers.setPoint(1, 1, {x: point.x - 100, y: point.y + 20});
      pointers.setPoint(0, 2, {x: point.x - 50, y: point.y - 20});
      pointers.setPoint(1, 2, {x: point.x - 50, y: point.y + 20});
      // 2. 减少一根手指（时间点3-4）
      pointers.setPoint(0, 3, {x: point.x, y: point.y - 20});
      pointers.setPoint(1, 3, {x: point.x - 50, y: point.y + 20});
      pointers.setPoint(0, 4, {x: point.x, y: point.y - 20});
      pointers.setPoint(1, 4, {x: point.x - 50, y: point.y + 20});
      await driver.injectMultiPointerAction(pointers);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0330 finish.`);
      done();
    })

    /*
     * @tc.number : SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0340
     * @tc.name   : PanGesture, fingers = 2, isFingerCountLimited is true (3)
     * @tc.desc   : Verify action gesture fingers limite interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0340', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0340 start.`);
      Settings.createWindow('testability/pages/scenario/action_event/ACEActionGestureFingersLimit/ACEActionGestureFingersLimit39')
      let driver:Driver=Driver.create();
      let button: Component = await driver.waitForComponent(ON.id('ACEActionGestureFingersLimit39'),1000);
      let point = await button.getBoundsCenter()
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      let pointers: PointerMatrix = PointerMatrix.create(3, 9);
      // 1. 双指滑动（时间点0-2）
      pointers.setPoint(0, 0, {x: point.x - 150, y: point.y - 30});
      pointers.setPoint(1, 0, {x: point.x - 150, y: point.y + 30});
      pointers.setPoint(2, 0, {x: point.x - 150, y: point.y + 100});
      pointers.setPoint(0, 1, {x: point.x - 100, y: point.y - 30});
      pointers.setPoint(1, 1, {x: point.x - 100, y: point.y + 30});
      pointers.setPoint(2, 1, {x: point.x - 150, y: point.y + 100});
      pointers.setPoint(0, 2, {x: point.x - 50, y: point.y - 30});
      pointers.setPoint(1, 2, {x: point.x - 50, y: point.y + 30});
      pointers.setPoint(2, 2, {x: point.x - 150, y: point.y + 100});
      // 2. 增加一根手指（时间点3-5）
      pointers.setPoint(0, 3, {x: point.x, y: point.y - 30});
      pointers.setPoint(1, 3, {x: point.x, y: point.y + 30});
      pointers.setPoint(2, 3, {x: point.x - 100, y: point.y + 100});
      pointers.setPoint(0, 4, {x: point.x + 50, y: point.y - 30});
      pointers.setPoint(1, 4, {x: point.x + 50, y: point.y + 30});
      pointers.setPoint(2, 4, {x: point.x - 50, y: point.y + 100});
      pointers.setPoint(0, 5, {x: point.x + 100, y: point.y - 30});
      pointers.setPoint(1, 5, {x: point.x + 100, y: point.y + 30});
      pointers.setPoint(2, 5, {x: point.x, y: point.y + 100});
      // 3. 减少一根手指（时间点6-7）
      pointers.setPoint(0, 6, {x: point.x + 150, y: point.y - 30});
      pointers.setPoint(1, 6, {x: point.x + 150, y: point.y + 30});
      pointers.setPoint(2, 6, {x: point.x, y: point.y + 100});
      pointers.setPoint(0, 7, {x: point.x + 200, y: point.y - 30});
      pointers.setPoint(1, 7, {x: point.x + 200, y: point.y + 30});
      pointers.setPoint(2, 7, {x: point.x, y: point.y + 100});
      // 4. 松开所有手指（时间点8）
      pointers.setPoint(0, 8, {x: point.x + 200, y: point.y - 30});
      pointers.setPoint(1, 8, {x: point.x + 200, y: point.y + 30});
      pointers.setPoint(2, 8, {x: point.x, y: point.y + 100});
      await driver.injectMultiPointerAction(pointers);
      await Utils.sleep(1000);
      windowSnap.snapShot()
      Logger.info('TEST', `SUB_ACE_ACTION_GESTURE_FINGERS_LIMITE_0340 finish.`);
      done();
    })

  })
}