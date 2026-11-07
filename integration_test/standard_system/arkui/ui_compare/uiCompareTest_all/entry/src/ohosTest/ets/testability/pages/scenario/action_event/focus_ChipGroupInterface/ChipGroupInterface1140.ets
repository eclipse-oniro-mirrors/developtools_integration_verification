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
struct ChipGroupInterface1140 {
  @State selected_index1: number[] = []
  @State selected_index2: number[] = []
  @State selected_index3: number[] = []
  @State selected_index4: number[] = []
  @State selected_index5: number[] = []
  @State colorButtonText: string = 'rgb'

  build() {
    Column() {
      Button(this.colorButtonText).onClick(() => {
        this.colorButtonText = this.colorButtonText === 'rgb' ? 'reset' : 'rgb'
      }).margin(20)

      // 第一组ChipGroup - 默认样式
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
      }).margin(20)

      // 第二组ChipGroup - 设置backgroundColor为rgb(128, 128, 0)
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
        itemStyle: {
          backgroundColor: 'rgb(128, 128, 0)',
        },
        selectedIndexes: this.selected_index2,
        multiple: true,
        chipGroupSpace: { itemSpace: 5, endSpace: 0 },
        chipGroupPadding: { top: 10, bottom: 10 },
        onChange: (activatedChipsIndex:number[]) => {
          this.selected_index2 = activatedChipsIndex
        },
      }).margin(20)

      // 第三组ChipGroup - 设置selectedBackgroundColor为rgb(128, 128, 0)
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
        itemStyle: {
          selectedBackgroundColor: 'rgb(128, 128, 0)'
        },
        selectedIndexes: this.selected_index3,
        multiple: true,
        chipGroupSpace: { itemSpace: 5, endSpace: 0 },
        chipGroupPadding: { top: 10, bottom: 10 },
        onChange: (activatedChipsIndex:number[]) => {
          this.selected_index3 = activatedChipsIndex
        },
      }).margin(20)

      // 第四组ChipGroup - 设置fontColor为rgb(128, 128, 0)
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
        itemStyle: {
          fontColor: 'rgb(128, 128, 0)'
        },
        selectedIndexes: this.selected_index4,
        multiple: true,
        chipGroupSpace: { itemSpace: 5, endSpace: 0 },
        chipGroupPadding: { top: 10, bottom: 10 },
        onChange: (activatedChipsIndex:number[]) => {
          this.selected_index4 = activatedChipsIndex
        },
      }).margin(20)

      // 第五组ChipGroup - 设置selectedFontColor为rgb(128, 128, 0)
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
        itemStyle: {
          selectedFontColor: 'rgb(128, 128, 0)'
        },
        selectedIndexes: this.selected_index5,
        multiple: true,
        chipGroupSpace: { itemSpace: 5, endSpace: 0 },
        chipGroupPadding: { top: 10, bottom: 10 },
        onChange: (activatedChipsIndex:number[]) => {
          this.selected_index5 = activatedChipsIndex
        },
      }).margin(20)

    }
  }
}



