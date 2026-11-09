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

import { describe, it, expect, afterEach } from '@ohos/hypium';
import { Driver, ON } from '@kit.TestKit';
import Settings from '../../../model/Settings';
import windowSnap from '../../../model/snapShot';
import Logger from '../../../model/Logger';

/*
 * Dialog Order层级测试
 */
export default function uiComponentDialogOrderTest() {
  describe('uiComponentDialogOrderTest', () => {
    afterEach(async () => {
      if (Settings.windowClass) {
        Settings.destroyWindow(Settings.windowClass);
      }
      let driver = Driver.create();
      await driver.delayMs(500);
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0010
     * @tc.name   : testDialogOrderShowDialogNeg5
     * @tc.desc   : Verify button dialog order interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0010', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0010 start');
      await Settings.createWindow('testability/pages/component/popup/DialogOrder/DialogOrder0010');
      let driver = Driver.create();
      await driver.delayMs(1000);

      // 点击层级按钮
      let levelBtn = await driver.findComponent(ON.id('DialogOrder0010_Level'));
      expect(levelBtn !== null).assertTrue();
      if (levelBtn) {
        await levelBtn.click();
      }
      await driver.delayMs(300);

      // 点击showDialog按钮
      let showDialogBtn = await driver.findComponent(ON.id('DialogOrder0010_ShowDialog'));
      expect(showDialogBtn !== null).assertTrue();
      if (showDialogBtn) {
        await showDialogBtn.click();
      }
      await driver.delayMs(1000);

      // 点击确定关闭弹窗
      let confirmBtn = await driver.findComponent(ON.text('确定'));
      if (confirmBtn) {
        await confirmBtn.click();
      }
      await driver.delayMs(500);

      // 获取Order值
      let getOrderBtn = await driver.findComponent(ON.id('DialogOrder0010_GetOrder'));
      if (getOrderBtn) {
        await getOrderBtn.click();
      }
      await driver.delayMs(300);

      await windowSnap.snapShot();
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0010 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0020
     * @tc.name   : testDialogOrderCustomController100001
     * @tc.desc   : Verify button dialog order interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0020', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0020 start');
      await Settings.createWindow('testability/pages/component/popup/DialogOrder/DialogOrder0020');
      let driver = Driver.create();
      await driver.delayMs(1000);

      let customDialogBtn = await driver.findComponent(ON.id('DialogOrder0020_CustomDialog'));
      expect(customDialogBtn !== null).assertTrue();
      if (customDialogBtn) {
        await customDialogBtn.click();
      }
      await driver.delayMs(1000);

      // 点击确定关闭弹窗
      let confirmBtn = await driver.findComponent(ON.text('确定'));
      if (confirmBtn) {
        await confirmBtn.click();
      }
      await driver.delayMs(500);

      let getOrderBtn = await driver.findComponent(ON.id('DialogOrder0020_GetOrder'));
      if (getOrderBtn) {
        await getOrderBtn.click();
      }
      await driver.delayMs(300);

      await windowSnap.snapShot();
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0020 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0040
     * @tc.name   : testDialogOrderAlertDialogUndefined
     * @tc.desc   : Verify button dialog order interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0040', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0040 start');
      await Settings.createWindow('testability/pages/component/popup/DialogOrder/DialogOrder0040');
      let driver = Driver.create();
      await driver.delayMs(1000);

      let alertDialogBtn = await driver.findComponent(ON.id('DialogOrder0040_AlertDialog'));
      expect(alertDialogBtn !== null).assertTrue();
      if (alertDialogBtn) {
        await alertDialogBtn.click();
      }
      await driver.delayMs(1000);

      let confirmBtn = await driver.findComponent(ON.text('确定'));
      if (confirmBtn) {
        await confirmBtn.click();
      }
      await driver.delayMs(500);

      let getOrderBtn = await driver.findComponent(ON.id('DialogOrder0040_GetOrder'));
      if (getOrderBtn) {
        await getOrderBtn.click();
      }
      await driver.delayMs(300);

      await windowSnap.snapShot();
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0040 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0050
     * @tc.name   : testDialogOrderOpenCustomDialog0p1111
     * @tc.desc   : Verify button dialog order interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0050', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0050 start');
      await Settings.createWindow('testability/pages/component/popup/DialogOrder/DialogOrder0050');
      let driver = Driver.create();
      await driver.delayMs(1000);

      let openDialogBtn = await driver.findComponent(ON.id('DialogOrder0050_OpenCustomDialog'));
      expect(openDialogBtn !== null).assertTrue();
      if (openDialogBtn) {
        await openDialogBtn.click();
      }
      await driver.delayMs(1000);

      let confirmBtn = await driver.findComponent(ON.text('确定'));
      if (confirmBtn) {
        await confirmBtn.click();
      }
      await driver.delayMs(500);

      let getOrderBtn = await driver.findComponent(ON.id('DialogOrder0050_GetOrder'));
      if (getOrderBtn) {
        await getOrderBtn.click();
      }
      await driver.delayMs(300);

      await windowSnap.snapShot();
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0050 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0060
     * @tc.name   : testDialogOrderActionSheetNeg100001
     * @tc.desc   : Verify button dialog order interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0060', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0060 start');
      await Settings.createWindow('testability/pages/component/popup/DialogOrder/DialogOrder0060');
      let driver = Driver.create();
      await driver.delayMs(1000);

      let actionSheetBtn = await driver.findComponent(ON.id('DialogOrder0060_ActionSheet'));
      expect(actionSheetBtn !== null).assertTrue();
      if (actionSheetBtn) {
        await actionSheetBtn.click();
      }
      await driver.delayMs(1000);

      // 点击取消关闭
      let cancelBtn = await driver.findComponent(ON.text('取消'));
      if (cancelBtn) {
        await cancelBtn.click();
      }
      await driver.delayMs(500);

      let getOrderBtn = await driver.findComponent(ON.id('DialogOrder0060_GetOrder'));
      if (getOrderBtn) {
        await getOrderBtn.click();
      }
      await driver.delayMs(300);

      await windowSnap.snapShot();
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0060 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0090
     * @tc.name   : testDialogOrderShowDialogNeg100001
     * @tc.desc   : Verify button dialog order interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0090', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0090 start');
      await Settings.createWindow('testability/pages/component/popup/DialogOrder/DialogOrder0090');
      let driver = Driver.create();
      await driver.delayMs(1000);

      let showDialogBtn = await driver.findComponent(ON.id('DialogOrder0090_ShowDialog'));
      expect(showDialogBtn !== null).assertTrue();
      if (showDialogBtn) {
        await showDialogBtn.click();
      }
      await driver.delayMs(1000);

      let confirmBtn = await driver.findComponent(ON.text('确定'));
      if (confirmBtn) {
        await confirmBtn.click();
      }
      await driver.delayMs(500);

      let getOrderBtn = await driver.findComponent(ON.id('DialogOrder0090_GetOrder'));
      if (getOrderBtn) {
        await getOrderBtn.click();
      }
      await driver.delayMs(300);

      await windowSnap.snapShot();
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0090 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0120
     * @tc.name   : testDialogOrderPresentCustomDialogNeg5
     * @tc.desc   : Verify button dialog order interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0120', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0120 start');
      await Settings.createWindow('testability/pages/component/popup/DialogOrder/DialogOrder0120');
      let driver = Driver.create();
      await driver.delayMs(1000);

      let presentDialogBtn = await driver.findComponent(ON.id('DialogOrder0120_PresentDialog'));
      expect(presentDialogBtn !== null).assertTrue();
      if (presentDialogBtn) {
        await presentDialogBtn.click();
      }
      await driver.delayMs(1000);

      let confirmBtn = await driver.findComponent(ON.text('确定'));
      if (confirmBtn) {
        await confirmBtn.click();
      }
      await driver.delayMs(500);

      let getOrderBtn = await driver.findComponent(ON.id('DialogOrder0120_GetOrder'));
      if (getOrderBtn) {
        await getOrderBtn.click();
      }
      await driver.delayMs(300);

      await windowSnap.snapShot();
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0120 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0210
     * @tc.name   : testDialogOrderAlertDialog100001
     * @tc.desc   : Verify button dialog order interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0210', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0210 start');
      await Settings.createWindow('testability/pages/component/popup/DialogOrder/DialogOrder0210');
      let driver = Driver.create();
      await driver.delayMs(1000);

      let alertDialogBtn = await driver.findComponent(ON.id('DialogOrder0210_AlertDialog'));
      expect(alertDialogBtn !== null).assertTrue();
      if (alertDialogBtn) {
        await alertDialogBtn.click();
      }
      await driver.delayMs(1000);

      let confirmBtn = await driver.findComponent(ON.text('确定'));
      if (confirmBtn) {
        await confirmBtn.click();
      }
      await driver.delayMs(500);

      let getOrderBtn = await driver.findComponent(ON.id('DialogOrder0210_GetOrder'));
      if (getOrderBtn) {
        await getOrderBtn.click();
      }
      await driver.delayMs(300);

      await windowSnap.snapShot();
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0210 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0280
     * @tc.name   : testDialogOrderShowDialog0p1111
     * @tc.desc   : Verify button dialog order interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0280', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0280 start');
      await Settings.createWindow('testability/pages/component/popup/DialogOrder/DialogOrder0280');
      let driver = Driver.create();
      await driver.delayMs(1000);

      let showDialogBtn = await driver.findComponent(ON.id('DialogOrder0280_ShowDialog'));
      expect(showDialogBtn !== null).assertTrue();
      if (showDialogBtn) {
        await showDialogBtn.click();
      }
      await driver.delayMs(1000);

      let confirmBtn = await driver.findComponent(ON.text('确定'));
      if (confirmBtn) {
        await confirmBtn.click();
      }
      await driver.delayMs(500);

      let getOrderBtn = await driver.findComponent(ON.id('DialogOrder0280_GetOrder'));
      if (getOrderBtn) {
        await getOrderBtn.click();
      }
      await driver.delayMs(300);

      await windowSnap.snapShot();
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0280 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0350
     * @tc.name   : testDialogOrderAlertDialogNeg100001
     * @tc.desc   : Verify button dialog order interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0350', 0, async (done: Function) => {
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0350 start');
      await Settings.createWindow('testability/pages/component/popup/DialogOrder/DialogOrder0350');
      let driver = Driver.create();
      await driver.delayMs(1000);

      let alertDialogBtn = await driver.findComponent(ON.id('DialogOrder0350_AlertDialog'));
      expect(alertDialogBtn !== null).assertTrue();
      if (alertDialogBtn) {
        await alertDialogBtn.click();
      }
      await driver.delayMs(1000);

      let confirmBtn = await driver.findComponent(ON.text('确定'));
      if (confirmBtn) {
        await confirmBtn.click();
      }
      await driver.delayMs(500);

      let getOrderBtn = await driver.findComponent(ON.id('DialogOrder0350_GetOrder'));
      if (getOrderBtn) {
        await getOrderBtn.click();
      }
      await driver.delayMs(300);

      await windowSnap.snapShot();
      Logger.info('TEST', 'SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0350 end');
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0030
     * @tc.name   : testDialogOrderOpenWithController100001
     * @tc.desc   : Verify button dialog order interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0030', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/popup/DialogOrder/DialogOrder0030');
      let driver = Driver.create();
      await driver.delayMs(1000);
      let dialogBtn = await driver.findComponent(ON.id('DialogOrder0030_Dialog'));
      expect(dialogBtn !== null).assertTrue();
      if (dialogBtn) {
        await dialogBtn.click();
      }
      await driver.delayMs(1000);
      let confirmBtn = await driver.findComponent(ON.text('确定'));
      if (confirmBtn) {
        await confirmBtn.click();
      }
      await driver.delayMs(500);
      await windowSnap.snapShot();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0070
     * @tc.name   : testDialogOrderOpenCustomDialogNeg5
     * @tc.desc   : Verify button dialog order interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0070', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/popup/DialogOrder/DialogOrder0070');
      let driver = Driver.create();
      await driver.delayMs(1000);
      let dialogBtn = await driver.findComponent(ON.id('DialogOrder0070_Dialog'));
      expect(dialogBtn !== null).assertTrue();
      if (dialogBtn) {
        await dialogBtn.click();
      }
      await driver.delayMs(1000);
      let confirmBtn = await driver.findComponent(ON.text('确定'));
      if (confirmBtn) {
        await confirmBtn.click();
      }
      await driver.delayMs(500);
      await windowSnap.snapShot();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0080
     * @tc.name   : testDialogOrderCustomControllerNeg5
     * @tc.desc   : Verify button dialog order interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0080', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/popup/DialogOrder/DialogOrder0080');
      let driver = Driver.create();
      await driver.delayMs(1000);
      let dialogBtn = await driver.findComponent(ON.id('DialogOrder0080_Dialog'));
      expect(dialogBtn !== null).assertTrue();
      if (dialogBtn) {
        await dialogBtn.click();
      }
      await driver.delayMs(1000);
      let confirmBtn = await driver.findComponent(ON.text('确定'));
      if (confirmBtn) {
        await confirmBtn.click();
      }
      await driver.delayMs(500);
      await windowSnap.snapShot();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0100
     * @tc.name   : testDialogOrderAlertDialog0p1111
     * @tc.desc   : Verify button dialog order interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0100', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/popup/DialogOrder/DialogOrder0100');
      let driver = Driver.create();
      await driver.delayMs(1000);
      let dialogBtn = await driver.findComponent(ON.id('DialogOrder0100_Dialog'));
      expect(dialogBtn !== null).assertTrue();
      if (dialogBtn) {
        await dialogBtn.click();
      }
      await driver.delayMs(1000);
      let confirmBtn = await driver.findComponent(ON.text('确定'));
      if (confirmBtn) {
        await confirmBtn.click();
      }
      await driver.delayMs(500);
      await windowSnap.snapShot();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0110
     * @tc.name   : testDialogOrderOpenWithControllerUndefined
     * @tc.desc   : Verify button dialog order interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0110', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/popup/DialogOrder/DialogOrder0110');
      let driver = Driver.create();
      await driver.delayMs(1000);
      let dialogBtn = await driver.findComponent(ON.id('DialogOrder0110_Dialog'));
      expect(dialogBtn !== null).assertTrue();
      if (dialogBtn) {
        await dialogBtn.click();
      }
      await driver.delayMs(1000);
      let confirmBtn = await driver.findComponent(ON.text('确定'));
      if (confirmBtn) {
        await confirmBtn.click();
      }
      await driver.delayMs(500);
      await windowSnap.snapShot();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0130
     * @tc.name   : testDialogOrderPresentCustomDialog100001
     * @tc.desc   : Verify button dialog order interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0130', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/popup/DialogOrder/DialogOrder0130');
      let driver = Driver.create();
      await driver.delayMs(1000);
      let dialogBtn = await driver.findComponent(ON.id('DialogOrder0130_Dialog'));
      expect(dialogBtn !== null).assertTrue();
      if (dialogBtn) {
        await dialogBtn.click();
      }
      await driver.delayMs(1000);
      let confirmBtn = await driver.findComponent(ON.text('确定'));
      if (confirmBtn) {
        await confirmBtn.click();
      }
      await driver.delayMs(500);
      await windowSnap.snapShot();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0140
     * @tc.name   : testDialogOrderCustomController0p1111
     * @tc.desc   : Verify button dialog order interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0140', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/popup/DialogOrder/DialogOrder0140');
      let driver = Driver.create();
      await driver.delayMs(1000);
      let dialogBtn = await driver.findComponent(ON.id('DialogOrder0140_Dialog'));
      expect(dialogBtn !== null).assertTrue();
      if (dialogBtn) {
        await dialogBtn.click();
      }
      await driver.delayMs(1000);
      let confirmBtn = await driver.findComponent(ON.text('确定'));
      if (confirmBtn) {
        await confirmBtn.click();
      }
      await driver.delayMs(500);
      await windowSnap.snapShot();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0150
     * @tc.name   : testDialogOrderOpenWithControllerNeg100001
     * @tc.desc   : Verify button dialog order interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0150', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/popup/DialogOrder/DialogOrder0150');
      let driver = Driver.create();
      await driver.delayMs(1000);
      let dialogBtn = await driver.findComponent(ON.id('DialogOrder0150_Dialog'));
      expect(dialogBtn !== null).assertTrue();
      if (dialogBtn) {
        await dialogBtn.click();
      }
      await driver.delayMs(1000);
      let confirmBtn = await driver.findComponent(ON.text('确定'));
      if (confirmBtn) {
        await confirmBtn.click();
      }
      await driver.delayMs(500);
      await windowSnap.snapShot();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0160
     * @tc.name   : testDialogOrderPresentCustomDialogNeg100001
     * @tc.desc   : Verify button dialog order interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0160', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/popup/DialogOrder/DialogOrder0160');
      let driver = Driver.create();
      await driver.delayMs(1000);
      let dialogBtn = await driver.findComponent(ON.id('DialogOrder0160_Dialog'));
      expect(dialogBtn !== null).assertTrue();
      if (dialogBtn) {
        await dialogBtn.click();
      }
      await driver.delayMs(1000);
      let confirmBtn = await driver.findComponent(ON.text('确定'));
      if (confirmBtn) {
        await confirmBtn.click();
      }
      await driver.delayMs(500);
      await windowSnap.snapShot();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0170
     * @tc.name   : testDialogOrderOpenCustomDialogNeg100001
     * @tc.desc   : Verify button dialog order interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0170', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/popup/DialogOrder/DialogOrder0170');
      let driver = Driver.create();
      await driver.delayMs(1000);
      let dialogBtn = await driver.findComponent(ON.id('DialogOrder0170_Dialog'));
      expect(dialogBtn !== null).assertTrue();
      if (dialogBtn) {
        await dialogBtn.click();
      }
      await driver.delayMs(1000);
      let confirmBtn = await driver.findComponent(ON.text('确定'));
      if (confirmBtn) {
        await confirmBtn.click();
      }
      await driver.delayMs(500);
      await windowSnap.snapShot();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0180
     * @tc.name   : testDialogOrderCustomControllerUndefined
     * @tc.desc   : Verify button dialog order interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0180', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/popup/DialogOrder/DialogOrder0180');
      let driver = Driver.create();
      await driver.delayMs(1000);
      let dialogBtn = await driver.findComponent(ON.id('DialogOrder0180_Dialog'));
      expect(dialogBtn !== null).assertTrue();
      if (dialogBtn) {
        await dialogBtn.click();
      }
      await driver.delayMs(1000);
      let confirmBtn = await driver.findComponent(ON.text('确定'));
      if (confirmBtn) {
        await confirmBtn.click();
      }
      await driver.delayMs(500);
      await windowSnap.snapShot();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0190
     * @tc.name   : testDialogOrderActionSheetUndefined
     * @tc.desc   : Verify button dialog order interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0190', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/popup/DialogOrder/DialogOrder0190');
      let driver = Driver.create();
      await driver.delayMs(1000);
      let dialogBtn = await driver.findComponent(ON.id('DialogOrder0190_Dialog'));
      expect(dialogBtn !== null).assertTrue();
      if (dialogBtn) {
        await dialogBtn.click();
      }
      await driver.delayMs(1000);
      let cancelBtn = await driver.findComponent(ON.text('取消'));
      if (cancelBtn) {
        await cancelBtn.click();
      }
      await driver.delayMs(500);
      await windowSnap.snapShot();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0200
     * @tc.name   : testDialogOrderOpenCustomDialogUndefined
     * @tc.desc   : Verify button dialog order interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0200', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/popup/DialogOrder/DialogOrder0200');
      let driver = Driver.create();
      await driver.delayMs(1000);
      let dialogBtn = await driver.findComponent(ON.id('DialogOrder0200_Dialog'));
      expect(dialogBtn !== null).assertTrue();
      if (dialogBtn) {
        await dialogBtn.click();
      }
      await driver.delayMs(1000);
      let confirmBtn = await driver.findComponent(ON.text('确定'));
      if (confirmBtn) {
        await confirmBtn.click();
      }
      await driver.delayMs(500);
      await windowSnap.snapShot();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0220
     * @tc.name   : testDialogOrderShowDialogUndefined
     * @tc.desc   : Verify button dialog order interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0220', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/popup/DialogOrder/DialogOrder0220');
      let driver = Driver.create();
      await driver.delayMs(1000);
      let dialogBtn = await driver.findComponent(ON.id('DialogOrder0220_Dialog'));
      expect(dialogBtn !== null).assertTrue();
      if (dialogBtn) {
        await dialogBtn.click();
      }
      await driver.delayMs(1000);
      let confirmBtn = await driver.findComponent(ON.text('确定'));
      if (confirmBtn) {
        await confirmBtn.click();
      }
      await driver.delayMs(500);
      await windowSnap.snapShot();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0230
     * @tc.name   : testDialogOrderShowDialog100001
     * @tc.desc   : Verify button dialog order interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0230', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/popup/DialogOrder/DialogOrder0230');
      let driver = Driver.create();
      await driver.delayMs(1000);
      let dialogBtn = await driver.findComponent(ON.id('DialogOrder0230_Dialog'));
      expect(dialogBtn !== null).assertTrue();
      if (dialogBtn) {
        await dialogBtn.click();
      }
      await driver.delayMs(1000);
      let confirmBtn = await driver.findComponent(ON.text('确定'));
      if (confirmBtn) {
        await confirmBtn.click();
      }
      await driver.delayMs(500);
      await windowSnap.snapShot();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0240
     * @tc.name   : testDialogOrderOpenWithControllerNeg5
     * @tc.desc   : Verify button dialog order interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0240', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/popup/DialogOrder/DialogOrder0240');
      let driver = Driver.create();
      await driver.delayMs(1000);
      let dialogBtn = await driver.findComponent(ON.id('DialogOrder0240_Dialog'));
      expect(dialogBtn !== null).assertTrue();
      if (dialogBtn) {
        await dialogBtn.click();
      }
      await driver.delayMs(1000);
      let confirmBtn = await driver.findComponent(ON.text('确定'));
      if (confirmBtn) {
        await confirmBtn.click();
      }
      await driver.delayMs(500);
      await windowSnap.snapShot();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0250
     * @tc.name   : testDialogOrderPresentCustomDialogUndefined
     * @tc.desc   : Verify button dialog order interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0250', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/popup/DialogOrder/DialogOrder0250');
      let driver = Driver.create();
      await driver.delayMs(1000);
      let dialogBtn = await driver.findComponent(ON.id('DialogOrder0250_Dialog'));
      expect(dialogBtn !== null).assertTrue();
      if (dialogBtn) {
        await dialogBtn.click();
      }
      await driver.delayMs(1000);
      let confirmBtn = await driver.findComponent(ON.text('确定'));
      if (confirmBtn) {
        await confirmBtn.click();
      }
      await driver.delayMs(500);
      await windowSnap.snapShot();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0260
     * @tc.name   : testDialogOrderPresentCustomDialog0p1111
     * @tc.desc   : Verify button dialog order interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0260', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/popup/DialogOrder/DialogOrder0260');
      let driver = Driver.create();
      await driver.delayMs(1000);
      let dialogBtn = await driver.findComponent(ON.id('DialogOrder0260_Dialog'));
      expect(dialogBtn !== null).assertTrue();
      if (dialogBtn) {
        await dialogBtn.click();
      }
      await driver.delayMs(1000);
      let confirmBtn = await driver.findComponent(ON.text('确定'));
      if (confirmBtn) {
        await confirmBtn.click();
      }
      await driver.delayMs(500);
      await windowSnap.snapShot();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0270
     * @tc.name   : testDialogOrderActionSheet0p1111
     * @tc.desc   : Verify button dialog order interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0270', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/popup/DialogOrder/DialogOrder0270');
      let driver = Driver.create();
      await driver.delayMs(1000);
      let dialogBtn = await driver.findComponent(ON.id('DialogOrder0270_Dialog'));
      expect(dialogBtn !== null).assertTrue();
      if (dialogBtn) {
        await dialogBtn.click();
      }
      await driver.delayMs(1000);
      let cancelBtn = await driver.findComponent(ON.text('取消'));
      if (cancelBtn) {
        await cancelBtn.click();
      }
      await driver.delayMs(500);
      await windowSnap.snapShot();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0290
     * @tc.name   : testDialogOrderAlertDialogNeg5
     * @tc.desc   : Verify button dialog order interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0290', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/popup/DialogOrder/DialogOrder0290');
      let driver = Driver.create();
      await driver.delayMs(1000);
      let dialogBtn = await driver.findComponent(ON.id('DialogOrder0290_Dialog'));
      expect(dialogBtn !== null).assertTrue();
      if (dialogBtn) {
        await dialogBtn.click();
      }
      await driver.delayMs(1000);
      let confirmBtn = await driver.findComponent(ON.text('确定'));
      if (confirmBtn) {
        await confirmBtn.click();
      }
      await driver.delayMs(500);
      await windowSnap.snapShot();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0300
     * @tc.name   : testDialogOrderOpenWithController0p1111
     * @tc.desc   : Verify button dialog order interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0300', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/popup/DialogOrder/DialogOrder0300');
      let driver = Driver.create();
      await driver.delayMs(1000);
      let dialogBtn = await driver.findComponent(ON.id('DialogOrder0300_Dialog'));
      expect(dialogBtn !== null).assertTrue();
      if (dialogBtn) {
        await dialogBtn.click();
      }
      await driver.delayMs(1000);
      let confirmBtn = await driver.findComponent(ON.text('确定'));
      if (confirmBtn) {
        await confirmBtn.click();
      }
      await driver.delayMs(500);
      await windowSnap.snapShot();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0310
     * @tc.name   : testDialogOrderOpenCustomDialog100001
     * @tc.desc   : Verify button dialog order interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0310', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/popup/DialogOrder/DialogOrder0310');
      let driver = Driver.create();
      await driver.delayMs(1000);
      let dialogBtn = await driver.findComponent(ON.id('DialogOrder0310_Dialog'));
      expect(dialogBtn !== null).assertTrue();
      if (dialogBtn) {
        await dialogBtn.click();
      }
      await driver.delayMs(1000);
      let confirmBtn = await driver.findComponent(ON.text('确定'));
      if (confirmBtn) {
        await confirmBtn.click();
      }
      await driver.delayMs(500);
      await windowSnap.snapShot();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0320
     * @tc.name   : testDialogOrderCustomControllerNeg100001
     * @tc.desc   : Verify button dialog order interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0320', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/popup/DialogOrder/DialogOrder0320');
      let driver = Driver.create();
      await driver.delayMs(1000);
      let dialogBtn = await driver.findComponent(ON.id('DialogOrder0320_Dialog'));
      expect(dialogBtn !== null).assertTrue();
      if (dialogBtn) {
        await dialogBtn.click();
      }
      await driver.delayMs(1000);
      let confirmBtn = await driver.findComponent(ON.text('确定'));
      if (confirmBtn) {
        await confirmBtn.click();
      }
      await driver.delayMs(500);
      await windowSnap.snapShot();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0330
     * @tc.name   : testDialogOrderActionSheet100001
     * @tc.desc   : Verify button dialog order interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0330', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/popup/DialogOrder/DialogOrder0330');
      let driver = Driver.create();
      await driver.delayMs(1000);
      let dialogBtn = await driver.findComponent(ON.id('DialogOrder0330_Dialog'));
      expect(dialogBtn !== null).assertTrue();
      if (dialogBtn) {
        await dialogBtn.click();
      }
      await driver.delayMs(1000);
      let cancelBtn = await driver.findComponent(ON.text('取消'));
      if (cancelBtn) {
        await cancelBtn.click();
      }
      await driver.delayMs(500);
      await windowSnap.snapShot();
      done();
    });

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0340
     * @tc.name   : testDialogOrderActionSheetNeg5
     * @tc.desc   : Verify button dialog order interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0340', 0, async (done: Function) => {
      await Settings.createWindow('testability/pages/component/popup/DialogOrder/DialogOrder0340');
      let driver = Driver.create();
      await driver.delayMs(1000);
      let dialogBtn = await driver.findComponent(ON.id('DialogOrder0340_Dialog'));
      expect(dialogBtn !== null).assertTrue();
      if (dialogBtn) {
        await dialogBtn.click();
      }
      await driver.delayMs(1000);
      let cancelBtn = await driver.findComponent(ON.text('取消'));
      if (cancelBtn) {
        await cancelBtn.click();
      }
      await driver.delayMs(500);
      await windowSnap.snapShot();
      done();
    });
  });
}
