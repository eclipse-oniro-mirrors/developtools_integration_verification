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

@Entry
@Component
struct DialogSpecificationsHand0020 {
  @State checkboxGroupSelectAll: boolean = true  // 初始化为true，显示全选状态
  @State checkboxItems: boolean[] = [true, true, true]  // 初始化为全选状态

  build() {
    Column({ space: 20 }) {
      Text('规格补充')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      // CheckboxGroup - 使用$$双向绑定
      CheckboxGroup({ group: 'checkboxGroup' })
        .id('DialogSpecificationsHand0020_002')
        .selectedColor(Color.Blue)
        .selectAll($$this.checkboxGroupSelectAll)  // $$双向绑定全选状态

      // selectAll+$$文字和下面的复选框 - 体现$$双向绑定
      Text(`selectAll+$$双向绑定: ${this.checkboxGroupSelectAll}`)
        .id('select_all_text_0020')
        .fontSize(16)
        .fontColor(this.checkboxGroupSelectAll ? Color.Green : Color.Red)
      
      Text('CheckboxGroup使用$$this.checkboxGroupSelectAll双向绑定')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ bottom: 10 })

      Column({ space: 10 }) {
        ForEach([0, 1, 2], (index: number) => {
          Row({ space: 10 }) {
            Checkbox({ name: 'checkbox' + index, group: 'checkboxGroup' })
              .id(`checkbox_item_${index}_0020`)
              .select(this.checkboxItems[index])
              .onChange((value: boolean) => {
                this.checkboxItems[index] = value
                // 检查是否所有复选框都被选中，通过$$双向绑定自动同步CheckboxGroup
                const allSelected = this.checkboxItems.every(item => item)
                const noneSelected = this.checkboxItems.every(item => !item)
 
                if (allSelected) {
                  this.checkboxGroupSelectAll = true  // $$双向绑定会自动同步到CheckboxGroup
                } else if (noneSelected) {
                  this.checkboxGroupSelectAll = false  // $$双向绑定会自动同步到CheckboxGroup
                }
              })
            Text(`选项 ${index + 1}`)
              .fontSize(14)
          }
          .alignItems(VerticalAlign.Center)
        })
      }

      // 切换选中状态按钮 - 验证$$双向绑定
      Button('切换选中状态(验证$$双向绑定)')
        .id('DialogSpecificationsHand0020_001')
        .onClick(() => {
          // 切换全选/全不选状态，$$双向绑定会自动同步CheckboxGroup的selectAll
          this.checkboxGroupSelectAll = !this.checkboxGroupSelectAll
          this.checkboxItems = this.checkboxItems.map(() => this.checkboxGroupSelectAll)
        })
        .margin({ top: 20 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.Start)
  }
}
