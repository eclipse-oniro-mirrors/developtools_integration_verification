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
 * 测试用例：SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_NOTES_0007_772_579
 * 测试目的：验证备忘录中对url链接的复制粘贴功能
 * 预置条件：新建备忘录
 * 预期结果：url链接可以正常复制粘贴
 */

@Entry
@ComponentV2
export struct RicheditorNotes0579 {
  private richEditorController: RichEditorController = new RichEditorController();
  @Local testStatus: string = '待测试';
  @Local urlText: string = ('https://' + 'www.example.com' + '/test/path?param=value');

  build() {
    Column({ space: 15 }) {
      Text('SUB_ACE_UI_COMPONENT_TEXT_RICHEDITOR_NOTES_0007_772_579')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)

      Text('测试：备忘录url链接复制粘贴')
        .fontSize(14)
        .fontColor(Color.Gray)

      Divider()

      // URL展示区域
      Column({ space: 8 }) {
        Text('测试URL链接：')
          .fontSize(12)
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)

        Text(this.urlText)
          .fontSize(12)
          .fontColor(Color.Blue)
          .decoration({ type: TextDecorationType.Underline })
          .backgroundColor('#E3F2FD')
          .padding(8)
          .borderRadius(4)
      }
      .width('100%')
      .padding(10)
      .backgroundColor('#F5F5F5')
      .borderRadius(8)

      // RichEditor组件
      Column({ space: 8 }) {
        Text('RichEditor（模拟备忘录）：')
          .fontSize(12)
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)

        RichEditor({ controller: this.richEditorController })
          .id('richEditor')
          .width('100%')
          .height(150)
          .backgroundColor(Color.White)
          .borderRadius(8)
          .borderWidth(1)
          .borderColor('#CCCCCC')
          .onReady(() => {
            // 预置URL链接内容
            this.richEditorController.addTextSpan(this.urlText, {
              style: {
                fontSize: 14,
                fontColor: Color.Blue
              }
            });
          })

        Text('↑ 长按选中URL链接，然后复制粘贴')
          .fontSize(11)
          .fontColor(Color.Orange)
      }
      .width('100%')

      // 操作按钮
      Row({ space: 10 }) {
        Button('添加URL')
          .id('addUrlBtn')
          .onClick(() => {
            this.richEditorController.addTextSpan('\n' + this.urlText, {
              style: {
                fontSize: 14,
                fontColor: Color.Blue
              }
            });
            this.testStatus = '已添加URL链接';
          })

        Button('清空内容')
          .id('clearBtn')
          .backgroundColor('#FF6B6B')
          .onClick(() => {
            this.richEditorController.deleteSpans();
            this.testStatus = '已清空';
          })
      }

      Divider()

      // 测试步骤
      Column({ space: 8 }) {
        Text('测试步骤：')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)

        Text('1. 在RichEditor中添加url链接')
          .fontSize(12)
          .alignSelf(ItemAlign.Start)

        Text('2. 长按选中url链接文本')
          .fontSize(12)
          .alignSelf(ItemAlign.Start)

        Text('3. 点击复制，然后在其他位置粘贴')
          .fontSize(12)
          .alignSelf(ItemAlign.Start)

        Text('4. 确认粘贴内容正确')
          .fontSize(12)
          .alignSelf(ItemAlign.Start)
      }
      .width('100%')
      .padding(10)
      .backgroundColor('#FFF8E1')
      .borderRadius(8)

      // 状态和结果
      Text(`状态：${this.testStatus}`)
        .fontSize(14)
        .fontColor(Color.Blue)

      Button('确认粘贴正常')
        .id('confirmBtn')
        .width('80%')
        .onClick(() => {
          this.testStatus = '✅ 粘贴正常';
        })

      // 预期结果
      Text('预期结果：粘贴正常')
        .fontSize(13)
        .fontColor(Color.Green)
        .padding(10)
        .backgroundColor('#E8F5E9')
        .borderRadius(8)
        .width('100%')
        .textAlign(TextAlign.Center)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(Color.White)
  }
}

