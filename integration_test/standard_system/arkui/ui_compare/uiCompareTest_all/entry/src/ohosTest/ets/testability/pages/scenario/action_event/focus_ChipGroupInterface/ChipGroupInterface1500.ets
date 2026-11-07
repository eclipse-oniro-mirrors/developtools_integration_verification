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
struct ChipGroupInterface1500 {
  @State selected_index1: number[] = []
  @State selected_index2: number[] = []
  @State selected_index3: number[] = []
  @State selected_index4: number[] = []
  @State selected_index5: number[] = []
  @State selected_index6: number[] = []

  @Builder
  suffixBuilderPng() {
    Image($rawfile('icon.png'))
      .width(16)
      .height(16)
  }

  @Builder
  suffixBuilderSvg() {
    Image($rawfile('icon.svg'))
      .width(16)
      .height(16)
  }

  @Builder
  suffixBuilderJpg() {
    Image($rawfile('icon.jpg'))
      .width(16)
      .height(16)
  }

  @Builder
  suffixBuilderGif() {
    Image($rawfile('icon.gif'))
      .width(16)
      .height(16)
  }

  @Builder
  suffixBuilderBmp() {
    Image($rawfile('icon.bmp'))
      .width(16)
      .height(16)
  }

  @Builder
  suffixBuilderMp4() {
    Image($rawfile('icon.mp4'))
      .width(16)
      .height(16)
  }

  build() {
    Column() {
      // 第一组ChipGroup - suffix使用$rawfile PNG资源
      Text('$rawfile png').fontSize(16).margin({ top: 20, bottom: 10 })
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
        suffix: this.suffixBuilderPng
      }).margin(20)

      // 第二组ChipGroup - suffix使用$rawfile SVG资源
      Text('$rawfile svg').fontSize(16).margin({ top: 20, bottom: 10 })
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
        suffix: this.suffixBuilderSvg
      }).margin(20)

      // 第三组ChipGroup - suffix使用$rawfile JPG资源
      Text('$rawfile jpg').fontSize(16).margin({ top: 20, bottom: 10 })
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
        suffix: this.suffixBuilderJpg
      }).margin(20)

      // 第四组ChipGroup - suffix使用$rawfile GIF资源
      Text('$rawfile gif').fontSize(16).margin({ top: 20, bottom: 10 })
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
        suffix: this.suffixBuilderGif
      }).margin(20)

      // 第五组ChipGroup - suffix使用$rawfile BMP资源
      Text('$rawfile bmp').fontSize(16).margin({ top: 20, bottom: 10 })
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
        suffix: this.suffixBuilderBmp
      }).margin(20)

      // 第六组ChipGroup - suffix使用$rawfile MP4资源
      Text('$rawfile mp4').fontSize(16).margin({ top: 20, bottom: 10 })
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
        onChange: (activatedChipsIndex:number[]) => {
          this.selected_index6 = activatedChipsIndex
        },
        suffix: this.suffixBuilderMp4
      }).margin(20)

    }
  }
}




