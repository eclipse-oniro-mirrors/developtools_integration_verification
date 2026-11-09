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
struct UiComponentTextRichEditorInterface0043 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  
  // 用于显示回调信息的RichEditor
  displayController: RichEditorController = new RichEditorController();
  displayOptions: RichEditorOptions = { controller: this.displayController };

  build() {
    Column() {
      // 提示信息
      Text('添加RichEditor组件，设置onIMEInputComplete回调')
        .width('100%')
        .fontSize(14)
        .fontColor(Color.Orange)
        .textAlign(TextAlign.Center)
        .margin(10)
        .fontWeight(FontWeight.Bold)
      
      Text('回调信息显示区域：')
        .width('100%')
        .fontSize(14)
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 5 })
      
      // 显示回调信息的区域
      RichEditor(this.displayOptions)
        .id('displayRichEditor0043')
        .width('100%')
        .height(120)
        .border({ width: 1, color: Color.Green })
        .borderRadius(8)
        .padding(8)
        .backgroundColor('#F0F8FF')
        .margin(10)

      // 主要测试区域
      Text('测试区域：')
        .width('100%')
        .fontSize(14)
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 5 })

      Button('更新文本样式')
        .id('updateStyleBtn0043')
        .width('45%')
        .height(40)
        .margin(5)
        .backgroundColor(Color.Red)
        .onClick(() => {
          // 2. 执行updateSpanStyle，指定选择内容的文本，应用TextSpan或SymbolSpan样式，更新后，更新后的样式符合预期
          const allSpans = this.controller.getSpans({ start: -1, end: -1 })
          if (allSpans.length > 0) {
            // 手动更新指定范围的文本样式
            this.controller.updateSpanStyle({
              start: 0,
              end: 8,
              textStyle: {
                fontSize: 22,
                fontColor: Color.Pink,
                fontWeight: FontWeight.Bold
              }
            })

            this.displayController.deleteSpans()
            this.displayController.addTextSpan('已手动调用updateSpanStyle\n更新范围: 0-8\n样式: 粉色、粗体、22px', {
              style: {
                fontSize: 12,
                fontColor: Color.Red,
                fontWeight: FontWeight.Bold
              }
            })
          } else {
            this.displayController.deleteSpans()
            this.displayController.addTextSpan('请先添加初始内容', {
              style: {
                fontSize: 12,
                fontColor: Color.Orange
              }
            })
          }
        })
      
      RichEditor(this.options)
        .id('richEditor0043')
        .width('100%')
        .height(120)
        .border({ width: 2, color: Color.Blue })
        .borderRadius(8)
        .padding(8)
        .placeholder('请在此处输入文本测试onIMEInputComplete回调')
        .margin(10)
        .onIMEInputComplete((value: RichEditorTextSpanResult) => {
          // 在onIMEInputComplete回调中：console.log(JSON.stringify(this.controller.updateSpanStyle))
          console.log('onIMEInputComplete回调:', JSON.stringify(value))
          console.log('updateSpanStyle方法:', JSON.stringify(this.controller.updateSpanStyle))
          
          // 1. 在RichEditor组件onIMEInputComplete回调内调用updateSpanStyle，将新指定选择内容的文本，应用TextSpan或SymbolSpan样式
          if (value && value.textStyle) {
            // 获取当前所有spans来确定新输入文本的位置
            const allSpans = this.controller.getSpans({ start: -1, end: -1 })
            let totalLength = 0
            for (let span of allSpans) {
              const textSpan = span as RichEditorTextSpanResult
              if (textSpan && textSpan.value) {
                totalLength += textSpan.value.length
              } else {
                totalLength += 1 // 对于非文本span（如图片、符号）
              }
            }
            
            // 对新输入的文本应用样式
            if (value.value && value.value.length > 0) {
              const startPos = totalLength - value.value.length
              this.controller.updateSpanStyle({
                start: startPos,
                end: totalLength,
                textStyle: {
                  fontSize: 20,
                  fontColor: Color.Blue,
                  fontWeight: FontWeight.Bold
                }
              })
            }
          }
          
          // 在回调显示的richeditor中显示IME输入完成的信息
          this.displayController.deleteSpans()
          this.displayController.addTextSpan('onIMEInputComplete回调触发\n输入内容: ' + JSON.stringify(value) + '\n已自动应用样式到新输入文本', {
            style: {
              fontSize: 12,
              fontColor: Color.Green,
              fontWeight: FontWeight.Bold
            }
          })
        })
      
      Row() {
        Button('添加初始内容')
          .id('addContentBtn0043')
          .width('45%')
          .height(40)
          .margin(5)
          .backgroundColor(Color.Green)
          .onClick(() => {
            // 添加初始测试内容
            this.controller.deleteSpans()
            this.controller.addTextSpan('初始文本内容，', {
              style: {
                fontSize: 16,
                fontColor: Color.Black
              }
            })
            
            // 添加SymbolSpan
            this.controller.addSymbolSpan($r('sys.symbol.heart_fill'), {
              style: {
                fontSize: 18,
                fontColor: [Color.Red]
              }
            })
            
            this.controller.addTextSpan('请继续输入文本。', {
              style: {
                fontSize: 16,
                fontColor: Color.Black
              }
            })
            
            this.displayController.deleteSpans()
            this.displayController.addTextSpan('初始内容已添加（包含TextSpan和SymbolSpan）\n请点击编辑器并输入文本触发onIMEInputComplete回调', {
              style: {
                fontSize: 12,
                fontColor: Color.Green
              }
            })
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
