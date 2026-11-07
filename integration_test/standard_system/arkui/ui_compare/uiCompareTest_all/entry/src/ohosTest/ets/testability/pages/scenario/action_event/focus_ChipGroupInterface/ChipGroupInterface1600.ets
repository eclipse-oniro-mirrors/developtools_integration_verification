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
struct ChipGroupInterface1600 {
  @State selected_index1: number[] = []
  @State selected_index2: number[] = []
  @State hasUndefinedButtonText: string = '有undefined'

  build() {
    Column() {
      Text('ChipGroup组件，items2参数').fontSize(16).margin({ top: 20, bottom: 10 })
      
      Button(this.hasUndefinedButtonText).onClick(() => {
        this.hasUndefinedButtonText = this.hasUndefinedButtonText === '有undefined' ? 'reset' : '有undefined'
      }).margin(20)
      
      Text('空items数组测试').fontSize(14).margin({ top: 10, bottom: 5 })
      // ChipGroup - 测试空items数组
      ChipGroup({
        items: this.hasUndefinedButtonText === '有undefined' ? [] : [
          {
            label: { text: '选项1' },
            allowClose: false
          },
          {
            label: { text: '选项2' },
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

      Text('无效label内容测试').fontSize(14).margin({ top: 10, bottom: 5 })
      // ChipGroup - 测试无效的label内容
      ChipGroup({
        items: this.hasUndefinedButtonText === '有undefined' ? [
          {
            label: { text: '' }, // 空字符串
            allowClose: false
          },
          {
            label: { text: '   ' }, // 空白字符
            allowClose: false
          },
          {
            label: { text: '正常选项' },
            allowClose: false
          }
        ] : [
          {
            label: { text: '选项A' },
            allowClose: false
          },
          {
            label: { text: '选项B' },
            allowClose: false
          },
          {
            label: { text: '选项C' },
            allowClose: false
          }
        ],
        selectedIndexes: this.selected_index2,
        multiple: true,
        chipGroupSpace: { itemSpace: 8, endSpace: 0 },
        chipGroupPadding: { top: 10, bottom: 10 },
        onChange: (activatedChipsIndex:number[]) => {
          this.selected_index2 = activatedChipsIndex
        }
      }).margin(20)

    }
  }
}
