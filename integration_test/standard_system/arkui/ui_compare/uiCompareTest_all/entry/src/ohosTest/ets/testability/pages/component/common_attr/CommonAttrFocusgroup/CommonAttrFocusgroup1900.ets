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
struct CommonAttrFocusgroup1900 {
  @State focusLog: string = ''
  @State showPopup: boolean = false

  @Builder
  PopupBuilder() {
    Column() {
      Text('Popup弹窗')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      // 焦点组1
      Column() {
        Text('焦点组1')
          .fontSize(12)
          .margin({ bottom: 5 })

        Button('btn1')
          .id('commonattr_focusgroup_1900_popup_btn1')
          .width('80%')
          .height(30)
          .margin({ bottom: 5 })
          .onFocus(() => {
            this.focusLog = 'btn1 获得焦点'
          })

        Button('btn2')
          .id('commonattr_focusgroup_1900_popup_btn2')
          .width('80%')
          .height(30)
          .margin({ bottom: 5 })
          .onFocus(() => {
            this.focusLog = 'btn2 获得焦点'
          })
      }
      .width('90%')
      .padding(8)
      .backgroundColor('#F5F5F5')
      .borderRadius(8)
      .margin({ bottom: 8 })
      .focusScopeId('popupFocusGroup1', true)

      // 焦点组2
      Column() {
        Text('焦点组2')
          .fontSize(12)
          .margin({ bottom: 5 })

        Button('btn3')
          .id('commonattr_focusgroup_1900_popup_btn3')
          .width('80%')
          .height(30)
          .margin({ bottom: 5 })
          .onFocus(() => {
            this.focusLog = 'btn3 获得焦点'
          })

        Button('btn4')
          .id('commonattr_focusgroup_1900_popup_btn4')
          .width('80%')
          .height(30)
          .onFocus(() => {
            this.focusLog = 'btn4 获得焦点'
          })
      }
      .width('90%')
      .padding(8)
      .backgroundColor('#E0E0E0')
      .borderRadius(8)
      .focusScopeId('popupFocusGroup2', true)
    }
    .width('100%')
    .padding(10)
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_1900')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 10 })

      Text('popup页面')
        .fontSize(12)
        .margin({ bottom: 5 })

      Text(this.focusLog)
        .id('commonattr_focusgroup_1900_log')
        .fontSize(12)
        .fontColor(Color.Blue)
        .margin({ bottom: 10 })

      // CustomPopupOption1按钮（子窗口）
      Button('CustomPopupOption1')
        .id('commonattr_focusgroup_1900_open_popup')
        .width('80%')
        .height(40)
        .margin({ bottom: 10 })
        .onClick(() => {
          this.showPopup = !this.showPopup
        })
        .bindPopup(this.showPopup, {
          builder: this.PopupBuilder,
          placement: Placement.Bottom,
          showInSubWindow: true,
          onStateChange: (e) => {
            if (!e.isVisible) {
              this.showPopup = false
            }
          }
        })
        .onFocus(() => {
          this.focusLog = 'CustomPopupOption1按钮 获得焦点'
        })

      Button('其他按钮')
        .id('commonattr_focusgroup_1900_other_btn')
        .width('80%')
        .height(40)
        .margin({ bottom: 10 })
        .onFocus(() => {
          this.focusLog = '其他按钮 获得焦点'
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .padding({ top: 20 })
  }
}

