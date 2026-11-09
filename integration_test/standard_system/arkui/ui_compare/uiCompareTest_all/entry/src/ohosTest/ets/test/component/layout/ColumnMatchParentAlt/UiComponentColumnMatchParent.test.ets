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
import { Driver, ON, Component, MouseButton } from '@kit.TestKit'
/*
 * SUB_ACE_UI_ATTRIBUTES_FONT_INTERFACE_0010:设置文本颜色
 *
 * Settings.createWindow(config.url)：
 *  创建窗口，更改窗口基本配置，更改方式详见model/Settings createWindow方法
 *
 * windowSnap.snapShot(globalThis.context)：
 *  窗口截屏&图片文件保存，存储在设备端
 *  存储文件固定，单挑用例执行后覆盖，用于自动化UI对比
 *  支持调试更改文件名为时间戳格式，更改model/snapShot createAndGetFile方法 注释L35，放开L32，L33
 *
 * Logger日志使用方法：
 *  import Logger form './model/Logger'
 *  Logger.info(TAG,`config = ${config}, err = ${JSON.stringify(exception)}`)
 * */

export default function uiComponentColumnMatchParent() {

  describe('uiComponentColumnMatchParent', () => {
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
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0250
     * @tc.name   : The column component does not have a width and height set. The column only has a width and height set (width50height100), and column2 and column3 dynamically switch between width and height
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0250', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0250 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParentAlt/UiComponentColumnMatchParent01')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentColumnMatchParent01'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0250 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0210
     * @tc.name   : The column component does not have a width and height set. The column only has a width set LayoutPolicy.matchParent and height set 50,and column2 and column3 dynamically switch between width and height
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0210', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0210 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParentAlt/UiComponentColumnMatchParent02')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentColumnMatchParent02'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0210 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0260
     * @tc.name   : Set the width and height of the column component(width 200,height 300),set the width(LayoutPolicy.matchParent) height of 50 for column1,and dynamically switch the width and height of column2 and column3
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0260', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0260 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParentAlt/UiComponentColumnMatchParent03')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentColumnMatchParent03'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0260 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0240
     * @tc.name   : Set the width and height of the column component,set the width and height(LayoutPolicy.matchParent) for column1,and dynamically switch the width and height of column2 and column3
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0240', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0240 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParentAlt/UiComponentColumnMatchParent04')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentColumnMatchParent04'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0240 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0200
     * @tc.name   : Column setting width and height (width100height200) column1 setting only width and height (width50height100)
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0200', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0200 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParentAlt/UiComponentColumnMatchParent05')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentColumnMatchParent05'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0200 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0220
     * @tc.name   : Set the width and height (width100height200) for column1, and set the width (50) height (LayoutPolicy.matchParent) for column1
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0220', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0220 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParentAlt/UiComponentColumnMatchParent06')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentColumnMatchParent06'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0220 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0180
     * @tc.name   : Set the width and height of the column component (width 200, height 300) for column1, and dynamically switch between width (LayoutPolicy. matchParent) and height (LayoutPolicy. matchParent) for column2 and column3
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0180', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0180 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParentAlt/UiComponentColumnMatchParent07')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentColumnMatchParent07'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0180 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0270
     * @tc.name   : The column component is not set to width or height,column1 is set to width(50)height(LayoutPolicy. matchParent),column2 and column3 dynamically switch between width and height
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0270', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0270 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParentAlt/UiComponentColumnMatchParent08')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentColumnMatchParent08'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0270 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0190
     * @tc.name   : column sets (width200height300 column1 sets.width(LayoutPolicy.matchParent) .height(LayoutPolicy.matchParent), column2 and column3 dynamically switch width and height
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0190', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0190 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParentAlt/UiComponentColumnMatchParent09')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentColumnMatchParent09'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0190 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0310
     * @tc.name   : Column1 sets .width (LayoutPolicy.matchParent) or.height (LayoutPolicy.matchParent) row1 sets.width (50) height (LayoutPolicy.matchParent)
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0310', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0310 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParentAlt/UiComponentColumnMatchParent10')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0310 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0230
     * @tc.name   : The column component is not set to width or height.Column1 is set .width(LayoutPolicy.matchParent) or.height(LayoutPolicy.matchParent),and column2 and column3 dynamically switch between width and height
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0230', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0230 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParentAlt/UiComponentColumnMatchParent11')
      let driver:Driver=Driver.create();
      let button01: Component = await driver.waitForComponent(ON.id('UiComponentColumnMatchParent11'),1000);
      windowSnap.snapShot()
      await driver.waitForIdle(500,2000)
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await button01.click()
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0230 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0320
     * @tc.name   : Column has no width or height set, column1 has. width (LayoutPolicy. matchParent) or. height (LayoutPolicy. matchParent) set, row1 has no width or height set, row2, column2, row3, column3 dynamically switch between width and height
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0320', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0320 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParentAlt/UiComponentColumnMatchParent12')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0320 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0300
     * @tc.name   : Column not set width and height.Column1 is set .width(LayoutPolicy.matchParent)or.height(LayoutPolicy.matchParent),row1 is set to (Width50Height100)
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0300', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0300 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParentAlt/UiComponentColumnMatchParent13')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0300 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0710
     * @tc.name   : Set the width and height of column (width 200,height 300) ,set column1 .width(50).height(LayoutPolicy.matchParent),set row1 .width(50).height(LayoutPolicy.matchParent)
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0710', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0710 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParentAlt/UiComponentColumnMatchParent14')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0710 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0740
     * @tc.name   : Set the width and height of column (width 200,height 300) ,column1 not set width and height,set row1 .width(LayoutPolicy.matchParent).height(LayoutPolicy.matchParent)
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0740', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0740 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParentAlt/UiComponentColumnMatchParent15')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0740 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0680
     * @tc.name   : Set the width and height of column (width 200,height 300) ,set column1 .width(50).height(LayoutPolicy.matchParent),set row1 .width(LayoutPolicy.matchParent)or.height(LayoutPolicy.matchParent)
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0680', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0680 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParentAlt/UiComponentColumnMatchParent16')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0680 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0760
     * @tc.name   : Set the width and height of column (width 200,height 300) ,column1 not set width and height,set row1 .width(50).height(LayoutPolicy.matchParent)
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0760', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0760 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParentAlt/UiComponentColumnMatchParent17')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0760 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0700
     * @tc.name   : Set the width and height of column (width 200,height 300) ,column1  set width and height to 50 and LayoutPolicy.matchParent,set row1 .width(50).height(100)
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0700', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0700 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParentAlt/UiComponentColumnMatchParent18')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0700 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0690
     * @tc.name   : Set the width and height of column (width 200,height 300) ,column1  set width and height to 50 and LayoutPolicy.matchParent,set row1 .width(LayoutPolicy.matchParent).height(LayoutPolicy.matchParent)
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0690', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0690 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParentAlt/UiComponentColumnMatchParent19')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0690 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0720
     * @tc.name   : Set the width and height of column (width 200,height 300) ,column1  set width and height to 50 and LayoutPolicy.matchParent,not set row1 width and height
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0720', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0720 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParentAlt/UiComponentColumnMatchParent20')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0720 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0730
     * @tc.name   : Set the width and height of column (width 200,height 300) ,column1 not set width and height,set row1 width and height to LayoutPolicy.matchParent
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0730', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0730 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParentAlt/UiComponentColumnMatchParent21')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0730 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0750
     * @tc.name   : Set the width and height of column (width 200,height 300) ,column1 not set width and height,set row1 width and height to 50 and 100
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0750', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0750 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParentAlt/UiComponentColumnMatchParent22')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0750 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0770
     * @tc.name   : Set the width and height of column (width 200,height 300) ,column1 not set width and height,not set row1 width and height
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0770', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0770 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParentAlt/UiComponentColumnMatchParent23')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0770 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0530
     * @tc.name   : Set the width and height of column (width 200,height 300) ,column1  set width or height to LayoutPolicy.matchParent,row1  set width or height to LayoutPolicy.matchParent
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0530', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0530 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParentAlt/UiComponentColumnMatchParent24')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0530 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0540
     * @tc.name   : Set the width and height of column (width 200,height 300) ,column1 set width or height to LayoutPolicy.matchParent,row1  set width and height to LayoutPolicy.matchParent
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0540', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0540 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParentAlt/UiComponentColumnMatchParent25')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0540 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0550
     * @tc.name   : Set the width and height of column (width 200,height 300) ,column1 set width or height to LayoutPolicy.matchParent,row1  set width and height to 50 and 100
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0550', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0550 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParentAlt/UiComponentColumnMatchParent26')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0550 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0560
     * @tc.name   : Set the width and height of column (width 200,height 300) ,column1 set width or height to LayoutPolicy.matchParent,row1  set width and height to 50 and LayoutPolicy.matchParent
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0560', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0560 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParentAlt/UiComponentColumnMatchParent27')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0560 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0570
     * @tc.name   : Set the width and height of column (width 200,height 300) ,column1 set width or height to LayoutPolicy.matchParent,row1 not set width and height
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0570', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0570 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParentAlt/UiComponentColumnMatchParent28')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0570 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0600
     * @tc.name   : Set the width and height of column (width 200,height 300) ,column1 set width and height to LayoutPolicy.matchParent,row1 set width and height to 50 and 100
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0600', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0600 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParentAlt/UiComponentColumnMatchParent29')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0600 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0580
     * @tc.name   : Set the width and height of column (width 200,height 300) ,column1 set width and height to LayoutPolicy.matchParent,row1 set width or height to LayoutPolicy.matchParent
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0580', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0580 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParentAlt/UiComponentColumnMatchParent30')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0580 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0590
     * @tc.name   : Set the width and height of column (width 200,height 300) ,column1 set width and height to LayoutPolicy.matchParent,row1 set width and height to LayoutPolicy.matchParent
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0590', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0590 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParentAlt/UiComponentColumnMatchParent31')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0590 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0610
     * @tc.name   : Set the width and height of column (width 200,height 300) ,column1 set width and height to LayoutPolicy.matchParent,row1 set width and height to 50 and LayoutPolicy.matchParent
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0610', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0610 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParentAlt/UiComponentColumnMatchParent32')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0610 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0630
     * @tc.name   : Set the width and height of column (width 200,height 300) ,column1 set width and height to 50 and 100,row1 set width or height to LayoutPolicy.matchParent
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0630', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0630 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParentAlt/UiComponentColumnMatchParent33')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0630 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0640
     * @tc.name   : Set the width and height of column (width 200,height 300) ,column1 set width and height to 50 and 100,row1 set width and height to LayoutPolicy.matchParent
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0640', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0640 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParentAlt/UiComponentColumnMatchParent34')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0640 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0650
     * @tc.name   : Set the width and height of column (width 200,height 300) ,column1 set width and height to 50 and 100,row1 set width and height to 50 and 100
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0650', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0650 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParentAlt/UiComponentColumnMatchParent35')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0650 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0670
     * @tc.name   : Set the width and height of column (width 200,height 300) ,column1 set width and height to 50 and 100,row1 not set width and height
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0670', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0670 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParentAlt/UiComponentColumnMatchParent36')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0670 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0660
     * @tc.name   : Set the width and height of column (width 200,height 300) ,column1 set width and height to 50 and 100,row1 set width and height to 50 and LayoutPolicy.matchParent
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0660', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0660 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParentAlt/UiComponentColumnMatchParent37')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0660 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0620
     * @tc.name   : Set the width and height of column (width 200,height 300) ,column1 set width and height to LayoutPolicy.matchParent,row1 not set width and height
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0620', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0620 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParentAlt/UiComponentColumnMatchParent38')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0620 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0350
     * @tc.name   : not set the width and height of column,column1 set width and height to LayoutPolicy.matchParent,row1 set width and height to 50 and 100
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0350', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0350 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParentAlt/UiComponentColumnMatchParent39')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0350 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0380
     * @tc.name   : not set the width and height of column,column1 set width and height to 50 and 100,row1 set width or height to LayoutPolicy.matchParent
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0380', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0380 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParentAlt/UiComponentColumnMatchParent40')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0380 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0390
     * @tc.name   : not set the width and height of column,column1 set width and height to 50 and 100,row1 set width and height to LayoutPolicy.matchParent
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0390', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0390 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParentAlt/UiComponentColumnMatchParent41')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0390 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0400
     * @tc.name   : not set the width and height of column,column1 set width and height to 50 and 100,row1 set width and height to 50 and 100
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0400', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0400 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParentAlt/UiComponentColumnMatchParent42')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0400 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0410
     * @tc.name   : not set the width and height of column,column1 set width and height to 50 and 100,row1 set width and height to 50 and LayoutPolicy.matchParent
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0410', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0410 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParentAlt/UiComponentColumnMatchParent43')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0410 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0420
     * @tc.name   : not set the width and height of column,column1 set width and height to 50 and 100,row1 not  set width and height
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0420', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0420 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParentAlt/UiComponentColumnMatchParent44')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0420 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0450
     * @tc.name   : not set the width and height of column,column1 set width and height to 50 and LayoutPolicy.matchParent ,row1 set width and height to 50 and 100
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0450', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0450 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParentAlt/UiComponentColumnMatchParent45')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0450 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0500
     * @tc.name   : not set the width and height of column,column1 not set width and height,row1 set width and height to 50 and 100
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0500', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0500 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParentAlt/UiComponentColumnMatchParent46')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0500 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0520
     * @tc.name   : not set the width and height of column,column1 not set width and height,row1 not set width and height
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0520', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0520 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParentAlt/UiComponentColumnMatchParent47')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0520 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0490
     * @tc.name   : not set the width and height of column,column1 not set width and height,row1  set width and height to LayoutPolicy.matchParent
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0490', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0490 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParentAlt/UiComponentColumnMatchParent48')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0490 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0370
     * @tc.name   : not set the width and height of column,column1 set width and height to LayoutPolicy.matchParent,row1 not set width and height
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0370', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0370 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParentAlt/UiComponentColumnMatchParent49')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0370 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0480
     * @tc.name   : not set the width and height of column,column1 not set width and height,row1 set width or height to LayoutPolicy.matchParent
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0480', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0480 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParentAlt/UiComponentColumnMatchParent50')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0480 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0470
     * @tc.name   : not set the width and height of column,column1  set width and height to 50 and LayoutPolicy.matchParent,row1 not set width or height
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0470', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0470 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParentAlt/UiComponentColumnMatchParent51')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0470 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0510
     * @tc.name   : not set the width and height of column,row1  set width and height to 50 and LayoutPolicy.matchParent,column1 not set width or height
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0510', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0510 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParentAlt/UiComponentColumnMatchParent52')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0510 finish.`);
      done()
    })

    /*
     * @tc.number : SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0170
     * @tc.name   : Set the flexSink attribute for column1, column2, and column3,Column3 sets width (LayoutPolicy. matchParent) and height (LayoutPolicy. matchParent)
     * @tc.desc   : Verify column matchparent interface behavior and expected UI result for this case.
     * @tc.type   : Function
     * @tc.size   : MediumTest
     * @tc.level  : 0
     */
    it('SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0170', Level.LEVEL0, async (done: Function) => {
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0170 start.`);
      Settings.createWindow('testability/pages/component/layout/ColumnMatchParentAlt/UiComponentColumnMatchParent53')
      let driver:Driver=Driver.create();
      await driver.waitForIdle(500,2000)
      windowSnap.snapShot()
      await Utils.sleep(1000)
      Logger.info('TEST', `SUB_ACE_UI_COMPONENT_COLUMN_MATCHPARENT_0170 finish.`);
      done()
    })

  })
}