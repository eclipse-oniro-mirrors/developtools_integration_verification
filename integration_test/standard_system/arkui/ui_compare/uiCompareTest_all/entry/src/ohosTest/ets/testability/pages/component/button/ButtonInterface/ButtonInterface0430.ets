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
 * 用例ID: SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_INTERFACE_0430
 * 用例描述: label的weight属性设置
 * 测试条件: 创建button，设置type为ButtonType.Normal
 * 测试步骤: weight在[100,900]取值，间隔为100，取100、300、600、900
 * 预期结果: 取值越大，字体显示越粗
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
struct ButtonInterface0430 {
  @State testLog: string[] = [];

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 20) {
      this.testLog = this.testLog.slice(0, 20);
    }
    hilog.info(0x0000, 'ButtonInterface0430', log);
  }

  build() {
    Column({ space: 8 }) {
      Text('SUB_ACE_UI_COMPONENT_BUTTON_BUTTON_INTERFACE_0430')
        .fontSize(10)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('label weight属性测试')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)

      Divider().height(1).color('#EEEEEE')

      Column({ space: 4 }) {
        Text('测试说明:').fontSize(11).fontWeight(FontWeight.Bold)
        Text('weight取值: 100、300、600、900\n数值越大字体越粗')
          .fontSize(10)
          .fontColor(Color.Gray)
      }
      .width('95%')
      .padding(6)
      .backgroundColor('#E3F2FD')
      .borderRadius(4)

      Row({ space: 10 }) {
        Text('weight=100:').fontSize(11).width(80)
        Button('按钮文本', { type: ButtonType.Normal })
          .width(120)
          .height(36)
          .labelStyle({ font: { weight: 100 } })
          .id('ButtonInterface0430_100')
          .onClick(() => { this.addLog('点击weight=100'); })
      }

      Row({ space: 10 }) {
        Text('weight=300:').fontSize(11).width(80)
        Button('按钮文本', { type: ButtonType.Normal })
          .width(120)
          .height(36)
          .labelStyle({ font: { weight: 300 } })
          .id('ButtonInterface0430_300')
          .onClick(() => { this.addLog('点击weight=300'); })
      }

      Row({ space: 10 }) {
        Text('weight=600:').fontSize(11).width(80)
        Button('按钮文本', { type: ButtonType.Normal })
          .width(120)
          .height(36)
          .labelStyle({ font: { weight: 600 } })
          .id('ButtonInterface0430_600')
          .onClick(() => { this.addLog('点击weight=600'); })
      }

      Row({ space: 10 }) {
        Text('weight=900:').fontSize(11).width(80)
        Button('按钮文本', { type: ButtonType.Normal })
          .width(120)
          .height(36)
          .labelStyle({ font: { weight: 900 } })
          .id('ButtonInterface0430_900')
          .onClick(() => { this.addLog('点击weight=900'); })
      }

      Divider().height(1).color('#EEEEEE')

      Column({ space: 4 }) {
        Text('预期结果:').fontSize(10).fontWeight(FontWeight.Bold)
        Text('从上到下，字体逐渐变粗')
          .fontSize(9)
          .fontColor('#4CAF50')
      }
      .width('95%')
      .padding(6)
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
    .padding(8)
    .backgroundColor('#F5F5F5')
  }
}

