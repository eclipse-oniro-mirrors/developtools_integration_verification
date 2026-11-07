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
struct UiComponentTextRichEditorInterface0075 {
  scroller: Scroller = new Scroller();
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  
  // 用于显示回调信息的RichEditor
  displayController: RichEditorController = new RichEditorController();
  displayOptions: RichEditorOptions = { controller: this.displayController };

  private aboutToIMEInputTriggered: boolean = false
  private onIMEInputCompleteTriggered: boolean = false
  private onWillChangeTriggered: boolean = false

  build() {
    Column() {
      // 提示信息
      Text('onWillChange返回false，不触发aboutToIMEInput和onIMEInputComplete回调')
        .width('100%')
        .fontSize(12)
        .fontColor(Color.Orange)
        .textAlign(TextAlign.Center)
        .margin(10)
      
      Text('回调状态显示区域：')
        .width('100%')
        .fontSize(14)
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 5 })
      
      // 显示回调状态的区域
      RichEditor(this.displayOptions)
        .id('displayRichEditor0075')
        .width('100%')
        .height(120)
        .border({ width: 1, color: Color.Green })
        .borderRadius(8)
        .padding(8)
        .backgroundColor('#F0F8FF')
        .margin(10)

      Button('检查回调状态')
        .id('checkStatusBtn0075')
        .width('80%')
        .height(40)
        .margin(5)
        .onClick(() => {
          const onWillChangeStatus = this.onWillChangeTriggered ? '✅ 已触发（正常）' : '❌ 未触发（异常）'
          const aboutToIMEStatus = this.aboutToIMEInputTriggered ? '❌ 已触发（异常）' : '✅ 未触发（正常）'
          const onIMECompleteStatus = this.onIMEInputCompleteTriggered ? '❌ 已触发（异常）' : '✅ 未触发（正常）'

          this.displayController.deleteSpans()
          this.displayController.addTextSpan(`回调状态检查:\n\nonWillChange: ${onWillChangeStatus}\naboutToIMEInput: ${aboutToIMEStatus}\nonIMEInputComplete: ${onIMECompleteStatus}\n\n预期结果:\n- onWillChange应该被触发\n- 其他两个回调不应该被触发`, {
            style: {
              fontSize: 12,
              fontColor: (this.onWillChangeTriggered && !this.aboutToIMEInputTriggered && !this.onIMEInputCompleteTriggered) ? Color.Green : Color.Red
            }
          })
        })

      Button('重置测试状态')
        .id('resetBtn0075')
        .width('80%')
        .height(40)
        .margin(5)
        .backgroundColor(Color.Gray)
        .onClick(() => {
          this.aboutToIMEInputTriggered = false
          this.onIMEInputCompleteTriggered = false
          this.onWillChangeTriggered = false
          this.controller.deleteSpans()

          this.displayController.deleteSpans()
          this.displayController.addTextSpan('测试状态已重置\n请尝试输入文本\n输入应该被onWillChange阻止', {
            style: {
              fontSize: 12,
              fontColor: Color.Gray
            }
          })
        })
      
      // 主要输入区域
      Scroll(this.scroller) {
        RichEditor(this.options)
          .id('richEditor0075')
          .width('100%')
          .height(100)
          .border({ width: 1, color: Color.Gray })
          .borderRadius(8)
          .padding(8)
          .placeholder('尝试输入文本（应该无法输入）...')
          .onWillChange((value: RichEditorChangeValue) => {
            // onWillChange回调，返回false
            this.onWillChangeTriggered = true
            const changeInfo = JSON.stringify(value)
            console.log('onWillChange - 变化信息:', changeInfo)
            
            this.displayController.deleteSpans()
            this.displayController.addTextSpan('onWillChange触发\n返回值: false\n变化信息:\n' + changeInfo + '\n\n尝试输入应该被阻止', {
              style: {
                fontSize: 12,
                fontColor: Color.Pink
              }
            })
            
            return false // 返回值设置为false，阻止输入
          })
          .aboutToIMEInput((value: RichEditorInsertValue) => {
            // aboutToIMEInput回调（按需求不应该被触发）
            this.aboutToIMEInputTriggered = true
            const insertInfo = JSON.stringify(value)
            console.log('aboutToIMEInput - 插入信息:', insertInfo)

            return true // 让onWillChange来决定是否阻止
          })
          .onIMEInputComplete((value: RichEditorTextSpanResult) => {
            // onIMEInputComplete回调（按需求不应该被触发）
            this.onIMEInputCompleteTriggered = true
            const completeInfo = JSON.stringify(value)
            console.log('onIMEInputComplete - 输入完成信息:', completeInfo)

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
