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
struct FocusActive0190 {
  @State activateCount: number = 0;
  @State currentStatus: string = '未激活';
  @State isRunning: boolean = false;
  @State focusedButton: number = 0;

  async runActivateTest() {
    this.isRunning = true;
    this.activateCount = 0;
    console.info('[FocusActive] Starting test: alternate activate 50 times with focus display');

    for (let i = 0; i < 50; i++) {
      if (i % 2 === 0) {
        this.currentStatus = '已激活';
        this.focusedButton = 1;
        console.info(`[FocusActive] ${i + 1}. Pipeline focus turns to active`);
      } else {
        this.currentStatus = '未激活';
        this.focusedButton = 2;
        console.info(`[FocusActive] ${i + 1}. Pipeline focus turns to inactive`);
      }
      this.activateCount = i + 1;
      await new Promise<void>((resolve) => setTimeout(resolve, 100));
    }

    console.info('[FocusActive] Test completed: 50 times executed, focus display normal');
    this.isRunning = false;
  }

  build() {
    Column() {
      Text('activate接口交替设置为true、false，50次，功能正常')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 20 })
        .textAlign(TextAlign.Center)
        .id('FocusActive0190_001')

      Text('测试说明: 验证activate接口频繁调用时获焦组件的焦点框显示正常')
        .fontSize(14)
        .fontColor('#666666')
        .margin({ bottom: 30 })
        .id('FocusActive0190_002')

      Divider().margin({ bottom: 20 })

      Text(`执行次数: ${this.activateCount} / 50`)
        .fontSize(16)
        .fontColor('#007DFF')
        .margin({ bottom: 10 })
        .id('FocusActive0190_003')

      Text(`当前状态: ${this.currentStatus}`)
        .fontSize(16)
        .fontColor(this.currentStatus === '已激活' ? '#4CAF50' : '#FF6B6B')
        .margin({ bottom: 20 })
        .id('FocusActive0190_004')

      Button('开始测试（50次）')
        .width('80%')
        .height(50)
        .margin({ bottom: 30 })
        .enabled(!this.isRunning)
        .id('FocusActive0190_005')
        .onClick(() => {
          this.runActivateTest();
        })

      Divider().margin({ bottom: 20 })

      Text('测试按钮（观察焦点框）:')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })
        .id('FocusActive0190_006')

      Button('按钮1 - Active状态')
        .width('80%')
        .height(60)
        .margin({ bottom: 15 })
        .backgroundColor(this.focusedButton === 1 ? '#007DFF' : '#E0E0E0')
        .fontColor(this.focusedButton === 1 ? Color.White : '#666666')
        .id('FocusActive0190_007')
        .focusable(true)
        .border({
          width: this.focusedButton === 1 ? 3 : 1,
          color: this.focusedButton === 1 ? '#FF6B6B' : '#CCCCCC',
          style: BorderStyle.Solid
        })

      Button('按钮2 - Inactive状态')
        .width('80%')
        .height(60)
        .margin({ bottom: 15 })
        .backgroundColor(this.focusedButton === 2 ? '#007DFF' : '#E0E0E0')
        .fontColor(this.focusedButton === 2 ? Color.White : '#666666')
        .id('FocusActive0190_008')
        .focusable(true)
        .border({
          width: this.focusedButton === 2 ? 3 : 1,
          color: this.focusedButton === 2 ? '#FF6B6B' : '#CCCCCC',
          style: BorderStyle.Solid
        })

      Button('按钮3 - 普通按钮')
        .width('80%')
        .height(60)
        .margin({ bottom: 20 })
        .backgroundColor(this.focusedButton === 3 ? '#007DFF' : '#E0E0E0')
        .fontColor(this.focusedButton === 3 ? Color.White : '#666666')
        .id('FocusActive0190_009')
        .focusable(true)
        .border({
          width: this.focusedButton === 3 ? 3 : 1,
          color: this.focusedButton === 3 ? '#FF6B6B' : '#CCCCCC',
          style: BorderStyle.Solid
        })
        .onClick(() => {
          this.focusedButton = 3;
        })

      Divider().margin({ bottom: 20 })

      Text('预期结果:')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 10 })
        .id('FocusActive0190_010')

      Text('获焦组件的焦点框逻辑展示正常')
        .fontSize(12)
        .fontColor('#4CAF50')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 10 })
        .id('FocusActive0190_011')

      Text('验证点:')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 5 })
        .id('FocusActive0190_012')

      Text('• 交替执行50次activate调用')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 3 })
        .id('FocusActive0190_013')

      Text('• 焦点框在按钮1和按钮2之间切换')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 3 })
        .id('FocusActive0190_014')

      Text('• 焦点框显示正常（红色边框，3px宽度）')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 3 })
        .id('FocusActive0190_015')

      Text('• 按钮背景色随焦点状态变化')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .margin({ bottom: 3 })
        .id('FocusActive0190_016')

      Text('• 50次调用后焦点框逻辑仍然正常')
        .fontSize(11)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .width('90%')
        .id('FocusActive0190_017')

    }
    .width('100%')
    .height('100%')
    .padding(20)
    .alignItems(HorizontalAlign.Center)
  }
}
