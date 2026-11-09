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
 * @tc.name: SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0080
 * @tc.desc: 设置slider组件，自定义buildslider中设置triggerChange
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct SliderCustomizing0080 {
  @Local testLog: string = '';
  @Local sliderValue: number = 10;
  @Local sliderMode: number = 0;
  @Local displayText: string = '10,0';

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'SliderCustomizing0080', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded');
  }

  triggerChange(value: number, mode: number): void {
    this.sliderValue = value;
    this.sliderMode = mode;
    this.displayText = value + ',' + mode;
    this.addLog('triggerChange: value=' + value + ', mode=' + mode);
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0080')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('自定义slider triggerChange测试')
        .fontSize(12)
        .margin({ bottom: 10 })

      Slider({
        value: this.sliderValue,
        min: 0,
        max: 100,
        step: 10,
        style: SliderStyle.OutSet
      })
        .width('80%')
        .id('slider_trigger')
        .onChange((value: number, mode: SliderChangeMode) => {
          this.sliderValue = value;
          this.sliderMode = mode;
          this.displayText = value.toFixed(0) + ',' + mode;
          this.addLog('onChange: value=' + value + ', mode=' + mode);
        })

      Text('value,mode: ' + this.displayText)
        .fontSize(14)
        .margin({ top: 15 })
        .id('display_text')

      Row() {
        Button('triggerChange(20,0)')
          .fontSize(10)
          .id('btn_20_0')
          .onClick(() => this.triggerChange(20, 0))
        Button('triggerChange(30,1)')
          .fontSize(10)
          .id('btn_30_1')
          .onClick(() => this.triggerChange(30, 1))
      }
      .margin({ top: 10 })

      Row() {
        Button('triggerChange(40,2)')
          .fontSize(10)
          .id('btn_40_2')
          .onClick(() => this.triggerChange(40, 2))
        Button('triggerChange(50,3)')
          .fontSize(10)
          .id('btn_50_3')
          .onClick(() => this.triggerChange(50, 3))
      }
      .margin({ top: 10 })

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text('点击按钮，value和mode依次显示:\n20,0; 30,1; 40,2; 50,3')
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
      .height('6.56%')
      .width('100%')
      .backgroundColor('#F5F5F5')
      .padding(5)
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}

