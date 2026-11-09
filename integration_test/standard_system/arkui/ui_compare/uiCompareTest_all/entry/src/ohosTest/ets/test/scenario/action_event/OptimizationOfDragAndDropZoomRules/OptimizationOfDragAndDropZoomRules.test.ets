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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import Settings from '../../../model/Settings';
import windowSnap from '../../../model/snapShot';
import Logger from '../../../model/Logger';
import Utils from '../../../model/Utils';
import { Driver, ON, Component, MouseButton } from '@kit.TestKit';
import { window } from '@kit.ArkUI';
import { BusinessError, commonEventManager } from '@kit.BasicServicesKit';
import { Point } from '@kit.TestKit'

export default function optimizationOfDragAndDropZoomRulesTest() {
  describe('optimizationOfDragAndDropZoomRulesTest', () => {
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
     * @tc.number : SUB_ACE_OPTIMIZATION_OF_DRAG_AND_DROP_ZOOM_RULES_FOR_HAND_FOLLOWING_IMAGES_004
     * @tc.name   : Optimization of drag and drop zoom rules for hand following images
     * @tc.desc   : Verify optimization of drag and drop zoom rules for hand following images interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_OPTIMIZATION_OF_DRAG_AND_DROP_ZOOM_RULES_FOR_HAND_FOLLOWING_IMAGES_004', Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'SUB_ACE_OPTIMIZATION_OF_DRAG_AND_DROP_ZOOM_RULES_FOR_HAND_FOLLOWING_IMAGES_004';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/scenario/action_event/OptimizationOfDragAndDropZoomRules/OptimizationOfDragAndDropZoomRules001');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      let text1: Component = await driver.waitForComponent(ON.id('text1'), 1000);
      let point1 = await text1.getBoundsCenter();
      console.info(`${caseName} point of text1 is ${JSON.stringify(point1)}`);
      let rect = await text1.getBounds();
      console.info(`${caseName} rect of text1 is ${JSON.stringify(rect)}`);
      let text2: Component = await driver.waitForComponent(ON.id('text2'), 1000);
      let point2 = await text2.getBoundsCenter();
      console.info(`${caseName} point of text2 is ${JSON.stringify(point2)}`);
      await driver.mouseDrag({x: rect.left, y: rect.top}, {x: rect.right, y: rect.bottom}, 6000);
      await driver.waitForIdle(500, 1000);
      await driver.longClick(point1.x, point1.y);
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 2000);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_OPTIMIZATION_OF_DRAG_AND_DROP_ZOOM_RULES_FOR_HAND_FOLLOWING_IMAGES_004');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_OPTIMIZATION_OF_DRAG_AND_DROP_ZOOM_RULES_FOR_HAND_FOLLOWING_IMAGES_002
     * @tc.name   : Optimization of drag and drop zoom rules for hand following images
     * @tc.desc   : Verify optimization of drag and drop zoom rules for hand following images interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_OPTIMIZATION_OF_DRAG_AND_DROP_ZOOM_RULES_FOR_HAND_FOLLOWING_IMAGES_002', Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'SUB_ACE_OPTIMIZATION_OF_DRAG_AND_DROP_ZOOM_RULES_FOR_HAND_FOLLOWING_IMAGES_002';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/scenario/action_event/OptimizationOfDragAndDropZoomRules/OptimizationOfDragAndDropZoomRules002');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      let text1: Component = await driver.waitForComponent(ON.id('text1'), 1000);
      let point1 = await text1.getBoundsCenter();
      console.info(`${caseName} point of text1 is ${JSON.stringify(point1)}`);
      let rect = await text1.getBounds();
      console.info(`${caseName} rect of text1 is ${JSON.stringify(rect)}`);
      let text2: Component = await driver.waitForComponent(ON.id('text2'), 1000);
      let point2 = await text2.getBoundsCenter();
      console.info(`${caseName} point of text2 is ${JSON.stringify(point2)}`);
      await driver.mouseDrag({ x: rect.left, y: rect.top }, { x: rect.right, y: (rect.top + rect.bottom)/2-200 }, 8000);
      await driver.waitForIdle(500, 1000);
      await driver.mouseLongClick({ x: point1.x, y: ((rect.top + rect.bottom)/2-200)/2 }, MouseButton.MOUSE_BUTTON_LEFT);
      await driver.drag(point1.x, ((rect.top + rect.bottom)/2-200)/2, point2.x, point2.y, 7000);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_OPTIMIZATION_OF_DRAG_AND_DROP_ZOOM_RULES_FOR_HAND_FOLLOWING_IMAGES_002');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_OPTIMIZATION_OF_DRAG_AND_DROP_ZOOM_RULES_FOR_HAND_FOLLOWING_IMAGES_003
     * @tc.name   : Optimization of drag and drop zoom rules for hand following images
     * @tc.desc   : Verify optimization of drag and drop zoom rules for hand following images interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_OPTIMIZATION_OF_DRAG_AND_DROP_ZOOM_RULES_FOR_HAND_FOLLOWING_IMAGES_003', Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'SUB_ACE_OPTIMIZATION_OF_DRAG_AND_DROP_ZOOM_RULES_FOR_HAND_FOLLOWING_IMAGES_003';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/scenario/action_event/OptimizationOfDragAndDropZoomRules/OptimizationOfDragAndDropZoomRules003');
      let driver: Driver = Driver.create();
      await driver.waitForIdle(500, 2000);
      let text1: Component = await driver.waitForComponent(ON.id('text1'), 1000);
      let point1 = await text1.getBoundsCenter();
      console.info(`${caseName} point of text1 is ${JSON.stringify(point1)}`);
      let rect = await text1.getBounds();
      console.info(`${caseName} rect of text1 is ${JSON.stringify(rect)}`);
      let text2: Component = await driver.waitForComponent(ON.id('text2'), 1000);
      let point2 = await text2.getBoundsCenter();
      console.info(`${caseName} point of text2 is ${JSON.stringify(point2)}`);
      await driver.mouseDrag({ x: rect.left, y: rect.top }, { x: rect.right, y: (rect.top + rect.bottom)/2+200 }, 8000);
      await driver.waitForIdle(500, 1000);
      let point3: Point = { x: point1.x, y: ((rect.top + rect.bottom)/2+200)/2 };
      await driver.mouseLongClick(point3, MouseButton.MOUSE_BUTTON_LEFT);
      await driver.drag(point3.x, point3.y, point2.x, point2.y, 7000);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_OPTIMIZATION_OF_DRAG_AND_DROP_ZOOM_RULES_FOR_HAND_FOLLOWING_IMAGES_003');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_OPTIMIZATION_OF_DRAG_AND_DROP_ZOOM_RULES_FOR_HAND_FOLLOWING_IMAGES_016
     * @tc.name   : Optimization of drag and drop zoom rules for hand following images
     * @tc.desc   : Verify optimization of drag and drop zoom rules for hand following images interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_OPTIMIZATION_OF_DRAG_AND_DROP_ZOOM_RULES_FOR_HAND_FOLLOWING_IMAGES_016', Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'SUB_ACE_OPTIMIZATION_OF_DRAG_AND_DROP_ZOOM_RULES_FOR_HAND_FOLLOWING_IMAGES_016';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/scenario/action_event/OptimizationOfDragAndDropZoomRules/OptimizationOfDragAndDropZoomRules004');
      let driver: Driver = Driver.create();
      let image1: Component = await driver.waitForComponent(ON.id('image1'), 1000);
      let point1 = await image1.getBoundsCenter();
      console.info(`${caseName} point of image1 is ${JSON.stringify(point1)}`);
      let image2: Component = await driver.waitForComponent(ON.id('image2'), 1000);
      let point2 = await image2.getBoundsCenter();
      console.info(`${caseName} point of image2 is ${JSON.stringify(point2)}`);
      await driver.waitForIdle(500, 1000);
      await driver.mouseLongClick(point1, MouseButton.MOUSE_BUTTON_LEFT);
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 2000);
      windowSnap.snapShot('SUB_ACE_OPTIMIZATION_OF_DRAG_AND_DROP_ZOOM_RULES_FOR_HAND_FOLLOWING_IMAGES_016');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_OPTIMIZATION_OF_DRAG_AND_DROP_ZOOM_RULES_FOR_HAND_FOLLOWING_IMAGES_014
     * @tc.name   : Optimization of drag and drop zoom rules for hand following images
     * @tc.desc   : Verify optimization of drag and drop zoom rules for hand following images interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_OPTIMIZATION_OF_DRAG_AND_DROP_ZOOM_RULES_FOR_HAND_FOLLOWING_IMAGES_014', Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'SUB_ACE_OPTIMIZATION_OF_DRAG_AND_DROP_ZOOM_RULES_FOR_HAND_FOLLOWING_IMAGES_014';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/scenario/action_event/OptimizationOfDragAndDropZoomRules/OptimizationOfDragAndDropZoomRules005');
      let driver: Driver = Driver.create();
      let image1: Component = await driver.waitForComponent(ON.id('image1'), 1000);
      let point1 = await image1.getBoundsCenter();
      console.info(`${caseName} point of image1 is ${JSON.stringify(point1)}`);
      let image2: Component = await driver.waitForComponent(ON.id('image2'), 1000);
      let point2 = await image2.getBoundsCenter();
      console.info(`${caseName} point of image2 is ${JSON.stringify(point2)}`);
      await driver.waitForIdle(500, 1000);
      await driver.mouseLongClick(point1, MouseButton.MOUSE_BUTTON_LEFT);
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 2000);
      windowSnap.snapShot('SUB_ACE_OPTIMIZATION_OF_DRAG_AND_DROP_ZOOM_RULES_FOR_HAND_FOLLOWING_IMAGES_014');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });

    /*
     * @tc.number : SUB_ACE_OPTIMIZATION_OF_DRAG_AND_DROP_ZOOM_RULES_FOR_HAND_FOLLOWING_IMAGES_015
     * @tc.name   : Optimization of drag and drop zoom rules for hand following images
     * @tc.desc   : Verify optimization of drag and drop zoom rules for hand following images interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_OPTIMIZATION_OF_DRAG_AND_DROP_ZOOM_RULES_FOR_HAND_FOLLOWING_IMAGES_015', Level.LEVEL0, async (done: Function) => {
      const caseName: string = 'SUB_ACE_OPTIMIZATION_OF_DRAG_AND_DROP_ZOOM_RULES_FOR_HAND_FOLLOWING_IMAGES_015';
      Logger.info('TEST', `${caseName} start.`);
      Settings.createWindow('testability/pages/scenario/action_event/OptimizationOfDragAndDropZoomRules/OptimizationOfDragAndDropZoomRules006');
      let driver: Driver = Driver.create();
      let image1: Component = await driver.waitForComponent(ON.id('image1'), 1000);
      let point1 = await image1.getBoundsCenter();
      console.info(`${caseName} point of image1 is ${JSON.stringify(point1)}`);
      let image2: Component = await driver.waitForComponent(ON.id('image2'), 1000);
      let point2 = await image2.getBoundsCenter();
      console.info(`${caseName} point of image2 is ${JSON.stringify(point2)}`);
      await driver.waitForIdle(500, 1000);
      await driver.mouseLongClick(point1, MouseButton.MOUSE_BUTTON_LEFT);
      await driver.drag(point1.x, point1.y, point2.x, point2.y, 2000);
      await driver.waitForIdle(500, 2000);
      windowSnap.snapShot('SUB_ACE_OPTIMIZATION_OF_DRAG_AND_DROP_ZOOM_RULES_FOR_HAND_FOLLOWING_IMAGES_015');
      await Utils.sleep(1000);
      Logger.info('TEST', `${caseName} finish.`);
      done();
    });
  })
}