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

@Entry
@Component
struct DataPanelWatches0019 {
  build() {
    Column() {
      DataPanel({
        values: [5,4,6,4,8,9,7,10,10],
        max: 100,
        type: DataPanelType.Circle,
      }).valueColors([
        '#00FF00',                // 绿色（纯色）
        '#0000FF',                // 蓝色（纯色）
        '#FFFF00',                // 黄色（纯色）
        new LinearGradient([{ color: '#65EEC9A3', offset: 0 }, { color: '#65EF629F', offset: 1 }]),
        '#F0FFFF',
        new LinearGradient([{ color: '#6572B513', offset: 0 }, { color: '#6508efa6', offset: 1 }]),
        '#00FFFF',
        '#055555',
        new LinearGradient([{ color: '#65e26709', offset: 0 }, { color: '#65efbd08', offset: 1 }])
      ])
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5');
  }
}