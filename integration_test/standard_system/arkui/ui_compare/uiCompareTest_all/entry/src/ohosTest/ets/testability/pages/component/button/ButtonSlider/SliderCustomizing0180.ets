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
 * @tc.name: SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0180
 * @tc.desc: 调用2个contentModifier
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct SliderCustomizing0180 {
  @Local testLog: string = '';
  @Local sliderValue: number = 50;
  @Local lastModifierValue: number = 2;

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'SliderCustomizing0180', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded');
    this.addLog('Last contentModifier value: ' + this.lastModifierValue);
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0180')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('调用2个contentModifier')
        .fontSize(12)
        .margin({ bottom: 10 })

      Column() {
        Slider({
          value: this.sliderValue,
          min: 0,
          max: 100,
          step: 1,
          style: SliderStyle.OutSet
        })
          .width('80%')
          .id('slider_two_modifiers')
          .onChange((value: number) => {
            this.sliderValue = value;
            this.addLog('Slider value: ' + value);
          })

        Text('最后一次设置生效: ' + this.lastModifierValue)
          .fontSize(14)
          .fontColor(Color.Blue)
          .margin({ top: 10 })
          .id('last_modifier_value')
      }

      Text('当前值: ' + this.sliderValue.toFixed(0))
        .fontSize(14)
        .margin({ top: 15 })
        .id('slider_value')

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text('最后一次设置生效，自定义slider最后一行文本显示2')
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

