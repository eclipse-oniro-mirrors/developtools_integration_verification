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
 * 测试用例：SUB_ACE_UI_COMPONENT_TEXTINPUT_TV_0100
 * 测试目的：验证输入框提示文本超长时的UX显示效果
 * 预置条件：导入overlay，提示文本超长
 * 预期结果：提示文本超长以...显示
 */

@Entry
@ComponentV2
export struct TextinputTv0100 {
  @Local inputValue: string = '';
  // 超长提示文本
  private longPlaceholder: string = '这是一个超长的提示文本用于测试当提示文本超过输入框宽度时的显示效果应该以省略号结尾';
  private normalPlaceholder: string = '请输入内容';

  @Local currentPlaceholder: string = this.longPlaceholder;
  @Local isLongPlaceholder: boolean = true;

  build() {
    Column({ space: 20 }) {
      Text('SUB_ACE_UI_COMPONENT_TEXTINPUT_TV_0100')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)

      Text('测试：输入框提示文本超长UX检视')
        .fontSize(14)
        .fontColor(Color.Gray)

      Divider()

      // 状态显示
      Row({ space: 10 }) {
        Text('当前提示文本：')
          .fontSize(14)
        Text(this.isLongPlaceholder ? '超长（应显示...）' : '正常')
          .fontSize(14)
          .fontColor(this.isLongPlaceholder ? Color.Orange : Color.Green)
          .fontWeight(FontWeight.Bold)
      }

      // TextInput组件 - 固定宽度，超长placeholder会被截断
      Column({ space: 8 }) {
        Text('TextInput组件（宽度250vp）：')
          .fontSize(12)
          .fontColor(Color.Gray)
          .alignSelf(ItemAlign.Start)

        TextInput({ text: this.inputValue, placeholder: this.currentPlaceholder })
          .id('textInput')
          .width(250)
          .height(50)
          .backgroundColor(Color.White)
          .borderRadius(8)
          .borderWidth(1)
          .borderColor('#CCCCCC')
          .onChange((value: string) => {
            this.inputValue = value;
          })

        Text('↑ 观察placeholder是否以"..."结尾')
          .fontSize(11)
          .fontColor(Color.Blue)
      }
      .width('100%')
      .alignItems(HorizontalAlign.Center)
      .padding(15)
      .backgroundColor('#F5F5F5')
      .borderRadius(8)

      Divider()

      // 操作按钮
      Row({ space: 15 }) {
        Button('超长提示文本')
          .id('longBtn')
          .backgroundColor(this.isLongPlaceholder ? '#007AFF' : '#CCCCCC')
          .onClick(() => {
            this.currentPlaceholder = this.longPlaceholder;
            this.isLongPlaceholder = true;
            this.inputValue = '';
          })

        Button('正常提示文本')
          .id('normalBtn')
          .backgroundColor(!this.isLongPlaceholder ? '#007AFF' : '#CCCCCC')
          .onClick(() => {
            this.currentPlaceholder = this.normalPlaceholder;
            this.isLongPlaceholder = false;
            this.inputValue = '';
          })
      }

      Divider()

      // 测试步骤
      Column({ space: 8 }) {
        Text('测试步骤：')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)

        Text('1. 观察超长提示文本的显示效果')
          .fontSize(12)
          .alignSelf(ItemAlign.Start)

        Text('2. 确认超长部分以"..."省略号显示')
          .fontSize(12)
          .alignSelf(ItemAlign.Start)

        Text('3. 切换正常提示文本对比效果')
          .fontSize(12)
          .alignSelf(ItemAlign.Start)
      }
      .width('100%')
      .padding(10)
      .backgroundColor('#FFF8E1')
      .borderRadius(8)

      // 预期结果
      Column({ space: 5 }) {
        Text('预期结果：')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)

        Text('提示文本超长以...显示')
          .fontSize(13)
          .fontColor(Color.Green)
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

