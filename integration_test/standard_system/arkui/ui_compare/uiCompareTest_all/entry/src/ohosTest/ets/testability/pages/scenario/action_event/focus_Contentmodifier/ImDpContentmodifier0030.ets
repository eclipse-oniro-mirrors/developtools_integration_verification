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
function buildDataPanel0030(config: DataPanelConfiguration) {
  Column() {
    // 添加Stack布局作为容器
    Stack() {
      // 背景矩形 - 作为Stack的底层
      Rect()
        .width('100%')
        .height('100%')
        .backgroundColor('#F0F8FF')
        .borderRadius(10)

      // 数据项列表 - 作为Stack的上层
      Column() {
        ForEach(config.values, (item: number, index: number) => {
          ChildItem0030({ item: item, index: index, max: config.maxValue })
        }, (item: string) => item)
      }
      .padding(10)
    }
    .width('100%')
    .height('100%')

    // 分隔线
    Column() {
      Line().width('100%').backgroundColor('#ff373737').margin({ bottom: 5 })
    }.padding({ left: 20, right: 20 })

    // 数据统计信息
    Row() {
      Text('Length=' + config.values.length + '    ').margin({ left: 10 }).align(Alignment.Start)
      Text('Max=' + config.maxValue).margin({ left: 10 }).align(Alignment.Start)
    }
  }
}

class DataPanelBuilder0030 implements ContentModifier<DataPanelConfiguration> {
  applyContent(): WrappedBuilder<[DataPanelConfiguration]> {
    return wrapBuilder(buildDataPanel0030)
  }
}

@Entry
@Component
struct ImdpCM0030 {
  @State value1: number = 12.3;
  @State value2: number = 21.1;
  @State value3: number = 13.4;
  @State value4: number = 35.2;
  @State value5: number = 26.0;
  @State value6: number = 32.0;

  build() {
    Column() {
      Text('Data panel with Stack')
        .fontSize(16)
        .fontWeight(500)
        .margin({ top: 12, bottom: 10 })

      Row() {
        DataPanel({
          values: [this.value1, this.value2, this.value3, this.value4, this.value5, this.value6],
          max: 140,
          type: DataPanelType.Circle
        })
          .width(400)
          .height(280) // 增加高度以适配Stack布局
          .constraintSize({ maxWidth: '100%' })
          .padding({ top: 10 })
          .contentModifier(new DataPanelBuilder0030())
      }
      .margin(15)
      .backgroundColor('#fff5f5f5')
    }
  }
}

@Component
struct ChildItem0030 {
  @Prop item: number;
  @Prop index: number;
  @Prop max: number;

  // 优化颜色数组定义（避免在构造函数中使用this）
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
    }
    .height('2.3%')
  }
}