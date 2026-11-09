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
struct RichEditorSpan0014 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  private start: number = -1;
  private end: number = -1;
  @State message: string = '[-1, -1]';
  @State content: string = '';

  build() {
    Column() {
      Column() {
        Text('selection range:').width('100%')
        Text() {
          Span(this.message)
        }.width('100%')
        Text('selection content:').width('100%')
        Text() {
          Span(this.content)
        }.width('100%')
      }
      .borderWidth(1)
      .borderColor(Color.Red)
      .width('100%')
      .height('20%')

      Column(){
       Row(){
         Button('0-1更新样式:加粗').id('111').onClick(() => {
         this.controller.updateSpanStyle({
           start: 0,
           end: 1,
           textStyle:
           {
             fontWeight: FontWeight.Bolder
           }
         })
       })

         Button('1-2更新样式:加粗').id('222').onClick(() => {
           this.controller.updateSpanStyle({
             start: 1,
             end: 2,
             textStyle:
             {
               fontWeight: FontWeight.Bolder
             }
           })
         })

         Button('100-101更新样式:加粗').id('333').onClick(() => {
           this.controller.updateSpanStyle({
             start: 100,
             end: 101,
             textStyle:
             {
               fontWeight: FontWeight.Bolder
             }
           })
         })
       }

        Row(){
         Button('2-1更新样式:加粗').id('444').onClick(() => {
          this.controller.updateSpanStyle({
            start: 2,
            end: 1,
            textStyle:
            {
              fontWeight: FontWeight.Bolder
            }
          })
        })

        Button('-1--1更新样式:加粗').id('555').onClick(() => {
          this.controller.updateSpanStyle({
            start: -1,
            end: -1,
            textStyle:
            {
              fontWeight: FontWeight.Bolder
            }
          })
        })
      }
      }
      .borderColor(Color.Red)
      .width('100%')
      .height('10%')

      Column() {
        RichEditor(this.options)
          .onReady(() => {
            this.controller.addTextSpan('012345',
              {
                style:
                {
                  fontColor: Color.Orange,
                  fontSize: 30
                }
              })
            this.controller.addSymbolSpan($r('app.media.Symbolspan001'),
              {
                style:
                {
                  fontSize: 30
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
      .borderWidth(1)
      .borderColor(Color.Red)
      .width('100%')
      .height('70%')
    }
  }
}
