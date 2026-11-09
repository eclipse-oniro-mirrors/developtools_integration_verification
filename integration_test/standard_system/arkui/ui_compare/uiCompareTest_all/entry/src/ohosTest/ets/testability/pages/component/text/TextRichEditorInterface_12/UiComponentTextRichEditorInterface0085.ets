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
struct UiComponentTextRichEditorInterface0085 {
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
      Text('测试在aboutToDelete回调中使用updateSpanStyle更新文本、图片或SymbolSpan样式')
        .width('100%')
        .fontSize(12)
        .fontColor(Color.Orange)
        .textAlign(TextAlign.Center)
        .margin(10)

      Row(){
        // 添加内容按钮
        Button('添加包含emoji和symbol的图文混合内容')
          .id('addContentBtn0085')
          .width('100%')
          .height(40)
          .margin(5)
          .onClick(() => {
            // 清空现有内容
            this.controller.deleteSpans()

            // 添加包含emoji和symbol的图文混合内容
            // 文本 + emoji + 文本 + 图片 + symbol + 文本
            this.controller.addTextSpan('前置文本😀😃😄', {
              style: {
                fontSize: 16,
                fontColor: Color.Blue
              }
            })

            this.controller.addTextSpan('中间文本', {
              style: {
                fontSize: 16,
                fontColor: Color.Green
              }
            })

            // 添加图片
            this.controller.addImageSpan($r('app.media.icon'), {
              imageStyle: {
                size: [50, 50]
              }
            })

            // 添加symbol
            this.controller.addSymbolSpan($r('sys.symbol.ohos_star'), {
              style: {
                fontSize: 20,
                fontColor: [Color.Red]
              }
            })

            this.controller.addTextSpan('后置文本🎉🎊', {
              style: {
                fontSize: 16,
                fontColor: Color.Pink
              }
            })

            this.displayController.deleteSpans()
            this.displayController.addTextSpan('已添加包含emoji、图片和symbol的图文混合内容，现在可以删除内容触发aboutToDelete回调', {
              style: {
                fontSize: 12,
                fontColor: Color.Green
              }
            })
          })
      }
      
      Text('样式更新结果显示区域：')
        .width('100%')
        .fontSize(14)
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 5 })
      
      // 显示样式更新结果的区域
      RichEditor(this.displayOptions)
        .id('displayRichEditor0085')
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
          .id('richEditor0085')
          .width('100%')
          .height(100)
          .border({ width: 1, color: Color.Gray })
          .borderRadius(8)
          .padding(8)
          .aboutToDelete((value: RichEditorDeleteValue) => {
            // 在aboutToDelete回调内调用updateSpanStyle更新样式
            console.log('aboutToDelete回调触发 - 删除信息:', JSON.stringify(value))
            
            try {
              // 在删除前更新剩余内容的样式
              this.controller.updateSpanStyle({
                start: 0,
                end: -1,
                textStyle: {
                  fontSize: 20,
                  fontColor: Color.Orange,
                  fontWeight: FontWeight.Bold
                },
                imageStyle: {
                  size: [70, 70]
                }
              })
              
              console.log('aboutToDelete中updateSpanStyle已执行')
              return true // 允许删除操作继续
              
            } catch (error) {
              console.error('aboutToDelete中updateSpanStyle出错:', error)
              return true // 即使出错也允许删除操作继续
            }
          })
          .onDidChange((rangeBefore: TextRange, rangeAfter: TextRange) => {
            // 输入文本触发onDidChange回调
            const changeInfo = `rangeBefore: ${JSON.stringify(rangeBefore)}, rangeAfter: ${JSON.stringify(rangeAfter)}`
            console.log('onDidChange回调触发 - 变化信息:', changeInfo)
            
            this.displayController.deleteSpans()
            this.displayController.addTextSpan('onDidChange回调已触发\n文本内容发生变化\n' + changeInfo, {
              style: {
                fontSize: 12,
                fontColor: Color.Blue
              }
            })
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
