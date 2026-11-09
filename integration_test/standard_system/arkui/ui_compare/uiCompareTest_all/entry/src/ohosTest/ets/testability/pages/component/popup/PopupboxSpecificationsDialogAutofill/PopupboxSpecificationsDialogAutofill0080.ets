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
struct PopupboxSpecificationsDialogAutofill0080 {
  @State inputValue: string = ''

  build() {
    Column({ space: 20 }) {
      Text('NUMBER_DECIMAL输入模式自动填充验证')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)

      TextInput({ placeholder: '请输入小数', text: this.inputValue })
        .id('PopupboxSpecificationsDialogAutofill0080_001')
        .type(InputType.NUMBER_DECIMAL)
        .width('80%')
        .height(50)
        .onChange((value: string) => {
          this.inputValue = value
        })

      Text('NUMBER_DECIMAL模式不支持自动填充')
        .fontSize(14)
        .fontColor(Color.Gray)

      Text('目前只支持NEW_PASSWORD、password、NEW_USERNAME')
        .fontSize(12)
        .fontColor(Color.Gray)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.Center)
  }
}
