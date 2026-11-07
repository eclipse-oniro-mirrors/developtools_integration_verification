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

import { text } from '@kit.ArkGraphics2D';

@Builder
function getRects06placeholderBuilder2() {
  Row({ space: 2 }) {
    Image($r('app.media.icon'))
      .width(24)
      .height(24)
      .margin({ left: -5 })
    Text('okokokok')
      .fontSize(10)
  }
  .width('20%')
  .height('100%')
  .padding(10)
  .backgroundColor(Color.Red)
}

@Entry
@Component
struct UiComponentTextRichEditorGetRects06 {
  controller: RichEditorController = new RichEditorController();
  controller2: TextController = new TextController();
  option: RichEditorOptions = { controller: this.controller };
  private start: number = 2;
  private end: number = 4;
  @State message: string = '[-1, -1]'
  @State content: string = ''
  private my_offset: number | undefined = undefined
  private my_builder: CustomBuilder = undefined
  @BuilderParam my_builder2:() => void = getRects06placeholderBuilder2;
  @State rect : TextBox[] = []

  @Builder
  placeholderBuilder() {
    Row({ space: 2 }) {
      Image($r('app.media.icon'))
        .width(24)
        .height(24)
        .margin({ left: -5 })
      Text('Custom Popup')
        .fontSize(10)
    }
    .width('13.89%')
    .height('4.1%')
    .padding(5)
  }

  @Builder
  placeholderBuilder3() {
    Text('hello')
      .padding('20')
      .borderWidth(1)
      .width('100%')
  }

  @Builder
  placeholderBuilder4() {
    Column() {
      Column({ space: 5 }) {
        Text('direction:Row').fontSize(9).fontColor(0xCCCCCC).width('90%')
        Flex({ direction: FlexDirection.Row }) {
          Text('1').width('20%').height(50).backgroundColor(0xF5DEB3)
          Text('1').width('20%').height(50).backgroundColor(0xD2B48C)
          Text('1').width('20%').height(50).backgroundColor(0xF5DEB3)
          Text('1').width('20%').height(50).backgroundColor(0xD2B48C)
        }
        .height('5.74%')
        .width('90%')
        .padding(10)
        .backgroundColor(0xAFEEEE)

        Text('direction:RowReverse').fontSize(9).fontColor(0xCCCCCC).width('90%')
        Flex({ direction: FlexDirection.RowReverse }) {
          Text('1').width('20%').height(50).backgroundColor(0xF5DEB3)
          Text('1').width('20%').height(50).backgroundColor(0xD2B48C)
          Text('1').width('20%').height(50).backgroundColor(0xF5DEB3)
          Text('1').width('20%').height(50).backgroundColor(0xD2B48C)
        }
        .height('5.74%')
        .width('90%')
        .padding(10)
        .backgroundColor(0xAFEEEE)

        Text('direction:Column').fontSize(9).fontColor(0xCCCCCC).width('90%')
        Flex({ direction: FlexDirection.Column }) {
          Text('1').width('20%').height(40).backgroundColor(0xF5DEB3)
          Text('1').width('20%').height(40).backgroundColor(0xD2B48C)
          Text('1').width('20%').height(40).backgroundColor(0xF5DEB3)
          Text('1').width('20%').height(40).backgroundColor(0xD2B48C)
        }
        .height('13.11%')
        .width('90%')
        .padding(10)
        .backgroundColor(0xAFEEEE)

        Text('direction:ColumnReverse').fontSize(9).fontColor(0xCCCCCC).width('90%')
        Flex({ direction: FlexDirection.ColumnReverse }) {
          Text('1').width('20%').height(40).backgroundColor(0xF5DEB3)
          Text('1').width('20%').height(40).backgroundColor(0xD2B48C)
          Text('1').width('20%').height(40).backgroundColor(0xF5DEB3)
          Text('1').width('20%').height(40).backgroundColor(0xD2B48C)
        }
        .height('13.11%')
        .width('90%')
        .padding(10)
        .backgroundColor(0xAFEEEE)
      }
      .width('100%')
      .margin({ top: 5 })
    }
    .width('100%')
  }

  @Builder
  MyMenu() {
    Menu() {
      MenuItem({ startIcon: $r('app.media.icon'), content: '菜单选项1' })
      MenuItem({ startIcon: $r('app.media.icon'), content: '菜单选项2' })
        .enabled(false)
    }
  }

  build() {
    Column() {
      Column() {
        Text('getRectsForRange set MAX')
          .fontSize(11)
          .fontColor(Color.Red)
          .fontWeight(FontWeight.Bolder)
        Text('getRectsForRange result is:'+JSON.stringify(this.rect))
          .width('100%')
          .fontSize(10)
          .fontColor(Color.Red)
          .fontWeight(FontWeight.Bolder)
      }
      .borderWidth(1)
      .borderColor(Color.Red)
      .width('100%')
      .height('20%')

      Row() {
        Button('获取选择内容 getSpans')
          .onClick(() => {
            console.info('getSpans='+JSON.stringify(this.controller.getSpans({ start:1, end:5 })))
            console.info('getParagraphs='+JSON.stringify(this.controller.getParagraphs({ start:1, end:5 })))
            this.content = ''
            this.controller.getSpans({
              start: this.start,
              end: this.end
            }).forEach(item => {
              if (typeof (item as RichEditorImageSpanResult)['imageStyle'] != 'undefined') {
                if ((item as RichEditorImageSpanResult).valueResourceStr == '') {
                  console.info('builder span index ' + (item as RichEditorImageSpanResult).spanPosition.spanIndex + ', range : ' + (item as RichEditorImageSpanResult).offsetInSpan[0] + ', ' +
                  (item as RichEditorImageSpanResult).offsetInSpan[1] + ', size : ' + (item as RichEditorImageSpanResult).imageStyle[0] + ', ' + (item as RichEditorImageSpanResult).imageStyle[1])
                } else {
                  console.info('image span ' + (item as RichEditorImageSpanResult).valueResourceStr + ', index : ' + (item as RichEditorImageSpanResult).spanPosition.spanIndex + ', range: ' +
                  (item as RichEditorImageSpanResult).offsetInSpan[0] + ', ' + (item as RichEditorImageSpanResult).offsetInSpan[1] + ', size : ' +
                  (item as RichEditorImageSpanResult).imageStyle.size[0] + ', ' + (item as RichEditorImageSpanResult).imageStyle.size[1])
                }
              } else {
                this.content += (item as RichEditorTextSpanResult).value;
                this.content += '\n'
                console.info('text span: ' + (item as RichEditorTextSpanResult).value)
              }
            })
          })
        Button('获取选择内容 getSelection')
          .onClick(() => {
            this.content = '';
            let select = this.controller.getSelection()
            console.info('selection start ' + select.selection[0] + ' end ' + select.selection[1])
            select.spans.forEach(item => {
              if (typeof (item as RichEditorImageSpanResult)['imageStyle'] != 'undefined') {
                if ((item as RichEditorImageSpanResult).valueResourceStr == '') {
                  console.info('builder span index ' + (item as RichEditorImageSpanResult).spanPosition.spanIndex + ', range : ' + (item as RichEditorImageSpanResult).offsetInSpan[0] + ', ' +
                  (item as RichEditorImageSpanResult).offsetInSpan[1] + ', size : ' + (item as RichEditorImageSpanResult).imageStyle[0] + ', ' + (item as RichEditorImageSpanResult).imageStyle[1])
                } else {
                  console.info('image span ' + (item as RichEditorImageSpanResult).valueResourceStr + ', index : ' + (item as RichEditorImageSpanResult).spanPosition.spanIndex + ', range: ' +
                  (item as RichEditorImageSpanResult).offsetInSpan[0] + ', ' + (item as RichEditorImageSpanResult).offsetInSpan[1] + ', size : ' +
                  (item as RichEditorImageSpanResult).imageStyle.size[0] + ', ' + (item as RichEditorImageSpanResult).imageStyle.size[1])
                }
              } else {
                this.content += (item as RichEditorTextSpanResult).value;
                this.content += '\n'
                console.info('text span: ' + (item as RichEditorTextSpanResult).value)
              }
            })
          })
        Button('删除选择内容')
          .onClick(() => {
            this.controller.deleteSpans({
              start: this.start,
              end: this.end
            })
          })
      }
      .borderWidth(1)
      .borderColor(Color.Red)
      .width('100%')
      .height('10%')

      Column() {
        RichEditor(this.option)
          .onReady(() => {
            this.controller.addTextSpan('0123456789',
              {
                style:
                {
                  letterSpacing: 10,
                  fontColor: Color.Orange,
                  fontSize: 30,
                  lineHeight:60
                }
              })
            this.controller.addImageSpan($r('app.media.icon'),
              {
                imageStyle:
                {
                  size: ['57px', '57px']
                }
              })
          })
          .onSelect((value: RichEditorSelection) => {
            this.start = value.selection[0];
            this.end = value.selection[1];
            this.message = '[' + this.start + ', ' + this.end + ']'
            console.info('onSelect='+JSON.stringify(value))
          })
          .aboutToIMEInput((value: RichEditorInsertValue) => {
            console.log('---------------------- aboutToIMEInput --------------------')
            console.info('aboutToIMEInput='+JSON.stringify(value))
            console.log('insertOffset:' + value.insertOffset)
            console.log('insertValue:' + value.insertValue)
            return true;
          })
          .onIMEInputComplete((value: RichEditorTextSpanResult) => {
            console.log('---------------------- onIMEInputComplete --------------------')
            console.info('onIMEInputComplete='+JSON.stringify(value))
            console.log('spanIndex:' + value.spanPosition.spanIndex)
            console.log('spanRange:[' + value.spanPosition.spanRange[0] + ',' + value.spanPosition.spanRange[1] + ']')
            console.log('offsetInSpan:[' + value.offsetInSpan[0] + ',' + value.offsetInSpan[1] + ']')
            console.log('value:' + value.value)
          })
          .aboutToDelete((value: RichEditorDeleteValue) => {
            value.richEditorDeleteSpans.forEach(item => {
              console.log('---------------------- item --------------------')
              console.info('spanIndex=' + item.spanPosition.spanIndex)
              console.log('spanRange:[' + item.spanPosition.spanRange[0] + ',' + item.spanPosition.spanRange[1] + ']')
              console.log('offsetInSpan:[' + item.offsetInSpan[0] + ',' + item.offsetInSpan[1] + ']')
              if (typeof (item as RichEditorImageSpanResult)['imageStyle'] != 'undefined') {
                if ((item as RichEditorImageSpanResult).valueResourceStr == '') {
                  console.info('builder span index ' + (item as RichEditorImageSpanResult).spanPosition.spanIndex + ', range : ' + (item as RichEditorImageSpanResult).offsetInSpan[0] + ', ' +
                  (item as RichEditorImageSpanResult).offsetInSpan[1] + ', size : ' + (item as RichEditorImageSpanResult).imageStyle[0] + ', ' + (item as RichEditorImageSpanResult).imageStyle[1])
                } else {
                  console.info('image span ' + (item as RichEditorImageSpanResult).valueResourceStr + ', index : ' + (item as RichEditorImageSpanResult).spanPosition.spanIndex + ', range: ' +
                  (item as RichEditorImageSpanResult).offsetInSpan[0] + ', ' + (item as RichEditorImageSpanResult).offsetInSpan[1] + ', size : ' +
                  (item as RichEditorImageSpanResult).imageStyle.size[0] + ', ' + (item as RichEditorImageSpanResult).imageStyle.size[1])
                }
              } else {
                console.info('delete text: ' + (item as RichEditorTextSpanResult).value)
              }
            })
            return true;
          })
          .borderWidth(1)
          .borderColor(Color.Green)
          .width('100%')
          .height('30%')

        Button('getRectsForRange')
          .id('UiComponentTextRichEditorGetRects06')
          .onClick(() => {
            const range: TextRange = {
              start: 1,
              end: 2
            };
            let layoutManager: LayoutManager = this.controller.getLayoutManager();
            this.rect = layoutManager.getRectsForRange(range,text.RectWidthStyle.TIGHT,text.RectHeightStyle.MAX)
            console.info('getRectsForRange return ' + JSON.stringify(this.rect))
          })
        Button('add image')
          .onClick(() => {
            let num = this.controller.addImageSpan($r('app.media.icon'), {
              imageStyle: {
                size: ['50px', '50px'],
                verticalAlign: ImageSpanAlignment.BOTTOM,
                layoutStyle: {
                  borderRadius: undefined,
                  margin: undefined
                }
              }
            })
            console.info('addImageSpan return' + num)
          })
        Row() {
          Button('builder1')
            .onClick(() => {
              this.my_builder = () => {
                this.placeholderBuilder()
              }
            })
          Button('builder2')
            .onClick(() => {
              this.my_builder = () => {
                this.my_builder2()
              }
            })
          Button('builder3')
            .onClick(() => {
              this.my_builder = () => {
                this.placeholderBuilder3()
              }
            })
          Button('builder4')
            .onClick(() => {
              this.my_builder = () => {
                this.placeholderBuilder4()
              }
            })
        }
      }
      .borderWidth(1)
      .borderColor(Color.Red)
      .width('100%')
      .height('70%')
    }
  }
}