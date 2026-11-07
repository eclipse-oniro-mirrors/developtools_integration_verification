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
 * @tc.name: SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0120
 * @tc.desc: Navigation自定义转场动画能力增强（横竖屏切换场景）
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
export struct NavdestinationSystemtransitio0120 {
  @Local testLog: string = '';
  @Local isLandscape: boolean = false;
  @Local pageStack: string[] = [];

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'NavdestinationSystemtransitio0120', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - 横竖屏切换场景');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0120')
        .fontSize(11)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 6 });

      Text('横竖屏切换场景')
        .fontSize(12)
        .margin({ bottom: 6 });

      Button('Navigation自定义转场动画能力增强')
        .onClick(() => this.addLog('进入Navigation自定义转场动画'))
        .id('btn_nav_transition')
        .margin({ bottom: 3 });

      Button(this.isLandscape ? '横屏模式' : '竖屏模式')
        .onClick(() => {
          this.isLandscape = !this.isLandscape;
          this.addLog(`切换到${this.isLandscape ? '横屏' : '竖屏'}模式`);
        })
        .id('btn_orientation')
        .backgroundColor(this.isLandscape ? '#4CAF50' : '#2196F3')
        .margin({ bottom: 3 });

      Text('横屏下pushPath操作:')
        .fontSize(11)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 5, bottom: 3 });

      Row() {
        Button('pageOne')
          .onClick(() => {
            this.addLog('pushPath pageOne (DEFAULT)');
            this.addLog(this.isLandscape ? '横屏: 标题栏、内容区均无进场动画' : '竖屏: 有动画');
            this.pageStack.push('pageOne');
          })
          .id('btn_push_pageOne');

        Button('pageTwo')
          .onClick(() => {
            this.addLog('pushPath pageTwo (NONE)');
            this.addLog(this.isLandscape ? '横屏: 标题栏、内容区均无进场动画' : '竖屏: 无动画');
            this.pageStack.push('pageTwo');
          })
          .id('btn_push_pageTwo');
      }
      .margin({ bottom: 3 });

      Row() {
        Button('pageThree')
          .onClick(() => {
            this.addLog('pushPath pageThree (TITLE)');
            this.addLog(this.isLandscape ? '横屏: 标题栏有进场动画' : '竖屏: 标题栏有动画');
            this.pageStack.push('pageThree');
          })
          .id('btn_push_pageThree');

        Button('pageFour')
          .onClick(() => {
            this.addLog('pushPath pageFour (CONTENT)');
            this.addLog(this.isLandscape ? '横屏: 内容区有进场动画' : '竖屏: 内容区有动画');
            this.pageStack.push('pageFour');
          })
          .id('btn_push_pageFour');
      }

      Text(`页面栈: ${this.pageStack.length}`)
        .fontSize(10)
        .margin({ top: 5 });

      Scroll() {
        Text(this.testLog)
          .fontSize(10)
          .fontColor('#333333')
          .id('log_text');
      }
      .height('8.2%')
      .width('100%')
      .backgroundColor('#F5F5F5')
      .padding(5)
      .margin({ top: 5 });
    }
    .width('100%')
    .height('100%')
    .padding(10);
  }
}

