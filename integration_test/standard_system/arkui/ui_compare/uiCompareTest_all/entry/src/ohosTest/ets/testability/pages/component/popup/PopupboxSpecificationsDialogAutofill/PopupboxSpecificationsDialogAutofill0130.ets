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
struct PopupboxSpecificationsDialogAutofill0130 {
  @State inputValue: string = ''

  build() {
    Column({ space: 20 }) {
      Text('Password输入模式自动保存验证')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)

      TextInput({ placeholder: '请输入密码', text: this.inputValue })
        .id('PopupboxSpecificationsDialogAutofill0130_001')
        .type(InputType.Password)
        .width('80%')
        .height(50)
        .onChange((value: string) => {
          this.inputValue = value
        })

      Text('Password模式支持自动保存')
        .fontSize(14)
        .fontColor(Color.Green)

      Text('能够实现自动保存')
        .fontSize(12)
        .fontColor(Color.Gray)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.Center)
  }
}
