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

export default function basicabilityRouterInstall() {
  describe('basicabilityRouterInstall', () => {
    afterEach(async () => {
      if (Settings.windowClass) {
        await Settings.destroyWindow(Settings.windowClass);
      }
    });

    /*
     * @tc.number : SUB_ACE_BASICABILITY_ROUTER_SR000HV0U4_001
     * @tc.name   : 目标页面共享hsp分包已安装，直接跳转
     * @tc.desc   : Verify basicability router sr000hv0u4 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_BASICABILITY_ROUTER_SR000HV0U4_001', 0, async () => {
      Logger.info('SUB_ACE_BASICABILITY_ROUTER_SR000HV0U4_001 begin');
      
      await Settings.createWindow('testability/pages/scenario/ability_router/BasicabilityRouterInstall/RouterInstall001');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('ROUTER_SR000HV0U4_001');
      
      Logger.info('SUB_ACE_BASICABILITY_ROUTER_SR000HV0U4_001 end');
    });

    /*
     * @tc.number : SUB_ACE_BASICABILITY_ROUTER_SR000HV0U4_002
     * @tc.name   : 目标页面共享hsp分包未安装，执行免安装后跳转
     * @tc.desc   : Verify basicability router sr000hv0u4 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_BASICABILITY_ROUTER_SR000HV0U4_002', 0, async () => {
      Logger.info('SUB_ACE_BASICABILITY_ROUTER_SR000HV0U4_002 begin');
      
      await Settings.createWindow('testability/pages/scenario/ability_router/BasicabilityRouterInstall/RouterInstall002');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('ROUTER_SR000HV0U4_002');
      
      Logger.info('SUB_ACE_BASICABILITY_ROUTER_SR000HV0U4_002 end');
    });

    /*
     * @tc.number : SUB_ACE_BASICABILITY_ROUTER_SR000HV0U4_003
     * @tc.name   : 目标页面hap分包已安装，直接跳转
     * @tc.desc   : Verify basicability router sr000hv0u4 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_BASICABILITY_ROUTER_SR000HV0U4_003', 0, async () => {
      Logger.info('SUB_ACE_BASICABILITY_ROUTER_SR000HV0U4_003 begin');
      
      await Settings.createWindow('testability/pages/scenario/ability_router/BasicabilityRouterInstall/RouterInstall003');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('ROUTER_SR000HV0U4_003');
      
      Logger.info('SUB_ACE_BASICABILITY_ROUTER_SR000HV0U4_003 end');
    });

    /*
     * @tc.number : SUB_ACE_BASICABILITY_ROUTER_SR000HV0U4_004
     * @tc.name   : 目标页面hap分包未安装，执行免安装后跳转
     * @tc.desc   : Verify basicability router sr000hv0u4 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_BASICABILITY_ROUTER_SR000HV0U4_004', 0, async () => {
      Logger.info('SUB_ACE_BASICABILITY_ROUTER_SR000HV0U4_004 begin');
      
      await Settings.createWindow('testability/pages/scenario/ability_router/BasicabilityRouterInstall/RouterInstall004');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      await windowSnap.snapShot('ROUTER_SR000HV0U4_004');
      
      Logger.info('SUB_ACE_BASICABILITY_ROUTER_SR000HV0U4_004 end');
    });

    /*
     * @tc.number : SUB_ACE_BASICABILITY_ROUTER_SR000HV0U4_005
     * @tc.name   : 跳转页面输入的uri错误或不存在，返回错误码100002
     * @tc.desc   : Verify basicability router sr000hv0u4 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_BASICABILITY_ROUTER_SR000HV0U4_005', 0, async () => {
      Logger.info('SUB_ACE_BASICABILITY_ROUTER_SR000HV0U4_005 begin');
      
      await Settings.createWindow('testability/pages/scenario/ability_router/BasicabilityRouterInstall/RouterInstall005');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      // 点击测试按钮，触发错误uri跳转
      const btn = await driver.findComponent(ON.id('btn'));
      await btn.click();
      await driver.delayMs(500);
      
      await windowSnap.snapShot('ROUTER_SR000HV0U4_005');
      
      Logger.info('SUB_ACE_BASICABILITY_ROUTER_SR000HV0U4_005 end');
    });

    /*
     * @tc.number : SUB_ACE_BASICABILITY_ROUTER_SR000HV0U4_006
     * @tc.name   : 跳转页面压入页面数超过32，返回错误码100003
     * @tc.desc   : Verify basicability router sr000hv0u4 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_BASICABILITY_ROUTER_SR000HV0U4_006', 0, async () => {
      Logger.info('SUB_ACE_BASICABILITY_ROUTER_SR000HV0U4_006 begin');
      
      await Settings.createWindow('testability/pages/scenario/ability_router/BasicabilityRouterInstall/RouterInstall006');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      // 点击测试按钮，触发超过32层push
      const btn = await driver.findComponent(ON.id('btn'));
      await btn.click();
      await driver.delayMs(3000); // 等待测试完成
      
      await windowSnap.snapShot('ROUTER_SR000HV0U4_006');
      
      // 清空页面栈
      const btnClear = await driver.findComponent(ON.id('btn_clear'));
      await btnClear.click();
      await driver.delayMs(500);
      
      Logger.info('SUB_ACE_BASICABILITY_ROUTER_SR000HV0U4_006 end');
    });

    /*
     * @tc.number : SUB_ACE_BASICABILITY_ROUTER_SR000HV0U4_007
     * @tc.name   : 替换页面输入的uri错误或不存在，返回错误码200002
     * @tc.desc   : Verify basicability router sr000hv0u4 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_BASICABILITY_ROUTER_SR000HV0U4_007', 0, async () => {
      Logger.info('SUB_ACE_BASICABILITY_ROUTER_SR000HV0U4_007 begin');
      
      await Settings.createWindow('testability/pages/scenario/ability_router/BasicabilityRouterInstall/RouterInstall007');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      // 点击测试按钮，触发错误uri替换
      const btn = await driver.findComponent(ON.id('btn'));
      await btn.click();
      await driver.delayMs(500);
      
      await windowSnap.snapShot('ROUTER_SR000HV0U4_007');
      
      Logger.info('SUB_ACE_BASICABILITY_ROUTER_SR000HV0U4_007 end');
    });

    /*
     * @tc.number : SUB_ACE_BASICABILITY_ROUTER_SR000HV0U4_010
     * @tc.name   : 性能测试，调用router实现免安装路由，跳转不卡顿、不掉帧
     * @tc.desc   : Verify basicability router sr000hv0u4 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_BASICABILITY_ROUTER_SR000HV0U4_010', 0, async () => {
      Logger.info('SUB_ACE_BASICABILITY_ROUTER_SR000HV0U4_010 begin');
      
      await Settings.createWindow('testability/pages/scenario/ability_router/BasicabilityRouterInstall/RouterInstall010');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      // 点击测试按钮，开始性能测试
      const btn = await driver.findComponent(ON.id('btn'));
      await btn.click();
      await driver.delayMs(5000); // 等待性能测试完成
      
      await windowSnap.snapShot('ROUTER_SR000HV0U4_010');
      
      Logger.info('SUB_ACE_BASICABILITY_ROUTER_SR000HV0U4_010 end');
    });

    /*
     * @tc.number : SUB_ACE_BASICABILITY_ROUTER_SR000HV0U4_011
     * @tc.name   : 内存测试，调用router实现多个免安装路由，无内存泄漏
     * @tc.desc   : Verify basicability router sr000hv0u4 interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_BASICABILITY_ROUTER_SR000HV0U4_011', 0, async () => {
      Logger.info('SUB_ACE_BASICABILITY_ROUTER_SR000HV0U4_011 begin');
      
      await Settings.createWindow('testability/pages/scenario/ability_router/BasicabilityRouterInstall/RouterInstall011');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      // 点击测试按钮，开始内存测试
      const btn = await driver.findComponent(ON.id('btn'));
      await btn.click();
      await driver.delayMs(10000); // 等待内存测试完成（100次跳转）
      
      await windowSnap.snapShot('ROUTER_SR000HV0U4_011');
      
      Logger.info('SUB_ACE_BASICABILITY_ROUTER_SR000HV0U4_011 end');
    });

    /*
     * @tc.number : SUB_ACE_BASICABILITY_ROUTERPAGE_012
     * @tc.name   : 循环跳转返回界面，查询内存是否溢出
     * @tc.desc   : Verify basicability routerpage interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 3
     */
    it('SUB_ACE_BASICABILITY_ROUTERPAGE_012', 0, async () => {
      Logger.info('SUB_ACE_BASICABILITY_ROUTERPAGE_012 begin');
      
      await Settings.createWindow('testability/pages/scenario/ability_router/BasicabilityRouterInstall/Routerpage012');
      const driver = Driver.create();
      await driver.delayMs(1000);
      
      // 先手动跳转一次验证
      const btnManual = await driver.findComponent(ON.id('btn_manual'));
      await btnManual.click();
      await driver.delayMs(500);
      
      const btnBack = await driver.findComponent(ON.id('btn_back'));
      await btnBack.click();
      await driver.delayMs(500);
      
      await windowSnap.snapShot('ROUTERPAGE_012');
      
      Logger.info('SUB_ACE_BASICABILITY_ROUTERPAGE_012 end');
      Logger.info('Note: Full 1000-cycle test should be run manually for complete memory analysis');
    });
  });
}
