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

export default function basicabilityRouterpageAdvanced() {
  describe('basicabilityRouterpageAdvanced', () => {
    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : SUB_ACE_BASICABILITY_ROUTERPAGE_029
     * @tc.name   : 页面间传参更新及获取参数
     * @tc.desc   : Verify basicability routerpage interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_BASICABILITY_ROUTERPAGE_029', 0, async () => {
      Logger.info('SUB_ACE_BASICABILITY_ROUTERPAGE_029 begin');
      
      await Settings.createWindow('testability/pages/scenario/ability_router/BasicabilityRouterpage/Routerpage029A');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      // 增加计数器到5
      for (let i = 0; i < 5; i++) {
        const btnInc = await driver.findComponent(ON.id('btn_inc'));
        await btnInc.click();
        await driver.delayMs(200);
      }
      
      // 跳转到B页面，携带参数
      const btnToB = await driver.findComponent(ON.id('btn_to_b'));
      await btnToB.click();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('ROUTERPAGE_029_B');
      
      // 在B页面增加计数器到7
      for (let i = 0; i < 2; i++) {
        const btnInc = await driver.findComponent(ON.id('btn_inc'));
        await btnInc.click();
        await driver.delayMs(200);
      }
      
      // 跳回A页面，携带更新的参数
      const btnToA = await driver.findComponent(ON.id('btn_to_a'));
      await btnToA.click();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('ROUTERPAGE_029_A');
      
      Logger.info('SUB_ACE_BASICABILITY_ROUTERPAGE_029 end');
    });

    /*
     * @tc.number : SUB_ACE_BASICABILITY_ROUTERPAGE_031
     * @tc.name   : 应用启动首页，url路径输入有误
     * @tc.desc   : Verify basicability routerpage interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_BASICABILITY_ROUTERPAGE_031', 0, async () => {
      Logger.info('SUB_ACE_BASICABILITY_ROUTERPAGE_031 begin');
      
      await Settings.createWindow('testability/pages/scenario/ability_router/BasicabilityRouterpage/Routerpage031');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      // 点击测试按钮，触发错误url跳转
      const btn = await driver.findComponent(ON.id('btn'));
      await btn.click();
      await driver.delayMs(500);
      
      await windowSnap.snapShot('ROUTERPAGE_031');
      
      Logger.info('SUB_ACE_BASICABILITY_ROUTERPAGE_031 end');
    });
  });
}
