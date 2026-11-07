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
 * @tc.name: SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SLIDERINTERACTION_0130
 * @tc.desc: 设置 from、to滑动范围[20,80]，范围内滑动界面，不会触发误触
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct SliderInteraction0130 {
  @Local testLog: string = '';
  @Local sliderValue: number = 50;
  @Local onChangeTriggered: boolean = false;
  @Local initialValue: number = 50;

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'SliderInteraction0130', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - 范围限制测试');
    this.addLog('范围: [20, 80]');
    this.addLog('初始值: ' + this.initialValue);
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SLIDERINTERACTION_0130')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('范围[20,80]-上下滑动不触发误触')
        .fontSize(12)
        .margin({ bottom: 10 })

      Text('当前值: ' + this.sliderValue.toFixed(0))
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Slider({
        value: this.sliderValue,
        min: 20,
        max: 80,
        step: 1,
        style: SliderStyle.OutSet,
        direction: Axis.Horizontal
      })
        .width('80%')
        .id('slider_range')
        .showTips(true)
        .trackThickness(6)
        .onChange((value: number, mode: SliderChangeMode) => {
          if (mode === SliderChangeMode.Moving) {
            this.onChangeTriggered = true;
            this.sliderValue = value;
            this.addLog('onChange触发 value: ' + value.toFixed(0));
          } else if (mode === SliderChangeMode.Begin) {
            this.addLog('Begin事件触发');
          } else if (mode === SliderChangeMode.End) {
            this.addLog('End事件触发');
          }
        })

      Row() {
        Text('滑动触发: ')
        Text(this.onChangeTriggered ? '是' : '否')
          .fontColor(this.onChangeTriggered ? Color.Red : Color.Green)
          .id('onchange_status')
      }.margin({ top: 10 })

      Button('重置测试')
        .id('btn_reset')
        .margin({ top: 10 })
        .onClick(() => {
          this.sliderValue = this.initialValue;
          this.onChangeTriggered = false;
          this.testLog = '';
          this.addLog('测试已重置');
        })

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10 })

      Text('1. 设置Slider范围为[20, 80]\n2. 手指按压在slider范围内\n3. 上下滑动界面\n4. 期望: 不会触发误触')
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

