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
struct RichEditorSpan0017 {
  private controller: RichEditorController = new RichEditorController();
  build() {
    Column() {
      // 预填充内容的富文本编辑器
      RichEditor({ controller: this.controller })
        .onReady(()=>{
          this.controller.addTextSpan('测试内容:文本😊符号✅,');
          this.controller.addTextSpan('简单图文混排示例');
        })
        .width('100%')
        .height(200)
        .backgroundColor('#F9F9F9')
        .border({ width: 1, color: '#DDD' })
        .margin({ bottom: 20 })

      // 按钮组 1
      Row() {
        Button('Button1: getSpans()')
          .id('001701')
          .onClick(() => {
            console.log('Button1 点击:', JSON.stringify(this.controller.getSpans()));
          })
        Button('Button2: getSpans(0,1)')
          .id('001702')
          .onClick(() => {
            console.log('Button2 点击:', JSON.stringify(this.controller.getSpans({start:0, end:1})));
          })

        Text(JSON.stringify(this.controller.getSpans()))
          .margin({ bottom: 20 })
      }
      .width('100%')
      .margin({ bottom: 10 })

      // 按钮组 2
      Row() {
        Button('Button3: getSpans(1,2)')
          .id('001703')
          .onClick(() => {
            console.log('Button3 点击:', JSON.stringify(this.controller.getSpans({start:1, end:2})));
          })

        Button('Button4: getSpans(100,101)')
          .id('001704')
          .onClick(() => {
            console.log('Button4 点击:', JSON.stringify(this.controller.getSpans({start:100, end:101})));
          })
      }
      .width('100%')
      .margin({ bottom: 10 })

      // 按钮组 3
      Row() {
        Button('Button5: getSpans(2,1)')
          .id('001705')
          .onClick(() => {
            console.log('Button5 点击:', JSON.stringify(this.controller.getSpans({start:2, end:1})));
          })

        Button('Button6: getSpans(-1,-1)')
          .id('001706')
          .onClick(() => {
            console.log('Button6 点击:', JSON.stringify(this.controller.getSpans({start:-1, end:-1})));
          })
      }

      .width('100%')
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}