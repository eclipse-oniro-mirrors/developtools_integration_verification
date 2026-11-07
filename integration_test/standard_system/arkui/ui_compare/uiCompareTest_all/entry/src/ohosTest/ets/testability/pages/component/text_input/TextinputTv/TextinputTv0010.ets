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
export struct TextinputTv0010 {
  @Local errorText: string = '';
  @Local testStatus: string = '待测试';

  build() {
    Column({ space: 20 }) {
      Text('SUB_ACE_UI_COMPONENT_TEXTINPUT_TV_0010')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)

      Text(`测试描述：错误提示文本超长UX检视`)
        .fontSize(14)
        .fontColor(Color.Gray)

      Divider()

      Text(`预置条件：大屏存在密码输入样式的textInput控件应用`)
        .fontSize(13)
        .fontColor(Color.Orange)
        .alignSelf(ItemAlign.Start)

      Divider()

      Column({ space: 15 }) {
        TextInput({ placeholder: '请输入密码' })
          .id('passwordInput')
          .type(InputType.Password)
          .width('80%')
          .height(50)
          .onChange((value: string) => {
            if (value.length > 0 && value.length < 6) {
              this.errorText = '密码长度必须至少6个字符，这是一段超长的错误提示文本用于测试UX样式是否符合设计规范...';
            } else {
              this.errorText = '';
            }
          })

        if (this.errorText !== '') {
          Text(this.errorText)
            .fontSize(12)
            .fontColor(Color.Red)
            .width('80%')
            .maxLines(2)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
        }

        Text(`测试状态：${this.testStatus}`)
          .fontSize(14)
          .fontColor(Color.Blue)
      }
      .width('100%')
      .padding(15)
      .backgroundColor('#F5F5F5')
      .borderRadius(10)

      Button(`触发超长错误提示`)
        .id('btn')
        .onClick(() => {
          this.errorText = '密码长度必须至少6个字符，这是一段超长的错误提示文本用于测试UX样式是否符合设计规范，包括文本截断、省略号显示、行高、字体颜色等参数设置是否与UX设计保持一致...';
          this.testStatus = '✅ 已触发超长错误提示';
        })

      Button(`重置`)
        .onClick(() => {
          this.errorText = '';
          this.testStatus = '待测试';
        })

      Divider()

      Text(`测试步骤：`)
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text(`1. 进入大屏打开textInput控件的应用\n2. 输入使触发超长报错，查看UX样式`)
        .fontSize(13)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Divider()

      Text(`预期结果：样式符合UX设计，各参数设定与UX一致`)
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

