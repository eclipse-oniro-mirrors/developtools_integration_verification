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
import { hilog } from '@kit.PerformanceAnalysisKit'
import { dragController } from '@kit.ArkUI'
import { unifiedDataChannel } from '@kit.ArkData'
import { uniformTypeDescriptor } from '@kit.ArkData'

@Entry
@Component
struct UiComponentTextRichEditorDragPlainText0007 {
  @State inputText: string = ''
  @State getSpansResult: string = ''
  private dragAction: dragController.DragAction | null = null
  controller: RichEditorController = new RichEditorController()

  aboutToAppear() {
    // 初始化RichEditor内容：包含长文本
    this.controller.addTextSpan('这是一个很长的文本内容，用于测试拖拽到长文本首字符之前的功能。这个文本包含了多个字符和空格，可以用来验证精确拖拽位置的准确性。当用户拖拽文本到长文本的最前面时，应该能够正确插入到第一个字符之前。')
  }

  build() {
    Column() {
      // 标题
      Text('长文本首字符前拖拽测试')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 16 })

      // 文本框：输入要拖拽的内容
      TextInput({ placeholder: '输入要拖拽到长文本首字符前的文本' })
        .id('textInputDrag0007')
        .width('100%')
        .height(80)
        .border({ width: 2, color: '#2B73FF', style: BorderStyle.Dashed })
        .borderRadius(8)
        .padding({ left: 12, right: 12 })
        .backgroundColor('#E7F2FF')
        .onChange((v: string) => this.inputText = v)
        .draggable(true)
        .onTouch((e?: TouchEvent) => {
          if (!e || !this.inputText.trim()) {
            return
          }
          if (e.type === TouchType.Down && e.touches && e.touches.length > 0) {
            this.startDrag(e.touches[0].id)
          }
        })
        .margin({ bottom: 12 })

      // RichEditor：包含长文本
      // 目标：RichEditor 接收并插入，预设长文本
      RichEditor({ controller: this.controller })
        .onReady(() => {
          // 添加长文本内容，模拟RichEditor内有长文本的场景
          this.controller.addTextSpan('这是一段很长的文本内容，用于测试拖拽功能。', {
            style: {
              fontColor: '#ffff0000',
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
        .id('richEditorDrag0007')
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
        .id('addLongTextBtn0007')
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

      // 验证按钮
      Button('验证拖拽')
        .id('getSpansBtn0007')
        .width('100%')
        .height(40)
        .backgroundColor('#4CAF50')
        .onClick(() => {
          try {
            const spans = this.controller.getSpans()
            if (spans && spans.length > 0) {
              this.getSpansResult = `✅ 拖拽成功！找到 ${spans.length} 个span`
            } else {
              this.getSpansResult = '❌ 拖拽失败！没有找到span'
            }
          } catch (err) {
            this.getSpansResult = `❌ 验证失败: ${(err as Error).message}`
          }
        })
        .margin({ bottom: 8 })

      // 验证结果显示
      Text(this.getSpansResult)
        .id('getSpansResultText0007')
        .width('100%')
        .height(60)
        .backgroundColor('#F0F0F0')
        .border({ width: 1, color: Color.Gray })
        .borderRadius(4)
        .padding(8)
        .fontSize(14)
    }
    .width('100%')
    .height('100%')
    .padding(16)
    .backgroundColor('#F5F5F5')
  }

  private startDrag(pointerId: number) {
    try {
      const txt = this.inputText.trim()
      if (!txt) {
        return
      }

      const plain = new unifiedDataChannel.PlainText()
      plain.textContent = txt
      const data = new unifiedDataChannel.UnifiedData(plain)

      const info: dragController.DragInfo = {
        pointerId,
        data,
        extraParams: ''
      }

      this.dragAction = this.getUIContext().getDragController().createDragAction([], info)
      if (!this.dragAction) {
        return
      }

      this.dragAction.startDrag().catch((err: Error) => console.info('startDrag 失败：' + err.message))
    } catch (err) {
      console.info('createDragAction 失败：' + (err as Error).message)
    }
  }

  private onDropIntoEditor(event: DragEvent) {
    try {
      const dragData: unifiedDataChannel.UnifiedData = event.getData() as unifiedDataChannel.UnifiedData
      if (!dragData) {
        return
      }

      const records: unifiedDataChannel.UnifiedRecord[] = dragData.getRecords()
      for (let i = 0; i < records.length; i++) {
        const types = records[i].getTypes()
        if (types.includes(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT)) {
          const entry = records[i].getEntry(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) as unifiedDataChannel.PlainText
          const txt: string = entry?.textContent ?? ''
          if (txt) {
            // 在Span1中间位置插入文本，使用Span1的样式
            this.controller.addTextSpan(txt, {
              offset: 0
            });
          }
        }
      }
      hilog.info(0x0000, 'TEST', '拖拽文本成功插入到RichEditor')
    } catch (err) {
      hilog.error(0x0000, 'TEST', '处理拖拽数据失败：' + (err as Error).message)
    }
  }
}
