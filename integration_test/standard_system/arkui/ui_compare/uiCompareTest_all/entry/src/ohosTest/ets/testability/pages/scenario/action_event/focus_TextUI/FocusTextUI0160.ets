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
@Component
struct FocusTextUI0160 {
  build() {
    Column() {
      // 1. 设置 minfontsize 和 Fontsize number 5和10
      Text('1. minfontsize=5, fontsize=10')
        .fontSize(10)
        .minFontSize(5)
        .width('90%')
        .backgroundColor('#F5F5F5')
        .padding(10)
        .margin({ bottom: 10 })

      // 2. 设置 minfontsize 和 Fontsize number 30和10
      Text('2. minfontsize=30, fontsize=10')
        .fontSize(10)
        .minFontSize(30)
        .width('90%')
        .backgroundColor('#F5F5F5')
        .padding(10)
        .margin({ bottom: 10 })

      // 3. 设置 maxFontSize 和 fontsize number 10和10
      Text('3. maxFontSize=10, fontsize=10')
        .fontSize(10)
        .maxFontSize(10)
        .width('90%')
        .backgroundColor('#F5F5F5')
        .padding(10)
        .margin({ bottom: 10 })

      // 4. 设置 maxFontSize 和 fontsize number 40和10
      Text('4. maxFontSize=40, fontsize=10')
        .fontSize(10)
        .maxFontSize(40)
        .width('90%')
        .backgroundColor('#F5F5F5')
        .padding(10)
        .margin({ bottom: 10 })

      // 5. 设置 minfontsize、maxfontsize、maxlines、和fontsize number 10、20、1和30
      Text('5. minfontsize=10, maxfontsize=20, maxlines=1, fontsize=30')
        .fontSize(30)
        .minFontSize(10)
        .maxFontSize(20)
        .maxLines(1)
        .width('90%')
        .backgroundColor('#F5F5F5')
        .padding(10)
        .margin({ bottom: 10 })

      // 6. 设置 minfontsize、maxfontsize、maxlines、和fontsize number 10、20、2、30
      Text('6. minfontsize=10, maxfontsize=20, maxlines=2, fontsize=30')
        .fontSize(30)
        .minFontSize(10)
        .maxFontSize(20)
        .maxLines(2)
        .width('90%')
        .backgroundColor('#F5F5F5')
        .padding(10)
        .margin({ bottom: 10 })

      // 7. 设置 minfontsize、maxfontsize、maxlines、和fontsize number 10、20、3和30
      Text('7. minfontsize=10, maxfontsize=20, maxlines=3, fontsize=30')
        .fontSize(30)
        .minFontSize(10)
        .maxFontSize(20)
        .maxLines(3)
        .width('90%')
        .backgroundColor('#F5F5F5')
        .padding(10)
        .margin({ bottom: 10 })

      // 8. 设置 minfontsize、maxFontsize、maxlines和lineheight number 10、20、2和20
      Text('8. minfontsize=10, maxfontsize=20, maxlines=2, lineheight=20')
        .fontSize(16)
        .minFontSize(10)
        .maxFontSize(20)
        .maxLines(2)
        .lineHeight(20)
        .width('90%')
        .backgroundColor('#F5F5F5')
        .padding(10)
        .margin({ bottom: 10 })

      // 9. 设置 minfontsize、maxfontsize、maxlines、和height number 10、20、2和50
      Text('9. minfontsize=10, maxfontsize=20, maxlines=2, height=50')
        .fontSize(16)
        .minFontSize(10)
        .maxFontSize(20)
        .maxLines(2)
        .height(50)
        .width('90%')
        .backgroundColor('#F5F5F5')
        .padding(10)
        .margin({ bottom: 10 })
    }
    .width('100%')
    .padding(10)
  }
}