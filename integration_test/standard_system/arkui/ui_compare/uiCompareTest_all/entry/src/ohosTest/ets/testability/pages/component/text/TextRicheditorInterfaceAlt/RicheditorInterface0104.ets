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
 * 在onDeleteComplete回调内使用getSelection
 * SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0104
 */
@Entry
@ComponentV2
export struct RicheditorInterface0104 {
  controller: RichEditorController = new RichEditorController();
  @Local logText: string = '';

  build() {
    Scroll() {
      Column() {
        Text('onDeleteComplete回调内getSelection测试')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 10, bottom: 10 })

        Text('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_INTERFACE_0104')
          .fontSize(11)
          .fontColor('#666')
          .margin({ bottom: 15 })

        Text(`日志: ${this.logText}`)
          .fontSize(12)
          .margin({ bottom: 10 })

        RichEditor({ controller: this.controller })
          .width('90%')
          .height(200)
          .border({ width: 1, color: '#ccc' })
          .margin({ bottom: 15 })
          .onDeleteComplete(() => {
            const selection = this.controller.getSelection();
            this.logText = `删除完成，光标位置: [${selection.selection[0]},${selection.selection[1]}]`;
          })

        Row() {
          Button('删除文本')
            .fontSize(12)
            .onClick(() => {
              this.controller.deleteSpans({ start: 5, end: 10 });
              this.logText = '已删除文本，等待回调';
            })
            .margin({ right: 5 })

          Button('重置')
            .fontSize(12)
            .onClick(() => {
              this.logText = '';
            })
        }
        .width('90%')
        .margin({ bottom: 15 })

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

        Text('1. 在onDeleteComplete回调内使用getSelection\\n2. 在RichEditor中删除内容\\n3. 触发onDeleteComplete回调')
          .fontSize(10)
          .width('95%')
          .margin({ bottom: 10 })

        Text('预期结果：')
          .fontSize(12)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 5, bottom: 5 })
          .alignSelf(ItemAlign.Start)

        Text('能准确返回选中内容或光标所在span信息（删除后）')
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

  aboutToAppear(): void {
    this.controller.addTextSpan('这是初始文本内容，点击删除按钮测试onDeleteComplete回调。', {
      style: {
        fontColor: Color.Black,
        fontSize: 14
      }
    });
  }
}

