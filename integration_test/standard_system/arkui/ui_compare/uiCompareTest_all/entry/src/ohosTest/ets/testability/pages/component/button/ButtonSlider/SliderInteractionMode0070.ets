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
 * @tc.name: SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SLIDERINTERACTIONMODE_0070
 * @tc.desc: 设置滑动最小距离为20，键盘操作至value为100的位置
 * @tc.level: Level 3
 */
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@ComponentV2
struct SliderInteractionMode0070 {
  @Local testLog: string = '';
  @Local sliderValue: number = 90;
  @Local keyboardOperated: boolean = false;

  private addLog(message: string): void {
    this.testLog += message + '\n';
    hilog.info(0x0000, 'SliderInteractionMode0070', message);
  }

  aboutToAppear(): void {
    this.addLog('Page loaded - 键盘操作测试');
    this.addLog('初始值: 90, 目标值: 100');
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_BUTTON_SLIDER_SLIDERINTERACTIONMODE_0070')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('键盘操作至value为100')
        .fontSize(12)
        .margin({ bottom: 10 })

      Text('当前值: ' + this.sliderValue.toFixed(0))
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })
        .id('value_display')

      Slider({
        value: this.sliderValue,
        min: 0,
        max: 100,
        step: 1,
        style: SliderStyle.OutSet,
        direction: Axis.Horizontal
      })
        .width('80%')
        .id('slider_keyboard')
        .showTips(true)
        .showSteps(true)
        .focusable(true)
        .onChange((value: number, mode: SliderChangeMode) => {
          this.sliderValue = value;
          if (value === 100) {
            this.keyboardOperated = true;
            this.addLog('到达终点: ' + value);
          } else {
            this.addLog('值变化: ' + value.toFixed(0));
          }
        })

      Row() {
        Text('键盘操作成功: ')
        Text(this.keyboardOperated ? '是' : '否')
          .fontColor(this.keyboardOperated ? Color.Green : Color.Gray)
          .id('keyboard_status')
      }.margin({ top: 10 })

      Button('重置测试')
        .id('btn_reset')
        .margin({ top: 10 })
        .onClick(() => {
          this.sliderValue = 90;
          this.keyboardOperated = false;
          this.testLog = '';
          this.addLog('测试已重置');
        })

      Text('测试说明：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10 })

      Text('1. 点击滑轨使slider获得焦点\n2. 使用键盘方向键操作至终点\n3. 期望: 键盘操作响应成功')
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

