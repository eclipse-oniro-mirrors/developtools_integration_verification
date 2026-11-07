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
struct ChipGroupInterface1120 {
  @State selected_index1: number[] = []
  @State selected_index2: number[] = []
  @State selected_index3: number[] = []
  @State selected_index4: number[] = []
  @State selected_index5: number[] = []
  @State colorButtonText: string = '#6'

  build() {
    Column() {
      Button(this.colorButtonText).onClick(() => {
        this.colorButtonText = this.colorButtonText === '#6' ? 'reset' : '#6'
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

      // 第二组ChipGroup - 设置backgroundColor为#088F9F
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
          backgroundColor: '#088F9F',
        },
        selectedIndexes: this.selected_index2,
        multiple: true,
        chipGroupSpace: { itemSpace: 5, endSpace: 0 },
        chipGroupPadding: { top: 10, bottom: 10 },
        onChange: (activatedChipsIndex:number[]) => {
          this.selected_index2 = activatedChipsIndex
        },
      }).margin(20)

      // 第三组ChipGroup - 设置selectedBackgroundColor为#088F9F
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
          selectedBackgroundColor: '#088F9F'
        },
        selectedIndexes: this.selected_index3,
        multiple: true,
        chipGroupSpace: { itemSpace: 5, endSpace: 0 },
        chipGroupPadding: { top: 10, bottom: 10 },
        onChange: (activatedChipsIndex:number[]) => {
          this.selected_index3 = activatedChipsIndex
        },
      }).margin(20)

      // 第四组ChipGroup - 设置fontColor为#088F9F
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
          fontColor: '#088F9F'
        },
        selectedIndexes: this.selected_index4,
        multiple: true,
        chipGroupSpace: { itemSpace: 5, endSpace: 0 },
        chipGroupPadding: { top: 10, bottom: 10 },
        onChange: (activatedChipsIndex:number[]) => {
          this.selected_index4 = activatedChipsIndex
        },
      }).margin(20)

      // 第五组ChipGroup - 设置selectedFontColor为#088F9F
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
          selectedFontColor: '#088F9F'
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



