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
 * @tc.name: SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_MIRROR_0070
 * @tc.desc: Slider组件镜像（锁屏再开启场景）
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct SliderMirror0070 {
  @Local testLog: string = '';
  @Local sliderValue1: number = 5;
  @Local sliderValue2: number = 5;

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'SliderMirror0070', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - 锁屏再开启场景');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_MIRROR_0070')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('Slider镜像-锁屏再开启')
        .fontSize(12)
        .margin({ bottom: 10 })

      Slider({
        value: this.sliderValue1,
        min: 0,
        max: 10,
        step: 1,
        style: SliderStyle.OutSet
      })
        .width('80%')
        .id('slider_outset')
        .showTips(true)
        .showSteps(true)
        .onChange((value: number) => {
          this.sliderValue1 = value;
        })

      Slider({
        value: this.sliderValue2,
        min: 0,
        max: 10,
        step: 1,
        style: SliderStyle.InSet
      })
        .width('80%')
        .id('slider_inset')
        .margin({ top: 10 })
        .showTips(true)
        .showSteps(true)
        .onChange((value: number) => {
          this.sliderValue2 = value;
        })

      Text('测试说明：锁屏再开启，Slider镜像正常')
        .fontSize(11)
        .fontColor('#666666')
        .margin({ top: 20 })
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}

