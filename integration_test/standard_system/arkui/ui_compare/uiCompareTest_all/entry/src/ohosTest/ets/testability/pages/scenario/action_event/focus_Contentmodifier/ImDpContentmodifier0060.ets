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
function buildDataPanel0060(config: DataPanelConfiguration) {
  Column() {
    Column() {
      ForEach(config.values, (item: number, index: number) => {
        ChildItem0060({ item: item, index: index, max: config.maxValue })
      }, (item: string) => item)
    }.padding(10)

    Column() {
      Line().width('100%').backgroundColor('#ff373737').margin({ bottom: 5 })
    }.padding({ left: 20, right: 20 })

    Row() {
      Text('Length=' + config.values.length + '    ').margin({ left: 10 }).align(Alignment.Start)
      Text('Max=' + config.maxValue).margin({ left: 10 }).align(Alignment.Start)
    }
  }
}

class DataPanelBuilder0060 implements ContentModifier<DataPanelConfiguration> {
  constructor() {
  }
  applyContent(): WrappedBuilder<[DataPanelConfiguration]> {
    return wrapBuilder(buildDataPanel0060)
  }
}

@Entry
@Component
struct ImdpCM0060 {
  @State value1:number= 12.3;
  @State value2:number= 21.1;
  @State value3:number= 13.4;
  @State value4:number= 35.2;
  @State value5:number= 26.0;
  @State value6:number= 32.0;
  build() {
    Column() {
      Text('Data panel').margin({ top: 12 });
      Row() {
        DataPanel({ values: [this.value1, this.value2, this.value3, this.value4, this.value5, this.value6], max: 140, type: DataPanelType.Circle })
          .width(400)
          .height(260)
          .constraintSize({ maxWidth: '100%' })
          .padding({ top: 10 })
          .contentModifier(new DataPanelBuilder0060())
      }.margin(15).backgroundColor('#fff5f5f5')
      Button('动态变化按钮')
        .id('dataPanel0060')
        .onClick(()=>{
          this.value1 += 5;
          this.value2 += 5;
          this.value3 += 5;
          this.value4 += 5;
          this.value5 += 5;
          this.value6 += 5;
        })
    }
  }
}

@Component
struct ChildItem0060 {
  @Prop item: number;
  @Prop index: number;
  @Prop max: number;
  public color1: string = '#65ff00dd'
  public color2: string = '#6500ff99'
  public color3: string = '#65ffe600'
  public color4: string = '#6595ff00'
  public color5: string = '#65000dff'
  public color6: string = '#650099ff'
  public colorArray: string[] = [this.color1, this.color2, this.color3, this.color4, this.color5, this.color6]

  build() {
    RelativeContainer() {
      Row() {
        Rect()
          .height(25)
          .width(this.item * 600 / this.max)
          .foregroundColor(this.colorArray[this.index])
          .radius(5)
          .align(Alignment.Start)
        Text(' ' + this.item)
          .fontSize(17)
      }
    }.height('2.3%')
  }
}
