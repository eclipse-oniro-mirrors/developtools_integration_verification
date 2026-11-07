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
struct ChipGroupInterface1480 {
  @State selected_index1: number[] = []
  @State selected_index2: number[] = []
  @State selected_index3: number[] = []
  @State selected_index4: number[] = []
  @State selected_index5: number[] = []
  @State selected_index6: number[] = []

  @Builder
  suffixBuilderPng() {
    Image($r('app.media.icon'))
      .width(16)
      .height(16)
  }

  @Builder
  suffixBuilderSvg() {
    Image($r('app.media.icon'))
      .width(16)
      .height(16)
  }

  @Builder
  suffixBuilderJpg() {
    Image($r('app.media.icon'))
      .width(16)
      .height(16)
  }

  @Builder
  suffixBuilderGif() {
    Image($r('app.media.icon'))
      .width(16)
      .height(16)
  }

  @Builder
  suffixBuilderBmp() {
    Image($r('app.media.icon'))
      .width(16)
      .height(16)
  }

  @Builder
  suffixBuilderMp4() {
    Image($r('app.media.icon'))
      .width(16)
      .height(16)
  }

  build() {
    Column() {
      Text('ChipGroup组件，suffix参数的src参数设置为resource类型').fontSize(16).margin({ top: 20, bottom: 10 })

      Text('apppng').fontSize(14).margin({ top: 10, bottom: 5 })
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
        suffix: this.suffixBuilderPng,
        onChange: (activatedChipsIndex:number[]) => {
          this.selected_index1 = activatedChipsIndex
        },
      }).margin(20)

      Text('appsvg').fontSize(14).margin({ top: 10, bottom: 5 })
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
        suffix: this.suffixBuilderSvg,
        onChange: (activatedChipsIndex:number[]) => {
          this.selected_index2 = activatedChipsIndex
        },
      }).margin(20)

      Text('appjpg').fontSize(14).margin({ top: 10, bottom: 5 })
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
        suffix: this.suffixBuilderJpg,
        onChange: (activatedChipsIndex:number[]) => {
          this.selected_index3 = activatedChipsIndex
        },
      }).margin(20)

      Text('appgif').fontSize(14).margin({ top: 10, bottom: 5 })
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
        suffix: this.suffixBuilderGif,
        onChange: (activatedChipsIndex:number[]) => {
          this.selected_index4 = activatedChipsIndex
        },
      }).margin(20)

      Text('appbmp').fontSize(14).margin({ top: 10, bottom: 5 })
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
        suffix: this.suffixBuilderBmp,
        onChange: (activatedChipsIndex:number[]) => {
          this.selected_index5 = activatedChipsIndex
        },
      }).margin(20)

      Text('appmp4').fontSize(14).margin({ top: 10, bottom: 5 })
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
        selectedIndexes: this.selected_index6,
        multiple: true,
        chipGroupSpace: { itemSpace: 5, endSpace: 0 },
        chipGroupPadding: { top: 10, bottom: 10 },
        suffix: this.suffixBuilderMp4,
        onChange: (activatedChipsIndex:number[]) => {
          this.selected_index6 = activatedChipsIndex
        },
      }).margin(20)

    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}


