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
 * @tc.name: SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SHUN_0220
 * @tc.desc: 横竖屏切换不会影响气泡避让
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct SliderShun0220 {
  @Local testLog: string = '';
  @Local sliderValue1: number = 100;
  @Local sliderValue2: number = 100;

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'SliderShun0220', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SHUN_0220')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('气泡避让-横竖屏切换')
        .fontSize(12)
        .margin({ bottom: 10 })

      Slider({
        value: this.sliderValue1,
        min: 0,
        max: 100,
        style: SliderStyle.OutSet
      })
        .width('80%')
        .id('slider_horizontal')
        .showTips(true)
        .onChange((value: number) => {
          this.sliderValue1 = value;
        })

      Row() {
        Slider({
          value: this.sliderValue2,
          min: 0,
          max: 100,
          style: SliderStyle.OutSet,
          direction: Axis.Vertical
        })
          .height(150)
          .id('slider_vertical')
          .showTips(true)
          .onChange((value: number) => {
            this.sliderValue2 = value;
          })
      }
      .margin({ top: 10 })

      Text('竖屏切换到横屏，气泡避让正常')
        .fontSize(11)
        .fontColor('#666666')
        .margin({ top: 20 })
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}

