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
 * @tc.name: SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SHUN_0230
 * @tc.desc: position不会影响气泡显示，动态改变位置会根据位置确定是否避让
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct SliderShun0230 {
  @Local testLog: string = '';
  @Local sliderValue: number = 100;
  @Local positionX: number = 100;
  @Local positionY: number = 100;

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'SliderShun0230', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SHUN_0230')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('气泡避让-position动态改变')
        .fontSize(12)
        .margin({ bottom: 10 })

      Button('position: (' + this.positionX + ',' + this.positionY + ')')
        .id('btn_position')
        .onClick(() => {
          if (this.positionX === 100) {
            this.positionX = 0;
            this.positionY = 0;
          } else {
            this.positionX = 100;
            this.positionY = 100;
          }
          this.addLog('position: (' + this.positionX + ',' + this.positionY + ')');
        })

      Stack() {
        Slider({
          value: this.sliderValue,
          min: 0,
          max: 100,
          style: SliderStyle.OutSet
        })
          .width('60%')
          .id('slider_position')
          .showTips(true)
          .position({ x: this.positionX, y: this.positionY })
          .onChange((value: number) => {
            this.sliderValue = value;
          })
      }
      .width('100%')
      .height('16.39%')
      .backgroundColor('#F0F0F0')
      .margin({ top: 10 })

      Text('气泡显示完整，根据位置确定是否避让')
        .fontSize(11)
        .fontColor('#666666')
        .margin({ top: 20 })
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}

