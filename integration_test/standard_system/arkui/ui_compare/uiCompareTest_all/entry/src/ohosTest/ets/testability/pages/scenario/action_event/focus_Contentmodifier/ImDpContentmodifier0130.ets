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
function buildDataPanel0130(config: DataPanelConfiguration) {
  Column() {
    // 新增Column布局，设置背景色以便观察
    Column() {
      // 添加一些文本内容
      Text('数据面板内容')
        .fontSize(18)
        .fontWeight(500)
        .margin({ top: 20 })

      // 添加一个简单的进度条
      Row() {
        Rect()
          .height(20)
          .width(120)
          .backgroundColor('#4080FF')
          .borderRadius(10)

        Text('60%')
          .fontSize(14)
          .margin({ left: 10 })
      }
      .width('80%')
      .margin({ top: 20 })
    }
    .width('90%')
    .height('80%')
    .backgroundColor('#F0F8FF')
    .borderRadius(10)
    .shadow({ radius: 2, color: '#888888' })
    .justifyContent(FlexAlign.Center)
  }
  .width('100%')
  .height('100%')
  .backgroundColor('#FFFFFF')
  .justifyContent(FlexAlign.Center)
}

class DataPanelBuilder0130 implements ContentModifier<DataPanelConfiguration> {
  constructor() {
  }
  applyContent(): WrappedBuilder<[DataPanelConfiguration]> {
    return wrapBuilder(buildDataPanel0130)
  }
}

@Entry
@Component
struct ContentModifier0130 {
  public color1: string = '#65ff00dd'
  public colorArray: string[] = [this.color1]

  build() {
    Column() {
      Text('Data panel')
        .margin({ top: 12 })
        .fontSize(20)

      Row() {
        // 设置size({ width: '30%', height: 400})
        DataPanel({ values: [12.3], max: 140, type: DataPanelType.Circle })
          .size({ width: '30%', height: 400 })  // 新增size设置
          .constraintSize({ maxWidth: '100%' })
          .padding({ top: 10 })
          .contentModifier(new DataPanelBuilder0130())
          .valueColors(this.colorArray)
      }
      .margin(15)
      .backgroundColor('#fff5f5f5')
      .width('100%')
      .height('36.89%')  // 调整Row高度以容纳DataPanel
    }
    .width('100%')
    .height('100%')
  }
}