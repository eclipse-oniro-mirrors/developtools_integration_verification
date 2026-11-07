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
struct SubCustomDialog0260 {
  controller: CustomDialogController
  onConfirm: () => void = () => {}

  build() {
    Column() {
      Text('SubCustomDialog弹框')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('验证SubCustomDialog的Z序情况')
        .fontSize(14)
        .margin({ bottom: 20 })

      Button('确定')
        .id('zindex_menubar_0260_sub_confirm')
        .onClick(() => {
          this.onConfirm()
          this.controller.close()
        })
        .margin(10)
    }
    .padding(20)
  }
}

@CustomDialog
struct CustomDialog0260 {
  controller: CustomDialogController
  onConfirm: () => void = () => {}
  @State subDialogResult: string = ''

  subDialogController: CustomDialogController = new CustomDialogController({
    builder: SubCustomDialog0260({
      onConfirm: () => {
        this.subDialogResult = 'SubCustomDialog确定按钮被点击'
        this.onConfirm()
      }
    }),
    autoCancel: false
  })

  build() {
    Column() {
      Text('CustomDialog弹框')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('点击下方按钮调起SubCustomDialog')
        .fontSize(14)
        .margin({ bottom: 20 })

      Button('打开SubCustomDialog')
        .id('zindex_menubar_0260_open_sub')
        .onClick(() => {
          this.subDialogController.open()
        })
        .margin(10)

      Button('关闭')
        .id('zindex_menubar_0260_close')
        .onClick(() => {
          this.controller.close()
        })
        .margin(10)
    }
    .padding(20)
  }
}

@Entry
@Component
struct ZindexMenubar0260 {
  @State dialogClickResult: string = ''
  @State isSheetVisible: boolean = true

  customDialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialog0260({
      onConfirm: () => {
        this.dialogClickResult = 'SubCustomDialog确定按钮被点击'
      }
    }),
    autoCancel: false
  })

  @Builder
  SheetBuilder() {
    Column() {
      Text('BindSheet弹框')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('点击下方按钮调起CustomDialog')
        .fontSize(14)
        .margin({ bottom: 20 })

      Button('打开CustomDialog')
        .id('zindex_menubar_0260_open_custom')
        .onClick(() => {
          this.customDialogController.open()
        })
        .margin(10)
    }
    .width('100%')
    .padding(20)
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_ATTRIBUTES_ZINDEX_MENUBAR_0260')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

      Text('bindSheet->CustomDialog->SubCustomDialog Z序测试')
        .fontSize(14)
        .fontColor(Color.Gray)
        .margin({ bottom: 10 })

      Button('打开BindSheet')
        .id('zindex_menubar_0260_open')
        .onClick(() => {
          this.isSheetVisible = true
        })
        .margin(10)
        .bindSheet($$this.isSheetVisible, this.SheetBuilder(), {
          height: 300,
          dragBar: true,
          showClose: true
        })

      Button('MenuBar功能按钮')
        .id('zindex_menubar_0260_menubar')
        .onClick(() => {
          this.dialogClickResult = 'MenuBar按钮被点击'
        })
        .margin(10)

      Text(this.dialogClickResult)
        .id('zindex_menubar_0260_result')
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

