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
 * @tc.name: SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0190
 * @tc.desc: Navigation自定义转场动画能力增强（navBarPosition场景）
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
export struct NavdestinationSystemtransitio0190 {
  @Local testLog: string = '';
  @Local pageStack: string[] = [];
  @Local navMode: string = 'Stack';
  @Local navBarPosition: string = 'Start';

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'NavdestinationSystemtransitio0190', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - navBarPosition场景');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0190')
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 4 });

      Text('navBarPosition场景')
        .fontSize(11)
        .margin({ bottom: 4 });

      Button('Navigation自定义转场动画能力增强')
        .onClick(() => this.addLog('进入Navigation自定义转场动画'))
        .id('btn_nav_transition')
        .margin({ bottom: 2 });

      Row() {
        Button(`Mode: ${this.navMode}`)
          .onClick(() => {
            this.navMode = this.navMode === 'Stack' ? 'Split' : 'Stack';
            this.addLog(`NavigationMode: ${this.navMode}`);
          })
          .id('btn_nav_mode')
          .margin({ right: 5 });

        Button(`Position: ${this.navBarPosition}`)
          .onClick(() => {
            this.navBarPosition = this.navBarPosition === 'Start' ? 'End' : 'Start';
            this.addLog(`navBarPosition: ${this.navBarPosition}`);
          })
          .id('btn_nav_position');
      }
      .margin({ bottom: 2 });

      Row() {
        Button('pageThree')
          .onClick(() => {
            this.addLog('pushPath pageThree - Split+End模式下均无动画');
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
        .id('btn_push_pageEight');

      Text(`页面栈: ${this.pageStack.length}`)
        .fontSize(9);

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
      .margin({ top: 2 });
    }
    .width('100%')
    .height('100%')
    .padding(10);
  }
}

