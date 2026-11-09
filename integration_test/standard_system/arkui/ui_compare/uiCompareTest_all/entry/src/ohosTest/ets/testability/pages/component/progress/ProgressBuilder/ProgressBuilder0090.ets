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



class MyProgressModifier27 implements ContentModifier<ProgressConfiguration> {
  color: Color = Color.White;

  constructor(color: Color) {
    this.color = color;
  }

  applyContent(): WrappedBuilder<[ProgressConfiguration]> {
    return wrapBuilder(myProg27);
  }
}

@Builder
function myProg27(config: ProgressConfiguration) {
  Column({ space: 30 }) {
    Text('当前进度：' + config.value + '/' + config.total).fontSize(20)
    Row() {
      Flex({ justifyContent: FlexAlign.SpaceBetween }) {
        Path()
          .width('30%')
          .height('30%')
          .commands('M108 0 L141 70 L218 78.3 L162 131 L175 205 L108 170 L41.2 205 L55 131 L1 78 L75 68 L108 0 Z')
          .fill(config.enabled && config.value >= 1 ? (config.contentModifier as MyProgressModifier27).color :
          Color.White)
          .stroke(Color.Black)
          .strokeWidth(3)
        Path()
          .width('30%')
          .height('30%')
          .commands('M108 0 L141 70 L218 78.3 L162 131 L175 205 L108 170 L41.2 205 L55 131 L1 78 L75 68 L108 0 Z')
          .fill(config.enabled && config.value >= 2 ? (config.contentModifier as MyProgressModifier27).color :
          Color.White)
          .stroke(Color.Black)
          .strokeWidth(3)
        Path()
          .width('30%')
          .height('30%')
          .commands('M108 0 L141 70 L218 78.3 L162 131 L175 205 L108 170 L41.2 205 L55 131 L1 78 L75 68 L108 0 Z')
          .fill(config.enabled && config.value >= 3 ? (config.contentModifier as MyProgressModifier27).color :
          Color.White)
          .stroke(Color.Black)
          .strokeWidth(3)
      }.width('100%')
    }
  }.margin({ bottom: 100 })
  Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
    Column() {
      Text('Radio1')
      Radio({ value: 'Radio1', group: 'radioGroup' }).checked(true)
        .radioStyle({
          checkedBackgroundColor: Color.Pink
        })
        .height(50)
        .width(50)
        .onChange((isChecked: boolean) => {
          console.info('Radio1 status is ' + isChecked);
        })
    }
    Column() {
      Text('Radio2')
      Radio({ value: 'Radio2', group: 'radioGroup' }).checked(false)
        .radioStyle({
          checkedBackgroundColor: Color.Pink
        })
        .height(50)
        .width(50)
        .onChange((isChecked: boolean) => {
          console.info('Radio2 status is ' + isChecked);
        })
    }
    Column() {
      Text('Radio3')
      Radio({ value: 'Radio3', group: 'radioGroup' }).checked(false)
        .radioStyle({
          checkedBackgroundColor: Color.Pink
        })
        .height(50)
        .width(50)
        .onChange((isChecked: boolean) => {
          console.info('Radio3 status is ' + isChecked);
        })
    }
  }.padding({ top: 30 })
}

@Entry
@Component
struct ProgressBuilder0090 {
  @State currentValue: number = 0;
  modifier = new MyProgressModifier27(Color.Red);
  @State myModifier: (MyProgressModifier27 | undefined) = this.modifier;

  build() {
    Column() {
      Progress({ value: this.currentValue, total: 3, type: ProgressType.Ring }).contentModifier(this.modifier)
      Button('Progress++')
        .borderRadius(8)
        .backgroundColor(0x317aff)
        .width(100)
        .margin(8)
        .id('ProgressBuilder0090_001')
        .onClick(() => {
        if (this.currentValue < 3) {
          this.currentValue += 1;
        }
      })
      Button('Progress--')
        .borderRadius(8)
        .backgroundColor(0x317aff)
        .width(100)
        .margin(8)
        .id('ProgressBuilder0090_002')
        .onClick(() => {
        if (this.currentValue > 0) {
          this.currentValue -= 1;
        }
      })
    }.width('100%').height('100%')
  }
}




