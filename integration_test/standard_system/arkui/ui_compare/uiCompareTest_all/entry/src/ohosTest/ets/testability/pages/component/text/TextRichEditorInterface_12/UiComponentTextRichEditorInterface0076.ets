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
struct UiComponentTextRichEditorInterface0076 {
  scroller: Scroller = new Scroller();
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  
  // 用于显示样式更新结果的RichEditor
  displayController: RichEditorController = new RichEditorController();
  displayOptions: RichEditorOptions = { controller: this.displayController };

  // 状态变量
  @State hasContent: boolean = false;
  @State onSelectTriggered: boolean = false;

  build() {
    Column() {
      // 提示信息
      Text('测试在onSelect回调中使用updateSpanStyle更新文本、图片或SymbolSpan样式')
        .width('100%')
        .fontSize(12)
        .fontColor(Color.Orange)
        .textAlign(TextAlign.Center)
        .margin(10)

      Row(){
        // 添加内容按钮
        Button('添加图文混合内容')
          .id('addContentBtn0076')
          .width('30%')
          .height(40)
          .margin(5)
          .onClick(() => {
            // 清空现有内容
            this.controller.deleteSpans()

            // 添加图文混合内容
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

            this.hasContent = true
            this.onSelectTriggered = false

            this.displayController.deleteSpans()
            this.displayController.addTextSpan('已添加图文混合内容，请选择文本触发onSelect回调', {
              style: {
                fontSize: 12,
                fontColor: Color.Green
              }
            })
          })

        // 模拟选择操作按钮
        Button('模拟选择操作')
          .id('simulateSelectBtn0076')
          .width('30%')
          .height(40)
          .margin(5)
          .enabled(this.hasContent)
          .onClick(() => {
            this.displayController.deleteSpans()
            this.displayController.addTextSpan('请在RichEditor中双击或拖拽选择文本，将触发onSelect回调', {
              style: {
                fontSize: 12,
                fontColor: Color.Orange
              }
            })
          })

        // 验证结果按钮
        Button('验证样式更新结果')
          .id('verifyResultBtn0076')
          .width('30%')
          .height(40)
          .margin(5)
          .enabled(this.onSelectTriggered)
          .onClick(() => {
            try {
              const spans = this.controller.getSpans({ start: -1, end: -1 })
              let resultText = 'onSelect回调中updateSpanStyle执行成功\n'
              resultText += `当前spans数量: ${spans.length}\n`
              
              this.displayController.deleteSpans()
              this.displayController.addTextSpan(resultText, {
                style: {
                  fontSize: 12,
                  fontColor: Color.Red
                }
              })
            } catch (error) {
              this.displayController.deleteSpans()
              this.displayController.addTextSpan('验证结果出错: ' + error.message, {
                style: {
                  fontSize: 12,
                  fontColor: Color.Red
                }
              })
            }
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
        .id('displayRichEditor0076')
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
          .id('richEditor0076')
          .width('100%')
          .height(150)
          .border({ width: 1, color: Color.Gray })
          .borderRadius(8)
          .padding(8)
          .placeholder('这里将显示图文混合内容，选择文本将触发onSelect回调')
          .onSelect((value: RichEditorSelection) => {
            // 在onSelect回调内调用updateSpanStyle更新样式
            try {
              this.controller.updateSpanStyle({
                start: value.selection[0],
                end: value.selection[1],
                textStyle: {
                  fontSize: 18,
                  fontColor: Color.Pink,
                  fontWeight: FontWeight.Bold
                },
                imageStyle: {
                  size: [80, 80]
                }
              })
              
              this.onSelectTriggered = true
              
              const selectionInfo = JSON.stringify(value)
              console.log('onSelect - 选择信息:', selectionInfo)
              
              this.displayController.deleteSpans()
              this.displayController.addTextSpan('onSelect回调已触发\n已更新选中范围样式\n选择范围: ' + value.selection[0] + '-' + value.selection[1], {
                style: {
                  fontSize: 12,
                  fontColor: Color.Red
                }
              })
            } catch (error) {
              console.error('onSelect中updateSpanStyle出错:', error)
              
              this.displayController.deleteSpans()
              this.displayController.addTextSpan('onSelect回调出错: ' + error.message, {
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
