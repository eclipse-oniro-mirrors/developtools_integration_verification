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

@Entry
@ComponentV2
export struct TextinputTv0100 {
  @Local longPlaceholder: string = '';
  @Local testStatus: string = '待测试';

  build() {
    Column({ space: 20 }) {
      Text('SUB_ACE_UI_COMPONENT_TEXTINPUT_TV_0100')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)

      Text(`测试描述：输入框提示文本超长UX检视`)
        .fontSize(14)
        .fontColor(Color.Gray)

      Divider()

      Column({ space: 15 }) {
        TextInput({ placeholder: this.longPlaceholder || '普通提示文本' })
          .id('placeholderInput')
          .width('80%')
          .height(50)
          .placeholderColor('#999999')
          .placeholderFont({ size: 14 })

        Text(`测试状态：${this.testStatus}`)
          .fontSize(14)
          .fontColor(Color.Blue)
      }
      .width('100%')
      .padding(15)
      .backgroundColor('#F5F5F5')
      .borderRadius(10)

      Button(`设置超长提示文本`)
        .id('btn')
        .onClick(() => {
          this.longPlaceholder = '这是一段超长的提示文本，用于测试当placeholder超长时的显示效果，是否会以省略号...的形式展示，以及省略号的位置是否符合UX设计规范要求...';
          this.testStatus = '✅ 提示文本已设置为超长';
        })

      Button(`重置`)
        .onClick(() => {
          this.longPlaceholder = '';
          this.testStatus = '待测试';
        })

      Divider()

      Text(`预期结果：提示文本超长以...显示`)
        .fontSize(13)
        .fontColor(Color.Green)
        .alignSelf(ItemAlign.Start)
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(Color.White)
  }
}

