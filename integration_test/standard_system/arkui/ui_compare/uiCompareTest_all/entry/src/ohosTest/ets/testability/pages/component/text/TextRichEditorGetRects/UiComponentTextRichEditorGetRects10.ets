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

import { LengthMetrics } from '@kit.ArkUI'
import { image } from '@kit.ImageKit'
import { text } from '@kit.ArkGraphics2D';

@Entry
@Component
struct UiComponentTextRichEditorGetRects10 {
  stringLength: number = 0;
  imagePixelMap: image.PixelMap | undefined = undefined;
  @State selection: string = '';
  @State rect : TextBox[] = []
  @State content: string = '';
  @State range: string = '';
  @State replaceString: string = '';
  @State rangeBefore: string = '';
  @State rangeAfter: string = '';
  richEditorStyledString: MutableStyledString = new MutableStyledString('');
  textStyle: TextStyle = new TextStyle({
    fontWeight: FontWeight.Lighter,
    fontColor: Color.Green,
    fontSize: LengthMetrics.vp(30),
    fontStyle: FontStyle.Normal
  })
  fontStyle1: TextStyle = new TextStyle({ fontColor: Color.Blue });
  fontStyle2: TextStyle = new TextStyle({
    fontWeight: FontWeight.Bolder,
    fontFamily: 'Arial',
    fontColor: Color.Orange,
    fontSize: LengthMetrics.vp(30),
    fontStyle: FontStyle.Italic
  })

  controller1: RichEditorController = new RichEditorController()
  options1: RichEditorOptions = { controller: this.controller1 };
  mutableStyledString: MutableStyledString = new MutableStyledString('初始属性字符串',
    [{ start: 0, length: 5, styledKey: StyledStringKey.FONT, styledValue: this.fontStyle1 }]);
  styledString: StyledString = new StyledString('插入属性字符串',
    [{ start: 2, length: 4, styledKey: StyledStringKey.FONT, styledValue: this.fontStyle2 }]);
  controller: RichEditorStyledStringController = new RichEditorStyledStringController();
  options: RichEditorStyledStringOptions = {controller: this.controller};
  contentChangedListener: StyledStringChangedListener = {
    onWillChange: (value: StyledStringChangeValue) => {
      this.range = '[ ' + value.range.start + ' , ' + value.range.end + ' ]';
      this.replaceString = value.replacementString.getString();
      return true;
    },
    onDidChange: (rangeBefore, rangeAfter) => {
      this.rangeBefore = '[ ' + rangeBefore.start + ' , ' + rangeBefore.end + ' ]';
      this.rangeAfter = '[ ' + rangeAfter.start + ' , ' + rangeAfter.end + ' ]';
    }
  }

  async aboutToAppear() {
    console.info('aboutToAppear initial imagePixelMap');
    this.imagePixelMap = await this.getPixmapFromMedia($r('app.media.app_icon'));
  }

  private async getPixmapFromMedia(resource: Resource) {
    let unit8Array = await getContext(this)?.resourceManager?.getMediaContent({
      bundleName: resource.bundleName,
      moduleName: resource.moduleName,
      id: resource.id
    })
    let imageSource = image.createImageSource(unit8Array.buffer.slice(0, unit8Array.buffer.byteLength))
    let createPixelMap: image.PixelMap = await imageSource.createPixelMap({
      desiredPixelFormat: image.PixelMapFormat.RGBA_8888
    })
    await imageSource.release()
    return createPixelMap
  }


  build() {
    Column({space:6}) {
      Column() {
        Text('getRectsForRange set TIGHT')
          .fontSize(5)
          .fontColor(Color.Red)
          .fontWeight(FontWeight.Bolder)
        Text('getRectsForRange result is:'+JSON.stringify(this.rect))
          .width('100%')
          .fontSize(5)
          .fontColor(Color.Red)
          .fontWeight(FontWeight.Bolder)
      }
      .width('100%')
      .height('10%')

      Column() {
        Text('onWillChange回调信息')
          .fontSize(10)
          .width('100%')
        Text('range: ' + this.range)
          .width('100%')
          .fontSize(10)
          .width('100%')
      }
      .borderWidth(1)
      .borderColor(Color.Black)
      .width('100%')
      .height('20%')

      RichEditor(this.options)
        .onReady(() => {
          this.controller.onContentChanged(this.contentChangedListener);
          this.controller.setStyledString(this.mutableStyledString);
        })
        .height('20%')
        .width('100%')

      RichEditor(this.options1)
        .onReady(() => {
          this.controller1.addTextSpan('把这些文字转换成属性字符串');
        })
        .height('10%')
        .width('100%')
        .borderWidth(1)
        .borderColor(Color.Black)

      Row({space:2}) {
        Button('getRectsForRange')
          .id('UiComponentTextRichEditorGetRects10')
          .onClick(() => {
            const range: TextRange = {
              start: 1,
              end: 100
            };
            let layoutManager: LayoutManager = this.controller.getLayoutManager();
            this.rect = layoutManager.getRectsForRange(range,text.RectWidthStyle.TIGHT,text.RectHeightStyle.TIGHT)
            console.info('getRectsForRange return ' + JSON.stringify(this.rect))
          })
          .width('30%')
        Button('插入图片')
          .stateEffect(true)
          .width('30%')
          .onClick(() => {
            if (this.imagePixelMap !== undefined) {
              let imageStyledString = new MutableStyledString(new ImageAttachment({
                value: this.imagePixelMap,
                size: { width: 50, height: 50 },
                layoutStyle: { borderRadius: LengthMetrics.vp(10) },
                verticalAlign: ImageSpanAlignment.BASELINE,
                objectFit: ImageFit.Contain
              }))
              this.richEditorStyledString = this.controller.getStyledString();
              this.richEditorStyledString.appendStyledString(imageStyledString);
              this.controller.setStyledString(this.richEditorStyledString);
              this.controller.setCaretOffset(this.richEditorStyledString.length);
            }
          })
        Button('删除选中内容')
          .onClick(() => {
            let richEditorSelection = this.controller.getSelection();
            let start = richEditorSelection.start ? richEditorSelection.start : 0;
            let end = richEditorSelection.end ? richEditorSelection.end : 0;
            if (start < 0 || end <= start) {
              return;
            }
            this.richEditorStyledString = this.controller.getStyledString();
            this.richEditorStyledString.removeString(start, end - start);
            this.controller.setStyledString(this.richEditorStyledString);
          })
          .width('30%')
      }
      Row({space:2}) {
        Button('获取选中内容')
          .onClick(() => {
            let richEditorSelection = this.controller.getSelection();
            let start = richEditorSelection.start ? richEditorSelection.start : 0;
            let end = richEditorSelection.end ? richEditorSelection.end : 0;
            this.richEditorStyledString = this.controller.getStyledString();
            this.selection = '[ ' + start + ' , ' + end + ' ]';
            if (start == end) {
              this.content = '';
            } else {
              this.content = this.richEditorStyledString.subStyledString(start, end - start).getString();
            }
          })
          .width('40%')
        Button('更新选中样式')
          .onClick(() => {
            let richEditorSelection = this.controller.getSelection();
            let start = richEditorSelection.start ? richEditorSelection.start : 0;
            let end = richEditorSelection.end ? richEditorSelection.end : 0;
            if (start < 0 || end <= start) {
              return;
            }
            this.richEditorStyledString = this.controller.getStyledString();
            this.richEditorStyledString.setStyle({
              start: start,
              length: end - start,
              styledKey: StyledStringKey.FONT,
              styledValue: this.textStyle
            })
            this.controller.setStyledString(this.richEditorStyledString);
          })
          .width('40%')
      }
      Row({space:2}){
        Button('调用fromStyledString')
          .onClick(() => {
            this.controller1.addTextSpan('调用fromStyledString：' +JSON.stringify(this.controller1.fromStyledString(this.mutableStyledString)))
          })
          .width('40%')
          .labelStyle({ overflow: TextOverflow.Clip,
            maxLines: 2,
            minFontSize: 10,
            maxFontSize: 20,
            font: {
              size: 10,
              weight: FontWeight.Bolder,
              family: 'cursive',
              style: FontStyle.Italic
            }
          })
        Button('调用toStyledString')
          .onClick(() => {
            this.controller.setStyledString(this.controller1.toStyledString({start:0,end:13}))
          })
          .width('40%')
          .labelStyle({ overflow: TextOverflow.Clip,
            maxLines: 2,
            minFontSize: 10,
            maxFontSize: 20,
            font: {
              size: 10,
              weight: FontWeight.Bolder,
              family: 'cursive',
              style: FontStyle.Italic
            }
          })
      }
    }
  }
}
