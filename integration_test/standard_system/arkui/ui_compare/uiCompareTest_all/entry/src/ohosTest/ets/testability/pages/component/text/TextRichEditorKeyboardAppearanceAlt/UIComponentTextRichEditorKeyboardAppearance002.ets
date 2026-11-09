/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
@Entry
@Component
struct UIComponentTextRichEditorKeyboardAppearance002 {
  @State name: string = 'UIComponentTextRichEditorKeyboardAppearance002';
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };

  build() {
    Column() {
      Column() {
        RichEditor(this.options)
          .onReady(() => {
            this.controller.addTextSpan('012345678901234567890123456789',
              {
                style:
                {
                  fontColor: Color.Orange,
                  fontSize: 25
                }
              })
          })
          .placeholder('input...', {
            fontColor: Color.Gray,
            font: {
              size: 16,
              weight: FontWeight.Normal,
              style: FontStyle.Normal
            }
          })
          .id(this.name + '_01')
          .keyboardAppearance(KeyboardAppearance.DARK_IMMERSIVE)
          .borderWidth(5)
          .borderColor(Color.Green)
          .width('100%')

      }
      .width('100%')
      .height('70%')
    }
  }
}
