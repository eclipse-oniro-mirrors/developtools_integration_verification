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

@CustomDialog
struct CustomDialog0320 {
  controller: CustomDialogController
  onConfirm: () => void = () => {}

  build() {
    Column() {
      Text('CustomDialog弹框')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('验证先调起appbar服务页面，再调起弹框的Z序情况')
        .fontSize(14)
        .margin({ bottom: 20 })

      Button('确定')
        .id('zindex_menubar_0320_confirm')
        .onClick(() => {
          this.onConfirm()
          this.controller.close()
        })
        .margin(10)
    }
    .padding(20)
    .backgroundColor(Color.White)
    .borderRadius(10)
  }
}

@Entry
@Component
struct ZindexMenubar0320 {
  @State dialogClickResult: string = ''
  @State menuBarClicked: boolean = false

  customDialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialog0320({
      onConfirm: () => {
        this.dialogClickResult = 'CustomDialog确定按钮被点击'
      }
    }),
    autoCancel: false
  })

  aboutToAppear() {
    // 通过setTimeout设置先调起appbar服务页面，再调起customDialog弹窗
    // 先模拟触发menuBar点击（延迟100ms）
    setTimeout(() => {
      this.menuBarClicked = true
      this.dialogClickResult = 'MenuBar按钮被点击（先调起）'
    }, 100)

    // 再调起customDialog弹窗（延迟500ms）
    setTimeout(() => {
      this.customDialogController.open()
    }, 500)
  }

  showCustomDialog() {
    this.customDialogController.open()
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0320')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

      Text('先调起appbar服务页面，再调起弹框 Z序测试')
        .fontSize(14)
        .fontColor(Color.Gray)
        .margin({ bottom: 10 })

      Button('打开CustomDialog')
        .id('zindex_menubar_0320_open')
        .onClick(() => {
          this.showCustomDialog()
        })
        .margin(10)

      Button('MenuBar功能按钮')
        .id('zindex_menubar_0320_menubar')
        .onClick(() => {
          this.dialogClickResult = 'MenuBar按钮被点击'
        })
        .margin(10)

      Text(this.dialogClickResult)
        .id('zindex_menubar_0320_result')
        .fontSize(14)
        .fontColor(Color.Blue)
        .margin({ top: 20 })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
    .padding(20)
  }
}

