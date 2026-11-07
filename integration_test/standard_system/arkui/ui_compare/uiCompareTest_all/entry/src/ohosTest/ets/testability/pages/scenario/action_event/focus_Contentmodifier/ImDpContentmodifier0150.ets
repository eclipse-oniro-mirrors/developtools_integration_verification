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
function buildDataPanel0150(config: DataPanelConfiguration) {
  Column() {
    // 数据项列表
    Column() {
      ForEach(config.values, (item: number, index: number) => {
        ChildItem0150({ item: item, index: index, max: config.maxValue })
      }, (item: string) => item)
    }.margin(10).width('27.78%')

    // 分隔线
    Column() {
      Line().width('100%').backgroundColor('#ff373737').margin({ bottom: 5 })
    }.padding({ left: 20, right: 20 }).width('27.78%')

    // 数据统计信息
    Row() {
      Text('Length=' + config.values.length + '    ').margin({ left: 10 }).align(Alignment.Start)
      Text('Max=' + config.maxValue).margin({ left: 10 }).align(Alignment.Start)
    }
  }
}

class DataPanelBuilder0150 implements ContentModifier<DataPanelConfiguration> {
  applyContent(): WrappedBuilder<[DataPanelConfiguration]> {
    return wrapBuilder(buildDataPanel0150)
  }
}

@Entry
@Component
struct DataPanelIndex0150 {
  @State max1:number = 14
  build() {
    Column() {
      Text('Data panel').margin({ top: 12 });
      Row() {
        DataPanel({
          values: [12.3, 21.1, 13.4, 35.2, 26.0, 32.0],
          max: this.max1*10,
          type: DataPanelType.Circle
        })
          .width(400)
          .height(300) // 增加高度以显示按钮
          .constraintSize({ maxWidth: '100%' })
          .padding(10)
          .contentModifier(new DataPanelBuilder0150())
      }.margin(15).backgroundColor('#fff5f5f5')
    }
  }
}

@Component
struct ChildItem0150 {
  @Prop item: number;
  @Prop index: number;
  @Prop max: number;
  @Prop max3: number;
  // 简化颜色数组定义
  private colorArray: string[] = [
    '#65ff00dd', '#6500ff99', '#65ffe600',
    '#6595ff00', '#65000dff', '#650099ff'
  ];

  build() {
    RelativeContainer() {
      Row() {
        Rect()
          .height(25)
          .width(this.item * 600 / this.max)
          .backgroundColor(this.colorArray[this.index % this.colorArray.length])
          .radius(5)
          .align(Alignment.Start)
        Text(' ' + this.item)
          .fontSize(17)
      }
    }.height('2.3%')
  }
}