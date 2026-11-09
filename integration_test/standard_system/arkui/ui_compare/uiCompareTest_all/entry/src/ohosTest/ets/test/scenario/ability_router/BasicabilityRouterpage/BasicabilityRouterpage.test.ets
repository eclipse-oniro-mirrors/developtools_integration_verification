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

import { describe, it, afterEach } from '@ohos/hypium';
import { Driver, ON } from '@kit.TestKit';
import Settings from '../../../model/Settings';
import windowSnap from '../../../model/snapShot';
import Logger from '../../../model/Logger';

export default function basicabilityRouterpage() {
  describe('basicabilityRouterpage', () => {
    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : SUB_ACE_BASICABILITY_ROUTERPAGE_008
     * @tc.name   : 跳转1个页面，更新到1个页面后，清空后在跳转1个页面
     * @tc.desc   : Verify basicability routerpage interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_BASICABILITY_ROUTERPAGE_008', 0, async () => {
      Logger.info('SUB_ACE_BASICABILITY_ROUTERPAGE_008 begin');
      
      await Settings.createWindow('testability/pages/scenario/ability_router/BasicabilityRouterpage/Routerpage008Main');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('ROUTERPAGE_008_main');
      
      // 步骤1：跳转到A页面
      const btnPushA = await driver.findComponent(ON.id('btn_push_a'));
      await btnPushA.click();
      await driver.delayMs(500);
      await windowSnap.snapShot('ROUTERPAGE_008_a');
      
      // 步骤2：更新到B页面
      const btnReplaceB = await driver.findComponent(ON.id('btn_replace_b'));
      await btnReplaceB.click();
      await driver.delayMs(500);
      await windowSnap.snapShot('ROUTERPAGE_008_b');
      
      // 步骤3：清空页面
      const btnClear = await driver.findComponent(ON.id('btn_clear'));
      await btnClear.click();
      await driver.delayMs(500);
      
      // 步骤4：更新到C页面
      const btnReplaceC = await driver.findComponent(ON.id('btn_replace_c'));
      await btnReplaceC.click();
      await driver.delayMs(500);
      await windowSnap.snapShot('ROUTERPAGE_008_c');
      
      Logger.info('SUB_ACE_BASICABILITY_ROUTERPAGE_008 end');
    });

    /*
     * @tc.number : SUB_ACE_BASICABILITY_ROUTERPAGE_027
     * @tc.name   : 携带参数加载首页，参数值为null
     * @tc.desc   : Verify basicability routerpage interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_BASICABILITY_ROUTERPAGE_027', 0, async () => {
      Logger.info('SUB_ACE_BASICABILITY_ROUTERPAGE_027 begin');
      
      await Settings.createWindow('testability/pages/scenario/ability_router/BasicabilityRouterpage/Routerpage027');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('ROUTERPAGE_027');
      
      Logger.info('SUB_ACE_BASICABILITY_ROUTERPAGE_027 end');
    });

    /*
     * @tc.number : SUB_ACE_BASICABILITY_ROUTERPAGE_028
     * @tc.name   : 页面A和页面B之间携带参数的反复跳转
     * @tc.desc   : Verify basicability routerpage interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_BASICABILITY_ROUTERPAGE_028', 0, async () => {
      Logger.info('SUB_ACE_BASICABILITY_ROUTERPAGE_028 begin');
      
      await Settings.createWindow('testability/pages/scenario/ability_router/BasicabilityRouterpage/Routerpage028A');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('ROUTERPAGE_028_a');
      
      // 跳转到B页面
      const btnToB = await driver.findComponent(ON.id('btn_to_b'));
      await btnToB.click();
      await driver.delayMs(500);
      await windowSnap.snapShot('ROUTERPAGE_028_b');
      
      // 返回A页面
      const btnBack = await driver.findComponent(ON.id('btn_back'));
      await btnBack.click();
      await driver.delayMs(500);
      
      Logger.info('SUB_ACE_BASICABILITY_ROUTERPAGE_028 end');
    });
  });
}
