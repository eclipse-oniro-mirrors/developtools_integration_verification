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
export struct TextinputTv0130 {
  @Local bgColor: ResourceColor = Color.White;
  @Local testStatus: string = '待测试';

  build() {
    Column({ space: 20 }) {
      Text('SUB_ACE_UI_COMPONENT_TEXTINPUT_TV_0130')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)

      Text(`测试描述：自定义参数-输入框背板颜色`)
        .fontSize(14)
        .fontColor(Color.Gray)

      Divider()

      Column({ space: 15 }) {
        TextInput({ placeholder: '自定义背板颜色输入框' })
          .id('customInput')
          .width('80%')
          .height(50)
          .backgroundColor(this.bgColor)

        Text(`当前背板颜色：${this.bgColor === Color.White ? '白色(默认)' : this.bgColor === '#FFE0B2' ? '浅橙色' : '天蓝色'}`)
          .fontSize(14)
          .fontColor(Color.Blue)

        Text(`测试状态：${this.testStatus}`)
          .fontSize(14)
          .fontColor(Color.Orange)
      }
      .width('100%')
      .padding(15)
      .backgroundColor('#F5F5F5')
      .borderRadius(10)

      Button(`设置背板颜色：浅橙色`)
        .id('btn')
        .onClick(() => {
          this.bgColor = '#FFE0B2';
          this.testStatus = '✅ 背板颜色已设置为浅橙色';
        })

      Button(`设置背板颜色：天蓝色`)
        .onClick(() => {
          this.bgColor = '#B3E5FC';
          this.testStatus = '✅ 背板颜色已设置为天蓝色';
        })

      Button(`重置`)
        .onClick(() => {
          this.bgColor = Color.White;
          this.testStatus = '待测试';
        })

      Divider()

      Text(`预期结果：背板样式自定义参数一致`)
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

