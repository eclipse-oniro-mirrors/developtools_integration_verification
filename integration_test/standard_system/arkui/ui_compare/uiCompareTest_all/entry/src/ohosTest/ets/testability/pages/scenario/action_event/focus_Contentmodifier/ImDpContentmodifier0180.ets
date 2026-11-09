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

@Builder
function buildDataPanel0180(config: DataPanelConfiguration) {
  Column() {
    // 设置一个尺寸大于外层DataPanel的Column
    Column() {
      ForEach([1, 2, 3, 4, 5], (index: number) => {
        Text(`这是第 ${index} 行内容`)
          .fontSize(14)
          .margin({ top: 10 })
      })
    }
    .width('120%')  // 宽度超出父容器20%
    .height('120%') // 高度超出父容器20%
    .backgroundColor('#F0F8FF')
    .borderRadius(10)
    .shadow({ radius: 5, color: '#888888' })
  }
  .width('100%')
  .height('100%')
  .backgroundColor('#FFFFFF')
  .justifyContent(FlexAlign.Center)
}

class DataPanelBuilder0180 implements ContentModifier<DataPanelConfiguration> {
  constructor() {
  }
  applyContent(): WrappedBuilder<[DataPanelConfiguration]> {
    return wrapBuilder(buildDataPanel0180)
  }
}

@Entry
@Component
struct ContentModifier0180 {
  public color1: string = '#65ff00dd'
  public colorArray: string[] = [this.color1]

  build() {
    Column() {
      Text('Data panel - 超出部分测试')
        .margin({ top: 12 })
        .fontSize(20)

      Row() {
        DataPanel({ values: [12], max: 140, type: DataPanelType.Circle })
          .size({ width: 300, height: 300 })  // 设置固定尺寸以便观察
          .constraintSize({ maxWidth: '100%' })
          .padding({ top: 10 })
          .contentModifier(new DataPanelBuilder0180())
          .valueColors(this.colorArray)
      }
      .margin(15)
      .backgroundColor('#fff5f5f5')
      .width('100%')
      .height('28.69%')
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}