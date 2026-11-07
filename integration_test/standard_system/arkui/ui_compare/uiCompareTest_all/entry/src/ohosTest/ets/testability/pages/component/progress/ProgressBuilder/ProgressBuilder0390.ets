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



class MyProgressModifier42 implements ContentModifier<ProgressConfiguration> {
  public value: number = 30;

  constructor(value: number) {
    this.value = value;
  }

  applyContent(): WrappedBuilder<[ProgressConfiguration]> {
    return wrapBuilder(myProg42);
  }
}

@Builder
function myProg42(config: ProgressConfiguration) {
  // 在 Builder 内部使用 contentModifier 提供的 value，覆盖 ProgressOptions 中的 null
  Progress({
    value: (config.contentModifier as MyProgressModifier42).value,   // 30
    total: 100,
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
struct ProgressBuilder0390 {
  modifier = new MyProgressModifier42(30);
  @State myModifier: (MyProgressModifier42 | undefined) = this.modifier;

  build() {
    Column() {
      // 1) ProgressOptions.value 置为 null（异常值）
      // 2) 通过 contentModifier 传入有效 value: 30
      Progress({
        value: -10,
        total: 100,
        type: ProgressType.Linear })
        .contentModifier(this.modifier)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center);
  }
}




