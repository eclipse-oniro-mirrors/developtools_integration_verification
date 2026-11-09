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
function buildDataPanel0210(config: DataPanelConfiguration) {
  Column(){
    Rect()
      .height(25)
      .width(12.3 * 600 / 140)
      .radius(5)
      .align(Alignment.Start)
    Text(' ' + 12.3)
      .fontSize(17)
  }
  .width('100%').margin({ bottom: 5 }).height('100%')
}

class DataPanelBuilder0210 implements ContentModifier<DataPanelConfiguration> {
  constructor() {
  }
  applyContent(): WrappedBuilder<[DataPanelConfiguration]> {
    return wrapBuilder(buildDataPanel0210)
  }
}

@Entry
@Component
struct ContentModifier0210 {
  public color1: string = '#65ff00dd'
  public colorArray: string[] = [this.color1]
  build() {
    Column() {
      Text('Data panel').margin({ top: 12 });
      Row() {
        DataPanel({ values: [12.3], max: 140, type: DataPanelType.Circle })
          .width(400)
          .height(260)
          .constraintSize({ maxWidth: '100%' })
          .padding({ top: 10 })
          .contentModifier(new DataPanelBuilder0210())
          .trackBackgroundColor($r('app.color.Pink'))
      }.margin(15)
    }
  }
}
