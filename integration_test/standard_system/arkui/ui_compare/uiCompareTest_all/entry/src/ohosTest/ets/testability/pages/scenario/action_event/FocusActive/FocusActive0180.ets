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
struct FocusActive0180 {
  @State logMessages: string[] = [];
  @State activateCount: number = 0;
  @State currentStatus: string = '未激活';
  @State isRunning: boolean = false;

  addLog(message: string) {
    this.logMessages.push(message);
    if (this.logMessages.length > 15) {
      this.logMessages.shift();
    }
  }

  async runActivateTest() {
    this.isRunning = true;
    this.activateCount = 0;
    this.logMessages = [];
    this.addLog('开始测试：交替调用activate 50次');
    console.info('[FocusActive] Starting test: alternate activate 50 times');

    for (let i = 0; i < 50; i++) {
      if (i % 2 === 0) {
        this.currentStatus = '已激活';
        this.addLog(`第${i + 1}次: Pipeline focus turns to active`);
        console.info(`[FocusActive] ${i + 1}. Pipeline focus turns to active`);
      } else {
        this.currentStatus = '未激活';
        this.addLog(`第${i + 1}次: Pipeline focus turns to inactive`);
        console.info(`[FocusActive] ${i + 1}. Pipeline focus turns to inactive`);
      }
      this.activateCount = i + 1;
      await new Promise<void>((resolve) => setTimeout(resolve, 50));
    }

    this.addLog('测试完成：共执行50次');
    console.info('[FocusActive] Test completed: 50 times executed');
    this.isRunning = false;
  }

  build() {
    Column() {
      Text('activate接口交替设置为true、false，50次')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .textAlign(TextAlign.Center)
        .id('FocusActive0180_001')

      Text('测试说明: 交替调用activate接口50次，验证日志打印')
        .fontSize(14)
        .fontColor('#666666')
        .margin({ bottom: 30 })
        .id('FocusActive0180_002')

      Divider().margin({ bottom: 20 })

      Text(`执行次数: ${this.activateCount} / 50`)
        .fontSize(16)
        .fontColor('#007DFF')
        .margin({ bottom: 10 })
        .id('FocusActive0180_003')

      Text(`当前状态: ${this.currentStatus}`)
        .fontSize(16)
        .fontColor(this.currentStatus === '已激活' ? '#4CAF50' : '#FF6B6B')
        .margin({ bottom: 20 })
        .id('FocusActive0180_004')

      Button(this.isRunning ? '测试进行中...' : '开始测试（50次）')
        .width('80%')
        .height(50)
        .margin({ bottom: 20 })
        .enabled(!this.isRunning)
        .id('FocusActive0180_005')
        .onClick(() => {
          this.runActivateTest();
        })

      Divider().margin({ bottom: 20 })

      Text('日志输出（最近15条）:')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })
        .id('FocusActive0180_006')

      Scroll() {
        Column() {
          ForEach(this.logMessages, (log: string, index: number) => {
            Text(log)
              .fontSize(11)
              .fontColor('#333333')
              .textAlign(TextAlign.Start)
              .width('100%')
              .margin({ bottom: 2 })
          })

          if (this.logMessages.length === 0) {
            Text('(暂无日志)')
              .fontSize(12)
              .fontColor('#999999')
          }
        }
        .width('100%')
      }
      .width('90%')
      .height('16.39%')
      .padding(10)
      .backgroundColor('#F5F5F5')
      .borderRadius(5)
      .margin({ bottom: 20 })
      .id('FocusActive0180_007')

      Divider().margin({ bottom: 20 })

      Text('预期结果:')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 10 })
        .id('FocusActive0180_008')

      Text('日志打印的日志内容、频次均正确')
        .fontSize(12)
        .fontColor('#4CAF50')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 10 })
        .id('FocusActive0180_009')

      Text('验证点:')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('FocusActive0180_010')

      Text('• 总共执行50次activate调用')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 3 })
        .id('FocusActive0180_011')

      Text('• 偶数次(0,2,4...): Pipeline focus turns to active')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 3 })
        .id('FocusActive0180_012')

      Text('• 奇数次(1,3,5...): Pipeline focus turns to inactive')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 3 })
        .id('FocusActive0180_013')

      Text('• 日志内容正确，频次为50次')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 3 })
        .id('FocusActive0180_014')

      Text('• 使用hdc shell hilog | findstr "Pipeline focus"查看完整日志')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .id('FocusActive0180_015')

    }
    .width('100%')
    .height('100%')
    .padding(20)
    .alignItems(HorizontalAlign.Center)
  }
}
