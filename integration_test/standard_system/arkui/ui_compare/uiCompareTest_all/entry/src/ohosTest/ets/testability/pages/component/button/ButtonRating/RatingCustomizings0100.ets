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
 * @tc.name: SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0100
 * @tc.desc: 自定义buildRating，手势点击进行评分
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct RatingCustomizings0100 {
  @Local testLog: string = '';
  @Local ratingValue: number = 2;

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'RatingCustomizings0100', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_BUTTON_RATING_CUSTOMIZINGS_0100')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('自定义Rating，点击进行评分')
        .fontSize(12)
        .margin({ bottom: 10 })

      // 自定义评分组件
      Row() {
        ForEach([1, 2, 3, 4, 5], (item: number) => {
          Text(item <= this.ratingValue ? '★' : '☆')
            .fontSize(30)
            .fontColor(item <= this.ratingValue ? Color.Yellow : Color.Gray)
            .onClick(() => {
              this.ratingValue = item;
              this.addLog('Rating changed: ' + item);
            })
        })
      }
      .id('rating_custom')
      .justifyContent(FlexAlign.Center)
      .width('100%')
      .padding(20)

      Text('当前评分: ' + this.ratingValue)
        .fontSize(14)
        .margin({ top: 15 })
        .id('rating_value')

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text('1. 点击星星进行评分\n2. 观察评分值变化\n3. 自定义样式正常显示')
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
