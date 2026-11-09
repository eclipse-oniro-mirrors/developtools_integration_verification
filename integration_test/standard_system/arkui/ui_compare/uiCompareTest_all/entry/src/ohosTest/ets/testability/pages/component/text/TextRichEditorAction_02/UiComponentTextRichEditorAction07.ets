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
struct UiComponentTextRichEditorAction07 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  private start: number = -1;
  private end: number = -1;
  @State message: string = '[-1, -1]'
  @State content: string = ''
  @State text: string = 'Set the row height to exceed the time to observe the cursor position'
  @State lineheight:number = 50
  @State letterspacing:number = 20
  @State fontsize:number = 30

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
        Button('改变行高')
          .id('UiComponentTextRichEditorAction07_01')
          .labelStyle({ overflow: TextOverflow.Clip,
            maxLines: 2,
            minFontSize: 10,
            maxFontSize: 20,
            font: {
              size: 20,
              weight: FontWeight.Bolder,
              family: 'cursive',
              style: FontStyle.Italic
            }
          })
          .onClick(()=>{
            this.lineheight = 100
            this.fontsize = 100
            this.letterspacing = 100
            this.controller.updateSpanStyle({
              start: this.start,
              end: this.end,
              textStyle:
              {
                lineHeight: this.lineheight,
                letterSpacing:this.letterspacing,
                fontSize:this.fontsize
              }
            })
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
        RichEditor(this.options)
          .id('UiComponentTextRichEditorAction07_02')
          .maxLines(1)
          .onReady(() => {
            this.controller.addTextSpan('123456789',
              {
                style:
                {
                  fontColor: Color.Orange,
                  fontSize: this.fontsize,
                  letterSpacing: this.letterspacing,
                  lineHeight:this.lineheight
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
          .height('20%')
      }
      .borderWidth(1)
      .borderColor(Color.Red)
      .width('100%')
      .height('70%')
    }
  }
}