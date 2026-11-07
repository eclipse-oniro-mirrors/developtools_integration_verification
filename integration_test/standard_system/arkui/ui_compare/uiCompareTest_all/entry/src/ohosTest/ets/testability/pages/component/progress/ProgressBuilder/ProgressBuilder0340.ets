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



class MyProgressModifier31 implements ContentModifier<ProgressConfiguration> {
  public value: number = 30;
  public tot: number = 80

  constructor(value: number,tot:number) {
    this.value = value;
    this.tot = tot
  }

  applyContent(): WrappedBuilder<[ProgressConfiguration]> {
    return wrapBuilder(myProg31);
  }
}

@Builder
function myProg31(config: ProgressConfiguration) {
  // 在 Builder 内部使用 contentModifier 提供的 value，覆盖 ProgressOptions 中的 null
  Progress({
    value: (config.contentModifier as MyProgressModifier31).value,   // 30
    total: (config.contentModifier as MyProgressModifier31).tot,
    type: ProgressType.Ring
  })
}

@Entry
@Component
struct ProgressBuilder0340 {
  modifier = new MyProgressModifier31(30,80);
  @State myModifier: (MyProgressModifier31 | undefined) = this.modifier;

  build() {
    Column() {
      // 1) ProgressOptions.value 置为 -10
      // 2) 通过 contentModifier 传入有效 value: 30
      Progress({
        value: 80,
        total: 50.3,
        type: ProgressType.Ring })
        .contentModifier(this.modifier)
        .color(Color.Pink)
        .backgroundColor(Color.Orange)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center);
  }
}




