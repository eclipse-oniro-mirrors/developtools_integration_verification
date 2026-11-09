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



class MyProgressModifier15 implements ContentModifier<ProgressConfiguration> {
  public value: number = 80;
  public tot: number = 30

  constructor(value: number,tot:number) {
    this.value = value;
    this.tot = tot
  }

  applyContent(): WrappedBuilder<[ProgressConfiguration]> {
    return wrapBuilder(myProg15);
  }
}

@Builder
function myProg15(config: ProgressConfiguration) {
  // 在 Builder 内部使用 contentModifier 提供的 value，覆盖 ProgressOptions 中的 null
  Progress({
    value: (config.contentModifier as MyProgressModifier15).value,   // 30
    total: (config.contentModifier as MyProgressModifier15).tot,
    type: ProgressType.Linear
  })
    .width(500)
    .height(30)
}

@Entry
@Component
struct ProgressBuilder0080 {
  modifier = new MyProgressModifier15(80,30);
  @State myModifier: (MyProgressModifier15 | undefined) = this.modifier;
  @State col:ResourceColor = Color.White

  build() {
    Column() {
      // 1) ProgressOptions.value 置为 -10
      // 2) 通过 contentModifier 传入有效 value: 30
      Progress({
        value: 80,
        total: 50.3,
        type: ProgressType.Linear })
        .contentModifier(this.modifier)
        .color(this.col)
        .backgroundColor(Color.Orange)
        .style({strokeWidth:30,strokeRadius:15})
        .width(300)
        .height(20)
        .margin(50)
      Button('other')
        .id('ProgressBuilder0080_001')
        .fontSize(20)
        .backgroundColor(Color.Pink)
        .fontColor(Color.Red)
        .padding(5)
        .borderRadius(8)
        .onClick(()=>{
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center);
  }
}




