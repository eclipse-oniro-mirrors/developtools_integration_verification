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
@ComponentV2
export struct Smartmultiwindow1940 {
  @Local testStatus: string = '待测试';
  @Local selectedDate: Date = new Date();

  build() {
    Column({ space: 15 }) {
      Text('SUB_ACE_UI_COMPONENT_POPUPBOX_SMARTMULTIWINDOW_1940')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)

      Text(`测试描述：直板机悬浮窗操作：DatePickerDialog组件，观察蒙层效果、组件布局和对齐状态`)
        .fontSize(13)
        .fontColor(Color.Gray)

      Divider()

      Text(`测试状态：${this.testStatus}`)
        .fontSize(14)
        .fontColor(Color.Blue)

      Button('调起DatePickerDialog')
        .id('dialogBtn')
        .onClick(() => {
          DatePickerDialog.show({
            start: new Date('2000-1-1'),
            end: new Date('2100-12-31'),
            selected: this.selectedDate,
            onDateAccept: (value: Date) => {
              this.selectedDate = value;
              this.testStatus = `已选择：${value.getFullYear()}-${value.getMonth() + 1}-${value.getDate()}`;
            },
            onCancel: () => {
              this.testStatus = '取消选择';
            }
          });
        })

      Divider()

      Text('测试步骤：')
        .fontSize(13)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text(`1. 编译hap并执行`)
        .fontSize(12)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Text(`2. 进行悬浮窗操作`)
        .fontSize(12)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Text(`3. 点击按钮调起对应的Dialog组件`)
        .fontSize(12)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Text(`4. 观察蒙层效果，组件布局和对齐状态`)
        .fontSize(12)
        .fontColor(Color.Gray)
        .alignSelf(ItemAlign.Start)

      Divider()

      Text('预期结果检查项：')
        .fontSize(13)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text(`✓ 子窗大小和主窗大小保持一致`)
        .fontSize(12)
        .fontColor(Color.Green)
        .alignSelf(ItemAlign.Start)

      Text(`✓ 蒙层覆盖整个子窗`)
        .fontSize(12)
        .fontColor(Color.Green)
        .alignSelf(ItemAlign.Start)

      Text(`✓ 组件布局和对齐完全基于子窗进行，根据窗口自适应比例缩放`)
        .fontSize(12)
        .fontColor(Color.Green)
        .alignSelf(ItemAlign.Start)

      Text(`✓ 使用默认规则避让安全区和键盘`)
        .fontSize(12)
        .fontColor(Color.Green)
        .alignSelf(ItemAlign.Start)

      Button('确认测试通过')
        .id('confirmBtn')
        .onClick(() => {
          this.testStatus = '✅ 测试通过';
        })
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(Color.White)
  }
}

