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
 * @tc.name: SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0250
 * @tc.desc: Navigation自定义转场动画能力增强（调用OnReady场景）
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
export struct NavdestinationSystemtransitio0250 {
  @Local testLog: string = '';
  @Local pageStack: string[] = [];
  @Local currentPage: string = '';

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'NavdestinationSystemtransitio0250', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - OnReady场景');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_NAV_NAVDESTINATION_NAVDESTINATIONSYSTEMTRANSITIO_0250')
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 4 });

      Text('OnReady场景测试')
        .fontSize(11)
        .margin({ bottom: 4 });

      Button('调用OnReady场景测试')
        .onClick(() => this.addLog('进入OnReady场景'))
        .id('btn_onready_test')
        .margin({ bottom: 2 });

      Button('pushPath pageOne')
        .onClick(() => {
          this.addLog('pushPath pageOne');
          this.currentPage = 'pageOne';
          this.pageStack.push('pageOne');
        })
        .id('btn_push_pageOne')
        .margin({ bottom: 2 });

      if (this.currentPage !== '') {
        Text(`当前页面: ${this.currentPage}`)
          .fontSize(10)
          .margin({ bottom: 2 });

        Button(`OnReady pushPath ${this.getNextPage()}`)
          .onClick(() => {
            let nextPage = this.getNextPage();
            this.addLog(`${this.currentPage}页面OnReady pushPath ${nextPage}`);
            this.addLog(`预期: ${this.getExpectedAnimation(nextPage)}`);
            this.currentPage = nextPage;
            this.pageStack.push(nextPage);
          })
          .id('btn_onready_push')
          .margin({ bottom: 2 });
      }

      Text(`页面栈: ${this.pageStack.join(' -> ')}`)
        .fontSize(9);

      Scroll() {
        Text(this.testLog)
          .fontSize(9)
          .fontColor('#333333')
          .id('log_text');
      }
      .height('8.2%')
      .width('100%')
      .backgroundColor('#F5F5F5')
      .padding(5)
      .margin({ top: 3 });
    }
    .width('100%')
    .height('100%')
    .padding(10);
  }

  private getNextPage(): string {
    let pages: string[] = ['pageOne', 'pageTwo', 'pageThree', 'pageFour', 'pageEight'];
    let idx = pages.indexOf(this.currentPage);
    return pages[(idx + 1) % pages.length];
  }

  private getExpectedAnimation(page: string): string {
    switch (page) {
      case 'pageOne': return '标题栏、内容区均有进场动画';
      case 'pageTwo': return '均无进场动画';
      case 'pageThree': return '标题栏有进场动画';
      case 'pageFour': return '内容区有进场动画';
      case 'pageEight': return '内容区有动画效果';
      default: return '';
    }
  }
}

