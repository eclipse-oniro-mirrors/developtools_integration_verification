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

@Builder
function uiComponentTextRichEditorAction19placeholderBuilder2() {
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
struct UiComponentTextRichEditorAction19 {
  controller: RichEditorController = new RichEditorController();
  option: RichEditorOptions = { controller: this.controller };
  private start: number = 2;
  private end: number = 4;
  @State message: string = '[-1, -1]'
  @State content: string = ''
  private my_offset: number | undefined = undefined
  private my_builder: CustomBuilder = undefined
  @BuilderParam my_builder2:() => void = uiComponentTextRichEditorAction19placeholderBuilder2;

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
        Flex({ direction: FlexDirection.Column }) { // 子组件在容器主抽上列布局
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

      Row() {
        Button('删除选择内容').onClick(() => {
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
          .id('UiComponentTextRichEditorAction19_03')
          .onReady(() => {
            this.controller.addTextSpan('09',
              {
                style:
                {
                  fontColor: Color.Orange,
                  fontSize: 30
                }
              })
            this.controller.addImageSpan(('/icon.png'),
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
            return true;
          })
          .onIMEInputComplete((value: RichEditorTextSpanResult) => {
            console.log('---------------------- onIMEInputComplete --------------------')
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

        Button('add span')
          .onClick(() => {
            let num = this.controller.addBuilderSpan(this.my_builder, { offset: this.my_offset })
            console.info('addBuilderSpan return ' + num)
          })
          .id('UiComponentTextRichEditorAction19_01')
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
            .id('UiComponentTextRichEditorAction19_02')
            .onClick(() => {
              this.my_builder = () => {
                this.placeholderBuilder()
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