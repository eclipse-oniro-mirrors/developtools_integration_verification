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

/**
 * 用例ID: NavigationRouterTestLevel3_SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_DUMPDFX_0510
 * 用例描述: Navigation的DFX能力增强测试（move接口）
 * 预置条件:
 * 1、创建Navigation组件、栈调用move接口
 * 测试步骤:
 * 1、点击"Navigation的dump能力增强"按钮
 * 2、点击"pushPath pageOne"按钮
 * 3、点击"pushPath pageTwo"按钮
 * 4、点击"moveToTop pageOne"按钮
 * 5、点击"moveIndexToTop 0"按钮
 * 预期结果:
 * 4、打印日志：
 * sync with js stack, id: NavigationID, UINodeId: xx, preStackSize: 2, newStackSize: 2
 * transition start, disableAllAnimation: 0, animated: 1, isPopPage: 0, isDialog: 0, isReplace: 0, isCustomAnimation: 0
 * 5、打印日志：
 * sync with js stack, id: NavigationID, UINodeId: xx, preStackSize: 2, newStackSize: 2
 * transition start, disableAllAnimation: 0, animated: 1, isPopPage: 0, isDialog: 0, isReplace: 0, isCustomAnimation: 0
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
export struct NavigationDFX0510 {
  @Local navPathStack: NavPathStack = new NavPathStack();
  @Local testLog: string[] = [];

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 12) {
      this.testLog = this.testLog.slice(0, 12);
    }
    hilog.info(0x0000, 'NavigationDFX0510', log);
  }

  @Builder
  PageOneBuilder() {
    NavDestination() {
      Column({ space: 20 }) {
        Text('Page One')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)

        Text('This is Page One content')
          .fontSize(16)
          .fontColor('#666666')

        Button('Back to Home')
          .fontSize(16)
          .onClick(() => {
            this.navPathStack.pop();
            this.addLog('Popped to home from Page One');
          })
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
    }
    .title('Page One')
    .onReady((context: NavDestinationContext) => {
      this.addLog('Page One ready');
    })
  }

  @Builder
  PageTwoBuilder() {
    NavDestination() {
      Column({ space: 20 }) {
        Text('Page Two')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)

        Text('This is Page Two content')
          .fontSize(16)
          .fontColor('#666666')

        Button('Back to Home')
          .fontSize(16)
          .onClick(() => {
            this.navPathStack.pop();
            this.addLog('Popped to home from Page Two');
          })
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
    }
    .title('Page Two')
    .onReady((context: NavDestinationContext) => {
      this.addLog('Page Two ready');
    })
  }

  build() {
    Column({ space: 10 }) {
      Text('NavigationRouterTestLevel3_SUB_ACE_UI_COMPONENT_NAV_NAVIGATION_DUMPDFX_0510')
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('Navigation DFX能力增强测试')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)

      Divider().height(2).color('#EEEEEE')

      Navigation(this.navPathStack) {
        Column({ space: 15 }) {
          Text('Navigation Home')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)

          Text('测试Navigation的move接口DFX日志')
            .fontSize(14)
            .fontColor('#666666')

          Divider()

          Button('pushPath pageOne')
            .fontSize(16)
            .width('80%')
            .backgroundColor('#0A59F7')
            .onClick(() => {
              this.navPathStack.pushPath({ name: 'pageOne' });
              this.addLog('Pushed pageOne, stack size: ' + this.navPathStack.size());
            })
            .id('NavigationDFX0510_PushPageOne')

          Button('pushPath pageTwo')
            .fontSize(16)
            .width('80%')
            .backgroundColor('#0A59F7')
            .onClick(() => {
              this.navPathStack.pushPath({ name: 'pageTwo' });
              this.addLog('Pushed pageTwo, stack size: ' + this.navPathStack.size());
            })
            .id('NavigationDFX0510_PushPageTwo')

          Button('moveToTop pageOne')
            .fontSize(16)
            .width('80%')
            .backgroundColor('#FF9800')
            .onClick(() => {
              this.navPathStack.moveToTop('pageOne');
              this.addLog('Moved pageOne to top - Check hilog for DFX logs');
            })
            .id('NavigationDFX0510_MoveToTop')

          Button('moveIndexToTop 0')
            .fontSize(16)
            .width('80%')
            .backgroundColor('#FF9800')
            .onClick(() => {
              this.navPathStack.moveIndexToTop(0);
              this.addLog('Moved index 0 to top - Check hilog for DFX logs');
            })
            .id('NavigationDFX0510_MoveIndexToTop')

          Button('clear stack')
            .fontSize(16)
            .width('80%')
            .backgroundColor('#F44336')
            .onClick(() => {
              this.navPathStack.clear();
              this.addLog('Stack cleared');
            })

          Text('预期DFX日志：')
            .fontSize(14)
            .fontColor(Color.Green)
            .margin({ top: 10 })

          Text('sync with js stack, id: NavigationID...\ntransition start, disableAllAnimation: 0...')
            .fontSize(12)
            .fontColor('#4CAF50')
            .textAlign(TextAlign.Start)
        }
        .width('100%')
        .padding(20)
      }
      .navDestination(this.PageOneBuilder)
      .navDestination(this.PageTwoBuilder)
      .mode(NavigationMode.Stack)
      .title('DFX Test')
      .id('NavigationDFX0510_Nav')
      .height('60%')

      Divider().height(2).color('#EEEEEE')

      Text('测试日志：')
        .fontSize(16)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)
        .padding({ left: 20 })

      Scroll() {
        Column() {
          ForEach(this.testLog, (log: string, index: number) => {
            Text(log)
              .fontSize(11)
              .fontColor('#333333')
              .width('100%')
              .padding(5)
              .backgroundColor(index % 2 === 0 ? '#F0F0F0' : Color.White)
          })
        }
        .width('100%')
      }
      .height('12.3%')
      .width('90%')
      .backgroundColor('#FAFAFA')
      .borderRadius(4)
      .padding(5)
    }
    .width('100%')
    .height('100%')
    .padding(10)
    .backgroundColor('#F5F5F5')
  }
}

