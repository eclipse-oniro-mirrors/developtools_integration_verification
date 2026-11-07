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
struct UiComponentTextRichEditorAction02 {
  controller: RichEditorController = new RichEditorController();
  controller2: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  options2: RichEditorOptions = { controller: this.controller2 };
  private start: number = -1;
  private end: number = -1;
  @State message: string = '[-1, -1]'
  @State content: string = ''
  @State text: string = 'Double-click and click on the other RichEditor'

  build() {
    Column() {
      Column() {
        Text(this.text)
          .fontSize(15)
          .fontColor(0xCCCCCC)
          .width('90%')
          .border({ width: 1 })
          .lineHeight(20)
          .margin({
            right: 22,
            bottom: 15 ,
            left: 10,
            top:10
          })
          .padding(10)
          .fontColor(Color.Black)
          .fontStyle(FontStyle.Italic)
          .height(100)
      }
      .borderWidth(1)
      .borderColor(Color.Red)
      .width('100%')
      .height('20%')

      Row() {
        Button('更新样式:加粗')
          .borderRadius(8)
          .fontWeight(900)
          .fontStyle(FontStyle.Italic)
          .backgroundColor(0x317aff)
          .onClick(() => {
            this.controller.updateSpanStyle({
              start: this.start,
              end: this.end,
              textStyle:
              {
                fontWeight: FontWeight.Bolder
              }
            })
          })
          .fontSize(6)
          .width('40%')
          .backgroundColor(0x317aff)
          .labelStyle({ overflow: TextOverflow.Clip,
            maxLines: 2,
            minFontSize: 6,
            maxFontSize: 20,
            font: {
              size: 10,
              weight: FontWeight.Bolder,
              family: 'cursive',
              style: FontStyle.Italic
            }
          })
        Button('获取选择内容')
          .borderRadius(8)
          .backgroundColor(0x317aff)
          .fontWeight(900)
          .fontStyle(FontStyle.Italic)
          .onClick(() => {
            this.content = '';
            this.controller.getSpans({
              start: this.start,
              end: this.end
            }).forEach(item => {
              if(typeof(item as RichEditorImageSpanResult)['imageStyle'] != 'undefined'){
                this.content += (item as RichEditorImageSpanResult).valueResourceStr;
                this.content += '\n'
              } else {
                if(typeof(item as RichEditorTextSpanResult)['symbolSpanStyle'] != 'undefined') {
                  this.content += (item as RichEditorTextSpanResult).symbolSpanStyle?.fontSize;
                  this.content += '\n'
                }else {
                  this.content += (item as RichEditorTextSpanResult).value;
                  this.content += '\n'
                }
              }
            })
          })
      }
      .borderWidth(1)
      .borderColor(Color.Red)
      .width('100%')
      .height('10%')

      Column() {
        RichEditor(this.options2)
          .id('UiComponentTextRichEditorAction02_01')
          .onReady(() => {
            this.controller2.addTextSpan('012345',
              {
                style:
                {
                  fontColor: Color.Orange,
                  fontSize: 30
                }
              })
            this.controller2.addSymbolSpan($r('sys.symbol.ohos_trash'),
              {
                style:
                {
                  fontSize: 30
                }
              })
            this.controller2.addImageSpan($r('app.media.icon'),
              {
                imageStyle:
                {
                  size: ['57px', '57px']
                }
              })
            this.controller2.addTextSpan('56789',
              {
                style:
                {
                  fontColor: Color.Black,
                  fontSize: 30
                }
              })
          })
        RichEditor(this.options)
          .id('UiComponentTextRichEditorAction02_02')
          .onReady(() => {
            this.controller.addTextSpan('012345',
              {
                style:
                {
                  fontColor: Color.Orange,
                  fontSize: 30
                }
              })
            this.controller.addSymbolSpan($r('sys.symbol.ohos_trash'),
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
            this.message = '[' + this.start + ', ' + this.end + ']'
          })
          .aboutToIMEInput((value: RichEditorInsertValue) => {
            console.log('---------------------- aboutToIMEInput ----------------------')
            console.log('insertOffset:' + value.insertOffset)
            console.log('insertValue:' + value.insertValue)
            return true;
          })
          .onIMEInputComplete((value: RichEditorTextSpanResult) => {
            console.log('---------------------- onIMEInputComplete ---------------------')
            console.log('spanIndex:' + value.spanPosition.spanIndex)
            console.log('spanRange:[' + value.spanPosition.spanRange[0] + ',' + value.spanPosition.spanRange[1] + ']')
            console.log('offsetInSpan:[' + value.offsetInSpan[0] + ',' + value.offsetInSpan[1] + ']')
            console.log('value:' + value.value)
          })
          .aboutToDelete((value: RichEditorDeleteValue) => {
            console.log('---------------------- aboutToDelete --------------------------')
            console.log('offset:' + value.offset)
            console.log('direction:' + value.direction)
            console.log('length:' + value.length)
            value.richEditorDeleteSpans.forEach(item => {
              console.log('---------------------- item --------------------------')
              console.log('spanIndex:' + item.spanPosition.spanIndex)
              console.log('spanRange:[' + item.spanPosition.spanRange[0] + ',' + item.spanPosition.spanRange[1] + ']')
              console.log('offsetInSpan:[' + item.offsetInSpan[0] + ',' + item.offsetInSpan[1] + ']')
              if (typeof(item as RichEditorImageSpanResult)['imageStyle'] != 'undefined') {
                console.log('image:' + (item as RichEditorImageSpanResult).valueResourceStr)
              } else {
                console.log('text:' + (item as RichEditorTextSpanResult).value)
              }
            })
            return true;
          })
          .onDeleteComplete(() => {
            console.log('---------------------- onDeleteComplete ------------------------')
          })
          .placeholder('input...', {
            fontColor: Color.Gray,
            font: {
              size: 16,
              weight: FontWeight.Normal,
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