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

import { ChipSize, ChipGroup, ChipGroupItemOptions } from '@kit.ArkUI'

@Entry
@Preview
@Component
struct ChipGroupInterface1660 {
  @State selected_index1: number[] = []
  @State selected_index2: number[] = []
  @State selected_index3: number[] = []
  @State selected_index4: number[] = []
  @State groupButtonText: string = '1组'
  @State chipItems: ChipGroupItemOptions[] = [
    { label: { text: '项目1' }, allowClose: true },
    { label: { text: '项目2' }, allowClose: true },
    { label: { text: '项目3' }, allowClose: true },
    { label: { text: '项目4' }, allowClose: true }
  ]

  build() {
    Column() {
      Text('ChipGroup组件，selectedIndexes参数').fontSize(16).margin({ top: 20, bottom: 10 })
      
      Button(this.groupButtonText).onClick(() => {
        switch (this.groupButtonText) {
          case '1组':
            this.groupButtonText = '2组'
            break
          case '2组':
            this.groupButtonText = '3组'
            break
          case '3组':
            this.groupButtonText = '4组'
            break
          case '4组':
            this.groupButtonText = '1组'
            break
        }
      }).margin(20)
      
      Text('第一组ChipGroup').fontSize(14).margin({ top: 10, bottom: 5 })
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

      Text('第二组ChipGroup').fontSize(14).margin({ top: 10, bottom: 5 })
      ChipGroup({
        items: [
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

      Text('第三组ChipGroup').fontSize(14).margin({ top: 10, bottom: 5 })
      ChipGroup({
        items: [
          {
            label: { text: '测试1' },
            allowClose: false
          },
          {
            label: { text: '测试2' },
            allowClose: false
          },
          {
            label: { text: '测试3' },
            allowClose: false
          }
        ],
        selectedIndexes: this.selected_index3,
        multiple: true,
        chipGroupSpace: { itemSpace: 8, endSpace: 0 },
        chipGroupPadding: { top: 10, bottom: 10 },
        onChange: (activatedChipsIndex:number[]) => {
          this.selected_index3 = activatedChipsIndex
        }
      }).margin(20)

      Text('第四组ChipGroup').fontSize(14).margin({ top: 10, bottom: 5 })
      Row() {
        Text('selectedIndexes: [' + this.selected_index4.join(', ') + ']').fontSize(12)
        Button('13').onClick(() => {
          // 设置索引1和3为选中状态
          this.selected_index4 = [1, 3]
        }).margin({ left: 10 }).width(50).height(40)
        Button('02').onClick(() => {
          // 设置索引0和2为选中状态
          this.selected_index4 = [0, 2]
        }).margin({ left: 5 }).width(50).height(40)
        Button('删除1').onClick(() => {
          // 删除第一个chip，并调整selectedIndexes
          this.chipItems.splice(0, 1)
          // 调整selectedIndexes，移除索引0，并将其他索引减1
          this.selected_index4 = this.selected_index4
            .filter(selectedIndex => selectedIndex !== 0)
            .map(selectedIndex => selectedIndex > 0 ? selectedIndex - 1 : selectedIndex)
        }).margin({ left: 5 }).width(60).height(40)
        Button('重置').onClick(() => {
          // 重置chip列表
          this.chipItems = [
            { label: { text: '项目1' }, allowClose: true } as ChipGroupItemOptions,
            { label: { text: '项目2' }, allowClose: true } as ChipGroupItemOptions,
            { label: { text: '项目3' }, allowClose: true } as ChipGroupItemOptions,
            { label: { text: '项目4' }, allowClose: true } as ChipGroupItemOptions
          ]
          this.selected_index4 = []
        }).margin({ left: 5 }).width(50).height(40)
      }.margin({ bottom: 10 })
      
      ChipGroup({
        items: this.chipItems,
        selectedIndexes: this.selected_index4,
        multiple: true,
        chipGroupSpace: { itemSpace: 8, endSpace: 0 },
        chipGroupPadding: { top: 10, bottom: 10 },
        onChange: (activatedChipsIndex:number[]) => {
          this.selected_index4 = activatedChipsIndex
        }
      }).margin(20)

    }
  }
}
