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
struct UiComponentTextRichEditorInterface0082 {
  scroller: Scroller = new Scroller();
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  
  // 用于显示样式更新结果的RichEditor
  displayController: RichEditorController = new RichEditorController();
  displayOptions: RichEditorOptions = { controller: this.displayController };


  build() {
    Column() {
      // 提示信息
      Text('测试在onEditingChange回调中使用updateSpanStyle更新文本、图片或SymbolSpan样式')
        .width('100%')
        .fontSize(12)
        .fontColor(Color.Orange)
        .textAlign(TextAlign.Center)
        .margin(10)

      Row(){
        // 添加内容按钮
        Button('添加包含emoji和symbol的图文混合内容')
          .id('addContentBtn0082')
          .width('40%')
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
            this.displayController.addTextSpan('已添加包含emoji、图片和symbol的图文混合内容', {
              style: {
                fontSize: 12,
                fontColor: Color.Green
              }
            })
          })
      }

      // 显示样式更新结果的区域
      Text('操作结果显示区域：')
        .width('100%')
        .fontSize(14)
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 5 })
      
      RichEditor(this.displayOptions)
        .id('displayRichEditor0082')
        .width('100%')
        .height(80)
        .border({ width: 1, color: Color.Green })
        .borderRadius(8)
        .padding(8)
        .backgroundColor('#F0F8FF')
        .margin(10)
      
      // 主要测试区域标题
      Text('RichEditor测试区域：')
        .width('100%')
        .fontSize(14)
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 5 })

      // 主要测试区域（包含图文混合内容）
      Scroll(this.scroller) {
        RichEditor(this.options)
          .id('richEditor0082')
          .width('100%')
          .height(150)
          .border({ width: 1, color: Color.Gray })
          .borderRadius(8)
          .padding(8)
          .placeholder('这里将显示包含emoji、图片和symbol的图文混合内容')
          .onEditingChange((isEditing: boolean) => {
            // 在onEditingChange回调内调用updateSpanStyle更新样式
            console.log('onEditingChange回调触发 - 编辑状态:', isEditing)
            
            try {
              // 确保有内容才进行样式更新
              const spans = this.controller.getSpans({ start: -1, end: -1 })
              if (spans.length === 0) {
                console.log('RichEditor中没有内容，跳过样式更新')
                return
              }

              if (isEditing) {
                // 进入编辑状态时，更新文本、图片和SymbolSpan样式
                this.controller.updateSpanStyle({
                  start: 0,
                  end: -1,
                  textStyle: {
                    fontSize: 18,
                    fontColor: Color.Green,
                    fontWeight: FontWeight.Bold
                  },
                  imageStyle: {
                    size: [80, 80]
                  }
                })
                
                
                this.displayController.deleteSpans()
                this.displayController.addTextSpan('onEditingChange回调已触发\n进入编辑状态\n已更新样式为绿色粗体18号字体\n图片尺寸放大到80x80', {
                  style: {
                    fontSize: 12,
                    fontColor: Color.Red
                  }
                })
                
                console.log('进入编辑状态，样式已更新')
              } else {
                // 退出编辑状态时，恢复原始样式
                this.controller.updateSpanStyle({
                  start: 0,
                  end: -1,
                  textStyle: {
                    fontSize: 14,
                    fontColor: Color.Gray,
                    fontWeight: FontWeight.Normal
                  },
                  imageStyle: {
                    size: [50, 50]
                  }
                })
                
                this.displayController.deleteSpans()
                this.displayController.addTextSpan('onEditingChange回调已触发\n退出编辑状态\n已恢复样式为灰色正常14号字体\n图片尺寸恢复到50x50', {
                  style: {
                    fontSize: 12,
                    fontColor: Color.Red
                  }
                })
                
                console.log('退出编辑状态，样式已恢复')
              }
              
            } catch (error) {
              console.error('onEditingChange中updateSpanStyle出错:', error)
              
              this.displayController.deleteSpans()
              this.displayController.addTextSpan('onEditingChange回调出错: ' + error.message, {
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
