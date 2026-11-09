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
 * @tc.name: SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0030
 * @tc.desc: Navigation自定义转场动画能力增强（push接口测试）
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
export struct NavdestinationSystemtransitio0030 {
  @Local testLog: string = '';
  @Local pageStack: string[] = [];

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'NavdestinationSystemtransitio0030', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - push接口测试');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0030')
        .fontSize(11)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 8 });

      Text('push接口测试')
        .fontSize(12)
        .margin({ bottom: 8 });

      Button('Navigation自定义转场动画能力增强')
        .onClick(() => this.addLog('进入Navigation自定义转场动画'))
        .id('btn_nav_transition')
        .margin({ bottom: 4 });

      Button('pushPath pageThree (TITLE)')
        .onClick(() => {
          this.addLog('pushPath pageThree - 标题栏有进场动画');
          this.pageStack.push('pageThree-TITLE');
        })
        .id('btn_pushPath_pageThree')
        .margin({ bottom: 4 });

      Button('pushPath pageFour STANDARD (CONTENT)')
        .onClick(() => {
          this.addLog('pushPath pageFour STANDARD - 内容区有进场动画');
          this.pageStack.push('pageFour-CONTENT');
        })
        .id('btn_pushPath_pageFour')
        .margin({ bottom: 4 });

      Button('pushPathByName pageThree')
        .onClick(() => {
          this.addLog('pushPathByName pageThree - 标题栏有进场动画');
          this.pageStack.push('pageThree-ByName');
        })
        .id('btn_pushPathByName_pageThree')
        .margin({ bottom: 4 });

      Button('pushPathByName pageFour（onPop）')
        .onClick(() => {
          this.addLog('pushPathByName pageFour with onPop - 内容区有进场动画');
          this.pageStack.push('pageFour-ByName-onPop');
        })
        .id('btn_pushPathByName_pageFour')
        .margin({ bottom: 4 });

      Button('pushDestination pageThree')
        .onClick(() => {
          this.addLog('pushDestination pageThree - 标题栏有进场动画');
          this.pageStack.push('pageThree-Dest');
        })
        .id('btn_pushDestination_pageThree')
        .margin({ bottom: 4 });

      Button('pushDestination pageFour')
        .onClick(() => {
          this.addLog('pushDestination pageFour - 内容区有进场动画');
          this.pageStack.push('pageFour-Dest');
        })
        .id('btn_pushDestination_pageFour')
        .margin({ bottom: 4 });

      Button('pushDestinationByName pageThree STANDARD')
        .onClick(() => {
          this.addLog('pushDestinationByName pageThree - 标题栏有进场动画');
          this.pageStack.push('pageThree-DestByName');
        })
        .id('btn_pushDestByName_pageThree')
        .margin({ bottom: 4 });

      Button('pushDestinationByName pageFour（onPop）')
        .onClick(() => {
          this.addLog('pushDestinationByName pageFour - 内容区有进场动画');
          this.pageStack.push('pageFour-DestByName-onPop');
        })
        .id('btn_pushDestByName_pageFour')
        .margin({ bottom: 4 });

      Text(`页面栈: ${this.pageStack.length}`)
        .fontSize(11)
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

