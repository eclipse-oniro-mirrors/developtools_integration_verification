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
 * 用例ID: SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_INTERFACE_0260
 * 用例描述: label的heightAdaptivePolicy属性设置为MIN_FONT_SIZE_FIRST
 * 测试条件: 创建button，设置type为ButtonType.Normal
 * 测试步骤: heightAdaptivePolicy设置为MIN_FONT_SIZE_FIRST
 * 预期结果: 文本高度自适应方式为以缩小字体优先
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
struct ButtonInterface0260 {
  @State testLog: string[] = [];

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 20) {
      this.testLog = this.testLog.slice(0, 20);
    }
    hilog.info(0x0000, 'ButtonInterface0260', log);
  }

  build() {
    Column({ space: 10 }) {
      Text('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_INTERFACE_0260')
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('heightAdaptivePolicy属性测试')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)

      Divider().height(1).color('#EEEEEE')

      Column({ space: 4 }) {
        Text('测试说明:').fontSize(12).fontWeight(FontWeight.Bold)
        Text('heightAdaptivePolicy=MIN_FONT_SIZE_FIRST\n文本高度自适应方式为以缩小字体优先')
          .fontSize(11)
          .fontColor(Color.Gray)
      }
      .width('95%')
      .padding(8)
      .backgroundColor('#E3F2FD')
      .borderRadius(4)

      Text('Button with heightAdaptivePolicy:')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      // 较短的按钮文本
      Button('短文本', { type: ButtonType.Normal })
        .width(100)
        .height(40)
        .labelStyle({
          heightAdaptivePolicy: TextHeightAdaptivePolicy.MIN_FONT_SIZE_FIRST
        })
        .id('ButtonInterface0260_Short')
        .onClick(() => {
          this.addLog('点击了短文本按钮');
        })

      // 较长的按钮文本 - 会自动缩小字体
      Button('这是一个很长的按钮文本内容', { type: ButtonType.Normal })
        .width(150)
        .height(40)
        .labelStyle({
          heightAdaptivePolicy: TextHeightAdaptivePolicy.MIN_FONT_SIZE_FIRST
        })
        .id('ButtonInterface0260_Long')
        .onClick(() => {
          this.addLog('点击了长文本按钮');
        })

      // 对比：不使用heightAdaptivePolicy
      Text('对比：未设置heightAdaptivePolicy')
        .fontSize(11)
        .fontColor(Color.Gray)

      Button('这是一个很长的按钮文本内容', { type: ButtonType.Normal })
        .width(150)
        .height(40)
        .id('ButtonInterface0260_NoPolicy')
        .onClick(() => {
          this.addLog('点击了未设置策略的按钮');
        })

      Divider().height(1).color('#EEEEEE')

      Column({ space: 4 }) {
        Text('预期结果:').fontSize(11).fontWeight(FontWeight.Bold)
        Text('设置了MIN_FONT_SIZE_FIRST的按钮，长文本会自动缩小字体以适应高度')
          .fontSize(10)
          .fontColor('#4CAF50')
      }
      .width('95%')
      .padding(8)
      .backgroundColor('#E8F5E9')
      .borderRadius(4)

      Scroll() {
        Column() {
          ForEach(this.testLog, (log: string, index: number) => {
            Text(log)
              .fontSize(9)
              .fontColor('#333333')
              .width('100%')
              .padding(2)
              .backgroundColor(index % 2 === 0 ? '#F5F5F5' : Color.White)
          })
        }
        .width('100%')
      }
      .height('4.92%')
      .width('95%')
      .backgroundColor('#FAFAFA')
      .borderRadius(4)
    }
    .width('100%')
    .height('100%')
    .padding(10)
    .backgroundColor('#F5F5F5')
  }
}

