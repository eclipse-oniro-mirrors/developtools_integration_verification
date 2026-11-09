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
struct CommonAttrTabfocus0010 {
  @State focusLog: string = ''

  build() {
    Navigation() {
      Column() {
        Text('SUB_ACE_UI_COMPONENT_COMMONATTR_TABFOCUS_0010')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ bottom: 10 })

        Text('按tab键走焦，页面焦点组中设置默认获焦组件首个获焦')
          .fontSize(12)
          .margin({ bottom: 5 })

        Text(this.focusLog)
          .id('commonattr_tabfocus_0010_log')
          .fontSize(12)
          .fontColor(Color.Blue)
          .margin({ bottom: 10 })

        // 焦点组
        Column() {
          Text('焦点组')
            .fontSize(12)
            .margin({ bottom: 5 })

          Button('Button1')
            .id('commonattr_tabfocus_0010_btn1')
            .width('80%')
            .height(40)
            .margin({ bottom: 5 })
            .onFocus(() => {
              this.focusLog = 'Button1 获得焦点'
            })

          Button('defaultFocus：true')
            .id('commonattr_tabfocus_0010_default_focus')
            .width('80%')
            .height(40)
            .margin({ bottom: 5 })
            .defaultFocus(true)
            .onFocus(() => {
              this.focusLog = 'defaultFocus：true 获得焦点'
            })

          Button('Button3')
            .id('commonattr_tabfocus_0010_btn3')
            .width('80%')
            .height(40)
            .onFocus(() => {
              this.focusLog = 'Button3 获得焦点'
            })
        }
        .width('90%')
        .padding(10)
        .backgroundColor('#F5F5F5')
        .borderRadius(8)
        .margin({ bottom: 10 })
        .focusScopeId('focusGroup1', true)
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
