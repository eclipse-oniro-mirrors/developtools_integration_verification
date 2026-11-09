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
export struct TextinputTv0030 {
  @Local isHovered: boolean = false;
  @Local testStatus: string = '待测试';

  build() {
    Column({ space: 20 }) {
      Text('SUB_ACE_UI_COMPONENT_TEXTINPUT_TV_0030')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)

      Text(`测试描述：普通文本输入框hover态UX检视`)
        .fontSize(14)
        .fontColor(Color.Gray)

      Divider()

      Column({ space: 15 }) {
        Text(`当前状态：${this.isHovered ? 'Hover态' : 'Normal态'}`)
          .fontSize(14)
          .fontColor(this.isHovered ? Color.Red : Color.Gray)

        TextInput({ placeholder: '普通文本输入框' })
          .id('normalInput')
          .width('80%')
          .height(50)
          .backgroundColor(this.isHovered ? '#E3F2FD' : Color.White)
          .borderWidth(this.isHovered ? 2 : 1)
          .borderColor(this.isHovered ? '#2196F3' : '#CCCCCC')
          .onHover((isHover: boolean) => {
            this.isHovered = isHover;
            this.testStatus = isHover ? '✅ 进入Hover态' : '⬅️ 离开Hover态';
          })

        Text(`测试状态：${this.testStatus}`)
          .fontSize(14)
          .fontColor(Color.Blue)
      }
      .width('100%')
      .padding(15)
      .backgroundColor('#F5F5F5')
      .borderRadius(10)

      Button(`模拟Hover`)
        .id('btn')
        .onClick(() => {
          this.isHovered = !this.isHovered;
          this.testStatus = this.isHovered ? '✅ Hover态激活' : '⬅️ Hover态关闭';
        })

      Divider()

      Text(`预期结果：样式符合UX设计，hover态边框加粗/变色，背景色变化`)
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

