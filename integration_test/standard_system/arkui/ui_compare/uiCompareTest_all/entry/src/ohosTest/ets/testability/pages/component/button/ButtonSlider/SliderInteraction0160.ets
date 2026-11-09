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
 * @tc.name: SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SLIDERINTERACTION_0160
 * @tc.desc: 设置Slider倾斜45°显示，手指按压在slider上抬手后，slider进度条发生变化，触发送click事件及end事件，触发onChange
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct SliderInteraction0160 {
  @Local testLog: string = '';
  @Local sliderValue: number = 50;
  @Local clickTriggered: boolean = false;
  @Local endTriggered: boolean = false;
  @Local onChangeTriggered: boolean = false;
  @Local initialValue: number = 50;

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'SliderInteraction0160', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - 倾斜45°点击抬手测试');
    this.addLog('初始值: ' + this.initialValue);
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SLIDERINTERACTION_0160')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('倾斜45°Slider-按压抬手触发click和end')
        .fontSize(12)
        .margin({ bottom: 10 })

      Text('当前值: ' + this.sliderValue.toFixed(0))
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Column() {
        Slider({
          value: this.sliderValue,
          min: 0,
          max: 100,
          step: 1,
          style: SliderStyle.OutSet,
          direction: Axis.Horizontal
        })
          .width('80%')
          .id('slider_rotated')
          .showTips(true)
          .trackThickness(6)
          .rotate({ angle: 45 })
          .onChange((value: number, mode: SliderChangeMode) => {
            if (mode === SliderChangeMode.Click) {
              this.clickTriggered = true;
              this.sliderValue = value;
              this.addLog('Click事件触发 value: ' + value.toFixed(0));
            } else if (mode === SliderChangeMode.End) {
              this.endTriggered = true;
              this.addLog('End事件触发 value: ' + value.toFixed(0));
            } else if (mode === SliderChangeMode.Moving) {
              this.onChangeTriggered = true;
              this.sliderValue = value;
              this.addLog('onChange触发 value: ' + value.toFixed(0));
            } else if (mode === SliderChangeMode.Begin) {
              this.addLog('Begin事件触发');
            }
          })
      }
      .width('100%')
      .height('9.84%')
      .justifyContent(FlexAlign.Center)

      Column() {
        Row() {
          Text('Click触发: ')
          Text(this.clickTriggered ? '是' : '否')
            .fontColor(this.clickTriggered ? Color.Green : Color.Gray)
            .id('click_status')
        }

        Row() {
          Text('End触发: ')
          Text(this.endTriggered ? '是' : '否')
            .fontColor(this.endTriggered ? Color.Green : Color.Gray)
            .id('end_status')
        }.margin({ top: 5 })
      }.margin({ top: 10 })

      Button('重置测试')
        .id('btn_reset')
        .margin({ top: 10 })
        .onClick(() => {
          this.sliderValue = this.initialValue;
          this.clickTriggered = false;
          this.endTriggered = false;
          this.onChangeTriggered = false;
          this.testLog = '';
          this.addLog('测试已重置');
        })

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10 })

      Text('1. Slider倾斜45°显示\n2. 手指按压在slider上后抬手\n3. 期望: 触发click、end事件')
        .fontSize(11)
        .fontColor('#666666')

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
      .margin({ top: 10 })
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}

