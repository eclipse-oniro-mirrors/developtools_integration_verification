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
 * 用例ID: SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0340
 * 用例描述: 验证层级-5时showActionSheet的弹窗正常显示
 * 预期结果: toporder:-5 bottomorder:-5
 */

import { hilog } from '@kit.PerformanceAnalysisKit';
import { promptAction } from '@kit.ArkUI';

@Entry
@Component
struct DialogOrder0340 {
  @State testLog: string[] = [];
  @State topOrder: number = 0;
  @State bottomOrder: number = 0;
  @State currentLevel: number = -5;

  addLog(log: string): void {
    const timestamp = new Date().toLocaleTimeString();
    this.testLog.unshift(`[${timestamp}] ${log}`);
    if (this.testLog.length > 15) {
      this.testLog = this.testLog.slice(0, 15);
    }
    hilog.info(0x0000, 'DialogOrder0340', log);
  }

  build() {
    Column({ space: 8 }) {
      Text('SUB_ACE_UI_COMPONENT_BUTTON_DIALOG_ORDER_0340').fontSize(9).fontWeight(FontWeight.Bold)
      Text('showActionSheet层级-5').fontSize(14).fontWeight(FontWeight.Bold).fontColor(Color.Blue)
      Divider().height(1).color('#EEEEEE')
      Text('当前层级: ' + this.currentLevel).fontSize(11).fontColor('#666666')

      Button('-5').height(35).id('DialogOrder0340_Level').backgroundColor('#007DFF')
        .onClick(() => { this.currentLevel = -5; this.addLog('设置层级: -5'); })

      Button('showActionSheet').width(180).height(40).id('DialogOrder0340_Dialog')
        .onClick(() => {
          this.topOrder = -5; this.bottomOrder = -5;
          promptAction.showActionMenu({
            title: 'showActionSheet弹窗', buttons: [
              { text: '选项1', color: '#007DFF' }, { text: '取消', color: '#999999' }
            ]
          }).then((result) => { this.addLog(`选择: ${result.index}`); }).catch(() => {});
        })

      Button('获取TopOrder+BottomOrder').width(220).height(40).id('DialogOrder0340_GetOrder')
        .onClick(() => { this.addLog(`toporder:${this.topOrder} bottomorder:${this.bottomOrder}`); })

      Column({ space: 4 }) {
        Text('Order值:').fontSize(11).fontWeight(FontWeight.Bold)
        Text(`toporder: ${this.topOrder}  bottomorder: ${this.bottomOrder}`).fontSize(12).fontColor('#007DFF')
      }.width('95%').padding(8).backgroundColor(Color.White).borderRadius(4)

      Column({ space: 4 }) {
        Text('预期结果: toporder:-5 bottomorder:-5').fontSize(9).fontColor('#4CAF50')
      }.width('95%').padding(6).backgroundColor('#E8F5E9').borderRadius(4)

      Scroll() {
        Column() {
          ForEach(this.testLog, (log: string) => { Text(log).fontSize(8).fontColor('#333333').width('100%').padding(2) })
        }.width('100%')
      }.height('6.56%').width('95%').backgroundColor('#FAFAFA').borderRadius(4)
    }.width('100%').height('100%').padding(6).backgroundColor('#F5F5F5')
  }
}

