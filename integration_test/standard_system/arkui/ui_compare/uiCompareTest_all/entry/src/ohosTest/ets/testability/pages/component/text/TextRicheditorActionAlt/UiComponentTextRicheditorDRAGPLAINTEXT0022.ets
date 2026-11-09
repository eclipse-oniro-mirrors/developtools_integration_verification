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

/**
 * RichEditor设置enabled(false)禁止交互
 * SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_DRAGPLAINTEXT_0022
 */
@Entry
@ComponentV2
export struct UiComponentTextRicheditorDRAGPLAINTEXT0022 {
  controller: RichEditorController = new RichEditorController();
  @Local sourceText: string = '这是用于拖拽的源文本';

  aboutToAppear(): void {
    this.controller.addTextSpan('RichEditor已设置enabled(false)，文本无法拖入', {
      style: { fontSize: 16 }
    });
  }

  build() {
    Column() {
      Text('RichEditor设置enabled(false)禁止交互')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 10 })

      Text(this.sourceText)
        .fontSize(16)
        .padding(10)
        .backgroundColor('#E5F5FF')
        .borderRadius(5)
        .margin({ bottom: 10 })
        .draggable(true)

      RichEditor({ controller: this.controller })
        .width('95%')
        .height(150)
        .border({ width: 1, color: '#ddd' })
        .borderRadius(5)
        .margin({ bottom: 10 })
        .enabled(false)

      Button('测试完成')
        .id('btn')
        .onClick(() => {})

      Text('测试说明：请尝试长按上方蓝色文本拖拽到RichEditor中')
        .fontSize(10)
        .margin({ top: 5 })

      Text('预期结果：文本无法被拖入（enabled(false)生效）')
        .fontSize(10)
        .fontColor('#FF6B35')
        .margin({ top: 10 })
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}
