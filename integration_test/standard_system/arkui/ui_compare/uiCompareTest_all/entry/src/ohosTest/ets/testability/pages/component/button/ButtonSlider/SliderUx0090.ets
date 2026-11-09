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
 * @tc.name: SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_UX_0090
 * @tc.desc: Slider组件键盘鼠标交互间续滑块滑动条
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct SliderUx0090 {
  @Local testLog: string = '';
  @Local sliderValue: number = 50;
  @Local stepCount: number = 0;

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'SliderUx0090', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - 键盘鼠标交互测试');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_UX_0090')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('键盘鼠标交互-间续滑块')
        .fontSize(12)
        .margin({ bottom: 10 })

      Text('当前值: ' + this.sliderValue.toFixed(0))
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 })
        .id('value_display')

      Text('步进次数: ' + this.stepCount)
        .fontSize(12)
        .margin({ bottom: 10 })
        .id('step_count')

      Slider({
        value: this.sliderValue,
        min: 0,
        max: 100,
        step: 10,
        style: SliderStyle.OutSet,
        direction: Axis.Horizontal
      })
        .width('80%')
        .id('slider_keyboard_mouse')
        .showTips(true)
        .showSteps(true)
        .focusable(true)
        .onChange((value: number, mode: SliderChangeMode) => {
          let oldValue = this.sliderValue;
          this.sliderValue = value;
          if (Math.abs(value - oldValue) === 10) {
            this.stepCount++;
            this.addLog('步进: ' + oldValue + ' -> ' + value);
          } else {
            this.addLog('值变化: ' + value.toFixed(0));
          }
        })

      Button('重置测试')
        .id('btn_reset')
        .margin({ top: 10 })
        .onClick(() => {
          this.sliderValue = 50;
          this.stepCount = 0;
          this.testLog = '';
          this.addLog('测试已重置');
        })

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10 })

      Text('1. 使用键盘鼠标交互移动间续滑块\n2. 期望: 滑块每次增减一个刻度(10)')
        .fontSize(11)
        .fontColor('#666666')

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
      .margin({ top: 10 })
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}

