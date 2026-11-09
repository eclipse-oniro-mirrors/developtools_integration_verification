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
struct CommonAttrTabfocus0070 {
  @State focusLog: string = ''
  @State showPopup: boolean = false

  @Builder
  popupBuilder() {
    Column() {
      Button('btn1')
        .id('commonattr_tabfocus_0070_popup_btn1')
        .width('90%')
        .height(35)
        .margin({ bottom: 8 })
        .onFocus(() => {
          this.focusLog = 'popup btn1 获得焦点'
        })

      Button('btn2')
        .id('commonattr_tabfocus_0070_popup_btn2')
        .width('90%')
        .height(35)
        .margin({ bottom: 8 })
        .onFocus(() => {
          this.focusLog = 'popup btn2 获得焦点'
        })

      Button('btn3')
        .id('commonattr_tabfocus_0070_popup_btn3')
        .width('90%')
        .height(35)
        .onFocus(() => {
          this.focusLog = 'popup btn3 获得焦点'
        })
    }
    .width('100%')
    .padding(10)
  }

  build() {
    Navigation() {
      Column() {
        Text('SUB_ACE_UI_COMPONENT_COMMONATTR_TABFOCUS_0070')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        Text('popup组件中，tab键走焦')
          .fontSize(12)
          .margin({ bottom: 5 })

        Text(this.focusLog)
          .id('commonattr_tabfocus_0070_log')
          .fontSize(12)
          .fontColor(Color.Blue)
          .margin({ bottom: 10 })

        Button('ComponentPopupOption1')
          .id('commonattr_tabfocus_0070_open_popup')
          .width('80%')
          .height(40)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.showPopup = !this.showPopup
          })
          .bindPopup(this.showPopup, {
            builder: this.popupBuilder(),
            placement: Placement.Bottom,
            onStateChange: (e) => {
              if (!e.isVisible) {
                this.showPopup = false
              }
            }
          })

        Button('btn4')
          .id('commonattr_tabfocus_0070_btn4')
          .width('80%')
          .height(40)
          .margin({ bottom: 10 })
          .onFocus(() => {
            this.focusLog = 'btn4 获得焦点'
          })

        Button('btn5')
          .id('commonattr_tabfocus_0070_btn5')
          .width('80%')
          .height(40)
          .margin({ bottom: 10 })
          .onFocus(() => {
            this.focusLog = 'btn5 获得焦点'
          })
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Start)
      .padding({ top: 20 })
    }
    .title('Popup焦点测试')
    .mode(NavigationMode.Stack)
    .width('100%')
    .height('100%')
  }
}

