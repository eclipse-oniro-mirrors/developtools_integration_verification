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

import { ChipSize, ChipGroup } from '@kit.ArkUI'

@Entry
@Preview
@Component
struct ChipGroupInterface0750 {
  @State selected_index: number[] = [0, 1, 2, 3, 4, 5]
  build() {
    Column() {
      ChipGroup({
        items: [
          {
            prefixIcon: { src: $r('app.media.icon') },
            label: { text: '选项1' },
            suffixIcon: { src: $r('app.media.icon') },
            allowClose: false
          },
          {
            prefixIcon: { src: $r('app.media.icon') },
            label: { text: '选项2' },
            suffixIcon: { src: $r('app.media.icon')},
            allowClose: false
          },
          {
            prefixIcon: { src: $r('app.media.icon') },
            label: { text: '选项3' },
            suffixIcon: { src: $r('app.media.icon') },
            allowClose: false
          },
          {
            prefixIcon: { src: $r('app.media.icon') },
            label: { text: '选项4' },
            suffixIcon: { src: $r('app.media.icon') },
            allowClose: false
          },
        ],
        itemStyle: {
          size:{height:$r('app.integer.integer_100'),width:$r('app.integer.integer_100')},
          backgroundColor: Color.Gray,
          fontColor: Color.Black,
          selectedBackgroundColor: Color.Blue,
          selectedFontColor: Color.Black,
        },
        selectedIndexes: this.selected_index,
        multiple: false,
        chipGroupSpace: { itemSpace: 5, endSpace: 0 },
        chipGroupPadding: { top: 10, bottom: 10 },
        onChange: (activatedChipsIndex:number[]) => {
          console.log('chips on clicked, activated index ' + activatedChipsIndex)
        },
      })
    }
  }
}
