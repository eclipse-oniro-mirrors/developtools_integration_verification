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
 * @tc.name: SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0140
 * @tc.desc: 键盘左右切换时，焦点转移规格一致
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct RatingHoverkeyboard0140 {
  @Local testLog: string = '';
  @Local ratingValue: number = 3;

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'RatingHoverkeyboard0140', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_BUTTON_RATING_HOVERKEYBOARD_0140')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('键盘左右切换时，焦点转移规格一致')
        .fontSize(12)
        .margin({ bottom: 10 })

      Rating({ rating: this.ratingValue, indicator: false })
        .stars(5)
        .stepSize(1)
        .id('rating_arrow_keys')
        .focusable(true)
        .onFocus(() => {
          this.addLog('Rating focused');
        })
        .onKeyEvent((event: KeyEvent) => {
          this.addLog('Key: ' + event.keyCode + ', type: ' + event.type);
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

      Text('1. 连接键盘\n2. 对比左右键走焦逻辑\n3. 焦点转移规格应一致')
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

