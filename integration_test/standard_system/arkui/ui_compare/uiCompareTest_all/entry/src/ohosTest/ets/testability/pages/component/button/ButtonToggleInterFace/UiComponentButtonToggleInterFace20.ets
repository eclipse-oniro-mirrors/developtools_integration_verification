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
struct UiComponentButtonToggleInterFace20 {
  @State text :string = 'create toggle(Checkbox)'
  @State ison : boolean = false

  build() {
    Column(){
      Text(this.text)
        .fontSize(15)
        .fontColor(0xCCCCCC)
        .width('90%')
        .border({ width: 1 })
        .lineHeight(20)
        .margin(30)
        .padding(10)
        .maxLines(2)
        .fontColor(Color.Black)
        .fontStyle(FontStyle.Italic)
        .height(100)
      Toggle({ type: ToggleType.Checkbox, isOn: this.ison })
        .selectedColor('#ff007dff')
        .backgroundColor(0x008000)
        .size({ width: 200, height: 200 })
        .margin({
          top: '6px',
          right: '16px',
          bottom: '6px',
          left: '16px',
        })
        .onChange((isOn: boolean) => {
          console.info('Component status:' + isOn);
        })
        .id('UiComponentButtonToggleInterFace20_01')
      Button('change state')
        .onClick(()=>{
          this.ison=!this.ison
        })
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
        .id('UiComponentButtonToggleInterFace20_02')
    }
  }
}