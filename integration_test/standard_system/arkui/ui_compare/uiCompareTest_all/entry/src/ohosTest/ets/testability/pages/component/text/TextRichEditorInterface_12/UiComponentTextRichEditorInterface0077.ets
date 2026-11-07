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
struct UiComponentTextRichEditorInterface0077 {
  scroller: Scroller = new Scroller();
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  
  // 用于显示样式信息的RichEditor
  displayController: RichEditorController = new RichEditorController();
  displayOptions: RichEditorOptions = { controller: this.displayController };

  build() {
    Column() {
      // 提示信息
      Text('请在下面的RichEditor中输入文本来触发updateSpanStyle功能')
        .width('100%')
        .fontSize(12)
        .fontColor(Color.Orange)
        .textAlign(TextAlign.Center)
        .margin(10)

      // 显示样式信息的区域
      Text('样式信息显示区域：')
        .width('100%')
        .fontSize(14)
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 5 })

      RichEditor(this.displayOptions)
        .id('displayRichEditor0077')
        .width('100%')
        .height(100)
        .border({ width: 1, color: Color.Green })
        .borderRadius(8)
        .padding(8)
        .backgroundColor('#F0F8FF')
        .margin(10)





      Scroll(this.scroller) {
        RichEditor(this.options)
          .id('richEditor0077')
          .width('100%')
          .height(100)
          .border({ width: 1, color: Color.Gray })
          .borderRadius(8)
          .padding(8)
          .aboutToIMEInput((value: RichEditorInsertValue) => {
            // 在输入前更新样式
            const spans = JSON.stringify(this.controller.getSpans({ start: -1, end: -1 }))
            console.log('输入前的spans信息:', spans)
            
            // 更新现有文本的样式
            this.controller.updateSpanStyle({
              start: 0,
              end: -1,
              textStyle: {
                fontSize: 18,
                fontColor: Color.Orange
              }
            })
            
            this.displayController.deleteSpans()
            this.displayController.addTextSpan('已更新样式，spans信息:\n' + spans, {
              style: {
                fontSize: 12,
                fontColor: Color.Red
              }
            })
            return true
          })
      }
      .width('100%')
      .height('16.39%')
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.On)
      .scrollBarColor('#999999')
      .scrollBarWidth(8)

    }
    .width('100%')
    .height('100%')
    .padding(16)
    .backgroundColor('#F6F7F9')
  }
}
