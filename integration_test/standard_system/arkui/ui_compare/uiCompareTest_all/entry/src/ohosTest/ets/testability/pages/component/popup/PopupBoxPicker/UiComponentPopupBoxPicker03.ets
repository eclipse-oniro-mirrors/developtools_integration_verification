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

@Entry
@Component
struct UiComponentPopupBoxPicker03 {
  @State testId: string = 'SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_0030';
  @State callbackLog: string[] = [];
  @State selectedText: string = '未选择';
  private fruits: string[] = ['苹果', '香蕉', '橙子', '葡萄', '西瓜', '草莓', '芒果', '樱桃'];

  addLog(message: string) {
    const timestamp = new Date().toLocaleTimeString();
    this.callbackLog.push(`[${timestamp}] ${message}`);
    console.info(`TextPickerDialog: ${message}`);
  }

  clearLog() {
    this.callbackLog = [];
    this.selectedText = '未选择';
  }

  build() {
    Scroll() {
      Column({ space: 2 }) {
        Text('测试用例: SUB_ACE_UI_COMPONENT_POPUPBOX_PICKER_0030')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FF5722')
          .width('100%')
          .textAlign(TextAlign.Center)

        Column({ space: 1 }) {
          Row() {
            Text('回调日志 (共')
              .fontSize(14)
              .fontWeight(FontWeight.Bold)
              .fontColor('#607d7B')
            Text(`${this.callbackLog.length}`)
              .fontSize(14)
              .fontWeight(FontWeight.Bold)
              .fontColor('#FF5722')
            Text('条):')
              .fontSize(14)
              .fontWeight(FontWeight.Bold)
              .fontColor('#607d7B')
          }
          .width('100%')

          Divider()
            .color('#CCCCCC')

          if (this.callbackLog.length === 0) {
            Text('暂无日志，请点击按钮打开文本选择器')
              .fontSize(13)
              .fontColor('#999999')
              .width('100%')
              .textAlign(TextAlign.Center)
              .padding(20)
          } else {
            Column({ space: 8 }) {
              ForEach(this.callbackLog, (log: string, index: number) => {
                Row({ space: 10 }) {
                  Text(`${index + 1}.`)
                    .fontSize(12)
                    .fontColor('#999999')
                    .width(30)

                  Text(log)
                    .fontSize(13)
                    .fontColor('#333333')
                    .layoutWeight(1)
                    .wordBreak(WordBreak.BREAK_ALL)
                }
                .width('100%')
                .padding({ left: 5, right: 5, top: 5, bottom: 5 })
                .backgroundColor(index % 2 === 0 ? '#F5F5F5' : '#FFFFFF')
                .borderRadius(5)
              }, (log: string, index: number) => `${index}_${log}`)
            }
            .width('100%')
          }
        }
        .width('90%')
        .padding(15)
        .backgroundColor('#ECEFF1')
        .borderRadius(10)
        .alignItems(HorizontalAlign.Start)

        Column({ space: 2 }) {
          Text('textPickerDialog显示动效前回调测试')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .fontColor('#4CAF50')
            .width('100%')
            .textAlign(TextAlign.Start)

          Text('点击下方按钮打开文本选择器，观察回调顺序')
            .fontSize(14)
            .fontColor('#666666')
            .width('100%')
            .textAlign(TextAlign.Start)

          Button('打开文本选择器')
            .width('100%')
            .height(50)
            .fontSize(16)
            .backgroundColor('#2196F3')
            .onClick(() => {
              this.clearLog();
              TextPickerDialog.show({
                range: this.fruits,
                selected: 0,
                onWillAppear: () => {
                  this.addLog('1. onWillAppear - 对话框即将出现');
                },
                onDidAppear: () => {
                  this.addLog('2. onDidAppear - 对话框已经出现');
                },
                onWillDisappear: () => {
                  this.addLog('3. onWillDisappear - 对话框即将消失');
                },
                onDidDisappear: () => {
                  this.addLog('4. onDidDisappear - 对话框已经消失');
                },
                onAccept: (value: TextPickerResult) => {
                  this.selectedText = this.fruits[value.index as number];
                  this.addLog(`用户选择了: ${this.selectedText}`);
                },
                onCancel: () => {
                  this.addLog('用户取消了选择');
                }
              });
            })
            .id('UiComponentPopupBoxPicker03')

          Button('清空日志')
            .width('100%')
            .height(45)
            .fontSize(14)
            .backgroundColor('#FF9800')
            .onClick(() => {
              this.clearLog();
            })
            .id('clearLogButton')
        }
        .width('90%')
        .padding(20)
        .backgroundColor('#E8F5E9')
        .borderRadius(10)

        Column({ space: 10 }) {
          Text('当前选择的文本:')
            .fontSize(14)
            .fontWeight(FontWeight.Bold)
            .fontColor('#607d7B')
            .width('100%')
            .textAlign(TextAlign.Start)

          Text(this.selectedText)
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .fontColor('#2196F3')
            .width('100%')
            .textAlign(TextAlign.Center)
            .padding(15)
            .backgroundColor('#E3F2FD')
            .borderRadius(8)
        }
        .width('90%')
        .padding(15)
        .backgroundColor('#FFF3E0')
        .borderRadius(10)

        Column({ space: 10 }) {
          Text('测试预期:')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .fontColor('#FF5722')
            .width('100%')
            .textAlign(TextAlign.Center)

          Text('1. 点击"打开文本选择器"按钮')
            .fontSize(13)
            .fontColor('#444444')
            .width('100%')
            .textAlign(TextAlign.Start)

          Text('2. 对话框弹出，依次触发回调:')
            .fontSize(13)
            .fontColor('#444444')
            .width('100%')
            .textAlign(TextAlign.Start)

          Column({ space: 5 }) {
            Text('   • onWillAppear (对话框即将出现)')
              .fontSize(12)
              .fontColor('#2196F3')
              .width('100%')
              .textAlign(TextAlign.Start)

            Text('   • onDidAppear (对话框已经出现)')
              .fontSize(12)
              .fontColor('#2196F3')
              .width('100%')
              .textAlign(TextAlign.Start)
          }
          .width('100%')

          Text('3. 选择文本后，依次触发回调:')
            .fontSize(13)
            .fontColor('#444444')
            .width('100%')
            .textAlign(TextAlign.Start)

          Column({ space: 5 }) {
            Text('   • onWillDisappear (对话框即将消失)')
              .fontSize(12)
              .fontColor('#FF9800')
              .width('100%')
              .textAlign(TextAlign.Start)

            Text('   • onDidDisappear (对话框已经消失)')
              .fontSize(12)
              .fontColor('#FF9800')
              .width('100%')
              .textAlign(TextAlign.Start)
          }
          .width('100%')

          Text('4. 每个回调只触发一次')
            .fontSize(13)
            .fontColor('#444444')
            .width('100%')
            .textAlign(TextAlign.Start)

          Text('5. 回调顺序为: onWillAppear → onDidAppear → onWillDisappear → onDidDisappear')
            .fontSize(13)
            .fontColor('#4CAF50')
            .fontWeight(FontWeight.Bold)
            .width('100%')
            .textAlign(TextAlign.Start)

          Divider()
            .margin({ top: 10, bottom: 10 })
        }
        .width('90%')
        .padding(15)
        .backgroundColor('#FFF8E1')
        .borderRadius(10)
      }
      .width('100%')
      .padding({ bottom: 30 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FAFAFA')
  }
}
