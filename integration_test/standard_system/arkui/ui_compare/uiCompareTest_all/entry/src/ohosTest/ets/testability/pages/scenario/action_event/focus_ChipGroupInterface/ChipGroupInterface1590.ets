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
struct ChipGroupInterface1590 {
  @State selected_index1: number[] = []

  build() {
    Column() {
      Text('ChipGroup组件，items参数').fontSize(16).margin({ top: 20, bottom: 10 })
      
      // 第一组ChipGroup - 包含多个chip，超出屏幕宽度
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
          {
            label: { text: '选项4' },
            allowClose: false
          },
          {
            label: { text: '选项5' },
            allowClose: false
          },
          {
            label: { text: '选项6' },
            allowClose: false
          },
          {
            label: { text: '选项7' },
            allowClose: false
          },
          {
            label: { text: '选项8' },
            allowClose: false
          },
          {
            label: { text: '选项9' },
            allowClose: false
          },
          {
            label: { text: '选项10' },
            allowClose: false
          },
          {
            label: { text: '选项11' },
            allowClose: false
          },
          {
            label: { text: '选项12' },
            allowClose: false
          },
          {
            label: { text: '选项13' },
            allowClose: false
          },
          {
            label: { text: '选项14' },
            allowClose: false
          },
          {
            label: { text: '选项15' },
            allowClose: false
          },
          {
            label: { text: '选项16' },
            allowClose: false
          },
          {
            label: { text: '选项17' },
            allowClose: false
          },
          {
            label: { text: '选项18' },
            allowClose: false
          },
          {
            label: { text: '选项19' },
            allowClose: false
          },
          {
            label: { text: '选项20' },
            allowClose: false
          }
        ],
        selectedIndexes: this.selected_index1,
        multiple: true,
        chipGroupSpace: { itemSpace: 8, endSpace: 0 },
        chipGroupPadding: { top: 10, bottom: 10 },
        onChange: (activatedChipsIndex:number[]) => {
          this.selected_index1 = activatedChipsIndex
        }
      }).margin(20)

    }
  }
}
