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
 * @tc.name: SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0060
 * @tc.desc: Navigation自定义转场动画能力增强（replace接口，带有页面栈的操作模式）
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
export struct NavdestinationSystemtransitio0060 {
  @Local testLog: string = '';
  @Local pageStack: string[] = [];

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'NavdestinationSystemtransitio0060', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - replace接口 + 页面栈操作模式');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0060')
        .fontSize(11)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 6 });

      Text('replace接口 + 页面栈操作模式')
        .fontSize(12)
        .margin({ bottom: 6 });

      Button('Navigation自定义转场动画能力增强')
        .onClick(() => this.addLog('进入Navigation自定义转场动画'))
        .id('btn_nav_transition')
        .margin({ bottom: 3 });

      Button('pushPath pageThree (TITLE)')
        .onClick(() => {
          this.addLog('pushPath pageThree');
          this.pageStack.push('pageThree');
        })
        .id('btn_push_pageThree')
        .margin({ bottom: 3 });

      Button('pushPath pageFour (CONTENT)')
        .onClick(() => {
          this.addLog('pushPath pageFour');
          this.pageStack.push('pageFour');
        })
        .id('btn_push_pageFour')
        .margin({ bottom: 3 });

      Button('replacePath pageThree MOVE_TO_TOP_SINGLETON')
        .onClick(() => {
          this.addLog('replacePath pageThree MOVE_TO_TOP_SINGLETON');
          this.addLog('预期: 标题栏有进场动画效果');
        })
        .id('btn_replace_moveToTop')
        .margin({ bottom: 3 });

      Button('replacePath pageFour STANDARD')
        .onClick(() => {
          this.addLog('replacePath pageFour STANDARD');
          this.addLog('预期: 内容区有替换动画效果');
        })
        .id('btn_replace_standard')
        .margin({ bottom: 3 });

      Button('pushPath pageOne')
        .onClick(() => {
          this.addLog('pushPath pageOne');
          this.pageStack.push('pageOne');
        })
        .id('btn_push_pageOne')
        .margin({ bottom: 3 });

      Button('pushPath pageTwo')
        .onClick(() => {
          this.addLog('pushPath pageTwo');
          this.pageStack.push('pageTwo');
        })
        .id('btn_push_pageTwo')
        .margin({ bottom: 3 });

      Button('replacePath pageFour POP_TO_SINGLETON')
        .onClick(() => {
          this.addLog('replacePath pageFour POP_TO_SINGLETON');
          this.addLog('预期: 内容区有进场动画效果');
        })
        .id('btn_replace_popToSingleton')
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

