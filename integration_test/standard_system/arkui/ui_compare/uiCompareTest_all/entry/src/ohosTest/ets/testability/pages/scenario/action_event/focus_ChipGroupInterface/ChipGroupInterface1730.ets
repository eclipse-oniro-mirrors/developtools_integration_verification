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
struct ChipGroupInterface1730 {
  build() {
    Column() {
      Text('ChipGroup组件，selectedIndexes不传').fontSize(16).fontWeight(FontWeight.Bold).margin(20)
      
      Text('第一组ChipGroup - selectedIndexes不传').fontSize(14).margin({ top: 10, bottom: 5 })
      ChipGroup({
        items: [
          { label: { text: '选项1' }, allowClose: false },
          { label: { text: '选项2' }, allowClose: false },
          { label: { text: '选项3' }, allowClose: false }
        ],
        // selectedIndexes 参数不传
        multiple: true,
        chipGroupSpace: { itemSpace: 8, endSpace: 0 },
        chipGroupPadding: { top: 10, bottom: 10 },
        onChange: (activatedChipsIndex:number[]) => {
          console.log('chips on clicked, activated index ' + activatedChipsIndex)
        }
      }).margin(20)
      
      Text('第二组ChipGroup - selectedIndexes不传（单选模式）').fontSize(14).margin({ top: 10, bottom: 5 })
      ChipGroup({
        items: [
          { label: { text: '项目A' }, allowClose: false },
          { label: { text: '项目B' }, allowClose: false },
          { label: { text: '项目C' }, allowClose: false }
        ],
        // selectedIndexes 参数不传
        multiple: false,
        chipGroupSpace: { itemSpace: 8, endSpace: 0 },
        chipGroupPadding: { top: 10, bottom: 10 },
        onChange: (activatedChipsIndex:number[]) => {
          console.log('chips on clicked, activated index ' + activatedChipsIndex)
        }
      }).margin(20)
      
      Text('第三组ChipGroup - selectedIndexes不传（更多选项）').fontSize(14).margin({ top: 10, bottom: 5 })
      ChipGroup({
        items: [
          { label: { text: '测试1' }, allowClose: false },
          { label: { text: '测试2' }, allowClose: false },
          { label: { text: '测试3' }, allowClose: false },
          { label: { text: '测试4' }, allowClose: false },
          { label: { text: '测试5' }, allowClose: false }
        ],
        // selectedIndexes 参数不传
        multiple: true,
        chipGroupSpace: { itemSpace: 8, endSpace: 0 },
        chipGroupPadding: { top: 10, bottom: 10 },
        onChange: (activatedChipsIndex:number[]) => {
          console.log('chips on clicked, activated index ' + activatedChipsIndex)
        }
      }).margin(20)
    }
  }
}




