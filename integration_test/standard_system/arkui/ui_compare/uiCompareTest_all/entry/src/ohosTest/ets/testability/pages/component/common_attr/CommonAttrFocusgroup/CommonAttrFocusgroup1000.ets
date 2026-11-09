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
struct CommonAttrFocusgroup1000 {
  @State focusLog: string = ''

  build() {
    Navigation() {
      Column() {
        Text('SUB_ACE_UI_COMPONENT_COMMONATTR_FOCUSGROUP_1000')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        Text(this.focusLog)
          .id('commonattr_focusgroup_1000_log')
          .fontSize(12)
          .fontColor(Color.Blue)
          .margin({ bottom: 10 })

        // 焦点组1
        Column() {
          Text('焦点组1')
            .fontSize(12)
            .margin({ bottom: 5 })

          Button('btn1')
            .id('commonattr_focusgroup_1000_group1_btn1')
            .width('80%')
            .height(35)
            .margin({ bottom: 5 })
            .onFocus(() => {
              this.focusLog = '焦点组1 btn1 获得焦点'
            })

          Button('btn2')
            .id('commonattr_focusgroup_1000_group1_btn2')
            .width('80%')
            .height(35)
            .onFocus(() => {
              this.focusLog = '焦点组1 btn2 获得焦点'
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

          Button('btn1')
            .id('commonattr_focusgroup_1000_group2_btn1')
            .width('80%')
            .height(35)
            .margin({ bottom: 5 })
            .onFocus(() => {
              this.focusLog = '焦点组2 btn1 获得焦点'
            })

          Button('btn2')
            .id('commonattr_focusgroup_1000_group2_btn2')
            .width('80%')
            .height(35)
            .onFocus(() => {
              this.focusLog = '焦点组2 btn2 获得焦点'
            })
        }
        .width('90%')
        .padding(8)
        .backgroundColor('#E0E0E0')
        .borderRadius(8)
        .margin({ bottom: 8 })
        .focusScopeId('focusGroup2', true)

        // 焦点组3（无可获焦子组件，父容器组件可获焦）
        Column() {
          Text('焦点组3')
            .fontSize(12)
            .margin({ bottom: 5 })

          Text('123')
            .id('commonattr_focusgroup_1000_group3_text')
            .fontSize(14)
            .width('80%')
            .height(35)
            .textAlign(TextAlign.Center)
            .backgroundColor('#FFCCCC')
            .borderRadius(4)
        }
        .width('90%')
        .padding(8)
        .backgroundColor('#D0D0D0')
        .borderRadius(8)
        .margin({ bottom: 8 })
        .focusable(true)
        .focusScopeId('focusGroup3', true)
        .onFocus(() => {
          this.focusLog = '焦点组3 容器获得焦点'
        })

        // 焦点组4
        Column() {
          Text('焦点组4')
            .fontSize(12)
            .margin({ bottom: 5 })

          Button('btn1')
            .id('commonattr_focusgroup_1000_group4_btn1')
            .width('80%')
            .height(35)
            .margin({ bottom: 5 })
            .onFocus(() => {
              this.focusLog = '焦点组4 btn1 获得焦点'
            })

          Button('btn2')
            .id('commonattr_focusgroup_1000_group4_btn2')
            .width('80%')
            .height(35)
            .onFocus(() => {
              this.focusLog = '焦点组4 btn2 获得焦点'
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
      .padding({ top: 10 })
    }
    .title('焦点组测试')
    .mode(NavigationMode.Stack)
    .width('100%')
    .height('100%')
  }
}

