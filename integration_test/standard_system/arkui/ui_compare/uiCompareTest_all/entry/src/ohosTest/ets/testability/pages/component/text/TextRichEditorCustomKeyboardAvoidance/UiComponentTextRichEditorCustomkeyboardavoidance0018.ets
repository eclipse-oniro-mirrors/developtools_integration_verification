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

import { KeyboardAvoidMode } from '@kit.ArkUI';

@Entry
@Component
struct UiComponentTextRichEditorCustomkeyboardavoidance0018 {
  controller: RichEditorController = new RichEditorController();
  @State supportAvoidance: boolean = true;

  // 设置键盘避让模式
  aboutToAppear(): void {
    let uiContext = this.getUIContext();
    uiContext.setKeyboardAvoidMode(KeyboardAvoidMode.OFFSET_WITH_CARET);
  }

  // 自定义键盘组件
  @Builder
  CustomKeyboardBuilder() {
    Column() {
      Row() {
        Button('添加表情').onClick(() => {
          this.controller.addTextSpan('😊',
            {
              style:
              {
                fontColor: Color.Orange,
                fontSize: 50
              }
            })
        })
        .id('add_emoji_btn_0018')
      }
      .padding(5)

      Grid() {
        ForEach(['测', '试', '文', '本', '内', '容', '输', '入', '避', '让', '光', '标'], (item: string) => {
          GridItem() {
            Button(item)
              .width(110)
              .id(`keyboard_btn_${item}_0018`)
              .onClick(() => {
                this.controller.addTextSpan(item, {
                  offset: this.controller.getCaretOffset(),
                  style:
                  {
                    fontColor: Color.Black,
                    fontSize: 50
                  }
                })
                this.controller.setCaretOffset(this.controller.getCaretOffset() + item.toString().length)
              })
          }
        })
      }
      .maxCount(3)
      .columnsGap(10)
      .rowsGap(10)
      .padding(5)
    }
    .backgroundColor(Color.Gray)
    .height('100%')
  }

  build() {
    Column() {
      Text('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMKEYBOARDAVOIDANCE_0018')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 10 })

      Button('添加测试文本')
        .id('add_text_btn_0018')
        .margin({ bottom: 10 })
        .onClick(() => {
          this.controller.addTextSpan(
            '这是预填充的测试文本内容，用于快速填充编辑器。' +
            '这是预填充的测试文本内容，用于快速填充编辑器。' +
            '这是预填充的测试文本内容，用于快速填充编辑器。', {
              style: {
                fontSize: 50
              }
            }
          )
        })

      Blank()

      Text('请点击下方输入框，持续点击键盘按钮输入文字测试光标避让：')
        .fontSize(14)
        .margin({ bottom: 10 })

      RichEditor({ controller: this.controller })
        .id('richeditor_customkeyboardavoidance_0018')
        .customKeyboard(this.CustomKeyboardBuilder(), { supportAvoidance: this.supportAvoidance })
        .border({ width: 1 })
        .borderWidth(1)
        .borderColor(Color.Red)
        .width('60%')
        .height(100)
        .margin({ bottom: 20 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
    .justifyContent(FlexAlign.Start)
  }
}

