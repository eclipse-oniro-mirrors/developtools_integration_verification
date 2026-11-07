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
struct CommonAttrTabfocus0040 {
  @State focusLog: string = ''

  build() {
    Navigation() {
      Column() {
        Text('SUB_ACE_UI_COMPONENT_COMMONATTR_TABFOCUS_0040')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        Text('焦点组设置PREVIOUS优先级，非焦点组设置PRIOR优先级')
          .fontSize(12)
          .margin({ bottom: 5 })

        Text(this.focusLog)
          .id('commonattr_tabfocus_0040_log')
          .fontSize(12)
          .fontColor(Color.Blue)
          .margin({ bottom: 10 })

        // 焦点组1（设置PREVIOUS优先级）
        Column() {
          Text('焦点组1')
            .fontSize(12)
            .margin({ bottom: 5 })

          Button('btn1')
            .id('commonattr_tabfocus_0040_btn1')
            .width('80%')
            .height(35)
            .margin({ bottom: 5 })
            .onFocus(() => {
              this.focusLog = 'btn1 获得焦点'
            })

          Button('btn2')
            .id('commonattr_tabfocus_0040_btn2')
            .width('80%')
            .height(35)
            .margin({ bottom: 5 })
            .onFocus(() => {
              this.focusLog = 'btn2 获得焦点'
            })

          Button('FocusPriority.PREVIOUS')
            .id('commonattr_tabfocus_0040_previous')
            .width('80%')
            .height(35)
            .focusScopePriority('focusGroup1', FocusPriority.PREVIOUS)
            .onFocus(() => {
              this.focusLog = 'FocusPriority.PREVIOUS 获得焦点'
            })
        }
        .width('90%')
        .padding(8)
        .backgroundColor('#F5F5F5')
        .borderRadius(8)
        .margin({ bottom: 8 })
        .focusScopeId('focusGroup1', true)

        // 非焦点组（设置PRIOR优先级）
        Column() {
          Text('非焦点组')
            .fontSize(12)
            .margin({ bottom: 5 })

          Button('btn4')
            .id('commonattr_tabfocus_0040_btn4')
            .width('80%')
            .height(35)
            .margin({ bottom: 5 })
            .onFocus(() => {
              this.focusLog = 'btn4 获得焦点'
            })

          Button('btn5')
            .id('commonattr_tabfocus_0040_btn5')
            .width('80%')
            .height(35)
            .margin({ bottom: 5 })
            .onFocus(() => {
              this.focusLog = 'btn5 获得焦点'
            })

          Button('FocusPriority.PRIOR')
            .id('commonattr_tabfocus_0040_prior')
            .width('80%')
            .height(35)
            .margin({ bottom: 5 })
            .focusScopePriority('nonFocusGroup', FocusPriority.PRIOR)
            .onFocus(() => {
              this.focusLog = 'FocusPriority.PRIOR 获得焦点'
            })

          Button('btn7')
            .id('commonattr_tabfocus_0040_btn7')
            .width('80%')
            .height(35)
            .onFocus(() => {
              this.focusLog = 'btn7 获得焦点'
            })
        }
        .width('90%')
        .padding(8)
        .backgroundColor('#E0E0E0')
        .borderRadius(8)
        .margin({ bottom: 8 })
        .focusScopeId('nonFocusGroup', false)
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Start)
      .padding({ top: 20 })
    }
    .title('焦点组优先级测试')
    .mode(NavigationMode.Stack)
    .width('100%')
    .height('100%')
  }
}

