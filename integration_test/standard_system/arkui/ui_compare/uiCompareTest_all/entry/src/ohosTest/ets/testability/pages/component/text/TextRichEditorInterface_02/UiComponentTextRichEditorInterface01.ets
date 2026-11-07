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

import { uiAppearance } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct UiComponentTextRichEditorInterface01 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  private start: number = -1;
  private end: number = -1;
  @State message: string = '[-1, -1]';
  @State content: string = '';
  @State paddingVal: number = 5;
  @State borderRad: number = 4;

  build() {
    Column() {
      Column() {
        Text('selection range:')
          .width('100%')
          .fontSize(18)
          .maxLines(3)
          .textAlign(TextAlign.Start)
          .fontColor(Color.Red)
          .fontWeight(FontWeight.Bolder)
          .border({ width: 1, color: 0xEEEEEE })
          .margin({
            left: 6,
            right: 6,
          })
        Text() {
          Span(this.message)
        }.width('100%')
        Text('selection content:')
          .width('100%')
        Text() {
          Span(this.content)
        }
        .width('100%')
      }
      .borderWidth(1)
      .borderColor(Color.Red)
      .width('100%')
      .height('20%')

      Row() {
        Button('updateSpanStyle1')
          .fontSize(12)
          .onClick(() => {
            this.controller.updateSpanStyle({
              start: this.start,
              textStyle:
              {
                fontWeight: FontWeight.Bolder
              },
              imageStyle: {
                size: ['80px', '80px'],
                layoutStyle: {
                  borderRadius: undefined,
                  margin: undefined
                }
              }
            })
          })

        Button('updateSpanStyle2')
          .fontSize(12)
          .onClick(() => {
            this.controller.updateSpanStyle({
              start: this.start,
              textStyle:
              {
                fontWeight: FontWeight.Bolder
              },
              imageStyle: {
                size: ['70px', '70px'],
                layoutStyle: {
                  borderRadius: { topLeft: '100px', topRight: '20px', bottomLeft: '100px', bottomRight: '20px' },
                  margin: { left: '30px', top: '20px', right: '20px', bottom: '20px' }
                }
              }
            })
          })
      }
      .borderWidth(1)
      .borderColor(Color.Red)
      .width('100%')
      .height('10%')

      Row() {
        Button('selection(2,3)')
          .borderRadius(20)
          .width(200)
          .labelStyle({ overflow: TextOverflow.Clip,
            maxLines: 1,
            minFontSize: 10,
            maxFontSize: 20,
            font: {
              size: 10,
              weight: FontWeight.Bolder,
              family: 'cursive',
              style: FontStyle.Italic
            }
          })
          .id('UiComponentTextRichEditorInterface01_01')
          .backgroundColor(0x317aff)
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .margin(10)
          .onClick(() => {
            this.controller.setSelection(2,3)
          })

        Button('selection(1,2)')
          .borderRadius(20)
          .labelStyle({ overflow: TextOverflow.Clip,
            maxLines: 1,
            minFontSize: 10,
            maxFontSize: 20,
            font: {
              size: 10,
              weight: FontWeight.Bolder,
              family: 'cursive',
              style: FontStyle.Italic
            }
          })
          .id('UiComponentTextRichEditorInterface01_02')
          .backgroundColor(0x317aff)
          .fontSize(16)
          .width(200)
          .fontWeight(FontWeight.Bold)
          .margin(10)
          .onClick(() => {
            this.controller.setSelection(1,2)
          })
      }
      .borderWidth(1)
      .borderColor(Color.Red)
      .width('100%')
      .height('10%')

      Column() {
        RichEditor(this.options)
          .id('UiComponentTextRichEditorInterface01_03')
          .onReady(() => {
            this.controller.addTextSpan('😊',
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
                  fontSize: 35
                }
              })

            this.controller.addTextSpan('0123456789',
              {
                style:
                {
                  fontColor: Color.Red,
                  fontSize: 30
                }
              })
          })
          .onSelect((value: RichEditorSelection) => {
            this.start = value.selection[0];
            this.end = value.selection[1];
            this.message = '[' + this.start + ', ' + this.end + ']';
          })
          .aboutToIMEInput((value: RichEditorInsertValue) => {
            console.info('---------------------- aboutToIMEInput ----------------------');
            console.info('insertOffset:' + value.insertOffset);
            console.info('insertValue:' + value.insertValue);
            return true;
          })
          .onIMEInputComplete((value: RichEditorTextSpanResult) => {
            console.info('---------------------- onIMEInputComplete ---------------------');
            console.info('spanIndex:' + value.spanPosition.spanIndex);
            console.info('spanRange:[' + value.spanPosition.spanRange[0] + ',' + value.spanPosition.spanRange[1] + ']');
            console.info('offsetInSpan:[' + value.offsetInSpan[0] + ',' + value.offsetInSpan[1] + ']');
            console.info('value:' + value.value);
          })
          .aboutToDelete((value: RichEditorDeleteValue) => {
            console.info('---------------------- aboutToDelete --------------------------');
            console.info('offset:' + value.offset);
            console.info('direction:' + value.direction);
            console.info('length:' + value.length);
            value.richEditorDeleteSpans.forEach(item => {
              console.info('---------------------- item --------------------------');
              console.info('spanIndex:' + item.spanPosition.spanIndex);
              console.info('spanRange:[' + item.spanPosition.spanRange[0] + ',' + item.spanPosition.spanRange[1] + ']');
              console.info('offsetInSpan:[' + item.offsetInSpan[0] + ',' + item.offsetInSpan[1] + ']');
              if (typeof (item as RichEditorImageSpanResult)['imageStyle'] != 'undefined') {
                console.info('image:' + (item as RichEditorImageSpanResult).valueResourceStr);
              } else {
                console.info('text:' + (item as RichEditorTextSpanResult).value);
              }
            })
            return true;
          })
          .onDeleteComplete(() => {
            console.info('---------------------- onDeleteComplete ------------------------');
          })
          .borderWidth(1)
          .borderColor(Color.Green)
          .width('100%')
          .height('40%')
      }
      .borderWidth(1)
      .borderColor(Color.Red)
      .width('100%')
      .height('70%')
    }
  }
}