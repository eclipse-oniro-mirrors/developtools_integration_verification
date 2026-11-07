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
struct PopupboxSpecification0080 {
  @State isAlertVisible: boolean = false

  build() {
    Column() {
      Button('点击弹出有按钮警告弹窗(无蒙层)')
        .id('popup_button_0080')
        .onClick(() => {
          this.isAlertVisible = true
        })
        .margin({ top: 50 })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .backgroundColor(Color.White)
    .bindContentCover(this.isAlertVisible, this.alertDialog, {
      modalTransition: ModalTransition.NONE,
      onAppear: () => {
        console.info('Alert dialog appeared')
      },
      onDisappear: () => {
        this.isAlertVisible = false
      }
    })
  }

  @Builder
  alertDialog() {
    Column() {
      Text('警告')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })
      
      Text('这是一个有按钮警告弹窗，无蒙层')
        .fontSize(14)
        .textAlign(TextAlign.Center)
        .margin({ bottom: 20 })
      
      Row() {
        Button('取消')
          .fontSize(14)
          .backgroundColor(Color.Gray)
          .onClick(() => {
            this.isAlertVisible = false
          })
          .margin({ right: 10 })
        
        Button('确定')
          .fontSize(14)
          .backgroundColor(Color.Blue)
          .onClick(() => {
            this.isAlertVisible = false
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
