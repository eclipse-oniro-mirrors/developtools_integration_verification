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
 * @tc.name: SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SHUN_0170
 * @tc.desc: 靠近顶部边缘横向两个slider组件，距离较近，组件/气泡均不会避让
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct SliderShun0170 {
  @Local testLog: string = '';
  @Local sliderValue1: number = 100;
  @Local sliderValue2: number = 100;
  @Local spacing: number = 10;

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'SliderShun0170', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SHUN_0170')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('两个Slider气泡避让')
        .fontSize(12)
        .margin({ bottom: 10 })

      Button('两个Slider间距: ' + this.spacing + 'vp')
        .id('btn_spacing')
        .onClick(() => {
          this.spacing = this.spacing === 10 ? 30 : 10;
          this.addLog('spacing: ' + this.spacing);
        })

      Slider({
        value: this.sliderValue1,
        min: 0,
        max: 100,
        style: SliderStyle.OutSet
      })
        .width('80%')
        .id('slider_top')
        .showTips(true)
        .margin({ top: 10 })
        .onChange((value: number) => {
          this.sliderValue1 = value;
        })

      Slider({
        value: this.sliderValue2,
        min: 0,
        max: 100,
        style: SliderStyle.OutSet
      })
        .width('80%')
        .id('slider_bottom')
        .showTips(true)
        .margin({ top: this.spacing })
        .onChange((value: number) => {
          this.sliderValue2 = value;
        })

      Text('第一个气泡在下方，第二个在上方')
        .fontSize(11)
        .fontColor('#666666')
        .margin({ top: 20 })
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}

