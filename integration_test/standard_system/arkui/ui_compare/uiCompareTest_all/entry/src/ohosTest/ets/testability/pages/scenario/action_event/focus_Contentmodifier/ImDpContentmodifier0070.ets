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
function buildDataPanel0070(config: DataPanelConfiguration) {
  Column() {
    // 标题
    Text('基础统计')
      .fontSize(16)
      .fontWeight(500)
      .margin({ top: 10, bottom: 5 })
      .width('100%')
      .textAlign(TextAlign.Center)

    // 分隔线
    Line().width('90%').backgroundColor('#E5E5E5').margin({ bottom: 10 })

    // 数据统计信息
    Column() {
      Row() {
        Text('数据项数量:').fontSize(14).width(120)
        Text(`${config.values.length}`).fontSize(14)
      }
      .margin({ top: 5 })
      .width('100%')

      Row() {
        Text('最大值:').fontSize(14).width(120)
        Text(`${config.maxValue}`).fontSize(14)
      }
      .margin({ top: 5 })
      .width('100%')
    }
    .width('90%')
    .padding({ left: 15 })
  }
  .width('100%')
  .height('100%')
  .backgroundColor('#F9F9F9')
  .borderRadius(8)
  .padding(10)
}

// 第二个自定义Builder - 展示详细摘要
@Builder
function buildDataPanelSummary(config: DataPanelConfiguration) {
  Column() {
    // 标题栏
    Text('数据摘要')
      .fontSize(18)
      .fontWeight(500)
      .margin({ bottom: 10 })
      .width('100%')
      .textAlign(TextAlign.Center)
      .backgroundColor('#E6F4FF')
      .padding(8)
      .borderRadius(6)

    // 数据统计信息
    Column() {
      // 数据项数量
      Row() {
        Text('数据项数量:').fontSize(14).width(120)
        Text(`${config.values.length}`).fontSize(14)
      }
      .margin({ top: 5 })
      .width('100%')

      // 最大值
      Row() {
        Text('最大值:').fontSize(14).width(120)
        Text(`${config.maxValue}`).fontSize(14)
      }
      .margin({ top: 5 })
      .width('100%')

      // 数据列表
      if (config.values.length > 0) {
        Column() {
          Text('数据列表:').fontSize(14).margin({ top: 10, bottom: 5 })
          ForEach(config.values, (value: number, index: number) => {
            Text(`${index + 1}. ${value}`)
              .fontSize(14)
              .margin({ top: 3 })
          })
        }
        .width('100%')
        .padding({ left: 10 })
      }
    }
    .width('90%')
    .padding(10)
    .backgroundColor('#F5F7FA')
    .borderRadius(8)

    // 底部信息
    Text('© 2025 数据可视化面板')
      .fontSize(12)
      .fontColor('#888888')
      .margin({ top: 15 })
      .width('100%')
      .textAlign(TextAlign.Center)
  }
  .width('100%')
  .height('100%')
  .padding(15)
}

// 对应Builder的数据面板构建器类
class DataPanelBuilder0070 implements ContentModifier<DataPanelConfiguration> {
  applyContent(): WrappedBuilder<[DataPanelConfiguration]> {
    return wrapBuilder(buildDataPanel0070)
  }
}

class DataPanelSummaryBuilder implements ContentModifier<DataPanelConfiguration> {
  applyContent(): WrappedBuilder<[DataPanelConfiguration]> {
    return wrapBuilder(buildDataPanelSummary)
  }
}

// 入口组件 - 同时应用两个自定义Builder
@Entry
@Component
struct DataPanelIndex0070 {
  build() {
    Column() {
      Text('数据面板组合示例')
        .fontSize(20)
        .fontWeight(500)
        .margin({ top: 15, bottom: 20 })

      // 应用第一个Builder的DataPanel
      Row() {
        DataPanel({
          values: [10, 20, 30, 40, 50],
          max: 100,
          type: DataPanelType.Circle
        })
          .width(400)
          .height(180)
          .constraintSize({ maxWidth: '100%' })
          .padding(10)
          .contentModifier(new DataPanelBuilder0070())
      }
      .margin({ bottom: 20 })
      .width('100%')
      .justifyContent(FlexAlign.Center)

      // 应用第二个Builder的DataPanel
      Row() {
        DataPanel({
          values: [15, 25, 35, 45, 55, 65],
          max: 100,
          type: DataPanelType.Circle
        })
          .width(400)
          .height(260) // 增加高度以容纳数据列表
          .constraintSize({ maxWidth: '100%' })
          .padding(10)
          .contentModifier(new DataPanelSummaryBuilder())
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}