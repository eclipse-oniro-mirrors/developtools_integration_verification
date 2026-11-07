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
 * 自定义菜单扩展项使用系统id
 * SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMMENU_0002
 */
@Entry
@ComponentV2
export struct RicheditorCustommenu0002 {
  controller: RichEditorController = new RichEditorController();
  @Local menuResult: string = '';

  build() {
    Scroll() {
      Column() {
        Text('自定义菜单扩展项使用系统id')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 10, bottom: 10 })

        Text('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_CUSTOMMENU_0002')
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
          .bindSelectionMenu(RichEditorSpanType.TEXT, this.panel, ResponseType.LongPress, {
            onDisappear: () => {
              this.menuResult = '菜单消失';
            }
          })

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

        Text('1. 双击文本内容选中\n2. 观察选择菜单是否显示自定义扩展项\n3. 点击扩展项观察是否执行系统逻辑')
          .fontSize(10)
          .width('95%')
          .margin({ bottom: 10 })

        Text('预期结果：')
          .fontSize(12)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 5, bottom: 5 })
          .alignSelf(ItemAlign.Start)

        Text('出现选择菜单，显示自定义菜单扩展项，点击按钮执行对应系统逻辑')
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
        MenuItem({ content: '复制', labelInfo: 'Ctrl+C' })
          .onClick(() => {
            this.menuResult = '点击了系统复制';
          })
        MenuItem({ content: '粘贴', labelInfo: 'Ctrl+V' })
          .onClick(() => {
            this.menuResult = '点击了系统粘贴';
          })
        MenuItem({ content: '剪切', labelInfo: 'Ctrl+X' })
          .onClick(() => {
            this.menuResult = '点击了系统剪切';
          })
      }
    }
  }

  aboutToAppear(): void {
    this.controller.addTextSpan('这是一段可以选中的测试文本，双击选中后会显示自定义菜单。', {
      style: {
        fontColor: Color.Black,
        fontSize: 14
      }
    });
  }
}
