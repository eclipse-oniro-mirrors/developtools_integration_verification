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
struct RichEditorSpan0015 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  private start: number = -1;
  private end: number = -1;
  @State message: string = '[-1, -1]';
  @State content: string = '';

  build() {
    Column() {
      Column(){
        Row(){
          Button('0-1段落更新样式').id('Paragraph111').onClick(() => {
            this.controller.updateParagraphStyle({
              start: 0,
              end: 1,
              style:{
                textAlign:TextAlign.Center,
                leadingMargin:10,
                wordBreak:WordBreak.NORMAL,
                lineBreakStrategy:LineBreakStrategy.BALANCED
              }
            })
          })

          Button('1-2段落更新样式').id('Paragraph222').onClick(() => {
            this.controller.updateParagraphStyle({
              start: 1,
              end: 2,
              style:
              {
                textAlign:TextAlign.Center,
                leadingMargin:10,
                wordBreak:WordBreak.NORMAL,
                lineBreakStrategy:LineBreakStrategy.BALANCED
              }
            })
          })

          Button('50-51更新样式').id('Paragraph333').onClick(() => {
            this.controller.updateParagraphStyle({
              start: 50,
              end: 51,
              style:
              {
                textAlign:TextAlign.Center,
                leadingMargin:10,
                wordBreak:WordBreak.NORMAL,
                lineBreakStrategy:LineBreakStrategy.BALANCED
              }
            })
          })
        }
      }
      .borderColor(Color.Red)
      .width('100%')

      Column() {
        RichEditor(this.options)
          .onReady(() => {
            this.controller.addTextSpan('01234567890这将是一段长文本显示，为了测试段落样式修改',
              {
                style:
                {
                  fontColor: Color.Orange,
                  fontSize: 30
                }
              })
            this.controller.addTextSpan('这将是一段长文本显示，为了测试段落样式修改01234567890',
              {
                style:
                {
                  fontColor: Color.Black,
                  fontSize: 30
                }
              })
          })
          .onSelect((value: RichEditorSelection) => {
            this.start = value.selection[0];
            this.end = value.selection[1];
            this.message = '[' + this.start + ', ' + this.end + ']';
          })
          .placeholder('input...', {
            fontColor: Color.Gray,
            font: {
              size: 16,
              weight: FontWeight.Normal,
              family: 'sans-serif',
              style: FontStyle.Normal
            }
          })
          .borderWidth(1)
          .borderColor(Color.Green)
          .width('100%')
          .height('30%')
      }
      .borderColor(Color.Red)
      .width('100%')
      .height('100%')
    }
  }
}
