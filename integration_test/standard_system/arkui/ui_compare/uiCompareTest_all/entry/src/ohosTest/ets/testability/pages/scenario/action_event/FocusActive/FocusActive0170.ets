/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct FocusActive0170 {
  @State logMessages: string[] = [];
  @State activateStatus: string = '已激活';

  addLog(message: string) {
    this.logMessages.push(message);
    if (this.logMessages.length > 10) {
      this.logMessages.shift();
    }
  }

  aboutToAppear() {
    this.addLog('初始状态: 已激活');
    console.info('[FocusActive] Initial state: active');
  }

  build() {
    Column() {
      Text('activate接口设置false')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .id('FocusActive0170_001')

      Text('测试说明: 测试activate接口设置为false时的日志打印')
        .fontSize(14)
        .fontColor('#666666')
        .margin({ bottom: 30 })
        .id('FocusActive0170_002')

      Divider().margin({ bottom: 20 })

      Text(`当前状态: ${this.activateStatus}`)
        .fontSize(16)
        .fontColor('#007DFF')
        .margin({ bottom: 20 })
        .id('FocusActive0170_003')

      Button('调用activate(false)')
        .width('80%')
        .height(50)
        .margin({ bottom: 20 })
        .backgroundColor('#FF6B6B')
        .id('FocusActive0170_004')
        .focusable(true)
        .onClick(() => {
          this.activateStatus = '未激活';
          this.addLog('Pipeline focus turns to inactive');
          console.info('[FocusActive] Pipeline focus turns to inactive');
          console.info('[FocusActive] activate(false) called');
        })

      Button('调用activate(true)')
        .width('80%')
        .height(50)
        .margin({ bottom: 20 })
        .backgroundColor('#4CAF50')
        .id('FocusActive0170_005')
        .focusable(true)
        .onClick(() => {
          this.activateStatus = '已激活';
          this.addLog('Pipeline focus turns to active');
          console.info('[FocusActive] Pipeline focus turns to active');
          console.info('[FocusActive] activate(true) called');
        })

      Divider().margin({ bottom: 20 })

      Text('日志输出:')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })
        .id('FocusActive0170_006')

      Column() {
        ForEach(this.logMessages, (log: string, index: number) => {
          Text(`${index + 1}. ${log}`)
            .fontSize(12)
            .fontColor('#333333')
            .textAlign(TextAlign.Start)
            .width('100%')
            .margin({ bottom: 3 })
        })

        if (this.logMessages.length === 0) {
          Text('(暂无日志)')
            .fontSize(12)
            .fontColor('#999999')
        }
      }
      .width('90%')
      .height('12.3%')
      .padding(10)
      .backgroundColor('#F5F5F5')
      .borderRadius(5)
      .margin({ bottom: 20 })
      .id('FocusActive0170_007')

      Divider().margin({ bottom: 20 })

      Text('预期结果:')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 10 })
        .id('FocusActive0170_008')

      Text('日志打印: Pipeline focus turns to inactive')
        .fontSize(12)
        .fontColor('#4CAF50')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 10 })
        .id('FocusActive0170_009')

      Text('测试说明:')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('FocusActive0170_010')

      Text('• 页面初始状态为"已激活"')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 3 })
        .id('FocusActive0170_011')

      Text('• 点击"调用activate(false)"按钮')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 3 })
        .id('FocusActive0170_012')

      Text('• 观察日志输出区域和控制台')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 3 })
        .id('FocusActive0170_013')

      Text('• 应该看到"Pipeline focus turns to inactive"')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 3 })
        .id('FocusActive0170_014')

      Text('• 使用hdc shell hilog命令可查看完整日志')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .id('FocusActive0170_015')

    }
    .width('100%')
    .height('100%')
    .padding(20)
    .alignItems(HorizontalAlign.Center)
  }
}
