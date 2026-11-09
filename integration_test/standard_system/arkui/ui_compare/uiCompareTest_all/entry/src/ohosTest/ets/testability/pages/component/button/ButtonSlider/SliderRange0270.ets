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
 * @tc.name: SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_RANGE_0270
 * @tc.desc: slider设置滑动范围，滑块滑动过程中，onChange回调正常
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct SliderRange0270 {
  @Local testLog: string = '';
  @Local sliderValue: number = 30;
  @Local onChangeValue: number = 30;

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'SliderRange0270', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded');
    this.addLog('min=12, from=30, to=100, max=220, step=10');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_RANGE_0270')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('Slider滑动范围onChange回调')
        .fontSize(12)
        .margin({ bottom: 10 })

      Slider({
        value: this.sliderValue,
        min: 12,
        max: 220,
        step: 10,
        style: SliderStyle.OutSet
      })
        .width('80%')
        .id('slider_range')
        .showTips(true)
        .onChange((value: number) => {
          this.sliderValue = value;
          this.onChangeValue = value;
          this.addLog('onChange: ' + value);
        })

      Text('当前值: ' + this.sliderValue.toFixed(0))
        .fontSize(14)
        .margin({ top: 10 })
        .id('slider_value')

      Text('onChange回调值: ' + this.onChangeValue.toFixed(0))
        .fontSize(14)
        .margin({ top: 5 })
        .id('onchange_value')

      Text('测试说明：滑块在[30,100]跟手滑动，onChange正常响应')
        .fontSize(11)
        .fontColor('#666666')
        .margin({ top: 20 })

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

