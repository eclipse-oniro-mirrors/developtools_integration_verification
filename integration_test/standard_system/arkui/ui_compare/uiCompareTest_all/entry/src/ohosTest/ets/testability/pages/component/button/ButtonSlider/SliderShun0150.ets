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
 * @tc.name: SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SHUN_0150
 * @tc.desc: 设置blockSize很大不会对气泡有影响
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct SliderShun0150 {
  @Local testLog: string = '';
  @Local sliderValue: number = 100;
  @Local blockSizeIndex: number = 0;
  private blockSizes: SizeOptions[] = [{ width: 10, height: 10 }, { width: 100, height: 100 }];

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'SliderShun0150', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SHUN_0150')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('气泡避让-blockSize很大')
        .fontSize(12)
        .margin({ bottom: 10 })

      Button('blockSize: ' + (this.blockSizeIndex === 0 ? '(10,10)' : '(100,100)'))
        .id('btn_block_size')
        .onClick(() => {
          this.blockSizeIndex = (this.blockSizeIndex + 1) % 2;
          this.addLog('blockSize changed');
        })

      Slider({
        value: this.sliderValue,
        min: 0,
        max: 100,
        style: SliderStyle.OutSet
      })
        .width('80%')
        .id('slider_block_size')
        .showTips(true)
        .blockSize(this.blockSizes[this.blockSizeIndex])
        .margin({ top: 10 })
        .onChange((value: number) => {
          this.sliderValue = value;
        })

      Text('blockSize很大不会影响气泡显示')
        .fontSize(11)
        .fontColor('#666666')
        .margin({ top: 20 })
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}

