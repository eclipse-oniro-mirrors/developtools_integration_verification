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




class MyProgressModifier35 implements ContentModifier<ProgressConfiguration> {
  public value: number = 30;

  constructor(value: number) {
    this.value = value;
  }

  applyContent(): WrappedBuilder<[ProgressConfiguration]> {
    return wrapBuilder(myProg35);
  }
}

class My1 implements ContentModifier<ProgressConfiguration> {
  public value: number = 30;

  constructor(value: number) {
    this.value = value;
  }

  applyContent(): WrappedBuilder<[ProgressConfiguration]> {
    return wrapBuilder(my1);
  }
}

class My2 implements ContentModifier<ProgressConfiguration> {
  public value: number = 30;
  public tot: number = 50

  constructor(value: number,tot:number) {
    this.value = value;
    this.tot = tot
  }

  applyContent(): WrappedBuilder<[ProgressConfiguration]> {
    return wrapBuilder(my2);
  }
}

@Builder
function myProg35(config: ProgressConfiguration) {
  // 在 Builder 内部使用 contentModifier 提供的 value，覆盖 ProgressOptions 中的 null
  Progress({
    value: 30,   // 30
    type: ProgressType.Linear
  })
    .width('100%')
    .height(10)
    .color(Color.Pink);
}

@Builder
function my1(config: ProgressConfiguration) {
  // 在 Builder 内部使用 contentModifier 提供的 value，覆盖 ProgressOptions 中的 null
  Progress({
    value: 50,   // 30
    type: ProgressType.Linear
  })
    .width('100%')
    .height(10)
    .color(Color.Pink);
}

@Builder
function my2(config: ProgressConfiguration) {
  // 在 Builder 内部使用 contentModifier 提供的 value，覆盖 ProgressOptions 中的 null
  Progress({
    value: (config.contentModifier as My2).value,   // 30
    total: (config.contentModifier as My2).tot,
    type: ProgressType.Linear
  })
    .width('100%')
    .height(10)
    .color(Color.Pink);
}

@Entry
@Component
struct ProgressBuilder0610 {
  modifier1 = new MyProgressModifier35(30);
  modifier2 = new My1(50);
  modifier3 = new My2(50,80);
  @State myModifier1: (MyProgressModifier35 | undefined) = this.modifier1;
  @State myModifier2: (My1 | undefined) = this.modifier2;
  @State myModifier3: (My2 | undefined) = this.modifier3;

  build() {
    Column() {
      // 1) ProgressOptions.value 置为 null（异常值）
      // 2) 通过 contentModifier 传入有效 value: 30
      Progress({
        value: 0,
        total: 50.3,
        type: ProgressType.Linear })
        .contentModifier(this.modifier1)
        .contentModifier(this.modifier2)
        .contentModifier(this.modifier3)
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center);
  }
}



