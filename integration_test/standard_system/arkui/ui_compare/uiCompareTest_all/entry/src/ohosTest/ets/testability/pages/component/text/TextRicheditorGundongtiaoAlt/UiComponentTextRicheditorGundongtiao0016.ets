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
 * 开发者文档测试
 * SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ gundongtiao_0016
 */
@Entry
@ComponentV2
export struct UiComponentTextRicheditorGundongtiao0016 {
  controller: RichEditorController = new RichEditorController();

  aboutToAppear(): void {
    // 添加大量图文混排内容
    for (let i = 0; i < 20; i++) {
      this.controller.addTextSpan(`第${i + 1}行文本内容：这是一段测试文本，用于测试滚动条的显示效果。`, {
        style: {
          fontSize: 14
        }
      });
      this.controller.addTextSpan('\n');
    }
  }

  build() {
    Column() {
      Text('开发者文档测试')
        .fontSize(13)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 10 })

      RichEditor({ controller: this.controller })

        .width('95%')
        .height(250)
        .border({ width: 1, color: '#ddd' })
        .borderRadius(5)
        .margin({ bottom: 10 })

      Button('测试完成')
        .id('btn')
        .onClick(() => {
          // 测试按钮
        })


      Text('测试步骤：')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 15, bottom: 5 })
        .alignSelf(ItemAlign.Start)

      Text('1、检查开发者文档')
        .fontSize(10)
        .width('95%')

      Text('预期结果：开发者文档编写正确')
        .fontSize(10)
        .fontColor('#FF6B35')
        .margin({ top: 10 })
    }
    .width('100%')
    .height('100%')
    .padding(10)
  }
}
