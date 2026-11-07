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
struct SimpleDataPanel0440 {
  @State brValue: number = 5;
  build() {
    Column() {
      Button('点击测试')
        .id('DpBR0440')
        .onClick(()=>{ this.brValue = -25 })
        .padding(20)
      Stack() {
        // 单段环形数据面板
        DataPanel({ values: [30], max: 100, type: DataPanelType.Circle })
          .width(168)
          .height(168)
          .borderRadius(this.brValue)

        Column() {
          Text('30').fontSize(35).fontColor('#182431')
          Text('1.0.0').fontSize(9.33).lineHeight(12.83).fontWeight(500).opacity(0.6)
        }
      }
      .width('100%')
      .height('100%')
      .backgroundColor('#F5F5F5');
    }
  }

}


