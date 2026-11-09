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

import { describe, it, afterEach } from '@ohos/hypium';
import { Driver, ON } from '@kit.TestKit';
import Settings from '../../../model/Settings';
import windowSnap from '../../../model/snapShot';
import Logger from '../../../model/Logger';

export default function toolchainHspandbundlename() {
  describe('toolchainHspandbundlename', () => {
    const TAG: string = 'toolchainHspandbundlename';
    let driver = Driver.create();

    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : SUB_ACE_TOOLCHAIN_HSPANDBUNDLENAME_0010
     * @tc.name   : 在entry中，引用HSP中的页面
     * @tc.desc   : Verify toolchain hspandbundlename interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_TOOLCHAIN_HSPANDBUNDLENAME_0010', 0, async () => {
      await Settings.createWindow('testability/pages/component/text_span/ToolchainHspandbundlename/Hspandbundlename0010');
      await driver.delayMs(500);
      
      // 点击"010_引用HSP资源"按钮
      let testBtn = await driver.findComponent(ON.id('btn'));
      await testBtn.click();
      await driver.delayMs(1000);
      
      Logger.info(TAG, 'SUB_ACE_TOOLCHAIN_HSPANDBUNDLENAME_0010: 验证entry引用HSP资源');
      await windowSnap.snapShot('SUB_ACE_TOOLCHAIN_HSPANDBUNDLENAME_0010');
    });

    /*
     * @tc.number : SUB_ACE_TOOLCHAIN_HSPANDBUNDLENAME_0020
     * @tc.name   : 在entry中，引用HSP中的页面，但integrateHsp为false
     * @tc.desc   : Verify toolchain hspandbundlename interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_TOOLCHAIN_HSPANDBUNDLENAME_0020', 0, async () => {
      await Settings.createWindow('testability/pages/component/text_span/ToolchainHspandbundlename/Hspandbundlename0020');
      await driver.delayMs(500);
      
      // 点击"030_integrateHsp为false"按钮
      let testBtn = await driver.findComponent(ON.id('btn'));
      await testBtn.click();
      await driver.delayMs(1000);
      
      Logger.info(TAG, 'SUB_ACE_TOOLCHAIN_HSPANDBUNDLENAME_0020: 验证integrateHsp=false时的行为');
      await windowSnap.snapShot('SUB_ACE_TOOLCHAIN_HSPANDBUNDLENAME_0020');
    });

    /*
     * @tc.number : SUB_ACE_TOOLCHAIN_HSPANDBUNDLENAME_0030
     * @tc.name   : 在entry中，引用HSP中的页面，但integrateHsp为空
     * @tc.desc   : Verify toolchain hspandbundlename interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_TOOLCHAIN_HSPANDBUNDLENAME_0030', 0, async () => {
      await Settings.createWindow('testability/pages/component/text_span/ToolchainHspandbundlename/Hspandbundlename0030');
      await driver.delayMs(500);
      
      // 点击查看测试说明
      let testBtn = await driver.findComponent(ON.id('btn'));
      await testBtn.click();
      await driver.delayMs(1000);
      
      Logger.info(TAG, 'SUB_ACE_TOOLCHAIN_HSPANDBUNDLENAME_0030: 编译错误验证用例（integrateHsp为空）');
      await windowSnap.snapShot('SUB_ACE_TOOLCHAIN_HSPANDBUNDLENAME_0030');
    });

    /*
     * @tc.number : SUB_ACE_TOOLCHAIN_HSPANDBUNDLENAME_0040
     * @tc.name   : 在entry中，路由跳转到HSP中的页面
     * @tc.desc   : Verify toolchain hspandbundlename interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_TOOLCHAIN_HSPANDBUNDLENAME_0040', 0, async () => {
      await Settings.createWindow('testability/pages/component/text_span/ToolchainHspandbundlename/Hspandbundlename0040');
      await driver.delayMs(500);
      
      // 点击"020_路由跳转HSP"按钮
      let testBtn = await driver.findComponent(ON.id('btn'));
      await testBtn.click();
      await driver.delayMs(1000);
      
      Logger.info(TAG, 'SUB_ACE_TOOLCHAIN_HSPANDBUNDLENAME_0040: 验证路由跳转到HSP页面');
      await windowSnap.snapShot('SUB_ACE_TOOLCHAIN_HSPANDBUNDLENAME_0040');
    });
  });
}
