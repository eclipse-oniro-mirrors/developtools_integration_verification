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
struct UiComponentTextRichEditorInterface0053 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };

  build() {
    Column() {
      // 提示信息
      Text('连续调用addImageSpan/addSymbolSpan和deleteSpans')
        .width('100%')
        .fontSize(16)
        .fontColor(Color.Black)
        .textAlign(TextAlign.Center)
        .margin(10)
      
      // 主要测试区域
      RichEditor(this.options)
        .id('richEditor0053')
        .width('100%')
        .height(200)
        .border({ width: 2, color: Color.Blue })
        .borderRadius(8)
        .padding(10)
        .margin(10)
      
      Row() {
        Button('添加图片和符号')
          .id('addImageBtn0053')
          .width('45%')
          .height(40)
          .margin(5)
          .onClick(() => {
            // 步骤1：调用addImageSpan添加内容
            this.controller.addImageSpan($r('app.media.icon'), {
              imageStyle: {
                size: [30, 30]
              }
            })
            
            // 步骤1：调用addSymbolSpan添加内容
            this.controller.addSymbolSpan($r('sys.symbol.star_fill'), {
              style: {
                fontSize: 20,
                fontColor: [Color.Red]
              }
            })
          })
        
        Button('删除内容')
          .id('deleteBtn0053')
          .width('45%')
          .height(40)
          .margin(5)
          .onClick(() => {
            // 步骤2：调用deleteSpans删除部分组件内容
            const allSpans = this.controller.getSpans({ start: -1, end: -1 })
            if (allSpans.length > 0) {
              // 删除最后一个span
              this.controller.deleteSpans({ start: allSpans.length - 1, end: allSpans.length })
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
