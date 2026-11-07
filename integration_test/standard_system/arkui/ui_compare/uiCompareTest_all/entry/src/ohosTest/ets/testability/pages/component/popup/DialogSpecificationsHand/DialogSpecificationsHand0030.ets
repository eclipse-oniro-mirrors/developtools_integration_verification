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
struct DialogSpecificationsHand0030 {
  @State checkbox0: boolean = true  // 第一个复选框状态，用于$$双向绑定
  @State checkbox1: boolean = true  // 第二个复选框状态，用于$$双向绑定
  @State checkbox2: boolean = true  // 第三个复选框状态，用于$$双向绑定
  @State showDialog: boolean = false

  build() {
    Column({ space: 20 }) {
      // 步骤1：规格补充按钮
      Text('规格补充')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      // 步骤2：单个Checkbox - 使用$$双向绑定
      Text('步骤2：点击Checkbox(使用$$双向绑定)')
        .fontSize(14)
        .fontColor(Color.Blue)
        .margin({ bottom: 5 })

      Checkbox({ name: 'mainCheckbox' })
        .select($$this.checkbox0)  // $$双向绑定第一个复选框状态
        .selectedColor(Color.Blue)

      // 步骤3：select+$$文字和下面的复选框 - 体现$$双向绑定
      Text(`select+$$双向绑定: ${this.checkbox0}`)
        .id('select_all_text_0030')
        .fontSize(16)
        .fontColor(this.checkbox0 ? Color.Green : Color.Red)

      Text('Checkbox使用$$this.checkbox0双向绑定')
        .fontSize(12)
        .fontColor(Color.Gray)
        .margin({ bottom: 10 })

      // 显示所有复选框状态
      Column({ space: 10 }) {
        // 第一个复选框
        Row({ space: 10 }) {
          Checkbox({ name: 'checkbox0' })
            .id('checkbox_item_0_0030')
            .select($$this.checkbox0)  // $$双向绑定第一个复选框状态
            .selectedColor(Color.Blue)
          Text(`选项1 - select+$$: ${this.checkbox0}`)
            .fontSize(14)
        }
        .alignItems(VerticalAlign.Center)

        // 第二个复选框
        Row({ space: 10 }) {
          Checkbox({ name: 'checkbox1' })
            .id('checkbox_item_1_0030')
            .select($$this.checkbox1)  // $$双向绑定第二个复选框状态
            .selectedColor(Color.Blue)
          Text(`选项2 - select+$$: ${this.checkbox1}`)
            .fontSize(14)
        }
        .alignItems(VerticalAlign.Center)

        // 第三个复选框
        Row({ space: 10 }) {
          Checkbox({ name: 'checkbox2' })
            .id('checkbox_item_2_0030')
            .select($$this.checkbox2)  // $$双向绑定第三个复选框状态
            .selectedColor(Color.Blue)
          Text(`选项3 - select+$$: ${this.checkbox2}`)
            .fontSize(14)
        }
        .alignItems(VerticalAlign.Center)
      }

      // 步骤4：切换选中状态按钮
      Button('切换选中状态(验证$$双向绑定)')
        .id('DialogSpecificationsHand0030_001')
        .onClick(() => {
          // 切换全选/全不选状态，$$双向绑定会自动同步所有Checkbox的select
          const allSelected = this.checkbox0 && this.checkbox1 && this.checkbox2
          const newState = !allSelected
          this.checkbox0 = newState
          this.checkbox1 = newState
          this.checkbox2 = newState
        })
        .margin({ top: 10 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .justifyContent(FlexAlign.Start)
  }
}
