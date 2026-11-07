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
 * @tc.name: SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0030
 * @tc.desc: Rating组件作为评分器，Rating的indicator值为false，鼠标hover在Rating上，移开后为点击选中分数
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct RatingHoverkeyboard0030 {
  @Local testLog: string = '';
  @Local ratingValue: number = 2;

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'RatingHoverkeyboard0030', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0030')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('Rating作为评分器，点击后刷新打分')
        .fontSize(12)
        .margin({ bottom: 10 })

      Rating({ rating: this.ratingValue, indicator: false })
        .stars(5)
        .stepSize(1)
        .id('rating_click_select')
        .onHover((isHover: boolean) => {
          this.addLog('Hover: ' + isHover);
        })
        .onChange((value: number) => {
          this.ratingValue = value;
          this.addLog('Rating changed: ' + value);
        })

      Text('当前评分: ' + this.ratingValue)
        .fontSize(14)
        .margin({ top: 15 })
        .id('rating_value')

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text('1. 鼠标悬浮在Rating组件上移动\n2. 展示预览效果\n3. 点击后刷新打分，移开后为点击选中分数')
        .fontSize(11)
        .fontColor('#666666')

      Text('日志:')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10 })

      Scroll() {
        Text(this.testLog)
          .fontSize(10)
          .fontColor('#333333')
          .id('log_text')
      }
      .height('8.2%')
      .width('100%')
      .backgroundColor('#F5F5F5')
      .padding(5)
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}

