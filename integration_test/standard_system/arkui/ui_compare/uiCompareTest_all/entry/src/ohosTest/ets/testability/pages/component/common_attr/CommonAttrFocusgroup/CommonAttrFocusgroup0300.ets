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
struct CommonAttrFocusgroup0300 {
  @State focusScopeId1: string = 'focusGroup1'
  @State focusLog: string = ''

  build() {
    Navigation() {
      Column() {
        Text('SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_0300')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        Text(this.focusLog)
          .id('commonattr_focusgroup_0300_log')
          .fontSize(12)
          .fontColor(Color.Blue)
          .margin({ bottom: 10 })

        // 焦点组1
        Column() {
          Text('焦点组1')
            .fontSize(12)
            .margin({ bottom: 5 })

          Button('Button1-1')
            .id('commonattr_focusgroup_0300_btn1_1')
            .width('80%')
            .height(40)
            .margin({ bottom: 5 })
            .onFocus(() => {
              this.focusLog = 'Button1-1 获得焦点'
            })

          Button('Button1-2')
            .id('commonattr_focusgroup_0300_btn1_2')
            .width('80%')
            .height(40)
            .margin({ bottom: 5 })
            .onFocus(() => {
              this.focusLog = 'Button1-2 获得焦点'
            })

          Button('Button1-3')
            .id('commonattr_focusgroup_0300_btn1_3')
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
        .focusScopeId(this.focusScopeId1, true)

        // 焦点组2（使用重复的focusScopeId）
        Column() {
          Text('焦点组2')
            .fontSize(12)
            .margin({ bottom: 5 })

          Button('btn1')
            .id('commonattr_focusgroup_0300_btn2_1')
            .width('80%')
            .height(40)
            .margin({ bottom: 5 })
            .onFocus(() => {
              this.focusLog = 'btn1 获得焦点'
            })

          Button('btn2')
            .id('commonattr_focusgroup_0300_btn2_2')
            .width('80%')
            .height(40)
            .margin({ bottom: 5 })
            .onFocus(() => {
              this.focusLog = 'btn2 获得焦点'
            })

          Button('btn3')
            .id('commonattr_focusgroup_0300_btn2_3')
            .width('80%')
            .height(40)
            .onFocus(() => {
              this.focusLog = 'btn3 获得焦点'
            })
        }
        .width('90%')
        .padding(10)
        .backgroundColor('#E0E0E0')
        .borderRadius(8)
        .margin({ bottom: 10 })
        .focusScopeId('focusGroup2', true)

        // 更改焦点组id按钮
        Button(`更改第一个焦点组的id:${this.focusScopeId1}`)
          .id('commonattr_focusgroup_0300_change_id')
          .width('80%')
          .height(40)
          .margin({ bottom: 10 })
          .onClick(() => {
            if (this.focusScopeId1 === 'focusGroup1') {
              this.focusScopeId1 = 'focusGroup2'
              this.focusLog = '焦点组1的id已改为focusGroup2（与焦点组2重复）'
            } else {
              this.focusScopeId1 = 'focusGroup1'
              this.focusLog = '焦点组1的id已改为focusGroup1'
            }
          })

        Text(`当前焦点组1的id: ${this.focusScopeId1}`)
          .id('commonattr_focusgroup_0300_id_text')
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

