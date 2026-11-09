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

import { ChipSize, ChipGroup, IconGroupSuffix } from '@kit.ArkUI'

@Entry
@Preview
@Component
struct ChipGroupInterface1510 {
  @State selected_index1: number[] = []
  @State selected_index2: number[] = []

  @Builder
  suffixBuilderString() {
    Image('字')
      .width(16)
      .height(16)
  }

  @Builder
  suffixBuilderImageString() {
    Image('icon.png')
      .width(16)
      .height(16)
  }

  build() {
    Column() {
      // 第一组ChipGroup - suffix使用string异常值
      Text('字').fontSize(16).margin({ top: 20, bottom: 10 })
      ChipGroup({
        items: [
          {
            label: { text: '选项1' },
            allowClose: false
          },
          {
            label: { text: '选项2' },
            allowClose: false
          },
          {
            label: { text: '选项3' },
            allowClose: false
          },
        ],
        selectedIndexes: this.selected_index1,
        multiple: true,
        chipGroupSpace: { itemSpace: 5, endSpace: 0 },
        chipGroupPadding: { top: 10, bottom: 10 },
        onChange: (activatedChipsIndex:number[]) => {
          this.selected_index1 = activatedChipsIndex
        },
        suffix: this.suffixBuilderString
      }).margin(20)

      // 第二组ChipGroup - suffix使用图片字符串
      Text('图片字符串').fontSize(16).margin({ top: 20, bottom: 10 })
      ChipGroup({
        items: [
          {
            label: { text: '选项1' },
            allowClose: false
          },
          {
            label: { text: '选项2' },
            allowClose: false
          },
          {
            label: { text: '选项3' },
            allowClose: false
          },
        ],
        selectedIndexes: this.selected_index2,
        multiple: true,
        chipGroupSpace: { itemSpace: 5, endSpace: 0 },
        chipGroupPadding: { top: 10, bottom: 10 },
        onChange: (activatedChipsIndex:number[]) => {
          this.selected_index2 = activatedChipsIndex
        },
        suffix: this.suffixBuilderImageString
      }).margin(20)

    }
  }
}




