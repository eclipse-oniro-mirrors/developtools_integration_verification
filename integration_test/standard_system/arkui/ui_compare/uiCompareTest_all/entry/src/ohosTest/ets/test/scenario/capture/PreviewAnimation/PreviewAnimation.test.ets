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

export default function previewAnimation() {

  describe('previewAnimation', () => {
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
     * @tc.number : SUB_ACE_PREVIEW_ANIMATION_0020
     * @tc.name   : Preview animation
     * @tc.desc   : Verify preview animation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_PREVIEW_ANIMATION_0020', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_PREVIEW_ANIMATION_0020 start.`);
      Settings.createWindow('testability/pages/scenario/capture/PreviewAnimation/PreviewAnimation0020')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      
      // 初始状态截图
      Logger.info('TEST', 'Taking initial screenshot');
      windowSnap.snapShot()
      await Utils.sleep(500)
      
      try {
        // 测试宽度动画
        Logger.info('TEST', 'Testing width animation');
        let btnWidth: Component = await driver.findComponent(ON.id('PreviewAnimation0020_005'));
        if (btnWidth) {
          await btnWidth.click();
          await Utils.sleep(300)
          windowSnap.snapShot()
          Logger.info('TEST', 'Width animation completed');
        }
        
        // 测试高度动画
        Logger.info('TEST', 'Testing height animation');
        let btnHeight: Component = await driver.findComponent(ON.id('PreviewAnimation0020_006'));
        if (btnHeight) {
          await btnHeight.click();
          await Utils.sleep(300)
          windowSnap.snapShot()
          Logger.info('TEST', 'Height animation completed');
        }
        
        // 测试透明度动画
        Logger.info('TEST', 'Testing opacity animation');
        let btnOpacity: Component = await driver.findComponent(ON.id('PreviewAnimation0020_007'));
        if (btnOpacity) {
          await btnOpacity.click();
          await Utils.sleep(300)
          windowSnap.snapShot()
          Logger.info('TEST', 'Opacity animation completed');
        }
        
        // 测试平移动画
        Logger.info('TEST', 'Testing translate animation');
        let btnTranslate: Component = await driver.findComponent(ON.id('PreviewAnimation0020_008'));
        if (btnTranslate) {
          await btnTranslate.click();
          await Utils.sleep(300)
          windowSnap.snapShot()
          Logger.info('TEST', 'Translate animation completed');
        }
        
        // 测试旋转动画
        Logger.info('TEST', 'Testing rotate animation');
        let btnRotate: Component = await driver.findComponent(ON.id('PreviewAnimation0020_009'));
        if (btnRotate) {
          await btnRotate.click();
          await Utils.sleep(300)
          windowSnap.snapShot()
          Logger.info('TEST', 'Rotate animation completed');
        }
        
        // 测试缩放动画
        Logger.info('TEST', 'Testing scale animation');
        let btnScale: Component = await driver.findComponent(ON.id('PreviewAnimation0020_010'));
        if (btnScale) {
          await btnScale.click();
          await Utils.sleep(300)
          windowSnap.snapShot()
          Logger.info('TEST', 'Scale animation completed');
        }
        
        // 重置所有状态
        Logger.info('TEST', 'Resetting all animations');
        let btnReset: Component = await driver.findComponent(ON.id('PreviewAnimation0020_012'));
        if (btnReset) {
          await btnReset.click();
          await Utils.sleep(300)
          windowSnap.snapShot()
          Logger.info('TEST', 'Reset completed');
        }
        
        // 测试组合动画
        Logger.info('TEST', 'Testing combined animation');
        let btnCombined: Component = await driver.findComponent(ON.id('PreviewAnimation0020_011'));
        if (btnCombined) {
          await btnCombined.click();
          await Utils.sleep(300)
          windowSnap.snapShot()
          Logger.info('TEST', 'Combined animation completed');
        }
        
        // 最终重置
        Logger.info('TEST', 'Final reset');
        if (btnReset) {
          await btnReset.click();
          await Utils.sleep(300)
          windowSnap.snapShot()
          Logger.info('TEST', 'Final reset completed');
        }
      } catch (error) {
        Logger.error('TEST', `Error during test: ${error}`);
      }
      
      Logger.info('TEST', `SUB_ACE_PREVIEW_ANIMATION_0020 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_PREVIEW_ANIMATION_0030
     * @tc.name   : Preview animation
     * @tc.desc   : Verify preview animation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_PREVIEW_ANIMATION_0030', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_PREVIEW_ANIMATION_0030 start.`);
      Settings.createWindow('testability/pages/scenario/capture/PreviewAnimation/PreviewAnimation0030')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      
      // 初始状态截图
      Logger.info('TEST', 'Taking initial screenshot');
      windowSnap.snapShot()
      await Utils.sleep(500)
      
      try {
        // 测试宽度动画
        Logger.info('TEST', 'Testing width animation');
        let btnWidth: Component = await driver.findComponent(ON.id('PreviewAnimation0030_005'));
        if (btnWidth) {
          await btnWidth.click();
          await Utils.sleep(300)
          windowSnap.snapShot()
          Logger.info('TEST', 'Width animation completed');
        }
        
        // 测试高度动画
        Logger.info('TEST', 'Testing height animation');
        let btnHeight: Component = await driver.findComponent(ON.id('PreviewAnimation0030_006'));
        if (btnHeight) {
          await btnHeight.click();
          await Utils.sleep(300)
          windowSnap.snapShot()
          Logger.info('TEST', 'Height animation completed');
        }
        
        // 测试透明度动画
        Logger.info('TEST', 'Testing opacity animation');
        let btnOpacity: Component = await driver.findComponent(ON.id('PreviewAnimation0030_007'));
        if (btnOpacity) {
          await btnOpacity.click();
          await Utils.sleep(300)
          windowSnap.snapShot()
          Logger.info('TEST', 'Opacity animation completed');
        }
        
        // 测试平移动画
        Logger.info('TEST', 'Testing translate animation');
        let btnTranslate: Component = await driver.findComponent(ON.id('PreviewAnimation0030_008'));
        if (btnTranslate) {
          await btnTranslate.click();
          await Utils.sleep(300)
          windowSnap.snapShot()
          Logger.info('TEST', 'Translate animation completed');
        }
        
        // 测试旋转动画
        Logger.info('TEST', 'Testing rotate animation');
        let btnRotate: Component = await driver.findComponent(ON.id('PreviewAnimation0030_009'));
        if (btnRotate) {
          await btnRotate.click();
          await Utils.sleep(300)
          windowSnap.snapShot()
          Logger.info('TEST', 'Rotate animation completed');
        }
        
        // 测试缩放动画
        Logger.info('TEST', 'Testing scale animation');
        let btnScale: Component = await driver.findComponent(ON.id('PreviewAnimation0030_010'));
        if (btnScale) {
          await btnScale.click();
          await Utils.sleep(300)
          windowSnap.snapShot()
          Logger.info('TEST', 'Scale animation completed');
        }
        
        // 重置所有状态
        Logger.info('TEST', 'Resetting all animations');
        let btnReset: Component = await driver.findComponent(ON.id('PreviewAnimation0030_012'));
        if (btnReset) {
          await btnReset.click();
          await Utils.sleep(300)
          windowSnap.snapShot()
          Logger.info('TEST', 'Reset completed');
        }
        
        // 测试组合动画
        Logger.info('TEST', 'Testing combined animation');
        let btnCombined: Component = await driver.findComponent(ON.id('PreviewAnimation0030_011'));
        if (btnCombined) {
          await btnCombined.click();
          await Utils.sleep(300)
          windowSnap.snapShot()
          Logger.info('TEST', 'Combined animation completed');
        }
        
        // 最终重置
        Logger.info('TEST', 'Final reset');
        if (btnReset) {
          await btnReset.click();
          await Utils.sleep(300)
          windowSnap.snapShot()
          Logger.info('TEST', 'Final reset completed');
        }
      } catch (error) {
        Logger.error('TEST', `Error during test: ${error}`);
      }
      
      Logger.info('TEST', `SUB_ACE_PREVIEW_ANIMATION_0030 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_PREVIEW_ANIMATION_0040
     * @tc.name   : Preview animation
     * @tc.desc   : Verify preview animation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_PREVIEW_ANIMATION_0040', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_PREVIEW_ANIMATION_0040 start.`);
      Settings.createWindow('testability/pages/scenario/capture/PreviewAnimation/PreviewAnimation0040')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      
      // 初始状态截图
      Logger.info('TEST', 'Taking initial screenshot');
      windowSnap.snapShot()
      await Utils.sleep(800)
      
      try {
        // 测试3D旋转
        Logger.info('TEST', 'Testing 3D rotation (x:-10, y:20, z:30, angle:-100)');
        let btn3DRotate: Component = await driver.findComponent(ON.id('PreviewAnimation0040_005'));
        if (btn3DRotate) {
          await btn3DRotate.click();
          await Utils.sleep(800)
          windowSnap.snapShot()
          Logger.info('TEST', '3D rotation completed');
        }
        
        // 测试X轴旋转
        Logger.info('TEST', 'Testing X-axis rotation');
        let btnXRotate: Component = await driver.findComponent(ON.id('PreviewAnimation0040_006'));
        if (btnXRotate) {
          await btnXRotate.click();
          await Utils.sleep(800)
          windowSnap.snapShot()
          Logger.info('TEST', 'X-axis rotation completed');
        }
        
        // 测试Y轴旋转
        Logger.info('TEST', 'Testing Y-axis rotation');
        let btnYRotate: Component = await driver.findComponent(ON.id('PreviewAnimation0040_007'));
        if (btnYRotate) {
          await btnYRotate.click();
          await Utils.sleep(800)
          windowSnap.snapShot()
          Logger.info('TEST', 'Y-axis rotation completed');
        }
        
        // 测试Z轴旋转
        Logger.info('TEST', 'Testing Z-axis rotation');
        let btnZRotate: Component = await driver.findComponent(ON.id('PreviewAnimation0040_008'));
        if (btnZRotate) {
          await btnZRotate.click();
          await Utils.sleep(800)
          windowSnap.snapShot()
          Logger.info('TEST', 'Z-axis rotation completed');
        }
        
        // 测试180度旋转
        Logger.info('TEST', 'Testing 180 degree rotation');
        let btnRotate180: Component = await driver.findComponent(ON.id('PreviewAnimation0040_009'));
        if (btnRotate180) {
          await btnRotate180.click();
          await Utils.sleep(800)
          windowSnap.snapShot()
          Logger.info('TEST', '180 degree rotation completed');
        }
        
        // 测试360度旋转
        Logger.info('TEST', 'Testing 360 degree rotation');
        let btnRotate360: Component = await driver.findComponent(ON.id('PreviewAnimation0040_010'));
        if (btnRotate360) {
          await btnRotate360.click();
          await Utils.sleep(800)
          windowSnap.snapShot()
          Logger.info('TEST', '360 degree rotation completed');
        }
        
        // 测试修改旋转中心(左上角)
        Logger.info('TEST', 'Testing rotation center change (top-left)');
        let btnCenterTopLeft: Component = await driver.findComponent(ON.id('PreviewAnimation0040_011'));
        if (btnCenterTopLeft) {
          await btnCenterTopLeft.click();
          await Utils.sleep(800)
          windowSnap.snapShot()
          Logger.info('TEST', 'Top-left center rotation completed');
        }
        
        // 测试修改旋转中心(右下角)
        Logger.info('TEST', 'Testing rotation center change (bottom-right)');
        let btnCenterBottomRight: Component = await driver.findComponent(ON.id('PreviewAnimation0040_012'));
        if (btnCenterBottomRight) {
          await btnCenterBottomRight.click();
          await Utils.sleep(800)
          windowSnap.snapShot()
          Logger.info('TEST', 'Bottom-right center rotation completed');
        }
        
        // 重置所有状态
        Logger.info('TEST', 'Resetting all rotations');
        let btnReset: Component = await driver.findComponent(ON.id('PreviewAnimation0040_014'));
        if (btnReset) {
          await btnReset.click();
          await Utils.sleep(800)
          windowSnap.snapShot()
          Logger.info('TEST', 'Reset completed');
        }
        
        // 测试组合旋转
        Logger.info('TEST', 'Testing combined rotation');
        let btnCombined: Component = await driver.findComponent(ON.id('PreviewAnimation0040_013'));
        if (btnCombined) {
          await btnCombined.click();
          await Utils.sleep(800)
          windowSnap.snapShot()
          Logger.info('TEST', 'Combined rotation completed');
        }
        
        // 最终重置
        Logger.info('TEST', 'Final reset');
        if (btnReset) {
          await btnReset.click();
          await Utils.sleep(800)
          windowSnap.snapShot()
          Logger.info('TEST', 'Final reset completed');
        }
      } catch (error) {
        Logger.error('TEST', `Error during test: ${error}`);
      }
      
      Logger.info('TEST', `SUB_ACE_PREVIEW_ANIMATION_0040 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_PREVIEW_ANIMATION_0050
     * @tc.name   : Preview animation
     * @tc.desc   : Verify preview animation interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_PREVIEW_ANIMATION_0050', Level.LEVEL3, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_PREVIEW_ANIMATION_0050 start.`);
      Settings.createWindow('testability/pages/scenario/capture/PreviewAnimation/PreviewAnimation0050')
      let driver: Driver = Driver.create();
      await driver.waitForIdle(2000, 3000)
      
      // 初始状态截图
      Logger.info('TEST', 'Taking initial screenshot of first page');
      windowSnap.snapShot()
      await Utils.sleep(500)
      
      try {
        // 测试Push跳转到第二页
        Logger.info('TEST', 'Testing Push transition to second page');
        let btnPush: Component = await driver.findComponent(ON.id('PreviewAnimation0050_005'));
        if (btnPush) {
          await btnPush.click();
          await Utils.sleep(1200) // 等待转场动画完成
          windowSnap.snapShot()
          Logger.info('TEST', 'Push transition completed, now on second page');
        }
        
        // 在第二页停留
        await Utils.sleep(500)
        windowSnap.snapShot()
        Logger.info('TEST', 'Second page displayed');
        
        // 测试Pop返回第一页
        Logger.info('TEST', 'Testing Pop transition back to first page');
        let btnBack: Component = await driver.findComponent(ON.id('PreviewAnimation0050_Second_004'));
        if (btnBack) {
          await btnBack.click();
          await Utils.sleep(1200) // 等待转场动画完成
          windowSnap.snapShot()
          Logger.info('TEST', 'Pop transition completed, back to first page');
        }
        
        // 最终状态截图
        await Utils.sleep(500)
        windowSnap.snapShot()
        Logger.info('TEST', 'Final state captured');
        
      } catch (error) {
        Logger.error('TEST', `Error during test: ${error}`);
      }
      
      Logger.info('TEST', `SUB_ACE_PREVIEW_ANIMATION_0050 finish.`);
      done()
    })

  })
}