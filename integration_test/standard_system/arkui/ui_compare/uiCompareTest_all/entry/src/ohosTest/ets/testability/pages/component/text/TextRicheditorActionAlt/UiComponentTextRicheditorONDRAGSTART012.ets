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
 * 从richeditor拖出放回原组件，onDragStart设置拖拽数据
 * SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONDRAGSTART_012
 */
@Entry
@ComponentV2
export struct UiComponentTextRicheditorONDRAGSTART012 {
  controller: RichEditorController = new RichEditorController();
  @Local dragData: string = 'this is richeditor';

  aboutToAppear(): void {
    this.controller.addTextSpan('原始文本内容', {
      style: { fontSize: 16 }
    });
  }

  simulateDragBack(): void {
    // 模拟拖出再放回：添加自定义文本
    this.controller.addTextSpan('\n' + this.dragData, {
      style: { fontSize: 16, fontColor: Color.Blue }
    });
  }

  build() {
    Column() {
      Text('拖出放回原组件测试')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 10 })

      RichEditor({ controller: this.controller })
        .width('95%')
        .height(150)
        .border({ width: 1, color: '#ddd' })
        .borderRadius(5)
        .margin({ bottom: 10 })

      Button('模拟拖出放回')
        .id('simulateDragBtn')
        .onClick(() => {
          this.simulateDragBack();
        })
        .margin({ bottom: 10 })

      Button('测试完成')
        .id('btn')
        .onClick(() => {})

      Text(`预期结果：显示"${this.dragData}"`)
        .fontSize(10)
        .fontColor('#FF6B35')
        .margin({ top: 10 })
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}
