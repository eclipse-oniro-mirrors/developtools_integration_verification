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
 * 自定义builder内设置拖拽事件测试
 * SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMLAYOUT_0140
 */
@Entry
@ComponentV2
export struct UiComponentTextRicheditorCUSTOMLAYOUT0140 {
  controller: RichEditorController = new RichEditorController();
  @Local dragStarted: boolean = false;

  @Builder
  CustomTextBuilder() {
    Text('这是自定义Builder组件')
      .fontSize(16)
      .padding(10)
      .backgroundColor('#FFE5E5')
      .borderRadius(5)
  }

  aboutToAppear(): void {
    this.controller.addTextSpan('RichEditor内容，可添加builder组件', {
      style: { fontSize: 16 }
    });
  }

  build() {
    Column() {
      Text('自定义builder内设置拖拽事件测试')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 10 })

      // 自定义builder组件
      Column() {
        this.CustomTextBuilder()
      }
      .margin({ bottom: 10 })
      .onDragStart(() => {
        this.dragStarted = true;
        return { pixelMap: undefined };
      })

      RichEditor({ controller: this.controller })
        .width('95%')
        .height(150)
        .border({ width: 1, color: '#ddd' })
        .borderRadius(5)
        .margin({ bottom: 10 })

      Text(`拖拽事件状态: ${this.dragStarted ? '✅ 已触发' : '⚠️ 未触发'}`)
        .fontSize(12)
        .fontColor(this.dragStarted ? Color.Green : Color.Gray)
        .margin({ bottom: 10 })

      Button('测试完成')
        .id('btn')
        .onClick(() => {})

      Text('预期结果：拖拽事件可生效')
        .fontSize(10)
        .fontColor('#FF6B35')
        .margin({ top: 10 })
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}
