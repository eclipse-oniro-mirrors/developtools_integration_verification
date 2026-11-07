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
struct ChipGroupInterface1630 {
  @State selected_index1: number[] = []
  @State selected_index2: number[] = []
  @State selected_index3: number[] = []
  @State groupButtonText: string = '1组'
  @State selectedIndexValue: number = 0

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
      Row() {
        Button('selectedIndexes: ' + this.selectedIndexValue).fontSize(12)
        Button('0').onClick(() => {
          this.selectedIndexValue = 0
          this.selected_index3 = [this.selectedIndexValue]
        }).margin({ left: 10 }).width(40).height(40)
        Button('1').onClick(() => {
          this.selectedIndexValue = 1
          this.selected_index3 = [this.selectedIndexValue]
        }).margin({ left: 5 }).width(40).height(40)
        Button('2').onClick(() => {
          this.selectedIndexValue = 2
          this.selected_index3 = [this.selectedIndexValue]
        }).margin({ left: 5 }).width(40).height(40)
        Button('3').onClick(() => {
          this.selectedIndexValue = 3
          this.selected_index3 = [this.selectedIndexValue]
        }).margin({ left: 5 }).width(40).height(40)
      }.margin({ bottom: 10 })
      
      ChipGroup({
        items: [
          {
            label: { text: '项目1' },
            allowClose: false
          },
          {
            label: { text: '项目2' },
            allowClose: false
          },
          {
            label: { text: '项目3' },
            allowClose: false
          },
          {
            label: { text: '项目4' },
            allowClose: false
          }
        ],
        selectedIndexes: this.selected_index3,
        multiple: true,
        chipGroupSpace: { itemSpace: 8, endSpace: 0 },
        chipGroupPadding: { top: 10, bottom: 10 },
        onChange: (activatedChipsIndex:number[]) => {
          this.selected_index3 = activatedChipsIndex
          if (activatedChipsIndex.length > 0) {
            this.selectedIndexValue = activatedChipsIndex[0]
          } else {
            this.selectedIndexValue = -1
          }
        }
      }).margin(20)

    }
  }
}




