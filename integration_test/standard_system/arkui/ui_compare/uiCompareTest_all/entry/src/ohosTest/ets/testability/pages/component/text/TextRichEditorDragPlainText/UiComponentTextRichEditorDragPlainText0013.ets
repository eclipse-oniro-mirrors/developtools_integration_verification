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
struct UiComponentTextRichEditorDragPlainText0013 {
  @State inputText: string = '';
  @State getSpansResult: string = '';
  private dragAction: dragController.DragAction | null = null;
  controller: RichEditorController = new RichEditorController();


  aboutToAppear() {
    // 初始化RichEditor内容：包含文本和图片
    this.controller.addTextSpan('欢迎使用RichEditor！')
    this.controller.addImageSpan($r('sys.media.ohos_app_icon'))
    this.controller.addTextSpan(' 这是一个测试图片。')
  }

  build() {
    Column() {
      // 标题
      Text('文本和图片同时拖拽测试')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 16 })

      // 文本框：输入文本和图片
      TextInput({ placeholder: '输入文本和图片内容' })
        .id('textInputDrag0013')
        .width('100%').height(120)
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

      // 目标：RichEditor 接收并插入
      RichEditor({ controller: this.controller })
        .id('richEditorDrag0013')
        .width('100%').height(220)
        .backgroundColor(Color.White)
        .border({ width: 1, color: Color.Gray }).borderRadius(8)
        .padding(8)
        .onDrop((event: DragEvent) => this.onDropIntoEditor(event))
        .margin({ bottom: 12 })

      // 添加图片
      Button('添加图片')
        .id('addImage0013')
        .width('100%')
        .height(40)
        .backgroundColor('#4CAF50')
        .onClick(()=>{
          this.controller.addImageSpan($r('sys.media.ohos_app_icon'), {
            imageStyle: {
              size: ['30px', '30px']
            }
          })

        })
      // getSpans验证按钮 - 直接在onClick中写逻辑
      Button('验证拖拽')
        .id('getSpansBtn0013')
        .width('100%')
        .height(40)
        .backgroundColor('#4CAF50')
        .onClick(() => {
          try {
            const spans = this.controller.getSpans();
            if (spans && spans.length > 0) {
              this.getSpansResult = `✅ 拖拽成功！找到 ${spans.length} 个span`;
            } else {
              this.getSpansResult = '❌ 拖拽失败！没有找到span';
            }
          } catch (err) {
            this.getSpansResult = `❌ 验证失败: ${(err as Error).message}`;
          }
        })
        .margin({ bottom: 8 })

      // 验证结果显示
      Text(this.getSpansResult)
        .id('getSpansResultText0013')
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

      // 创建包含文本和图片的混合数据
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
          const entry = records[i].getEntry(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) as unifiedDataChannel.PlainText;
          const txt: string = entry?.textContent ?? '';
          if (txt) {
            this.controller.addTextSpan(txt);
          }
        }
      }
      hilog.info(0x0000, 'TEST', '拖拽文本和图片成功插入到RichEditor');
    } catch (err) {
      hilog.error(0x0000, 'TEST', '处理拖拽数据失败：' + (err as Error).message);
    }
  }
}
