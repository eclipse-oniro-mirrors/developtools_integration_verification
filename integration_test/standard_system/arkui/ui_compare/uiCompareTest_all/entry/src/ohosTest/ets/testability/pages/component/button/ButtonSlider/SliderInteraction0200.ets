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
 * @tc.name: SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SLIDERINTERACTION_0200
 * @tc.desc: 验证多个slider排列密集，间隔较近的场景，手指按压在slider进度条上上下滑动界面，slider进度条不发生变化
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct SliderInteraction0200 {
  @Local testLog: string = '';
  @Local sliderValue1: number = 30;
  @Local sliderValue2: number = 50;
  @Local sliderValue3: number = 70;
  @Local onChangeTriggered: boolean = false;
  @Local activeSlider: string = '';

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'SliderInteraction0200', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - 多slider密集排列测试');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SLIDERINTERACTION_0200')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('多slider密集排列-上下滑动不触发')
        .fontSize(12)
        .margin({ bottom: 10 })

      // Slider 1
      Row() {
        Text('S1: ')
          .width(30)
        Slider({
          value: this.sliderValue1,
          min: 0,
          max: 100,
          step: 1,
          style: SliderStyle.OutSet,
          direction: Axis.Horizontal
        })
          .layoutWeight(1)
          .id('slider_1')
          .showTips(true)
          .trackThickness(6)
          .onChange((value: number, mode: SliderChangeMode) => {
            if (mode === SliderChangeMode.Moving) {
              this.onChangeTriggered = true;
              this.activeSlider = 'Slider1';
              this.sliderValue1 = value;
              this.addLog('Slider1 onChange: ' + value.toFixed(0));
            } else if (mode === SliderChangeMode.Begin) {
              this.addLog('Slider1 Begin');
            }
          })
        Text(this.sliderValue1.toFixed(0))
          .width(30)
      }
      .width('100%')
      .margin({ bottom: 5 })

      // Slider 2
      Row() {
        Text('S2: ')
          .width(30)
        Slider({
          value: this.sliderValue2,
          min: 0,
          max: 100,
          step: 1,
          style: SliderStyle.OutSet,
          direction: Axis.Horizontal
        })
          .layoutWeight(1)
          .id('slider_2')
          .showTips(true)
          .trackThickness(6)
          .onChange((value: number, mode: SliderChangeMode) => {
            if (mode === SliderChangeMode.Moving) {
              this.onChangeTriggered = true;
              this.activeSlider = 'Slider2';
              this.sliderValue2 = value;
              this.addLog('Slider2 onChange: ' + value.toFixed(0));
            } else if (mode === SliderChangeMode.Begin) {
              this.addLog('Slider2 Begin');
            }
          })
        Text(this.sliderValue2.toFixed(0))
          .width(30)
      }
      .width('100%')
      .margin({ bottom: 5 })

      // Slider 3
      Row() {
        Text('S3: ')
          .width(30)
        Slider({
          value: this.sliderValue3,
          min: 0,
          max: 100,
          step: 1,
          style: SliderStyle.OutSet,
          direction: Axis.Horizontal
        })
          .layoutWeight(1)
          .id('slider_3')
          .showTips(true)
          .trackThickness(6)
          .onChange((value: number, mode: SliderChangeMode) => {
            if (mode === SliderChangeMode.Moving) {
              this.onChangeTriggered = true;
              this.activeSlider = 'Slider3';
              this.sliderValue3 = value;
              this.addLog('Slider3 onChange: ' + value.toFixed(0));
            } else if (mode === SliderChangeMode.Begin) {
              this.addLog('Slider3 Begin');
            }
          })
        Text(this.sliderValue3.toFixed(0))
          .width(30)
      }
      .width('100%')

      Row() {
        Text('滑动触发: ')
        Text(this.onChangeTriggered ? '是' : '否')
          .fontColor(this.onChangeTriggered ? Color.Red : Color.Green)
          .id('onchange_status')
        if (this.activeSlider) {
          Text(' (' + this.activeSlider + ')')
        }
      }.margin({ top: 10 })

      Button('重置测试')
        .id('btn_reset')
        .margin({ top: 10 })
        .onClick(() => {
          this.sliderValue1 = 30;
          this.sliderValue2 = 50;
          this.sliderValue3 = 70;
          this.onChangeTriggered = false;
          this.activeSlider = '';
          this.testLog = '';
          this.addLog('测试已重置');
        })

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10 })

      Text('1. 多个slider间隔较近\n2. 手指按压在任一slider上\n3. 上下滑动界面\n4. 期望: 不会触发其他slider')
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

