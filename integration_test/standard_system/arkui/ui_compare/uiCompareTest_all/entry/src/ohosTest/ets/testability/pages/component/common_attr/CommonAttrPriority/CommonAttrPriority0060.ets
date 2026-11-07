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
struct CommonAttrPriority0060 {
  @State focusLog: string = ''

  build() {
    Navigation() {
      Column() {
        Text('SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0060')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        Text('非焦点组，只设置PREVIOUS组件首次走焦获焦，非首次走焦优先级不生效')
          .fontSize(12)
          .margin({ bottom: 5 })

        Text(this.focusLog)
          .id('commonattr_priority_0060_log')
          .fontSize(12)
          .fontColor(Color.Blue)
          .margin({ bottom: 10 })

        // 非焦点组1
        Column() {
          Text('非焦点组1')
            .fontSize(12)
            .margin({ bottom: 5 })

          Button('Button1')
            .id('button_priority_0060_btn1')
            .width('80%')
            .height(20)
            .margin({ bottom: 5 })
            .onFocus(() => {
              this.focusLog = 'Button1 获得焦点'
            })

          Button('Button2')
            .id('button_priority_0060_btn2')
            .width('80%')
            .height(20)
            .onFocus(() => {
              this.focusLog = 'Button2 获得焦点'
            })
        }
        .width('90%')
        .padding(8)
        .backgroundColor('#F5F5F5')
        .borderRadius(8)
        .margin({ bottom: 8 })

        // 非焦点组2
        Column() {
          Text('非焦点组2')
            .fontSize(12)
            .margin({ bottom: 5 })

          Button('Button3')
            .id('button_priority_0060_btn3')
            .width('80%')
            .height(20)
            .margin({ bottom: 5 })
            .onFocus(() => {
              this.focusLog = 'Button3 获得焦点'
            })

          Button('Button4')
            .id('button_priority_0060_btn4')
            .width('80%')
            .height(20)
            .onFocus(() => {
              this.focusLog = 'Button4 获得焦点'
            })
        }
        .width('90%')
        .padding(8)
        .backgroundColor('#E0E0E0')
        .borderRadius(8)
        .margin({ bottom: 8 })

        // 非焦点组3
        Column() {
          Text('非焦点组3')
            .fontSize(12)
            .margin({ bottom: 5 })

          Button('Button5')
            .id('button_priority_0060_btn5')
            .width('80%')
            .height(20)
            .margin({ bottom: 5 })
            .onFocus(() => {
              this.focusLog = 'Button5 获得焦点'
            })

          Button('Button6')
            .id('button_priority_0060_btn6')
            .width('80%')
            .height(20)
            .onFocus(() => {
              this.focusLog = 'Button6 获得焦点'
            })
        }
        .width('90%')
        .padding(8)
        .backgroundColor('#D0D0D0')
        .borderRadius(8)
        .margin({ bottom: 8 })

        // 非焦点组4（只设置PREVIOUS优先级）
        Column() {
          Text('非焦点组4')
            .fontSize(12)
            .margin({ bottom: 5 })

          Button('Button7')
            .id('button_priority_0060_btn7')
            .width('80%')
            .height(20)
            .margin({ bottom: 5 })
            .onFocus(() => {
              this.focusLog = 'Button7 获得焦点'
            })

          Button('FocusPriority.PREVIOUS')
            .id('button_priority_0060_previous')
            .width('80%')
            .height(20)
            .margin({ bottom: 5 })
            .focusScopePriority('nonFocusGroup4', FocusPriority.PREVIOUS)
            .onFocus(() => {
              this.focusLog = 'FocusPriority.PREVIOUS 获得焦点'
            })
        }
        .width('90%')
        .padding(8)
        .backgroundColor('#C0C0C0')
        .borderRadius(8)
        .margin({ bottom: 8 })
        .focusScopeId('nonFocusGroup4', false)

        // 非焦点组5（用于循环走焦测试）
        Column() {
          Text('非焦点组5')
            .fontSize(12)
            .margin({ bottom: 5 })

          Button('Button9')
            .id('button_priority_0060_btn9')
            .width('80%')
            .height(20)
            .margin({ bottom: 5 })
            .onFocus(() => {
              this.focusLog = 'Button9 获得焦点'
            })

          Button('Button10')
            .id('button_priority_0060_btn10')
            .width('80%')
            .height(20)
            .onFocus(() => {
              this.focusLog = 'Button10 获得焦点'
            })
        }
        .width('90%')
        .padding(8)
        .backgroundColor('#B0B0B0')
        .borderRadius(8)
        .margin({ bottom: 8 })
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

