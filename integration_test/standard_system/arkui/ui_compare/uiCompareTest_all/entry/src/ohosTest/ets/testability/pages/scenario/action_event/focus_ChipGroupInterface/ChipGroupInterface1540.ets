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
struct ChipGroupInterface1540 {
  @State selected_index1: number[] = []
  @State selected_index2: number[] = []
  @State selected_index3: number[] = []
  @State selected_index4: number[] = []
  @State selected_index5: number[] = []

  @Builder
  suffixBuilderPercent() {
    Image($r('app.media.icon'))
      .width('20%')
      .height(16)
  }

  @Builder
  suffixBuilderPx() {
    Image($r('app.media.icon'))
      .width('10px')
      .height(16)
  }

  @Builder
  suffixBuilderVp() {
    Image($r('app.media.icon'))
      .width('5vp')
      .height(16)
  }

  @Builder
  suffixBuilderFp() {
    Image($r('app.media.icon'))
      .width('20fp')
      .height(16)
  }

  @Builder
  suffixBuilderLpx() {
    Image($r('app.media.icon'))
      .width('10lpx')
      .height(16)
  }

  build() {
    Column() {
      // 第一组ChipGroup - suffix使用width为20%
      Text('width为20%').fontSize(16).margin({ top: 20, bottom: 10 })
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
        suffix: this.suffixBuilderPercent
      }).margin(20)

      // 第二组ChipGroup - suffix使用width为10px
      Text('width为10px').fontSize(16).margin({ top: 20, bottom: 10 })
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
        suffix: this.suffixBuilderPx
      }).margin(20)

      // 第三组ChipGroup - suffix使用width为5vp
      Text('width为5vp').fontSize(16).margin({ top: 20, bottom: 10 })
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
        selectedIndexes: this.selected_index3,
        multiple: true,
        chipGroupSpace: { itemSpace: 5, endSpace: 0 },
        chipGroupPadding: { top: 10, bottom: 10 },
        onChange: (activatedChipsIndex:number[]) => {
          this.selected_index3 = activatedChipsIndex
        },
        suffix: this.suffixBuilderVp
      }).margin(20)

      // 第四组ChipGroup - suffix使用width为20fp
      Text('width为20fp').fontSize(16).margin({ top: 20, bottom: 10 })
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
        selectedIndexes: this.selected_index4,
        multiple: true,
        chipGroupSpace: { itemSpace: 5, endSpace: 0 },
        chipGroupPadding: { top: 10, bottom: 10 },
        onChange: (activatedChipsIndex:number[]) => {
          this.selected_index4 = activatedChipsIndex
        },
        suffix: this.suffixBuilderFp
      }).margin(20)

      // 第五组ChipGroup - suffix使用width为10lpx
      Text('width为10lpx').fontSize(16).margin({ top: 20, bottom: 10 })
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
        selectedIndexes: this.selected_index5,
        multiple: true,
        chipGroupSpace: { itemSpace: 5, endSpace: 0 },
        chipGroupPadding: { top: 10, bottom: 10 },
        onChange: (activatedChipsIndex:number[]) => {
          this.selected_index5 = activatedChipsIndex
        },
        suffix: this.suffixBuilderLpx
      }).margin(20)

    }
  }
}




