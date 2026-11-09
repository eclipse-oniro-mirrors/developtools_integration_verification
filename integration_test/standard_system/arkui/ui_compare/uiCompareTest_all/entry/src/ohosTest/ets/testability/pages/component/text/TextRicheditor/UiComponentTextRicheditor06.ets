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
struct UiComponentTextRicheditor06 {
  @State text: string = '1/2 2/3'
  private start: number = -1;
  private end: number = -1;
  @State message: string = '[-1, -1]'
  @State content: string = ''
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };

  build() {
    Column() {
      Text() {
        SymbolSpan($r('sys.symbol.ohos_trash'))
          .fontWeight(FontWeight.Normal)
          .fontSize(96)
      }
      .copyOption(CopyOptions.InApp)
      RichEditor(this.options)
        .onReady(() => {
          this.controller.addSymbolSpan($r('sys.symbol.ohos_trash'),
            {
              style:
              {
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
