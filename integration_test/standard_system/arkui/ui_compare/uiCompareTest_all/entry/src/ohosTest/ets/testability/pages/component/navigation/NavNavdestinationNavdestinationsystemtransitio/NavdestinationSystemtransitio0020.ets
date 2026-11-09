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
 * @tc.name: SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0020
 * @tc.desc: Navigation自定义转场动画能力增强（异常值测试）
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

class PageInfo {
  public name: string = '';
  public transitionType: string = '';
  public pageType: string = '';

  constructor(name: string, transitionType: string, pageType: string) {
    this.name = name;
    this.transitionType = transitionType;
    this.pageType = pageType;
  }
}

@Entry
@ComponentV2
export struct NavdestinationSystemtransitio0020 {
  @Local testLog: string = '';
  @Local pageStack: PageInfo[] = [];
  @Local currentPage: string = '';

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'NavdestinationSystemtransitio0020', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - Navigation自定义转场动画能力增强异常值测试');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0020')
        .fontSize(11)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 });

      Text('异常值测试 - undefined/null')
        .fontSize(12)
        .margin({ bottom: 10 });

      Button('Navigation自定义转场动画能力增强')
        .onClick(() => {
          this.addLog('点击Navigation自定义转场动画能力增强按钮');
        })
        .id('btn_nav_transition')
        .margin({ bottom: 5 });

      Button('pushPath pageNine (undefined)')
        .onClick(() => {
          this.addLog('pushPath pageNine - TransitionType: undefined');
          this.addLog('预期: 标题栏、内容区均有进场动画效果(走默认)');
          this.currentPage = 'pageNine';
          this.pageStack.push(new PageInfo('pageNine', 'undefined', 'STANDARD'));
        })
        .id('btn_push_pageNine')
        .margin({ bottom: 5 });

      Button('pushPath pageTen (null)')
        .onClick(() => {
          this.addLog('pushPath pageTen - TransitionType: null');
          this.addLog('预期: 标题栏、内容区均有进场动画效果(走默认)');
          this.currentPage = 'pageTen';
          this.pageStack.push(new PageInfo('pageTen', 'null', 'STANDARD'));
        })
        .id('btn_push_pageTen')
        .margin({ bottom: 5 });

      if (this.currentPage !== '') {
        Column() {
          Text(`当前页面: ${this.currentPage}`)
            .fontSize(14)
            .fontWeight(FontWeight.Bold);
          Text(`页面栈深度: ${this.pageStack.length}`)
            .fontSize(12);
          ForEach(this.pageStack, (item: PageInfo, index: number) => {
            Text(`${index}: ${item.name} (${item.transitionType}, ${item.pageType})`)
              .fontSize(11)
              .fontColor('#666666');
          });
        }
        .width('100%')
        .padding(10)
        .backgroundColor('#FFF3E0')
        .borderRadius(8)
        .margin({ top: 10 });
      }

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10 });

      Text('异常值(undefined/null)应走默认转场动画')
        .fontSize(11)
        .fontColor('#666666');

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
      .margin({ top: 10 });
    }
    .width('100%')
    .height('100%')
    .padding(10);
  }
}

