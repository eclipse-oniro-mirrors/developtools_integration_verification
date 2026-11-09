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

export default function uiComponentMenuArrow() {
  describe('uiComponentMenuArrow', () => {
    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_ARROWBLUR_0090
     * @tc.name   : bindMenu箭头模糊背景效果
     * @tc.desc   : Verify component function commomattributes menu arrowblur interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_ARROWBLUR_0090', 0, async () => {
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_ARROWBLUR_0090 begin');
      await Settings.createWindow('testability/pages/component/popup/MenuArrow/MenuArrowBlur0090');
      const driver = Driver.create();
      await driver.delayMs(1000);

      const triggerBtn = await driver.findComponent(ON.id('triggerBtn'));
      if (triggerBtn) {
        await triggerBtn.click();
        await driver.delayMs(1000);
        await windowSnap.snapShot('MenuArrowBlur0090');
      }

      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_ARROWBLUR_0090 end');
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_ARROWKEYSOYTOFFOCUS_0090
     * @tc.name   : bindContextMenu二级菜单STACK_EXPAND
     * @tc.desc   : Verify component function commomattributes menu arrowkeysoytoffocus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_ARROWKEYSOYTOFFOCUS_0090', 0, async () => {
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_ARROWKEYSOYTOFFOCUS_0090 begin');
      await Settings.createWindow('testability/pages/component/popup/MenuArrow/MenuArrowFocus0090');
      const driver = Driver.create();
      await driver.delayMs(1000);

      await windowSnap.snapShot('MenuArrowFocus0090');

      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_ARROWKEYSOYTOFFOCUS_0090 end');
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_ARROWKEYSOYTOFFOCUS_0160
     * @tc.name   : bindMenu二级菜单SIDE_EXPAND
     * @tc.desc   : Verify component function commomattributes menu arrowkeysoytoffocus interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_ARROWKEYSOYTOFFOCUS_0160', 0, async () => {
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_ARROWKEYSOYTOFFOCUS_0160 begin');
      await Settings.createWindow('testability/pages/component/popup/MenuArrow/MenuArrowFocus0160');
      const driver = Driver.create();
      await driver.delayMs(1000);

      const triggerBtn = await driver.findComponent(ON.id('triggerBtn'));
      if (triggerBtn) {
        await triggerBtn.click();
        await driver.delayMs(1000);
        await windowSnap.snapShot('MenuArrowFocus0160');
      }

      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_ARROWKEYSOYTOFFOCUS_0160 end');
    });

    /*
     * @tc.number : ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_DOUBLESTROKE_0060
     * @tc.name   : bindContextMenu双描边效果
     * @tc.desc   : Verify component function commomattributes menu doublestroke interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_DOUBLESTROKE_0060', 0, async () => {
      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_DOUBLESTROKE_0060 begin');
      await Settings.createWindow('testability/pages/component/popup/MenuArrow/MenuDoubleStroke0060');
      const driver = Driver.create();
      await driver.delayMs(1000);

      await windowSnap.snapShot('MenuDoubleStroke0060');

      Logger.info('ARKUI_COMPONENTFUNCTION_COMMOMATTRIBUTES_MENU_DOUBLESTROKE_0060 end');
    });
  });
}
