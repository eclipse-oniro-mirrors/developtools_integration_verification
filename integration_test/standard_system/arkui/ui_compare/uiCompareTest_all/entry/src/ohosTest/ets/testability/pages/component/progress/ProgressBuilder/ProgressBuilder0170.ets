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
struct ProgressBuilder0170 {
  @State type1: ProgressType = ProgressType.Eclipse
  @State type2: ProgressType = ProgressType.Capsule
  @State status1: ProgressStatus = ProgressStatus.LOADING
  @State status2: ProgressStatus = ProgressStatus.PROGRESSING
  @State enable: boolean = true

  build() {
    Column({ space: 15 }) {
      Text('Loading Effect').fontSize(9).fontColor(0xCCCCCC).width('90%')
      Progress({ value: 50, total: 100, type: this.type1 })
        .width(100).color(Color.Blue)
        .style({ strokeWidth: 20, status: this.status1 })

      Text('Scan Effect').fontSize(9).fontColor(0xCCCCCC).width('90%')
      Progress({ value: 90, total: 100, type: this.type2 })
        .width(100).color(Color.Orange)
        .style({ strokeWidth: 20, enableScanEffect: this.enable, status: this.status2 })
      Button('Toggle Scan Effect 1')
        .borderRadius(8)
        .backgroundColor(0x317aff)
        .width(100)
        .margin(8)
        .id('ProgressBuilder0170_001')
        .onClick(() => {
          this.type1 = ProgressType.Ring
          this.status1 = ProgressStatus.PROGRESSING
          this.type2 = ProgressType.ScaleRing
          this.status2 = ProgressStatus.LOADING
        })
      Button('Toggle Scan Effect 2')
        .borderRadius(8)
        .backgroundColor(0x317aff)
        .width(100)
        .margin(8)
        .id('ProgressBuilder0170_002')
        .onClick(() => {
          this.type1 = ProgressType.Capsule
          this.status1 = ProgressStatus.LOADING
          this.type2 = ProgressType.Ring
          this.status2 = ProgressStatus.PROGRESSING
          this.enable = false
        })
    }.width('100%').padding({ top: 5 })
  }
}







