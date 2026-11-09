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
struct UiComponentHalfLeading14 {
  textAreaController: TextAreaController = new TextAreaController();
  @State onCopy: string = '';
  @State text: string = 'hello world hello world hello world hello world hello world hello world' +
    'hello world hello world hello world hello world';
  @State fontSize:number=16
  @State myalign:TextAlign=TextAlign.Center
  build() {
    Column() {
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
        .fontSize(this.fontSize)
        .lineHeight(40)
        .halfLeading(true)
        .fontColor('#182431')
        .backgroundColor('#FFFFFF')
        .onChange((value: string) => {
          this.text = value;
        })
        .textAlign(this.myalign)
        .id('UiComponentHalfLeading14_01')
      Button('change TextAlign')
        .fontSize(10)
        .height(100)
        .backgroundColor(0x317aff)
        .width('90%')
        .labelStyle({ overflow: TextOverflow.Clip,
          maxLines: 2,
          minFontSize: 10,
          maxFontSize: 20,
          font: {
            size: 20,
            weight: FontWeight.Bolder,
            family: 'cursive',
            style: FontStyle.Italic
          }
        })
        .onClick(()=>{
          this.myalign=TextAlign.Start
        })
        .id('UiComponentHalfLeading14_02')
    }
    .height('100%')
    .width('100%')
    .padding({ left: 35, right: 35, top: 35 })
  }
}