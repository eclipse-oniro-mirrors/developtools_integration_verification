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
struct PopupboxSpecificationsDialogAutofill0210 {
  @State inputValue: string = ''

  build() {
    Column({ space: 20 }) {
      Text('弹窗可配置键盘验证')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)

      TextInput({ placeholder: '点击弹出输入法', text: this.inputValue })
        .id('PopupboxSpecificationsDialogAutofill0210_001')
        .width('80%')
        .height(50)
        .onChange((value: string) => {
          this.inputValue = value
        })

      Text('点击输入框弹出输入法')
        .fontSize(14)
        .fontColor(Color.Gray)

      Text('验证弹窗可以配置键盘')
        .fontSize(12)
        .fontColor(Color.Gray)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.Center)
  }
}
