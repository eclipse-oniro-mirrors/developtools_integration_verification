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
struct ChipGroupInterface1780 {
  @State selected_index1: number[] = []
  @State selected_index2: number[] = []
  @State selected_index3: number[] = []

  build() {
    Column() {
      Text('ChipGroup组件，multiple不设置').fontSize(16).fontWeight(FontWeight.Bold).margin(20)
      
      Text('第一组ChipGroup - multiple不设置').fontSize(14).margin({ top: 10, bottom: 5 })
      ChipGroup({
        items: [
          { label: { text: '选项1' }, allowClose: false },
          { label: { text: '选项2' }, allowClose: false },
          { label: { text: '选项3' }, allowClose: false }
        ],
        selectedIndexes: this.selected_index1,
        // multiple 参数不设置
        chipGroupSpace: { itemSpace: 8, endSpace: 0 },
        chipGroupPadding: { top: 10, bottom: 10 },
        onChange: (activatedChipsIndex:number[]) => {
          this.selected_index1 = activatedChipsIndex
          console.log('第一组chips on clicked, activated index ' + activatedChipsIndex)
        }
      }).margin(20)
      
      Text('第二组ChipGroup - multiple不设置（更多选项）').fontSize(14).margin({ top: 10, bottom: 5 })
      ChipGroup({
        items: [
          { label: { text: '项目A' }, allowClose: false },
          { label: { text: '项目B' }, allowClose: false },
          { label: { text: '项目C' }, allowClose: false },
          { label: { text: '项目D' }, allowClose: false },
          { label: { text: '项目E' }, allowClose: false }
        ],
        selectedIndexes: this.selected_index2,
        // multiple 参数不设置
        chipGroupSpace: { itemSpace: 8, endSpace: 0 },
        chipGroupPadding: { top: 10, bottom: 10 },
        onChange: (activatedChipsIndex:number[]) => {
          this.selected_index2 = activatedChipsIndex
          console.log('第二组chips on clicked, activated index ' + activatedChipsIndex)
        }
      }).margin(20)
      
      Text('第三组ChipGroup - multiple不设置（测试交互）').fontSize(14).margin({ top: 10, bottom: 5 })
      ChipGroup({
        items: [
          { label: { text: '测试1' }, allowClose: false },
          { label: { text: '测试2' }, allowClose: false },
          { label: { text: '测试3' }, allowClose: false },
          { label: { text: '测试4' }, allowClose: false }
        ],
        selectedIndexes: this.selected_index3,
        // multiple 参数不设置
        chipGroupSpace: { itemSpace: 8, endSpace: 0 },
        chipGroupPadding: { top: 10, bottom: 10 },
        onChange: (activatedChipsIndex:number[]) => {
          this.selected_index3 = activatedChipsIndex
          console.log('第三组chips on clicked, activated index ' + activatedChipsIndex)
        }
      }).margin(20)
      
      Text('说明：测试multiple参数不设置时的默认选择行为').fontSize(12).fontColor(Color.Gray).margin(20)
    }
  }
}




