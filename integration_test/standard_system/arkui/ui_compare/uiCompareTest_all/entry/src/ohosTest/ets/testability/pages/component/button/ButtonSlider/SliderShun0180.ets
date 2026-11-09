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
 * @tc.name: SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SHUN_0180
 * @tc.desc: 不同滚动条样式不会对气泡有影响
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct SliderShun0180 {
  @Local testLog: string = '';
  @Local sliderValue: number = 100;
  @Local styleIndex: number = 0;
  private styles: SliderStyle[] = [SliderStyle.OutSet, SliderStyle.InSet];
  private styleNames: string[] = ['OutSet', 'InSet'];

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'SliderShun0180', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SHUN_0180')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('气泡避让-不同滚动条样式')
        .fontSize(12)
        .margin({ bottom: 10 })

      Button('滚动条样式: ' + this.styleNames[this.styleIndex])
        .id('btn_style')
        .onClick(() => {
          this.styleIndex = (this.styleIndex + 1) % 2;
          this.addLog('Style: ' + this.styleNames[this.styleIndex]);
        })

      Slider({
        value: this.sliderValue,
        min: 0,
        max: 100,
        style: this.styles[this.styleIndex]
      })
        .width('80%')
        .id('slider_style')
        .showTips(true)
        .margin({ top: 10 })
        .onChange((value: number) => {
          this.sliderValue = value;
        })

      Text('设置样式为InSet不会对气泡有影响')
        .fontSize(11)
        .fontColor('#666666')
        .margin({ top: 20 })
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}

