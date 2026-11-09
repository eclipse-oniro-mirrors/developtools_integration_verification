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
import { hilog } from '@kit.PerformanceAnalysisKit';

@Entry
@Component
struct UiComponentTextRichEditorAction0070197 {
  controller: RichEditorController = new RichEditorController();
  options: RichEditorOptions = { controller: this.controller };
  infoController: RichEditorController = new RichEditorController();
  infoOptions: RichEditorOptions = { controller: this.infoController };

  aboutToAppear(): void {
    this.infoController.addTextSpan('点击按钮添加文本，观察光标位置', {
      style: {
        fontSize: 14,
        fontColor: Color.Gray
      }
    });
  }

  build() {
    Column({ space: 10 }) {
      Text('addTextSpan设置offset大于总字符串长度')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 10 })

      Button('添加文本(offset大于长度)')
        .id('button_action_0070197_add')
        .fontSize(14)
        .width('60%')
        .alignSelf(ItemAlign.Center)
        .margin({ bottom: 10 })
        .onClick(() => {
          // 获取当前文本长度
          let spans = this.controller.getSpans({ start: 0, end: -1 });
          let totalLength = 0;
          for (let span of spans) {
            totalLength += span.offsetInSpan[1] - span.offsetInSpan[0];
          }
          
          // 设置offset为总长度+100（远大于实际长度）
          let largeOffset = totalLength + 100;
          hilog.info(0x0000, 'TEST', `当前文本长度: ${totalLength}, 设置offset: ${largeOffset}`);
          
          this.controller.addTextSpan('【新增文本】', {
            offset: largeOffset,
            style: {
              fontSize: 16,
              fontColor: Color.Red,
              fontWeight: FontWeight.Bold
            }
          });

          // 获取光标位置
          let caretRect = this.controller.getCaretRect();
          if (caretRect) {
            hilog.info(0x0000, 'TEST', `添加后光标位置: x=${caretRect.x}, y=${caretRect.y}`);
            this.infoController.deleteSpans({ start: 0, end: -1 });
            this.infoController.addTextSpan(
              `原文本长度: ${totalLength}\n设置offset: ${largeOffset}\n添加后光标位置:\nx=${caretRect.x}, y=${caretRect.y}`,
              {
                style: {
                  fontSize: 12,
                  fontColor: Color.Orange
                }
              }
            );
          }
        })

      Text('光标位置信息')
        .fontSize(13)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      RichEditor(this.infoOptions)
        .id('rich_editor_action_0070197_info')
        .width('100%')
        .height(100)
        .backgroundColor('#F0F0F0')
        .border({ width: 1, color: Color.Gray })
        .borderRadius(8)
        .padding(8)
        .margin({ bottom: 10 })

      Text('RichEditor组件')
        .fontSize(13)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      RichEditor(this.options)
        .id('rich_editor_action_0070197')
        .width('100%')
        .height(200)
        .backgroundColor(Color.White)
        .border({ width: 2, color: Color.Blue })
        .borderRadius(8)
        .padding(8)
        .onReady(() => {
          this.controller.addTextSpan('这是初始文本内容。', {
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

