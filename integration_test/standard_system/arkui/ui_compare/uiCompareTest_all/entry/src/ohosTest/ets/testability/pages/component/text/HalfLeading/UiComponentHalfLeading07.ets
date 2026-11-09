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
struct UiComponentHalfLeading07 {
  textAreaController: TextAreaController = new TextAreaController();
  @State onCopy: string = '';
  @State text: string = 'hello world';
  @State paddingnum:number=35;
  @State textcontenstyle:TextContentStyle=TextContentStyle.DEFAULT
  build() {
    Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Start, justifyContent: FlexAlign.Start }) {
      TextArea({
        text: this.text,
        placeholder: '',
        controller: this.textAreaController
      })
        .placeholderFont({ size: 16, weight: 400 })
        .width(336)
        .height(120)
        .margin(20)
        .border({ width: 1 })
        .fontSize(16)
        .lineHeight(80)
        .halfLeading(true)
        .fontColor('#182431')
        .style(this.textcontenstyle)
        .backgroundColor('#FFFFFF')
        .onChange((value: string) => {
          this.text = value;
        })
        .padding({ left: this.paddingnum, right: this.paddingnum})
        .id('UiComponentHalfLeading07_01')
      Button('change padding')
        .backgroundColor('#007DFF')
        .margin(15)
        .onClick(() => {
          this.paddingnum=50;
        })
        .id('UiComponentHalfLeading07_02')
    }
    .height('100%')
    .width('100%')
  }
}