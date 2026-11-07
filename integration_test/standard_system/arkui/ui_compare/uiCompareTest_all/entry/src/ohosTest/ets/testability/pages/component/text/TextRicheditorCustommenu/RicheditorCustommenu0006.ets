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
 * 自定义菜单content为超长文本，icon使用网络图片
 * SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMMENU_0006
 */
@Entry
@ComponentV2
export struct RicheditorCustommenu0006 {
  controller: RichEditorController = new RichEditorController();
  @Local menuResult: string = '';

  build() {
    Scroll() {
      Column() {
        Text('自定义菜单超长文本和网络图片')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 10, bottom: 10 })

        Text('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMMENU_0006')
          .fontSize(11)
          .fontColor('#666')
          .margin({ bottom: 15 })

        Text(`菜单操作: ${this.menuResult}`)
          .fontSize(12)
          .margin({ bottom: 10 })

        RichEditor({ controller: this.controller })
          .width('90%')
          .height(200)
          .border({ width: 1, color: '#ccc' })
          .margin({ bottom: 15 })
          .bindSelectionMenu(RichEditorSpanType.TEXT, this.panel, ResponseType.LongPress)

        Button('测试完成')
          .id('btn')
          .width('80%')
          .onClick(() => {})
          .margin({ bottom: 15 })

        Text('测试说明：')
          .fontSize(12)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 10, bottom: 5 })
          .alignSelf(ItemAlign.Start)

        Text('1. 双击文本内容选中\n2. 观察菜单扩展项显示效果')
          .fontSize(10)
          .width('95%')
          .margin({ bottom: 10 })

        Text('预期结果：')
          .fontSize(12)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 5, bottom: 5 })
          .alignSelf(ItemAlign.Start)

        Text('扩展项文本显示不全末尾添加省略号，网络图标不显示')
          .fontSize(10)
          .fontColor('#FF6B35')
          .width('95%')
      }
      .width('100%')
      .padding(10)
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  panel() {
    Column() {
      Menu() {
        MenuItem({
          content: '这是一段非常非常长的文本内容，用于测试菜单项文本过长时的显示效果',
          startIcon: ('https://' + 'www.example.com' + '/icon.png')
        })
          .onClick(() => {
            this.menuResult = '点击了超长文本菜单';
          })
      }
    }
  }

  aboutToAppear(): void {
    this.controller.addTextSpan('双击选中文本，查看超长文本和网络图片的显示效果。', {
      style: {
        fontColor: Color.Black,
        fontSize: 14
      }
    });
  }
}
