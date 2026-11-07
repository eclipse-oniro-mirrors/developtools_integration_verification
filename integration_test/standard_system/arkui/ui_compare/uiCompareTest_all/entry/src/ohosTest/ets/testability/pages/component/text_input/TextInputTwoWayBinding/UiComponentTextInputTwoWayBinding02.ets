/*
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct UiComponentTextInputTwoWayBinding02 {
  @State textValue: string = 'aaa';

  @State fontSize: number = 16;
  @State fontWeight: FontWeight = FontWeight.Normal;
  @State fontColor: ResourceStr = '#000000';

  build() {
    Column() {
      Row() {
        Button('红色')
          .backgroundColor('#FF0000')
          .width(60)
          .height(30)
          .onClick(() => {
            this.fontColor = '#FF0000';
          })
          .id('UiComponentTextInputTwoWayBinding02_02')
      }
      .width('90%')
      .justifyContent(FlexAlign.SpaceAround)
      .margin({ bottom: 20 })
      TextInput({
        placeholder: '请输入文本',
        text: this.textValue!!
      })
        .width('90%')
        .margin({ top: 20, bottom: 10 })
        .fontSize(this.fontSize)
        .fontWeight(this.fontWeight)
        .fontColor(this.fontColor)
        .id('UiComponentTextInputTwoWayBinding02_01')
      TextArea({
        placeholder: '请输入多行文本',
        text: this.textValue!!
      })
        .width('90%')
        .height(150)
        .margin({ top: 10, bottom: 10 })
        .fontSize(this.fontSize)
        .fontWeight(this.fontWeight)
        .fontColor(this.fontColor)

      Search({
        placeholder: '搜索...',
        value: this.textValue!!
      })
        .width('90%')
        .margin({ top: 10, bottom: 20 })
        .fontColor(this.fontColor)
        .textFont({size:this.fontSize,weight:this.fontWeight})

      Text('当前输入内容:')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 10, bottom: 5 })

      Text(this.textValue || '无内容')
        .width('90%')
        .padding(10)
        .backgroundColor('#F5F5F5')
        .borderRadius(8)
        .fontSize(this.fontSize)
        .fontWeight(this.fontWeight)
        .fontColor(this.fontColor)

      Text('字体样式控制')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

      Row() {
        Button('减小字体')
          .onClick(() => {
            if (this.fontSize > 10) {
              this.fontSize -= 2;
            }
          })
          .id('')
        Text(`字体大小: ${this.fontSize}sp`)
          .margin({ left: 10, right: 10 })
        Button('增大字体')
          .onClick(() => {
            if (this.fontSize < 30) {
              this.fontSize += 2;
            }
          })
      }
      .width('90%')
      .justifyContent(FlexAlign.SpaceAround)
      .margin({ bottom: 10 })

      Row() {
        Button('常规')
          .onClick(() => {
            this.fontWeight = FontWeight.Normal;
          })
        Button('加粗')
          .onClick(() => {
            this.fontWeight = FontWeight.Bold;
          })
      }
      .width('90%')
      .justifyContent(FlexAlign.SpaceAround)
      .margin({ bottom: 10 })
    }
    .width('100%')
    .height('100%')
    .padding(15)
  }
}