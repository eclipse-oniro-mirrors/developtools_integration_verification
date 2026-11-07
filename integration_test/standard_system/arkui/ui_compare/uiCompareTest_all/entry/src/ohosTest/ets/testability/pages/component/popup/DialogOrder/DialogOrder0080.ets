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
 * 用例ID: SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0080
 * 用例描述: 验证层级-5时CustomDialogController().open()的弹窗正常显示
 * 预期结果: toporder:-5 bottomorder:-5
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@CustomDialog
struct CustomDialogExample0080 {
  controller?: CustomDialogController;
  onConfirm: () => void = () => {};

  build() {
    Column({ space: 15 }) {
      Text('CustomDialogController弹窗')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
      Text('层级设置为: -5')
        .fontSize(14)
        .fontColor('#666666')
      Button('确定')
        .onClick(() => {
          this.onConfirm();
          if (this.controller) {
            this.controller.close();
          }
        })
    }
    .padding(20)
  }
}

@Entry
@Component
struct DialogOrder0080 {
  @State testLog: string[] = [];
  @State topOrder: number = 0;
  @State bottomOrder: number = 0;
  @State currentLevel: number = -5;

  dialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialogExample0080({
      onConfirm: () => {
        this.addLog('CustomDialogController回调确认');
        this.topOrder = -5;
        this.bottomOrder = -5;
      }
    }),
    autoCancel: true
  });

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 15) {
      this.testLog = this.testLog.slice(0, 15);
    }
    hilog.info(0x0000, 'DialogOrder0080', log);
  }

  build() {
    Column({ space: 8 }) {
      Text('SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0080')
        .fontSize(9)
        .fontWeight(FontWeight.Bold)

      Text('CustomDialogController层级-5测试')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)

      Divider().height(1).color('#EEEEEE')

      Text('当前层级: ' + this.currentLevel)
        .fontSize(11)
        .fontColor('#666666')

      Button('-5')
        .height(35)
        .id('DialogOrder0080_Level')
        .backgroundColor('#007DFF')
        .onClick(() => {
          this.currentLevel = -5;
          this.addLog('设置层级: -5');
        })

      Button('CustomDialogController')
        .width(200)
        .height(40)
        .id('DialogOrder0080_Dialog')
        .onClick(() => {
          this.dialogController.open();
          this.addLog('打开CustomDialogController');
        })

      Button('获取TopOrder+BottomOrder')
        .width(220)
        .height(40)
        .id('DialogOrder0080_GetOrder')
        .onClick(() => {
          this.addLog(`toporder:${this.topOrder} bottomorder:${this.bottomOrder}`);
        })

      Column({ space: 4 }) {
        Text('Order值:').fontSize(11).fontWeight(FontWeight.Bold)
        Text(`toporder: ${this.topOrder}  bottomorder: ${this.bottomOrder}`)
          .fontSize(12)
          .fontColor('#007DFF')
      }
      .width('95%')
      .padding(8)
      .backgroundColor(Color.White)
      .borderRadius(4)

      Column({ space: 4 }) {
        Text('预期结果: toporder:-5 bottomorder:-5')
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
            Text(log).fontSize(8).fontColor('#333333').width('100%').padding(2)
          })
        }.width('100%')
      }
      .height('4.92%')
      .width('95%')
      .backgroundColor('#FAFAFA')
      .borderRadius(4)
    }
    .width('100%')
    .height('100%')
    .padding(6)
    .backgroundColor('#F5F5F5')
  }
}

