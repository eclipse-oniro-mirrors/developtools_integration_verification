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
 * @tc.name: SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0160
 * @tc.desc: Navigation自定义转场动画能力增强（单双栏切换场景）
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
export struct NavdestinationSystemtransitio0160 {
  @Local testLog: string = '';
  @Local pageStack: string[] = [];
  @Local navMode: string = 'Stack';

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'NavdestinationSystemtransitio0160', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - 单双栏切换场景');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0160')
        .fontSize(11)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 });

      Text('单双栏切换场景')
        .fontSize(12)
        .margin({ bottom: 5 });

      Button('Navigation自定义转场动画能力增强')
        .onClick(() => this.addLog('进入Navigation自定义转场动画'))
        .id('btn_nav_transition')
        .margin({ bottom: 3 });

      Button(`NavigationMode：${this.navMode}`)
        .onClick(() => {
          this.navMode = this.navMode === 'Stack' ? 'Split' : 'Stack';
          this.addLog(`切换到${this.navMode}模式`);
        })
        .id('btn_nav_mode')
        .backgroundColor(this.navMode === 'Split' ? '#4CAF50' : '#2196F3')
        .margin({ bottom: 3 });

      Text('Split模式下pushPath:')
        .fontSize(10)
        .margin({ top: 3 });

      Row() {
        Button('pageThree')
          .onClick(() => {
            this.addLog('pushPath pageThree - Split模式下均无动画');
            this.pageStack.push('pageThree');
          })
          .id('btn_push_pageThree');
        Button('pageOne')
          .onClick(() => {
            this.addLog('pushPath pageOne - 标题栏、内容区均有动画');
            this.pageStack.push('pageOne');
          })
          .id('btn_push_pageOne');
      }
      .margin({ bottom: 2 });

      Row() {
        Button('pageTwo')
          .onClick(() => {
            this.addLog('pushPath pageTwo - 均无动画');
            this.pageStack.push('pageTwo');
          })
          .id('btn_push_pageTwo');
        Button('pageFour')
          .onClick(() => {
            this.addLog('pushPath pageFour - 内容区有动画');
            this.pageStack.push('pageFour');
          })
          .id('btn_push_pageFour');
      }
      .margin({ bottom: 2 });

      Button('pageEight (DIALOG)')
        .onClick(() => {
          this.addLog('pushPath pageEight - 内容区有动画');
          this.pageStack.push('pageEight');
        })
        .id('btn_push_pageEight')
        .margin({ bottom: 3 });

      Text(`页面栈: ${this.pageStack.length}`)
        .fontSize(10);

      Scroll() {
        Text(this.testLog)
          .fontSize(9)
          .fontColor('#333333')
          .id('log_text');
      }
      .height('6.56%')
      .width('100%')
      .backgroundColor('#F5F5F5')
      .padding(5)
      .margin({ top: 3 });
    }
    .width('100%')
    .height('100%')
    .padding(10);
  }
}

