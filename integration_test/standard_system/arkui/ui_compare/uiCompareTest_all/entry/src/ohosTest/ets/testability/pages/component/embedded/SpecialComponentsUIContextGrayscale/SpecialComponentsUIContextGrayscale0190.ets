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
struct SpecialComponentsUIContextGrayscale0190 {
  controller: TextInputController = new TextInputController();
  @State inputValue: string = '';

  // 自定义键盘组件
  @Builder
  CustomKeyboardBuilder() {
    Column() {
      Button('x').onClick(() => {
        // 关闭自定义键盘
        this.controller.stopEditing();
      })
      Grid() {
        ForEach([1, 2, 3, 4, 5, 6, 7, 8, 9, '*', 0, '#'], (item: number | string) => {
          GridItem() {
            Button(item + '')
              .width(110).onClick(() => {
              this.inputValue += item;
            })
          }
        })
      }.maxCount(3).columnsGap(10).rowsGap(10).padding(5)
    }.backgroundColor(Color.Gray)
  }

  build() {
    Column() {
      TextInput({ controller: this.controller, text: this.inputValue })// 绑定自定义键盘
        .customKeyboard(this.CustomKeyboardBuilder())
        .margin(10)
        .border({ width: 1 })
        .height('48vp')
        .grayscale(-10)

      TextInput({ controller: this.controller, text: this.inputValue })// 绑定自定义键盘
        .customKeyboard(this.CustomKeyboardBuilder())
        .margin(10)
        .border({ width: 1 })
        .height('48vp')
        .grayscale(-1)

      TextInput({ controller: this.controller, text: this.inputValue })// 绑定自定义键盘
        .customKeyboard(this.CustomKeyboardBuilder())
        .margin(10)
        .border({ width: 1 })
        .height('48vp')
        .grayscale(0)

      TextInput({ controller: this.controller, text: this.inputValue })// 绑定自定义键盘
        .customKeyboard(this.CustomKeyboardBuilder())
        .margin(10)
        .border({ width: 1 })
        .height('48vp')
        .grayscale(0.2)

      TextInput({ controller: this.controller, text: this.inputValue })// 绑定自定义键盘
        .customKeyboard(this.CustomKeyboardBuilder())
        .margin(10)
        .border({ width: 1 })
        .height('48vp')
        .grayscale(0.5)

      TextInput({ controller: this.controller, text: this.inputValue })// 绑定自定义键盘
        .customKeyboard(this.CustomKeyboardBuilder())
        .margin(10)
        .border({ width: 1 })
        .height('48vp')
        .grayscale(0.8)

      TextInput({ controller: this.controller, text: this.inputValue })// 绑定自定义键盘
        .customKeyboard(this.CustomKeyboardBuilder())
        .margin(10)
        .border({ width: 1 })
        .height('48vp')
        .grayscale(1)

      TextInput({ controller: this.controller, text: this.inputValue })// 绑定自定义键盘
        .customKeyboard(this.CustomKeyboardBuilder())
        .margin(10)
        .border({ width: 1 })
        .height('48vp')
        .grayscale(1.5)

      TextInput({ controller: this.controller, text: this.inputValue })// 绑定自定义键盘
        .customKeyboard(this.CustomKeyboardBuilder())
        .margin(10)
        .border({ width: 1 })
        .height('48vp')
        .grayscale(100)
    }
  }
}
