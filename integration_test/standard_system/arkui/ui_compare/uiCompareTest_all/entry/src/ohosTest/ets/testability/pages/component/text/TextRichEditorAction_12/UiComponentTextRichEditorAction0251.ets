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
struct UiComponentTextRichEditorAction0251 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };

  build() {
    Column({ space: 10 }) {
      Text('连续删除无卡顿')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 10 })

      Text('点击文本末尾拉起软键盘，长按删除键10秒后松手，观察删除操作是否顺畅无卡顿。')
        .fontSize(14)
        .fontColor(Color.Gray)
        .margin({ bottom: 10 })

      RichEditor(this.options)
        .id('rich_editor_action_0251')
        .width('100%')
        .height(300)
        .backgroundColor(Color.White)
        .border({ width: 2, color: Color.Blue })
        .borderRadius(8)
        .padding(8)
        .onReady(() => {
          // 添加大量文本用于测试连续删除
          let longText = '';
          for (let i = 1; i <= 20; i++) {
            longText += `第${i}行：这是用于测试连续删除功能的长文本内容，请点击文本末尾拉起软键盘后长按删除键。\n`;
          }
          
          this.controller.addTextSpan(longText, {
            style: {
              fontSize: 16,
              fontColor: Color.Black
            }
          });
        })
    }
    .width('100%')
    .height('100%')
    .padding(15)
    .backgroundColor('#F6F7F9')
  }
}

