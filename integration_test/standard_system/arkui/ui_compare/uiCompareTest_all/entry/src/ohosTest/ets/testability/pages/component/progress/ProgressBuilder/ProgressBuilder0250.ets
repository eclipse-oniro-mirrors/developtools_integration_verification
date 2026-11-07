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



class MyProgressModifier20 implements ContentModifier<ProgressConfiguration> {
  public value: number = 30;
  public tot: number = 80

  constructor(value: number,tot:number) {
    this.value = value;
    this.tot = tot
  }

  applyContent(): WrappedBuilder<[ProgressConfiguration]> {
    return wrapBuilder(myProg20);
  }
}

@Builder
function myProg20(config: ProgressConfiguration) {
  // 在 Builder 内部使用 contentModifier 提供的 value，覆盖 ProgressOptions 中的 null
  Progress({
    value: (config.contentModifier as MyProgressModifier20).value,   // 30
    total: (config.contentModifier as MyProgressModifier20).tot,
    type: ProgressType.Capsule
  })
    .style({
      borderWidth: 5,
      font: { size: 13, style: FontStyle.Normal },
      enableScanEffect: false,
      showDefaultPercentage: true
    })
    .privacySensitive(true)
    .width('100%')
    .height(10)
    .color(Color.Pink);
}

@Entry
@Component
struct ProgressBuilder0250 {
  modifier = new MyProgressModifier20(30,80);
  @State myModifier: (MyProgressModifier20 | undefined) = this.modifier;

  build() {
    Column() {
      // 1) ProgressOptions.value 置为 undefined（异常值）
      // 2) 通过 contentModifier 传入有效 value: 30
      Progress({
        value: undefined,
        total: 150,
        type: ProgressType.Linear })
        .contentModifier(this.modifier)
        .value(undefined)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center);
  }
}




