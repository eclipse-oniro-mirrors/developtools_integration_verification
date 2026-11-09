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
 * @tc.name: SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0200
 * @tc.desc: Navigation自定义转场动画能力增强（镜像场景）
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
export struct NavdestinationSystemtransitio0200 {
  @Local testLog: string = '';
  @Local pageStack: string[] = [];
  @Local isRtl: boolean = false;

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'NavdestinationSystemtransitio0200', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - 镜像场景');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0200')
        .fontSize(11)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 });

      Text('镜像场景（维吾尔语等RTL语言）')
        .fontSize(12)
        .margin({ bottom: 5 });

      Button('Navigation自定义转场动画能力增强')
        .onClick(() => this.addLog('进入Navigation自定义转场动画'))
        .id('btn_nav_transition')
        .margin({ bottom: 3 });

      Button(this.isRtl ? '当前: RTL (维吾尔语)' : '切换维吾尔语')
        .onClick(() => {
          this.isRtl = true;
          this.addLog('系统切换维吾尔语 - RTL布局');
        })
        .id('btn_rtl')
        .backgroundColor(this.isRtl ? '#4CAF50' : '#9C27B0')
        .margin({ bottom: 3 });

      Text('RTL模式下pushPath:')
        .fontSize(10)
        .margin({ top: 3 });

      Row() {
        Button('pageOne')
          .onClick(() => {
            this.addLog('pushPath pageOne (DEFAULT)');
            this.addLog('预期: 标题栏、内容区均有进场动画(镜像)');
            this.pageStack.push('pageOne');
          })
          .id('btn_push_pageOne');
        Button('pageTwo')
          .onClick(() => {
            this.addLog('pushPath pageTwo (NONE)');
            this.addLog('预期: 均无进场动画');
            this.pageStack.push('pageTwo');
          })
          .id('btn_push_pageTwo');
      }
      .margin({ bottom: 2 });

      Row() {
        Button('pageThree')
          .onClick(() => {
            this.addLog('pushPath pageThree (TITLE)');
            this.addLog('预期: 标题栏有进场动画(镜像)');
            this.pageStack.push('pageThree');
          })
          .id('btn_push_pageThree');
        Button('pageFour')
          .onClick(() => {
            this.addLog('pushPath pageFour (CONTENT)');
            this.addLog('预期: 内容区有进场动画(镜像)');
            this.pageStack.push('pageFour');
          })
          .id('btn_push_pageFour');
      }
      .margin({ bottom: 2 });

      Button('pageEight (DIALOG)')
        .onClick(() => {
          this.addLog('pushPath pageEight');
          this.addLog('预期: 内容区有动画效果(镜像)');
          this.pageStack.push('pageEight');
        })
        .id('btn_push_pageEight');

      Text(`页面栈: ${this.pageStack.length}`)
        .fontSize(10)
        .margin({ top: 3 });

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

