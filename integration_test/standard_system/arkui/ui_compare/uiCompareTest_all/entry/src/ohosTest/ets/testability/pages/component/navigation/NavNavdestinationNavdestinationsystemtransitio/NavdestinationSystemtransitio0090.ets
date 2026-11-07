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
 * @tc.name: SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0090
 * @tc.desc: Navigation自定义转场动画能力增强（remove接口）
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
export struct NavdestinationSystemtransitio0090 {
  @Local testLog: string = '';
  @Local pageStack: string[] = [];

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'NavdestinationSystemtransitio0090', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - remove接口测试');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0090')
        .fontSize(11)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 6 });

      Text('remove接口测试')
        .fontSize(12)
        .margin({ bottom: 6 });

      Button('Navigation自定义转场动画能力增强')
        .onClick(() => this.addLog('进入Navigation自定义转场动画'))
        .id('btn_nav_transition')
        .margin({ bottom: 3 });

      Row() {
        Button('push pageThree')
          .onClick(() => {
            this.pageStack.push('pageThree');
            this.addLog('pushPath pageThree');
          })
          .id('btn_push_pageThree')
          .margin({ right: 5 });

        Button('push pageFour')
          .onClick(() => {
            this.pageStack.push('pageFour');
            this.addLog('pushPath pageFour');
          })
          .id('btn_push_pageFour');
      }
      .margin({ bottom: 3 });

      Button('removeByNavDestinationId 1')
        .onClick(() => {
          this.addLog('removeByNavDestinationId 1 - 内容区有退场动画效果');
          if (this.pageStack.length > 1) {
            this.pageStack.splice(1, 1);
          }
        })
        .id('btn_removeById')
        .margin({ bottom: 3 });

      Button('removeByName pageThree')
        .onClick(() => {
          this.addLog('removeByName pageThree - 标题栏有退场动画效果');
          let idx = this.pageStack.indexOf('pageThree');
          if (idx >= 0) {
            this.pageStack.splice(idx, 1);
          }
        })
        .id('btn_removeByName')
        .margin({ bottom: 3 });

      Button('removeByIndexes 0')
        .onClick(() => {
          this.addLog('removeByIndexes 0 - 内容区有退场动画效果');
          if (this.pageStack.length > 0) {
            this.pageStack.splice(0, 1);
          }
        })
        .id('btn_removeByIndexes')
        .margin({ bottom: 3 });

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

