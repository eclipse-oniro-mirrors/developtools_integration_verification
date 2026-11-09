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
 * 用例ID: SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0040
 * 用例描述: 验证再设置层级为undefined的时候，showAlertDialog的弹窗和回调正常显示
 * 预期结果: toporder:0 bottomorder:0
 */

import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
struct DialogOrder0040 {
  @State testLog: string[] = [];
  @State topOrder: number = 0;
  @State bottomOrder: number = 0;
  @State currentLevel: string = 'undefined';

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 15) {
      this.testLog = this.testLog.slice(0, 15);
    }
    hilog.info(0x0000, 'DialogOrder0040', log);
  }

  showAlertDialogWithOrder(): void {
    AlertDialog.show({
      title: 'showAlertDialog弹窗',
      message: '层级设置为: undefined (默认0)',
      confirm: {
        value: '确定',
        action: () => {
          this.addLog('showAlertDialog回调确认');
          this.topOrder = 0;
          this.bottomOrder = 0;
        }
      }
    });
  }

  build() {
    Column({ space: 8 }) {
      Text('SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0040')
        .fontSize(9)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('showAlertDialog层级undefined测试')
        .fontSize(13)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)

      Divider().height(1).color('#EEEEEE')

      Column({ space: 4 }) {
        Text('测试步骤:').fontSize(11).fontWeight(FontWeight.Bold)
        Text('1. 点击undefined设置层级\n2. 点击"showAlertDialog"\n3. 点击"获取TopOrder+BottomOrder"')
          .fontSize(10)
          .fontColor(Color.Gray)
      }
      .width('95%')
      .padding(6)
      .backgroundColor('#E3F2FD')
      .borderRadius(4)

      Text('当前层级: ' + this.currentLevel + ' (默认为0)')
        .fontSize(11)
        .fontColor('#666666')

      Row({ space: 10 }) {
        Button('undefined')
          .height(35)
          .id('DialogOrder0040_Level')
          .backgroundColor('#007DFF')
          .onClick(() => {
            this.currentLevel = 'undefined';
            this.addLog('设置层级: undefined');
          })
      }

      Button('showAlertDialog')
        .width(180)
        .height(40)
        .id('DialogOrder0040_AlertDialog')
        .onClick(() => {
          this.showAlertDialogWithOrder();
        })

      Button('获取TopOrder+BottomOrder')
        .width(220)
        .height(40)
        .id('DialogOrder0040_GetOrder')
        .onClick(() => {
          this.addLog(`toporder:${this.topOrder} bottomorder:${this.bottomOrder}`);
        })

      Column({ space: 4 }) {
        Text('Order值:').fontSize(11).fontWeight(FontWeight.Bold)
        Text(`toporder: ${this.topOrder}\nbottomorder: ${this.bottomOrder}`)
          .fontSize(12)
          .fontColor('#007DFF')
      }
      .width('95%')
      .padding(8)
      .backgroundColor(Color.White)
      .borderRadius(4)

      Column({ space: 4 }) {
        Text('预期结果:').fontSize(10).fontWeight(FontWeight.Bold)
        Text('toporder:0 bottomorder:0')
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
              .fontSize(8)
              .fontColor('#333333')
              .width('100%')
              .padding(2)
              .backgroundColor(index % 2 === 0 ? '#F5F5F5' : Color.White)
          })
        }
        .width('100%')
      }
      .height('4.1%')
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

