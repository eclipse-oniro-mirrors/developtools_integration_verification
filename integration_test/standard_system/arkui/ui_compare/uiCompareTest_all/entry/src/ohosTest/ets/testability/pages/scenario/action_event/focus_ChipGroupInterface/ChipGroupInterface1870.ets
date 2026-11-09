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

import { ChipGroup, IconGroupSuffix } from '@kit.ArkUI'

@Entry
@Preview
@Component
struct ChipGroupInterface1870 {
  @State selected_index1: number[] = []
  @State selected_index2: number[] = []
  @State selected_index3: number[] = []
  @State selected_index4: number[] = []

  @Builder
  suffixBuilder() {
    Image($r('app.media.icon'))
      .width(16)
      .height(16)
  }

  build() {
    Column() {
      Text('ChipGroup组件，suffix设置超多chip').fontSize(16).fontWeight(FontWeight.Bold).margin(20)
      
      Text('第一组ChipGroup - 正常数量').fontSize(14).margin({ top: 10, bottom: 5 })
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
        suffix: this.suffixBuilder,
        onChange: (activatedChipsIndex:number[]) => {
          this.selected_index1 = activatedChipsIndex
        }
      }).margin(20)
      
      Text('第二组ChipGroup - 较多chip').fontSize(14).margin({ top: 10, bottom: 5 })
      ChipGroup({
        items: [
          { label: { text: '项目1' }, allowClose: false },
          { label: { text: '项目2' }, allowClose: false },
          { label: { text: '项目3' }, allowClose: false },
          { label: { text: '项目4' }, allowClose: false },
          { label: { text: '项目5' }, allowClose: false },
          { label: { text: '项目6' }, allowClose: false }
        ],
        selectedIndexes: this.selected_index2,
        multiple: true,
        chipGroupSpace: { itemSpace: 8, endSpace: 0 },
        chipGroupPadding: { top: 10, bottom: 10 },
        suffix: this.suffixBuilder,
        onChange: (activatedChipsIndex:number[]) => {
          this.selected_index2 = activatedChipsIndex
        }
      }).margin(20)
      
      Text('第三组ChipGroup - 更多chip').fontSize(14).margin({ top: 10, bottom: 5 })
      ChipGroup({
        items: [
          { label: { text: '测试01' }, allowClose: false },
          { label: { text: '测试02' }, allowClose: false },
          { label: { text: '测试03' }, allowClose: false },
          { label: { text: '测试04' }, allowClose: false },
          { label: { text: '测试05' }, allowClose: false },
          { label: { text: '测试06' }, allowClose: false },
          { label: { text: '测试07' }, allowClose: false },
          { label: { text: '测试08' }, allowClose: false },
          { label: { text: '测试09' }, allowClose: false },
          { label: { text: '测试10' }, allowClose: false }
        ],
        selectedIndexes: this.selected_index3,
        multiple: true,
        chipGroupSpace: { itemSpace: 8, endSpace: 0 },
        chipGroupPadding: { top: 10, bottom: 10 },
        suffix: this.suffixBuilder,
        onChange: (activatedChipsIndex:number[]) => {
          this.selected_index3 = activatedChipsIndex
        }
      }).margin(20)
      
      Text('第四组ChipGroup - 超多chip').fontSize(14).margin({ top: 10, bottom: 5 })
      ChipGroup({
        items: [
          { label: { text: '超长选项名称001' }, allowClose: false },
          { label: { text: '超长选项名称002' }, allowClose: false },
          { label: { text: '超长选项名称003' }, allowClose: false },
          { label: { text: '超长选项名称004' }, allowClose: false },
          { label: { text: '超长选项名称005' }, allowClose: false },
          { label: { text: '超长选项名称006' }, allowClose: false },
          { label: { text: '超长选项名称007' }, allowClose: false },
          { label: { text: '超长选项名称008' }, allowClose: false },
          { label: { text: '超长选项名称009' }, allowClose: false },
          { label: { text: '超长选项名称010' }, allowClose: false },
          { label: { text: '超长选项名称011' }, allowClose: false },
          { label: { text: '超长选项名称012' }, allowClose: false },
          { label: { text: '超长选项名称013' }, allowClose: false },
          { label: { text: '超长选项名称014' }, allowClose: false },
          { label: { text: '超长选项名称015' }, allowClose: false },
          { label: { text: '超长选项名称016' }, allowClose: false },
          { label: { text: '超长选项名称017' }, allowClose: false },
          { label: { text: '超长选项名称018' }, allowClose: false },
          { label: { text: '超长选项名称019' }, allowClose: false },
          { label: { text: '超长选项名称020' }, allowClose: false }
        ],
        selectedIndexes: this.selected_index4,
        multiple: true,
        chipGroupSpace: { itemSpace: 8, endSpace: 0 },
        chipGroupPadding: { top: 10, bottom: 10 },
        suffix: this.suffixBuilder,
        onChange: (activatedChipsIndex:number[]) => {
          this.selected_index4 = activatedChipsIndex
        }
      }).margin(20)
    }
  }
}




