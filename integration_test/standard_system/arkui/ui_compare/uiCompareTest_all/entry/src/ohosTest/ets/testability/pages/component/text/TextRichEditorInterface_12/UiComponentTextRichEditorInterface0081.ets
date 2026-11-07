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
struct UiComponentTextRichEditorInterface0081 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  
  // 用于显示回调信息的RichEditor
  displayController: RichEditorController = new RichEditorController();
  displayOptions: RichEditorOptions = { controller: this.displayController };

  build() {
    Column() {
      // 提示信息
      Text('添加RichEditor组件，设置onSelectionChange回调')
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
        .id('displayRichEditor0081')
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
      
      RichEditor(this.options)
        .id('richEditor0081')
        .width('100%')
        .height(120)
        .border({ width: 2, color: Color.Blue })
        .borderRadius(8)
        .padding(8)
        .placeholder('请在此处输入文本，然后选择文本测试onSelectionChange回调')
        .margin(10)
        .onSelectionChange((value: RichEditorRange) => {
          // 在onSelectionChange回调中：console.log(JSON.stringify(this.controller.updateSpanStyle))
          console.log('onSelectionChange回调:', JSON.stringify(value))
          console.log('updateSpanStyle方法:', JSON.stringify(this.controller.updateSpanStyle))
          
          // 1. 在onSelectionChange回调内调用updateSpanStyle，将新指定选择内容的文本，应用TextSpan或SymbolSpan样式
          if (value.start !== value.end) {
            // 有选择内容时，自动应用样式
            this.controller.updateSpanStyle({
              start: value.start,
              end: value.end,
              textStyle: {
                fontSize: 18,
                fontColor: Color.Orange,
                fontWeight: FontWeight.Bold
              }
            })
          }
          
          // 在回调显示的richeditor中显示选择变化的信息
          this.displayController.deleteSpans()
          this.displayController.addTextSpan('onSelectionChange回调触发\n选择范围: ' + JSON.stringify(value) + '\n已自动应用样式到选中文本', {
            style: {
              fontSize: 12,
              fontColor: Color.Blue,
              fontWeight: FontWeight.Bold
            }
          })
        })
      
      Row() {
        Button('添加测试内容')
          .id('addContentBtn0081')
          .width('45%')
          .height(40)
          .margin(5)
          .backgroundColor(Color.Green)
          .onClick(() => {
            // 添加包含文本和符号的测试内容
            this.controller.deleteSpans()
            this.controller.addTextSpan('这是测试文本内容，', {
              style: {
                fontSize: 16,
                fontColor: Color.Black
              }
            })
            
            // 添加SymbolSpan
            this.controller.addSymbolSpan($r('sys.symbol.star_fill'), {
              style: {
                fontSize: 20,
                fontColor: [Color.Red]
              }
            })
            
            this.controller.addTextSpan('请选择部分文本来测试onSelectionChange回调和updateSpanStyle功能。', {
              style: {
                fontSize: 16,
                fontColor: Color.Black
              }
            })
            
            this.displayController.deleteSpans()
            this.displayController.addTextSpan('测试内容已添加（包含TextSpan和SymbolSpan）\n请选择文本触发onSelectionChange回调', {
              style: {
                fontSize: 12,
                fontColor: Color.Green
              }
            })
          })
        
        Button('改变文本位置')
          .id('changePositionBtn0081')
          .width('45%')
          .height(40)
          .margin(5)
          .backgroundColor(Color.Red)
          .onClick(() => {
            // 2. 改变选择区域或编辑器下文本位置触发onSelectionChange回调
            const allSpans = this.controller.getSpans({ start: -1, end: -1 })
            if (allSpans.length > 0) {
              // 程序化设置选择范围，触发onSelectionChange回调
              this.controller.setSelection(10, 20)
              
              this.displayController.deleteSpans()
              this.displayController.addTextSpan('已程序化改变选择位置\n新选择范围: 10-20\n这将触发onSelectionChange回调', {
                style: {
                  fontSize: 12,
                  fontColor: Color.Red,
                  fontWeight: FontWeight.Bold
                }
              })
            } else {
              this.displayController.deleteSpans()
              this.displayController.addTextSpan('请先添加测试内容', {
                style: {
                  fontSize: 12,
                  fontColor: Color.Orange
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
