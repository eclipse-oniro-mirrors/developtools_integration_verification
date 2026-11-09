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
struct PrivacySensitiveGauge0120 {
  @State value:number|null|undefined  = -30
  @State col:ResourceColor | LinearGradient |Array<[ResourceColor | LinearGradient , number]> = $r('app.color.blue')
  @Builder descriptionBuilder() {
    Text('说明文本')
      .maxFontSize('30sp')
      .minFontSize('10.0vp')
      .fontColor('#fffa2a2d')
      .fontWeight(FontWeight.Medium)
      .width('100%')
      .height('100%')
      .textAlign(TextAlign.Center)
  }

  build() {
    Column() {
      Gauge({ value: this.value, min: 1, max: 100 }) {
        Column() {
          Text('50')
            .fontWeight(FontWeight.Medium)
            .width('62%')
            .fontColor('#ff182431')
            .maxFontSize('60.0vp')
            .minFontSize('30.0vp')
            .textAlign(TextAlign.Center)
            .margin({ top: '35%' })
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .maxLines(1)
          Text('辅助文本')
            .maxFontSize('16.0fp')
            .minFontSize('10.0vp')
            .fontColor($r('sys.color.ohos_id_color_text_secondary'))
            .fontColor($r('sys.color.ohos_id_color_text_secondary'))
            .fontWeight(FontWeight.Regular)
            .width('67.4%')
            .height('9.5%')
            .textAlign(TextAlign.Center)
        }.width('100%').height('100%')
      }
      .privacySensitive(true)
      .value(50)
      .startAngle(210)
      .endAngle(150)
      .colors(this.col)
      .width('80%')
      .height('80%')
      .strokeWidth(18)
      .trackShadow({ radius: 7, offsetX: 7, offsetY: 7 })
      .description(this.descriptionBuilder)
      .padding(18)
      Row() {
        Button('change1')
          .borderRadius(8)
          .backgroundColor(0x317aff)
          .width(100)
          .margin(8)
          .id('PrivacySensitiveGauge0120_001')
          .onClick(() => {
            this.col = [['abcd', 1], ['abcd', 1], ['abcd', 1], ['abcd', 1],[$r('app.color.blue'),1],[$r('app.color.yellow'),1],[$r('app.color.green'),1],[$r('app.color.red'),1],[0x317AF7, 0.1], [0x5BA854, 0.3], [0xE08C3A,0.6],[Color.Blue,1],[Color.Green,2],[Color.Yellow,4],[Color.Pink,6],[Color.Green,8]]
          })
        Button('change2')
          .borderRadius(8)
          .backgroundColor(0x317aff)
          .width(100)
          .margin(8)
          .id('PrivacySensitiveGauge0120_002')
          .onClick(() => {
            this.value = 30000
          })
      }
      Row(){
        Button('change3')
          .borderRadius(8)
          .backgroundColor(0x317aff)
          .width(100)
          .margin(8)
          .id('PrivacySensitiveGauge0120_003')
          .onClick(() => {
            this.value = null
          })
        Button('change4')
          .borderRadius(8)
          .backgroundColor(0x317aff)
          .width(100)
          .margin(8)
          .id('PrivacySensitiveGauge0120_004')
          .onClick(() => {
            this.value = undefined
          })
      }
    }.margin({ top: 40 }).width('100%').height('100%')
  }
}


