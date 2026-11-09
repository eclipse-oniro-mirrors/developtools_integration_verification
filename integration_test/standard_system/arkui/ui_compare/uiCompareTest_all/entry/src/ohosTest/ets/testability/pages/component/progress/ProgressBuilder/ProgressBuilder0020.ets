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



class MyProgressModifier23 implements ContentModifier<ProgressConfiguration> {
  value: number|null|undefined = 30;
  tot: number|null|undefined = 80

  constructor(value: number|null|undefined,tot:number|null|undefined) {
    this.value = value;
    this.tot = tot
  }

  applyContent(): WrappedBuilder<[ProgressConfiguration]> {
    return wrapBuilder(myProg23);
  }
}

@Builder
function myProg23(config: ProgressConfiguration) {
  Image($r('app.media.icon'))
    .width(200)
    .height(200)
    .border({width:2,color:Color.Pink})
}

@Entry
@Component
struct ProgressBuilder0020 {
  @State condition1 : undefined|null|number = 30
  @State condition2 : undefined|null|number = 80
  modifier = new MyProgressModifier23(this.condition1,this.condition2);
  @State myModifier: (MyProgressModifier23 | undefined) = this.modifier;

  build() {
    Column() {
      // 1) ProgressOptions.value 置为 -10
      // 2) 通过 contentModifier 传入有效 value: 30
      Progress({
        value: 2,
        total: 80,
        type: ProgressType.Linear })
        .contentModifier(this.modifier)
        .color(Color.Pink)
        .backgroundColor(Color.Orange)
        .style({strokeWidth:30,strokeRadius:15})
        .width(500)
        .height(50)
      Button('change1')
        .borderRadius(8)
        .backgroundColor(0x317aff)
        .width(100)
        .margin({
          top:200,
          left:0,
          right:0,
          bottom:10
        })
        .id('ProgressBuilder0020_001')
        .onClick(() => {
          this.condition1 = undefined
          this.condition2 = undefined
        })
      Button('chang2')
        .borderRadius(8)
        .backgroundColor(0x317aff)
        .width(100)
        .margin({
          top:10,
          left:0,
          right:0,
          bottom:0
        })
        .id('ProgressBuilder0020_002')
        .onClick(() => {
          this.condition1 = null
          this.condition2 = null
        })
    }
    .width('100%')
    .height('100%')
  }
}




