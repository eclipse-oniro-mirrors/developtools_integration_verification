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
struct UiComponentTextRichEditorInterface0003060 {
  scroller: Scroller = new Scroller();
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  
  // 用于显示操作结果的RichEditor
  displayController: RichEditorController = new RichEditorController();
  displayOptions: RichEditorOptions = { controller: this.displayController };

  private operationCount: number = 0

  build() {
    Column() {
      // 提示信息
      Text('输入文本后使用updateSpanStyle更新内容样式，再继续输入文本')
        .width('100%')
        .fontSize(12)
        .fontColor(Color.Orange)
        .textAlign(TextAlign.Center)
        .margin(10)
      
      Text('操作结果显示区域：')
        .width('100%')
        .fontSize(14)
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 5 })
      
      // 显示操作结果的区域
      RichEditor(this.displayOptions)
        .id('displayRichEditor0003_060')
        .width('100%')
        .height(100)
        .border({ width: 1, color: Color.Green })
        .borderRadius(8)
        .padding(8)
        .backgroundColor('#F0F8FF')
        .margin(10)
      
      // 主要测试区域
      Scroll(this.scroller) {
        RichEditor(this.options)
          .id('richEditor0003_060')
          .width('100%')
          .height(100)
          .border({ width: 1, color: Color.Gray })
          .borderRadius(8)
          .padding(8)
      }
      .width('100%')
      .height('16.39%')
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.On)
      .scrollBarColor('#999999')
      .scrollBarWidth(8)

      
      Row() {
        Button('添加文本')
          .id('inputBtn0003_060_1')
          .width('45%')
          .height(40)
          .margin(5)
          .onClick(() => {
            this.operationCount++
            this.controller.addTextSpan(`测试文本${this.operationCount}`, {
              style: {
                fontSize: 16,
                fontColor: Color.Black
              }
            })
            
            this.displayController.deleteSpans()
            this.displayController.addTextSpan(`第${this.operationCount}次：添加文本成功\n内容: 测试文本${this.operationCount}\n请点击更新样式按钮`, {
              style: {
                fontSize: 12,
                fontColor: Color.Green
              }
            })
          })
        
        Button('更新文本样式')
          .id('updateBtn0003_060_1')
          .width('45%')
          .height(40)
          .margin(5)
          .onClick(() => {
            // 获取最后一个span并更新样式
            const allSpans = this.controller.getSpans({ start: -1, end: -1 })
            if (allSpans.length > 0) {
              const lastSpan = allSpans[allSpans.length - 1]
              const textSpan = lastSpan as RichEditorTextSpanResult
              
              if (textSpan && textSpan.textStyle && textSpan.value) {
                // 计算最后一个span的位置
                let totalLength = 0
                for (let i = 0; i < allSpans.length - 1; i++) {
                  const span = allSpans[i] as RichEditorTextSpanResult
                  if (span && span.textStyle && span.value) {
                    totalLength += span.value.length
                  } else {
                    totalLength += 1
                  }
                }
                
                // 更新最后一个span的样式
                const colors: Color[] = [Color.Red, Color.Blue, Color.Green, Color.Orange, Color.Pink]
                const fontSize = 18 + (this.operationCount % 3) * 2
                
                this.controller.updateSpanStyle({
                  start: totalLength,
                  end: totalLength + textSpan.value.length,
                  textStyle: {
                    fontSize: fontSize,
                    fontColor: colors[this.operationCount % colors.length]
                  }
                })
                
                this.displayController.deleteSpans()
                this.displayController.addTextSpan(`样式更新成功\n字体大小: ${fontSize}\n颜色已更新\n操作次数: ${this.operationCount}`, {
                  style: {
                    fontSize: 12,
                    fontColor: Color.Blue
                  }
                })
              }
            } else {
              this.displayController.deleteSpans()
              this.displayController.addTextSpan('没有文本可更新，请先添加文本', {
                style: {
                  fontSize: 12,
                  fontColor: Color.Red
                }
              })
            }
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)
      
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}
