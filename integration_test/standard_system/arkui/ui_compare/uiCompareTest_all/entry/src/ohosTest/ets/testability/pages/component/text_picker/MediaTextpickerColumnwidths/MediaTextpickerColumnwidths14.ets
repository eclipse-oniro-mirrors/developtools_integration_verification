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
import { LengthMetrics } from '@kit.ArkUI';
@Entry
@Component
struct MediaTextpickerColumnwidths {
  // 1. 定义单列数据（string[]类型）
  private fruits: string[] = ['苹果', '香蕉', '橙子', '葡萄'];
  private singleColumnWidths: LengthMetrics[] = [
    LengthMetrics.percent(20)
  ];
  @State private selectedIndex: number = 0; // 默认选中第一项

  build() {
    Column() {
      // 2. 创建TextPicker组件
      TextPicker({ range: this.fruits, selected: this.selectedIndex, columnWidths:this.singleColumnWidths})
        .id('MediaTextpickerColumnwidths_01')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}