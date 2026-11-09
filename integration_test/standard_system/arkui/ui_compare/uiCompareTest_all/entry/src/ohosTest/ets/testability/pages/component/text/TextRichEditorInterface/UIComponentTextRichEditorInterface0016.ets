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
struct UIComponentTextRichEditorInterface0016 {
  @State name: string = 'UIComponentTextRichEditorInterface0016';
  @State message: string = 'Click button to get caret offset.'
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };

  build() {
    Column() {
      Column() {
        RichEditor(this.options)
          .onReady(() => {
            this.controller.addTextSpan('012345',
              {
                style:
                {
                  fontColor: Color.Orange,
                  fontSize: 25
                }
              })
            this.controller.addSymbolSpan($r('sys.symbol.ohos_trash'),
              {
                style:
                {
                  fontSize: 25
                }
              })
            this.controller.addImageSpan($r('app.media.icon'),
              {
                imageStyle:
                {
                  size: ['57px', '57px']
                }
              })
            this.controller.addTextSpan('56789',
              {
                style:
                {
                  fontColor: Color.Black,
                  fontSize: 25
                }
              })
            this.controller.setTypingStyle(
              {
                fontWeight: 'medium',
                fontColor: Color.Blue,
                fontSize: 50,
                fontStyle: FontStyle.Italic,
                decoration: { type: TextDecorationType.Underline, color: Color.Green }
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
          .borderWidth(5)
          .borderColor(Color.Green)
          .width('100%')

        Text(this.message)
          .margin({top: 10})

        Button('getCaretOffset')
          .id(this.name + '_02')
          .onClick(() => {
            console.log(JSON.stringify(this.controller.getCaretOffset()))
            this.message = 'CaretOffset: ' + JSON.stringify(this.controller.getCaretOffset());
          })
          .margin({bottom: 10})
      }
      .width('100%')
      .height('70%')
    }
  }
}
