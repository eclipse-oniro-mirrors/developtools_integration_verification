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
 * @tc.name: SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0140
 * @tc.desc: Navigation自定义转场动画能力增强（DIALOG+STANDARD场景）
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
export struct NavdestinationSystemtransitio0140 {
  @Local testLog: string = '';
  @Local pageStack: string[] = [];

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'NavdestinationSystemtransitio0140', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - DIALOG+STANDARD场景');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0140')
        .fontSize(11)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 6 });

      Text('DIALOG+STANDARD场景')
        .fontSize(12)
        .margin({ bottom: 6 });

      Button('Navigation自定义转场动画能力增强')
        .onClick(() => this.addLog('进入Navigation自定义转场动画'))
        .id('btn_nav_transition')
        .margin({ bottom: 3 });

      Text('STANDARD页面:')
        .fontSize(11)
        .margin({ top: 5 });

      Row() {
        Button('pageThree(TITLE)')
          .onClick(() => {
            this.addLog('pushPath pageThree (TITLE, STANDARD)');
            this.addLog('预期: 标题栏有进场动画效果');
            this.pageStack.push('pageThree-STANDARD');
          })
          .id('btn_push_pageThree');

        Button('pageFour(CONTENT)')
          .onClick(() => {
            this.addLog('pushPath pageFour (CONTENT, STANDARD)');
            this.addLog('预期: 内容区有进场动画效果');
            this.pageStack.push('pageFour-STANDARD');
          })
          .id('btn_push_pageFour');
      }
      .margin({ bottom: 3 });

      Text('DIALOG页面:')
        .fontSize(11)
        .margin({ top: 5 });

      Row() {
        Button('pageSenve(TITLE)')
          .onClick(() => {
            this.addLog('pushPath pageSenve (TITLE, DIALOG)');
            this.addLog('预期: 标题栏无动画效果');
            this.pageStack.push('pageSenve-DIALOG');
          })
          .id('btn_push_pageSenve');

        Button('pageEight(CONTENT)')
          .onClick(() => {
            this.addLog('pushPath pageEight (CONTENT, DIALOG)');
            this.addLog('预期: 内容区有动画效果');
            this.pageStack.push('pageEight-DIALOG');
          })
          .id('btn_push_pageEight');
      }

      Text(`页面栈: ${this.pageStack.join(' -> ')}`)
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

