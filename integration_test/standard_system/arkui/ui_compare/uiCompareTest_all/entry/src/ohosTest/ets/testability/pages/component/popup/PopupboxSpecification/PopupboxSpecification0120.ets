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
struct PopupboxSpecification0120 {
  @State isListSelectVisible: boolean = false
  @State selectedItem: string = ''
  private listItems: string[] = ['选项1', '选项2', '选项3', '选项4', '选项5']

  build() {
    Column() {
      Button('点击弹出有按钮列表选择弹窗(无蒙层)')
        .id('popup_button_0120')
        .onClick(() => {
          this.isListSelectVisible = true
        })
        .margin({ top: 50 })
      
      if (this.selectedItem) {
        Text(`已选择: ${this.selectedItem}`)
          .fontSize(16)
          .margin({ top: 20 })
      }
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .backgroundColor(Color.White)
    .bindContentCover(this.isListSelectVisible, this.listSelectDialog, {
      modalTransition: ModalTransition.NONE,
      onAppear: () => {
        console.info('List select dialog appeared')
      },
      onDisappear: () => {
        this.isListSelectVisible = false
      }
    })
  }

  @Builder
  listSelectDialog() {
    Column() {
      Text('列表选择')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 15 })
      
      Text('这是一个有按钮列表选择弹窗，无蒙层')
        .fontSize(14)
        .textAlign(TextAlign.Center)
        .margin({ bottom: 20 })
      
      List() {
        ForEach(this.listItems, (item: string, index: number) => {
          ListItem() {
            Text(item)
              .fontSize(16)
              .width('100%')
              .padding(12)
              .textAlign(TextAlign.Center)
              .backgroundColor(this.selectedItem === item ? Color.Blue : Color.Transparent)
              .fontColor(this.selectedItem === item ? Color.White : Color.Black)
              .onClick(() => {
                this.selectedItem = item
              })
          }
          .borderRadius(4)
          .margin({ bottom: 5 })
        })
      }
      .height('16.39%')
      .width('100%')
      .margin({ bottom: 20 })
      
      Row() {
        Button('取消')
          .fontSize(14)
          .backgroundColor(Color.Gray)
          .onClick(() => {
            this.isListSelectVisible = false
          })
          .margin({ right: 10 })
        
        Button('确定')
          .fontSize(14)
          .backgroundColor(Color.Blue)
          .onClick(() => {
            this.isListSelectVisible = false
          })
      }
      .justifyContent(FlexAlign.Center)
    }
    .width('38.89%')
    .padding(20)
    .backgroundColor(Color.White)
    .borderRadius(8)
    .shadow({ radius: 10, color: Color.Gray, offsetX: 0, offsetY: 2 })
  }
}
