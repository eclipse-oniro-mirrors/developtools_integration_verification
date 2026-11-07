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
 * 双击文本不执行onLongPress回调
 * SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ACTION_0330
 */
@Entry
@ComponentV2
export struct UiComponentTextRicheditorACTION0330 {
  controller: RichEditorController = new RichEditorController();

  aboutToAppear(): void {
    this.controller.addTextSpan('双击此文本测试，观察是否触发onLongPress回调', {
      style: { fontSize: 16 }
    });
  }

  build() {
    Scroll() {
      Column() {
        Text('双击文本不执行onLongPress回调')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 10, bottom: 10 })
          .textAlign(TextAlign.Center)

        Text('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_ACTION_0330')
          .fontSize(11)
          .fontColor('#666')
          .margin({ bottom: 10 })

        RichEditor({ controller: this.controller })
          .width('95%')
          .height(150)
          .border({ width: 1, color: '#ddd' })
          .borderRadius(5)
          .margin({ bottom: 10 })

        Text('测试步骤：')
          .fontSize(12)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 10, bottom: 5 })
          .alignSelf(ItemAlign.Start)

        Text('1、安装hap\n2、双击文本内容')
          .fontSize(10)
          .width('95%')
          .margin({ bottom: 10 })

        Text('预期结果：')
          .fontSize(12)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 5, bottom: 5 })
          .alignSelf(ItemAlign.Start)

        Text('2、不会执行onLongPress回调')
          .fontSize(10)
          .width('95%')
          .fontColor('#FF6B35')
          .margin({ bottom: 15 })

        Button('测试完成')
          .id('btn')
          .width('80%')
          .onClick(() => {
            // 截图测试
          })

        Text('说明: 请手动双击文本观察是否触发长按回调')
          .fontSize(9)
          .fontColor('#999')
          .margin({ top: 10 })
          .textAlign(TextAlign.Center)
      }
      .width('100%')
      .padding(10)
    }
    .width('100%')
    .height('100%')
  }
}
