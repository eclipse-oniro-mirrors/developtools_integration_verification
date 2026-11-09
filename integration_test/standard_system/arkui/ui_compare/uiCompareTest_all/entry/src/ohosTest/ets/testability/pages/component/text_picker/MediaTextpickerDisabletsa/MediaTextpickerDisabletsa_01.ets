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
struct MediaTextpickerDisabletsa01 {
  // 1. 定义单列数据（string[]类型）
  private fruits: string[] = ['苹果', '香蕉', '橙子', '葡萄'];
  @State private selectedIndex: number = 0; // 默认选中第一项

  build() {
    Column() {
      // 2. 创建TextPicker组件
      TextPicker({ range: this.fruits, selected: this.selectedIndex})
        .id('MediaTextpickerColumnwidths_01')
        .disableTextStyleAnimation(undefined)
        .defaultTextStyle({
          color: 999999, // 异常颜色值
          font: {
            size: -10,   // 异常字体大小（负数）
            weight: 1500 // 异常字重（超出100-900范围）
          },
          minFontSize: 18,  // 异常最小值
          maxFontSize: 28,  // 异常最大值（小于minFontSize）
          overflow: TextOverflow.Ellipsis  // 非法溢出模式
        })

    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}