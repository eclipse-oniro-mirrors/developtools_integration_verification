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
struct ChipGroupInterface1550 {
  @State selected_index1: number[] = []
  @State heightButtonText: string = 'height 30%'
  @State currentHeight: string = '30%'

  @Builder
  suffixBuilder() {
    Image($r('app.media.icon'))
      .width(16)
      .height(this.currentHeight)
  }

  build() {
    Column() {
      Button(this.heightButtonText).onClick(() => {
        switch (this.heightButtonText) {
          case 'height 30%':
            this.heightButtonText = 'height 100px'
            this.currentHeight = '100px'
            break
          case 'height 100px':
            this.heightButtonText = 'height 100vp'
            this.currentHeight = '100vp'
            break
          case 'height 100vp':
            this.heightButtonText = 'height 100fp'
            this.currentHeight = '100fp'
            break
          case 'height 100fp':
            this.heightButtonText = 'height 100lpx'
            this.currentHeight = '100lpx'
            break
          case 'height 100lpx':
            this.heightButtonText = 'height 30%'
            this.currentHeight = '30%'
            break
        }
      }).margin(20)

      // ChipGroup - suffix使用动态height值
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
        suffix: this.suffixBuilder
      }).margin(20)

    }
  }
}
