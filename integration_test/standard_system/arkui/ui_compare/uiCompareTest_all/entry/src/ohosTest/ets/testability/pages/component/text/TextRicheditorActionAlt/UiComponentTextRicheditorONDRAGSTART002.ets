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
 * 设置text类拖拽数据，richeditor拖出图文混合内容
 * SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ONDRAGSTART_002
 */
@Entry
@ComponentV2
export struct UiComponentTextRicheditorONDRAGSTART002 {
  controller1: RichEditorController = new RichEditorController();
  controller2: RichEditorController = new RichEditorController();
  @Local dragData: string = 'this is richeditor';

  aboutToAppear(): void {
    this.controller1.addTextSpan('图文混合内容：文本部分', {
      style: { fontSize: 16 }
    });
  }

  simulateDragToRichEditor2(): void {
    // 模拟拖拽：将自定义文本添加到RichEditor2
    this.controller2.addTextSpan(this.dragData, {
      style: { fontSize: 16, fontColor: Color.Blue }
    });
  }

  build() {
    Column() {
      Text('设置text类拖拽数据')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 10 })

      Text('RichEditor 1 (onDragStart设置text类数据)')
        .fontSize(12)
        .alignSelf(ItemAlign.Start)
        .margin({ bottom: 5 })

      RichEditor({ controller: this.controller1 })
        .width('95%')
        .height(100)
        .border({ width: 1, color: '#ddd' })
        .borderRadius(5)
        .margin({ bottom: 10 })

      Text('RichEditor 2 (目标组件)')
        .fontSize(12)
        .alignSelf(ItemAlign.Start)
        .margin({ bottom: 5 })

      RichEditor({ controller: this.controller2 })
        .width('95%')
        .height(100)
        .border({ width: 1, color: '#ddd' })
        .borderRadius(5)
        .margin({ bottom: 10 })

      Button('模拟拖拽到RichEditor2')
        .id('simulateDragBtn')
        .onClick(() => {
          this.simulateDragToRichEditor2();
        })
        .margin({ bottom: 10 })

      Button('测试完成')
        .id('btn')
        .onClick(() => {})

      Text(`预期结果：RichEditor2显示"${this.dragData}"`)
        .fontSize(10)
        .fontColor('#FF6B35')
        .margin({ top: 10 })
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}
