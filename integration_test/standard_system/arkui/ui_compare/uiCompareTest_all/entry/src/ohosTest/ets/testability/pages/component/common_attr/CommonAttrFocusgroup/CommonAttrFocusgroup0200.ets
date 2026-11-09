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
struct CommonAttrFocusgroup0200 {
  @State isGroup: boolean = true
  @State focusLog: string = ''

  build() {
    Navigation() {
      Column() {
        Text('SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_0200')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        Text(this.focusLog)
          .id('commonattr_focusgroup_0200_log')
          .fontSize(12)
          .fontColor(Color.Blue)
          .margin({ bottom: 10 })

        // 焦点组1
        Column() {
          Text('焦点组1')
            .fontSize(12)
            .margin({ bottom: 5 })

          Button('Button1-1')
            .id('commonattr_focusgroup_0200_btn1_1')
            .width('80%')
            .height(40)
            .margin({ bottom: 5 })
            .onFocus(() => {
              this.focusLog = 'Button1-1 获得焦点'
            })

          Button('Button1-2')
            .id('commonattr_focusgroup_0200_btn1_2')
            .width('80%')
            .height(40)
            .margin({ bottom: 5 })
            .onFocus(() => {
              this.focusLog = 'Button1-2 获得焦点'
            })

          Button('Button1-3')
            .id('commonattr_focusgroup_0200_btn1_3')
            .width('80%')
            .height(40)
            .onFocus(() => {
              this.focusLog = 'Button1-3 获得焦点'
            })
        }
        .width('90%')
        .padding(10)
        .backgroundColor('#F5F5F5')
        .borderRadius(8)
        .margin({ bottom: 10 })
        .focusScopeId('focusGroup1', this.isGroup)

        // 非焦点组按钮
        Button('非焦点组按钮1')
          .id('commonattr_focusgroup_0200_normal_btn1')
          .width('80%')
          .height(40)
          .margin({ bottom: 10 })
          .onFocus(() => {
            this.focusLog = '非焦点组按钮1 获得焦点'
          })

        Button('非焦点组按钮2')
          .id('commonattr_focusgroup_0200_normal_btn2')
          .width('80%')
          .height(40)
          .margin({ bottom: 10 })
          .onFocus(() => {
            this.focusLog = '非焦点组按钮2 获得焦点'
          })

        // 更改焦点组isGroup按钮
        Button('更改第一个焦点组的isGroup')
          .id('commonattr_focusgroup_0200_change_isgroup')
          .width('80%')
          .height(40)
          .margin({ bottom: 10 })
          .onClick(() => {
            this.isGroup = !this.isGroup
            this.focusLog = `isGroup已改为${this.isGroup}`
          })

        Text(`当前isGroup: ${this.isGroup}`)
          .id('commonattr_focusgroup_0200_isgroup_text')
          .fontSize(12)
          .fontColor(Color.Gray)
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Start)
      .padding({ top: 20 })
    }
    .title('焦点组测试')
    .mode(NavigationMode.Stack)
    .width('100%')
    .height('100%')
  }
}

