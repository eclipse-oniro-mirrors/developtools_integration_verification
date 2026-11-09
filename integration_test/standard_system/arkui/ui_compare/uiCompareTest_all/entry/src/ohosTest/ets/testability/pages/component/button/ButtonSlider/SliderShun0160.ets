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
 * @tc.name: SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SHUN_0160
 * @tc.desc: 设置trackThickness很粗不会对气泡有影响
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct SliderShun0160 {
  @Local testLog: string = '';
  @Local sliderValue: number = 100;
  @Local trackThickness: number = 4;

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'SliderShun0160', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SHUN_0160')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('气泡避让-trackThickness很粗')
        .fontSize(12)
        .margin({ bottom: 10 })

      Button('trackThickness: ' + this.trackThickness)
        .id('btn_track_thickness')
        .onClick(() => {
          this.trackThickness = this.trackThickness === 4 ? 10 : 4;
          this.addLog('trackThickness: ' + this.trackThickness);
        })

      Slider({
        value: this.sliderValue,
        min: 0,
        max: 100,
        style: SliderStyle.OutSet
      })
        .width('80%')
        .id('slider_track_thickness')
        .showTips(true)
        .trackThickness(this.trackThickness)
        .margin({ top: 10 })
        .onChange((value: number) => {
          this.sliderValue = value;
        })

      Text('trackThickness很粗不会对气泡有影响')
        .fontSize(11)
        .fontColor('#666666')
        .margin({ top: 20 })
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}

