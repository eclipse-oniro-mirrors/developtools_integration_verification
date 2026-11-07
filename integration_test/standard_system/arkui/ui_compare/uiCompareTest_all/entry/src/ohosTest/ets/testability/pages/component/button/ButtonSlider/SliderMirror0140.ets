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
 * @tc.name: SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_MIRROR_0140
 * @tc.desc: Slider组件镜像（设置reverse）
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct SliderMirror0140 {
  @Local testLog: string = '';
  @Local sliderValue: number = 5;
  @Local isReverse: boolean = false;

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'SliderMirror0140', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - reverse场景');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_MIRROR_0140')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('Slider镜像-设置reverse')
        .fontSize(12)
        .margin({ bottom: 10 })

      Button('切换reverse: ' + this.isReverse)
        .id('btn_reverse')
        .onClick(() => {
          this.isReverse = !this.isReverse;
          this.addLog('reverse: ' + this.isReverse);
        })

      Slider({
        value: this.sliderValue,
        min: 0,
        max: 10,
        step: 1,
        style: SliderStyle.OutSet,
        reverse: this.isReverse
      })
        .width('80%')
        .id('slider_reverse')
        .showTips(true)
        .showSteps(true)
        .margin({ top: 10 })
        .onChange((value: number) => {
          this.sliderValue = value;
        })

      Text('reverse=true从左向右，false从右向左')
        .fontSize(11)
        .fontColor('#666666')
        .margin({ top: 20 })
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}

