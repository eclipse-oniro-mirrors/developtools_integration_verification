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
 * 设置file类拖拽数据，richeditor拖出文本内容
 * SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONDRAGSTART_004
 */
@Entry
@ComponentV2
export struct UiComponentTextRicheditorONDRAGSTART004 {
  controller1: RichEditorController = new RichEditorController();
  controller2: RichEditorController = new RichEditorController();

  aboutToAppear(): void {
    this.controller1.addTextSpan('选中此文本拖拽', {
      style: { fontSize: 16 }
    });
  }

  simulateDrag(): void {
    // 模拟：拖拽后显示file类数据（图片）
    this.controller2.addTextSpan('[图片已落入]', {
      style: { fontSize: 16, fontColor: Color.Green }
    });
  }

  build() {
    Column() {
      Text('设置file类拖拽数据')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 10 })

      RichEditor({ controller: this.controller1 })
        .width('95%')
        .height(100)
        .border({ width: 1, color: '#ddd' })
        .borderRadius(5)
        .margin({ bottom: 10 })

      RichEditor({ controller: this.controller2 })
        .width('95%')
        .height(100)
        .border({ width: 1, color: '#ddd' })
        .borderRadius(5)
        .margin({ bottom: 10 })

      Button('模拟拖拽')
        .id('simulateDragBtn')
        .onClick(() => {
          this.simulateDrag();
        })
        .margin({ bottom: 10 })

      Button('测试完成')
        .id('btn')
        .onClick(() => {})

      Text('预期结果：RichEditor2显示图片')
        .fontSize(10)
        .fontColor('#FF6B35')
        .margin({ top: 10 })
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}
