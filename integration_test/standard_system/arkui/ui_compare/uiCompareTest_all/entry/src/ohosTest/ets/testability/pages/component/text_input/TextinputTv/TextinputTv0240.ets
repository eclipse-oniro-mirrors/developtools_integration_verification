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
export struct TextinputTv0240 {
  @Local testStatus: string = '待测试';

  build() {
    Scroll() {
      Column({ space: 20 }) {
        Text('SUB_ACE_UI_COMPONENT_TEXTINPUT_TV_0240')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)

        Text(`测试描述：输入法避让测试`)
          .fontSize(14)
          .fontColor(Color.Gray)

        Divider()

        Text(`预置条件：存在输入框在页面底部`)
          .fontSize(13)
          .fontColor(Color.Orange)
          .alignSelf(ItemAlign.Start)

        Divider()

        // 填充内容，让输入框位于底部
        Column() {
          Text('填充内容区域')
            .fontSize(14)
            .fontColor(Color.Gray)
        }
        .height('24.59%')
        .width('100%')
        .backgroundColor('#F0F0F0')
        .borderRadius(10)

        Column({ space: 15 }) {
          Text(`测试状态：${this.testStatus}`)
            .fontSize(14)
            .fontColor(Color.Blue)

          TextInput({ placeholder: '位于页面底部的输入框' })
            .id('bottomInput')
            .width('80%')
            .height(50)
            .onFocus(() => {
              this.testStatus = '✅ 输入框获得焦点，应避让输入法';
            })
            .onBlur(() => {
              this.testStatus = '⬅️ 输入框失去焦点';
            })

          Button(`点击输入框`)
            .id('btn')
            .onClick(() => {
              this.testStatus = '📝 提示：点击输入框弹出输入法';
            })
        }
        .width('100%')
        .padding(15)
        .backgroundColor('#FFF9C4')
        .borderRadius(10)

        Divider()

        Text(`测试步骤：`)
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .alignSelf(ItemAlign.Start)

        Text(`1. 点击输入框，弹出键盘\n2. 查看页面响应`)
          .fontSize(13)
          .fontColor(Color.Gray)
          .alignSelf(ItemAlign.Start)

        Divider()

        Text(`预期结果：输入框避让输入法弹出框`)
          .fontSize(13)
          .fontColor(Color.Green)
          .alignSelf(ItemAlign.Start)
      }
      .width('100%')
      .padding(20)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
  }
}

