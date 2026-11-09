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
 * @tc.name: SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_MIRROR_0100
 * @tc.desc: Slider组件镜像（设置direction场景）
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct SliderMirror0100 {
  @Local testLog: string = '';
  @Local sliderValue: number = 5;
  @Local directionIndex: number = 0;
  private directions: Direction[] = [Direction.Ltr, Direction.Rtl, Direction.Auto];
  private directionNames: string[] = ['Ltr', 'Rtl', 'Auto'];

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'SliderMirror0100', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - direction场景');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_MIRROR_0100')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('Slider镜像-设置direction')
        .fontSize(12)
        .margin({ bottom: 10 })

      Button('切换Direction: ' + this.directionNames[this.directionIndex])
        .id('btn_direction')
        .onClick(() => {
          this.directionIndex = (this.directionIndex + 1) % 3;
          this.addLog('Direction: ' + this.directionNames[this.directionIndex]);
        })

      Slider({
        value: this.sliderValue,
        min: 0,
        max: 10,
        step: 1,
        style: SliderStyle.OutSet
      })
        .width('80%')
        .id('slider_direction')
        .direction(this.directions[this.directionIndex])
        .showTips(true)
        .showSteps(true)
        .margin({ top: 10 })
        .onChange((value: number) => {
          this.sliderValue = value;
        })

      Text('Ltr从左到右，Rtl从右到左，Auto跟随系统')
        .fontSize(11)
        .fontColor('#666666')
        .margin({ top: 20 })
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}

