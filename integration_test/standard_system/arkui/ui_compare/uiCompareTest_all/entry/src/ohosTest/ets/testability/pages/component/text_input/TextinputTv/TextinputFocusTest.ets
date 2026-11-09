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
export struct TextinputFocusTest {
  @Local focusIndex: number = 0;
  @Local testStatus: string = '待测试';

  build() {
    Column({ space: 20 }) {
      Text('TextInput综合焦点管理测试')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)

      Text(`测试描述：综合焦点管理测试`)
        .fontSize(14)
        .fontColor(Color.Gray)

      Divider()

      Column({ space: 15 }) {
        Text(`当前焦点：输入框${this.focusIndex + 1}`)
          .fontSize(14)
          .fontColor(Color.Blue)

        ForEach([0, 1, 2, 3], (index: number) => {
          TextInput({ placeholder: `输入框${index + 1}` })
            .width('80%')
            .height(50)
            .borderWidth(this.focusIndex === index ? 3 : 1)
            .borderColor(this.focusIndex === index ? Color.Red : Color.Gray)
            .onFocus(() => {
              this.focusIndex = index;
              this.testStatus = `✅ 输入框${index + 1}获得焦点`;
            })
        })

        Search({ placeholder: '搜索框' })
          .width('80%')
          .height(50)
          .borderWidth(this.focusIndex === 4 ? 3 : 1)
          .borderColor(this.focusIndex === 4 ? Color.Red : Color.Gray)
          .onFocus(() => {
            this.focusIndex = 4;
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

      Button(`下一个焦点`)
        .id('btn')
        .onClick(() => {
          this.focusIndex = (this.focusIndex + 1) % 5;
          this.testStatus = `✅ 焦点移动到${this.focusIndex === 4 ? '搜索框' : `输入框${this.focusIndex + 1}`}`;
        })

      Button(`重置`)
        .onClick(() => {
          this.focusIndex = 0;
          this.testStatus = '待测试';
        })

      Divider()

      Text(`预期结果：焦点可正常切换，边框加粗显示当前焦点`)
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

