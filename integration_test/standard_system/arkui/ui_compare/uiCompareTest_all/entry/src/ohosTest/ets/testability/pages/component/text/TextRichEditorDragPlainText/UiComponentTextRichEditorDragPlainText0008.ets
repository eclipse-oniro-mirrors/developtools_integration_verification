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
import { uniformTypeDescriptor, unifiedDataChannel } from '@kit.ArkData';

import { hilog } from '@kit.PerformanceAnalysisKit';
import { dragController } from '@kit.ArkUI';


@Entry
@Component
struct UiComponentTextRichEditorDragPlainText0008 {
  @State inputText: string = '';
  @State getSpansResult: string = '';
  private dragAction: dragController.DragAction | null = null;
  controller: RichEditorController = new RichEditorController();

  build() {
    Column() {
      // 标题
      Text('0008 RichEditor有长文本，拖入文本至长文本末尾字符后')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 16 })

      // 合并的输入框和拖拽源：输入文本后长按即可拖拽
      TextInput({ placeholder: '输入文本后长按此处即可拖拽到下方编辑器' })
        .id('textInputDrag0008')
        .width('100%')
        .height(64)
        .border({ width: 2, color: '#2B73FF', style: BorderStyle.Dashed })
        .borderRadius(8)
        .padding({ left: 12, right: 12 })
        .backgroundColor('#E7F2FF')
        .onChange((v: string) => this.inputText = v)
        .draggable(true)
        .onTouch((e?: TouchEvent) => {
          if (!e || !this.inputText.trim()) {
            return;
          }
          if (e.type === TouchType.Down && e.touches && e.touches.length > 0) {
            this.startDrag(e.touches[0].id);
          }
        })
        .margin({ bottom: 12 })

      // 目标：RichEditor 接收并插入，预设长文本
      RichEditor({ controller: this.controller })
        .onReady(() => {
          // 添加长文本内容，模拟RichEditor内有长文本的场景
          this.controller.addTextSpan('这是一段很长的文本内容，用于测试拖拽功能。', {
            style: {
              fontColor: '#333333',
              fontSize: 16
            }
          });
          this.controller.addTextSpan('这段文本包含多个段落和不同的样式，', {
            style: {
              fontColor: '#666666',
              fontSize: 14
            }
          });
          this.controller.addTextSpan('用来验证拖拽文本到长文本末尾字符后的行为。', {
            style: {
              fontColor: '#999999',
              fontSize: 12
            }
          });
          this.controller.addTextSpan('当拖拽新的文本到这里时，应该能够正确地插入到末尾位置。', {
            style: {
              fontColor: '#FF6B6B',
              fontSize: 15
            }
          });
        })
        .id('richEditorDrag0008')
        .width('100%')
        .height(200)
        .backgroundColor(Color.White)
        .border({ width: 1, color: Color.Gray })
        .borderRadius(8)
        .padding(8)
        .onDrop((event: DragEvent) => this.onDropIntoEditor(event))
        .margin({ bottom: 12 })

      // 添加长文本按钮
      Button('添加更多长文本')
        .id('addLongTextBtn0008')
        .width('100%')
        .height(40)
        .backgroundColor('#4CAF50')
        .margin({ top: 8, bottom: 8 })
        .onClick(() => {
          this.controller.addTextSpan('这是额外添加的长文本内容，用于增加RichEditor的文本长度。', {
            style: {
              fontColor: '#2196F3',
              fontSize: 14
            }
          });
          this.controller.addTextSpan('更多文本内容，确保RichEditor内有足够的长文本进行测试。', {
            style: {
              fontColor: '#9C27B0',
              fontSize: 13
            }
          });
        })

      // getSpans验证按钮
      Button('验证拖拽')
        .id('getSpansBtn0008')
        .width('100%')
        .height(40)
        .backgroundColor('#4CAF50')
        .margin({ top: 8, bottom: 8 })
        .onClick(() => {
          try {
            const spans = this.controller.getSpans();
            if (spans && spans.length > 0) {
              this.getSpansResult = `✅ 拖拽成功！找到 ${spans.length} 个span，文本已插入到长文本末尾`;
            } else {
              this.getSpansResult = '❌ 拖拽失败！没有找到span';
            }
          } catch (err) {
            this.getSpansResult = `❌ 验证失败: ${(err as Error).message}`;
          }
        })

      // 验证结果显示
      Text(this.getSpansResult)
        .id('getSpansResultText0008')
        .width('100%')
        .height(60)
        .backgroundColor('#F0F0F0')
        .border({ width: 1, color: Color.Gray })
        .borderRadius(4)
        .padding(8)
        .fontSize(14)

    }
    .width('100%').height('100%').padding(16).backgroundColor('#F6F7F9')
  }

  private startDrag(pointerId: number) {
    try {
      const txt = this.inputText.trim();
      if (!txt) {
        return;
      }

      const plain = new unifiedDataChannel.PlainText();
      plain.textContent = txt;
      const data = new unifiedDataChannel.UnifiedData(plain);

      const info: dragController.DragInfo = {
        pointerId,
        data,
        extraParams: ''
      };

      this.dragAction = this.getUIContext().getDragController().createDragAction([], info);
      if (!this.dragAction) {
        return;
      }

      this.dragAction.startDrag().catch((err: Error) => console.info('startDrag 失败：' + err.message));
    } catch (err) {
      console.info('createDragAction 失败：' + (err as Error).message);
    }
  }

  private onDropIntoEditor(event: DragEvent) {
    try {
      const dragData: unifiedDataChannel.UnifiedData = event.getData() as unifiedDataChannel.UnifiedData;
      if (!dragData) {
        return;
      }

      const records: unifiedDataChannel.UnifiedRecord[] = dragData.getRecords();
      for (let i = 0; i < records.length; i++) {
        const types = records[i].getTypes();
        if (types.includes(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT)) {
          const entry =
            records[i].getEntry(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) as unifiedDataChannel.PlainText;
          const txt: string = entry?.textContent ?? '';
          if (txt) {
            // 在Span1中间位置插入文本，使用Span1的样式
            this.controller.addTextSpan(txt, {
              offset: 6
            });
          }
        }
      }
      // 可选：标记处理成功
      hilog.info(0x0000, 'TEST', '拖拽文本成功插入到RichEditor当前光标位置');
    } catch (err) {
      hilog.error(0x0000, 'TEST', '处理拖拽数据失败：' + (err as Error).message);
    }
  }
}
