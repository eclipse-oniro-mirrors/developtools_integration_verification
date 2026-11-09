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

import { ChipGroup } from '@kit.ArkUI'

@Entry
@Preview
@Component
struct ChipGroupInterface1770 {
  @State selected_index1: number[] = []
  @State selected_index2: number[] = []
  @State selected_index3: number[] = []
  @State selected_index4: number[] = []
  @State groupButtonText: string = '1组'
  @State multipleButtonText: string = 'undefined'
  @State allSelectedButtonText: string = '全'
  @State multipleValue: boolean | undefined = true

  build() {
    Column() {
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

      // multiple 控制按钮
      Row() {
        Text('multiple:').fontSize(14).margin({ right: 10 })
        Button(this.multipleButtonText).onClick(() => {
          if (this.multipleButtonText === 'undefined') {
            this.multipleValue = undefined
          } else {
            this.multipleValue = true
          }
        }).margin({ left: 10 }).width(80).height(40)
      }.margin({ bottom: 10 })

      // selectedIndexes 控制按钮
      Row() {
        Text('selectedIndexes:').fontSize(14).margin({ right: 10 })
        Button(this.allSelectedButtonText).onClick(() => {
          if (this.allSelectedButtonText === '全') {
            // 设置所有索引为选中状态
            this.selected_index3 = [0, 1, 2]
          } else {
            this.selected_index3 = []
          }
        }).margin({ left: 10 }).width(50).height(40)
      }.margin({ bottom: 10 })

      if (this.groupButtonText === '1组' || this.groupButtonText === '2组' || this.groupButtonText === '3组' || this.groupButtonText === '4组') {
        Text('第一组ChipGroup').fontSize(14).margin({ top: 10, bottom: 5 })
        ChipGroup({
          items: [
            { label: { text: '选项1' }, allowClose: false },
            { label: { text: '选项2' }, allowClose: false },
            { label: { text: '选项3' }, allowClose: false }
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

      if (this.groupButtonText === '2组' || this.groupButtonText === '3组' || this.groupButtonText === '4组') {
        Text('第二组ChipGroup').fontSize(14).margin({ top: 10, bottom: 5 })
        ChipGroup({
          items: [
            { label: { text: '选项A' }, allowClose: false },
            { label: { text: '选项B' }, allowClose: false },
            { label: { text: '选项C' }, allowClose: false }
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

      if (this.groupButtonText === '3组' || this.groupButtonText === '4组') {
        Text('第三组ChipGroup').fontSize(14).margin({ top: 10, bottom: 5 })
        ChipGroup({
          items: [
            { label: { text: '项目1' }, allowClose: false },
            { label: { text: '项目2' }, allowClose: false },
            { label: { text: '项目3' }, allowClose: false }
          ],
          selectedIndexes: this.selected_index3,
          multiple: true,
          chipGroupSpace: { itemSpace: 8, endSpace: 0 },
          chipGroupPadding: { top: 10, bottom: 10 },
          onChange: (activatedChipsIndex:number[]) => {
            this.selected_index3 = activatedChipsIndex
          }
        }).margin(20)
      }

      if (this.groupButtonText === '4组') {
        Text('第四组ChipGroup - multiple测试').fontSize(14).margin({ top: 10, bottom: 5 })
        ChipGroup({
          items: [
            { label: { text: '测试1' }, allowClose: false },
            { label: { text: '测试2' }, allowClose: false },
            { label: { text: '测试3' }, allowClose: false }
          ],
          selectedIndexes: this.selected_index4,
          multiple: this.multipleValue,
          chipGroupSpace: { itemSpace: 8, endSpace: 0 },
          chipGroupPadding: { top: 10, bottom: 10 },
          onChange: (activatedChipsIndex:number[]) => {
            this.selected_index4 = activatedChipsIndex
          }
        }).margin(20)
      }
    }
  }
}




