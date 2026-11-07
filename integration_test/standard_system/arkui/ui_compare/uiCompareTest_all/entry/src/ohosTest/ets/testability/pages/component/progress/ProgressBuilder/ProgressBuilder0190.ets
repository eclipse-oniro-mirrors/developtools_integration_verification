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



class MyProgressModifier13 implements ContentModifier<ProgressConfiguration> {
  public value: number = 80;
  public tot: number = 30

  constructor(value: number,tot:number) {
    this.value = value;
    this.tot = tot
  }

  applyContent(): WrappedBuilder<[ProgressConfiguration]> {
    return wrapBuilder(myProg13);
  }
}

@Builder
function myProg13(config: ProgressConfiguration) {
  // 在 Builder 内部使用 contentModifier 提供的 value，覆盖 ProgressOptions 中的 null
  Progress({
    value: (config.contentModifier as MyProgressModifier13).value,   // 30
    total: (config.contentModifier as MyProgressModifier13).tot,
    type: ProgressType.Linear
  })
    .width(300)
    .height(20)
}

@Entry
@Component
struct ProgressBuilder0190 {
  modifier = new MyProgressModifier13(80,30);
  @State myModifier: (MyProgressModifier13 | undefined) = this.modifier;
  @State color:ResourceColor = Color.Gray

  build() {
    Column() {
      // 1) ProgressOptions.value 置为 -10
      // 2) 通过 contentModifier 传入有效 value: 30
      Progress({
        value: 80,
        total: 50.3,
        type: ProgressType.Linear })
        .contentModifier(this.modifier)
        .color(this.color)
        .backgroundColor(Color.Orange)
        .style({strokeWidth:30,strokeRadius:15})
        .width(500)
        .height(50)
      Button('change')
        .borderRadius(8)
        .backgroundColor(0x317aff)
        .width(100)
        .margin(8)
        .id('ProgressBuilder0190_001')
        .onClick(() => {
          this.color = Color.Red
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center);
  }
}




