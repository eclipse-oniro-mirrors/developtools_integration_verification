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
struct CommonAttrPriority0100 {
  @State focusLog: string = ''

  build() {
    Navigation() {
      Column() {

        // 非焦点组1-11（普通非焦点组，每组2个按钮）
        Column() {
          Button('Button1').id('button_priority_0100_btn1').width('80%').height(15).margin({ bottom: 0 })
            .onFocus(() => { this.focusLog = 'Button1 获得焦点' })
          Button('Button2').id('button_priority_0100_btn2').width('80%').height(15)
            .onFocus(() => { this.focusLog = 'Button2 获得焦点' })
        }.width('90%').padding(6).backgroundColor('#F5F5F5').borderRadius(8).margin({ bottom: 0 })

        Column() {
          Button('Button3').id('button_priority_0100_btn3').width('80%').height(15).margin({ bottom: 0 })
            .onFocus(() => { this.focusLog = 'Button3 获得焦点' })
          Button('Button4').id('button_priority_0100_btn4').width('80%').height(15)
            .onFocus(() => { this.focusLog = 'Button4 获得焦点' })
        }.width('90%').padding(6).backgroundColor('#F0F0F0').borderRadius(8).margin({ bottom: 0 })

        Column() {
          Button('Button5').id('button_priority_0100_btn5').width('80%').height(15).margin({ bottom: 0 })
            .onFocus(() => { this.focusLog = 'Button5 获得焦点' })
          Button('Button6').id('button_priority_0100_btn6').width('80%').height(15)
            .onFocus(() => { this.focusLog = 'Button6 获得焦点' })
        }.width('90%').padding(6).backgroundColor('#EBEBEB').borderRadius(8).margin({ bottom: 0 })

        Column() {
          Button('Button7').id('button_priority_0100_btn7').width('80%').height(15).margin({ bottom: 0 })
            .onFocus(() => { this.focusLog = 'Button7 获得焦点' })
          Button('Button8').id('button_priority_0100_btn8').width('80%').height(15)
            .onFocus(() => { this.focusLog = 'Button8 获得焦点' })
        }.width('90%').padding(6).backgroundColor('#E6E6E6').borderRadius(8).margin({ bottom: 0 })

        Column() {
          Button('Button9').id('button_priority_0100_btn9').width('80%').height(15).margin({ bottom: 0 })
            .onFocus(() => { this.focusLog = 'Button9 获得焦点' })
          Button('Button10').id('button_priority_0100_btn10').width('80%').height(15)
            .onFocus(() => { this.focusLog = 'Button10 获得焦点' })
        }.width('90%').padding(6).backgroundColor('#E0E0E0').borderRadius(8).margin({ bottom: 0 })

        Column() {
          Button('Button11').id('button_priority_0100_btn11').width('80%').height(15).margin({ bottom: 0 })
            .onFocus(() => { this.focusLog = 'Button11 获得焦点' })
          Button('Button12').id('button_priority_0100_btn12').width('80%').height(15)
            .onFocus(() => { this.focusLog = 'Button12 获得焦点' })
        }.width('90%').padding(6).backgroundColor('#DBDBDB').borderRadius(8).margin({ bottom: 0 })

        Column() {
          Button('Button13').id('button_priority_0100_btn13').width('80%').height(15).margin({ bottom: 0 })
            .onFocus(() => { this.focusLog = 'Button13 获得焦点' })
          Button('Button14').id('button_priority_0100_btn14').width('80%').height(15)
            .onFocus(() => { this.focusLog = 'Button14 获得焦点' })
        }.width('90%').padding(6).backgroundColor('#D6D6D6').borderRadius(8).margin({ bottom: 0 })

        Column() {
          Button('Button15').id('button_priority_0100_btn15').width('80%').height(15).margin({ bottom: 0 })
            .onFocus(() => { this.focusLog = 'Button15 获得焦点' })
          Button('Button16').id('button_priority_0100_btn16').width('80%').height(15)
            .onFocus(() => { this.focusLog = 'Button16 获得焦点' })
        }.width('90%').padding(6).backgroundColor('#D0D0D0').borderRadius(8).margin({ bottom: 0 })

        Column() {
          Button('Button17').id('button_priority_0100_btn17').width('80%').height(15).margin({ bottom: 0 })
            .onFocus(() => { this.focusLog = 'Button17 获得焦点' })
          Button('Button18').id('button_priority_0100_btn18').width('80%').height(15)
            .onFocus(() => { this.focusLog = 'Button18 获得焦点' })
        }.width('90%').padding(6).backgroundColor('#CBCBCB').borderRadius(8).margin({ bottom: 0 })

        Column() {
          Button('Button19').id('button_priority_0100_btn19').width('80%').height(15).margin({ bottom: 0 })
            .onFocus(() => { this.focusLog = 'Button19 获得焦点' })
          Button('Button20').id('button_priority_0100_btn20').width('80%').height(15)
            .onFocus(() => { this.focusLog = 'Button20 获得焦点' })
        }.width('90%').padding(6).backgroundColor('#C6C6C6').borderRadius(8).margin({ bottom: 0 })

        Column() {
          Button('Button21').id('button_priority_0100_btn21').width('80%').height(15).margin({ bottom: 0 })
            .onFocus(() => { this.focusLog = 'Button21 获得焦点' })
          Button('Button22').id('button_priority_0100_btn22').width('80%').height(15)
            .onFocus(() => { this.focusLog = 'Button22 获得焦点' })
        }.width('90%').padding(6).backgroundColor('#C0C0C0').borderRadius(8).margin({ bottom: 0 })

        // 非焦点组12（设置PRIOR、PRIOR优先级和不设置优先级组件）
        Column() {


          Button('不设置')
            .id('button_priority_0100_none')
            .width('80%')
            .height(15)
            .margin({ bottom: 0 })
            .onFocus(() => {
              this.focusLog = '不设置 获得焦点'
            })

          Button('FocusPriority.PRIOR1')
            .id('button_priority_0100_prior1')
            .width('80%')
            .height(15)
            .margin({ bottom: 0 })
            .focusScopePriority('nonFocusGroup12', FocusPriority.PRIOR)
            .onFocus(() => {
              this.focusLog = 'FocusPriority.PRIOR1 获得焦点'
            })

          Button('FocusPriority.PRIOR2')
            .id('button_priority_0100_prior2')
            .width('80%')
            .height(15)
            .margin({ bottom: 0 })
            .focusScopePriority('nonFocusGroup12', FocusPriority.PRIOR)
            .onFocus(() => {
              this.focusLog = 'FocusPriority.PRIOR2 获得焦点'
            })
        }
        .width('90%')
        .padding(6)
        .backgroundColor('#B0B0B0')
        .borderRadius(8)
        .margin({ bottom: 0 })
        .focusScopeId('nonFocusGroup12', false)

        // 非焦点组13（用于循环走焦测试）
        Column() {
          Button('Button23').id('button_priority_0100_btn23').width('80%').height(15).margin({ bottom: 0 })
            .onFocus(() => { this.focusLog = 'Button23 获得焦点' })
          Button('Button24').id('button_priority_0100_btn24').width('80%').height(15)
            .onFocus(() => { this.focusLog = 'Button24 获得焦点' })
        }.width('90%').padding(6).backgroundColor('#A0A0A0').borderRadius(8).margin({ bottom: 0 })
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

