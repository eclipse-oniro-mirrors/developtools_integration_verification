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
 * 测试用例：SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0950
 * 测试目的：验证TextInput组件文本超长和非超长间反复切换时的渐隐效果
 * 预期结果：超长时一侧渐隐，非超长时无渐隐，切换时渐隐范围正确
 */

@Entry
@ComponentV2
export struct FadingedgeTv0950 {
  // 超长文本
  private longText: string = '这是一段超长的输入文本内容用于测试TextInput组件的渐隐效果这是超长文本';
  // 短文本
  private shortText: string = '短文本';
  
  @Local inputValue: string = this.longText;
  @Local isOverflow: boolean = true;

  build() {
    Column({ space: 20 }) {
      Text('SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0950')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)

      Text('测试：TextInput文本超长/非超长渐隐切换')
        .fontSize(14)
        .fontColor(Color.Gray)

      Divider()

      // 状态显示
      Row({ space: 10 }) {
        Text('当前状态：')
          .fontSize(14)
        Text(this.isOverflow ? '超长文本（应有渐隐）' : '短文本（无渐隐）')
          .fontSize(14)
          .fontColor(this.isOverflow ? Color.Orange : Color.Green)
          .fontWeight(FontWeight.Bold)
      }

      // TextInput组件 - 设置固定宽度让文本超出
      Column({ space: 5 }) {
        Text('TextInput组件（宽度200vp）：')
          .fontSize(12)
          .fontColor(Color.Gray)
          .alignSelf(ItemAlign.Start)

        TextInput({ text: this.inputValue, placeholder: '输入...' })
          .id('textInput')
          .width(200)  // 固定宽度，让长文本超出
          .height(45)
          .backgroundColor(Color.White)
          .borderRadius(8)
          .onChange((value: string) => {
            this.inputValue = value;
            this.isOverflow = value.length > 10;
          })
      }
      .width('100%')
      .alignItems(HorizontalAlign.Center)
      .padding(10)
      .backgroundColor('#EEEEEE')
      .borderRadius(8)

      Divider()

      // 操作按钮
      Text('操作：')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Row({ space: 15 }) {
        Button('设置超长文本')
          .id('longTextBtn')
          .backgroundColor(this.isOverflow ? '#007AFF' : '#CCCCCC')
          .onClick(() => {
            this.inputValue = this.longText;
            this.isOverflow = true;
          })

        Button('设置短文本')
          .id('shortTextBtn')
          .backgroundColor(!this.isOverflow ? '#007AFF' : '#CCCCCC')
          .onClick(() => {
            this.inputValue = this.shortText;
            this.isOverflow = false;
          })
      }

      Button('清空文本')
        .id('clearBtn')
        .backgroundColor('#FF6B6B')
        .onClick(() => {
          this.inputValue = '';
          this.isOverflow = false;
        })

      Divider()

      // 预期结果说明
      Column({ space: 8 }) {
        Text('预期结果：')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)

        Text('• 超长文本：文本超出部分一侧显示渐隐效果')
          .fontSize(12)
          .fontColor(Color.Green)
          .alignSelf(ItemAlign.Start)

        Text('• 短文本：文本完整显示，无渐隐效果')
          .fontSize(12)
          .fontColor(Color.Green)
          .alignSelf(ItemAlign.Start)

        Text('• 反复切换：渐隐范围随文本长度正确变化')
          .fontSize(12)
          .fontColor(Color.Green)
          .alignSelf(ItemAlign.Start)
      }
      .width('100%')
      .padding(10)
      .backgroundColor('#E8F5E9')
      .borderRadius(8)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(Color.White)
  }
}
