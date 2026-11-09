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
export struct TextinputTv0310 {
  @Local focusedIndex: number = -1;
  @Local testStatus: string = '待测试';

  build() {
    Column({ space: 20 }) {
      Text('SUB_ACE_UI_COMPONENT_TEXTINPUT_SEARCH_TV_FOCUS_0310')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)

      Text(`测试描述：切换镜像语言后，走焦功能`)
        .fontSize(14)
        .fontColor(Color.Gray)

      Divider()

      Text(`预置条件：\n1. tv环境正常\n2. 语言切换为维语（镜像语言）`)
        .fontSize(13)
        .fontColor(Color.Orange)
        .alignSelf(ItemAlign.Start)

      Divider()

      Column({ space: 15 }) {
        Text(`当前焦点：${this.focusedIndex === -1 ? '无' : `输入框${this.focusedIndex + 1}`}`)
          .fontSize(14)
          .fontColor(Color.Blue)

        Row({ space: 15 }) {
          TextInput({ placeholder: '输入框1' })
            .width(150)
            .height(45)
            .borderWidth(this.focusedIndex === 0 ? 2 : 1)
            .borderColor(this.focusedIndex === 0 ? Color.Red : Color.Gray)
            .onFocus(() => {
              this.focusedIndex = 0;
              this.testStatus = '✅ 输入框1获得焦点';
            })

          TextInput({ placeholder: '输入框2' })
            .width(150)
            .height(45)
            .borderWidth(this.focusedIndex === 1 ? 2 : 1)
            .borderColor(this.focusedIndex === 1 ? Color.Red : Color.Gray)
            .onFocus(() => {
              this.focusedIndex = 1;
              this.testStatus = '✅ 输入框2获得焦点';
            })
        }
        .direction(Direction.Rtl)

        Search({ placeholder: '搜索框' })
          .width('80%')
          .height(45)
          .borderWidth(this.focusedIndex === 2 ? 2 : 1)
          .borderColor(this.focusedIndex === 2 ? Color.Red : Color.Gray)
          .onFocus(() => {
            this.focusedIndex = 2;
            this.testStatus = '✅ 搜索框获得焦点';
          })

        Text(`测试状态：${this.testStatus}`)
          .fontSize(14)
          .fontColor(Color.Orange)
      }
      .width('100%')
      .padding(15)
      .backgroundColor('#F5F5F5')
      .borderRadius(10)

      Button(`模拟走焦（从右到左）`)
        .id('btn')
        .onClick(() => {
          this.focusedIndex = (this.focusedIndex + 1) % 3;
          this.testStatus = `✅ 焦点移动到${this.focusedIndex === 0 ? '输入框1' : this.focusedIndex === 1 ? '输入框2' : '搜索框'}`;
        })

      Divider()

      Text(`预期结果：镜像语言，走焦功能正常（从右到左）`)
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

