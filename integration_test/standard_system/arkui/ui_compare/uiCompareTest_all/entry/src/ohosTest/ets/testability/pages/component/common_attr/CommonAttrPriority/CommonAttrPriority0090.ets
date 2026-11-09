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
struct CommonAttrPriority0090 {
  @State focusLog: string = ''

  build() {
    Navigation() {
      Column() {

        // 非焦点组1-8（普通非焦点组）
        Column() {

          Button('Button1')
            .id('button_priority_0090_btn1')
            .width('80%')
            .height(15)
            .margin({ bottom: 0 })
            .onFocus(() => {
              this.focusLog = 'Button1 获得焦点'
            })

          Button('Button2')
            .id('button_priority_0090_btn2')
            .width('80%')
            .height(15)
            .onFocus(() => {
              this.focusLog = 'Button2 获得焦点'
            })
        }
        .width('90%')
        .padding(8)
        .backgroundColor('#F5F5F5')
        .borderRadius(8)
        .margin({ bottom: 0 })

        Column() {
          Button('Button3')
            .id('button_priority_0090_btn3')
            .width('80%')
            .height(15)
            .margin({ bottom: 0 })
            .onFocus(() => {
              this.focusLog = 'Button3 获得焦点'
            })

          Button('Button4')
            .id('button_priority_0090_btn4')
            .width('80%')
            .height(15)
            .onFocus(() => {
              this.focusLog = 'Button4 获得焦点'
            })
        }
        .width('90%')
        .padding(8)
        .backgroundColor('#EEEEEE')
        .borderRadius(8)
        .margin({ bottom: 0 })

        Column() {

          Button('Button5')
            .id('button_priority_0090_btn5')
            .width('80%')
            .height(15)
            .margin({ bottom: 0 })
            .onFocus(() => {
              this.focusLog = 'Button5 获得焦点'
            })

          Button('Button6')
            .id('button_priority_0090_btn6')
            .width('80%')
            .height(15)
            .onFocus(() => {
              this.focusLog = 'Button6 获得焦点'
            })
        }
        .width('90%')
        .padding(8)
        .backgroundColor('#E8E8E8')
        .borderRadius(8)
        .margin({ bottom: 0 })

        Column() {

          Button('Button7')
            .id('button_priority_0090_btn7')
            .width('80%')
            .height(15)
            .margin({ bottom: 0 })
            .onFocus(() => {
              this.focusLog = 'Button7 获得焦点'
            })

          Button('Button8')
            .id('button_priority_0090_btn8')
            .width('80%')
            .height(15)
            .onFocus(() => {
              this.focusLog = 'Button8 获得焦点'
            })
        }
        .width('90%')
        .padding(8)
        .backgroundColor('#E0E0E0')
        .borderRadius(8)
        .margin({ bottom: 0 })

        Column() {

          Button('Button9')
            .id('button_priority_0090_btn9')
            .width('80%')
            .height(15)
            .margin({ bottom: 0 })
            .onFocus(() => {
              this.focusLog = 'Button9 获得焦点'
            })

          Button('Button10')
            .id('button_priority_0090_btn10')
            .width('80%')
            .height(15)
            .onFocus(() => {
              this.focusLog = 'Button10 获得焦点'
            })
        }
        .width('90%')
        .padding(8)
        .backgroundColor('#d7d7d7')
        .borderRadius(8)
        .margin({ bottom: 0 })

        Column() {

          Button('Button11')
            .id('button_priority_0090_btn11')
            .width('80%')
            .height(15)
            .margin({ bottom: 0 })
            .onFocus(() => {
              this.focusLog = 'Button11 获得焦点'
            })

          Button('Button12')
            .id('button_priority_0090_btn12')
            .width('80%')
            .height(15)
            .onFocus(() => {
              this.focusLog = 'Button12 获得焦点'
            })
        }
        .width('90%')
        .padding(8)
        .backgroundColor('#D0D0D0')
        .borderRadius(8)
        .margin({ bottom: 0 })

        Column() {

          Button('Button13')
            .id('button_priority_0090_btn13')
            .width('80%')
            .height(15)
            .margin({ bottom: 0 })
            .onFocus(() => {
              this.focusLog = 'Button13 获得焦点'
            })

          Button('Button14')
            .id('button_priority_0090_btn14')
            .width('80%')
            .height(15)
            .onFocus(() => {
              this.focusLog = 'Button14 获得焦点'
            })
        }
        .width('90%')
        .padding(8)
        .backgroundColor('#C8C8C8')
        .borderRadius(8)
        .margin({ bottom: 0 })

        Column() {

          Button('Button15')
            .id('button_priority_0090_btn15')
            .width('80%')
            .height(15)
            .margin({ bottom: 0 })
            .onFocus(() => {
              this.focusLog = 'Button15 获得焦点'
            })

          Button('Button16')
            .id('button_priority_0090_btn16')
            .width('80%')
            .height(15)
            .onFocus(() => {
              this.focusLog = 'Button16 获得焦点'
            })
        }
        .width('90%')
        .padding(8)
        .backgroundColor('#C0C0C0')
        .borderRadius(8)
        .margin({ bottom: 0 })

        // 非焦点组9（同时设置PRIOR、PREVIOUS优先级和不设置优先级组件）
        Column() {

          Button('不设置')
            .id('button_priority_0090_none')
            .width('80%')
            .height(15)
            .margin({ bottom: 0 })
            .onFocus(() => {
              this.focusLog = '不设置 获得焦点'
            })

          Button('FocusPriority.PREVIOUS')
            .id('button_priority_0090_previous')
            .width('80%')
            .height(15)
            .margin({ bottom: 0 })
            .focusScopePriority('nonFocusGroup9', FocusPriority.PREVIOUS)
            .onFocus(() => {
              this.focusLog = 'FocusPriority.PREVIOUS 获得焦点'
            })

          Button('FocusPriority.PRIOR')
            .id('button_priority_0090_prior')
            .width('80%')
            .height(15)
            .margin({ bottom: 0 })
            .focusScopePriority('nonFocusGroup9', FocusPriority.PRIOR)
            .onFocus(() => {
              this.focusLog = 'FocusPriority.PRIOR 获得焦点'
            })
        }
        .width('90%')
        .padding(8)
        .backgroundColor('#B0B0B0')
        .borderRadius(8)
        .margin({ bottom: 0 })
        .focusScopeId('nonFocusGroup9', false)

        // 非焦点组10（用于循环走焦测试）
        Column() {

          Button('Button17')
            .id('button_priority_0090_btn17')
            .width('80%')
            .height(15)
            .margin({ bottom: 0 })
            .onFocus(() => {
              this.focusLog = 'Button17 获得焦点'
            })

          Button('Button18')
            .id('button_priority_0090_btn18')
            .width('80%')
            .height(15)
            .onFocus(() => {
              this.focusLog = 'Button18 获得焦点'
            })
        }
        .width('90%')
        .padding(8)
        .backgroundColor('#A0A0A0')
        .borderRadius(8)
        .margin({ bottom: 0 })
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Start)
      .padding({ top: 20 })
    }
    .title('FocusPriority')
    .mode(NavigationMode.Stack)
    .width('100%')
    .height('100%')
  }
}

