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
 * @tc.name: SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_UX_0100
 * @tc.desc: Slider组件鼠标滚轮滚动气泡滑块滑动条
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct SliderUx0100 {
  @Local testLog: string = '';
  @Local sliderValue: number = 50;
  @Local scrollDirection: string = '';

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'SliderUx0100', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - 鼠标滚轮滚动测试');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_UX_0100')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('鼠标滚轮滚动-气泡滑块')
        .fontSize(12)
        .margin({ bottom: 10 })

      Text('当前值: ' + this.sliderValue.toFixed(0))
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 5 })
        .id('value_display')

      Text('滚动方向: ' + (this.scrollDirection || '未检测'))
        .fontSize(12)
        .margin({ bottom: 10 })
        .id('scroll_direction')

      Slider({
        value: this.sliderValue,
        min: 0,
        max: 100,
        step: 1,
        style: SliderStyle.OutSet,
        direction: Axis.Horizontal
      })
        .width('80%')
        .id('slider_wheel')
        .showTips(true)
        .focusable(true)
        .onChange((value: number, mode: SliderChangeMode) => {
          let oldValue = this.sliderValue;
          this.sliderValue = value;
          if (value > oldValue) {
            this.scrollDirection = '向右/向上';
          } else if (value < oldValue) {
            this.scrollDirection = '向左/向下';
          }
          this.addLog('值变化: ' + oldValue.toFixed(0) + ' -> ' + value.toFixed(0));
        })

      Button('重置测试')
        .id('btn_reset')
        .margin({ top: 10 })
        .onClick(() => {
          this.sliderValue = 50;
          this.scrollDirection = '';
          this.testLog = '';
          this.addLog('测试已重置');
        })

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10 })

      Text('1. 鼠标悬停在slider上\n2. 使用鼠标滚轮上下滚动\n3. 期望: 滑块往一个方向移动')
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

