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
struct PopupboxSpecificationsDialogAutofill0220 {
  @State inputValue1: string = ''
  @State inputValue2: string = ''

  build() {
    Column({ space: 20 }) {
      Text('弹窗内容匹配验证')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)

      TextInput({ placeholder: '请输入密码', text: this.inputValue1 })
        .id('PopupboxSpecificationsDialogAutofill0220_001')
        .type(InputType.Password)
        .width('80%')
        .height(50)
        .onChange((value: string) => {
          this.inputValue1 = value
        })

      TextInput({ placeholder: '请输入用户名', text: this.inputValue2 })
        .id('PopupboxSpecificationsDialogAutofill0220_002')
        .type(InputType.USER_NAME)
        .width('80%')
        .height(50)
        .onChange((value: string) => {
          this.inputValue2 = value
        })

      Text('验证自动保存和自动填充功能')
        .fontSize(14)
        .fontColor(Color.Gray)

      Text('能够实现自动保存和自动填充，且输入框是匹配输入框的内容')
        .fontSize(12)
        .fontColor(Color.Gray)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.Center)
  }
}
