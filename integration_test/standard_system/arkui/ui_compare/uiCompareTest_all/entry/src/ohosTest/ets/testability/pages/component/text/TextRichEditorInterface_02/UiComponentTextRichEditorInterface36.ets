/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct UiComponentTextRichEditorInterface36 {
  controller: RichEditorController = new RichEditorController();
  @State clickInfo: string = '请点击文字进行测试'

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0380')
        .fontSize(14)
        .fontColor(0x666666)
        .margin({ bottom: 10 })
        .margin({
          right: 22,
          bottom: 15 ,
          top:10,
          left:10
        })

      Text('TextSpan点击事件测试')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text(this.clickInfo)
        .fontSize(16)
        .fontColor(Color.Blue)
        .backgroundColor(0xF0F8FF)
        .padding(10)
        .border({ width: 1, color: Color.Blue, radius: 8 })
        .width('90%')
        .textAlign(TextAlign.Center)
        .margin({ bottom: 20 })

      RichEditor({ controller: this.controller })
        .id('UiComponentTextRichEditorInterface36')
        .onReady(() => {
          this.controller.addTextSpan('这是可点击的文字这是可点击的文字这是可点击的文字', {
            style: {
              fontColor: Color.Red,
              fontSize: 20,
              fontWeight: FontWeight.Bold,
              decoration: { type: TextDecorationType.Underline, color: Color.Red }
            },
            gesture: {
              onClick: () => {
                this.clickInfo = `文字被点击了！时间: ${new Date().toLocaleTimeString()}`
                console.log('TextSpan点击事件触发')
              }
            }
          })

          this.controller.addTextSpan('\n', {
            style: {
              fontColor: 0xCCCCCC,
              fontSize: 12,
            }
          })
          this.controller.addTextSpan('——————————————', {
            style: {
              fontColor: 0xCCCCCC,
              fontSize: 14,
              fontWeight: FontWeight.Medium,
              letterSpacing: 2
            }
          })
          this.controller.addTextSpan('\n', {
            style: {
              fontColor: 0xCCCCCC,
              fontSize: 12,
            }
          })

          this.controller.addTextSpan('这是普通文字', {
            style: {
              fontColor: Color.Black,
              fontSize: 16
            }
          })
        })
        .onWillChange((value: RichEditorChangeValue) => {
          console.info('测试log: onWillChange');
          console.info('rangeBefore: ' + JSON.stringify(value.rangeBefore));
          console.info('print replacedSpans');
          value.replacedSpans.forEach((item: RichEditorTextSpanResult) => {
            console.info('spanPosition:' + JSON.stringify(item.spanPosition));
            console.info('value:' + item.value);
            console.info('textStyle:' + JSON.stringify(item.textStyle));
            console.info('offsetInSpan:' + item.offsetInSpan);
            console.info('valueResource:' + item.valueResource);
            console.info('paragraphStyle:' + JSON.stringify(item.paragraphStyle));
          })
          return true;
        })
        .onIMEInputComplete((value: RichEditorTextSpanResult) => {
          console.info('---------------------- onIMEInputComplete ---------------------');
          console.info('spanIndex:' + value.spanPosition.spanIndex);
          console.info('spanRange:[' + value.spanPosition.spanRange[0] + ',' + value.spanPosition.spanRange[1] + ']');
          console.info('offsetInSpan:[' + value.offsetInSpan[0] + ',' + value.offsetInSpan[1] + ']');
          console.info('value:' + value.value);
        })
        .aboutToDelete((value: RichEditorDeleteValue) => {
          console.info('---------------------- aboutToDelete --------------------------');
          console.info('offset:' + value.offset);
          console.info('direction:' + value.direction);
          console.info('length:' + value.length);
          value.richEditorDeleteSpans.forEach(item => {
            console.info('---------------------- item --------------------------');
            console.info('spanIndex:' + item.spanPosition.spanIndex);
            console.info('spanRange:[' + item.spanPosition.spanRange[0] + ',' + item.spanPosition.spanRange[1] + ']');
            console.info('offsetInSpan:[' + item.offsetInSpan[0] + ',' + item.offsetInSpan[1] + ']');
            if (typeof (item as RichEditorImageSpanResult)['imageStyle'] != 'undefined') {
              console.info('image:' + (item as RichEditorImageSpanResult).valueResourceStr);
            } else {
              console.info('text:' + (item as RichEditorTextSpanResult).value);
            }
          })
          return true;
        })
        .borderWidth(2)
        .borderColor(Color.Gray)
        .width('90%')
        .height(200)
        .padding(10)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.Center)
  }
}