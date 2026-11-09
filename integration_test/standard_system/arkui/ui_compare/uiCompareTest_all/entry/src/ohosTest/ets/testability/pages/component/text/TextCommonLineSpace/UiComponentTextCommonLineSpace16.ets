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

import { LengthMetrics } from '@kit.ArkUI'
let i:number=0;
@Entry
@Component
struct UiComponentTextCommonLineSpace16 {
  controller: TextAreaController = new TextAreaController()
  @State nums: number=100
  @State text: string = 'This is the TextArea with the height adaptive policy set' +
    'This is the TextArea with the height adaptive policy set'
  build() {
    Column({ space: 8 }) {
      Text(this.text)
        .width(336)
        .height(200)
        .margin(20)
        .maxLines(2)
        .fontSize(16)
        .fontColor('#182431')
        .lineSpacing(LengthMetrics.px(this.nums))
        .backgroundColor('#FFFFFF')
      Text(this.text)
        .width(336)
        .height(200)
        .margin(20)
        .maxLines(2)
        .fontSize(16)
        .fontColor('#182431')
        .lineSpacing(LengthMetrics.px(this.nums+100))
        .backgroundColor('#FFFFFF')
      Button('change size')
        .onClick(()=>{
          this.nums=50
        })
        .id('UiComponentTextCommonLineSpace16')
    }
  }
}
