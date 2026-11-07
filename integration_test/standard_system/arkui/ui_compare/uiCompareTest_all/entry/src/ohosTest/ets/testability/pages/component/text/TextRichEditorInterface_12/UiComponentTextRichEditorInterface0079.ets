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
struct UiComponentTextRichEditorInterface0079 {
  scroller: Scroller = new Scroller();
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  
  // 用于显示样式更新结果的RichEditor
  displayController: RichEditorController = new RichEditorController();
  displayOptions: RichEditorOptions = { controller: this.displayController };

  aboutToAppear() {
    // 预置图文混合内容
    this.controller.addTextSpan('这是一段测试文本', {
      style: {
        fontSize: 16,
        fontColor: Color.Black
      }
    })
    this.controller.addImageSpan($r('app.media.icon'), {
      imageStyle: {
        size: [50, 50]
      }
    })
    this.controller.addSymbolSpan($r('sys.symbol.star_fill'), {
      style: {
        fontSize: 20,
        fontColor: [Color.Yellow]
      }
    })
    this.controller.addTextSpan('结尾文本', {
      style: {
        fontSize: 16,
        fontColor: Color.Blue
      }
    })
  }

  build() {
    Column() {
      // 提示信息
      Text('请在下面的RichEditor中输入文本后删除来触发onDeleteComplete回调')
        .width('100%')
        .fontSize(12)
        .fontColor(Color.Orange)
        .textAlign(TextAlign.Center)
        .margin(10)
      
      Text('样式更新结果显示区域：')
        .width('100%')
        .fontSize(14)
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 5 })
      
      // 显示样式更新结果的区域
      RichEditor(this.displayOptions)
        .id('displayRichEditor0079')
        .width('100%')
        .height(100)
        .border({ width: 1, color: Color.Green })
        .borderRadius(8)
        .padding(8)
        .backgroundColor('#F0F8FF')
        .margin(10)
      
      // 主要测试区域（包含图文混合内容）
      Scroll(this.scroller) {
        RichEditor(this.options)
          .id('richEditor0079')
          .width('100%')
          .height(100)
          .border({ width: 1, color: Color.Gray })
          .borderRadius(8)
          .padding(8)
          .onDeleteComplete(() => {
            // 在onDeleteComplete回调内调用updateSpanStyle更新样式
            try {
              this.controller.updateSpanStyle({
                start: 0,
                end: -1,
                textStyle: {
                  fontSize: 20,
                  fontColor: Color.Orange
                }
              })
              
              const deleteInfo = '删除操作完成'
              console.log('onDeleteComplete - 删除信息:', deleteInfo)
              
              this.displayController.deleteSpans()
              this.displayController.addTextSpan('onDeleteComplete触发\n已更新样式为橙色20号字体\n删除信息:\n' + deleteInfo, {
                style: {
                  fontSize: 12,
                  fontColor: Color.Red
                }
              })
            } catch (error) {
              this.displayController.deleteSpans()
              this.displayController.addTextSpan('updateSpanStyle执行失败\n错误信息: ' + error.toString(), {
                style: {
                  fontSize: 12,
                  fontColor: Color.Red
                }
              })
            }
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
    .padding(10)
  }
}
