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
struct ProgressBuilder0060 {
  @State color: ResourceColor | LinearGradient = Color.Pink;
  @State backcolor: ResourceColor = Color.Blue;
  @State scanEffects: boolean[] = [false, true]; // 自定义布尔数组参数
  @State wid:Length = 20
  @State rad:PX | VP | LPX | Resource = 5
  @State style: ProgressStyleOptions | CapsuleStyleOptions | RingStyleOptions | LinearStyleOptions | ScaleRingStyleOptions | EclipseStyleOptions = { strokeWidth: this.wid, strokeRadius:this.rad };



  build() {
    Column({ space: 15 }) {
      Text('Loading Effect').fontSize(9).fontColor(0xCCCCCC).width('90%')
      Progress({ value: 50, total: 50, type: ProgressType.Linear })
        .width(100)
        .color(this.color)
        .style(this.style)
        .backgroundColor(this.backcolor)
      Text('Scan Effect').fontSize(9).fontColor(0xCCCCCC).width('90%')
      Progress({ value: 50, total: 50, type: ProgressType.Linear })
        .width(100)
        .color(this.color)
        .style(this.style)
        .backgroundColor(this.backcolor)
      Button('Toggle Scan Effect 1')
        .borderRadius(8)
        .backgroundColor(0x317aff)
        .width(100)
        .margin(8)
        .id('ProgressBuilder0060_001')
        .onClick(() => {
          this.wid = 30
          this.rad = 10
          this.style = { strokeWidth: this.wid, strokeRadius:this.rad };
        })
      Button('Toggle Scan Effect 2')
        .borderRadius(8)
        .backgroundColor(0x317aff)
        .width(100)
        .margin(8)
        .id('ProgressBuilder0060_002')
        .onClick(() => {
          this.wid = 10
          this.rad = 2
          this.style = { strokeWidth: this.wid, strokeRadius:this.rad };
        })
    }.width('100%').padding({ top: 5 })
  }
}





