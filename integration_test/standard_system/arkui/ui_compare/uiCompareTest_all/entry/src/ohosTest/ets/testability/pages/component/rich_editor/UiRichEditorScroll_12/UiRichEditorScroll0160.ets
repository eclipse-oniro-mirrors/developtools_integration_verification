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
struct UiRichEditorScroll0160 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };

  build() {
    Column() {
      Text('RichEditor输入、删除字符，多行文本自动滚动测试')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 16 })

      // RichEditor组件 - 固定高度，测试自动滚动
      RichEditor(this.options)
        .id('richEditor0160')
        .width('100%')
        .height(200)  // 固定较小高度，便于测试自动滚动
        .border({ width: 1, color: Color.Gray })
        .borderRadius(8)
        .padding(8)
        .backgroundColor(Color.White)
        .onReady(() => {
          // 初始化时添加少量内容
          this.controller.addTextSpan('测试开始：', {
            style: {
              fontSize: 30,
              fontColor: Color.Black
            }
          });
        })
        .margin(10)

      Text('说明：点击RichEditor后，通过键盘输入字符测试自动滚动功能')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin(10)

    }
    .width('100%')
    .height('100%')
    .padding(16)
    .backgroundColor('#F6F7F9')
  }
}
