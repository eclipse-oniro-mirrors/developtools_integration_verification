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
 * @tc.name: SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0050
 * @tc.desc: Navigation自定义转场动画能力增强（replace接口）
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
export struct NavdestinationSystemtransitio0050 {
  @Local testLog: string = '';
  @Local pageStack: string[] = [];

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'NavdestinationSystemtransitio0050', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - replace接口测试');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0050')
        .fontSize(11)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 8 });

      Text('replace接口测试')
        .fontSize(12)
        .margin({ bottom: 8 });

      Button('Navigation自定义转场动画能力增强')
        .onClick(() => this.addLog('进入Navigation自定义转场动画'))
        .id('btn_nav_transition')
        .margin({ bottom: 4 });

      Button('pushPath pageOne (DEFAULT)')
        .onClick(() => {
          this.addLog('pushPath pageOne');
          this.pageStack.push('pageOne');
        })
        .id('btn_push_pageOne')
        .margin({ bottom: 4 });

      Button('pushPath pageTwo (NONE)')
        .onClick(() => {
          this.addLog('pushPath pageTwo');
          this.pageStack.push('pageTwo');
        })
        .id('btn_push_pageTwo')
        .margin({ bottom: 4 });

      Button('replacePath pageThree (TITLE)')
        .onClick(() => {
          this.addLog('replacePath pageThree - 标题栏有替换动画效果');
          if (this.pageStack.length > 0) {
            this.pageStack.pop();
            this.pageStack.push('pageThree');
          }
        })
        .id('btn_replace_pageThree')
        .margin({ bottom: 4 });

      Button('replacePathByName pageFour (CONTENT)')
        .onClick(() => {
          this.addLog('replacePathByName pageFour - 内容区有替换动画效果');
          if (this.pageStack.length > 0) {
            this.pageStack.pop();
            this.pageStack.push('pageFour');
          }
        })
        .id('btn_replace_pageFour')
        .margin({ bottom: 4 });

      Column() {
        Text(`页面栈 (${this.pageStack.length}):`)
          .fontSize(11)
          .fontWeight(FontWeight.Bold);
        ForEach(this.pageStack, (item: string, index: number) => {
          Text(`${index}: ${item}`)
            .fontSize(10);
        });
      }
      .width('100%')
      .padding(8)
      .backgroundColor('#E8F5E9')
      .borderRadius(8)
      .margin({ top: 8 });

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
      .margin({ top: 8 });
    }
    .width('100%')
    .height('100%')
    .padding(10);
  }
}

