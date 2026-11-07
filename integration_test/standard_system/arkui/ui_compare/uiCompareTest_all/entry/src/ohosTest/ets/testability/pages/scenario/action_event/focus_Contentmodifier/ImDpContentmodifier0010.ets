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
function buildSimpleColumn0010(config: DataPanelConfiguration) {
  Column() {
    Text('简单Column示例')
      .fontSize(16)
      .margin({ top: 10 })
      .width('100%')
      .textAlign(TextAlign.Center)

    Line()
      .width('80%')
      .backgroundColor('#E5E5E5')
      .margin({ top: 5, bottom: 10 })

    Text(`数据长度: ${config.values.length}`)
      .fontSize(14)
      .margin({ left: 15 })
  }
  .width('100%')
  .height('100%')
  .backgroundColor('#F5F7FA')
  .borderRadius(8)
}

class SimpleColumnBuilder0010 implements ContentModifier<DataPanelConfiguration> {
  applyContent(): WrappedBuilder<[DataPanelConfiguration]> {
    return wrapBuilder(buildSimpleColumn0010)
  }
}

@Entry
@Component
struct SimpleColumnDemo0010 {
  build() {
    Column() {
      Text('自定义Builder演示')
        .fontSize(18)
        .margin({ top: 12, bottom: 15 })

      DataPanel({ values: [1, 2, 3], max: 100, type: DataPanelType.Circle })
        .width(300)
        .height(150)
        .contentModifier(new SimpleColumnBuilder0010())
    }
    .width('100%')
    .height('100%')
    .padding(15)
  }
}