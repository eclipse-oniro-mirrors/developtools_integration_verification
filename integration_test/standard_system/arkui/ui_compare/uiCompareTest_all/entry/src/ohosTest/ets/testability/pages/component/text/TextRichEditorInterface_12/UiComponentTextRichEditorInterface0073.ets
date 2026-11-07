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
struct UiComponentTextRichEditorInterface0073 {
  scroller: Scroller = new Scroller();
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  
  // 用于显示回调信息的RichEditor
  displayController: RichEditorController = new RichEditorController();
  displayOptions: RichEditorOptions = { controller: this.displayController };

  build() {
    Column() {
      // 提示信息
      Text('先输入文本，然后改变typingStyle在原有span之间输入文本')
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
        .id('displayRichEditor0073')
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
          .id('richEditor0073')
          .width('100%')
          .height(100)
          .border({ width: 1, color: Color.Gray })
          .borderRadius(8)
          .padding(8)
          .placeholder('请先输入一些文本内容...')
          .aboutToIMEInput((value: RichEditorInsertValue) => {
            // aboutToIMEInput回调
            const insertInfo = JSON.stringify(value)
            console.log('aboutToIMEInput - 插入信息:', insertInfo)
            
            // 获取当前光标位置
            const caretOffset = this.controller.getCaretOffset()
            
            this.displayController.deleteSpans()
            this.displayController.addTextSpan('aboutToIMEInput触发\n光标位置: ' + caretOffset + '\n插入信息:\n' + insertInfo + '\n返回值: true', {
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
            
            // 获取当前的spans信息
            const currentSpans = JSON.stringify(this.controller.getSpans({ start: -1, end: -1 }))
            
            this.displayController.addTextSpan('\n\nonIMEInputComplete触发\n输入完成信息:\n' + completeInfo + '\n当前spans:\n' + currentSpans, {
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

      
      Row() {
        Button('添加初始文本')
          .id('addInitTextBtn0073')
          .width('45%')
          .height(40)
          .margin(5)
          .onClick(() => {
            this.controller.addTextSpan('开始文本', {
              style: {
                fontSize: 16,
                fontColor: Color.Black
              }
            })
            this.controller.addTextSpan('结尾文本', {
              style: {
                fontSize: 16,
                fontColor: Color.Black
              }
            })
            
            // 将光标移动到两个span之间
            this.controller.setCaretOffset(4)
            
            this.displayController.deleteSpans()
            this.displayController.addTextSpan('已添加初始文本\n光标已定位到两个span之间\n请改变typingStyle后输入文本', {
              style: {
                fontSize: 12,
                fontColor: Color.Orange
              }
            })
          })
        
        Button('改变typingStyle')
          .id('changeStyleBtn0073')
          .width('45%')
          .height(40)
          .margin(5)
          .onClick(() => {
            this.controller.setTypingStyle({
              fontSize: 20,
              fontColor: Color.Red
            })
            
            this.displayController.deleteSpans()
            this.displayController.addTextSpan('typingStyle已改变\n字体大小: 20\n字体颜色: 红色\n现在请在span之间输入文本', {
              style: {
                fontSize: 12,
                fontColor: Color.Pink
              }
            })
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)
      
      Button('清空内容重新测试')
        .id('clearBtn0073')
        .width('80%')
        .height(40)
        .margin(10)
        .backgroundColor(Color.Gray)
        .onClick(() => {
          this.controller.deleteSpans()
          this.displayController.deleteSpans()
          this.displayController.addTextSpan("内容已清空\n请点击'添加初始文本'开始测试", {
            style: {
              fontSize: 12,
              fontColor: Color.Gray
            }
          })
        })
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}
