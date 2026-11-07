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
 * 测试用例：SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0970
 * 测试目的：验证TextInput组件超长文本在输入态和非输入态切换时的渐隐效果
 * 预期结果：输入态和非输入态下，超长文本一侧均显示渐隐
 */

@Entry
@ComponentV2
export struct FadingedgeTv0970 {
  // 超长文本
  @Local inputValue: string = '这是一段超长的输入文本内容用于测试TextInput输入态和非输入态的渐隐效果切换';
  @Local isFocused: boolean = false;
  @Local focusCount: number = 0;

  build() {
    Column({ space: 20 }) {
      Text('SUB_ACE_UI_COMPONENT_Text_FadingEdge_TV_0970')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)

      Text('测试：TextInput超长文本输入态/非输入态渐隐切换')
        .fontSize(14)
        .fontColor(Color.Gray)

      Divider()

      // 状态显示
      Column({ space: 8 }) {
        Row({ space: 10 }) {
          Text('当前状态：')
            .fontSize(14)
          Text(this.isFocused ? '输入态（有光标）' : '非输入态（无光标）')
            .fontSize(14)
            .fontColor(this.isFocused ? Color.Orange : Color.Blue)
            .fontWeight(FontWeight.Bold)
        }

        Text(`状态切换次数：${this.focusCount}`)
          .fontSize(12)
          .fontColor(Color.Gray)
      }

      // TextInput组件 - 固定宽度让文本超出
      Column({ space: 5 }) {
        Text('TextInput组件（宽度250vp，超长文本）：')
          .fontSize(12)
          .fontColor(Color.Gray)
          .alignSelf(ItemAlign.Start)

        TextInput({ text: this.inputValue, placeholder: '输入...' })
          .id('textInput')
          .width(250)
          .height(50)
          .backgroundColor(Color.White)
          .borderWidth(this.isFocused ? 2 : 1)
          .borderColor(this.isFocused ? '#007AFF' : '#CCCCCC')
          .borderRadius(8)
          .onFocus(() => {
            this.isFocused = true;
            this.focusCount++;
          })
          .onBlur(() => {
            this.isFocused = false;
            this.focusCount++;
          })
      }
      .width('100%')
      .alignItems(HorizontalAlign.Center)
      .padding(15)
      .backgroundColor('#F0F0F0')
      .borderRadius(8)

      // 操作提示
      Column({ space: 8 }) {
        Text('操作步骤：')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)

        Text('1. 点击TextInput组件进入输入态，观察渐隐效果')
          .fontSize(12)
          .alignSelf(ItemAlign.Start)

        Text('2. 点击下方按钮使TextInput失焦，进入非输入态')
          .fontSize(12)
          .alignSelf(ItemAlign.Start)

        Text('3. 反复切换，观察渐隐效果是否一致')
          .fontSize(12)
          .alignSelf(ItemAlign.Start)
      }
      .width('100%')
      .padding(10)
      .backgroundColor('#FFF3E0')
      .borderRadius(8)

      // 失焦按钮
      Button('点击此处使TextInput失焦')
        .id('blurBtn')
        .width('80%')
        .height(45)
        .backgroundColor('#607d7B')
        .onClick(() => {
          // 点击其他区域会使TextInput自动失焦
        })

      Divider()

      // 预期结果
      Column({ space: 8 }) {
        Text('预期结果：')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)

        Text('• 输入态：超长文本一侧显示渐隐效果')
          .fontSize(12)
          .fontColor(Color.Green)
          .alignSelf(ItemAlign.Start)

        Text('• 非输入态：超长文本一侧同样显示渐隐效果')
          .fontSize(12)
          .fontColor(Color.Green)
          .alignSelf(ItemAlign.Start)

        Text('• 状态切换后：渐隐范围正确，无异常')
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
