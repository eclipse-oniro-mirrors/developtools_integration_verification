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
struct PopupboxSpecification0300 {
  @State isPromptActionVisible: boolean = false
  @State selectedAction: string = ''
  private actionItems: string[] = ['操作1', '操作2', '操作3', '删除', '分享']

  build() {
    Column() {
      Button('点击弹出无按钮promptAction弹窗(无蒙层)')
        .id('popup_button_0300')
        .onClick(() => {
          this.isPromptActionVisible = true
        })
        .margin({ top: 50 })
      
      if (this.selectedAction) {
        Text(`选择的操作: ${this.selectedAction}`)
          .fontSize(16)
          .margin({ top: 20 })
      }
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .backgroundColor(Color.White)
    .bindContentCover(this.isPromptActionVisible, this.promptActionDialog, {
      modalTransition: ModalTransition.NONE,
      onAppear: () => {
        console.info('PromptAction dialog appeared')
      },
      onDisappear: () => {
        this.isPromptActionVisible = false
      }
    })
  }

  @Builder
  promptActionDialog() {
    Column() {
      Text('操作选择')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 15 })
      
      Text('这是一个无按钮promptAction弹窗，无蒙层')
        .fontSize(14)
        .textAlign(TextAlign.Center)
        .margin({ bottom: 20 })
      
      Column() {
        ForEach(this.actionItems, (action: string, index: number) => {
          Row() {
            Text(action)
              .fontSize(16)
              .fontColor(action === '删除' ? Color.Red : Color.Black)
          }
          .width('100%')
          .height('4.1%')
          .justifyContent(FlexAlign.Center)
          .backgroundColor(Color.Transparent)
          .onClick(() => {
            this.selectedAction = action
            this.isPromptActionVisible = false
          })
          .border({ 
            width: { bottom: index < this.actionItems.length - 1 ? 1 : 0 }, 
            color: Color.Gray 
          })
        })
      }
      .width('100%')
      .backgroundColor(Color.White)
      .borderRadius(8)
      .margin({ bottom: 20 })
      
      Text('点击操作项或外部区域关闭')
        .fontSize(12)
        .fontColor(Color.Gray)
        .textAlign(TextAlign.Center)
    }
    .width('38.89%')
    .padding(20)
    .backgroundColor(Color.White)
    .borderRadius(8)
    .shadow({ radius: 10, color: Color.Gray, offsetX: 0, offsetY: 2 })
    .onClick(() => {
      this.isPromptActionVisible = false
    })
  }
}
