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
struct PopupBoxActionSheetScenarios0120 {
  @State displayText: string = ''

  build() {
    Column() {
      Text('actionSheet界面')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin(20)

      Button('UIContext ActionSheet')
        .id('uicontext_actionsheet_button_0120')
        .onClick(() => {
          this.showActionSheet()
        })
        .margin(20)

      Button('confirm button1')
        .id('confirm_button1_scenarios_0120')
        .onClick(() => {
          this.showActionSheet()
        })
        .margin(20)

      Text(this.displayText)
        .fontSize(16)
        .margin(20)
        .textAlign(TextAlign.Center)
        .width('90%')
        .height(100)
        .backgroundColor('#f0f0f0')
        .borderRadius(8)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }

  private showActionSheet() {
    ActionSheet.show({
      title: '列表选择弹窗',
      message: '请选择操作',
      sheets: [
        {
          title: '选项1',
          action: () => {
            this.displayText = '选择了选项1'
          }
        },
        {
          title: '选项2',
          action: () => {
            this.displayText = '选择了选项2'
          }
        },
        {
          title: '选项3',
          action: () => {
            this.displayText = '选择了选项3'
          }
        }
      ],
      cancel: () => {
        // 设置cancel函数，验证触发弹窗后点击遮障层关闭弹窗时触发的回调
        this.displayText = 'UIContext ActionSheet canceled'
        console.log('UIContext ActionSheet canceled')
      }
    })
  }
}
