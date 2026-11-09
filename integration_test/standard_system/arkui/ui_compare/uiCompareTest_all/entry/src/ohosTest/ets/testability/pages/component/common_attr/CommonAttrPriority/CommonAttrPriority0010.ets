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
struct CommonAttrPriority0010 {
  @State focusLog: string = ''

  build() {
    Navigation() {
      Column() {
        Text('SUB_ACE_UI_COMPONENT_COMMONATTR_PRIORITY_0010')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        Text('焦点组只设置PREVIOUS优先级的组件，tab走焦会获焦，非首次走焦，优先级依然生效')
          .fontSize(12)
          .margin({ bottom: 5 })

        Text(this.focusLog)
          .id('commonattr_priority_0010_log')
          .fontSize(12)
          .fontColor(Color.Blue)
          .margin({ bottom: 10 })

        // 焦点组1
        Column() {
          Text('焦点组1')
            .fontSize(12)
            .margin({ bottom: 5 })

          Button('Button1')
            .id('button_priority_0010_btn1')
            .width('80%')
            .height(40)
            .margin({ bottom: 5 })
            .onFocus(() => {
              this.focusLog = 'Button1 获得焦点'
            })

          Button('FocusPriority.PREVIOUS')
            .id('button_priority_0010_previous')
            .width('80%')
            .height(40)
            .margin({ bottom: 5 })
            .focusScopePriority('focusGroup1', FocusPriority.PREVIOUS)
            .onFocus(() => {
              this.focusLog = 'FocusPriority.PREVIOUS 获得焦点'
            })
        }
        .width('90%')
        .padding(10)
        .backgroundColor('#F5F5F5')
        .borderRadius(8)
        .margin({ bottom: 10 })
        .focusScopeId('focusGroup1', true)

        // 焦点组2（用于循环走焦测试）
        Column() {
          Text('焦点组2')
            .fontSize(12)
            .margin({ bottom: 5 })

          Button('Button2-1')
            .id('button_priority_0010_btn2_1')
            .width('80%')
            .height(40)
            .margin({ bottom: 5 })
            .onFocus(() => {
              this.focusLog = 'Button2-1 获得焦点'
            })

          Button('Button2-2')
            .id('button_priority_0010_btn2_2')
            .width('80%')
            .height(40)
            .onFocus(() => {
              this.focusLog = 'Button2-2 获得焦点'
            })
        }
        .width('90%')
        .padding(10)
        .backgroundColor('#E0E0E0')
        .borderRadius(8)
        .margin({ bottom: 10 })
        .focusScopeId('focusGroup2', true)
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


