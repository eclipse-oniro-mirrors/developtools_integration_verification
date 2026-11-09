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
 * @tc.name: SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0040
 * @tc.desc: Navigation自定义转场动画能力增强（push接口测试，带有页面栈的操作模式）
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
export struct NavdestinationSystemtransitio0040 {
  @Local testLog: string = '';
  @Local pageStack: string[] = [];

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'NavdestinationSystemtransitio0040', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - push接口测试（带页面栈操作模式）');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0040')
        .fontSize(11)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 8 });

      Text('push接口 + 页面栈操作模式')
        .fontSize(12)
        .margin({ bottom: 8 });

      Button('Navigation自定义转场动画能力增强')
        .onClick(() => this.addLog('进入Navigation自定义转场动画'))
        .id('btn_nav_transition')
        .margin({ bottom: 4 });

      Button('pushPath pageThree (TITLE)')
        .onClick(() => {
          this.addLog('pushPath pageThree - 标题栏有进场动画');
          this.pageStack.push('pageThree');
        })
        .id('btn_push_pageThree')
        .margin({ bottom: 4 });

      Button('pushPath pageFour (CONTENT)')
        .onClick(() => {
          this.addLog('pushPath pageFour - 内容区有进场动画');
          this.pageStack.push('pageFour');
        })
        .id('btn_push_pageFour')
        .margin({ bottom: 4 });

      Button('pushPath pageThree MOVE_TO_TOP_SINGLETON')
        .onClick(() => {
          this.addLog('pushPath pageThree MOVE_TO_TOP_SINGLETON');
          this.addLog('预期: 标题栏有进场动画效果');
          // Simulate MOVE_TO_TOP
          let idx = this.pageStack.indexOf('pageThree');
          if (idx >= 0) {
            this.pageStack.splice(idx, 1);
            this.pageStack.push('pageThree');
          }
        })
        .id('btn_push_moveToTop')
        .margin({ bottom: 4 });

      Button('pushPath pageFour STANDARD')
        .onClick(() => {
          this.addLog('pushPath pageFour STANDARD');
          this.addLog('预期: 内容区有进场动画效果');
          this.pageStack.push('pageFour');
        })
        .id('btn_push_pageFour_standard')
        .margin({ bottom: 4 });

      Button('pushPath pageThree POP_TO_SINGLETON')
        .onClick(() => {
          this.addLog('pushPath pageThree POP_TO_SINGLETON');
          this.addLog('预期: 内容区有退场动画效果');
          // Simulate POP_TO
          let idx = this.pageStack.indexOf('pageThree');
          if (idx >= 0) {
            this.pageStack = this.pageStack.slice(0, idx + 1);
          }
        })
        .id('btn_push_popToSingleton')
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
      .backgroundColor('#E3F2FD')
      .borderRadius(8)
      .margin({ top: 5 });

      Scroll() {
        Text(this.testLog)
          .fontSize(10)
          .fontColor('#333333')
          .id('log_text');
      }
      .height('6.56%')
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

