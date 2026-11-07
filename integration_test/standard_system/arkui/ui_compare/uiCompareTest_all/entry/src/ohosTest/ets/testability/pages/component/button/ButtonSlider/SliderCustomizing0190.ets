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
 * @tc.name: SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0190
 * @tc.desc: contentModifier动态切换
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct SliderCustomizing0190 {
  @Local testLog: string = '';
  @Local sliderValue: number = 50;
  @Local modifierIndex: number = 0;

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'SliderCustomizing0190', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_CUSTOMIZING_0190')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('contentModifier动态切换')
        .fontSize(12)
        .margin({ bottom: 10 })

      Slider({
        value: this.sliderValue,
        min: 0,
        max: 100,
        step: 1,
        style: SliderStyle.OutSet
      })
        .width('80%')
        .id('slider_dynamic_modifier')
        .onChange((value: number) => {
          this.sliderValue = value;
          this.addLog('Slider value: ' + value);
        })

      Text('当前modifier: ' + this.modifierIndex)
        .fontSize(14)
        .margin({ top: 15 })
        .id('current_modifier')

      Row() {
        Button('contentModifier+0')
          .fontSize(10)
          .id('btn_modifier_0')
          .onClick(() => {
            this.modifierIndex = 0;
            this.addLog('Switch to modifier 0');
          })
        Button('contentModifier+1')
          .fontSize(10)
          .id('btn_modifier_1')
          .onClick(() => {
            this.modifierIndex = 1;
            this.addLog('Switch to modifier 1');
          })
        Button('contentModifier+2')
          .fontSize(10)
          .id('btn_modifier_2')
          .onClick(() => {
            this.modifierIndex = 2;
            this.addLog('Switch to modifier 2');
          })
      }
      .margin({ top: 10 })

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text('点击按钮切换contentModifier\nSlide均显示原来的滑轨样式')
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

