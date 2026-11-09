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
struct UiComponentTextRichEditorInterface0069 {
  scroller: Scroller = new Scroller();
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  
  // 用于显示回调信息的RichEditor
  displayController: RichEditorController = new RichEditorController();
  displayOptions: RichEditorOptions = { controller: this.displayController };

  aboutToAppear() {
    // 设置typingStyle
    this.controller.setTypingStyle({
      fontSize: 24,
      fontColor: Color.Red
    })
  }

  build() {
    Column() {
      // 提示信息
      Text('设置typingStyle后输入emoji，测试aboutToIMEInput和onIMEInputComplete回调')
        .width('100%')
        .fontSize(12)
        .fontColor(Color.Orange)
        .textAlign(TextAlign.Center)
        .margin(10)
      
      Text('回调信息显示区域：')
        .width('100%')
        .fontSize(14)
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 5 })
      
      // 显示回调信息的区域
      RichEditor(this.displayOptions)
        .id('displayRichEditor0069')
        .width('100%')
        .height(100)
        .border({ width: 1, color: Color.Green })
        .borderRadius(8)
        .padding(8)
        .backgroundColor('#F0F8FF')
        .margin(10)
      
      // 主要输入区域
      Scroll(this.scroller) {
        RichEditor(this.options)
          .id('richEditor0069')
          .width('100%')
          .height(100)
          .border({ width: 1, color: Color.Gray })
          .borderRadius(8)
          .padding(8)
          .placeholder('请输入emoji表情符号...')
          .aboutToIMEInput((value: RichEditorInsertValue) => {
            // aboutToIMEInput回调
            const insertInfo = JSON.stringify(value)
            console.log('aboutToIMEInput - 插入信息:', insertInfo)

            this.displayController.deleteSpans()
            this.displayController.addTextSpan('aboutToIMEInput触发\n插入信息:\n' + insertInfo + '\n返回值: true', {
              style: {
                fontSize: 12,
                fontColor: Color.Blue
              }
            })

            return true // 返回值设置为true
          })
          .onIMEInputComplete((value: RichEditorTextSpanResult) => {
            // onIMEInputComplete回调
            const completeInfo = JSON.stringify(value)
            console.log('onIMEInputComplete - 输入完成信息:', completeInfo)

            // 获取当前的spans信息来验证样式
            const currentSpans = JSON.stringify(this.controller.getSpans({ start: -1, end: -1 }))

            this.displayController.addTextSpan('\n\nonIMEInputComplete触发\n输入完成信息:\n' + completeInfo + '\n当前spans样式:\n' + currentSpans, {
              style: {
                fontSize: 12,
                fontColor: Color.Green
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
      
      // 重置typingStyle按钮
      Button('重置typingStyle样式')
        .id('resetStyleBtn0069')
        .width('80%')
        .height(40)
        .margin(10)
        .onClick(() => {
          this.controller.setTypingStyle({
            fontSize: 24,
            fontColor: Color.Red
          })
          
          this.displayController.deleteSpans()
          this.displayController.addTextSpan('typingStyle已重置\n字体大小: 24\n字体颜色: 红色\n请输入emoji测试样式效果', {
            style: {
              fontSize: 12,
              fontColor: Color.Orange
            }
          })
        })
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}
