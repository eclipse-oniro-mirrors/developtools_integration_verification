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
struct CommonAttrPriority0020 {
  @State focusLog: string = ''

  build() {
    Navigation() {
      Column() {
        Text('SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0020')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        Text('焦点组只设置PRIOR优先级的组件，tab走焦会获焦，非首次走焦，优先级依然生效')
          .fontSize(12)
          .margin({ bottom: 5 })

        Text(this.focusLog)
          .id('commonattr_priority_0020_log')
          .fontSize(12)
          .fontColor(Color.Blue)
          .margin({ bottom: 10 })

        // 焦点组1
        Column() {
          Text('焦点组1')
            .fontSize(12)
            .margin({ bottom: 5 })

          Button('Button1')
            .id('button_priority_0020_btn1')
            .width('80%')
            .height(35)
            .margin({ bottom: 5 })
            .onFocus(() => {
              this.focusLog = 'Button1 获得焦点'
            })

          Button('Button2')
            .id('button_priority_0020_btn2')
            .width('80%')
            .height(35)
            .onFocus(() => {
              this.focusLog = 'Button2 获得焦点'
            })
        }
        .width('90%')
        .padding(8)
        .backgroundColor('#F5F5F5')
        .borderRadius(8)
        .margin({ bottom: 8 })
        .focusScopeId('focusGroup1', true)

        // 焦点组2
        Column() {
          Text('焦点组2')
            .fontSize(12)
            .margin({ bottom: 5 })

          Button('Button3')
            .id('button_priority_0020_btn3')
            .width('80%')
            .height(35)
            .margin({ bottom: 5 })
            .onFocus(() => {
              this.focusLog = 'Button3 获得焦点'
            })

          Button('Button4')
            .id('button_priority_0020_btn4')
            .width('80%')
            .height(35)
            .onFocus(() => {
              this.focusLog = 'Button4 获得焦点'
            })
        }
        .width('90%')
        .padding(8)
        .backgroundColor('#E0E0E0')
        .borderRadius(8)
        .margin({ bottom: 8 })
        .focusScopeId('focusGroup2', true)

        // 焦点组3（设置PRIOR优先级）
        Column() {
          Text('焦点组3')
            .fontSize(12)
            .margin({ bottom: 5 })

          Button('Button6')
            .id('button_priority_0020_btn6')
            .width('80%')
            .height(35)
            .margin({ bottom: 5 })
            .onFocus(() => {
              this.focusLog = 'Button6 获得焦点'
            })

          Button('FocusPriority.PRIOR')
            .id('button_priority_0020_prior')
            .width('80%')
            .height(35)
            .margin({ bottom: 5 })
            .focusScopePriority('focusGroup3', FocusPriority.PRIOR)
            .onFocus(() => {
              this.focusLog = 'FocusPriority.PRIOR 获得焦点'
            })
        }
        .width('90%')
        .padding(8)
        .backgroundColor('#D0D0D0')
        .borderRadius(8)
        .margin({ bottom: 8 })
        .focusScopeId('focusGroup3', true)

        // 焦点组4（用于循环走焦测试）
        Column() {
          Text('焦点组4')
            .fontSize(12)
            .margin({ bottom: 5 })

          Button('Button7')
            .id('button_priority_0020_btn7')
            .width('80%')
            .height(35)
            .margin({ bottom: 5 })
            .onFocus(() => {
              this.focusLog = 'Button7 获得焦点'
            })

          Button('Button8')
            .id('button_priority_0020_btn8')
            .width('80%')
            .height(35)
            .onFocus(() => {
              this.focusLog = 'Button8 获得焦点'
            })
        }
        .width('90%')
        .padding(8)
        .backgroundColor('#C0C0C0')
        .borderRadius(8)
        .margin({ bottom: 8 })
        .focusScopeId('focusGroup4', true)
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

