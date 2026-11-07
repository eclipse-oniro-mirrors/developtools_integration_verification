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
 * 用例ID: SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_INTERFACE_0340
 * 用例描述: label的minFontSize属性设置大于0
 * 测试条件: 创建button，设置type为ButtonType.Normal
 * 测试步骤: minFontSize设置为10，maxFontSize设置为12
 * 预期结果: minFontSize设置生效
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
struct ButtonInterface0340 {
  @State testLog: string[] = [];

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 20) {
      this.testLog = this.testLog.slice(0, 20);
    }
    hilog.info(0x0000, 'ButtonInterface0340', log);
  }

  build() {
    Column({ space: 10 }) {
      Text('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_INTERFACE_0340')
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('minFontSize属性测试')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)

      Divider().height(1).color('#EEEEEE')

      Column({ space: 4 }) {
        Text('测试说明:').fontSize(12).fontWeight(FontWeight.Bold)
        Text('minFontSize=10, maxFontSize=12\n验证字体缩放范围限制')
          .fontSize(11)
          .fontColor(Color.Gray)
      }
      .width('95%')
      .padding(8)
      .backgroundColor('#E3F2FD')
      .borderRadius(4)

      Text('Button with minFontSize/maxFontSize:')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      // 设置minFontSize和maxFontSize
      Button('测试按钮文本', { type: ButtonType.Normal })
        .width(150)
        .height(50)
        .labelStyle({
          minFontSize: 10,
          maxFontSize: 12
        })
        .id('ButtonInterface0340_MinMax')
        .onClick(() => {
          this.addLog('点击了MinMax按钮');
        })

      // 长文本验证缩放
      Button('这是一段较长的按钮文本用于测试字体缩放', { type: ButtonType.Normal })
        .width(200)
        .height(50)
        .labelStyle({
          minFontSize: 10,
          maxFontSize: 12,
          heightAdaptivePolicy: TextHeightAdaptivePolicy.MIN_FONT_SIZE_FIRST
        })
        .id('ButtonInterface0340_LongText')
        .onClick(() => {
          this.addLog('点击了长文本按钮');
        })

      // 对比：不设置字体限制
      Text('对比：未设置字体限制')
        .fontSize(11)
        .fontColor(Color.Gray)

      Button('这是一段较长的按钮文本用于测试字体缩放', { type: ButtonType.Normal })
        .width(200)
        .height(50)
        .id('ButtonInterface0340_NoLimit')
        .onClick(() => {
          this.addLog('点击了无限制按钮');
        })

      Divider().height(1).color('#EEEEEE')

      Column({ space: 4 }) {
        Text('预期结果:').fontSize(11).fontWeight(FontWeight.Bold)
        Text('字体大小在10-12范围内缩放，不会超出限制')
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

