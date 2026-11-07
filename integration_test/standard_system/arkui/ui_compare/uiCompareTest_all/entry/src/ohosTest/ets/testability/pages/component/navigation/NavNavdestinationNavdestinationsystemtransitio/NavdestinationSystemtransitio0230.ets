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
 * @tc.name: SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0230
 * @tc.desc: Navigation自定义转场动画能力增强（NavPathStack操作开发者自定义场景）
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
export struct NavdestinationSystemtransitio0230 {
  @Local testLog: string = '';
  @Local pageStack: string[] = [];

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'NavdestinationSystemtransitio0230', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - NavPathStack操作开发者自定义场景');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0230')
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 4 });

      Text('NavPathStack操作开发者自定义场景')
        .fontSize(11)
        .margin({ bottom: 4 });

      Button('NavPathStack操作开发者自定义')
        .onClick(() => this.addLog('进入NavPathStack操作开发者自定义模式'))
        .id('btn_custom_nav')
        .margin({ bottom: 2 });

      Text('自定义pushPath:')
        .fontSize(10)
        .margin({ top: 3 });

      Row() {
        Button('自定义pageOne')
          .onClick(() => {
            this.addLog('自定义 pushPath pageOne (DEFAULT)');
            this.addLog('预期: 均有进场动画');
            this.pageStack.push('pageOne');
          })
          .id('btn_push_pageOne');
        Button('自定义pageTwo')
          .onClick(() => {
            this.addLog('自定义 pushPath pageTwo (NONE)');
            this.addLog('预期: 均无进场动画');
            this.pageStack.push('pageTwo');
          })
          .id('btn_push_pageTwo');
      }
      .margin({ bottom: 2 });

      Row() {
        Button('自定义pageThree')
          .onClick(() => {
            this.addLog('自定义 pushPath pageThree (TITLE)');
            this.addLog('预期: 标题栏有进场动画');
            this.pageStack.push('pageThree');
          })
          .id('btn_push_pageThree');
        Button('自定义pageFour')
          .onClick(() => {
            this.addLog('自定义 pushPath pageFour (CONTENT)');
            this.addLog('预期: 内容区有进场动画');
            this.pageStack.push('pageFour');
          })
          .id('btn_push_pageFour');
      }
      .margin({ bottom: 2 });

      Button('自定义pageEight (DIALOG)')
        .onClick(() => {
          this.addLog('自定义 pushPath pageEight');
          this.addLog('预期: 内容区有动画效果');
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

