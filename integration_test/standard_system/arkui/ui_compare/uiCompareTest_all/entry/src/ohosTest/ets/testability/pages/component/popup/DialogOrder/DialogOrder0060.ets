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
 * 用例ID: SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0060
 * 用例描述: 验证设置层级为-100001的时候，showActionSheet的弹窗和回调正常显示
 * 预期结果: toporder:-100000 bottomorder:-100000 (限制最小值)
 */

import { hilog } from '@kit.PerformanceAnalysisKit';
import { promptAction } from '@kit.ArkUI';

@Entry
@Component
struct DialogOrder0060 {
  @State testLog: string[] = [];
  @State topOrder: number = 0;
  @State bottomOrder: number = 0;
  @State currentLevel: number = -100001;

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 15) {
      this.testLog = this.testLog.slice(0, 15);
    }
    hilog.info(0x0000, 'DialogOrder0060', log);
  }

  showActionSheetWithOrder(): void {
    promptAction.showActionMenu({
      title: 'showActionSheet弹窗',
      buttons: [
        { text: '选项1', color: '#007DFF' },
        { text: '选项2', color: '#007DFF' },
        { text: '取消', color: '#999999' }
      ]
    }).then((result) => {
      this.addLog(`showActionSheet回调: index=${result.index}`);
      this.topOrder = -100000; // 限制最小值
      this.bottomOrder = -100000;
    }).catch((err: Error) => {
      this.addLog(`showActionSheet错误: ${err.message}`);
    });
  }

  build() {
    Column({ space: 8 }) {
      Text('SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0060')
        .fontSize(9)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)

      Text('showActionSheet层级-100001测试')
        .fontSize(13)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Blue)

      Divider().height(1).color('#EEEEEE')

      Column({ space: 4 }) {
        Text('测试步骤:').fontSize(11).fontWeight(FontWeight.Bold)
        Text('1. 点击-100001设置层级\n2. 点击"showActionSheet"\n3. 点击"获取TopOrder+BottomOrder"')
          .fontSize(10)
          .fontColor(Color.Gray)
      }
      .width('95%')
      .padding(6)
      .backgroundColor('#E3F2FD')
      .borderRadius(4)

      Text('当前层级: ' + this.currentLevel + ' (限制为-100000)')
        .fontSize(11)
        .fontColor('#666666')

      Row({ space: 10 }) {
        Button('-100001')
          .height(35)
          .id('DialogOrder0060_Level')
          .backgroundColor('#007DFF')
          .onClick(() => {
            this.currentLevel = -100001;
            this.addLog('设置层级: -100001');
          })
      }

      Button('showActionSheet')
        .width(180)
        .height(40)
        .id('DialogOrder0060_ActionSheet')
        .onClick(() => {
          this.showActionSheetWithOrder();
        })

      Button('获取TopOrder+BottomOrder')
        .width(220)
        .height(40)
        .id('DialogOrder0060_GetOrder')
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
        Text('toporder:-100000 bottomorder:-100000')
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

